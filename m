Return-Path: <linux-gpio+bounces-11103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 805F0996ABF
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 14:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A6DD1F2454B
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 12:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2ABE1990CF;
	Wed,  9 Oct 2024 12:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bx38SKuR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3801990CD
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728478170; cv=none; b=E62mGtbqolLvuY+e/hxV1nToiGpGESBRxUHcT2KSUJzw1AVtaFFHFe+xGlaB6351djskjq/ckBl8oBr9VxovdV1sL6uIvYzVLlQc1KiFa9kwqCBF6bquFor+fjAMkCt/CDXSnqDFaCc9HmU+DrkXFCZhU56K5aO/UssV7dFMadc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728478170; c=relaxed/simple;
	bh=zmKg86BBC/UCHh8J2wejL3pyBpSiXneOPK7uQBs0h04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bzx027IYudy5kZHNWantHzrunrzKTFbRF/IKEoPkkjNQ/bzs02BIFzIoh+sZTy89DJwi6rtDlwYHOZLJI0BTGwVcAioSh4/1BB056XNMSkEfJtq9RbhFB3czt0ok26JStxCD8K5W7EHEmTjTn88D+orQtvQA/fszPefstk0i2VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bx38SKuR; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fad75b46a3so65999801fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2024 05:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728478165; x=1729082965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmKg86BBC/UCHh8J2wejL3pyBpSiXneOPK7uQBs0h04=;
        b=Bx38SKuRkDmQ1rBHVIS0LTtycico0brsqISy2AyQUiJS4Jx9Mpd0sHgOQfPis0cTx2
         6vVs9NitQ0/iVS4bivatQ/iJANbwBUjroOAgUUsHLuYpIbS4gBJmOFPs7imhBQtH5pJ1
         zuEl/gnqQ4F9+kHdTGUPAllVSL8RKE5d8CHL+1sjxVO9y+jKb9odLUfJnpSdGBN9WXIE
         wHHTAe4dVemO8qvfQXVLorM1dHJSW6Hb+1tm0wThErfWt+lYsymbfAmV24Nt+EZpdOfs
         j7wKrbFG9wMjQ0zbF0AHqaGd/2q7xvQktAG18FhiRZ8lKh43FK3UezmMNXrPlKFlpENc
         rjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478165; x=1729082965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmKg86BBC/UCHh8J2wejL3pyBpSiXneOPK7uQBs0h04=;
        b=wsxuX6EQRSi5PzQCskGpDpKPQL/FlH9PfC7V0XALUxaPaIjnBCqsTxAOQazQHyj34p
         6qFGBoifjR+lj72nnAxNGSF9fV0ZKhY32po93sJ8VVE70XCUWGQ2Cr4cM4teQnOLE6zX
         Tf8Fzhs3jNCunVSpk82WhqeypkujlRFNYgoM+F6AhD81xLSOFQSA0j4WFI/3YTx9NSSr
         eL83eDSWe+9DA7wB3zfywNwz71lT8/ktgq1VcysKnOS5M1IMO2+Q2l7wJxJOsyCGrUMC
         0vK0SjaREGizfeLsVlgl6U7grwKuVvfr1U9ZMW5/TLbXPSGrWpBzSL0Nps2oWXBQi6LL
         5qcw==
X-Forwarded-Encrypted: i=1; AJvYcCWU7AR9TiOmyeZwwylJL6NXJOIiObYuArEf25Zq/I7531OWUZaO3H7fSmDiTi+dT33QUysavtaXpPAd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs5EjmQCB3bpLGIQpDw8CSvfa6hMMAl68VRiQ+AimG2foCp584
	uXwUaslm0h6QCe01AbGM8FzqfwV0Mj3sxELW+gl9mTg9vPqsKzM8J80JJlJ22aitjSiaD61pUjN
	VRwaVPgXu7pooydfY02PFeJjevwriBEYH12/oM96GbA86AXJywC4=
X-Google-Smtp-Source: AGHT+IFC8bZo+Ypy/z/+CyIloa16kUAcJSEzdSG5oyJFL4qkl4YFMP9/WcJN3VRB4pyRFymHg+LeYEVW1CrxJKESPeg=
X-Received: by 2002:a2e:bc1a:0:b0:2fa:e4d0:eb4f with SMTP id
 38308e7fff4ca-2fb1872e631mr16576561fa.4.1728478164589; Wed, 09 Oct 2024
 05:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+V-a8vxUjTWccV-wLgy5CJiFYfEMsx-f+8weCJDP6uD_dh4AA@mail.gmail.com>
In-Reply-To: <CA+V-a8vxUjTWccV-wLgy5CJiFYfEMsx-f+8weCJDP6uD_dh4AA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Oct 2024 14:49:13 +0200
Message-ID: <CACRpkdYES8RTLZEWeKginLugUc8bGAvrvtNU6bJr4yGBmMG+RQ@mail.gmail.com>
Subject: Re: [QUERY] : pinmux-pins GPIO interrupt pin
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 11:46=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:

> When using GPIO pins as interrupts with the `gpios` DT property, it
> follows the `gpio_request()`/`gpio_free()` path, and in this case, the
> `pinmux-pins` sysfs file indicates that the pin is claimed by the
> pinctrl/GPIO driver.
>
> However, when the same GPIO pin is used as an interrupt with the
> `interrupts` property, it doesn't follow the
> `gpio_request()`/`gpio_free()` path, and the `pinmux-pins` sysfs file
> shows it as `UNCLAIMED`.
>
> What would be the correct approach when using GPIO pins as interrupts
> with the `interrupts` property?

As mentioned on IRC:

In theory the GPIO and irqchip abstractions are completely orthogonal.

It should be entirely possible to use a GPIO as input GPIO, conveniently lo=
ok
up the IRQ wiith gpiod_to_irq() enable interrupt on it and have that going =
for
a while, then disable IRQs, turn it into an output and bitbang it a bit, th=
en
turn it back into an input and enable IRQs again.

drivers/media/cec/platform/cec-gpio/cec-gpio.c
is a driver that does this complex manouver...

> One possible solution could be to hog the GPIO pin as an input when
> using it as an interrupt with the `interrupts` property, ensuring it
> is claimed by the pinctrl/GPIO driver.

The driver should call these functions from <linux/gpio/driver.h>
to make sure the GPIO is "locked" as IRQ when used as IRQ
by an irqchip:

int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset);
void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset);

This makes it impossible to request the GPIO as output (which
would be a disaster) but it can still be requested as input,
we can read the line even if it is used with IRQs.

Doesn't your GPIO driver call these functions?

Yours,
Linus Walleij

