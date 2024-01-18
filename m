Return-Path: <linux-gpio+bounces-2335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5838319D0
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jan 2024 14:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7C93B23351
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jan 2024 13:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B5224B58;
	Thu, 18 Jan 2024 13:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RODEh9Vg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC4824B53
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2024 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705582804; cv=none; b=fzLLljq+EaY4qzEehfRpRNC5PRG89inhKCfyDOoQZHNfop38gRT/Mzwbwt/JcqsljPiDYCggQBaRmyXZ2FN1o+a36pjgK+dPBWwDAWOq0hPZydtz8lSnoYVMJxABn9p+YkZWCPMm523g2GBWVZafKQpi1v8vpR7AVYpAkVeI+oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705582804; c=relaxed/simple;
	bh=7M4VaIUyYm8pE44IOXTCPDugJRBLIqoanr86Xn4yKIs=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=ogjHN+wR7ErGBh4L8KcVp0WfGX/51259wOo9vvAKM6v4nCN0nd+dK9JHZ05c31T92NOX4toWA/NrLNbxL+AGIFMIjULThWYFbo5Ry+ix2CuXZ7zAluwTIt12xQxB8lXMwrxQyTy+Db1tTonKOymOIWBDnxJnNd2QBW/orB74IWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RODEh9Vg; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7cedb83200bso1753030241.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2024 05:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705582802; x=1706187602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbPI80yNiYQVcWLbaA0E+htnDslr+gyomLLCxgqK/9A=;
        b=RODEh9VgKUbKarmhkWY8riLHD0mvfw761K6T1JqT6HOQbrDqNM0jB7qRzdiR1nIUyw
         w31vlGZ5TifUZmURBbnYblehCKePsqlnVhuCe9o9sbzZLJf32LppFGgf9Xp9ng5Yd0Xz
         OenY6DJtD/RpPkKWomwvP3HgQ6CD3qsv/CvX+EkPLCeeu3Npn4oskjIJJAuUzgrA4SzD
         wU1LVQ9/m3esU9Ex9qkf0Wa5KP0uxEdkNs7s4ppL8UfybKp3C1CoAU4MYQ1SdgWmVKYK
         7uTjrHwx+O+QuyJ6kBatAmJoms4gGFq55a/LSQ75ytTsIDrjBZ3lvzL2Wi2wNfb93nHn
         yjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705582802; x=1706187602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbPI80yNiYQVcWLbaA0E+htnDslr+gyomLLCxgqK/9A=;
        b=QL2ycWiF2Yfs9zl4+yelPrtjuiZgSo7fTspLZ8LU3rEvpuIzY7OSnvWCjphKJ6GwJ0
         PzKUnVABq0F5ixjPqFUkrP8CMC+nl2tTUGYrzU39j7c4hKtGRrH7qdQ9XPogA4MXAwsh
         PwqkUW+azaaMWQPGmx7zXeKHGWWrCpwSCSfZlX0OgPk/cNemO6mEMI0nn9PO+HZ1u0in
         aOc8Hx2Z2kRr3WcTTjdT1TsYV6+Y+hb2b6uqy0G50wwpkqHIQs2GbbTBa2rgzXKZGAxV
         8Xt6tFu4LfB/Ma3O8el6UyqAtGH5dpQ54CepZZMFB5Sa2NWlrHaEtGnGQ9tVvgZmc/mi
         lC5w==
X-Gm-Message-State: AOJu0YymH2czCZ10kghxLGZF6AV3D7TXuliVdGiTzZTRGO8QsnaA79v6
	E7jU9Rr3cfRMKa8Xa9d11+ErIEW5C8fyKQsHPJ+At5/EWyBg0Maip7kVgOVzsldKPCIgY7qtQ1u
	uuSpMaA5AnfxmrRleoZIdX920laVzx9LEhPTsEQ==
X-Google-Smtp-Source: AGHT+IFV799Pl75EVGiEihv8NguEM801LhNe7yQvY5xjGtMqBPcnTKWr82ZJvwoc7zCV0G5B1YL66F/miSdR/lsCxqk=
X-Received: by 2002:a67:f797:0:b0:469:877d:fc1a with SMTP id
 j23-20020a67f797000000b00469877dfc1amr681665vso.8.1705582801234; Thu, 18 Jan
 2024 05:00:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117083251.53868-1-hector.palacios@digi.com>
 <20240117083251.53868-2-hector.palacios@digi.com> <CAHp75Vci=1nAvxRcbkK2SxGWGbQVbzQMTycMt8tZ5snPRTYXOg@mail.gmail.com>
 <fd5550ad-76c0-419b-aa07-a0493a57286e@digi.com> <CAHp75Vf4wXLEjmfpz6KQSCB0Jd8LNv6+SU_ikbhR_8PsJHuq-g@mail.gmail.com>
 <CAMRc=MfAW5NDJHtZ1333-xrcCyQfft-pQF1-0Vv_ehY16agShw@mail.gmail.com> <9b370036-bf3a-49d3-99a0-5c11eaca4e6f@digi.com>
In-Reply-To: <9b370036-bf3a-49d3-99a0-5c11eaca4e6f@digi.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jan 2024 13:59:50 +0100
Message-ID: <CAMRc=MeJQihq3N1ZqGiKS_9JJ6c0BwXZfiY1XicBiW8mc18Oxw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] gpio: vf610: add support to DT 'ngpios' property
To: Hector Palacios <hector.palacios@digi.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, linus.walleij@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, andy@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, stefan@agner.ch, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 1:45=E2=80=AFPM Hector Palacios
<hector.palacios@digi.com> wrote:
>
> On 1/18/24 13:03, Bartosz Golaszewski wrote:
> >
> > On Thu, Jan 18, 2024 at 10:04=E2=80=AFAM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >>
> >> On Thu, Jan 18, 2024 at 10:25=E2=80=AFAM Hector Palacios
> >> <hector.palacios@digi.com> wrote:
> >>> On 1/17/24 21:51, Andy Shevchenko wrote:
> >>>>> Some SoCs, such as i.MX93, don't have all 32 pins available
> >>>>> per port. Allow optional generic 'ngpios' property to be
> >>>>> specified from the device tree and default to
> >>>>> VF610_GPIO_PER_PORT (32) if the property does not exist.
> >>
> >> ...
> >>
> >>>>> +       ret =3D device_property_read_u32(dev, "ngpios", &ngpios);
> >>>>> +       if (ret || ngpios > VF610_GPIO_PER_PORT)
> >>>>> +               gc->ngpio =3D VF610_GPIO_PER_PORT;
> >>>>> +       else
> >>>>> +               gc->ngpio =3D (u16)ngpios;
> >>>>
> >>>> This property is being read by the GPIOLIB core. Why do you need to =
repeat this?
> >>>
> >>> My apologies; I had not seen this.
> >>> I'll use gpiochip_get_ngpios() on the next iteration.
> >>
> >> But still why?
> >> https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpiolib.c#=
L867
> >>
> >> It's called for every driver.
> >>
> >> Maybe it's needed to be refactored to allow fallbacks? Then can the
> >> GPIO MMIO case also be updated?
> >>
> >
> > I guess it's because Hector wants to set an upper limit on the number o=
f GPIOs?
>
> I think Andy is suggesting to rework the gpio-vf610 driver to use
> bgpio_chip struct (it doesn't currently), and then I guess the 'ngpio'
> property gets read automatically if you call bgpio_init().

No, Andy said (and even provided a link to the code) that "ngpios" is
read ALWAYS when a new GPIO chip is registered with the GPIO core.
It's just that it doesn't impose any limits but that could be
addressed with imposing an upper limit in DT bindings maybe?

Bart

