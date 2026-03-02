Return-Path: <linux-gpio+bounces-32380-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKh3DlNfpWlc+QUAu9opvQ
	(envelope-from <linux-gpio+bounces-32380-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:58:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E661D5D64
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 10:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CC763006917
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 09:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1F138D01E;
	Mon,  2 Mar 2026 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Bx8avbq7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78A03B7A8;
	Mon,  2 Mar 2026 09:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445517; cv=none; b=KjYhEWR+QooHbz/Yj6xmDjFQd0JNaOmklSHn3QylDWe/oOg+mBfO0s/MKDuo9BOPXeUQ1ow8huckOlqQAyx1zoU7ZHmlErLSuAB0roQGaFYUq9fRHFUyMDOoVHG4+zc7bLCQv+es9f/Rola7hZU+1hdgBY2zJcKqQpdmEd6aw3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445517; c=relaxed/simple;
	bh=ervvysCEd8cOIl5h8mlgyhiDmmnkn6l/quiCDWX+pw4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QLx61CTIWJwn7tyNjFAW4Hl10OgD04iukHcT+vmcztQKp6hZlkfz4eMENf4diTX5Hw+PmJmkXuRzBwUTXL+JTYNNE88O/7E1MgASNLJ1D/hEwFuGRG40Gnysa1DXpybltUJb7t+xssSzEqAigtAY3aTzbqPDA+el8tSh/XaQkvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Bx8avbq7; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 60B524E424DA;
	Mon,  2 Mar 2026 09:58:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3414D5FE89;
	Mon,  2 Mar 2026 09:58:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53D22102F1C60;
	Mon,  2 Mar 2026 10:58:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772445513; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iwiEelWhER4t/r6sMqYxG5Tn4/kBZkljoQa9dHWraG0=;
	b=Bx8avbq7O2QjyfWCKDige+h5z6avm9Hn+oW8VyBuWAp146RJvoz2j36FaZxWyr2s2bpzAt
	gc6wPz0ry+CYsFVFKZjh/zfGOJLQlnqvYG9BJqZR8LTu/Izql7WToJ+UoxbU5ZhNwICWjy
	ZuCAWu/4e9DR7GlTHvVlOOUgJ1k5h8HloF9nCNHi+GI+6d0LmN8PbBiQvbLlYfCvJH5/Wu
	aRv4W7Ib71+KuEGiQdr7+sczm4aHDgECw9dCQlwEtCWiaZzZ7JCytanTqtiYCi+jpoqlQX
	rQR1wwDeS1kvV5S1zzoQvHkHv7EYV0wadGeklDekf20hSIGMme4+JxluKVhqCQ==
Date: Mon, 2 Mar 2026 10:58:24 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thomas Gleixner <tglx@linutronix.de>, Daire McNamara
 <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v11 3/4] soc: microchip: add mpfs gpio interrupt mux
 driver
Message-ID: <20260302105824.21b5c7d6@bootlin.com>
In-Reply-To: <20260227-flashing-overcast-85ff59b2e82c@spud>
References: <20260227-ajar-wolverine-7ce1ebd79821@spud>
	<20260227-flashing-overcast-85ff59b2e82c@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32380-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:dkim,microchip.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 37E661D5D64
X-Rspamd-Action: no action

Hi Conor,

On Fri, 27 Feb 2026 14:52:29 +0000
Conor Dooley <conor@kernel.org> wrote:

> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On PolarFire SoC there are more GPIO interrupts than there are interrupt
> lines available on the PLIC, and a runtime configurable mux is used to
> decide which interrupts are assigned direct connections to the PLIC &
> which are relegated to sharing a line.
> 
> Add a driver so that Linux can set the mux based on the interrupt
> mapping in the devicetree.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
...

> --- a/drivers/soc/microchip/Kconfig
> +++ b/drivers/soc/microchip/Kconfig
> @@ -1,3 +1,14 @@
> +config POLARFIRE_SOC_IRQ_MUX
> +	bool "Microchip PolarFire SoC's GPIO IRQ Mux"
> +	depends on ARCH_MICROCHIP
> +	select REGMAP
> +	select REGMAP_MMIO
> +	default y
> +	help
> +	  Support for the interrupt mux on Polarfire SoC. It sits between
> +	  the GPIO controllers and the PLIC, as only 35 interrupts are shared
> +	  between 3 GPIO controllers with 32 interrupts each.

35 interrupts ?

Previously (other patches) you mentionned 41 (38 + 3).

Also 32 interrutps on each (3 * 32 = 96) but you talked about 70 on previous
patches.

Can you double check or clarify those numbers ?

...
> +++ b/drivers/soc/microchip/mpfs-irqmux.c
> @@ -0,0 +1,167 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Largely copied from rzn1_irqmux.c
> + */
> +
> +#include <linux/bitmap.h>
> +#include <linux/bitops.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define MPFS_IRQMUX_CR		0x54
> +#define MPFS_IRQMUX_NUM_OUTPUTS	70

Is 70 really the outputs ?

According to previous patches, I would say 41 (38+3).

...
> +static int mpfs_irqmux_probe(struct platform_device *pdev)
> +{
> +	DECLARE_BITMAP(line_done, MPFS_IRQMUX_NUM_OUTPUTS) = {};
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct of_imap_parser imap_parser;
> +	struct of_imap_item imap_item;
> +	struct regmap *regmap;
> +	int ret, direct_mode, line, controller, gpio;

Reverse Xmas tree.

> +	u32 tmp, val = 0, old;

...
> +	for_each_of_imap_item(&imap_parser, &imap_item) {
> +
> +		direct_mode = mpfs_irqmux_is_direct_mode(dev, &imap_item.parent_args);
> +		if (direct_mode < 0) {
> +			of_node_put(imap_item.parent_args.np);
> +			return direct_mode;
> +		}
> +
> +		line = imap_item.child_imap[0];
> +		gpio = line % 32;
> +		controller = line / 32;
> +
> +		if (controller > 2) {
> +			of_node_put(imap_item.parent_args.np);
> +			dev_err(dev, "child interrupt number too large: %d\n", line);
> +			return -EINVAL;
> +		}
> +
> +		if (test_and_set_bit(line, line_done)) {

Your bitmap size is MPFS_IRQMUX_NUM_OUTPUTS but you your line variable can
have values from 0 to 95.

Maybe some checks on imap_item.child_imap[0] or line could be added in
order to be be sure that line value will fit in the bitmap.


> +			of_node_put(imap_item.parent_args.np);
> +			dev_err(dev, "Mux output line %d already defined in interrupt-map\n",
> +				line);

line is computed from imap_item.child_imap[0]. It is the input and not the
output.

In rzn1-irqmux.c, the bitmap is used to avoid multiple input lines using the same
output line. Bitmap bits represent outputs.

> +			return -EINVAL;
> +		}
> +
> +		/*
> +		 * There are 41 interrupts assigned to GPIOs, of which 38 are "direct". Since the
> +		 * mux has 32 bits only, 6 of these exclusive/"direct" interrupts remain. These
> +		 * are used by GPIO controller 1's lines 18 to 23. Nothing needs to be done
> +		 * for these interrupts.
> +		 */
> +		if (controller == 1 && gpio >= 18)
> +			continue;
> +
> +		/*
> +		 * The mux has a single register, where bits 0 to 13 mux between GPIO controller
> +		 * 1's 14 GPIOs and GPIO controller 2's first 14 GPIOs. The remaining bits mux
> +		 * between the first 18 GPIOs of controller 1 and the last 18 GPIOS of
> +		 * controller 2. If a bit in the mux's control register is set, the
> +		 * corresponding interrupt line for GPIO controller 0 or 1 will be put in
> +		 * "non-direct" mode. If cleared, the "fabric" controller's will.
> +		 *
> +		 * Register layout:
> +		 *    GPIO 1 interrupt line 17 | mux bit 31 | GPIO 2 interrupt line 31
> +		 *    ...                      | ...        | ...
> +		 *    ...                      | ...        | ...
> +		 *    GPIO 1 interrupt line  0 | mux bit 14 | GPIO 2 interrupt line 14
> +		 *    GPIO 0 interrupt line 13 | mux bit 13 | GPIO 2 interrupt line 13
> +		 *    ...                      | ...        | ...
> +		 *    ...                      | ...        | ...
> +		 *    GPIO 0 interrupt line  0 | mux bit  0 | GPIO 2 interrupt line  0
> +		 *
> +		 * As the binding mandates 70 items, one for each GPIO line, there's no need to
> +		 * handle anything for GPIO controller 2, since the bit will be set for the
> +		 * corresponding line in GPIO controller 0 or 1.

Hum, what happen if the interrupts property is set in the GPIO controller 2 and not
GPIO controllers 0 or 1.

Is it legit ?

If so, should lines coming from GPIO controller 2 be took into account ?

Maybe my comment is not relevant due to some misunderstanding in the not
so obvious mapping.

> +		 */
> +		if (controller == 2)
> +			continue;
> +
> +		/*
> +		 * If in direct mode, the bit is cleared, nothing needs to be done as val is zero
> +		 * initialised and that's the direct mode setting for GPIO controller 0 and 1.
> +		 */
> +		if (direct_mode)
> +			continue;
> +
> +		if (controller == 0)
> +			val |= 1U << gpio;
> +		else
> +			val |= 1U << (gpio + 14);
> +	}
> +
> +	regmap_read(regmap, MPFS_IRQMUX_CR, &old);
> +	regmap_write(regmap, MPFS_IRQMUX_CR, val);
> +
> +	if (val != old)
> +		dev_info(dev, "firmware mux setting of 0x%x overwritten to 0x%x\n", old, val);
> +
> +	return 0;
> +}
> +

Best regards,
Hervé

