Return-Path: <linux-gpio+bounces-14065-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B62B9F923E
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 13:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B7A51895F8B
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 12:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1024120FA80;
	Fri, 20 Dec 2024 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="laI+J+F6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0527E20E713
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734697880; cv=none; b=NpzXZveJ1jk3+b10UzsEE7BoRntLl5TiF0d5fq8d2NRL7KOlc76RkQ4iHvBPWkqckh4ds0mQmopjM7IgWhG8w15ufRxL5TgsaaHbFm7qretkfkKf9ChPBcRGPVj0vM/zoiTIhsvca8r0DaXS1iNrk8w9q9e8FU6kevefpSj4PiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734697880; c=relaxed/simple;
	bh=K/GqX6lt5w8J+Rml0vG7Tf8CY/i7DJtERJUYG6W7lW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g40CP9UFe+jzJUFu3krtnXyNtn5YSLgrf90mXtSxRnQ7SU3FPEE+pKdrzAmf2dW1rby7yu3535WQSfhhTagZYHrZtGF6oE3l3ZFyRUrSTwSNeGnasHGgOI2yKEdPUed5QaDbsQDbRQhLpli1l+7OsjyHrQ5/P2dSyoGclyt4yUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=laI+J+F6; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54024ecc33dso2138910e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 04:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734697877; x=1735302677; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ir1V42gRjXc0yY1xGNb20UYWxYH47j634gRykKT6tIQ=;
        b=laI+J+F66SEiCmqx1bCFHNxyg7fqhZTyG1IDHkxwUPbT1NPWYYWzw8Seydj8luGHuo
         MjgQj5NizlsI3o1T2JA6wWDgFVdgY+VpAFimiZujDSYI2+OXzXP+qOTyX+7CxnrESfJE
         e7DsODAWgY3AmAwFyzOFZ56q0b9gXJAG8FufmxZk6hPxttCC9shL2mnvLp8mfu3kKlqD
         64Q8zhb/QqMTmPquHCy8wQAty6b6RaaKWPjmHLfVyrlboK2VoGPLhGWGW/c+hbufwo+/
         1MwgaQMk3FxrVPJbKQo0yISyF4wtOeHFVgUE37ziocqtnFvxKF4q4Gwl+24LaeErSt9Z
         QAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734697877; x=1735302677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ir1V42gRjXc0yY1xGNb20UYWxYH47j634gRykKT6tIQ=;
        b=pTL1Ni+wGplkqWr6ITon3LWs+VneYyeyGP0V9zncszq5dPr+lxlW/tXCoFxfxG5OUz
         x0xYMDKTFsiJci6dRWsUukeGfXVsBnNa0I1421giLawmpPibxEYFulTMBuHwGnCbfclo
         3X/3TKsog38zvYnFyxgWpE3d+AHl7WzV4ZaKeyNYUip4NFElc0GSckcqs8YWomIVN2ND
         MEkYKf8IsIHbtMhTsQHOSzSHxUSs4fwrIE4gor0dSe6FB4Op6g6IQrD/++epI74PBcr+
         /eoXUWTNz3hBhwg4AP0WY+/JAsX8DqsENVdmrL7l7cJAQkWN3cDY5vGpSl6yQmHYxZIf
         4dBw==
X-Forwarded-Encrypted: i=1; AJvYcCUr6eIDj/+FgWSXuE+gmNEaL4yK8qbSupqVGlyWjKATxJPElYKV1C25XPCrN5TaZcR5AspJ85zw/T4v@vger.kernel.org
X-Gm-Message-State: AOJu0YyBbfofab/fwwGdGjcn67inRCuhiNcrNJZyAnl6X/x3UzqYaqCX
	trDAeD8XPYQomnoBSNdiS4HmX98ZLByUQfr1V1NF1Hinudpor5LvX8CeOaEwoAb9Jbxq+EUehly
	rsClO6mcnlNycXlJAUQC/SBW/QBA64zcag16VLg==
X-Gm-Gg: ASbGncvAS5oNSEoVYja68T0jYpuaxQPht4Mjipc0CEu/m2pbNGx/svXv/tScZ9n6Afy
	yNPtQIIO9Of8yHDq8CsezsqZF0rylhr8wbM5Eew==
X-Google-Smtp-Source: AGHT+IEeoqYz80Wd3bVkHJUUrfvTviJCnLJMCqYe1QoYUN3OHj5ylAeaAyTy8s5czE9UdukTGUShxyO/RkZoJm38G70=
X-Received: by 2002:a05:6512:10cc:b0:53d:ed69:a593 with SMTP id
 2adb3069b0e04-5422953ff0amr954401e87.22.1734697877087; Fri, 20 Dec 2024
 04:31:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
 <20241211-aaeon-up-board-pinctrl-support-v1-3-24719be27631@bootlin.com>
In-Reply-To: <20241211-aaeon-up-board-pinctrl-support-v1-3-24719be27631@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:31:06 +0100
Message-ID: <CACRpkdZi-KP2SK4w_Pj_AjQmcSM2miTpAYb7UzWTxtCoqpquuw@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpiolib: add gpiochip_add_pinlist_range() function
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

thanks for your patch!

On Wed, Dec 11, 2024 at 5:27=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> Add gpiochip_add_pinlist_range() function to add a range for GPIO <-> pin
> mapping, using a list of non consecutive pins.
> Previously, it was only possible to add range of consecutive pins using
> gpiochip_add_pin_range().
>
> The struct pinctrl_gpio_range has a 'pins' member which allows to set a
> list of pins (which can be non consecutive). gpiochip_add_pinlist_range()
> is identical to gpiochip_add_pin_range(), except it set 'pins' member
> instead of 'pin_base' member.
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

(...)
> -int gpiochip_add_pin_range(struct gpio_chip *gc, const char *pinctl_name=
,
> -                          unsigned int gpio_offset, unsigned int pin_off=
set,
> -                          unsigned int npins)
> +static int __gpiochip_add_pin_range(struct gpio_chip *gc, const char *pi=
nctl_name,
> +                                   unsigned int gpio_offset, unsigned in=
t pin_offset,
> +                                   unsigned int const *pins, unsigned in=
t npins)

Uh this looks messy and I'm not a fan, sadly.

Overall I dislike __inner_function() syntax, so use some name that
describe what is going on please, but I don't think we wanna do
this at all.

Instead of this hack that start to soften the boundary between GPIO
and pin control drivers, I think it is better to do what we often do
and move the whole GPIO driver over into the pin control driver
and have it all inside one single file, since I suspect the hardware
is supposed to be used as one single unit.

Please look at other combined GPIO+pin control drivers
for inspiration, such as:
pinctrl-stmfx.c
pinctrl-sx150x.c

those just access any registers they need as they are in one
driver, but still maintains the separation by just calling the
existing gpiochip_add_pin_range() and be done with it.

This should remove your need for the strange hacks like this
patch and the gpiochip wrapper in the pin control driver.

Yours,
Linus Walleij

