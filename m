Return-Path: <linux-gpio+bounces-7437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B6C907A91
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 20:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9974284106
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 18:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC39614A4D4;
	Thu, 13 Jun 2024 18:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OP1tVlse"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD1712CD8F;
	Thu, 13 Jun 2024 18:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718301841; cv=none; b=SSovcDUUTO4UHVwIzert4VJJFEtUjQgqjBa6wU4fIGWrowIRZMR8B0T3ien+DLpld0lz32vbVF5I3Ly5tWsI8Wyc58eDjTSZkU866T9qP5JGvaaKo1UsTLy8S9g0u1ewsGEc9NGq8gnOgnZTvIaAJ61JFYMbwwoAbw76o6/2GcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718301841; c=relaxed/simple;
	bh=bAI1JUMbvq/VJSL8Scl3Z4BW4+S1/r6U8oGPWP6QY1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L8cgA6piAiE28UUboSvgsm7zT/yoAIsG0W7uF41BHasSTE9oZZx8PXhayujYLkUwp23V1UaWCkYLWlR5XC4g7di8lwcUO2gl2/dOMTAKmavHZDAb7I6Ke23jSyHQ+a5dZRNy7PsFNZPCa06hLrBG2G/FbJ7M7d/0OR5+Bmrv7e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OP1tVlse; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a6f176c5c10so168336766b.2;
        Thu, 13 Jun 2024 11:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718301838; x=1718906638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqUSRrPlfqU4kfBGlHEIAysFGYiaLQcWciUI9mtNYcc=;
        b=OP1tVlsept9svBRw97NUV1DDt4qzHkp2aXl+oAA0A/k30QMfADIPrXwVhYrJW5hdlX
         oky3sJcFsWj52x41jEPlj3uSOOolNBAO32MDlitzOJKAKYtFEc5iIxch1XZNq++nEXYX
         0M4RcGnTqRYuyEXjU/So8Tzef3ZuBeM1wg1wPbIQAWFhFBvPQVepWefsLiEl5K24WuV5
         +ouIPtIuWH2H6KcVph9LMWHCsVimD8etfY0DAYxmUNutb6nih/z+A5vq3kh2vQl5y1gH
         RwI7z3NTH6seYE59KG05jZSvy+RyC87fafvyAxvARW6pgnCThVkU4i5FCytry/nIjND1
         +EYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718301838; x=1718906638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqUSRrPlfqU4kfBGlHEIAysFGYiaLQcWciUI9mtNYcc=;
        b=DHt0me8t4RV6qJoeC4ZbpBHVqk/GNWnRr6DvWu+hq1A1Wv7FUQ5njIKo4VvtE5nnTU
         y/LxWL8L88eZp7IUXWHmXKzF4hY5Ziqe9FiQkB528WSCTmsijIDtSXlxR+dUbln8wzFK
         clj3JeXyXuFHjVSJK+yOcEwSSDCPcucOFXCDh1ESCOF9M4ZGTM+IPMp6aRe5YyM3uCx8
         br5lCOKB0RjMPBumG1VcEiqCNd9DNWjAmPkiS4LjXGcKJuhrzuN8N7upTIeGDdTAT5pq
         JEsJOq9bFjj/zO5SaoSKNmM7goP0OwzWlCJmjJoDCxV1D08ILElOVAoKBlkWir4U0ec1
         d+kg==
X-Forwarded-Encrypted: i=1; AJvYcCULcz80dUHRInQOi+9blJGCHgUJjIEtEI7ehibhAgk8n841gmD6Vj/FMOgzTKtgcTnk0UzkEgEEZCgqTB8+TwxVmH04GQuJbwTeGUT6HJrqF0C3nefPTdTKnThvCj8qD2Gc0fhbaIhvRg==
X-Gm-Message-State: AOJu0YwmI5V4m+bbSvLAJqIrC+fCGpfzxt8F5DwzPkc1P4vAhcKJBeRA
	yZeEMZqPkCtQQqH7UMQcOF1cUH96me4InosKmb2Ix5p8v7hnTyWdGWsXpJgw7NI8qolE/fAHaUG
	MZxZ2cloj/VrFp8tP4y2hqAOvFUBh3GFm41OIJQ==
X-Google-Smtp-Source: AGHT+IFCe1jW2NQyvVAd+tHUoSUrn0KwFTAVpiwIEUnp2sKofwyWxC9mIh75Y9XQ4PwJJ2Zq6biGE/ucGQwd4ug6Meo=
X-Received: by 2002:a17:906:34d1:b0:a6f:49eb:31a5 with SMTP id
 a640c23a62f3a-a6f60deaacemr31567866b.77.1718301838122; Thu, 13 Jun 2024
 11:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527144054.155503-1-brgl@bgdev.pl> <ZleXc6tLbiWQ59i-@surfacebook.localdomain>
 <CAMRc=MftW0y7GicBy4vwABomUYuMndsJBUTdsQzZijDtgX1ohQ@mail.gmail.com>
 <ZmcUbe1aQfezZy5B@surfacebook.localdomain> <CAMRc=McjAAFX1R4wAbLu5bcUkpPuy8rf=fwDOqCiUY1hbjmhMg@mail.gmail.com>
In-Reply-To: <CAMRc=McjAAFX1R4wAbLu5bcUkpPuy8rf=fwDOqCiUY1hbjmhMg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 13 Jun 2024 20:03:21 +0200
Message-ID: <CAHp75Vec7D2EGVt+Mo-85FN4TEjMRkMBbJxT_f7FX5GJeYvidA@mail.gmail.com>
Subject: Re: [PATCH v7] gpio: virtuser: new virtual driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 8:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Mon, Jun 10, 2024 at 4:57=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > Mon, Jun 10, 2024 at 03:22:32PM +0200, Bartosz Golaszewski kirjoitti:
> > > On Wed, May 29, 2024 at 11:00=E2=80=AFPM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > Mon, May 27, 2024 at 04:40:54PM +0200, Bartosz Golaszewski kirjoitt=
i:

...

> > > > > +static ssize_t gpio_virtuser_sysfs_emit_value_array(char *buf,
> > > > > +                                                 unsigned long *=
values,
> > > > > +                                                 size_t num_valu=
es)
> > > > > +{
> > > > > +     ssize_t len =3D 0;
> > > > > +     size_t i;
> > > > > +
> > > > > +     for (i =3D 0; i < num_values; i++)
> > > > > +             len +=3D sysfs_emit_at(buf, len, "%d",
> > > > > +                                  test_bit(i, values) ? 1 : 0);
> > > > > +     return len + sysfs_emit_at(buf, len, "\n");
> > > >
> > > > Why not use %pb?
> > >
> > > Because it outputs hex? I want to output binary, can I do it?
> >
> > But why do you need that? You can also print a list of numbers of bits =
that
> > set (%pbl).
> >
> > We have a few ABIs in the kernel that works nice and people are familia=
r with
> > (CPU sets, IRQ affinity masks, etc). Why to reinvent the wheel?
>
> If I see "11001011" as output, I can immediately convert that to pins
> in my head. If I see 0xcb, I need to use a calculator.

From my experience I see the opposite, as the hex values are
condensed, it will be easy to get lost in binary > 8 bits. Despite
that, I am really against Yet Another Parsers in the kernel. Here I do
not see a good justification for one more. As I pointed out the kernel
has very known bitmap ABIs that users are familiar with. Are you
creating a driver for yourself or for a wider audience?

> > > > > +}

...

> > > > > +static int gpio_virtuser_sysfs_parse_value_array(const char *buf=
, size_t len,
> > > > > +                                              unsigned long *val=
ues)
> > > > > +{
> > > > > +     size_t i;
> > > > > +
> > > > > +     for (i =3D 0; i < len; i++) {
> > > >
> > > > Perhaps
> > > >
> > > >                 bool val;
> > > >                 int ret;
> > > >
> > > >                 ret =3D kstrtobool(...);
> > >
> > > kstrtobool() accepts values we don't want here like [Tt]rue and [Ff]a=
lse.
> >
> > Yes, see below.
> >
> > > >                 if (ret)
> > > >                         return ret;
> > > >
> > > >                 assign_bit(...); // btw, why atomic?
> > > >
> > > > > +             if (buf[i] =3D=3D '0')
> > > > > +                     clear_bit(i, values);
> > > > > +             else if (buf[i] =3D=3D '1')
> > > > > +                     set_bit(i, values);
> > > > > +             else
> > > > > +                     return -EINVAL;
> > > >
> > > > > +     }
> > > >
> > > > BUT, why not bitmap_parse()?
> > >
> > > Because it parses hex, not binary.
> >
> > So, why do we reinvent a wheel? Wouldn't be better that users may apply=
 the
> > knowledge they are familiar with (and I believe the group of the users =
who know
> > about bitmaps is much bigger than those who will use this driver).

You see, you ignored this comment.

> > > > > +     return 0;
> > > > > +}

...

> > At bare minumum you can reduce the range by using kstrtou8().
>
> As opposed to just checking '0' and '1'? Meh...

Okay, can you explain why you need to take bigger numbers when it's
going to be used only in a very reduced range? Esp. negative ones.
Whatever, your choice.

...

> > > > > +     int i =3D 0;
> > > >
> > > > Why signed? And in all this kind of case, I would split assignment.=
..
> >
> > (1)
> >
> > > > > +     memset(properties, 0, sizeof(properties));
> > > > > +
> > > > > +     num_ids =3D list_count_nodes(&dev->lookup_list);
> > > > > +     char **ids __free(kfree) =3D kcalloc(num_ids + 1, sizeof(*i=
ds),
> > > > > +                                        GFP_KERNEL);
> > > > > +     if (!ids)
> > > > > +             return ERR_PTR(-ENOMEM);
> > > > > +
> > > >
> > > > To be here, that the reader will see immediately (close enough) wha=
t is the
> > > > initial values. Moreover this code will be robuse against changes i=
n between
> > > > (if i become reusable).
> > >
> > > Sorry, I can't parse it.
> >
> > I meant to see here
> >
> >         i =3D 0;
> >
> > instead of the above (1).
>
> Why? I see no good reason.

There are two:
1) readability as explained above;
2) maintenance.

The second one is good in case the same variable (that's the very
often case for such as "i" is going to be reused in the future by some
new code. But okay, in this case you probably will be the only one for
maintenance.

> > > > > +     list_for_each_entry(lookup, &dev->lookup_list, siblings)
> > > > > +             ids[i++] =3D lookup->con_id;


--=20
With Best Regards,
Andy Shevchenko

