Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 540A32D8EBD
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Dec 2020 17:31:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405052AbgLMQay (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Dec 2020 11:30:54 -0500
Received: from relay5.mymailcheap.com ([159.100.241.64]:42807 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727484AbgLMQar (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Dec 2020 11:30:47 -0500
X-Greylist: delayed 130989 seconds by postgrey-1.27 at vger.kernel.org; Sun, 13 Dec 2020 11:30:36 EST
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.154])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 3FA9620100
        for <linux-gpio@vger.kernel.org>; Sun, 13 Dec 2020 16:29:39 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id ECEAC3F20A;
        Sun, 13 Dec 2020 17:27:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id BA7632A469;
        Sun, 13 Dec 2020 17:27:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1607876877;
        bh=/gKlmgJHQOAx4+BfLEl2LxEsgTNaa+EcD0nQb6wWrYI=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=gLd9iBycICh3xDZ+aO1rrPqFKcnB79+MBt9HGwkxh0RcMGM9HnSjipBf6zZcWUcU9
         lUg5pSFJwPUOtZxGO8L4D19POEKBX9DdVVfd+9GBrA77o2spnnSN381ikVAbWDps7F
         yrEmhV6ev7pe7q3Zk+hbW5EDCT+DuL8Z6uc/4Ml4=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5L5UMPcFpBCB; Sun, 13 Dec 2020 17:27:55 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Sun, 13 Dec 2020 17:27:55 +0100 (CET)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id B1D9C41A53;
        Sun, 13 Dec 2020 16:27:54 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="oDW9t46n";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.162.102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 39B9C41A21;
        Sun, 13 Dec 2020 16:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
        t=1607876867; bh=/gKlmgJHQOAx4+BfLEl2LxEsgTNaa+EcD0nQb6wWrYI=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=oDW9t46nam0jLaKDw+bm3S5GaJxpWz6tmNmOOOdcKBinFk51A8QJi9+212yMmr2cY
         N4d33jG0aH9s3yqu3iVEanUy141kUL6W+KZ7jyEeatUpqdL21NUfyleSN9E4FgcWoq
         Qx+t5UCjC3QfaR2kp3+9ozzmHGn0Gy6x4FKVyw/Q=
Message-ID: <70df5b048c81485053df91a3e53dc840487677e3.camel@aosc.io>
Subject: Re: [PATCH 2/8] pinctrl: sunxi: Add support for the Allwinner H616
 pin controller
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Andre Przywara <andre.przywara@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Icenowy Zheng <icenowy@aosc.xyz>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Yangtao Li <frank@allwinnertech.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Date:   Mon, 14 Dec 2020 00:27:34 +0800
In-Reply-To: <20201202135409.13683-3-andre.przywara@arm.com>
References: <20201202135409.13683-1-andre.przywara@arm.com>
         <20201202135409.13683-3-andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [1.40 / 20.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[aosc.io:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         DMARC_NA(0.00)[aosc.io];
         R_SPF_SOFTFAIL(0.00)[~all];
         RECEIVED_SPAMHAUS_PBL(0.00)[59.41.162.102:received];
         TO_MATCH_ENVRCPT_SOME(0.00)[];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[aosc.io:+];
         RCPT_COUNT_TWELVE(0.00)[12];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         SUSPICIOUS_RECIPS(1.50)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: B1D9C41A53
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

在 2020-12-02星期三的 13:54 +0000，Andre Przywara写道：
> Port A is used for an internal connection to some analogue circuitry
> which looks like an AC200 IP (as in the H6), though this is not
> mentioned in the manual.

When developing for V831, I found that PIO controller in H616 (and
V831) has the functionality of selecting IO voltage of PF bank (needed
to handle UHS-I).

How should we model this in PIO driver? 

> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/pinctrl/sunxi/Kconfig               |   5 +
>  drivers/pinctrl/sunxi/Makefile              |   1 +
>  drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c | 549
> ++++++++++++++++++++
>  3 files changed, 555 insertions(+)
>  create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
> 
> diff --git a/drivers/pinctrl/sunxi/Kconfig
> b/drivers/pinctrl/sunxi/Kconfig
> index 593293584ecc..73e88ce71a48 100644
> --- a/drivers/pinctrl/sunxi/Kconfig
> +++ b/drivers/pinctrl/sunxi/Kconfig
> @@ -119,4 +119,9 @@ config PINCTRL_SUN50I_H6_R
>  	default ARM64 && ARCH_SUNXI
>  	select PINCTRL_SUNXI
>  
> +config PINCTRL_SUN50I_H616
> +	bool "Support for the Allwinner H616 PIO"
> +	default ARM64 && ARCH_SUNXI
> +	select PINCTRL_SUNXI
> +
>  endif
> diff --git a/drivers/pinctrl/sunxi/Makefile
> b/drivers/pinctrl/sunxi/Makefile
> index 8b7ff0dc3bdf..5359327a3c8f 100644
> --- a/drivers/pinctrl/sunxi/Makefile
> +++ b/drivers/pinctrl/sunxi/Makefile
> @@ -23,5 +23,6 @@ obj-$(CONFIG_PINCTRL_SUN8I_V3S)		+=
> pinctrl-sun8i-v3s.o
>  obj-$(CONFIG_PINCTRL_SUN50I_H5)		+= pinctrl-sun50i-h5.o
>  obj-$(CONFIG_PINCTRL_SUN50I_H6)		+= pinctrl-sun50i-h6.o
>  obj-$(CONFIG_PINCTRL_SUN50I_H6_R)	+= pinctrl-sun50i-h6-r.o
> +obj-$(CONFIG_PINCTRL_SUN50I_H616)	+= pinctrl-sun50i-h616.o
>  obj-$(CONFIG_PINCTRL_SUN9I_A80)		+= pinctrl-sun9i-a80.o
>  obj-$(CONFIG_PINCTRL_SUN9I_A80_R)	+= pinctrl-sun9i-a80-r.o
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
> b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
> new file mode 100644
> index 000000000000..734f63eb08dd
> --- /dev/null
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-h616.c
> @@ -0,0 +1,549 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Allwinner H616 SoC pinctrl driver.
> + *
> + * Copyright (C) 2020 Arm Ltd.
> + * based on the H6 pinctrl driver
> + *   Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.io>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +
> +#include "pinctrl-sunxi.h"
> +
> +static const struct sunxi_desc_pin h616_pins[] = {
> +	/* Internal connection to the AC200 part */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 0),
> +		SUNXI_FUNCTION(0x2, "emac1")),		/* ERXD1 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 1),
> +		SUNXI_FUNCTION(0x2, "emac1")),		/* ERXD0 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 2),
> +		SUNXI_FUNCTION(0x2, "emac1")),		/* ECRS_DV */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 3),
> +		SUNXI_FUNCTION(0x2, "emac1")),		/* ERXERR */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 4),
> +		SUNXI_FUNCTION(0x2, "emac1")),		/* ETXD1 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 5),
> +		SUNXI_FUNCTION(0x2, "emac1")),		/* ETXD0 */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 6),
> +		SUNXI_FUNCTION(0x2, "emac1")),		/* ETXCK */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 7),
> +		SUNXI_FUNCTION(0x2, "emac1")),		/* ETXEN */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 8),
> +		SUNXI_FUNCTION(0x2, "emac1")),		/* EMDC */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 9),
> +		SUNXI_FUNCTION(0x2, "emac1")),		/* EMDIO */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 10),
> +		SUNXI_FUNCTION(0x2, "i2c3")),		/* SCK */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 11),
> +		SUNXI_FUNCTION(0x2, "i2c3")),		/* SDA */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 12),
> +		SUNXI_FUNCTION(0x2, "pwm5")),
> +	/* Hole */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* WE */
> +		  SUNXI_FUNCTION(0x3, "mmc2"),		/* DS */
> +		  SUNXI_FUNCTION(0x4, "spi0"),		/* CLK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),	/* PC_EINT0
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* ALE */
> +		  SUNXI_FUNCTION(0x3, "mmc2"),		/* RST */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)),	/* PC_EINT1
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* CLE */
> +		  SUNXI_FUNCTION(0x4, "spi0"),		/* MOSI */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)),	/* PC_EINT2
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* CE1 */
> +		  SUNXI_FUNCTION(0x4, "spi0"),		/* CS0 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)),	/* PC_EINT3
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* CE0 */
> +		  SUNXI_FUNCTION(0x4, "spi0"),		/* MISO */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)),	/* PC_EINT4
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* RE */
> +		  SUNXI_FUNCTION(0x3, "mmc2"),		/* CLK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)),	/* PC_EINT5
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* RB0 */
> +		  SUNXI_FUNCTION(0x3, "mmc2"),		/* CMD */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),	/* PC_EINT6
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 7),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* RB1 */
> +		  SUNXI_FUNCTION(0x4, "spi0"),		/* CS1 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)),	/* PC_EINT7
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 8),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ7 */
> +		  SUNXI_FUNCTION(0x3, "mmc2"),		/* D3 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 8)),	/* PC_EINT8
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 9),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ6 */
> +		  SUNXI_FUNCTION(0x3, "mmc2"),		/* D4 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 9)),	/* PC_EINT9
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 10),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ5 */
> +		  SUNXI_FUNCTION(0x3, "mmc2"),		/* D0 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)),	/* PC_EINT10
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 11),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ4 */
> +		  SUNXI_FUNCTION(0x3, "mmc2"),		/* D5 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)),	/* PC_EINT11
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQS */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 12)),	/* PC_EINT12
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ3 */
> +		  SUNXI_FUNCTION(0x3, "mmc2"),		/* D1 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 13)),	/* PC_EINT13
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ2 */
> +		  SUNXI_FUNCTION(0x3, "mmc2"),		/* D6 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 14)),	/* PC_EINT14
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 15),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ1 */
> +		  SUNXI_FUNCTION(0x3, "mmc2"),		/* D2 */
> +		  SUNXI_FUNCTION(0x4, "spi0"),		/* WP */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 15)),	/* PC_EINT15
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 16),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "nand0"),		/* DQ0 */
> +		  SUNXI_FUNCTION(0x3, "mmc2"),		/* D7 */
> +		  SUNXI_FUNCTION(0x4, "spi0"),		/* HOLD */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 16)),	/* PC_EINT16
> */
> +	/* Hole */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D1 */
> +		  SUNXI_FUNCTION(0x3, "jtag"),		/* MS */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 0)),	/* PF_EINT0
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D0 */
> +		  SUNXI_FUNCTION(0x3, "jtag"),		/* DI */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 1)),	/* PF_EINT1
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc0"),		/* CLK */
> +		  SUNXI_FUNCTION(0x3, "uart0"),		/* TX */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 2)),	/* PF_EINT2
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc0"),		/* CMD */
> +		  SUNXI_FUNCTION(0x3, "jtag"),		/* DO */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 3)),	/* PF_EINT3
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D3 */
> +		  SUNXI_FUNCTION(0x3, "uart0"),		/* RX */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 4)),	/* PF_EINT4
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D2 */
> +		  SUNXI_FUNCTION(0x3, "jtag"),		/* CK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 5)),	/* PF_EINT5
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 6)),	/* PF_EINT6
> */
> +	/* Hole */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc1"),		/* CLK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 0)),	/* PG_EINT0
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc1"),		/* CMD */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 1)),	/* PG_EINT1
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D0 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 2)),	/* PG_EINT2
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D1 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 3)),	/* PG_EINT3
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D2 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 4)),	/* PG_EINT4
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D3 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 5)),	/* PG_EINT5
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart1"),		/* TX */
> +		  SUNXI_FUNCTION(0x4, "jtag"),		/* MS */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 6)),	/* PG_EINT6
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 7),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart1"),		/* RX */
> +		  SUNXI_FUNCTION(0x4, "jtag"),		/* CK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 7)),	/* PG_EINT7
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 8),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart1"),		/* RTS */
> +		  SUNXI_FUNCTION(0x3, "clock"),		/*
> PLL_LOCK_DEBUG */
> +		  SUNXI_FUNCTION(0x4, "jtag"),		/* DO */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 8)),	/* PG_EINT8
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 9),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart1"),		/* CTS */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 9)),	/* PG_EINT9
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 10),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "h_i2s2"),	/* MCLK */
> +		  SUNXI_FUNCTION(0x3, "clock"),		/* X32KFOUT
> */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 10)),	/* PG_EINT10
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 11),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "h_i2s2"),	/* BCLK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 11)),	/* PG_EINT11
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 12),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "h_i2s2"),	/* SYNC */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 12)),	/* PG_EINT12
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 13),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "h_i2s2"),	/* DOUT */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 13)),	/* PG_EINT13
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 14),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "h_i2s2"),	/* DIN */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 14)),	/* PG_EINT14
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 15),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart2"),		/* TX */
> +		  SUNXI_FUNCTION(0x5, "i2c4"),		/* SCK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 15)),	/* PG_EINT15
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 16),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart2"),		/* TX */
> +		  SUNXI_FUNCTION(0x5, "i2c4"),		/* SDA */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 16)),	/* PG_EINT16
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 17),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart2"),		/* RTS */
> +		  SUNXI_FUNCTION(0x5, "i2c3"),		/* SCK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 17)),	/* PG_EINT17
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 18),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart2"),		/* CTS */
> +		  SUNXI_FUNCTION(0x5, "i2c3"),		/* SDA */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 18)),	/* PG_EINT18
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 19),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x4, "pwm1"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 19)),	/* PG_EINT19
> */
> +	/* Hole */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart0"),		/* TX */
> +		  SUNXI_FUNCTION(0x4, "pwm3"),
> +		  SUNXI_FUNCTION(0x5, "i2c1"),		/* SCK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 0)),	/* PH_EINT0
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart0"),		/* RX */
> +		  SUNXI_FUNCTION(0x4, "pwm4"),
> +		  SUNXI_FUNCTION(0x5, "i2c1"),		/* SDA */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 1)),	/* PH_EINT1
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart5"),		/* TX */
> +		  SUNXI_FUNCTION(0x3, "spdif"),		/* MCLK */
> +		  SUNXI_FUNCTION(0x4, "pwm2"),
> +		  SUNXI_FUNCTION(0x5, "i2c2"),		/* SCK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 2)),	/* PH_EINT2
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart5"),		/* RX */
> +		  SUNXI_FUNCTION(0x4, "pwm1"),
> +		  SUNXI_FUNCTION(0x5, "i2c2"),		/* SDA */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 3)),	/* PH_EINT3
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x3, "spdif"),		/* OUT */
> +		  SUNXI_FUNCTION(0x5, "i2c3"),		/* SCK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 4)),	/* PH_EINT4
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart2"),		/* TX */
> +		  SUNXI_FUNCTION(0x3, "h_i2s3"),	/* MCLK */
> +		  SUNXI_FUNCTION(0x4, "spi1"),		/* CS0 */
> +		  SUNXI_FUNCTION(0x5, "i2c3"),		/* SDA */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 5)),	/* PH_EINT5
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart2"),		/* RX */
> +		  SUNXI_FUNCTION(0x3, "h_i2s3"),	/* BCLK */
> +		  SUNXI_FUNCTION(0x4, "spi1"),		/* CLK */
> +		  SUNXI_FUNCTION(0x5, "i2c4"),		/* SCK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 6)),	/* PH_EINT6
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart2"),		/* RTS */
> +		  SUNXI_FUNCTION(0x3, "h_i2s3"),	/* SYNC */
> +		  SUNXI_FUNCTION(0x4, "spi1"),		/* MOSI */
> +		  SUNXI_FUNCTION(0x5, "i2c4"),		/* SDA */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 7)),	/* PH_EINT7
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "uart2"),		/* CTS */
> +		  SUNXI_FUNCTION(0x3, "h_i2s3"),	/* DO0 */
> +		  SUNXI_FUNCTION(0x4, "spi1"),		/* MISO */
> +		  SUNXI_FUNCTION(0x5, "h_i2s3"),	/* DI1 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 8)),	/* PH_EINT8
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 9),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x3, "h_i2s3"),	/* DI0 */
> +		  SUNXI_FUNCTION(0x4, "spi1"),		/* CS1 */
> +		  SUNXI_FUNCTION(0x3, "h_i2s3"),	/* DO1 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 9)),	/* PH_EINT9
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x3, "ir_rx"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 10)),	/* PH_EINT10
> */
> +	/* Hole */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 0),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* ERXD3 */
> +		  SUNXI_FUNCTION(0x3, "dmic"),		/* CLK */
> +		  SUNXI_FUNCTION(0x4, "h_i2s0"),	/* MCLK */
> +		  SUNXI_FUNCTION(0x5, "hdmi"),		/* HSCL */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 0)),	/* PI_EINT0
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 1),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* ERXD2 */
> +		  SUNXI_FUNCTION(0x3, "dmic"),		/* DATA0 */
> +		  SUNXI_FUNCTION(0x4, "h_i2s0"),	/* BCLK */
> +		  SUNXI_FUNCTION(0x5, "hdmi"),		/* HSDA */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 1)),	/* PI_EINT1
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 2),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* ERXD1 */
> +		  SUNXI_FUNCTION(0x3, "dmic"),		/* DATA1 */
> +		  SUNXI_FUNCTION(0x4, "h_i2s0"),	/* SYNC */
> +		  SUNXI_FUNCTION(0x5, "hdmi"),		/* HCEC */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 2)),	/* PI_EINT2
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 3),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* ERXD0 */
> +		  SUNXI_FUNCTION(0x3, "dmic"),		/* DATA2 */
> +		  SUNXI_FUNCTION(0x4, "h_i2s0"),	/* DO0 */
> +		  SUNXI_FUNCTION(0x5, "h_i2s0"),	/* DI1 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 3)),	/* PI_EINT3
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 4),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* ERXCK */
> +		  SUNXI_FUNCTION(0x3, "dmic"),		/* DATA3 */
> +		  SUNXI_FUNCTION(0x4, "h_i2s0"),	/* DI0 */
> +		  SUNXI_FUNCTION(0x5, "h_i2s0"),	/* DO1 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 4)),	/* PI_EINT4
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 5),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* ERXCTL */
> +		  SUNXI_FUNCTION(0x3, "uart2"),		/* TX */
> +		  SUNXI_FUNCTION(0x4, "ts0"),		/* CLK */
> +		  SUNXI_FUNCTION(0x5, "i2c0"),		/* SCK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 5)),	/* PI_EINT5
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 6),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* ENULL */
> +		  SUNXI_FUNCTION(0x3, "uart2"),		/* RX */
> +		  SUNXI_FUNCTION(0x4, "ts0"),		/* ERR */
> +		  SUNXI_FUNCTION(0x5, "i2c0"),		/* SDA */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 6)),	/* PI_EINT6
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 7),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* ETXD3 */
> +		  SUNXI_FUNCTION(0x3, "uart2"),		/* RTS */
> +		  SUNXI_FUNCTION(0x4, "ts0"),		/* SYNC */
> +		  SUNXI_FUNCTION(0x5, "i2c1"),		/* SCK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 7)),	/* PI_EINT7
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 8),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* ETXD2 */
> +		  SUNXI_FUNCTION(0x3, "uart2"),		/* CTS */
> +		  SUNXI_FUNCTION(0x4, "ts0"),		/* DVLD */
> +		  SUNXI_FUNCTION(0x5, "i2c1"),		/* SDA */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 8)),	/* PI_EINT8
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 9),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* ETXD1 */
> +		  SUNXI_FUNCTION(0x3, "uart3"),		/* TX */
> +		  SUNXI_FUNCTION(0x4, "ts0"),		/* D0 */
> +		  SUNXI_FUNCTION(0x5, "i2c2"),		/* SCK */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 9)),	/* PI_EINT9
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 10),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* ETXD0 */
> +		  SUNXI_FUNCTION(0x3, "uart3"),		/* RX */
> +		  SUNXI_FUNCTION(0x4, "ts0"),		/* D1 */
> +		  SUNXI_FUNCTION(0x5, "i2c2"),		/* SDA */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 10)),	/* PI_EINT10
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 11),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* ETXCK */
> +		  SUNXI_FUNCTION(0x3, "uart3"),		/* RTS */
> +		  SUNXI_FUNCTION(0x4, "ts0"),		/* D2 */
> +		  SUNXI_FUNCTION(0x5, "pwm1"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 11)),	/* PI_EINT11
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 12),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* ETXCTL */
> +		  SUNXI_FUNCTION(0x3, "uart3"),		/* CTS */
> +		  SUNXI_FUNCTION(0x4, "ts0"),		/* D3 */
> +		  SUNXI_FUNCTION(0x5, "pwm2"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 12)),	/* PI_EINT12
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 13),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* ECLKIN */
> +		  SUNXI_FUNCTION(0x3, "uart4"),		/* TX */
> +		  SUNXI_FUNCTION(0x4, "ts0"),		/* D4 */
> +		  SUNXI_FUNCTION(0x5, "pwm3"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 13)),	/* PI_EINT13
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 14),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* MDC */
> +		  SUNXI_FUNCTION(0x3, "uart4"),		/* RX */
> +		  SUNXI_FUNCTION(0x4, "ts0"),		/* D5 */
> +		  SUNXI_FUNCTION(0x5, "pwm4"),
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 14)),	/* PI_EINT14
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 15),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* MDIO */
> +		  SUNXI_FUNCTION(0x3, "uart4"),		/* RTS */
> +		  SUNXI_FUNCTION(0x4, "ts0"),		/* D6 */
> +		  SUNXI_FUNCTION(0x5, "clock"),		/*
> CLK_FANOUT0 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 15)),	/* PI_EINT15
> */
> +	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 16),
> +		  SUNXI_FUNCTION(0x0, "gpio_in"),
> +		  SUNXI_FUNCTION(0x1, "gpio_out"),
> +		  SUNXI_FUNCTION(0x2, "emac0"),		/* EPHY_CLK
> */
> +		  SUNXI_FUNCTION(0x3, "uart4"),		/* CTS */
> +		  SUNXI_FUNCTION(0x4, "ts0"),		/* D7 */
> +		  SUNXI_FUNCTION(0x5, "clock"),		/*
> CLK_FANOUT1 */
> +		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 16)),	/* PI_EINT16
> */
> +};
> +static const unsigned int h616_irq_bank_map[] = { 2, 5, 6, 7, 8 };
> +
> +static const struct sunxi_pinctrl_desc h616_pinctrl_data = {
> +	.pins = h616_pins,
> +	.npins = ARRAY_SIZE(h616_pins),
> +	.irq_banks = 5,
> +	.irq_bank_map = h616_irq_bank_map,
> +	.irq_read_needs_mux = true,
> +	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> +};
> +
> +static int h616_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return sunxi_pinctrl_init(pdev,
> +				  &h616_pinctrl_data);
> +}
> +
> +static const struct of_device_id h616_pinctrl_match[] = {
> +	{ .compatible = "allwinner,sun50i-h616-pinctrl", },
> +	{}
> +};
> +
> +static struct platform_driver h616_pinctrl_driver = {
> +	.probe	= h616_pinctrl_probe,
> +	.driver	= {
> +		.name		= "sun50i-h616-pinctrl",
> +		.of_match_table	= h616_pinctrl_match,
> +	},
> +};
> +builtin_platform_driver(h616_pinctrl_driver);
