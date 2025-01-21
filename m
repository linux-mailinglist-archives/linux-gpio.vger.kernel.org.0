Return-Path: <linux-gpio+bounces-14964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 260E8A17B20
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 11:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64E64162385
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 10:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B9D1EB9F7;
	Tue, 21 Jan 2025 10:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8M7l0KC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1D61E9B0A;
	Tue, 21 Jan 2025 10:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737454329; cv=none; b=L0ePiDJPKDxOL/YsMBUhc9O5wvnKTpfbyavn9kxLIXZgNglQ96sJD+JZC5ouAQqNoxP0pFqKA+bhb2BQZ7VgmMNuSM0SGfxWOjyHBUeTyYJuALVKxKMw9DiyCUl44snLbn2qL0sYwOl4pV1Q9RHInmdPWOedG6GtW1HS21cK4Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737454329; c=relaxed/simple;
	bh=cMrQLKkpMLB9wT4a+rp7V8STz5c58GkOUkDyEdSVnI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qvw/ivuj2orXZOWKS6TSyCsdume9PubqXyae1gan31KRNIdhMJLA0lCps4oOd2hYZ1OgeMR6FwlS7bzwB97NglfmOD3nhDieforYNn8Kkmn3kz+C4a0wCF2+w/ojUcfDb2SwaEyrBlmaNpXKpkM5aYVOFdXK/cCotbRGrKKYWlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8M7l0KC; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e4419a47887so7798806276.0;
        Tue, 21 Jan 2025 02:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737454327; x=1738059127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+J8ialeflozYAg7vJT+kIWbIJLaPyybLlyTG0iD1XIg=;
        b=J8M7l0KCAdFcg6JckLjFotaoV0iUHksJcbfICrqCMpFd6V2LkKBkNSQwN06K7XXQaJ
         DVehIEsQrcXV/kOuaXANEXG8y/+dkSCg5OK5tbYSgQFY9LEwPJpaB+ZNTcuUngFAugRS
         iuqYyYYP0231H61aCgiGLE7OBmBBzlfbBO83NI2BVjasRJMUmTN17dGcmL0pEIlYZ+eG
         K89wzDVzZ9NMqB03DQ4xVsMGaF8aoRMBa9+eZdJjqSSXs6epWfIGiW8MBy6Oo/mdta3Z
         dOXAN27vlS4u1g0AzXGAEpQ5uFEDsjN7IVelMH1OM4OPR5Y/Kcc86Ibks13jYXZYG617
         jUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737454327; x=1738059127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+J8ialeflozYAg7vJT+kIWbIJLaPyybLlyTG0iD1XIg=;
        b=F2ydGFi+MWaEpLIAaHtciFvhxFe9rJbwTPX51MHUtEyc9INnJbKSh4rwA3z/Q/HyPC
         cFhh5MOQAf4iB8AHbIaBgj+qhED7XXoVuvt/rHtTg8u61EaN8wzOZk0mWUq5kTMLOdzN
         qy1+E0Mg/jS4aGd5qhv6WsRpOnYnsCaCbISN+rKInxvJm7FL1GbziyQJinTiKP3/drOb
         +gCu/pWzO8YBo5AcKpSsY/1d1zUW2qn88yMJHDmQJr0oA4ar8NWTRB78xrUDrEcVgvcZ
         0+XYMCg1RZunYC+uJtJF13dbQ7fhTul41rOvkNg8a4JOVGgynoQmT+gXk0alZDb0YC/c
         zcbw==
X-Forwarded-Encrypted: i=1; AJvYcCU0DRjM4QmAGUWNoeOefQQqlVlThd5HXPXNllSWDefF5ROKJehiWe4mqGLJ5t6w8B6cotPRBRjiGfQP@vger.kernel.org, AJvYcCXZj3S2Ywby6kFsXPhofAAVHi0EdENk+CCQUJIyYPQaqrL1zgZhyEys6YsMh7J+2QaCkzmLky3KQFiuX9gu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/jNCa3UobSfjsoyl275ZfuqqWBUlw0LgRWUhUFKeipwsqkkq4
	8F07okPSEhe2P2j58ObquKRv86su48UMCc4kIi+wYh5TB7kyho+vlmRMhe/I1ChAgD8DaPQ5LH+
	dFu8VvwJevT7rBUV5lGPvhkOcq9g=
X-Gm-Gg: ASbGncsG4+ng/xvg4Vy9EeCnDqakLOTCt13sY6GMYdRchG17G5IT6j57BS1ESLXloge
	YZ/uAX5/HUwgFU9324omMVN+nx4HG966wC/MpAZfAKcoVEM2fz18L
X-Google-Smtp-Source: AGHT+IEeCtk00JvkVZWGugHZejMOmDfpx26NJ5pZtSwU8amj+gZTaUWv3wCqHxExtIa+QJu9SNAsUGl+HDpRPv9Q66s=
X-Received: by 2002:a05:6902:e0f:b0:e58:7aa:7de4 with SMTP id
 3f1490d57ef6-e5807aa82b6mr524576276.45.1737454326924; Tue, 21 Jan 2025
 02:12:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e407b7b58c966ee35e023618ad428a21f979e761.camel@alliedtelesis.co.nz>
 <20250113220221.13545-1-koute102030@gmail.com> <CAHp75VeLyacKo3rY5iyq+kZnLjEQsBN2eOJExHrqHuesaVyTQQ@mail.gmail.com>
 <CAHN=yabQB5jYDd9iQ7s1dMWTScRf3c_zuNtXL8U283+vvenfNA@mail.gmail.com>
In-Reply-To: <CAHN=yabQB5jYDd9iQ7s1dMWTScRf3c_zuNtXL8U283+vvenfNA@mail.gmail.com>
From: lakabd <lakabd.work@gmail.com>
Date: Tue, 21 Jan 2025 11:11:55 +0100
X-Gm-Features: AbW1kvbN3URpQdIvt01hOHlJ5dTmxyJztNRCmwCjEobdtvTU7ZPqZKzyaqjrnQo
Message-ID: <CAHN=yaaZ3L23JbsQ+fugG-iXdtt9dOss0pe7yT5EG029nsfXFQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Improve interrupt support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: mark.tomlinson@alliedtelesis.co.nz, brgl@bgdev.pl, 
	linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abderrahim LAKBIR <abderrahim.lakbir@actia.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 14 janv. 2025 =C3=A0 16:44, work work <lakabd.work@gmail.com> a =C3=
=A9crit :
>
> Le mar. 14 janv. 2025 =C3=A0 10:37, Andy Shevchenko
> <andy.shevchenko@gmail.com> a =C3=A9crit :
> >
> > On Tue, Jan 14, 2025 at 12:03=E2=80=AFAM lakabd <lakabd.work@gmail.com>=
 wrote:
> > >
> ....
>
> > > +                             /* Store irq_mask for later use when ch=
ecking pending IRQs */
> > > +                             bitmap_or(chip->unmasked_interrupts, ch=
ip->unmasked_interrupts, chip->irq_mask, gc->ngpio);
> >
> > This solution has a flaw. Where is any code that clears this new
> > bitmap? The code starts with 0 (obviously) and step by step it gets
> > saturated to all-1s.
> >
>
> Yes indeed, and actually the new bitmap is not necessary at all
> because what we need does already exist which is chip->irq_mask (I
> noticed it just now!).
> chip->irq_mask is updated whenever a pin is masked or unmasked via
> pca953x_irq_mask() and pca953x_irq_unmask().
>
> The solution should look like this:
>
> diff --git a/gpio-pca953x.c b/gpio-pca953x.c
> index 272febc..29e8c20 100644
> --- a/gpio-pca953x.c
> +++ b/gpio-pca953x.c
> @@ -842,11 +842,6 @@ static bool pca953x_irq_pending(struct
> pca953x_chip *chip, unsigned long *pendin
>   int ret;
>
>   if (chip->driver_data & PCA_PCAL) {
> - /* Read the current interrupt status from the device */
> - ret =3D pca953x_read_regs(chip, PCAL953X_INT_STAT, trigger);
> - if (ret)
> - return false;
> -
>   /* Check latched inputs and clear interrupt status */
>   ret =3D pca953x_read_regs(chip, chip->regs->input, cur_stat);
>   if (ret)
> @@ -855,7 +850,7 @@ static bool pca953x_irq_pending(struct
> pca953x_chip *chip, unsigned long *pendin
>   /* Apply filter for rising/falling edge selection */
>   bitmap_replace(new_stat, chip->irq_trig_fall, chip->irq_trig_raise,
> cur_stat, gc->ngpio);
>
> - bitmap_and(pending, new_stat, trigger, gc->ngpio);
> + bitmap_and(pending, new_stat, chip->irq_mask, gc->ngpio);
>
>   return !bitmap_empty(pending, gc->ngpio);
>   }
>

Hi Andy, do you have any other suggestions regarding the proposed fix ?

--
Best Regards
Abderrahim LAKBIR

