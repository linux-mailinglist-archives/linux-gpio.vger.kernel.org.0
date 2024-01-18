Return-Path: <linux-gpio+bounces-2330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBD88318DA
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jan 2024 13:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 614D21C21E3D
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jan 2024 12:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA43324B48;
	Thu, 18 Jan 2024 12:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u3HVJ6NV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3779D24B2F
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2024 12:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705579395; cv=none; b=n1E7NK0yEhg7qBVfBjqzNZbaQxdGfMubHcBDCExIpfjNW5FL2/NG23kNQX9ZxLAEFBZm7OC6jQQMhJP1jyklLcwMDI8XtJce8VkkPvpQ8FuWn7SXDV4u4iFVTIeAwzz7DV3mtjsw1Pdu+PW2Rmj4rlkLNFysD/M+9KfWXR692fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705579395; c=relaxed/simple;
	bh=/rVbfCtM52Aa3e4soy8vvuD65ASfCfNNLKd8UmuneLM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=BOeKwAl6bSqXaCkldDIpMl/TBeI1WNgUs6i9kqkqi80MlSCqEPXOKsXTIjX3Oy9VX22hLwW8hTtm8XP/Ilh1N1kYLWyUaI/VU7FkDORLdy0Id/+vZ1ZecfW+Mb3UShYpOHz2EsD2QHuRDuWHr15MztF9o9O6A8K6KiBhvkExHmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u3HVJ6NV; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6dd8cba736aso8028714a34.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jan 2024 04:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705579393; x=1706184193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsI0Ch/qVsfOF0d+CdyP4dvR75VDYzMpTXr7yqGicLg=;
        b=u3HVJ6NVPEHqluP8+8hPGp7qcmlPpOypP/Zw8yPFU0br6QQfUU4dd42yrUea6aA9jx
         bx1IZ2U7XKoriliSqJ8Z/UYsadhyfsnhS79lsgkDDpjGMVR5ZPwflCOTpx5+opqQEICi
         sMB4TRJkX7Joy3hrtgTdi/DctQA96V70GjeOr2lFEUtFthP7ao3Xm+v6TnQqTU5LlTaL
         fwtK0Xen5oHudx0gZ504jq3rlvc18e3EdXOafOywl8eZo441xck5C4Od2KZsTlztCk5T
         veIFezKjzE8SbT0rIWC8T0DXNNYC9HE5Sl/CQDPRsp2ZCO7MlvNKz8lk327xjpEaJqjK
         1JCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705579393; x=1706184193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsI0Ch/qVsfOF0d+CdyP4dvR75VDYzMpTXr7yqGicLg=;
        b=FqABtz+Zmb8ky2LvGeioCT9OtKLu83/U5/TpkCoGYAicFi9wlDKOpxngn3EsFO7mzW
         3MUzSrCvkJk3QJU/16Onan6qjYTSXdDNdh28vs8QI5gDmUvI8oMnYC/8vHfck8b1B8ai
         AOBW1wkEecH7RxcZbC7Pjpy7CCCe1nZDK8WaJO3U8i5ipTNXEem/yQuVaV5y+UdbTk4w
         dzZkDe69kjxB9+5G4BPISmOoZIQOfJVnX3ihN7oZ61EiI26dwy3+8h6eByhc2w+QKfkU
         zSw5kXS6OD7JY+CscwDrOzipLh9VVuRh4BQ+HAwZ+GT2N8eAZjusyD+uIpV6NPht1USC
         hP7w==
X-Gm-Message-State: AOJu0YwyLs6ogiwSEHSHWhQyxR+58VEUl+fLzsk15DKFh51NbUwLoF/+
	v6P4uh0jLRI87/Foqu7037cfwQR6JWq9UwiEW22Rpj0wydnPMxDTP0NO8RyUjgkbnoFW3ctk3B/
	OD1o+kR8QWNuvBRCdCJnzg1QT+tJIzW4iM+yGtw==
X-Google-Smtp-Source: AGHT+IE8N9qNktxvYw54hNeBF0UY0YCK8cdIG4M9iLJUgmHiooG8FBKh/EiZfO7aqwKcqY8/WAxCJrdztrM8b3lgQfo=
X-Received: by 2002:a05:6870:3b09:b0:210:b7f3:5094 with SMTP id
 gh9-20020a0568703b0900b00210b7f35094mr751224oab.101.1705579393226; Thu, 18
 Jan 2024 04:03:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240117083251.53868-1-hector.palacios@digi.com>
 <20240117083251.53868-2-hector.palacios@digi.com> <CAHp75Vci=1nAvxRcbkK2SxGWGbQVbzQMTycMt8tZ5snPRTYXOg@mail.gmail.com>
 <fd5550ad-76c0-419b-aa07-a0493a57286e@digi.com> <CAHp75Vf4wXLEjmfpz6KQSCB0Jd8LNv6+SU_ikbhR_8PsJHuq-g@mail.gmail.com>
In-Reply-To: <CAHp75Vf4wXLEjmfpz6KQSCB0Jd8LNv6+SU_ikbhR_8PsJHuq-g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 18 Jan 2024 13:03:02 +0100
Message-ID: <CAMRc=MfAW5NDJHtZ1333-xrcCyQfft-pQF1-0Vv_ehY16agShw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] gpio: vf610: add support to DT 'ngpios' property
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hector Palacios <hector.palacios@digi.com>, linus.walleij@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, andy@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, stefan@agner.ch, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 10:04=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Jan 18, 2024 at 10:25=E2=80=AFAM Hector Palacios
> <hector.palacios@digi.com> wrote:
> > On 1/17/24 21:51, Andy Shevchenko wrote:
> > >> Some SoCs, such as i.MX93, don't have all 32 pins available
> > >> per port. Allow optional generic 'ngpios' property to be
> > >> specified from the device tree and default to
> > >> VF610_GPIO_PER_PORT (32) if the property does not exist.
>
> ...
>
> > >> +       ret =3D device_property_read_u32(dev, "ngpios", &ngpios);
> > >> +       if (ret || ngpios > VF610_GPIO_PER_PORT)
> > >> +               gc->ngpio =3D VF610_GPIO_PER_PORT;
> > >> +       else
> > >> +               gc->ngpio =3D (u16)ngpios;
> > >
> > > This property is being read by the GPIOLIB core. Why do you need to r=
epeat this?
> >
> > My apologies; I had not seen this.
> > I'll use gpiochip_get_ngpios() on the next iteration.
>
> But still why?
> https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpiolib.c#L86=
7
>
> It's called for every driver.
>
> Maybe it's needed to be refactored to allow fallbacks? Then can the
> GPIO MMIO case also be updated?
>

I guess it's because Hector wants to set an upper limit on the number of GP=
IOs?

Bart

> --
> With Best Regards,
> Andy Shevchenko

