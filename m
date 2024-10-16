Return-Path: <linux-gpio+bounces-11418-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D409A054A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 11:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C95E91C20B11
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA2A20513A;
	Wed, 16 Oct 2024 09:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MRtj/JLy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1419191F83
	for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 09:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729070542; cv=none; b=ojG6ersUQbGSz53ENs77nHAPRFITHOmz8QTvespplE4eHHbpH1DGHRGaXkcGwso7F4Ov6wUOtV4A3nrjCoACesZyGwIjQvT0EjPl2RISX0pHM2lXdENjQs9jwawgsUQUCzuNUG4EmUvGbP9wAfYuAlxXhzlcIM1vKBTTTwM9KSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729070542; c=relaxed/simple;
	bh=vPZ3V/67OPU7N35O2pwJMLRy6rBaOz/gopD6nZkjBo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTfEI//mhq4/2c0wzTDBPQcXH0BIcowXN60F0XOHMnTRgE6B0t3QQv7GSjbDPYzeqbGTm2UzenhwqNY14IsHSkfQR0gNuR7eVI9kRNK3c4GD1PyTir5kxuULwICdDPOOPmEiATmW3LvwpTZkq3V5R94cJENwvqh4vdhAwp4Sjbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MRtj/JLy; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso19649031fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2024 02:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729070539; x=1729675339; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ma9NOvqv7kKyn4q/G6b5iGcRWGIfTZsnGO66bhriv5U=;
        b=MRtj/JLyiDnVJSJrEwOevQpe6Z+CgvnX2UhCp/IgyPwkWsrV273W9CqSNxuuhh1xWM
         ImdJpcsrPkoB3HAiP0YRmPeDYoJt32DZ7qhVnaX8IucEFt0tig+qxjimXE6Wr8CvIIQ0
         p+HYgI+b5bz0rSIdOFU14YAWtzsCJi6uPn3ihT+T7litMvGZ96VDEaaYD20XGeZ90hsA
         pO8kDhiE5wKLRxs1sjhgcqXsF9LqVSMhIPCZbPbmRwNcGhoTAjDH1ulliKEEi3f5tPKP
         oSXmkcnhQ1HC2yKtQMcagC6xMemjwuRA280uo6eTonbo+fOEibFkGQ8vSjkQ5juipHfK
         +xBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729070539; x=1729675339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ma9NOvqv7kKyn4q/G6b5iGcRWGIfTZsnGO66bhriv5U=;
        b=JFVUGsMUyd4cK4gMTg90427EW0D3ti5s0khbAZ0rRoxfEZ3bxK/5p/M7Wn+U1Kv5RH
         i8UVFvtAsWg80GJux/8lFPeRK6z7SoxNXQ+5wPvCQMWfvP4thguxmA7yZddRlXyKtTHc
         PZC6RDmd8dryEVXzGqrVUgubi+q2BZoiZelr3e/qzqKkvaWdSJDdfZmWUVPDsa+UEc+K
         h+w9Z2BflKFrgL2n+KeseaS1pdkJqj3ybTp7cUxinFW5CuQn7D/zwm99CwwBBq/8CkiQ
         3AibStuq1lkvpw0cUO/J0Kpk7Mlf2eYXFlz05OXL2nl14XqFgh8EmslT2jY7ztPBHD1Q
         SmYA==
X-Forwarded-Encrypted: i=1; AJvYcCVSAry4fYs5tost5Jnc+xUNFerXXgD2pf0BwwzFOdNnMYljo5HLmJfOazG1pqZ6arK8he+EDYw5Sjp1@vger.kernel.org
X-Gm-Message-State: AOJu0YzlSPeDTr/LYVWULHXaF5T0w1VWRRhDo9ohL+POc9rxv2lRG3xd
	ge4Yp7/0y/JoTeZu/zAT2L9UVFEynVf6jVOhk45rV3MGSdQKDUllHeBzUzNIhM2Svc8vcLRe3Dm
	o+6UzGqSuvMjuGm9JSk4LLiEK7Wwmn4KblZ/sPQ==
X-Google-Smtp-Source: AGHT+IGMMEnyI29C5v5K810/b7oacrWYpBu/tiMpgfFmyW0mDG28cgzSVR0r5ByJAFa+YzdhP02tcN4nTmLa0DLS1rE=
X-Received: by 2002:a2e:f12:0:b0:2fa:bb65:801a with SMTP id
 38308e7fff4ca-2fb61b7700cmr16355651fa.26.1729070538931; Wed, 16 Oct 2024
 02:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015-gpio-notify-in-kernel-events-v3-0-9edf05802271@linaro.org>
 <20241015-gpio-notify-in-kernel-events-v3-6-9edf05802271@linaro.org>
 <20241016051944.GA42100@rigel> <20241016072730.GA120095@rigel>
 <20241016083747.GB120095@rigel> <CAMRc=McR_eMizF6r30NqbgK4mE5ErzR=wbkD4O-Czn=+Oj4AXQ@mail.gmail.com>
 <20241016091714.GA207325@rigel>
In-Reply-To: <20241016091714.GA207325@rigel>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 16 Oct 2024 11:22:07 +0200
Message-ID: <CAMRc=MdoeyXwKuLmrmJ8zRCtVDNzEd34zgZ5Autye0TNv_OLhg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] gpiolib: notify user-space about in-kernel line
 state changes
To: Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 11:17=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> >
> > Does the following help?
> >
> > @@ -2830,7 +2860,7 @@ int gpiod_direction_output(struct gpio_desc
> > *desc, int value)
> >                       goto set_output_value;
> >               /* Emulate open drain by not actively driving the line hi=
gh */
> >               if (value) {
> > -                     ret =3D gpiod_direction_input(desc);
> > +                     ret =3D gpiod_direction_input_nonotify(desc);
> >                       goto set_output_flag;
> >               }
> >       } else if (test_bit(FLAG_OPEN_SOURCE, &flags)) {
> > @@ -2839,7 +2869,7 @@ int gpiod_direction_output(struct gpio_desc
> > *desc, int value)
> >                       goto set_output_value;
> >               /* Emulate open source by not actively driving the line l=
ow */
> >               if (!value) {
> > -                     ret =3D gpiod_direction_input(desc);
> > +                     ret =3D gpiod_direction_input_nonotify(desc);
> >                       goto set_output_flag;
> >               }
> >       } else {
> >
>
> That fixes the drive problems.
>

Ok, thanks.

> > >> Still haven't tested any debounce changes...
> > >>
> > >
> > > Have now.
> > >
> > > input -> input|debounce
> > >
> > > does not report the debounce.  Only get the one event and it does not
> > > contain any debounce.
> > >
> >
> > You mean, you get a CHANGED_CONFIG event but the debounce value is not
> > in the associated line info?
> >
>
> Correct.
>

Ok, let me see.

Bart

