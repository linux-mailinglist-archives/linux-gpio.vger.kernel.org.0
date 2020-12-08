Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC2F2D29EB
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 12:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729054AbgLHLp3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 8 Dec 2020 06:45:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727764AbgLHLp2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 06:45:28 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CA64C061793
        for <linux-gpio@vger.kernel.org>; Tue,  8 Dec 2020 03:44:48 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kmbQ5-0002qb-Gr; Tue, 08 Dec 2020 12:44:37 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kmbQ4-0000gM-4s; Tue, 08 Dec 2020 12:44:36 +0100
Message-ID: <4d0a0c80e57b156b7d86dfca250285048ab30825.camel@pengutronix.de>
Subject: Re: [PATCH v5 12/21] riscv: Add Canaan Kendryte K210 reset
 controller
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Damien Le Moal <damien.lemoal@wdc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Sean Anderson <seanga2@gmail.com>
Date:   Tue, 08 Dec 2020 12:44:36 +0100
In-Reply-To: <20201208073355.40828-13-damien.lemoal@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
         <20201208073355.40828-13-damien.lemoal@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Damien,

On Tue, 2020-12-08 at 16:33 +0900, Damien Le Moal wrote:
> Add a reset controller driver for the Canaan Kendryte K210 SoC. This
> driver relies on its syscon compatible parent node (sysctl) for its
> register mapping. Default this driver compilation to y when the
> SOC_CANAAN option is selected.
> 
> The MAINTAINERS file is updated, adding the entry "CANAAN/KENDRYTE K210
> SOC RESET CONTROLLER DRIVER" with myself listed as maintainer for this
> driver.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  MAINTAINERS                |   8 +++
>  arch/riscv/Kconfig.socs    |   1 +
>  drivers/reset/Kconfig      |  10 +++
>  drivers/reset/Makefile     |   1 +
>  drivers/reset/reset-k210.c | 134 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 154 insertions(+)
>  create mode 100644 drivers/reset/reset-k210.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 85a6a0beebd1..6059a1e4caa6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3831,6 +3831,14 @@ W:	https://github.com/Cascoda/ca8210-linux.git
>  F:	Documentation/devicetree/bindings/net/ieee802154/ca8210.txt
>  F:	drivers/net/ieee802154/ca8210.c
>  
> +CANAAN/KENDRYTE K210 SOC RESET CONTROLLER DRIVER
> +M:	Damien Le Moal <damien.lemoal@wdc.com>
> +L:	linux-kernel@vger.kernel.org
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
> +F:	drivers/reset/reset-k210.c
> +
>  CANAAN/KENDRYTE K210 SOC SYSTEM CONTROLLER DRIVER
>  M:	Damien Le Moal <damien.lemoal@wdc.com>
>  L:	linux-riscv@lists.infradead.org
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 88ac0d1a5da4..fdefd7eff1ae 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -29,6 +29,7 @@ config SOC_CANAAN
>  	select SERIAL_SIFIVE if TTY
>  	select SERIAL_SIFIVE_CONSOLE if TTY
>  	select SIFIVE_PLIC
> +	select ARCH_HAS_RESET_CONTROLLER
>  	help
>  	  This enables support for Canaan Kendryte K210 SoC platform hardware.
>  
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 07d162b179fc..ded44889484f 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -82,6 +82,16 @@ config RESET_INTEL_GW
>  	  Say Y to control the reset signals provided by reset controller.
>  	  Otherwise, say N.
>  
> +config RESET_K210
> +	bool "Reset controller driver for Canaan Kendryte K210 SoC"
> +	depends on RISCV && SOC_CANAAN && OF

Please enable compile-testing on other architectures, for example:

	depends on ((RISCV && SOC_CANAAN) || COMPILE_TEST) && OF

Are there non-RISCV SOC_CANAAN devices for which this driver shouldn't
be compiled?
If not, you could you drop the RISCV dependency without loss of
information.

> +	select MFD_SYSCON
> +	default SOC_CANAAN
> +	help
> +	  Support for the Canaan Kendryte K210 RISC-V SoC reset controller.
> +	  Say Y if you want to control reset signals provided by this
> +	  controller.
> +
>  config RESET_LANTIQ
>  	bool "Lantiq XWAY Reset Driver" if COMPILE_TEST
>  	default SOC_TYPE_XWAY
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 16947610cc3b..1730a31e6871 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -33,4 +33,5 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
>  obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
>  obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
>  obj-$(CONFIG_ARCH_ZYNQMP) += reset-zynqmp.o
> +obj-$(CONFIG_RESET_K210) += reset-k210.o

Please sort alphabetically.

> diff --git a/drivers/reset/reset-k210.c b/drivers/reset/reset-k210.c
> new file mode 100644
> index 000000000000..9ccc92a805d8
> --- /dev/null
> +++ b/drivers/reset/reset-k210.c
> @@ -0,0 +1,134 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> + */
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/delay.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <soc/canaan/k210-sysctl.h>
> +
> +#include <dt-bindings/reset/k210-rst.h>
> +
> +#define K210_RST_MASK	0x27FFFFFF
> +
> +struct k210_rst {
> +	struct regmap *map;
> +	struct reset_controller_dev rcdev;
> +};
> +
> +static inline struct k210_rst *
> +to_k210_rst(struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct k210_rst, rcdev);
> +}
> +
> +static inline int k210_rst_assert(struct reset_controller_dev *rcdev,
> +				  unsigned long id)
> +{
> +	struct k210_rst *ksr = to_k210_rst(rcdev);
> +
> +	regmap_update_bits(ksr->map, K210_SYSCTL_PERI_RESET, BIT(id), 1);
> +
> +	return 0;

Just pass the return value on:

	return regmap_update_bits(...);

> +}
> +
> +static inline int k210_rst_deassert(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	struct k210_rst *ksr = to_k210_rst(rcdev);
> +
> +	regmap_update_bits(ksr->map, K210_SYSCTL_PERI_RESET, BIT(id), 0);
> +
> +	return 0;

Same as above.

> +}
> +
> +static int k210_rst_reset(struct reset_controller_dev *rcdev,
> +			  unsigned long id)
> +{
> +	int ret;
> +
> +	ret = k210_rst_assert(rcdev, id);
> +	if (ret == 0) {
> +		udelay(10);
> +		ret = k210_rst_deassert(rcdev, id);
> +	}
> +
> +	return ret;
> +}
> +
> +static int k210_rst_status(struct reset_controller_dev *rcdev,
> +			   unsigned long id)
> +{
> +	struct k210_rst *ksr = to_k210_rst(rcdev);
> +	u32 reg, bit = BIT(id);
> +	int ret;
> +
> +	ret = regmap_read(ksr->map, K210_SYSCTL_PERI_RESET, &reg);
> +	if (ret)
> +		return ret;
> +
> +	return ret & bit;

Typo here, this should be:

	return reg & bit;

With this fixed,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
