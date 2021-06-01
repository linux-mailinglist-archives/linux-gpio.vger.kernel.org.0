Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3253976DB
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 17:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234074AbhFAPkI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 11:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhFAPkH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 11:40:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A54BC061574
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 08:38:26 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1lo6TE-0000Zs-6w; Tue, 01 Jun 2021 17:38:20 +0200
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <pza@pengutronix.de>)
        id 1lo6TC-000697-Cq; Tue, 01 Jun 2021 17:38:18 +0200
Date:   Tue, 1 Jun 2021 17:38:18 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, luka.perkov@sartura.hr,
        jmp@epiphyte.org, pmenzel@molgen.mpg.de, buczek@molgen.mpg.de
Subject: Re: [PATCH v3 4/6] reset: Add Delta TN48M CPLD reset controller
Message-ID: <20210601153818.GA20254@pengutronix.de>
References: <20210531125143.257622-1-robert.marko@sartura.hr>
 <20210531125143.257622-4-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531125143.257622-4-robert.marko@sartura.hr>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 17:15:48 up 103 days, 18:39, 131 users,  load average: 0.10, 0.12,
 0.15
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Robert,

thank you for the patch. A few comments below:

On Mon, May 31, 2021 at 02:51:41PM +0200, Robert Marko wrote:
> Delta TN48M CPLD exposes resets for the following:
> * 88F7040 SoC
> * 88F6820 SoC
> * 98DX3265 switch MAC-s
> * 88E1680 PHY-s
> * 88E1512 PHY
> * PoE PSE controller
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/reset/Kconfig       |   9 +++
>  drivers/reset/Makefile      |   1 +
>  drivers/reset/reset-tn48m.c | 128 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 138 insertions(+)
>  create mode 100644 drivers/reset/reset-tn48m.c
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 4171c6f76385..e3ff4b020c96 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -64,6 +64,15 @@ config RESET_BRCMSTB_RESCAL
>  	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 on
>  	  BCM7216.
>  
> +config RESET_TN48M_CPLD

Please sort this alphabetically.

> +	tristate "Delta Networks TN48M switch CPLD reset controller"
> +	depends on MFD_TN48M_CPLD
> +	help
> +	  This enables the reset controller driver for the Delta TN48M CPLD.
> +	  It provides reset signals for Armada 7040 and 385 SoC-s, Alleycat 3X
> +	  switch MAC-s, Alaska OOB ethernet PHY, Quad Alaska ethernet PHY-s and
> +	  Microchip PD69200 PoE PSE controller.
> +
>  config RESET_HSDK
>  	bool "Synopsys HSDK Reset Driver"
>  	depends on HAS_IOMEM
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 65a118a91b27..6d6945638b76 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
>  obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
>  obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
>  obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
> +obj-$(CONFIG_RESET_TN48M_CPLD) += reset-tn48m.o

Same as here.

>  obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
>  obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
>  obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
> diff --git a/drivers/reset/reset-tn48m.c b/drivers/reset/reset-tn48m.c
> new file mode 100644
> index 000000000000..960ee5f4eb40
> --- /dev/null
> +++ b/drivers/reset/reset-tn48m.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Delta TN48M CPLD reset driver
> + *
> + * Copyright 2021 Sartura Ltd
> + *
> + * Author: Robert Marko <robert.marko@sartura.hr>
> + */
> +
> +#include <linux/bitfield.h>

What is this used for?

> +#include <linux/device.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +
> +#include <dt-bindings/reset/delta,tn48m-reset.h>
> +
> +#define TN48M_RESET_REG		0x10
> +
> +struct tn48_reset_map {
> +	u8 bit;
> +};
> +
> +struct tn48_reset_data {
> +	struct reset_controller_dev rcdev;
> +	struct regmap *regmap;
> +};
> +
> +static const struct tn48_reset_map tn48m_resets[] = {
> +	[CPU_88F7040_RESET] = {0},
> +	[CPU_88F6820_RESET] = {1},
> +	[MAC_98DX3265_RESET] = {2},
> +	[PHY_88E1680_RESET] = {4},
> +	[PHY_88E1512_RESET] = {6},
> +	[POE_RESET] = {7},
> +};
> +
> +static inline struct tn48_reset_data *to_tn48_reset_data(
> +			struct reset_controller_dev *rcdev)
> +{
> +	return container_of(rcdev, struct tn48_reset_data, rcdev);
> +}
> +
> +static int tn48m_control_assert(struct reset_controller_dev *rcdev,
> +				unsigned long id)
> +{
> +	struct tn48_reset_data *data = to_tn48_reset_data(rcdev);
> +
> +	return regmap_update_bits(data->regmap, TN48M_RESET_REG,
> +				  BIT(tn48m_resets[id].bit), 0);
> +}

Why is there no deassert?

> +static int tn48m_control_reset(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	return tn48m_control_assert(rcdev, id);

Is this a self-clearing (or rather self re-setting) bit that triggers a
reset pulse?
If so, assert shouldn't be implemented.

> +}
> +
> +static int tn48m_control_status(struct reset_controller_dev *rcdev,
> +				unsigned long id)
> +{
> +	struct tn48_reset_data *data = to_tn48_reset_data(rcdev);
> +	unsigned int regval;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap, TN48M_RESET_REG, &regval);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (BIT(tn48m_resets[id].bit) & regval)
> +		return 0;
> +	else
> +		return 1;
> +}
> +
> +static const struct reset_control_ops tn48_reset_ops = {
> +	.reset		= tn48m_control_reset,
> +	.assert		= tn48m_control_assert,
> +	.status		= tn48m_control_status,
> +};
> +
> +static int tn48m_reset_probe(struct platform_device *pdev)
> +{
> +	struct tn48_reset_data *data;
> +	struct regmap *regmap;
> +
> +	if (!pdev->dev.parent)
> +		return -ENODEV;

That shouldn't be necessary.

> +	regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!regmap)
> +		return -ENODEV;
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap = regmap;
> +
> +	data->rcdev.owner = THIS_MODULE;
> +	data->rcdev.ops = &tn48_reset_ops;
> +	data->rcdev.nr_resets = ARRAY_SIZE(tn48m_resets);
> +	data->rcdev.of_node = pdev->dev.of_node;
> +
> +	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
> +}
> +
> +static const struct of_device_id tn48m_reset_of_match[] = {
> +	{ .compatible = "delta,tn48m-reset", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tn48m_reset_of_match);
> +
> +static struct platform_driver tn48m_reset_driver = {
> +	.driver = {
> +		.name = "delta-tn48m-reset",
> +		.of_match_table = tn48m_reset_of_match,
> +	},
> +	.probe = tn48m_reset_probe,
> +};
> +module_platform_driver(tn48m_reset_driver);
> +
> +MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
> +MODULE_DESCRIPTION("Delta TN48M CPLD reset driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.31.1
> 
> 

regards
Philipp
