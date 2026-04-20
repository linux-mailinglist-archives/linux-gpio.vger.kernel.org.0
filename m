Return-Path: <linux-gpio+bounces-35247-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDo7NQ7x5WnCpQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35247-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 11:25:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C37CC428CFE
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 11:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 893B1300B9E2
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 09:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3470538C40C;
	Mon, 20 Apr 2026 09:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5x+ULXv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA123277029
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 09:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776677127; cv=none; b=F59rck2Omwpy+unZjPs9rfl6/25xK9Ad4NxCnJvCxe0buOZaD1jkBafL/M0LGqNqz9Gb+zY41lOeyI5D4/k9H8hoNLzo9hkhuBvSTcIG9N9Ykp8msGUYxkZNyyrfg0pHwL9u8bSsR0MOzgovSpLhCvTOQyYXmpmFcn7FGAvH6TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776677127; c=relaxed/simple;
	bh=5a1WQBOBFxuhVU/nscZ1Dt/ay0RNPTrPTmrXYOYO3NY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O/jgYV0IM4zul3Hf2YIb/oCi/S9n2KaMQSlW/9eruz1/1LFCibZlwXneFxrmzy8G9IIbemR6HCkyDhimJmApbIFR4k91LHQ03yR/6kpRmJzJ7ZREo5EqchvmHY1ojp229Ey+EHQ1hzvaS2ypzHT92+H2t3Ojkw9M1UcS4jeP+nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5x+ULXv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC532C2BCB7
	for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 09:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776677126;
	bh=5a1WQBOBFxuhVU/nscZ1Dt/ay0RNPTrPTmrXYOYO3NY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=D5x+ULXvolACViuqq5E+38ONhYqHOT14EmL8mD9bo7AIV5YGtwaAcAvUxQaM7LMDp
	 NRm1se/ecZHIjkDfxFESN+o0Z5H8x5POlkeicPzJEm5fHKax9ix436Oc4SMKtypKcv
	 4yDqP29Z0tNoqRwWlPPTUFFkyakuUZAESSa2aZM+jcm3d1zZ1WdOvkksE9sB3+6+9U
	 IdTk8gB4UAO68cJsTjx45XK5Psu6Re3SfkS3z22a2rDhED4AfnVOsvvZC8ji6OFgqg
	 dk8P4Uc63pMHS0OL9ryrvAZMs7nBHfcZyDAPjuRWamKAXSb1PemEjjz+Gqj8weOdRf
	 E+0nF4FBQ8LEg==
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c565476d7so5414377c88.1
        for <linux-gpio@vger.kernel.org>; Mon, 20 Apr 2026 02:25:26 -0700 (PDT)
X-Gm-Message-State: AOJu0YzZ/a8OXp/s483T7QP/VMBHtKrk11GWgRvqFeaSqGaDYV94pbEa
	X51yoYATg6pWOLQe/zdug1gYu1+6QkXOhz2cA5UHAMlJoMRdu/iPrJgwbNYKDar/AVHff/5DjuB
	Jgp3V8j9oEvLgYGNlYUJm37HAB4+d2b6NZtd+VUdwYQ==
X-Received: by 2002:a05:7022:eac8:b0:128:d386:4bbb with SMTP id
 a92af1059eb24-12c73f759d9mr6984938c88.13.1776677125788; Mon, 20 Apr 2026
 02:25:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Apr 2026 02:25:22 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Apr 2026 02:25:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260414-axiado-ax3000-sgpio-controller-v1-2-b5c7e4c2e69b@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
 <20260414-axiado-ax3000-sgpio-controller-v1-2-b5c7e4c2e69b@axiado.com>
Date: Mon, 20 Apr 2026 02:25:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfN4qc-Oz-_ErukxqwKbhg3aUHO-LWWvvGGcJAMwfP+5g@mail.gmail.com>
X-Gm-Features: AQROBzCVykMLHfvx--YZ5vkX1KE4og7C-e65wmJHU6KkHcPp3z4r-0dCSLkMfBU
Message-ID: <CAMRc=MfN4qc-Oz-_ErukxqwKbhg3aUHO-LWWvvGGcJAMwfP+5g@mail.gmail.com>
Subject: Re: [PATCH 2/3] gpio: axiado: add SGPIO controller support
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35247-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,axiado.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C37CC428CFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 14 Apr 2026 15:48:33 +0200, Petar Stepanovic
<pstepanovic@axiado.com> said:
> Add support for the Axiado SGPIO controller.
>
> The controller provides a serialized interface for GPIOs with
> configurable direction and interrupt support.
>
> The driver registers the controller as a gpio_chip and uses
> regmap for register access.
>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> ---
>  drivers/gpio/Kconfig             |  18 +
>  drivers/gpio/Makefile            |   1 +
>  drivers/gpio/gpio-axiado-sgpio.c | 780 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 799 insertions(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index bd185482a7fd..42c56d157092 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -198,6 +198,24 @@ config GPIO_ATH79
>  	  Select this option to enable GPIO driver for
>  	  Atheros AR71XX/AR724X/AR913X SoC devices.
>
> +config GPIO_AXIADO_SGPIO
> +	bool "Axiado SGPIO support"
> +	depends on OF_GPIO

You don't need this.

> +	depends on ARCH_AXIADO || COMPILE_TEST
> +	select GPIO_GENERIC

You don't seem to be using this.

> +	select GPIOLIB_IRQCHIP
> +	select REGMAP
> +	help
> +	  Enable support for the Axiado Serial GPIO (SGPIO) controller.
> +
> +	  The SGPIO controller provides a serialized interface for
> +	  controlling multiple GPIO signals over a limited number of
> +	  physical lines. It supports configurable data direction and
> +	  interrupt handling.
> +
> +	  This driver integrates with the Linux GPIO subsystem and
> +	  exposes the controller as a standard GPIO provider.
> +
>  config GPIO_RASPBERRYPI_EXP
>  	tristate "Raspberry Pi 3 GPIO Expander"
>  	default RASPBERRYPI_FIRMWARE
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 2421a8fd3733..909a97551807 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -42,6 +42,7 @@ obj-$(CONFIG_GPIO_ARIZONA)		+= gpio-arizona.o
>  obj-$(CONFIG_GPIO_ASPEED)		+= gpio-aspeed.o
>  obj-$(CONFIG_GPIO_ASPEED_SGPIO)		+= gpio-aspeed-sgpio.o
>  obj-$(CONFIG_GPIO_ATH79)		+= gpio-ath79.o
> +obj-$(CONFIG_GPIO_AXIADO_SGPIO)		+= gpio-axiado-sgpio.o
>  obj-$(CONFIG_GPIO_BCM_KONA)		+= gpio-bcm-kona.o
>  obj-$(CONFIG_GPIO_BCM_XGS_IPROC)	+= gpio-xgs-iproc.o
>  obj-$(CONFIG_GPIO_BD71815)		+= gpio-bd71815.o
> diff --git a/drivers/gpio/gpio-axiado-sgpio.c b/drivers/gpio/gpio-axiado-sgpio.c
> new file mode 100644
> index 000000000000..8cd349ec6f53
> --- /dev/null
> +++ b/drivers/gpio/gpio-axiado-sgpio.c
> @@ -0,0 +1,780 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2022-2026 Axiado Corporation
> + */

Please add a blank line here...

> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/spinlock.h>
> +
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +
> +#include <linux/gpio/driver.h>
> +
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +
> +#include <linux/regmap.h>
> +

... and keep the includes together as well as ordered alphabetically.

> +struct sgpio_reg_offsets {
> +	u32 mux_0;
> +	u32 preset_0;
> +	u32 count_0;
> +	u32 pos_0;
> +
> +	u32 mux_1;
> +	u32 ld;
> +	u32 ld_ss;
> +
> +	u32 preset_1;
> +	u32 count_1;
> +	u32 pos_1;
> +
> +	u32 mux_2;
> +	u32 dout;
> +	u32 dout_ss;
> +
> +	u32 preset_2;
> +	u32 count_2;
> +	u32 pos_2;
> +
> +	u32 mux_3;
> +	u32 preset_3;
> +	u32 count_3;
> +	u32 pos_3;
> +
> +	u32 mux_4;
> +	u32 oe;
> +	u32 oe_ss;
> +
> +	u32 preset_4;
> +	u32 count_4;
> +	u32 pos_4;
> +
> +	u32 mask;
> +	u32 ctrl_en;
> +	u32 ctrl_en_pos;
> +
> +	u32 din_ss;
> +	u32 status;
> +};
> +
> +static const struct sgpio_reg_offsets sgpio_offsets_512 = {
> +	.mux_0 = 0x000,
> +	.preset_0 = 0x1dc,
> +	.count_0 = 0x1f0,
> +	.pos_0 = 0x204,
> +
> +	.mux_1 = 0x004,
> +	.ld = 0x014,
> +	.ld_ss = 0x0d8,
> +
> +	.preset_1 = 0x1e0,
> +	.count_1 = 0x1f4,
> +	.pos_1 = 0x208,
> +
> +	.mux_2 = 0x008,
> +	.dout = 0x054,
> +	.dout_ss = 0x158,
> +
> +	.preset_2 = 0x1e4,
> +	.count_2 = 0x1f8,
> +	.pos_2 = 0x20c,
> +
> +	.mux_3 = 0x00c,
> +	.preset_3 = 0x1e8,
> +	.count_3 = 0x1fc,
> +	.pos_3 = 0x210,
> +
> +	.mux_4 = 0x010,
> +	.oe = 0x0d4,
> +	.oe_ss = 0x1d8,
> +
> +	.preset_4 = 0x1ec,
> +	.count_4 = 0x200,
> +	.pos_4 = 0x214,
> +
> +	.mask = 0x224,
> +	.ctrl_en = 0x218,
> +	.ctrl_en_pos = 0x21c,
> +
> +	.din_ss = 0x198,
> +	.status = 0x228,
> +};
> +
> +static const struct sgpio_reg_offsets sgpio_offsets_128 = {
> +	.mux_0 = 0x000,
> +	.preset_0 = 0x08c,
> +	.count_0 = 0x0a0,
> +	.pos_0 = 0x0b4,
> +
> +	.mux_1 = 0x004,
> +	.ld = 0x014,
> +	.ld_ss = 0x048,
> +
> +	.preset_1 = 0x090,
> +	.count_1 = 0x0a4,
> +	.pos_1 = 0x0b8,
> +
> +	.mux_2 = 0x008,
> +	.dout = 0x024,
> +	.dout_ss = 0x068,
> +
> +	.preset_2 = 0x094,
> +	.count_2 = 0x0a8,
> +	.pos_2 = 0x0bc,
> +
> +	.mux_3 = 0x00c,
> +	.preset_3 = 0x098,
> +	.count_3 = 0x0ac,
> +	.pos_3 = 0x0c0,
> +
> +	.mux_4 = 0x010,
> +	.oe = 0x044,
> +	.oe_ss = 0x088,
> +
> +	.preset_4 = 0x09c,
> +	.count_4 = 0x0b0,
> +	.pos_4 = 0x0c4,
> +
> +	.mask = 0x0d4,
> +	.ctrl_en = 0x0c8,
> +	.ctrl_en_pos = 0x0cc,
> +
> +	.din_ss = 0x078,
> +	.status = 0x0d8,
> +};
> +
> +#define MAX_SGPIO_PINS 512
> +#define MAX_OFFSET_REG 16
> +#define MAX_SLICE_COUNT 5
> +
> +struct ax3000_slice_info {
> +	u32 out_mux;
> +	u32 sgpio_mux;
> +	u32 slice_mux;
> +	u32 reg[MAX_OFFSET_REG];
> +	u32 reg_ss[MAX_OFFSET_REG];
> +	u32 preset;
> +	u32 count;
> +	u32 pos;
> +};
> +
> +struct ax3000_sgpio {
> +	u32 preset_value;
> +	u32 count_value;
> +	u32 pos_reg;
> +	struct ax3000_slice_info
> +		slices[MAX_SLICE_COUNT]; /* 0=clk,1=load,2=out,3=in,4=oe */
> +	spinlock_t lock;
> +	int ngpios;
> +	int max_sgpio_pins;
> +	int max_offset_regs;
> +	struct gpio_chip chip;
> +	u32 irq_unmasked[MAX_SGPIO_PINS];
> +	int parent_irq;
> +	struct regmap *regmap;
> +	u32 regmap_base_offset;
> +	struct sgpio_reg_offsets *regs;
> +};
> +
> +static int sgpio_set_irq_type(struct irq_data *d, unsigned int type);
> +static void sgpio_mask_irq(struct irq_data *d);
> +static void sgpio_unmask_irq(struct irq_data *d);
> +static void sgpio_irq_shutdown(struct irq_data *d);
> +
> +static const struct irq_chip axiado_sgpio_irqchip = {
> +	.name = "axiado-sgpio",
> +	.irq_mask = sgpio_mask_irq,
> +	.irq_unmask = sgpio_unmask_irq,
> +	.irq_set_type = sgpio_set_irq_type,
> +	.irq_shutdown = sgpio_irq_shutdown,
> +	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
> +};
> +
> +static void ax3000_sgpio_set(struct gpio_chip *chip, unsigned int offset,
> +			     int value)
> +{
> +	struct ax3000_sgpio *sgpio = gpiochip_get_data(chip);
> +	unsigned long flags;
> +	u32 bank = (offset / 2) / 32;
> +	u32 position = (offset / 2) % 32;
> +
> +	spin_lock_irqsave(&sgpio->lock, flags);

Please use guards for locks.

> +	if (value)
> +		sgpio->slices[2].reg_ss[bank] |= BIT(position);
> +	else
> +		sgpio->slices[2].reg_ss[bank] &= ~BIT(position);
> +
> +	spin_unlock_irqrestore(&sgpio->lock, flags);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->dout_ss +
> +			     (bank * 4),
> +		     sgpio->slices[2].reg_ss[bank]);
> +}
> +
> +static int ax3000_sgpio_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct ax3000_sgpio *sgpio = gpiochip_get_data(chip);
> +	u32 bank = (offset / 2) / 32;
> +	u32 position = (offset / 2) % 32;
> +
> +	if (offset % 2 == 0)
> +		return !!(sgpio->slices[3].reg_ss[bank] & BIT(position));
> +	else
> +		return !!(sgpio->slices[2].reg_ss[bank] & BIT(position));
> +}
> +
> +static int ax3000_sgpio_dir_in(struct gpio_chip *chip, unsigned int offset)
> +{
> +	if (!(offset % 2))
> +		return 0;
> +	else
> +		return -EINVAL;
> +}
> +
> +static int ax3000_sgpio_dir_out(struct gpio_chip *chip, unsigned int offset,
> +				int value)
> +{
> +	if (offset % 2) {
> +		if (chip->set)
> +			chip->set(chip, offset, value);
> +		return 0;
> +	} else {
> +		return -EINVAL;
> +	}
> +}
> +
> +static irqreturn_t sgpio_irq_handler(int irq, void *arg)
> +{
> +	struct ax3000_sgpio *sgpio = (struct ax3000_sgpio *)arg;
> +	unsigned long flags;
> +	u32 status, new_value;
> +	u32 changed_value;
> +	int i, bit, reg_ptr;
> +
> +	/* Read-on-clear (ACK) parent cause */
> +	regmap_read(sgpio->regmap,
> +		    sgpio->regmap_base_offset + sgpio->regs->status, &status);
> +	status >>= 16;
> +
> +	bool has_shifted_layout = (sgpio->max_offset_regs == MAX_OFFSET_REG);
> +
> +	reg_ptr = has_shifted_layout ? 16 - DIV_ROUND_UP(sgpio->ngpios, 32) : 0;
> +
> +	for (i = 0; i < DIV_ROUND_UP(sgpio->ngpios, 32); i++, reg_ptr++) {
> +		if (status & BIT(reg_ptr)) {
> +			regmap_read(sgpio->regmap,
> +				    sgpio->regmap_base_offset +
> +					    sgpio->regs->din_ss + (reg_ptr * 4),
> +				    &new_value);
> +			spin_lock_irqsave(&sgpio->lock, flags);
> +			changed_value = sgpio->slices[3].reg_ss[i] ^ new_value;
> +			sgpio->slices[3].reg_ss[i] = new_value;
> +			spin_unlock_irqrestore(&sgpio->lock, flags);
> +
> +			while (changed_value) {
> +				bit = __ffs(changed_value);
> +				changed_value &= ~BIT(bit);
> +
> +				irq_hw_number_t hwirq = i * 32 + bit;
> +
> +				if (sgpio->irq_unmasked[hwirq]) {
> +					unsigned int child_irq;
> +
> +					child_irq = irq_find_mapping(sgpio->chip.irq.domain,
> +								     hwirq);
> +
> +					if (child_irq)
> +						handle_nested_irq(child_irq);
> +				}
> +			}
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void sgpio_hw_init(struct ax3000_sgpio *sgpio)
> +{
> +	u32 bank;
> +	u32 position;
> +	int i = 0;
> +	bool has_shifted_layout = (sgpio->max_offset_regs == MAX_OFFSET_REG);
> +
> +	/* slice A0, Clock Pin - 0 */
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->mux_0, 0x306);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->preset_0,
> +		     sgpio->preset_value);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->count_0,
> +		     sgpio->count_value);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->pos_0, 0x1f001f);
> +
> +	/* Slice B1, Data Load Pin - 1 */
> +	bank = (sgpio->ngpios - 1) / 32;
> +	position = (sgpio->ngpios - 1) % 32;
> +
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->mux_1,
> +		     has_shifted_layout ? 0x30c : 0x304);
> +
> +	for (i = 0; i < bank; i++) {
> +		regmap_write(sgpio->regmap,
> +			     sgpio->regmap_base_offset + sgpio->regs->ld +
> +				     (i * 4),
> +			     0xffffffff);
> +		regmap_write(sgpio->regmap,
> +			     sgpio->regmap_base_offset + sgpio->regs->ld_ss +
> +				     (i * 4),
> +			     0xffffffff);
> +	}
> +
> +	if (position) {
> +		u32 val;
> +
> +		val = sgpio->slices[1].reg_ss[i];
> +		val |= GENMASK(position - 1, 0);
> +
> +		regmap_write(sgpio->regmap,
> +			     sgpio->regmap_base_offset + sgpio->regs->ld +
> +				     (i * 4),
> +			     val);
> +		regmap_write(sgpio->regmap,
> +			     sgpio->regmap_base_offset + sgpio->regs->ld_ss +
> +				     (i * 4),
> +			     val);
> +	}
> +
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->preset_1,
> +		     sgpio->preset_value);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->count_1,
> +		     sgpio->count_value);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->pos_1,
> +		     sgpio->pos_reg);
> +
> +	/* Slice C2, Data Out Pin - 2 */
> +	bank = sgpio->ngpios / 32;
> +	position = sgpio->ngpios % 32;
> +
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->mux_2,
> +		     has_shifted_layout ? 0x30c : 0x304);
> +
> +	for (i = 0; i < bank; i++) {
> +		regmap_write(sgpio->regmap,
> +			     sgpio->regmap_base_offset + sgpio->regs->dout +
> +				     (i * 4),
> +			     sgpio->slices[2].reg_ss[i]);
> +		regmap_write(sgpio->regmap,
> +			     sgpio->regmap_base_offset + sgpio->regs->dout_ss +
> +				     (i * 4),
> +			     sgpio->slices[2].reg_ss[i]);
> +	}
> +
> +	if (position) {
> +		regmap_write(sgpio->regmap,
> +			     sgpio->regmap_base_offset + sgpio->regs->dout +
> +				     (i * 4),
> +			     sgpio->slices[2].reg_ss[i]);
> +		regmap_write(sgpio->regmap,
> +			     sgpio->regmap_base_offset + sgpio->regs->dout_ss +
> +				     (i * 4),
> +			     sgpio->slices[2].reg_ss[i]);
> +	}
> +
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->preset_2,
> +		     sgpio->preset_value);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->count_2,
> +		     sgpio->count_value);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->pos_2,
> +		     sgpio->pos_reg);
> +
> +	/* Slice D3, Data In Pin - 3 */
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->mux_3, 0x14C);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->preset_3,
> +		     sgpio->preset_value);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->count_3,
> +		     sgpio->count_value);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->pos_3,
> +		     sgpio->pos_reg);
> +
> +	/* Slice E4, Output Enable for respective pins */
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->mux_4,
> +		     has_shifted_layout ? 0x10c : 0x104);
> +	regmap_write(sgpio->regmap, sgpio->regmap_base_offset + sgpio->regs->oe,
> +		     0xffffffff);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->oe_ss,
> +		     0xffffffff);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->preset_4,
> +		     sgpio->preset_value);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->count_4,
> +		     sgpio->count_value);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->pos_4, 0x1f001f);
> +
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->mask, 0xdfff);
> +
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->ctrl_en, 0xffff);
> +	regmap_write(sgpio->regmap,
> +		     sgpio->regmap_base_offset + sgpio->regs->ctrl_en_pos,
> +		     0xffff);
> +}
> +
> +static int sgpio_set_irq_type(struct irq_data *d, unsigned int type)
> +{
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_BOTH:
> +	case IRQ_TYPE_EDGE_RISING:
> +	case IRQ_TYPE_EDGE_FALLING:
> +		irq_set_handler_locked(d, handle_edge_irq);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void sgpio_mask_irq(struct irq_data *d)
> +{
> +	struct gpio_chip *chip;
> +	struct ax3000_sgpio *sgpio;
> +	u32 irq_num;
> +
> +	chip = irq_data_get_irq_chip_data(d);
> +	if (!chip) {
> +		pr_err("Unable to get gpio_chip for IRQ\n");
> +		return;
> +	}
> +
> +	sgpio = gpiochip_get_data(chip);
> +	if (!sgpio) {
> +		pr_err("Unable to get chip data\n");
> +		return;
> +	}
> +
> +	irq_num = irqd_to_hwirq(d);
> +	sgpio->irq_unmasked[irq_num / 2] = 0;
> +}
> +
> +static void sgpio_unmask_irq(struct irq_data *d)
> +{
> +	struct gpio_chip *chip;
> +	struct ax3000_sgpio *sgpio;
> +	u32 irq_num;
> +
> +	chip = irq_data_get_irq_chip_data(d);
> +	if (!chip) {
> +		pr_err("Unable to get gpio_chip for IRQ\n");
> +		return;
> +	}
> +
> +	sgpio = gpiochip_get_data(chip);
> +	if (!sgpio) {
> +		pr_err("Unable to get chip data\n");
> +		return;
> +	}
> +
> +	irq_num = irqd_to_hwirq(d);
> +	sgpio->irq_unmasked[irq_num / 2] = 1;
> +}
> +
> +static void sgpio_irq_shutdown(struct irq_data *d)
> +{
> +	sgpio_mask_irq(d);
> +}
> +
> +static int sgpio_probe(struct platform_device *pdev)
> +{
> +	int rc;
> +	int irq;
> +	int i;
> +	const __be32 *prop;
> +	struct gpio_irq_chip *girq;
> +	struct ax3000_sgpio *sgpio;
> +	u32 variant;
> +	u32 dout_value;
> +	u32 bus_frequency;
> +	u32 apb_frequency;
> +	int dout_reverse;
> +
> +	void __iomem *base;
> +
> +	const struct regmap_config regmap_config = {
> +		.reg_bits = 32,
> +		.val_bits = 32,
> +		.reg_stride = 4,
> +	};
> +
> +	sgpio = devm_kzalloc(&pdev->dev, sizeof(*sgpio), GFP_KERNEL);
> +	if (!sgpio)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&sgpio->lock);
> +
> +	sgpio->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +
> +	if (sgpio->regmap) {
> +		rc = of_property_read_u32(pdev->dev.of_node, "reg",
> +					  &sgpio->regmap_base_offset);

Why are you mixing of_property_*() with device_property_*()?

> +		if (rc) {
> +			dev_err(&pdev->dev, "Failed to read reg property: %d\n",
> +				rc);
> +			return rc;
> +		}
> +		dev_info(&pdev->dev, "Using regmap with base offset: 0x%x\n",
> +			 sgpio->regmap_base_offset);
> +	} else {
> +		base = devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(base))
> +			return PTR_ERR(base);
> +
> +		sgpio->regmap =
> +			devm_regmap_init_mmio(&pdev->dev, base, &regmap_config);
> +
> +		if (IS_ERR(sgpio->regmap))
> +			return PTR_ERR(sgpio->regmap);
> +
> +		sgpio->regmap_base_offset = 0;
> +
> +		dev_info(&pdev->dev, "Using MMIO regmap\n");
> +	}
> +
> +	rc = device_property_read_u32(&pdev->dev, "ngpios", &sgpio->ngpios);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "Could not read ngpios property\n");
> +		return -EINVAL;
> +	}
> +
> +	if (device_property_read_u32(&pdev->dev, "design-variant", &variant)) {
> +		dev_err(&pdev->dev, "design-variant not specified in DT\n");
> +		return -EINVAL;
> +	}
> +
> +	if (variant == 128) {
> +		sgpio->regs = &sgpio_offsets_128;
> +		sgpio->max_sgpio_pins = 128;
> +		sgpio->max_offset_regs = 4;
> +	} else if (variant == 512) {
> +		sgpio->regs = &sgpio_offsets_512;
> +		sgpio->max_sgpio_pins = 512;
> +		sgpio->max_offset_regs = 16;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	if (sgpio->ngpios > sgpio->max_sgpio_pins) {
> +		dev_err(&pdev->dev, "ngpio is greater than 512 pins\n");
> +		return -EINVAL;
> +	}
> +
> +	rc = device_property_read_u32(&pdev->dev, "bus-frequency",
> +				      &bus_frequency);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "Could not read bus-frequency property\n");
> +		return -EINVAL;
> +	}
> +
> +	rc = device_property_read_u32(&pdev->dev, "apb-frequency",
> +				      &apb_frequency);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "Could not read apb-frequency property\n");
> +		return -EINVAL;
> +	}
> +
> +	sgpio->preset_value = (apb_frequency / bus_frequency) - 1;
> +	sgpio->count_value = sgpio->preset_value;
> +
> +	u32 pos;
> +
> +	pos = sgpio->ngpios - 1;
> +	sgpio->pos_reg = (pos << 16) | pos;
> +
> +	prop = of_get_property(pdev->dev.of_node, "dout-init", NULL);
> +	if (!prop) {
> +		dev_err(&pdev->dev, "Failed to get dout-init\n");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < sgpio->max_offset_regs; i++) {
> +		sgpio->slices[2].reg_ss[i] = 0;
> +		dout_value = be32_to_cpu(prop[i]);
> +
> +		for (dout_reverse = 0; dout_reverse < 32; ++dout_reverse) {
> +			sgpio->slices[2].reg_ss[i] <<= 1;
> +			sgpio->slices[2].reg_ss[i] |= (dout_value & 1);
> +			dout_value >>= 1;
> +		}
> +	}
> +
> +	sgpio_hw_init(sgpio);
> +
> +	irq = platform_get_irq(pdev, 0);
> +

Unnecessary newline.

> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "Failed to get parent IRQ: %d\n", irq);
> +		return irq;
> +	}
> +	/* Store parent IRQ for cleanup */
> +	sgpio->parent_irq = irq;
> +
> +	rc = devm_request_threaded_irq(&pdev->dev, irq, NULL, sgpio_irq_handler,
> +				       IRQF_ONESHOT, "axiado-sgpio", sgpio);
> +
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "Failed to request threaded IRQ %d: %d\n",
> +			irq, rc);
> +		return rc;
> +	}
> +
> +	sgpio->chip.parent = &pdev->dev;
> +	sgpio->chip.ngpio = sgpio->ngpios * 2;
> +	sgpio->chip.owner = THIS_MODULE;
> +	sgpio->chip.direction_input = ax3000_sgpio_dir_in;
> +	sgpio->chip.direction_output = ax3000_sgpio_dir_out;
> +	sgpio->chip.get = ax3000_sgpio_get;
> +	sgpio->chip.set = ax3000_sgpio_set;
> +	sgpio->chip.label = dev_name(&pdev->dev);
> +	sgpio->chip.base = -1;
> +
> +	girq = &sgpio->chip.irq;
> +
> +	girq->chip = &axiado_sgpio_irqchip;
> +	girq->handler = handle_edge_irq;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->num_parents = 1;
> +	girq->parents =
> +		devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents), GFP_KERNEL);
> +	if (!girq->parents) {
> +		dev_err(&pdev->dev, "Failed to allocate parents array\n");

Drop this message, returning -ENOMEM is enough.

> +		return -ENOMEM;
> +	}
> +	girq->parents[0] = irq;
> +
> +	rc = devm_gpiochip_add_data(&pdev->dev, &sgpio->chip, sgpio);
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", rc);
> +		return rc;

Use return dev_err_probe() here and elsewhere.

> +	}
> +
> +	/* Store driver data for remove() */
> +	platform_set_drvdata(pdev, sgpio);
> +	dev_info(&pdev->dev, "SGPIO registered with %d GPIOs\n",
> +		 sgpio->chip.ngpio);

No need for this info message, please drop it.

> +
> +	return 0;
> +}
> +
> +static int sgpio_remove(struct platform_device *pdev)
> +{
> +	struct ax3000_sgpio *sgpio = platform_get_drvdata(pdev);
> +	int i;
> +
> +	if (!sgpio)
> +		return 0;
> +
> +	/* Disable interrupts in hardware */
> +	if (sgpio->regs) {
> +		regmap_write(sgpio->regmap,
> +			     sgpio->regmap_base_offset + sgpio->regs->mask,
> +			     0x0);
> +		regmap_write(sgpio->regmap,
> +			     sgpio->regmap_base_offset + sgpio->regs->ctrl_en,
> +			     0x0);
> +	}
> +
> +	/* Disable and synchronize parent IRQ to avoid races with handlers */
> +	if (sgpio->parent_irq >= 0) {
> +		disable_irq(sgpio->parent_irq);
> +		synchronize_irq(sgpio->parent_irq);
> +	}
> +
> +	/* Ensure all GPIO IRQ handlers complete before removal */
> +	if (sgpio->chip.irq.domain) {
> +		struct irq_domain *domain = sgpio->chip.irq.domain;
> +		unsigned int irq;
> +		int hwirq;
> +
> +		for (hwirq = 0; hwirq < sgpio->chip.ngpio; hwirq++) {
> +			irq = irq_find_mapping(domain, hwirq);
> +			if (irq) {
> +				disable_irq(irq);
> +				synchronize_irq(irq);
> +			}
> +		}
> +	}
> +
> +	/* Clear internal IRQ state */
> +	for (i = 0; i < sgpio->max_sgpio_pins; i++)
> +		sgpio->irq_unmasked[i] = 0;
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ax_sgpio_match[] = {
> +	{ .compatible = "axiado,sgpio" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, ax_sgpio_match);
> +
> +static struct platform_driver sgpio_driver = {
> +	.driver = {
> +		.name = "sgpio",
> +		.owner = THIS_MODULE,
> +		.of_match_table = ax_sgpio_match,
> +	},
> +	.probe = sgpio_probe,
> +	.remove = sgpio_remove,
> +};
> +
> +static int __init ax_sgpio_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_register(&sgpio_driver);
> +	if (ret < 0) {
> +		pr_err("Failed to register SGPIO driver\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit ax_sgpio_exit(void)
> +{
> +	platform_driver_unregister(&sgpio_driver);
> +}
> +
> +module_init(ax_sgpio_init);
> +module_exit(ax_sgpio_exit);

Just use module_platform_driver().

> +
> +MODULE_DESCRIPTION("Axiado Serial GPIO Driver");
> +MODULE_AUTHOR("Axiado Corporation");
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>
>

Bart

