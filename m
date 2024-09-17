Return-Path: <linux-gpio+bounces-10232-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5439B97B45A
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 21:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE8361F25764
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 19:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF4A18893F;
	Tue, 17 Sep 2024 19:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g9s4tI9I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF9217B4E5
	for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2024 19:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726601173; cv=none; b=mpuZvMLKqe7H5w/NRyDBwuQbfg9zS+8dHSWcBRw3C+OtZFja+QNzMUpMyK5j8z2qblQoD2JsEMulWZEyJcpsqG2cZQ0EZr0NJAkvkWLSqvTdr3H1rS147uxdKwyBjb7RJW9LTMU61w/l/kaqE3zDEmfr8PIq8Xp8/Ff86uvajEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726601173; c=relaxed/simple;
	bh=liMe9iwi93+dpSBeURQnc46wVTHZXxB/uxVXVNf+IDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JvRJX8I+RHEy2C2r6O41MLDF63ug8AuI21YvHLymqzZxXMIUsAe8ouT7H/SaQbrC5NagCi2Z/HaT0ogxkvy7X1vqml+0V0gB1G4aHfUly0S6mee/AQWD/CD4lH8GgZD0gUfT+vaqVY7vrNP2p9el2eUKbASOpz3PYfadL4IclnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g9s4tI9I; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso75238431fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2024 12:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726601169; x=1727205969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LShiWHIg+F4swBTJEPuCgmaykDqizVljoM2XVKJ6JmU=;
        b=g9s4tI9IJP0+UuIqaaUvM5QJURq+k78HH70rq6TdZgXm0zbU0QA8dbpeZOK+Uqw6e6
         TzbeEGOLBc9UXSLANDDeRhZE9e1pkCP3K94NWmRDjYqwXYMQ63enZRmLF8jgg8ZrI4Nu
         8b/8v5zsJY598IhYx3A7MquOz432MeVqM8N1l8jP0+kN7yMPeInWLz/dmQc3xAoB4RON
         AqsYm5EW2s8HrxcO8b3KaeggZf4Ktw1WNwA/xXUWbALDAewFSjddXGGY0R0hjliAtlR4
         LBdSZ1pES9jgFUtFYIpZtsab06NSa1J31ZguA2F7diohagbFWUI++SxqHOXA0hhbMNIi
         sXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726601169; x=1727205969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LShiWHIg+F4swBTJEPuCgmaykDqizVljoM2XVKJ6JmU=;
        b=Pss50/Jjh75C8KiFVrkrSDbxs5uvnukWBNljZhbUfZsgV0cLgZlA+JudKWSt+UCVE4
         kcZ1y7g9PFALt2BmCDb4gaK9C3ylxasR1UkeVUQbt1oKXF0aQcnk+TfECds8sXGO8FjD
         Se/sPK1Q3sB3fo2CzrC646svvEP2lk+cjQW6ahJ8Eq7371w33aEtfMH+Byvbo1ggjXMf
         dZ0CY6yIjKRUeOQZX3VNbOMMRctpzDLc6C1P+MHfCq+W4WejGsi3Bcsr2+BNXTO3Ysm4
         +t5mpR1Lucbre6rnG/sWwLLSpQ16Q8p3ANH/JUsZ3U6SVYFVpnMyRA6p4TfQvTBBVPRy
         IHfw==
X-Forwarded-Encrypted: i=1; AJvYcCWfIl0bnHXdfm+EEozfXWKoSplw8WXbOTVqCeP+3P7etMX7WZkuhAbNZbTHToVRipiamcnVsgP3M6SH@vger.kernel.org
X-Gm-Message-State: AOJu0YypY00G3ezvuBxaNX6s9InSICi2if0i7GBTYZ3Xt0wZrdOlmqct
	rGnpy+9KxSxGd6z/7vxn5ZsUiGFuYflTTAtohzWh0z1vRbZ625RMSaDaM9Cz7Qb8aLCRWYphxBx
	1yN9Tw10eeeGpwWj5LezMFk5NoaahZe3N5KZlrA==
X-Google-Smtp-Source: AGHT+IHp7mvP4Yiy062HmDCtGTcMl9uLDuiOfffwb5UzggCbfmiXWDAlopJqHwK8zUo4d3iwjlUhXSsgQoKP/vCx7ec=
X-Received: by 2002:a05:651c:1992:b0:2ef:251f:785 with SMTP id
 38308e7fff4ca-2f787da4fc2mr116438661fa.1.1726601168627; Tue, 17 Sep 2024
 12:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503-congatec-board-controller-v2-0-681511a01c8f@bootlin.com> <20240503-congatec-board-controller-v2-2-681511a01c8f@bootlin.com>
In-Reply-To: <20240503-congatec-board-controller-v2-2-681511a01c8f@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Sep 2024 21:25:56 +0200
Message-ID: <CACRpkdbtwF-k3fHFvpXD+m8KN2XCt56X=iOXbideds0v+LWqWw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] gpio: Congatec Board Controller gpio driver
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, blake.vermeer@keysight.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

thanks for your patch!

Some comments:

On Tue, Sep 17, 2024 at 7:00=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Add gpio support for the Congatec Board Controller.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

That's a bit terse commit message. At least mention that it sits under
the MFD.

> @@ -233,6 +233,16 @@ config GPIO_CADENCE
>         help
>           Say yes here to enable support for Cadence GPIO controller.
>
> +config GPIO_CGBC
> +       tristate "Congatec Board Controller GPIO support"
> +       depends on MFD_CGBC
> +       help
> +         Select this option to enable GPIO support for the Congatec Boar=
d
> +         Controller.
> +
> +         This driver can also be built as a module. If so, the module wi=
ll be
> +         called gpio-cgbc.
> +
>  config GPIO_CLPS711X

This is in the middle of the memory-mapped GPIO drivers.

This is not a memory-mapped driver.

Move it down in the menu to the submenu for MFD GPIO
drivers please.

> +static void __cgbc_gpio_set(struct gpio_chip *chip,
> +                           unsigned int offset, int value)
> +{
> +       struct cgbc_gpio_data *gpio =3D gpiochip_get_data(chip);
> +       struct cgbc_device_data *cgbc =3D gpio->cgbc;
> +       u8 val;
> +       int ret;
> +
> +       ret =3D cgbc_gpio_cmd(cgbc, CGBC_GPIO_CMD_GET, (offset > 7) ? 1 :=
 0, 0, &val);
> +       if (ret)
> +               return;
> +
> +       if (value)
> +               val |=3D BIT(offset % 8);
> +       else
> +               val &=3D ~((u8)BIT(offset % 8));

Is that cast really needed? (If you tried without and it
cause compilation problems, I believe you, if someone
smarter than me said it should be there, ignore me.)

> +       if (direction =3D=3D GPIO_LINE_DIRECTION_IN)
> +               val &=3D ~((u8)BIT(offset % 8));

Dito.

Apart from this it looks very nice, so with the above
addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

