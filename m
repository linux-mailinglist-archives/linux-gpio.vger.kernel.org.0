Return-Path: <linux-gpio+bounces-18604-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9599A82D2E
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 19:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0111F1B680AD
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 17:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C2F270EC8;
	Wed,  9 Apr 2025 17:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0RdhAPNR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843E3270EC0
	for <linux-gpio@vger.kernel.org>; Wed,  9 Apr 2025 17:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218249; cv=none; b=YM07ul81IWev2XjLcuPbJYXaQy0kN3X78dtPJEs+qOQrsu4ApPvatrF+0Wb5JsABDwin8ngqpm4qNFUifc4aFvu390ZzjTRmozJqYXORTWJAzXA6R3K7ktuNTb0CYaZyUN0gMX/eiE7FdaUg50bsym/qC0aQ7kr3Cd/ci6h0eMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218249; c=relaxed/simple;
	bh=kN9JnMbt7VVDHzh+ztLsT/qKogWwPPdRuxWtpEOFJ8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rE8CBpQaHk+CPOWeFP5ZF3705z5Nq/sW056mlhdpYwi9RAyJuPzy1hWcy537Jn5MI9SIRQQ4OEnhpjCs/biCoYFqyBU/iLcfCLfUiufGDmGf+oouy3g1WafUIDLhcI1tz/xxHancKZc4G/JTHMzcfG2cvWSFr7HV4rb/kwgqkaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0RdhAPNR; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-549967c72bcso8648529e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 09 Apr 2025 10:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744218245; x=1744823045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqlYSrcDfr+Bx9X1PTIHEgRTGk5ECdZWTlRh/r4BB3A=;
        b=0RdhAPNRPCyuj3QK09n009+tJ/zUw5f4SNULbYFC6i1aLF9zLwSB9NwrPB/mWML4TL
         yKMyv/wgPWGvTOIQBzZEB8RemLtinYZgnz3+QvgIEtHmVyb0wC288nC/uXafxBxa8jYN
         1W5qx0YFVeBo0BVpYMAYE5BQ8Xv081xpwjMEXZNyHlp1SCmakk5sWTv4UWf6sS/N6Wy3
         VcYwXmrFyyBFYtdFv6H3KOGY0YFqK2SycbVztd3AAt0UtPo6id42jIw/2WPcfRVPsWua
         Szg4DHzilxkqjwasZ9sMDPh6SmEIjKhQXMP6X/YkAny4T3SJIrQ+XfLjJHIwWmfuoVU7
         ExDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218245; x=1744823045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqlYSrcDfr+Bx9X1PTIHEgRTGk5ECdZWTlRh/r4BB3A=;
        b=RDWsakVL1EjZYyo36Gu7Nn6U5XDTb6QGAXpD8abJnBzqnbGRtDkORs9LUE3R+2euCN
         CKYkDUxJo4mTON5wSlu+jE9FQq97p+cjGHWqq5uy7lD4L5+jDz3lXPJ7Zn7nVJeqxLRj
         E26UqdgwV5mvx6fuDVC6k7Cf/PY3cpBfhUTW5DKf4DJ+8wWKsQQupiQTp1/WVUf/Q7vm
         yEHPkZkevGSxQo5QibzmKgEfU/MPMLDN3daiAMwei3IEhY6XhC922A9lGiKWLJG6u759
         oH1nT4H8/cJCmKqmbE2K04Ej/fhFeEwTnt08mmpX7hAgPBZ/wpV8+60YUqg5YrLQMSXa
         5tlA==
X-Forwarded-Encrypted: i=1; AJvYcCX3kFRXH2xDfac7DgXNBHL2DxNGFOU6J3pdM5ThPaTBusce0f2OZpFsnX/a7o23BRhyIjRFWeEcKbfS@vger.kernel.org
X-Gm-Message-State: AOJu0YwBX6N6StGkJ22tCsH4wnEOhMvLca/Ry0TjVUj4yLkZfyajHUCQ
	6+/xFgteLaFn7RrZNJKt3ahINQ4rqBxo9J38criyczebaNUtMgjG3OKSJkPks9XYBUwDe13tXfJ
	WONyvPvC+nzZRlt5KAqr4L+eQpN+bCeNwygTS7g==
X-Gm-Gg: ASbGncthsaMIRteAdMpZ0TNaDu+XjIpVLQG1Btb45VgexYu6BxygloQCgcfJ5hP6X5a
	YwT5pxTHXw3EHaEHsI/zhvC2OTyhyxjBucBIV9Dj4kLCRrkiTRhuqhCbMSh9yVev3baCespkGQa
	9ZfUmTD3/kgtcXWT7AhXRfSMCE5gkhX691/DCM1HvhMd5M6IzsCQzqVA==
X-Google-Smtp-Source: AGHT+IG0sdf40rd8ltxoAmZ7Hkro96U10DsVSvaXZNOHgXQ0QuK1RAiemvn92IF5EB5HFu9m8RLiVFJQ922J9YjgaUU=
X-Received: by 2002:a05:6512:2397:b0:549:6f5a:27b1 with SMTP id
 2adb3069b0e04-54c43723172mr981927e87.30.1744218245324; Wed, 09 Apr 2025
 10:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
 <20250407-gpiod-is-equal-v1-1-7d85f568ae6e@linaro.org> <Z_aFBfjb17JxOwyk@black.fi.intel.com>
In-Reply-To: <Z_aFBfjb17JxOwyk@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 9 Apr 2025 19:03:53 +0200
X-Gm-Features: ATxdqUEFfYRnPGi35HjFj1Fnc_q7q55qd7QfatcmT7NN48s4l6l_VroqVjqKAtU
Message-ID: <CAMRc=MdUxWa05uWpf2r7h-_csBciZD6pp4tHvaxsXoWFQ4Bi0Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: provide gpiod_is_equal()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 4:32=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Apr 07, 2025 at 09:08:14AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > There are users in the kernel that directly compare raw GPIO descriptor
> > pointers in order to determine whether they refer to the same physical
> > GPIO pin. This accidentally works like this but is not guaranteed by an=
y
> > API contract. Let's provide a comparator function that hides the actual
> > logic.
>
> ...
>
> > +bool gpiod_is_equal(struct gpio_desc *desc, struct gpio_desc *other)
> > +{
> > +     return desc =3D=3D other;
>
> I think it's better to have the one checked against NULL. That's how
> comparators make more sense, see, for example, 1b1bb7b29b10 ("drivers:
> base: Don't match devices with NULL of_node/fwnode/etc").
>

Yeah I guess it can be improved in a follow-up.

> Ideally it should be IS_ERR_OR_NULL(), but we have here a principal disag=
reement,
> so this might be yet another (buggy) function in GPIOLIB.
>

Our disagreement has nothing to do with this. In fact validating
against IS_ERR() (and returning false) makes more sense than just
accepting IS_ERR() in acting like it's a valid descriptor.

I will send a follow-up tomorrow.

Bartosz

