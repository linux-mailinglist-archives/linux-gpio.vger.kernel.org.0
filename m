Return-Path: <linux-gpio+bounces-18552-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA02A82310
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 13:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECABA4406BC
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 11:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FCA2561C3;
	Wed,  9 Apr 2025 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pktC4IJl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6513941C64
	for <linux-gpio@vger.kernel.org>; Wed,  9 Apr 2025 11:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196652; cv=none; b=C72mGDWcv/kc6DOZwM0l8N8WRA92T5/w8ycWwRyC4Ngnj0i6u9cEB/u+mar6J7UunFPu2FR+vxMeR4gcDRwjJDkhL//l8qJMjyyF5NNI5od39Nho+GcK1SHRfbWtsu5Wrz0fw0MRz+jEbMAr84f79sjhj++JtUVSCsTHD9rV84A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196652; c=relaxed/simple;
	bh=q/WDi4JdKNgeno3WMfg7QnWKZ6I7CapiQi2Hk2yYhFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBESloi9CBDgoJyOWZsEayY9rpTcAPbDU2TnHSy0hAFAiZsmVMnx81W3osJzBWQBI60kQBhj2fFtxre/utyVcpk5h8W3kktjK1A/UbxfTc/WVz7VspLcf9eS9kxXHxOuVNJfHBi9YbjTMU05xMlm8Y2HicYTsY4UmSxk2gcd2tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pktC4IJl; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30f30200b51so24147991fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2025 04:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744196648; x=1744801448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81VzqLEzeUNd6CqJijGnmlIY1CKG25dYaDgHF7EMJxA=;
        b=pktC4IJlruSk/JqaUh+xieRUsQhT/tAeCtnvbuk+C5PX50AoK+2DDmKphT23qWt/R4
         uZEGEWeGqURixloqUzFWOjWzTWzD4uFYod9658FQ/LHPW/SQZgpYsR5kdv9QPOwR1KkY
         cTWqH9SgE2ZJrD24Fk0ZOAZOrFazTbOhJDxKixKF7r2/KVwfQRYapIiYYVDD2RgamSAo
         dZ2Kpm2ZB79CIRuQjuBz6ql/yNvbfb1dhvo1CD1XGjla4J+HR4SDqXgCLUctX2Luc6jO
         AO35bLPCEAxeV74MwLPLg8e0y7NVh3N8O984CY/0Ky0cTSPEQ1G9lQzGhRpHuR1PF/DC
         k7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744196648; x=1744801448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81VzqLEzeUNd6CqJijGnmlIY1CKG25dYaDgHF7EMJxA=;
        b=C01XFlLqF2LLvZxs/T1Eg5XIK/SJRgdMe6nePKWsfx5/PGrIbPycnkvAQoPnTXwUBu
         G4l40mLAumMF2cBnbBtFWeeAEHZ6Hr/5dMq3Ln5RA0Tm/BNxmXN48uzdwvYaxn2hhWpo
         BNsxlZjklwF5vtI44o7K45rnY2u6osXcsQmbxvrqqubJUCxuZjJH5ad2rtjB8LVfrGoT
         ASW3ZtrIB4QV67+S8nBMW4p7NC8Eb0nh+PV1uyMUTqtIbmJO+pYN3arpFaVFr4r/tbQg
         CbKJ9H7bsp2Sx0cP2ZN1mh4lFPZfHqBzPaOLLD5rMaz7n/LSW7iU95sA095jHBfvDBxd
         pBhw==
X-Forwarded-Encrypted: i=1; AJvYcCVgwOM00CY8UaAR2Rao7sEUp2+12QB3b8d9BLRU/SWN9h+K8ZEsxvLdWI5X7dgGZEXJqMv6feYzx9/7@vger.kernel.org
X-Gm-Message-State: AOJu0YwBaoxOATG5fITVdYFo6uJlBp9t2M7znG572DHXGvjRK2x9K7yt
	ZLtQkUSPmF+3bHyGIFF/2q4wTK6vbPV2FGzn112QNCaC5mb2RoUuQyr9Fq3o9qUQDy1WWn9DPfU
	g0nTc+j7JiPdQFbdFymk3QeSR9Q2ntDLtBwBm1g==
X-Gm-Gg: ASbGncuoHEBPpCRcnpuSCM2qFS7+9OhWEMQML77OBrpdg+8R7a+05D5Ath7F/0692rC
	dFG8dlBLRe425fgmMi13w96tBiiw/O3leem+klo7JmVw6mxDdhCcJlKyQzjfSbURithq1vQi9QW
	1+w1eHFfqQTYD36y6MauftONFfiP1cWT7+7MfCiNfIXy6mChpr2U+Muw==
X-Google-Smtp-Source: AGHT+IHDnS4M4O2G1D+APKffa5PaP78AMWrbCZw2DfwKnwbWZXan4eUJnWQAbMP+R7gZNFxrZdnU9fpTYBm2CBDLil8=
X-Received: by 2002:a05:651c:1475:b0:308:e5e8:9d4c with SMTP id
 38308e7fff4ca-30f43894d5cmr9470401fa.28.1744196648321; Wed, 09 Apr 2025
 04:04:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-platform-cznic-v1-1-c3d4e724433f@linaro.org>
 <7r44ci6ojbkc2gsvaj5ekgd76sictqek3xmhhebicugm43rbt5@micbmk7ndzm3>
In-Reply-To: <7r44ci6ojbkc2gsvaj5ekgd76sictqek3xmhhebicugm43rbt5@micbmk7ndzm3>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 9 Apr 2025 13:03:57 +0200
X-Gm-Features: ATxdqUGCOy3GZdTu6pb8HBA46GXP0fEcthLQR7SpvpY_528igyGUOhIhGQKcRSE
Message-ID: <CAMRc=MfiE+XKCQ-6sZ1c1hgyDOJ2F9wFJ2VX9nXfZUp1n4=5kg@mail.gmail.com>
Subject: Re: [PATCH] platform: cznic: use new GPIO line value setter callbacks
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 11:17=E2=80=AFAM Marek Beh=C3=BAn <marek.behun@nic.c=
z> wrote:
>
> On Tue, Apr 08, 2025 at 09:19:19AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> ...
>
> > -static void omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned lon=
g *mask,
> > -                                 unsigned long *bits)
> > +static int omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long=
 *mask,
> > +                                unsigned long *bits)
> >  {
> >       unsigned long ctl =3D 0, ctl_mask =3D 0, ext_ctl =3D 0, ext_ctl_m=
ask =3D 0;
> >       struct omnia_mcu *mcu =3D gpiochip_get_data(gc);
> >       unsigned int i;
> > +     int ret;
>
> In this driver the name `err' is used everywhere for this kind of
> variable (when it contains error code or zero for success).
> `ret' is only used if the variable can also contain positive return
> value.
>
> Bartosz, I will send updated version, if that is okay with you?
>
> Marek

Sure, I can also do it myself if you prefer.

Bart

