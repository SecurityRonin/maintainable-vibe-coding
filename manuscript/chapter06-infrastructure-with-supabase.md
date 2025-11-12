# Chapter 6: Phase 2 - Infrastructure with Supabase

Your v0 designs tell you what UI you need. Now build the backend that serves it.

In this chapter, you'll learn how Supabase eliminates backend coding.

## What is Supabase?

Supabase is Backend-as-a-Service. Think "Firebase but with PostgreSQL."

**What Supabase provides:**
- PostgreSQL database (full SQL)
- Authentication (email, OAuth, magic links)
- Row Level Security (automatic authorization)
- Auto-generated REST API from your schema
- Real-time subscriptions (optional)
- File storage

**What you don't build:**
- API routes
- Authentication logic
- Authorization middleware
- Database connection pooling
- Rate limiting
- Email sending

All handled automatically.

## Traditional Backend vs Supabase

**Traditional custom backend:**
- Design schema (1 day)
- Build auth system (2-3 days)
- Create API routes (2-3 days per model)
- Implement authorization (1-2 days)
- Write tests (2-3 days)
- Set up deployment (1 day)

**Total:** 2-3 weeks minimum

**Supabase backend:**
- Design schema (1 hour)
- Run SQL to create tables (5 minutes)
- Enable authentication (5 minutes, already works)
- Add Row Level Security policies (30 minutes)

**Total:** 2 hours

**The difference:** Supabase eliminates 90% of backend work.

## Database Schema Design

v0 designs reveal what data you need.

**v0 shows:** Article cards with title, description, image, URL, status, tags, rating, notes.

**Database needs:**
```sql
articles (
  id,           -- unique identifier
  user_id,      -- who owns this
  url,          -- the saved URL
  title,        -- article title
  description,  -- article description
  image_url,    -- preview image
  status,       -- to_read, reading, archived
  rating,       -- 1-5 stars
  notes,        -- personal notes
  tags,         -- array of strings
  saved_at,     -- when saved
  read_at       -- when marked as read
)
```

**One table. That's it.** Start simple. Add tables only when actually needed (YAGNI).

## Row Level Security (RLS)

This is Supabase's superpower: automatic authorization.

**The problem:**
Every API route needs to check:
- Is user authenticated?
- Does user own this resource?

Miss it once = security vulnerability.

**The solution:**
RLS policies enforce authorization at database level. Impossible to bypass.

**Example policy:**
```sql
CREATE POLICY "Users can only see their own articles"
  ON articles FOR SELECT
  USING (auth.uid() = user_id);
```

**What this does:**
Database automatically adds `WHERE user_id = current_user_id` to every SELECT query.

User can't query other users' articles. Database blocks it automatically.

**ReadStack needs 4 policies:**

1. **View own articles:**
```sql
CREATE POLICY "Users can view own articles"
  ON articles FOR SELECT
  USING (auth.uid() = user_id);
```

2. **Create own articles:**
```sql
CREATE POLICY "Users can create own articles"
  ON articles FOR INSERT
  WITH CHECK (auth.uid() = user_id);
```

3. **Update own articles:**
```sql
CREATE POLICY "Users can update own articles"
  ON articles FOR UPDATE
  USING (auth.uid() = user_id);
```

4. **Delete own articles:**
```sql
CREATE POLICY "Users can delete own articles"
  ON articles FOR DELETE
  USING (auth.uid() = user_id);
```

**Result:** Entire authorization layer = 4 SQL policies. No API middleware. No bugs.

## Authentication Built-In

Supabase includes production-ready authentication.

**Email/password auth:**
- Signup with email confirmation
- Login with email/password
- Password reset flow
- Session management
- JWT tokens

**All working out of the box.** No code required.

**Security features (automatic):**
- Password hashing
- Rate limiting (prevents brute force)
- Email confirmation
- Session expiration
- JWT generation/validation

**You write:** ~30 lines calling Supabase SDK

**You don't write:** Authentication system (hundreds of lines)

## Using Supabase Client

Once schema is ready, using Supabase is simple:

```typescript
// lib/supabase/client.ts
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!

export const supabase = createClient(supabaseUrl, supabaseAnonKey)
```

**Create article:**
```typescript
const { data } = await supabase
  .from('articles')
  .insert({ url, title, description, user_id })
  .select()
  .single()
```

**Read articles:**
```typescript
const { data } = await supabase
  .from('articles')
  .select('*')
  .eq('status', 'to_read')
  .order('saved_at', { ascending: false })
```

**Update article:**
```typescript
await supabase
  .from('articles')
  .update({ status: 'reading' })
  .eq('id', articleId)
```

**Delete article:**
```typescript
await supabase
  .from('articles')
  .delete()
  .eq('id', articleId)
```

**No API routes.** Query database directly from components (RLS protects data).

## When to Use Supabase

**Use Supabase when:**
✅ Standard CRUD operations
✅ Multi-user data with isolation
✅ PostgreSQL fits your data model
✅ You want to ship fast

**Consider custom backend when:**
❌ Complex business logic
❌ Heavy data transformations
❌ Many external API integrations
❌ Must use non-PostgreSQL database

**Most apps:** Supabase works fine.

## Cost

**Free tier:**
- 500MB database
- 50,000 monthly active users
- Social OAuth providers

**For ReadStack:** Free tier is plenty. 500MB = ~100,000 articles.

**Pro tier:** $25/month for production apps (8GB database, backups, support)

## What You Learned

**Supabase eliminates backend coding**
Database schema → Automatic REST API

**Row Level Security = authorization**
4 SQL policies replace hundreds of lines of middleware

**Authentication included**
Email, OAuth, magic links work out of the box

**Start simple**
One table for ReadStack. Add more only when needed.

**For ReadStack:** One table, 4 RLS policies, automatic API. Backend in 20 minutes.

## Next Steps

Chapter 7 teaches how to connect GitHub for version control.

Version control from day one. Not "when the project is serious."
