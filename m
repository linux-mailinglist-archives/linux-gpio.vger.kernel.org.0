Return-Path: <linux-gpio+bounces-28294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 159ECC45F04
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 11:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9613189398F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 10:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9652FE592;
	Mon, 10 Nov 2025 10:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kqguwfo/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA67218AB0
	for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 10:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770460; cv=none; b=eqwbQhVxZUTd5KYqkgS7bva/OFWjohBRtjiwgs2TSEPSmoR6vpgw9Jxcb3PoTgqkBQ1PbSkf+dyIdunNA+0sD8swUtJYK73ZXbcIqAUo6uX++ueeV72MjJE8O9sFWW8D7k9LaqTQO/vBsADT/2JmPyfNPxteOpu2r5QHGAkzpBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770460; c=relaxed/simple;
	bh=vHmidB3JYdOUlrmaPoEMyBdxapyGxcVzPk7ayQBh8IA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRr2BS7SMJYTMN7ooNaLlNxvx8QYESHLxO/ggLmkMhVQX3rRd/Ssq3F3vhB/7it8DwNQuDDMqmoU/aI7rtDU09FQo7GYd+xTLeZDy9laxZOKqcfJzHuQbfsuxEN+skAYb/BM1uT5FSqDROxs/APRODP5JT93kJ8wWndifnN3zlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kqguwfo/; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-640d8b78608so914735d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Nov 2025 02:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762770457; x=1763375257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVCYh3cOicnQPAZADw6na14qsKJaeo3pCqBgTcCqyAQ=;
        b=Kqguwfo/iTUdmji6/BL9/F0DC/A//OS3Ad8TfxmwUK6sFzQ2GJAzdWis78YesV0y6m
         3oi3af4ALbNT5/FJdUuUiKw38vTSA1SbpkgDNcK8rXWa6GTgH/Ubon6jH4Nop8cKz2sr
         QSPs8hvaQBB2xi7U9PrVMV55G5cC4tkiRcnvye+8faCn5ejlg2m6EdLb/eQOnCKNRp1N
         h9QH1robr8nxXZRaJaXSfSGUUOIaP9y/6Pw/UlwuyktdEFqcvz7pKS46ASuQt+ZpXYTk
         Cq9m4PveYN+npCgj9iOP7Rc1kEGWMSKwVu8osvlpYO1iUFB04yiZ99v7OlYvYWzjw+T6
         jiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770457; x=1763375257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nVCYh3cOicnQPAZADw6na14qsKJaeo3pCqBgTcCqyAQ=;
        b=FslfOBFecJmJmc2qqDCfVe8zPfXvfTxFzzjKT9AX54I6I4NnRTs/qciazaBKnwotxT
         fyHpVz0O5fqG5RA6wj9YoHwD5raCmk7GUDTlxry2thDnT2KuTf2zwPAacjEh3uGvt0VD
         icF6KRW6TQzPXxlu4KyYWh2V9MGtbXcDYFXYNBoJtaNEFc7U4xhbHwBqvX2N9EfvJLCM
         oK7PF5o27UPf1zsjfLi1tXR6BvKArAbNua5CXO4LTwDK+El20jR9H5LE9syfBpgoS90/
         +ungoikKP1g5Tj1qtV+0enNjIISFGQ1vz8X+FGGCyRsjppBmForjWOpyhnWpSHOx4Qq9
         pK3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7F+keXDlUt4ttJCDPF4hk+phYihAAfx3sD3LKNWiPsz+F94D8vaP9qyZihNHvXmiB/vHDuZ66dYXD@vger.kernel.org
X-Gm-Message-State: AOJu0YwW5DQfTTvlKjrNBlynwVaPbZkFipiunoJWtZrM0248LxYn8b9p
	t9q6jYPar6oPMD3A5UBvzTXoVfo3nDivCE/4DiSF9Fl0zSQOvfAwv5+qARuPtPlPq7ZbPddIYug
	UzyajKP5emF0c11msAR1LIoVXFsu4ugEtXcH5JcShJFFiS8YFI9F87fM=
X-Gm-Gg: ASbGncsNBRcL4BenlZzxk5gWVjnTr6jJsheWE3G1N+91MuCKi0mlf4+Ebw1UkFcSsOf
	g1GUmlaRi8+7zRjUBfKRNOG549zqIMGXKOs57pj21ttmg8Gu5+RKBz9Ip/iry53Ze9rGdSIh2d4
	kUHteU90FVJbpA3vr8gbbCME+N95FnqhAgd2SxUIsFSVrrITjIOcuIP6+ylssIyiNZqjcDhA7tZ
	Cf8V5tqdM55WI6S6sTlkiwzMkspDIW6P5cX1qQ65dAKMg138Ag8sRb/Xlq6ocrH3+w7t94=
X-Google-Smtp-Source: AGHT+IFy7NetjpMNmDFBssokdBlYgtJrB1CLHXUC0uao2NpzAB1FWHhlXBZS+ZbRtp56BCz83WPIRmCOAMhfYJD6TgE=
X-Received: by 2002:a05:690e:4191:b0:63f:beb2:952b with SMTP id
 956f58d0204a3-640d4522d5fmr6227377d50.9.1762770457466; Mon, 10 Nov 2025
 02:27:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031160710.13343-1-antoniu.miclaus@analog.com> <20251031160710.13343-2-antoniu.miclaus@analog.com>
In-Reply-To: <20251031160710.13343-2-antoniu.miclaus@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Nov 2025 11:27:20 +0100
X-Gm-Features: AWmQ_bnnEqKDQ_v4UfUWlBrt9G_CKxPBfs7G6bPAG1nsql-e1R9Rf9Z2Y73CBK4
Message-ID: <CACRpkdaEq1cumg_z0A5LV=6nh5QqZ9x1_ZDuf8XTzgub4XVVqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: adg1712: add adg1712 support
To: Antoniu Miclaus <antoniu.miclaus@analog.com>, Peter Rosin <peda@axentia.se>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antoniu,

thanks for your patch!

Add
Datasheet: https://www.analog.com/media/en/technical-documentation/data-she=
ets/adg1712.pdf

Before signed-off-by, thanks.

On Fri, Oct 31, 2025 at 5:08=E2=80=AFPM Antoniu Miclaus
<antoniu.miclaus@analog.com> wrote:

> +title: Analog Devices ADG1712 quad SPST switch GPIO controller
> +
> +maintainers:
> +  - Antoniu Miclaus <antoniu.miclaus@analog.com>
> +
> +description: |
> +  Bindings for Analog Devices ADG1712 quad single-pole, single-throw (SP=
ST)
> +  switch controlled by GPIOs. The device features four independent switc=
hes,
> +  each controlled by a dedicated GPIO input pin.
> +
> +  Each GPIO line exposed by this controller corresponds to one of the fo=
ur
> +  switches (SW1-SW4) on the ADG1712. Setting a GPIO line high enables th=
e
> +  corresponding switch, while setting it low disables the switch.

There are two unclarities here:

- I know what an SPST switch is, but how is that electrically controlled?
  Is it actually a good old electro-magnetic relay? There are clearly
  details missing here. When I look in the datasheet, a symbol for a
  relay is present in the schematics. At least explain that they work
  "as a relay replacement" (literal wording from the datasheet) so
  we know what this is.

- GPIO is general purpose input/output. This is a narrow fit with that
  concept. This device is more of a general purpose mechanical
  current switch. We need some motivation here, explaining why
  GPIO is a good, operating system-neutral description of what this
  device does.

Perhaps we need to create a new binding category
dt-bindings/switch for this, even if in Linux specifically we chose
to model this as a GPIO, it could just be something we do in
Linux, Zephyr for example might want to have a dedicated driver
for switches.

Also I would like Peter Rosin's eye on this, as we have
dt-bindings/mux which is selecting one analog line out of many
and it's close enough.

> +  switch1-gpios:
> +    description: GPIO connected to the IN1 control pin (controls SW1)
> +    maxItems: 1
> +
> +  switch2-gpios:
> +    description: GPIO connected to the IN2 control pin (controls SW2)
> +    maxItems: 1
> +
> +  switch3-gpios:
> +    description: GPIO connected to the IN3 control pin (controls SW3)
> +    maxItems: 1
> +
> +  switch4-gpios:
> +    description: GPIO connected to the IN4 control pin (controls SW4)
> +    maxItems: 1

Why not just use an array of GPIOs? The property has the suffix "gpios"
(pluralis) after all.

I'd just use switch-gpios =3D <1, 2, 3, 4>...

> +  gpio-controller: true

So this switching capacity expose four new GPIOs, are these really
GPIOs, that's the question. I think we might need a new binding
category. Either this is switch, GPIO or some type of amplifier.

Yours,
Linus Walleij

