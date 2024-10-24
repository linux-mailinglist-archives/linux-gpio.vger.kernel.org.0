Return-Path: <linux-gpio+bounces-11955-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3820C9AE6E2
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 15:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AEDF1C218EB
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 13:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2D11D9A72;
	Thu, 24 Oct 2024 13:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qt90OG8F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C672189914
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 13:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729777196; cv=none; b=LtLaUTApr1Xkt3rNjZAhv+D5XjioaOGNmOhuQlaUO6223rv9EYlX0AdZClX7AIyp/JyR7Z89lNR73SXNdowtv1/jX1IuTHjFoQAkR/mqPtbAsITxTWV6zq1nip2BD20aEeviek8dPBUCkCSUcNXmfSBSRcFsGUvHycH7TQozT7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729777196; c=relaxed/simple;
	bh=v/CXUCKiLcqY6pqkTSb6PlvdIs9QO040T1mBGRvT728=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGAMg606DFqGUY71bA0nuQQzLwNQy8czMpjOirLWJZR/zMWs4bg5g6PKl1a+o/loR0TtLRJzVek/MRBv8KinecnGA2jYD9ST5RZEJPFRjXAgS+nCg/EWXhbKIo30HXHZpCkwXcItle7Q9VUSiHGME29t0glsk4I0hHTS+Ocakuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qt90OG8F; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so19215201fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 06:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729777192; x=1730381992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JcDQcGMTS3/Z382NJzKg1ZoY2TCg15Bl6F/r6sAEMDU=;
        b=qt90OG8FBsnY7mQ1wZ/pfwWg/wMOT8+xelQOmdF59QcJX2i9zY5jrrM/XVHu8xD8vP
         1VlP6ynE+nn5wHn4fKEfaXaBBJoLkMWSt6krmyFu8iFVoyHEWMzWJZ0M9NSr+mpjJgxw
         jH2qBy2JwRPAlv0tL8NSWO3VtFIY/gDnv0nftZUS2Zj9uxcadFvPAZkdiNfQNGb6KAbf
         nGNfKkl9SQcrULrwdRY/OJJ+ke8oL389Ca2OHWLUxpl4fylscCHLcHPuD0D5mX7HJfsm
         L+7YSXoYU/HQG0H13ax3XOPsU7HYHmHITDcFu5SvoVsLQHARWZGoPXP/badRmiyTFwQB
         52nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729777192; x=1730381992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JcDQcGMTS3/Z382NJzKg1ZoY2TCg15Bl6F/r6sAEMDU=;
        b=tWXVrOqxIE3nY/oj8kZG1u5ZkBHyMkTAPd9UetlxkbJimkwiqn+ZCQorRG1M7e5wAH
         Ee/THD59ih04y+tnbEe8ebtZNjiRDYEUvRhV4jmmCvXRQJMp2T25OGGlF68HBsj1T6An
         qvJRGdSqyQuRVlB3gZNXrNVeMvIEge2xOUlt76yy0rdJZxX/IYLQ+aJFba55fUrzpF1d
         u70R9VHboovkU00Y5IucNFR4AqjpCR4u4/bpOAw8A1a1sXlrt/7U/HIX4l55/ToFRnzz
         slB23xt6mxCK4xx+6173JPp8O5d808pXIsCbq+xpXlGg5NtO3fVz7LVYgR09Z63HQqCA
         mmKw==
X-Forwarded-Encrypted: i=1; AJvYcCUwTgj6eQEMCYOzt8adY7pZyTo60RiPc23yRIByqmM9s3IykxhyNe3u4xG7KTQa7l22XHczsdKqw1la@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdcl8wHbU4klSI2kdVYkQUHuyrrphZgQNpHbPNCkUBrfunytsx
	jKMrzHRiwt8ZU+xaOlDWMxMh+pJCVz5hbARJPD4/IiIkAwYvvD8huodzDljSt8tzdWvAE78oi/b
	QQIaHTiv1HGaefk4BKiCyAu047beWYSnsZ0RWcg==
X-Google-Smtp-Source: AGHT+IF0BgNP1G+cfT9GTdlc5gTUsyABIpJadRyY75C1zXxEyRyfoEy0pAmixSGre29DlOpkn8DPIrfkXWBokI7Sm7g=
X-Received: by 2002:a05:6512:3b2a:b0:53b:1fd1:df4e with SMTP id
 2adb3069b0e04-53b23749bf5mr780352e87.19.1729777191958; Thu, 24 Oct 2024
 06:39:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
 <20241018-gpio-notify-in-kernel-events-v5-8-c79135e58a1c@linaro.org>
 <d6601a31-7685-4b21-9271-1b76116cc483@sirena.org.uk> <CAMRc=MfW9n+y8Dehe_g9b8_=he1YuFr3CEGG3iQEfjYwFiWA_g@mail.gmail.com>
 <CAMRc=MdER_JNcvPMRuzbDFpAUqarC9K8KRP+i5SFTW3H7Mkg=w@mail.gmail.com>
 <bf16af3b-d00e-4084-aa29-6e4c1955ed88@gmail.com> <CAMRc=McUpRJ=EN3DB7gsgsNKZHhJym6vfURmX9+mXnYuXjNwMA@mail.gmail.com>
 <195a21e5-79e1-4502-bc75-05e2893a2503@gmail.com>
In-Reply-To: <195a21e5-79e1-4502-bc75-05e2893a2503@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Oct 2024 15:39:40 +0200
Message-ID: <CAMRc=Med15qPZuo7PqnNrg_DbXanpi-HhaDYq7Spq-yJLA=HQg@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] gpiolib: notify user-space about in-kernel line
 state changes
To: Klara Modin <klarasmodin@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 2:00=E2=80=AFPM Klara Modin <klarasmodin@gmail.com>=
 wrote:
>
> On 2024-10-24 13:45, Bartosz Golaszewski wrote:
> > On Thu, 24 Oct 2024 13:34:11 +0200, Klara Modin <klarasmodin@gmail.com>=
 said:
> >>
> >> I think I hit the same, or a similar bug, on my Edgerouter 6P (Cavium
> >> Octeon III):
> >>
> >> CPU 3 Unable to handle kernel paging request at virtual address
> >> 0000000000000000, epc =3D=3D ffffffff817a40c8, ra =3D=3D ffffffff817a4=
0a4
> >> Oops[#1]:
> >> CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> >> 6.12.0-rc4-next-20241023-00032-g01c8e35f8d89 #84
> >> ...
> >> Call Trace:
> >> gpiod_direction_output (drivers/gpio/gpiolib.c:4164
> >> drivers/gpio/gpiolib.c:2700 drivers/gpio/gpiolib.c:2694)
> >> i2c_register_adapter (drivers/i2c/i2c-core-base.c:396
> >> drivers/i2c/i2c-core-base.c:422 drivers/i2c/i2c-core-base.c:434
> >> drivers/i2c/i2c-core-base.c:1574)
> >> octeon_i2c_probe (drivers/i2c/busses/i2c-octeon-platdrv.c:247)
> >>
> >> (the complete log is attached)
> >>
> >> Unfortunately the oops remains after applying the diff and the call
> >> trace looks to be the same.
> >>
> >> Please let me know if there's anything else you need.
> >>
> >
> > Hmm so it's desc->gdev that is NULL... Could you try the following:
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index ae758ba6dc3d..c95c79ea2b49 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -1026,6 +1026,9 @@ int gpiochip_add_data_with_key(struct gpio_chip
> > *gc, void *data,
> >               }
> >       }
> >
> > +     for (desc_index =3D 0; desc_index < gc->ngpio; desc_index++)
> > +             gdev->descs[desc_index].gdev =3D gdev;
> > +
> >       ATOMIC_INIT_NOTIFIER_HEAD(&gdev->line_state_notifier);
> >       BLOCKING_INIT_NOTIFIER_HEAD(&gdev->device_notifier);
> >
> > @@ -1055,8 +1058,6 @@ int gpiochip_add_data_with_key(struct gpio_chip
> > *gc, void *data,
> >       for (desc_index =3D 0; desc_index < gc->ngpio; desc_index++) {
> >               struct gpio_desc *desc =3D &gdev->descs[desc_index];
> >
> > -             desc->gdev =3D gdev;
> > -
> >               if (gc->get_direction && gpiochip_line_is_valid(gc, desc_=
index)) {
> >                       assign_bit(FLAG_IS_OUT,
> >                                  &desc->flags, !gc->get_direction(gc, d=
esc_index));
> >
> > I'm wondering if this is not an earlier commit.
> >
> > Bart
>
> That doesn't seem to change anything significantly:
>

I managed to reproduce it by using optional GPIOs. I sent out a fix
with both of you in Cc, please give it a try.

Bart

