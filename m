Return-Path: <linux-gpio+bounces-1627-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9DE8176A1
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 17:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C1161F25017
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Dec 2023 16:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69983D54C;
	Mon, 18 Dec 2023 16:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="U94XMpT0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2C93D557
	for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4b6c3a37ddeso312511e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Dec 2023 08:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702915303; x=1703520103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGsftRUwsP12LQ30FBWYDs/WH5EY9TUOi7H6csPAxGw=;
        b=U94XMpT0QLBlxq8bYxp3/sS8NKhOnDJNMoe95l8Kz6Jw2spo+XtO0leVWb4rHyjmzg
         qm13lwpczUpYXcJxdYiy8Wjd9BwBVhTb3nireB6o1cy4c4oVvnv+Zn2UCA0rFNS7bC6X
         Xu2UxEva3ThSP95xCHzymDKyA7yiqxdTGMNnk4jEYv4O5bcvR7nAjk3SLuaUx8u/gBya
         7m6HuZ9b3fpu8LtmCL6DlK223mq5WWKkxYfyjd68zbOaUKXUCrVb2eoaZbcyWX5lGiBg
         qAahpqlPzE4/QkxUU5rab3zT/oXGuvfclkvG2TPqs++68qEVf1ZMxAClva155JhoftGG
         f7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702915303; x=1703520103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGsftRUwsP12LQ30FBWYDs/WH5EY9TUOi7H6csPAxGw=;
        b=FmXNDVIeTe9A92poOoCpUOzIzYpLQ92bE+FlamVivb9W/myX+AL3obL69xI5hZW5HX
         qC4o2QL2fDTN9xAVofxOZiebKr30ImEf6r0M2lEFF7SWzShWdWKHQ84Ob+DX9JygWAWj
         /w6RYZSWgWZK52FotkFJA9KFx7y8qsoexDauGKQj7fnQulEZKSRrzMT8aswUwDUX0gS/
         5odUlqMpi1v4wFjCSl4DLGij1ypzf0fKkQv467rX18GR4+Q5q2PsvexrM2eMkpOdWPai
         xtwKxc81V+2bu6sBq1n5ILdRel37OXtwWfCwMxuPcoINAR/yve4ERUGF6TffKnlyNDwD
         7HHg==
X-Gm-Message-State: AOJu0YxKcesMnx2y5ia7zuk9aS4djLVyuRQHmFqPacE0Q5W7eGFC4+ui
	vhqS1II2ZMLlK1wxGG+KMACSltNMen8Cku2xpRaIFQ==
X-Google-Smtp-Source: AGHT+IHc27efHm1oPrfnUlMRPn8IUs/f3CkxX/C5qBu8BNaZdCSCbdm+IytJJb9k8TJC1cMswI99IhwBc39aQg71/Z0=
X-Received: by 2002:a05:6122:180a:b0:4b6:d379:7f5 with SMTP id
 ay10-20020a056122180a00b004b6d37907f5mr510520vkb.1.1702915303687; Mon, 18 Dec
 2023 08:01:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231216001652.56276-1-warthog618@gmail.com> <20231216001652.56276-2-warthog618@gmail.com>
 <CAMRc=McBVeQ=yRpGRsnPEULfPx15PBO3kiGscdS4s6-d0URc3w@mail.gmail.com> <ZYBoA25z76uutBBI@rigel>
In-Reply-To: <ZYBoA25z76uutBBI@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 18 Dec 2023 17:01:32 +0100
Message-ID: <CAMRc=MdKfs1ok2KgkO0C64cA9k8bOupxsjReBMQSdZbP+MQMCQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] gpiolib: cdev: relocate debounce_period_us from
 struct gpio_desc
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 4:40=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Mon, Dec 18, 2023 at 04:24:50PM +0100, Bartosz Golaszewski wrote:
> > On Sat, Dec 16, 2023 at 1:17=E2=80=AFAM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > Store the debounce period for a requested line locally, rather than i=
n
> > > the debounce_period_us field in the gpiolib struct gpio_desc.
> > >
> > > Add a global tree of lines containing supplemental line information
> > > to make the debounce period available to be reported by the
> > > GPIO_V2_GET_LINEINFO_IOCTL and the line change notifier.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > Reviewed-by: Andy Shevchenko <andy@kernel.org>
> > > ---
> > >  drivers/gpio/gpiolib-cdev.c | 154 ++++++++++++++++++++++++++++++----=
--
> > >  1 file changed, 132 insertions(+), 22 deletions(-)
> > >
> > > +static inline bool line_is_supplemental(struct line *line)
> >
> > Under v2 I suggested naming this line_has_suppinfo(). Any reason not
> > to do it? I think it's more logical than saying "line is
> > supplemental". The latter makes it seem as if certain line objects
> > would "supplement" some third party with something. What this really
> > checks is: does this line contain additional information.
> >
>
>
> My bad - responded to your first comment and then missed the rest.
>
> Agreed - the naming could be better. Will fix for v5.
>
> > > +{
> > > +       return READ_ONCE(line->debounce_period_us);
> > > +}
> > > +
> > > +static void line_set_debounce_period(struct line *line,
> > > +                                    unsigned int debounce_period_us)
> > > +{
> > > +       bool was_suppl =3D line_is_supplemental(line);
> > > +
> > > +       WRITE_ONCE(line->debounce_period_us, debounce_period_us);
> > > +
> > > +       if (line_is_supplemental(line) =3D=3D was_suppl)
> > > +               return;
> > > +
> > > +       if (was_suppl)
> > > +               supinfo_erase(line);
> > > +       else
> > > +               supinfo_insert(line);
> >
> > Could you add a comment here saying it's called with the config mutex
> > taken as at first glance it looks racy but actually isn't?
> >
>
> Sure.  Though it is also covered by the gdev->sem you added, right?
> So the config_mutex is now redundant?
> Should I document it is covered by both?
> Or drop the config_mutex entirely?
>

No! The semaphore is a read-write semaphore and we can have multiple
readers at once. This semaphore only protects us from the chip being
set to NULL during a system call. It will also go away once I get the
descriptor access serialized (or not - I'm figuring out a lockless
approach) and finally use SRCU to protect gdev->chip.

> And you wanted some comments to explain the logic?
> I thought this is a common "has it changed" pattern, and so didn't
> require additional explanation, but I guess not as common as I thought.
>

If line_set_debounce_period() could be called concurrently for the
same line, this approach would be racy. It cannot but I want a comment
here as I fear that if in the future we add some more attributes that
constitute "supplemental info" and which may be changed outside of the
config lock then this would in fact become racy.

Bart

> Cheers,
> Kent.

