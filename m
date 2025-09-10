Return-Path: <linux-gpio+bounces-25920-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0DCB523A6
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 23:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 872DB177DF3
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 21:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABDB1313E32;
	Wed, 10 Sep 2025 21:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rfLYVKQq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F153126CF
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 21:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757540535; cv=none; b=MEhdpQj4eLPetpnCaBohq5JqkbrZz5OPueM7ih5GGGoTHw3mGFZgrnVl4MnmwJVI9pj4V9lRirndo86I68e9U5S/AH5IWLazWaQfTaudJuBVjfuhocD0kGxcI/a2IB2RUOXXrR3KauocrCrToXC3kX6SK1FC33qkG2ASuXUxmrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757540535; c=relaxed/simple;
	bh=Vtc1GyPAcEF1ugP0+8GLjXhPqu7RmIfd/JlyHRAC5OM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZcYkemkPlka7oa0o365yUpxnkPe2tx6PjgWvtmucOyMUsBhm0QVAW9ssLn0E5h2y5B5N5aitNyNJNLGbjG7rHu7mpAYXYVM5r0lyl7Z07GbDHGs6NRCPBzuJovMUZR8Wg9VapQkeFOx0gYTE0uASG7ldUhokFjU9VmlA3y/5Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rfLYVKQq; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55f7b6e4145so9328e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 14:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757540531; x=1758145331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfssQgwNNt3owWOCp8M+EybKjyUjEnQDrgLOR0WxhvM=;
        b=rfLYVKQqBg3m+PCSqF8Ff3HBjJRMFayIcx+9QL0hYpVq5INVsma87iPG1M9ODDT8kj
         UWwXVeohdq2HVaXc2IphtiF6sfyrEuu0xzbcvlSS+dunZgJL0eZJ1WFunfJ0Iow0Rt3n
         P/IvDPb+Kc03Gu7g+Ag6AY5A52g4KunhLmHJAeFaI7e1tlEoyOAF12yVgeox+8XHIwkX
         FiA1wn8WMDHOtTkb/LZBlVrjX/bV3rqiYWnKwBQ6uZK6OMu/BtZJV1ipjz1Mb0XH4un1
         +d/dpHmMUw/63FpFIyxmsJOmPCVoC8JRzaRB5Lr1Rxt4sjT8cQgGht9WKvP4x6uqiOMl
         4Yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757540531; x=1758145331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfssQgwNNt3owWOCp8M+EybKjyUjEnQDrgLOR0WxhvM=;
        b=tFjrH68ITKKQY3NuDT7ncB0GYrTMl5LEMQSbT7FWk1OZ7Sbg7UkxsUuVr3zIHmetLc
         /kvg+PlWwnoyKfvZvSiCGoQU40hIdEZJF1Kjn8DC8QLRVp/wwvyVLTiOZfl16FG1ftQa
         CjpGpnez555JB9PG6i5wZ42/wLPMqnIA1e2D10udEC0TtE+fsNFxAgNX3M/cNH5SkE1s
         njbzrVYlP6wdYBj/u3ZtGTKsyZRiNiXauiMqa7Pd3RoePiBtyPL0BzSW2kXLPtYpTsC0
         J4qLzkiHkNBBxz6IfEgJE5gL2LiHxDUZ2Zh1utc6HxeeT+OKqHx9LEFZNOFz0oDJUObm
         aYdg==
X-Forwarded-Encrypted: i=1; AJvYcCVQfOzOxtW9hJ6T2zYXRvMcPd1gMqpUAmR8weI9+7Sp0HU8/us0lbA0QCfIYXO3MSHUAPqI3G860962@vger.kernel.org
X-Gm-Message-State: AOJu0YxVWOafdTi5xNxoVrPxENQY3QH5SF3aI/gblLobWKhsM2IBiXve
	vCr22zpaCqAzS/39R4U97qtLhoqNuhBh5KLdX/ETnM5FW9KK0UkYU8DFke4zAIjSVa4aFypNgRQ
	LRWLX45Dxe1spWrgyNL0xKwEgJnJcSuOzJGFygDxCrw==
X-Gm-Gg: ASbGncuQV+EQTH4nqe94mMJDmfPHaB59uT0ny3LN1X0CQjonM/oGelZFVSzr55M2Dtw
	Wti3jBzmE2nwmIRig4yD0raPbnqvbyh2VsWu8gsadGXNPNtrEFQmQYXXvVlAYwUiYezEBYqB0vl
	0IroS5k4/nm8MPKnFSNFpFg9+5VOXB128X3CUcqrsoTe42mffm8XjpmM0m7qE0FJcU7bT7qu7SB
	iRb69E=
X-Google-Smtp-Source: AGHT+IFutlHIwj2lsj+jDT7k42Zm8eOFBZR4KCwk+hGGTQIBylx/YAPLbGuT5vRdHvQdR6a4Uk4sEKHn5d0jQ+26HUw=
X-Received: by 2002:a05:651c:20ce:20b0:336:e1d6:8920 with SMTP id
 38308e7fff4ca-33b537e751dmr45597001fa.31.1757540530806; Wed, 10 Sep 2025
 14:42:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910133958.224921-1-hansg@kernel.org> <20250910133958.224921-3-hansg@kernel.org>
In-Reply-To: <20250910133958.224921-3-hansg@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 23:41:59 +0200
X-Gm-Features: Ac12FXzOvkO2a9fvYJf1s2WB79zSocSiy--29h2HtuNVqHlSwVgZxm9T5NCVWzM
Message-ID: <CACRpkdaZHfb_FtimCxoLphnvLswpHSEubpztWwEQoW42qHW3Gw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] gpio: Add Intel USBIO GPIO driver
To: Hans de Goede <hansg@kernel.org>
Cc: Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Richard Hughes <rhughes@redhat.com>, linux-i2c@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

thanks for your patch!

On Wed, Sep 10, 2025 at 3:40=E2=80=AFPM Hans de Goede <hansg@kernel.org> wr=
ote:

> From: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
>
> Add a a driver for the GPIO auxbus child device of the Intel USBIO USB
> IO-expander used by the MIPI cameras on various new (Meteor Lake and
> later) Intel laptops.
>
> Co-developed-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Israel Cepeda <israel.a.cepeda.lopez@intel.com>
(...)

> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1448,6 +1448,17 @@ config GPIO_LJCA
>           This driver can also be built as a module. If so, the module
>           will be called gpio-ljca.
>
> +config GPIO_USBIO
> +       tristate "Intel USBIO GPIO support"
> +       depends on USB_USBIO
> +       default USB_USBIO
> +       help
> +         Select this option to enable GPIO driver for the INTEL
> +         USBIO driver stack.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called gpio_usbio.

This is in the wrong submenu (and the GPIO_LJCA is in the
wrong place too, but that's not your problem...)

We have:

menu "USB GPIO expanders"
        depends on USB

So put it in this submeny.

Other than that it looks good, so with that change:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

