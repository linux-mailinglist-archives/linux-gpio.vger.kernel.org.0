Return-Path: <linux-gpio+bounces-1805-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7096A81C703
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Dec 2023 09:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0028D1F26251
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Dec 2023 08:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3B2D298;
	Fri, 22 Dec 2023 08:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AKyUKZfq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3059FBE9
	for <linux-gpio@vger.kernel.org>; Fri, 22 Dec 2023 08:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7cbfccbbbafso441012241.0
        for <linux-gpio@vger.kernel.org>; Fri, 22 Dec 2023 00:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1703235539; x=1703840339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecNqm3KCZK5TPbasxuftGkkhiYfCxbseeo7kCc76bg8=;
        b=AKyUKZfq/enD4Xfvlcu7aku4l+XOxNyMnkhEhy+EC72uFlxszex87BUmYqFP6VCSdP
         cuhKJ6CwqDjJSj9Kl2Wnusw8JOpWn6gi+/Yt4AfOBC5qrvFB0JEVgdzlxOF8QBUxxrvH
         WI3HQapDEc9wjvRLucFBm+VzX64JHYB1TXVWPm5xcVBmN2dKTZldgIuJcZiHgipw1fVF
         KnoLv6o0pJv30qKpA9GMS8e7TRWSkypGsJ/wjJ+qLFYEN5+njUJ8XPgd+zzj2NxO82QN
         uL6aNEzEvRhhfhGmFHdeiL+Zyv0P5IdzmYpQAvLSeBUt2nfYuKmpC28PzKVF50qx2Fjp
         Pa9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703235539; x=1703840339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecNqm3KCZK5TPbasxuftGkkhiYfCxbseeo7kCc76bg8=;
        b=KSeTvcBU09zHET5VcgaTKxbwwJis7Osxy3Erf6utXOJok/ZN9GmkhcKdlNSY/DMcyE
         lV3akGD4zKw4Wp2078G578XormmMHpiWs4B4q7TiH6eY8KdBrrkyvmP35vDDW/NGp8MY
         UxaG9YWk1zZ/mTeztyBmmvL/5n5ygXKGyQ8TYdtP+n6gps7t5IAn8nRzKah3xEoTlv2W
         jjgCd8sa58r1gNjcofc6nNF76CR6tDhwD1jG+HY51EG4jBtIKjJoY3FzIEj5DIuYbAQ3
         X61u/evtL0rimgs2qfW1Rd19/CNttQZW2XDAnETf8+Ya6WYIezqVDtL2Sx5gk24Hzx5/
         mbUg==
X-Gm-Message-State: AOJu0YyKmA7Y8AAVPDIaBEPugrRWBNDm3Fxp4B/dgPlWK+57TB+TNdl9
	Bwe9s5n0VJ4mSyO5x5HjBuxT1o5BSawEBVXD7ARV7VamMjryvw==
X-Google-Smtp-Source: AGHT+IFM9nmiSGlO/V2NqByyGiFjDUDdyQoQCB1/8S5i9MlsDlqpG+qP62g9RZoiAW8nUN0UBv12+et55xeNtjdB/gA=
X-Received: by 2002:a05:6102:32cb:b0:466:c6b0:d10e with SMTP id
 o11-20020a05610232cb00b00466c6b0d10emr586157vss.1.1703235539292; Fri, 22 Dec
 2023 00:58:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231221175527.2814506-1-andriy.shevchenko@linux.intel.com> <ZYTihbWMcHMHSkC_@rigel>
In-Reply-To: <ZYTihbWMcHMHSkC_@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 22 Dec 2023 09:58:48 +0100
Message-ID: <CAMRc=McSXrivkzhJVEh7-+1fzO6EBLMawhxYd7YgcsXW9wBKbA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: cdev: Split line_get_debounce_period()
 and use
To: Kent Gibson <warthog618@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 2:12=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Thu, Dec 21, 2023 at 07:55:27PM +0200, Andy Shevchenko wrote:
> > Instead of repeating the same code and reduce possible miss
> > of READ_ONCE(), split line_get_debounce_period() heler out
> > and use in the existing cases.
> >
>
> helper
>
>
> Not a fan of this change.
>

Yeah, sorry but NAK. READ_ONCE() is well known and tells you what the
code does. Arbitrary line_get_debounce_period() makes me have to look
it up.

Bart

> So using READ_ONCE() is repeating code??
> Doesn't providing a wrapper around READ_ONCE() just rename that repititio=
n?
> What of all the other uses of READ_ONCE() in cdev (and there are a lot) -
> why pick on debounce_period?
>
> The line_set_debounce_period() is necessary as the set is now a
> multi-step process as it can impact whether the line is contained
> in the supinfo_tree.  The get is just a get.
>
> And you could've included me in the Cc so I didn't just find it by
> accident.
>
> Cheers,
> Kent.
>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/gpio/gpiolib-cdev.c | 23 ++++++++++++++---------
> >  1 file changed, 14 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> > index 744734405912..c573820d5722 100644
> > --- a/drivers/gpio/gpiolib-cdev.c
> > +++ b/drivers/gpio/gpiolib-cdev.c
> > @@ -651,6 +651,16 @@ static struct line *supinfo_find(struct gpio_desc =
*desc)
> >       return NULL;
> >  }
> >
> > +static unsigned int line_get_debounce_period(struct line *line)
> > +{
> > +     return READ_ONCE(line->debounce_period_us);
> > +}
> > +
> > +static inline bool line_has_supinfo(struct line *line)
> > +{
> > +     return line_get_debounce_period(line);
> > +}
> > +
> >  static void supinfo_to_lineinfo(struct gpio_desc *desc,
> >                               struct gpio_v2_line_info *info)
> >  {
> > @@ -665,15 +675,10 @@ static void supinfo_to_lineinfo(struct gpio_desc =
*desc,
> >
> >       attr =3D &info->attrs[info->num_attrs];
> >       attr->id =3D GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
> > -     attr->debounce_period_us =3D READ_ONCE(line->debounce_period_us);
> > +     attr->debounce_period_us =3D line_get_debounce_period(line);
> >       info->num_attrs++;
> >  }
> >
> > -static inline bool line_has_supinfo(struct line *line)
> > -{
> > -     return READ_ONCE(line->debounce_period_us);
> > -}
> > -
> >  /*
> >   * Checks line_has_supinfo() before and after the change to avoid unne=
cessary
> >   * supinfo_tree access.
> > @@ -846,7 +851,7 @@ static enum hte_return process_hw_ts(struct hte_ts_=
data *ts, void *p)
> >               line->total_discard_seq++;
> >               line->last_seqno =3D ts->seq;
> >               mod_delayed_work(system_wq, &line->work,
> > -               usecs_to_jiffies(READ_ONCE(line->debounce_period_us)));
> > +                              usecs_to_jiffies(line_get_debounce_perio=
d(line)));
> >       } else {
> >               if (unlikely(ts->seq < line->line_seqno))
> >                       return HTE_CB_HANDLED;
> > @@ -987,7 +992,7 @@ static irqreturn_t debounce_irq_handler(int irq, vo=
id *p)
> >       struct line *line =3D p;
> >
> >       mod_delayed_work(system_wq, &line->work,
> > -             usecs_to_jiffies(READ_ONCE(line->debounce_period_us)));
> > +                      usecs_to_jiffies(line_get_debounce_period(line))=
);
> >
> >       return IRQ_HANDLED;
> >  }
> > @@ -1215,7 +1220,7 @@ static int edge_detector_update(struct line *line=
,
> >                       gpio_v2_line_config_debounce_period(lc, line_idx)=
;
> >
> >       if ((active_edflags =3D=3D edflags) &&
> > -         (READ_ONCE(line->debounce_period_us) =3D=3D debounce_period_u=
s))
> > +         (line_get_debounce_period(line) =3D=3D debounce_period_us))
> >               return 0;
> >
> >       /* sw debounced and still will be...*/
> > --
> > 2.43.0.rc1.1.gbec44491f096
> >

