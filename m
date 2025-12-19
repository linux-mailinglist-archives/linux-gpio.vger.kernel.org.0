Return-Path: <linux-gpio+bounces-29766-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E55CD02BD
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 14:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B627030C71CE
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Dec 2025 13:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F85322A24;
	Fri, 19 Dec 2025 13:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="N+8TfQ5W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352553254A2
	for <linux-gpio@vger.kernel.org>; Fri, 19 Dec 2025 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766152335; cv=none; b=TaoZRzUF/mjOAHqAdRukG1KmmDzJyvkKM9hg2HCCiO5tFQFILJNb7KaX1nBGlFJkGZVQMN2G2CPQx/iFu4Rr/Z2SwfSpUjIaRV8f7Cq3IwRR/jA8Uy+ObO8+u+j1j1EXtZWV3/OBYbSfEmlGaesRh7SjKIm9wHPmmj5xR9keJTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766152335; c=relaxed/simple;
	bh=QVNW9VCkm/Gl2Ow08FMDi4lwS5IZamXnVz2EjK6HCfU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WCF71eGdT2PRmZX/46lyxcTdEtrntEb57BX9bmmCmZ5O5PIS17mmJcgOyQHw+YG8cMcps4H0ySOlBUxrO53NloBTwqIPt+EUCfAR4SdpYH+tpZXpr9eFiV+pi8YAb3ZcxlSnnOR317UaOojOl1VFQH4EDETz758Zw5BAi3s7pbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=N+8TfQ5W; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:8398:f36e:d4f1:2098] (2a02-1812-162c-8f00-8398-f36e-d4f1-2098.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:8398:f36e:d4f1:2098])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 192E16B4540;
	Fri, 19 Dec 2025 14:52:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1766152330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d2o70PZGD0XY2yO/MRFHLYH1C1Zp53KE2ugIGnm80Us=;
	b=N+8TfQ5W7SUe27ub7Aj7pC89Dq14uj+78LyZ1Kb7HjjRdga3hjxd6PxsioYc0nDUNnO+Uz
	RYEzV2wEax/0baM6F6Oub73bUkLxLnrSsgasp7NYlF7sKHIz1FmA61aoDuJ1zvUIwRojEk
	mPoqOMwd3kvO+3rgxxTz2dPQc9SdI4reqI7ngrdzEp8Ur+aADQLc935hoPeWOZcSJYLK9I
	9ozH+2zBkuZzCvtt7E/rvwrvQ2aHZW1phagIuFP3ATozfOwHQX/U3zla7yORilzz3CP1W7
	yIGFbteyxWmwxR3qS58uOyC6UmLinhYYt6yfM2PHAe4X74yHNR6laxk1yXIeEg==
Message-ID: <a8063a3a5eb8055bf88976f9da07175528502144.camel@svanheule.net>
Subject: Re: [PATCH v9 4/6] pinctrl: Add RTL8231 pin control and GPIO support
From: Sander Vanheule <sander@svanheule.net>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael
 Walle	 <mwalle@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Fri, 19 Dec 2025 14:52:08 +0100
In-Reply-To: <CAMRc=Mdb7CWB9PmzXJyfvGjvG0iwuwUgfLuKJuMweRFvAhAoHg@mail.gmail.com>
References: <20251215175115.135294-1-sander@svanheule.net>
	 <20251215175115.135294-5-sander@svanheule.net>
	 <CAMRc=Mdb7CWB9PmzXJyfvGjvG0iwuwUgfLuKJuMweRFvAhAoHg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Bartosz,

On Thu, 2025-12-18 at 01:15 -0800, Bartosz Golaszewski wrote:
> On Mon, 15 Dec 2025 18:51:12 +0100, Sander Vanheule <sander@svanheule.net=
>
> said:
> > This driver implements the GPIO and pin muxing features provided by the
> > RTL8231. The device should be instantiated as an MFD child, where the
> > parent device has already configured the regmap used for register
> > access.
> >=20
> > Debouncing is only available for the six highest GPIOs, and must be
> > emulated when other pins are used for (button) inputs. Although
> > described in the bindings, drive strength selection is currently not
> > implemented.
> >=20
> > Signed-off-by: Sander Vanheule <sander@svanheule.net>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
>=20
> [snip]
>=20
> > +#include <linux/bitfield.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/gpio/regmap.h>
> > +#include <linux/module.h>
> > +#include <linux/pinctrl/pinconf.h>
> > +#include <linux/pinctrl/pinctrl.h>
> > +#include <linux/pinctrl/pinmux.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#include "core.h"
> > +#include "pinmux.h"
> > +#include <linux/mfd/rtl8231.h>
>=20
> Please put this together with other global headers.

Updated here and in the other driver files.

> > +static const unsigned int PWM_PIN =3D 35;
>=20
> Please use the RTL8231 prefix for all symbols.

Added the prefix here and also for a struct defined in this file (rtl8231_.=
..).

> > +static int rtl8231_set_mux(struct pinctrl_dev *pctldev, unsigned int
> > func_selector,
> > + unsigned int group_selector)
> > +{
> > + const struct function_desc *func =3D pinmux_generic_get_function(pctl=
dev,
> > func_selector);
> > + const struct rtl8231_pin_desc *desc =3D
> > rtl8231_pins[group_selector].drv_data;
> > + const struct rtl8231_pin_ctrl *ctrl =3D pinctrl_dev_get_drvdata(pctld=
ev);
> > + enum rtl8231_pin_function func_flag =3D (uintptr_t) func->data;
> > + unsigned int function_mask;
> > + unsigned int gpio_function;
>=20
> Can you put these on the same line here and elsewhere?

I am aware this is often done, and also mentioned in the kernel docs [1], b=
ut I
actually prefer this style and have always used it in my kernel patches.
IMHO placing these on separate lines helps with:
 * readability: every line is either [type] [name] or [type] [name] =3D [va=
lue]
 * reducing churn: changing the type of one variable doesn't impact other l=
ines
 * quickly assessing code complexity: number of local variables is simply t=
he
   number of lines

Editors aren't typically 80x24 anymore. The maximum line length has been re=
laxed
to 100 characters, so I feel like a developer can also be expected to have =
more
lines available on their display nowadays.

[1]
https://docs.kernel.org/6.18/process/maintainer-tip.html#variable-declarati=
ons

> > + /*
> > + * Set every pin that is not muxed as a GPIO to gpio-in. That
> > + * way the pin will be high impedance when it is muxed to GPIO,
> > + * preventing unwanted glitches.
> > + * The pin muxes are left as-is, so there are no signal changes.
> > + */
> > + regmap_field_write(field_dir, is_input | ~is_gpio);
>=20
> This is an MDIO regmap. The operations may fail. Don't you want to check =
the
> return values of regmap routines?

Error checking was indeed not done consistently, so I've now added checks t=
o all
regmap_*() calls that return an error code. Also updated in the other drive=
rs.

> > +
> > +static int rtl8231_pinctrl_init(struct device *dev, struct rtl8231_pin=
_ctrl
> > *ctrl)
> > +{
> > + struct pinctrl_dev *pctldev;
> > + int err;
> > +
> > + err =3D devm_pinctrl_register_and_init(dev->parent, &rtl8231_pctl_des=
c,
> > ctrl, &pctldev);
> > + if (err) {
> > + dev_err(dev, "failed to register pin controller\n");
> > + return err;
>=20
> Please use dev_err_probe() here an elsewhere.

Updated here and in the other drivers.

> > + }
> > +
> > + err =3D rtl8231_pinctrl_init_functions(pctldev, &rtl8231_pctl_desc);
> > + if (err)
> > + return err;
> > +
> > + err =3D pinctrl_enable(pctldev);
> > + if (err)
> > + dev_err(dev, "failed to enable pin controller\n");
> > +
> > + return err;
> > +}
> > +
> > +/*
> > + * GPIO controller functionality
> > + */
> > +static int rtl8231_gpio_reg_mask_xlate(struct gpio_regmap *gpio, unsig=
ned
> > int base,
> > + unsigned int offset, unsigned int *reg, unsigned int *mask)
>=20
> Can you align the start of the line with the opening bracket?

Will do.

Best,
Sander


