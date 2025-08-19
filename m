Return-Path: <linux-gpio+bounces-24555-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D19B2C405
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F614176288
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83720215798;
	Tue, 19 Aug 2025 12:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="A4VcPE+Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116B12C11F9;
	Tue, 19 Aug 2025 12:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755607269; cv=none; b=WjRIiLmR9YubfsrVt2EDV0hnl9SdNdJz8PCGJ0srBy7hgmb4GOeQ23K4aFBnw7PaX7Zkdhlv92YNtj9g82vsvhwO+9Xa9IlODhAIiHqC3YxJk3/9eYGJaacL+JxqesA5X8zZOcebD4wCYJlxZivX6fEuO/ZJ8+dS+GqjWvMCq9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755607269; c=relaxed/simple;
	bh=hh0hq8bl+6A83FbnX3IgduD0wlBkscDYAAwjB9LkfIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=At61NfF+uY6nK3w00MRKnsRMulQTDFkZzZuQ51531TqgzLXBrPilVId1ImwhKxszAvTKEXySzVpmAEnqzru9qiJ2Sw8JzQVpUCA9nZatmnmWI/B8PUmrJlU81r4AwmZslgszy9R9ItVZYwoXrMHSiOefgWGnuNsQ5iOH00A5OYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=A4VcPE+Y; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 283F7207A3;
	Tue, 19 Aug 2025 14:41:04 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GITvgjRrHzIi; Tue, 19 Aug 2025 14:41:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1755607263; bh=hh0hq8bl+6A83FbnX3IgduD0wlBkscDYAAwjB9LkfIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A4VcPE+YbdV/CT7PaNypqPsnuGdUcCBS7wgcpvtw336QmE2Ou2imom4xRufhUC0Os
	 WqaGobxZ+5IN2cuyhbfC5eaEr1AWTiBFeoKB4gYM4U973psh0pDp25rT7ZUdhc4JpV
	 MJT3wMKlJh0T/jWQUuwRls5mr0n34CLwQquUd9BzMULi+pCs4BHEBsUkflITJJCpOR
	 CyaGZRanarTubzks3SDZWBM+o89VI35LXtvtwwLZkgGwdl1lOYocJlVoL2zs9ur1Sn
	 Yq2eVrejKEuOFtAb7BRIqeOxIVAna95GYPOVN3fK9TZVSmzXcK0LapcoQssiP2YfK7
	 GJw2uV+uKaDoQ==
Date: Tue, 19 Aug 2025 12:40:54 +0000
From: Yao Zi <ziyao@disroot.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>,
	Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH 2/3] pinctrl: ls2k0300: Support Loongson 2K0300 SoC
Message-ID: <aKRw1pEUUwd4cQoW@pie>
References: <20250811163749.47028-2-ziyao@disroot.org>
 <20250811163749.47028-4-ziyao@disroot.org>
 <CACRpkdZp8FLrxgkeZ=xzSPgny51iDZ3KRCrxpoSdgF8_=df=KQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZp8FLrxgkeZ=xzSPgny51iDZ3KRCrxpoSdgF8_=df=KQ@mail.gmail.com>

On Tue, Aug 19, 2025 at 12:02:23PM +0200, Linus Walleij wrote:
> On Mon, Aug 11, 2025 at 6:39 PM Yao Zi <ziyao@disroot.org> wrote:
> 
> > Support pin multiplexing and drive-strength setting for Loongson 2K0300
> > SoC. Pin multiplexing could be done separately for each pin, while
> > drive-strength could be only configured on function basis. This differs
> > a lot from the driver for previous generation of Loongson SoC, where
> > pinmux setting is based on group.
> >
> > Pins are represented with pinmux properties in devicetrees, and we use
> > the generic pinmux API for parsing. The common pinconf interface isn't
> > used for drive-strength setting, since it handles pinconf settings at a
> > unit of pin groups or smaller.
> >
> > Instead, the driver configures drive-strength settings just after
> > parsing the devicetree. The devicetree's structure ensures no conflicts
> > could happen in drive-strength settings.
> >
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> 
> Overall the driver looks very good, well done!
> 
> Look into Rob's comment on the bindings to use a single node
> for mux and config.

I've raised several questions about the binding and will change the
binding and code according to Rob's answer.

> I saw that you want to make the pin controller strict, if you also have
> some pins with "GPIO mode" that will serve as back-end for a
> GPIO driver (and I saw you posted a GPIO driver series as well)
> then have a look at Bartosz recent patches to add infrastructure
> for pinctrl to know about what a GPIO pin is:
> https://lore.kernel.org/linux-gpio/20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org/T/

Thanks for the link! Actually according to the manual, all the 106 on
2K0300 pins could be multiplexed as GPIO. But the pinctrl cannot set up
any pin config for pins in GPIO mode.

> The current driver does not seem to know about any of these
> pins being usable as GPIO and does not implement those:
> 
>         int (*gpio_request_enable) (struct pinctrl_dev *pctldev,
>                                     struct pinctrl_gpio_range *range,
>                                     unsigned int offset);
>         void (*gpio_disable_free) (struct pinctrl_dev *pctldev,
>                                    struct pinctrl_gpio_range *range,
>                                    unsigned int offset);
>         int (*gpio_set_direction) (struct pinctrl_dev *pctldev,
>                                    struct pinctrl_gpio_range *range,
>                                    unsigned int offset,
>                                    bool input);
>         bool strict;
> 
> Which is fine if the pins actually cannot be used for GPIO, but if they
> can, and this is just implicit for unconfigured pins ... then add
> functions and groups for GPIO.

For 2K0300, we want these pins to be able to multiplexed as GPIOs, but
since this pinctrl driver could configure nothing for GPIO mode pins, I
think it's enough to implement only the gpio_request_enable() callback
and do the multiplexing work here, is this correct?

I originally thought it's okay to multiplex pins as GPIO with an usual
pinctrl configuration, and didn't realize that it causes conflicts on
strict controllers since the pin will be claimed by both pincontroller
and GPIO controller. Thanks for the reminder.

> The other driver using pinconf_generic_parse_dt_pinmux()
> drivers/pinctrl/meson/pinctrl-amlogic-a4.c has GPIO awareness.
> 
> Yours,
> Linus Walleij
> 

Much thanks for the detailed guidance!

Best regards,
Yao Zi

