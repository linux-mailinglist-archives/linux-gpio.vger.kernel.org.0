Return-Path: <linux-gpio+bounces-2555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EDA83BC1F
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 09:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD03D1F2844B
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 08:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDA512E4A;
	Thu, 25 Jan 2024 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="P12TEnux"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00668494
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 08:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706171788; cv=none; b=ACpj8yGMCeGG1cNWCNshGglfMtdX5nBU7QrOyLHkGxz5bxoM11Oe3eiwy6L4PQmwPq3obKFhKRQzRG7uHTaXciXW3SIj5XOn7AMFKLFZIfiOPoMSpgca68WukWD/Wt8HMQ/qe/FJEMpseaxLDCiPP058OVnybi9dxGP6hIAlNos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706171788; c=relaxed/simple;
	bh=qooEtGvBQ+blKW5h4z3pxUBP8ioX7XV+ZmoVKK10Hxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nbda4YrklXATl0Z35TEcWxHSLkNIfTq1pfOjmkzZzX0RIc8OHO/+piSnC9krRK4UKlmhCb3GH5bHVsbwUfIkHYmSGhg20MUN1rCuskTqIZ+qL8n1kayjLHJLuUX8SZUt/wyX8P3My7y19vG4XBOOK3yWFEcvDiBsS5UryhCYJBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=P12TEnux; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7d2dfe862c2so1267237241.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 00:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706171784; x=1706776584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yfrj1tSmrxaEJmK1wFt8ZyU62zaatrSaUH2xIk0e35c=;
        b=P12TEnuxcH1nAFTrJfddf97upD3yAMsK2NKhOWNgbNL3XvAH7vlnKD+SPYQy9kTk0F
         fxfh92VBVw8MUiHQ+KAKBX79LCQZzPnFDFk4ugB+r6oyoXGm6OWhJRJogXSK4Fo55xnP
         xLZwcfO981SITTNErLpBQrANOfBvIXpN9uibpgCIwUPopqzjnx93m1y57tcW2q2ony2m
         4rqTaNkUXA1m+SaihTlVbMmb6KqsglaV34zxQqrz4vybOfn6Ush4z7us2IpDzYZL6QpF
         5KxL0nPj+4UGUVlA60y3dX4GE8WZ2WD3NAqVXgVwoZzurxRVcGv4Kg1QSjZB/4O0MmrA
         fNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706171784; x=1706776584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yfrj1tSmrxaEJmK1wFt8ZyU62zaatrSaUH2xIk0e35c=;
        b=RlmObsblCHc8V3P5LIOcGX2NlyGH6NJ96M8Lfxf2CUQDakBh6xxHpv0WLJ6VV/e63j
         0n2e20Oktj0tTB7oLDIgTNw6hNFdYyFGwR+UGqALrLAQrQzUWAFtyu20kkj5C4DpXq4A
         ZS71YBC/6+rSL8I7J6dLuBWgSZrGEcE7gxCaSpw+WxVfi/BE530S6PdfXuWr5jtE4CoJ
         mRUiDx0Sto5K5aVI2BunLCRaiV6PbOVZnTB36zXMj6X2cCSnMk1kVkGCuIxC/roNGpxq
         HVzmLW9qoAXUr5FqSB1jtx6kE8oH1HKqVUXHYJaErxZ7rU98aKF7Y445UrhLS2H5HYW7
         CFyQ==
X-Gm-Message-State: AOJu0YwnE71w0t0tHQHKvDJb5uBBeAock6XubMsuJEJePPNTr2Lyxu+w
	GSzF+KBkrdY++O1RzWtQVqGh8xe/WeZJiVCvhubgcNINbPmQWu4IS1jJBVSLPqgy2TirK4G2Iox
	Qc7k7B4ZF5DbOOQ9hYweBkQQl/7JzDNTNbpVXUw==
X-Google-Smtp-Source: AGHT+IGjDrSN9NH9Q8W6iSCVre2BCEXpLwCYGPA1USwtRfIaGkgUmdH12KfPvs9ADyh4WxKD9T9WUXSiryfPlu5NEsE=
X-Received: by 2002:a05:6122:148e:b0:4bd:5edc:26c8 with SMTP id
 z14-20020a056122148e00b004bd5edc26c8mr290683vkp.32.1706171784583; Thu, 25 Jan
 2024 00:36:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125081601.118051-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240125081601.118051-1-krzysztof.kozlowski@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Jan 2024 09:36:13 +0100
Message-ID: <CAMRc=MesG1nYSxx0osmQEEXCvs-6B4s4=TFYW5wD8pOXpV+OcQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpiolib: add gpiod_to_gpio_device() stub for !GPIOLIB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Peter Rosin <peda@axentia.se>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 9:16=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Add empty stub of gpiod_to_gpio_device() when GPIOLIB is not enabled.
>
> Cc: <stable@vger.kernel.org>
> Fixes: 370232d096e3 ("gpiolib: provide gpiod_to_gpio_device()")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  include/linux/gpio/driver.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 9a5c6c76e653..012797e7106d 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -819,6 +819,12 @@ static inline struct gpio_chip *gpiod_to_chip(const =
struct gpio_desc *desc)
>         return ERR_PTR(-ENODEV);
>  }
>
> +static inline struct gpio_device *gpiod_to_gpio_device(struct gpio_desc =
*desc)
> +{
> +       WARN_ON(1);
> +       return ERR_PTR(-ENODEV);
> +}
> +
>  static inline int gpiochip_lock_as_irq(struct gpio_chip *gc,
>                                        unsigned int offset)
>  {
> --
> 2.34.1
>

Why is this needed? Users of gpio/driver.h should select GPIOLIB.

Bart

