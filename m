Return-Path: <linux-gpio+bounces-29731-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41134CCB1CC
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 10:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0895A30161DB
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 09:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B59E2F6928;
	Thu, 18 Dec 2025 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZuHTKuJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4978F30274D
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766049353; cv=none; b=ujoWVS0eD8BTmJXkKgfSsr/CMaqiyjxeBcau52KTPrblNmNsbbB97j8HjlvDdu/g8l2Gvmp44OxxU8TLmF41CnyVhw78nRPXr0htNpBDYLTFygoixUMuvtSSqryzcHT8B0KmljdDyCTVrsqbABR2jKB6lG7kaikTp4G3kBs6Wrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766049353; c=relaxed/simple;
	bh=M8R1W9w45wNbmNXzjsnUtrx48q5+svUbetCOgjF1O4c=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q6rwyzWzjCKySA1gMSt/z8ecc6dIOg72f+faLc1vrNb+DVikM0KWyp5R59z19q+XYlucIZL2lsHD33TMZV/dVM1Y/gTPbwPvx8pCXoqg7oQ00RTrCCMA8E9szjo7BmAAT43iAAzi8V6R93yp1UfEPbr+hHTCpeV54iIHS6HYgRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZuHTKuJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E6BC4CEFB
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 09:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766049352;
	bh=M8R1W9w45wNbmNXzjsnUtrx48q5+svUbetCOgjF1O4c=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=FZuHTKuJwPO5i4CJ75W7oSumG2dfmEC9tIATVMv3hDuRjYtGHD8nhKFJB235FWSVi
	 uQ9UrkHu8qxHCE/oD5QGCVDnrjxSckgkqML1vJM7RIBztF6/jrieuGrSrI590tZKdF
	 oHUMZIY+XRmu32ALTgCVgg3KZl670uLAQicPDWvRGZmxRaUlWhiFMtgBVtsLvmlYjD
	 I80BxYmFVxnmztrq9nrbl1jX36Flq6FJXgZUjmN33Rxka9kctFzSyuw5CuyvFX5fPc
	 2QATw392Homm05Ylt5hln8675TGDtrerUp+LGHZNu2HvyRg70XDezFKakeGgGKzpA3
	 BODBjnJMqyfSA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37a415a22ecso3559121fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 01:15:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUZ2qJzHe4+s+krAz4HmIhmhNgrmucaZDFbMd1tDy5GDClipvZNk0fbC1Pbm85jzldkT6n1dyEsGFnc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9BeUM4I0gSnIsltre4ahb3GIUTlA+TXRlAoaOOyjEtReab50Q
	fGyvr///DsaOu/DuyCB7jYDirVKs4vQlsY0Pl0UspEdvKpaAcdJuXUlI9GXW3wn52HZkrHMkAVE
	GxYLEEggmdjIo3UmjKpD5W0x9/gHa8QbhvF8yav1HqQ==
X-Google-Smtp-Source: AGHT+IGddlJU0seb2vkpl3ywZnH/NWQkhgcnYhtxgt58KbAEeph1cdDhqxyCkCn5cPrFBgqKLU4TcjAMvO/LX7XUeeE=
X-Received: by 2002:a05:651c:548:b0:37a:582b:9ae3 with SMTP id
 38308e7fff4ca-38113272b01mr6430371fa.17.1766049346640; Thu, 18 Dec 2025
 01:15:46 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 18 Dec 2025 01:15:45 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 18 Dec 2025 01:15:45 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20251215175115.135294-5-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215175115.135294-1-sander@svanheule.net> <20251215175115.135294-5-sander@svanheule.net>
Date: Thu, 18 Dec 2025 01:15:45 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mdb7CWB9PmzXJyfvGjvG0iwuwUgfLuKJuMweRFvAhAoHg@mail.gmail.com>
X-Gm-Features: AQt7F2rUvr97O3iEgnnTgHzpdjlYUFzbEonXdFtHgSUK-RNIsoOlIwmvbiCA_I4
Message-ID: <CAMRc=Mdb7CWB9PmzXJyfvGjvG0iwuwUgfLuKJuMweRFvAhAoHg@mail.gmail.com>
Subject: Re: [PATCH v9 4/6] pinctrl: Add RTL8231 pin control and GPIO support
To: Sander Vanheule <sander@svanheule.net>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Michael Walle <mwalle@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Dec 2025 18:51:12 +0100, Sander Vanheule <sander@svanheule.net> said:
> This driver implements the GPIO and pin muxing features provided by the
> RTL8231. The device should be instantiated as an MFD child, where the
> parent device has already configured the regmap used for register
> access.
>
> Debouncing is only available for the six highest GPIOs, and must be
> emulated when other pins are used for (button) inputs. Although
> described in the bindings, drive strength selection is currently not
> implemented.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---

[snip]

> +#include <linux/bitfield.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/regmap.h>
> +#include <linux/module.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include "core.h"
> +#include "pinmux.h"
> +#include <linux/mfd/rtl8231.h>

Please put this together with other global headers.

> +	RTL8231_LED_PIN_DESC(33, RTL8231_REG_PIN_HI_CFG, 1),
> +	RTL8231_LED_PIN_DESC(34, RTL8231_REG_PIN_HI_CFG, 2),
> +	RTL8231_PWM_PIN_DESC(35, RTL8231_REG_FUNC1, 3),
> +	RTL8231_GPIO_PIN_DESC(36, RTL8231_REG_PIN_HI_CFG, 4),
> +};

Newline?

> +static const unsigned int PWM_PIN = 35;

Please use the RTL8231 prefix for all symbols.

> +static int rtl8231_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
> +	unsigned int group_selector)
> +{
> +	const struct function_desc *func = pinmux_generic_get_function(pctldev, func_selector);
> +	const struct rtl8231_pin_desc *desc = rtl8231_pins[group_selector].drv_data;
> +	const struct rtl8231_pin_ctrl *ctrl = pinctrl_dev_get_drvdata(pctldev);
> +	enum rtl8231_pin_function func_flag = (uintptr_t) func->data;
> +	unsigned int function_mask;
> +	unsigned int gpio_function;

Can you put these on the same line here and elsewhere?

> +
> +	if (!(desc->functions & func_flag))
> +		return -EINVAL;
> +
> +	function_mask = BIT(desc->offset);
> +	gpio_function = desc->gpio_function_value << desc->offset;
> +
> +	if (func_flag == RTL8231_PIN_FUNCTION_GPIO)
> +		return regmap_update_bits(ctrl->map, desc->reg, function_mask, gpio_function);
> +	else
> +		return regmap_update_bits(ctrl->map, desc->reg, function_mask, ~gpio_function);

Just drop the else.

> +		/*
> +		 * Set every pin that is not muxed as a GPIO to gpio-in. That
> +		 * way the pin will be high impedance when it is muxed to GPIO,
> +		 * preventing unwanted glitches.
> +		 * The pin muxes are left as-is, so there are no signal changes.
> +		 */
> +		regmap_field_write(field_dir, is_input | ~is_gpio);

This is an MDIO regmap. The operations may fail. Don't you want to check the
return values of regmap routines?

> +
> +static int rtl8231_pinctrl_init(struct device *dev, struct rtl8231_pin_ctrl *ctrl)
> +{
> +	struct pinctrl_dev *pctldev;
> +	int err;
> +
> +	err = devm_pinctrl_register_and_init(dev->parent, &rtl8231_pctl_desc, ctrl, &pctldev);
> +	if (err) {
> +		dev_err(dev, "failed to register pin controller\n");
> +		return err;

Please use dev_err_probe() here an elsewhere.

> +	}
> +
> +	err = rtl8231_pinctrl_init_functions(pctldev, &rtl8231_pctl_desc);
> +	if (err)
> +		return err;
> +
> +	err = pinctrl_enable(pctldev);
> +	if (err)
> +		dev_err(dev, "failed to enable pin controller\n");
> +
> +	return err;
> +}
> +
> +/*
> + * GPIO controller functionality
> + */
> +static int rtl8231_gpio_reg_mask_xlate(struct gpio_regmap *gpio, unsigned int base,
> +	unsigned int offset, unsigned int *reg, unsigned int *mask)

Can you align the start of the line with the opening bracket?

Bart

