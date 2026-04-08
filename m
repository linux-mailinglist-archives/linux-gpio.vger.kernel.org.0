Return-Path: <linux-gpio+bounces-34867-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKwuBowE1mnbAQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34867-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 09:32:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BFC3B83E9
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 09:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D256A301700E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 07:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973EB382381;
	Wed,  8 Apr 2026 07:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2dJR7dQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AD9359A8A
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 07:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775633492; cv=none; b=lT2BQq+zUozvI3+jz89+QsFMq9+jByQ+QsuLDnEqPJk7qG1cvUikCQgb1YXBmM9c+pJOX4X1bexkazB86rFaKrGdEE53Hvev5BpE190zrvJE4g7ByKldVJ0/JPsIiyiDQHJqo5HDfkpvA6N83BgmKmvYwXom93Pt49u9R7duI8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775633492; c=relaxed/simple;
	bh=kTCKrQL00F1TtK9Lwc24qq0fGDc6kjFjWFKBMs3ppAI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJbFKYgmRVkKgT47tATE5KSEuE4wBdcpHZxx88WCp1NuQV/g5xqDaAqh8zCph4DU0JIQucjT73oUDOUl2FvzAtYb224Kv4s/nHClOvLHpYxFpKxibfSnHCd8815sdJcgBY9/PKL0G8kxWzuc04KUiSdXLXTbWHgAD68qVW2ynWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2dJR7dQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C262C2BCB3
	for <linux-gpio@vger.kernel.org>; Wed,  8 Apr 2026 07:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775633492;
	bh=kTCKrQL00F1TtK9Lwc24qq0fGDc6kjFjWFKBMs3ppAI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=V2dJR7dQPnPRwc13ZdP55Rlj1GFe4mgJhxJ6yZkIcek7h8pamPD7FeqI+osD7Gp5g
	 udUrN7iGrBo94H7sJ0AwHlqzA1+2K5bnTeRueNwXPWqzfoafJsManetQ2AsrB2rFCI
	 Ju7gA52R+mngm/6yQFaGaWxyrrhLdMcVNz/YOuiN7lBAdhdwXpG75VuUoJOPco0p2U
	 G93sboc+zXveOLyYEE4YHKc7VaJiKXudCCL8RQsmEfIq3YrO/VESiru8soc8HrUMwy
	 aRHylJ3ZXNa4c+4UnszFw0qyR0plSc+XZWaJNeizU9XTmenBY1HmlTlYINhbLJE+sX
	 dNbX8iZ3Ommog==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38dd9c6840aso36832011fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 08 Apr 2026 00:31:31 -0700 (PDT)
X-Gm-Message-State: AOJu0YzfjQ0bdtYGhsevC8NRsggNx++HlStZs89ZEDvG7Q2LbQ5Ybcyg
	kdJEYChzHjx3XH1Xj16xo+EdBysOtp3I6OE0E6rHsvTHHduSsiomPz67PEJBJhgcZbif0KGK/Uh
	QaxonECJNy6V+7oOLpDCoxNUdymp1NfgZsiiUJG+lOA==
X-Received: by 2002:a05:651c:154c:b0:38e:1714:b64e with SMTP id
 38308e7fff4ca-38e1714bf45mr17377281fa.3.1775633490684; Wed, 08 Apr 2026
 00:31:30 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Apr 2026 00:31:29 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Apr 2026 00:31:29 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260408025243.1155482-4-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408025243.1155482-1-eleanor.lin@realtek.com> <20260408025243.1155482-4-eleanor.lin@realtek.com>
Date: Wed, 8 Apr 2026 00:31:29 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfUh_OuxS4SC6QzSOg_PMNc9i9crGYgBASrbVUgHDHSCw@mail.gmail.com>
X-Gm-Features: AQROBzB5exLZ5SG0QSPEWBvRd7DGoi1G63K1Vi7bJ14rkJY_dk0S6b0kTI6vPfY
Message-ID: <CAMRc=MfUh_OuxS4SC6QzSOg_PMNc9i9crGYgBASrbVUgHDHSCw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com, 
	stanley_chang@realtek.com, james.tai@realtek.com, linusw@kernel.org, 
	brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, tychang@realtek.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34867-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 63BFC3B83E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 8 Apr 2026 04:52:42 +0200, Yu-Chun Lin <eleanor.lin@realtek.com> said:
> From: Tzuyi Chang <tychang@realtek.com>
>
> Add support for the GPIO controller found on Realtek DHC RTD1625 SoCs.
>
> Unlike the existing Realtek GPIO driver (drivers/gpio/gpio-rtd.c),
> which manages pins via shared bank registers, the RTD1625 introduces
> a per-pin register architecture. Each GPIO line now has its own
> dedicated 32-bit control register to manage configuration independently,
> including direction, output value, input value, interrupt enable, and
> debounce. Therefore, this distinct hardware design requires a separate
> driver.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v2:
> - Remove "default y".
> - Add base_offset member to struct rtd1625_gpio_info to handle merged regions.
> ---
>  drivers/gpio/Kconfig        |  11 +
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-rtd1625.c | 584 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 596 insertions(+)
>  create mode 100644 drivers/gpio/gpio-rtd1625.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 5ee11a889867..281549ad72ac 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -638,6 +638,17 @@ config GPIO_RTD
>  	  Say yes here to support GPIO functionality and GPIO interrupt on
>  	  Realtek DHC SoCs.
>
> +config GPIO_RTD1625
> +	tristate "Realtek DHC RTD1625 GPIO support"
> +	depends on ARCH_REALTEK || COMPILE_TEST
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  This option enables support for the GPIO controller on Realtek
> +	  DHC (Digital Home Center) RTD1625 SoC.
> +
> +	  Say yes here to support both basic GPIO line functionality
> +	  and GPIO interrupt handling capabilities for this platform.
> +
>  config GPIO_SAMA5D2_PIOBU
>  	tristate "SAMA5D2 PIOBU GPIO support"
>  	depends on MFD_SYSCON
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index c05f7d795c43..c95ba218d53a 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -159,6 +159,7 @@ obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
>  obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
>  obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
>  obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
> +obj-$(CONFIG_GPIO_RTD1625)		+= gpio-rtd1625.o
>  obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
>  obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
>  obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
> diff --git a/drivers/gpio/gpio-rtd1625.c b/drivers/gpio/gpio-rtd1625.c
> new file mode 100644
> index 000000000000..bcc1bbb115fa
> --- /dev/null
> +++ b/drivers/gpio/gpio-rtd1625.c
> @@ -0,0 +1,584 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Realtek DHC RTD1625 gpio driver
> + *
> + * Copyright (c) 2023 Realtek Semiconductor Corp.

No modifications since 2023?

> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/interrupt.h>
> +#include <linux/irqchip.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
> +#define RTD1625_GPIO_DIR BIT(0)
> +#define RTD1625_GPIO_OUT BIT(2)
> +#define RTD1625_GPIO_IN BIT(4)
> +#define RTD1625_GPIO_EDGE_INT_DP BIT(6)
> +#define RTD1625_GPIO_EDGE_INT_EN BIT(8)
> +#define RTD1625_GPIO_LEVEL_INT_EN BIT(16)
> +#define RTD1625_GPIO_LEVEL_INT_DP BIT(18)
> +#define RTD1625_GPIO_DEBOUNCE GENMASK(30, 28)
> +#define RTD1625_GPIO_DEBOUNCE_WREN BIT(31)
> +
> +#define RTD1625_GPIO_WREN(x) ((x) << 1)
> +
> +/* Write-enable masks for all GPIO configs and reserved hardware bits */
> +#define RTD1625_ISO_GPIO_WREN_ALL 0x8000aa8a
> +#define RTD1625_ISOM_GPIO_WREN_ALL 0x800aaa8a
> +
> +#define RTD1625_GPIO_DEBOUNCE_1US 0
> +#define RTD1625_GPIO_DEBOUNCE_10US 1
> +#define RTD1625_GPIO_DEBOUNCE_100US 2
> +#define RTD1625_GPIO_DEBOUNCE_1MS 3
> +#define RTD1625_GPIO_DEBOUNCE_10MS 4
> +#define RTD1625_GPIO_DEBOUNCE_20MS 5
> +#define RTD1625_GPIO_DEBOUNCE_30MS 6
> +#define RTD1625_GPIO_DEBOUNCE_50MS 7
> +
> +#define GPIO_CONTROL(gpio) ((gpio) * 4)
> +
> +/**
> + * struct rtd1625_gpio_info - Specific GPIO register information
> + * @num_gpios: The number of GPIOs
> + * @irq_type_support: Supported IRQ types
> + * @gpa_offset: Offset for GPIO assert interrupt status registers
> + * @gpda_offset: Offset for GPIO deassert interrupt status registers
> + * @level_offset: Offset of level interrupt status register
> + * @write_en_all: Write-enable mask for all configurable bits
> + */
> +struct rtd1625_gpio_info {
> +	unsigned int	num_gpios;
> +	unsigned int	irq_type_support;
> +	unsigned int	base_offset;
> +	unsigned int	gpa_offset;
> +	unsigned int	gpda_offset;
> +	unsigned int	level_offset;
> +	unsigned int	write_en_all;
> +};

Please remove the tabs in the above struct.

> +
> +struct rtd1625_gpio {
> +	struct gpio_chip		gpio_chip;
> +	const struct rtd1625_gpio_info	*info;
> +	void __iomem			*base;
> +	void __iomem			*irq_base;
> +	unsigned int			irqs[3];
> +	raw_spinlock_t			lock;
> +	unsigned int			*save_regs;
> +};

I'd also personally remove these tabs here but won't die on that hill.

> +
> +static unsigned int rtd1625_gpio_gpa_offset(struct rtd1625_gpio *data, unsigned int offset)
> +{
> +	return data->info->gpa_offset + ((offset / 32) * 4);
> +}
> +
> +static unsigned int rtd1625_gpio_gpda_offset(struct rtd1625_gpio *data, unsigned int offset)
> +{
> +	return data->info->gpda_offset + ((offset / 32) * 4);
> +}
> +
> +static unsigned int rtd1625_gpio_level_offset(struct rtd1625_gpio *data, unsigned int offset)
> +{
> +	return data->info->level_offset + ((offset / 32) * 4);
> +}

Looking at these, I'm under the impression that this driver could quite easily
be converted to using gpio-mmio or even gpio-regmap with an MMIO regmap, have
you looked into it by any chance?

Bart

