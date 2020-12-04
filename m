Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6322CEC7E
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 11:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729744AbgLDKuO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Fri, 4 Dec 2020 05:50:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728018AbgLDKuO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2020 05:50:14 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44872C061A51
        for <linux-gpio@vger.kernel.org>; Fri,  4 Dec 2020 02:49:34 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kl8eP-0003gF-BW; Fri, 04 Dec 2020 11:49:21 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kl8eN-0005n7-VC; Fri, 04 Dec 2020 11:49:19 +0100
Message-ID: <aad38b7cbaa2b22092ad466cf01ec7e0c1f08b72.camel@pengutronix.de>
Subject: Re: [PATCH v4 13/21] riscv: Add Canaan Kendryte K210 reset
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
Date:   Fri, 04 Dec 2020 11:49:19 +0100
In-Reply-To: <20201202032500.206346-14-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
         <20201202032500.206346-14-damien.lemoal@wdc.com>
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

On Wed, 2020-12-02 at 12:24 +0900, Damien Le Moal wrote:
> Add a reset controller driver for the Canaan Kendryte K210 SoC. This
> driver relies on its syscon compatible parent node (sysctl) for its
> register mapping. Automatically select this driver for compilation
> when the SOC_CANAAN option is selected.
> 
> The MAINTAINERS file is updated, adding the entry "CANAAN/KENDRYTE K210
> SOC RESET CONTROLLER DRIVER" with myself listed as maintainer for this
> driver.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  MAINTAINERS                |   8 +++
>  arch/riscv/Kconfig.socs    |   3 +
>  drivers/reset/Kconfig      |   9 +++
>  drivers/reset/Makefile     |   1 +
>  drivers/reset/reset-k210.c | 141 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 162 insertions(+)
>  create mode 100644 drivers/reset/reset-k210.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a059ab02fa8a..c2b3d6e48cd5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3837,6 +3837,14 @@ L:	linux-gpio@vger.kernel.org (pinctrl driver)
>  F:	Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
>  F:	drivers/pinctrl/pinctrl-k210.c
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
> index 68bdd664b5c2..b3cd253ec2c2 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -33,6 +33,9 @@ config SOC_CANAAN
>  	select CLK_K210
>  	select PINCTRL
>  	select PINCTRL_K210
> +	select ARCH_HAS_RESET_CONTROLLER
> +	select RESET_CONTROLLER
> +	select RESET_K210
>  	help
>  	  This enables support for Canaan Kendryte K210 SoC platform hardware.
>  
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 07d162b179fc..529d206cfdfd 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -245,6 +245,15 @@ config RESET_ZYNQ
>  	help
>  	  This enables the reset controller driver for Xilinx Zynq SoCs.
>  
> +config RESET_K210
> +	bool "Reset controller driver for Canaan Kendryte K210 SoC"
> +	depends on RISCV && SOC_CANAAN
> +	depends on OF && MFD_SYSCON
> +	help
> +	  Support for the Canaan Kendryte K210 RISC-V SoC reset controller.
> +	  Say Y if you want to control reset signals provided by this
> +	  controller.
> +
>  source "drivers/reset/sti/Kconfig"
>  source "drivers/reset/hisilicon/Kconfig"
>  source "drivers/reset/tegra/Kconfig"
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 16947610cc3b..1730a31e6871 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -33,4 +33,5 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
>  obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
>  obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
>  obj-$(CONFIG_ARCH_ZYNQMP) += reset-zynqmp.o
> +obj-$(CONFIG_RESET_K210) += reset-k210.o
>  
> diff --git a/drivers/reset/reset-k210.c b/drivers/reset/reset-k210.c
> new file mode 100644
> index 000000000000..2cf9a63c763d
> --- /dev/null
> +++ b/drivers/reset/reset-k210.c
> @@ -0,0 +1,141 @@
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
> +	u32 bit = BIT(id);
> +
> +	if (!(bit & K210_RST_MASK))
> +		return -EINVAL;

Instead of checking this mask in the k210_rst_assert/deassert/status()
functions, you could implement a custom .of_xlate callback and disallow
requesting invalid resets in the first place.

regards
Philipp
