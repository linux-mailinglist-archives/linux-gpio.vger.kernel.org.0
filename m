Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0149A731EB9
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jun 2023 19:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjFORLj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jun 2023 13:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjFORLh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jun 2023 13:11:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF7E1FD4;
        Thu, 15 Jun 2023 10:11:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C55CE625E5;
        Thu, 15 Jun 2023 17:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FFFC433C8;
        Thu, 15 Jun 2023 17:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686849092;
        bh=FE5YpUrkidFe7Lt7FRUrwzyZ5iZDgR0QrsOURYfCBuk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lSnpMJpqsXZTtkc0EUup5IWgGC95x8/lsK4IS71DSt/SwtwaB1MHid7HrdqiqKLaU
         9MazKPy69vyEzB8FQeik6zg+6pHVoUF/3/15h+tqKxWRmRuZV/cMw+v5V/TvN5Uo4e
         s5OcOVYY3cX0FMAJImE56qhkE3YrErWPPQk4WQrn1nuXo9/F7sZQ35yqAlJZn6XBtd
         sAWCLi8+Ew7WUNd+RHyMTLsSWDgN1rZN8XTuQ3mATsNTamVydpijgMCPTfXjYQ2jAK
         8uU8ND/Zz0jY1vaS3pRuUIZm4zbBWDpVGmkOBu8cfM0Jz6s7UpoJsOhxp4z3003dAX
         Qx/14RdHV3uIA==
Date:   Thu, 15 Jun 2023 18:11:24 +0100
From:   Lee Jones <lee@kernel.org>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linus.walleij@linaro.org, vkoul@kernel.org, robh+dt@kernel.org,
        conor+dt@kernel.org, lgirdwood@gmail.com,
        yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
        pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] mfd: cs42l43: Add support for cs42l43 core driver
Message-ID: <20230615171124.GL3635807@google.com>
References: <20230605125504.2570158-1-ckeepax@opensource.cirrus.com>
 <20230605125504.2570158-4-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230605125504.2570158-4-ckeepax@opensource.cirrus.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 05 Jun 2023, Charles Keepax wrote:

> The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
> (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
> for portable applications. It provides a high dynamic range, stereo
> DAC for headphone output, two integrated Class D amplifiers for
> loudspeakers, and two ADCs for wired headset microphone input or
> stereo line input. PDM inputs are provided for digital microphones.
> 
> The MFD component registers and initialises the device and provides
> PM/system power management.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> No changes since v2.
> 
> Thanks,
> Charles
> 
>  MAINTAINERS                      |    2 +
>  drivers/mfd/Kconfig              |   23 +
>  drivers/mfd/Makefile             |    3 +
>  drivers/mfd/cs42l43-i2c.c        |   86 +++
>  drivers/mfd/cs42l43-sdw.c        |  213 ++++++
>  drivers/mfd/cs42l43.c            | 1141 +++++++++++++++++++++++++++++
>  drivers/mfd/cs42l43.h            |   23 +
>  include/linux/mfd/cs42l43-regs.h | 1172 ++++++++++++++++++++++++++++++
>  include/linux/mfd/cs42l43.h      |  102 +++

I'm going to have to leave it here for the time being.

This is a lot of code to review in one hit!

Please see below ...

>  9 files changed, 2765 insertions(+)
>  create mode 100644 drivers/mfd/cs42l43-i2c.c
>  create mode 100644 drivers/mfd/cs42l43-sdw.c
>  create mode 100644 drivers/mfd/cs42l43.c
>  create mode 100644 drivers/mfd/cs42l43.h
>  create mode 100644 include/linux/mfd/cs42l43-regs.h
>  create mode 100644 include/linux/mfd/cs42l43.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e0b87d5aa2e5..10ec611ea0eda 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4927,7 +4927,9 @@ L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>  L:	patches@opensource.cirrus.com
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/cirrus,cs*
> +F:	drivers/mfd/cs42l43*
>  F:	include/dt-bindings/sound/cs*
> +F:	include/linux/mfd/cs42l43*
>  F:	include/sound/cs*
>  F:	sound/pci/hda/cs*
>  F:	sound/pci/hda/hda_cs_dsp_ctl.*
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index f89f455c130a4..962160e831b35 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -237,6 +237,29 @@ config MFD_CROS_EC_DEV
>  	  To compile this driver as a module, choose M here: the module will be
>  	  called cros-ec-dev.
>  
> +config MFD_CS42L43
> +	tristate
> +	select MFD_CORE
> +	select REGMAP
> +
> +config MFD_CS42L43_I2C
> +	tristate "Cirrus Logic CS42L43 (I2C)"
> +	depends on I2C
> +	select REGMAP_I2C
> +	select MFD_CS42L43
> +	help
> +	  Select this to support the Cirrus Logic CS42L43 PC CODEC with
> +	  headphone and class D speaker drivers over I2C.
> +
> +config MFD_CS42L43_SDW
> +	tristate "Cirrus Logic CS42L43 (SoundWire)"
> +	depends on SOUNDWIRE
> +	select REGMAP_SOUNDWIRE
> +	select MFD_CS42L43
> +	help
> +	  Select this to support the Cirrus Logic CS42L43 PC CODEC with
> +	  headphone and class D speaker drivers over SoundWire.
> +
>  config MFD_MADERA
>  	tristate "Cirrus Logic Madera codecs"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 39c4615361812..4448aef5e56d1 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -13,6 +13,9 @@ obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
>  obj-$(CONFIG_MFD_BCM590XX)	+= bcm590xx.o
>  obj-$(CONFIG_MFD_BD9571MWV)	+= bd9571mwv.o
>  obj-$(CONFIG_MFD_CROS_EC_DEV)	+= cros_ec_dev.o
> +obj-$(CONFIG_MFD_CS42L43)	+= cs42l43.o
> +obj-$(CONFIG_MFD_CS42L43_I2C)	+= cs42l43-i2c.o
> +obj-$(CONFIG_MFD_CS42L43_SDW)	+= cs42l43-sdw.o
>  obj-$(CONFIG_MFD_ENE_KB3930)	+= ene-kb3930.o
>  obj-$(CONFIG_MFD_EXYNOS_LPASS)	+= exynos-lpass.o
>  obj-$(CONFIG_MFD_GATEWORKS_GSC)	+= gateworks-gsc.o
> diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
> new file mode 100644
> index 0000000000000..9ef1f20dd7a3d
> --- /dev/null
> +++ b/drivers/mfd/cs42l43-i2c.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// CS42L43 I2C driver
> +//
> +// Copyright (C) 2022-2023 Cirrus Logic, Inc. and
> +//                         Cirrus Logic International Semiconductor Ltd.
> +

I realise there is some precedent for this already in MFD.

However, I'd rather headers used C style multi-line comments.

> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +
> +#include "cs42l43.h"
> +
> +static int cs42l43_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct cs42l43 *cs42l43;
> +	int ret;
> +
> +	cs42l43 = devm_kzalloc(&i2c->dev, sizeof(*cs42l43), GFP_KERNEL);
> +	if (!cs42l43)
> +		return -ENOMEM;
> +
> +	cs42l43->dev = &i2c->dev;
> +	cs42l43->irq = i2c->irq;
> +	// I2C is always attached by definition

C please.  And everywhere else.

> +	cs42l43->attached = true;
> +
> +	cs42l43->regmap = devm_regmap_init_i2c(i2c, &cs42l43_i2c_regmap);
> +	if (IS_ERR(cs42l43->regmap)) {
> +		ret = PTR_ERR(cs42l43->regmap);
> +		dev_err(cs42l43->dev, "Failed to allocate regmap: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return cs42l43_dev_probe(cs42l43);
> +}
> +
> +static void cs42l43_i2c_remove(struct i2c_client *i2c)
> +{
> +	struct cs42l43 *cs42l43 = dev_get_drvdata(&i2c->dev);
> +
> +	cs42l43_dev_remove(cs42l43);
> +}
> +
> +static struct i2c_device_id cs42l43_i2c_id[] = {
> +	{ "cs42l43", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, cs42l43_i2c_id);

Is this required anymore?

> +#if IS_ENABLED(CONFIG_OF)
> +static const struct of_device_id cs42l43_of_match[] = {
> +	{ .compatible = "cirrus,cs42l43", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cs42l43_of_match);
> +#endif
> +
> +#if IS_ENABLED(CONFIG_ACPI)
> +static const struct acpi_device_id cs42l43_acpi_match[] = {
> +	{ "CSC4243", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, cs42l43_acpi_match);
> +#endif
> +
> +static struct i2c_driver cs42l43_i2c_driver = {
> +	.driver = {
> +		.name			= "cs42l43",
> +		.pm			= &cs42l43_pm_ops,
> +		.of_match_table		= of_match_ptr(cs42l43_of_match),
> +		.acpi_match_table	= ACPI_PTR(cs42l43_acpi_match),
> +	},
> +
> +	.probe		= cs42l43_i2c_probe,
> +	.remove		= cs42l43_i2c_remove,
> +	.id_table	= cs42l43_i2c_id,
> +};
> +module_i2c_driver(cs42l43_i2c_driver);
> +
> +MODULE_IMPORT_NS(MFD_CS42L43);
> +
> +MODULE_DESCRIPTION("CS42L43 I2C Driver");
> +MODULE_AUTHOR("Charles Keepax <ckeepax@opensource.cirrus.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
> new file mode 100644
> index 0000000000000..7b32b5004c88b
> --- /dev/null
> +++ b/drivers/mfd/cs42l43-sdw.c
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// CS42L43 SoundWire driver
> +//
> +// Copyright (C) 2022-2023 Cirrus Logic, Inc. and
> +//                         Cirrus Logic International Semiconductor Ltd.
> +
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/mfd/cs42l43-regs.h>
> +#include <linux/module.h>
> +#include <linux/device.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_registers.h>
> +#include <linux/soundwire/sdw_type.h>
> +
> +#include "cs42l43.h"
> +
> +enum cs42l43_sdw_ports {
> +	CS42L43_DMIC_DEC_ASP_PORT = 1,
> +	CS42L43_SPK_TX_PORT,
> +	CS42L43_SPDIF_HP_PORT,
> +	CS42L43_SPK_RX_PORT,
> +	CS42L43_ASP_PORT,
> +};
> +
> +static int cs42l43_read_prop(struct sdw_slave *sdw)
> +{
> +	struct sdw_slave_prop *prop = &sdw->prop;
> +	struct device *dev = &sdw->dev;
> +	struct sdw_dpn_prop *dpn;
> +	unsigned long addr;
> +	int nval;
> +	int i;
> +	u32 bit;
> +
> +	prop->use_domain_irq = true;
> +	prop->paging_support = true;
> +	prop->wake_capable = true;
> +	prop->source_ports = BIT(CS42L43_DMIC_DEC_ASP_PORT) | BIT(CS42L43_SPK_TX_PORT);
> +	prop->sink_ports = BIT(CS42L43_SPDIF_HP_PORT) |
> +			   BIT(CS42L43_SPK_RX_PORT) | BIT(CS42L43_ASP_PORT);
> +	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
> +	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY | SDW_SCP_INT1_IMPL_DEF;
> +
> +	nval = hweight32(prop->source_ports);
> +	prop->src_dpn_prop = devm_kcalloc(dev, nval, sizeof(*prop->src_dpn_prop), GFP_KERNEL);
> +	if (!prop->src_dpn_prop)
> +		return -ENOMEM;
> +
> +	i = 0;
> +	dpn = prop->src_dpn_prop;
> +	addr = prop->source_ports;
> +	for_each_set_bit(bit, &addr, 32) {
> +		dpn[i].num = bit;
> +		dpn[i].max_ch = 2;
> +		dpn[i].type = SDW_DPN_FULL;
> +		dpn[i].max_word = 24;
> +		i++;
> +	}
> +	/* All ports are 2 channels max, except the first one, CS42L43_DMIC_DEC_ASP_PORT */
> +	dpn[CS42L43_DMIC_DEC_ASP_PORT].max_ch = 4;
> +
> +	nval = hweight32(prop->sink_ports);
> +	prop->sink_dpn_prop = devm_kcalloc(dev, nval, sizeof(*prop->sink_dpn_prop), GFP_KERNEL);
> +	if (!prop->sink_dpn_prop)
> +		return -ENOMEM;
> +
> +	i = 0;
> +	dpn = prop->sink_dpn_prop;
> +	addr = prop->sink_ports;
> +	for_each_set_bit(bit, &addr, 32) {
> +		dpn[i].num = bit;
> +		dpn[i].max_ch = 2;
> +		dpn[i].type = SDW_DPN_FULL;
> +		dpn[i].max_word = 24;
> +		i++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cs42l43_sdw_update_status(struct sdw_slave *sdw, enum sdw_slave_status status)
> +{
> +	struct cs42l43 *cs42l43 = dev_get_drvdata(&sdw->dev);
> +
> +	switch (status) {
> +	case SDW_SLAVE_ATTACHED:
> +		dev_dbg(cs42l43->dev, "Device attach\n");
> +
> +		sdw_write_no_pm(sdw, CS42L43_GEN_INT_MASK_1,
> +				CS42L43_INT_STAT_GEN1_MASK);
> +
> +		cs42l43->attached = true;
> +
> +		complete(&cs42l43->device_attach);
> +		break;
> +	case SDW_SLAVE_UNATTACHED:
> +		dev_dbg(cs42l43->dev, "Device detach\n");
> +
> +		cs42l43->attached = false;
> +
> +		reinit_completion(&cs42l43->device_attach);
> +		complete(&cs42l43->device_detach);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int cs42l43_sdw_interrupt(struct sdw_slave *sdw,
> +				 struct sdw_slave_intr_status *status)
> +{
> +	/*
> +	 * The IRQ itself was handled through the regmap_irq handler, this is
> +	 * just clearing up the additional Cirrus SoundWire registers that are
> +	 * not covered by the SoundWire framework or the IRQ handler itself.
> +	 * There is only a single bit in GEN_INT_STAT_1 and it doesn't clear if
> +	 * IRQs are still pending so doing a read/write here after handling the
> +	 * IRQ is fine.
> +	 */
> +	sdw_read_no_pm(sdw, CS42L43_GEN_INT_STAT_1);
> +	sdw_write_no_pm(sdw, CS42L43_GEN_INT_STAT_1, 1);
> +
> +	return 0;
> +}
> +
> +static int cs42l43_sdw_bus_config(struct sdw_slave *sdw, struct sdw_bus_params *params)
> +{
> +	struct cs42l43 *cs42l43 = dev_get_drvdata(&sdw->dev);
> +	int ret = 0;
> +
> +	mutex_lock(&cs42l43->pll_lock);
> +
> +	if (cs42l43->sdw_freq != params->curr_dr_freq / 2) {
> +		if (cs42l43->sdw_pll_active) {
> +			dev_err(cs42l43->dev, "PLL active can't change SoundWire bus clock\n");
> +			ret = -EBUSY;
> +		} else {
> +			cs42l43->sdw_freq = params->curr_dr_freq / 2;
> +		}
> +	}
> +
> +	mutex_unlock(&cs42l43->pll_lock);
> +
> +	return ret;
> +}
> +
> +static const struct sdw_slave_ops cs42l43_sdw_ops = {
> +	.read_prop		= cs42l43_read_prop,
> +	.update_status		= cs42l43_sdw_update_status,
> +	.interrupt_callback	= cs42l43_sdw_interrupt,
> +	.bus_config		= cs42l43_sdw_bus_config,
> +};
> +
> +static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
> +{
> +	struct cs42l43 *cs42l43;
> +	struct device *dev = &sdw->dev;
> +	int ret;
> +
> +	cs42l43 = devm_kzalloc(dev, sizeof(*cs42l43), GFP_KERNEL);
> +	if (!cs42l43)
> +		return -ENOMEM;
> +
> +	cs42l43->dev = dev;
> +	cs42l43->sdw = sdw;
> +
> +	cs42l43->regmap = devm_regmap_init_sdw(sdw, &cs42l43_sdw_regmap);
> +	if (IS_ERR(cs42l43->regmap)) {
> +		ret = PTR_ERR(cs42l43->regmap);
> +		dev_err(cs42l43->dev, "Failed to allocate regmap: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return cs42l43_dev_probe(cs42l43);
> +}
> +
> +static int cs42l43_sdw_remove(struct sdw_slave *sdw)
> +{
> +	struct cs42l43 *cs42l43 = dev_get_drvdata(&sdw->dev);
> +
> +	cs42l43_dev_remove(cs42l43);
> +
> +	return 0;
> +}
> +
> +static const struct sdw_device_id cs42l43_sdw_id[] = {
> +	SDW_SLAVE_ENTRY(0x01FA, 0x4243, 0),
> +	{}
> +};
> +MODULE_DEVICE_TABLE(sdw, cs42l43_sdw_id);
> +
> +static struct sdw_driver cs42l43_sdw_driver = {
> +	.driver = {
> +		.name		= "cs42l43",
> +		.pm		= &cs42l43_pm_ops,
> +	},
> +
> +	.probe		= cs42l43_sdw_probe,
> +	.remove		= cs42l43_sdw_remove,
> +	.id_table	= cs42l43_sdw_id,
> +	.ops		= &cs42l43_sdw_ops,
> +};
> +module_sdw_driver(cs42l43_sdw_driver);
> +
> +MODULE_IMPORT_NS(MFD_CS42L43);
> +
> +MODULE_DESCRIPTION("CS42L43 SoundWire Driver");
> +MODULE_AUTHOR("Lucas Tanure <tanureal@opensource.cirrus.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
> new file mode 100644
> index 0000000000000..d2260a8b923e0
> --- /dev/null
> +++ b/drivers/mfd/cs42l43.c
> @@ -0,0 +1,1141 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// CS42L43 core driver
> +//
> +// Copyright (C) 2022-2023 Cirrus Logic, Inc. and
> +//                         Cirrus Logic International Semiconductor Ltd.
> +
> +#include <linux/bitops.h>
> +#include <linux/build_bug.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/firmware.h>
> +#include <linux/jiffies.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/cs42l43-regs.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/soundwire/sdw.h>
> +
> +#include "cs42l43.h"
> +
> +struct cs42l43_patch_header {
> +	__le16 version;
> +	__le16 size;
> +	u8 reserved;
> +	u8 secure;
> +	__le16 bss_size;
> +	__le32 apply_addr;
> +	__le32 checksum;
> +	__le32 sha;
> +	__le16 swrev;
> +	__le16 patchid;
> +	__le16 ipxid;
> +	__le16 romver;
> +	__le32 load_addr;
> +} __packed;
> +
> +static const struct reg_sequence cs42l43_reva_patch[] = {
> +	{ 0x4000,					0x00000055 },
> +	{ 0x4000,					0x000000AA },
> +	{ 0x10084,					0x00000000 },
> +	{ 0x1741C,					0x00CD2000 },
> +	{ 0x1718C,					0x00000003 },
> +	{ 0x4000,					0x00000000 },
> +	{ CS42L43_CCM_BLK_CLK_CONTROL,			0x00000002 },
> +	{ CS42L43_HPPATHVOL,				0x011B011B },
> +	{ CS42L43_OSC_DIV_SEL,				0x00000001 },
> +	{ CS42L43_DACCNFG2,				0x00000005 },
> +	{ CS42L43_MIC_DETECT_CONTROL_ANDROID,		0x80790079 },
> +	{ CS42L43_RELID,				0x0000000F },
> +};
> +
> +static const struct reg_default cs42l43_reg_default[] = {
> +	{ CS42L43_DRV_CTRL1,				0x000186C0 },
> +	{ CS42L43_DRV_CTRL3,				0x286DB018 },
> +	{ CS42L43_DRV_CTRL4,				0x000006D8 },
> +	{ CS42L43_DRV_CTRL_5,				0x136C00C0 },
> +	{ CS42L43_GPIO_CTRL1,				0x00000707 },
> +	{ CS42L43_GPIO_CTRL2,				0x00000000 },
> +	{ CS42L43_GPIO_FN_SEL,				0x00000000 },
> +	{ CS42L43_MCLK_SRC_SEL,				0x00000000 },
> +	{ CS42L43_SAMPLE_RATE1,				0x00000003 },
> +	{ CS42L43_SAMPLE_RATE2,				0x00000003 },
> +	{ CS42L43_SAMPLE_RATE3,				0x00000003 },
> +	{ CS42L43_SAMPLE_RATE4,				0x00000003 },
> +	{ CS42L43_PLL_CONTROL,				0x00000000 },
> +	{ CS42L43_FS_SELECT1,				0x00000000 },
> +	{ CS42L43_FS_SELECT2,				0x00000000 },
> +	{ CS42L43_FS_SELECT3,				0x00000000 },
> +	{ CS42L43_FS_SELECT4,				0x00000000 },
> +	{ CS42L43_PDM_CONTROL,				0x00000000 },
> +	{ CS42L43_ASP_CLK_CONFIG1,			0x00010001 },
> +	{ CS42L43_ASP_CLK_CONFIG2,			0x00000000 },
> +	{ CS42L43_OSC_DIV_SEL,				0x00000001 },
> +	{ CS42L43_ADC_B_CTRL1,				0x00000000 },
> +	{ CS42L43_ADC_B_CTRL2,				0x00000000 },
> +	{ CS42L43_DECIM_HPF_WNF_CTRL1,			0x00000001 },
> +	{ CS42L43_DECIM_HPF_WNF_CTRL2,			0x00000001 },
> +	{ CS42L43_DECIM_HPF_WNF_CTRL3,			0x00000001 },
> +	{ CS42L43_DECIM_HPF_WNF_CTRL4,			0x00000001 },
> +	{ CS42L43_DMIC_PDM_CTRL,			0x00000000 },
> +	{ CS42L43_DECIM_VOL_CTRL_CH1_CH2,		0x20122012 },
> +	{ CS42L43_DECIM_VOL_CTRL_CH3_CH4,		0x20122012 },
> +	{ CS42L43_INTP_VOLUME_CTRL1,			0x00000180 },
> +	{ CS42L43_INTP_VOLUME_CTRL2,			0x00000180 },
> +	{ CS42L43_AMP1_2_VOL_RAMP,			0x00000022 },
> +	{ CS42L43_ASP_CTRL,				0x00000004 },
> +	{ CS42L43_ASP_FSYNC_CTRL1,			0x000000FA },
> +	{ CS42L43_ASP_FSYNC_CTRL2,			0x00000001 },
> +	{ CS42L43_ASP_FSYNC_CTRL3,			0x00000000 },
> +	{ CS42L43_ASP_FSYNC_CTRL4,			0x000001F4 },
> +	{ CS42L43_ASP_DATA_CTRL,			0x0000003A },
> +	{ CS42L43_ASP_RX_EN,				0x00000000 },
> +	{ CS42L43_ASP_TX_EN,				0x00000000 },
> +	{ CS42L43_ASP_RX_CH1_CTRL,			0x00170001 },
> +	{ CS42L43_ASP_RX_CH2_CTRL,			0x00170031 },
> +	{ CS42L43_ASP_RX_CH3_CTRL,			0x00170061 },
> +	{ CS42L43_ASP_RX_CH4_CTRL,			0x00170091 },
> +	{ CS42L43_ASP_RX_CH5_CTRL,			0x001700C1 },
> +	{ CS42L43_ASP_RX_CH6_CTRL,			0x001700F1 },
> +	{ CS42L43_ASP_TX_CH1_CTRL,			0x00170001 },
> +	{ CS42L43_ASP_TX_CH2_CTRL,			0x00170031 },
> +	{ CS42L43_ASP_TX_CH3_CTRL,			0x00170061 },
> +	{ CS42L43_ASP_TX_CH4_CTRL,			0x00170091 },
> +	{ CS42L43_ASP_TX_CH5_CTRL,			0x001700C1 },
> +	{ CS42L43_ASP_TX_CH6_CTRL,			0x001700F1 },
> +	{ CS42L43_ASPTX1_INPUT,				0x00800000 },
> +	{ CS42L43_ASPTX2_INPUT,				0x00800000 },
> +	{ CS42L43_ASPTX3_INPUT,				0x00800000 },
> +	{ CS42L43_ASPTX4_INPUT,				0x00800000 },
> +	{ CS42L43_ASPTX5_INPUT,				0x00800000 },
> +	{ CS42L43_ASPTX6_INPUT,				0x00800000 },
> +	{ CS42L43_SWIRE_DP1_CH1_INPUT,			0x00800000 },
> +	{ CS42L43_SWIRE_DP1_CH2_INPUT,			0x00800000 },
> +	{ CS42L43_SWIRE_DP1_CH3_INPUT,			0x00800000 },
> +	{ CS42L43_SWIRE_DP1_CH4_INPUT,			0x00800000 },
> +	{ CS42L43_SWIRE_DP2_CH1_INPUT,			0x00800000 },
> +	{ CS42L43_SWIRE_DP2_CH2_INPUT,			0x00800000 },
> +	{ CS42L43_SWIRE_DP3_CH1_INPUT,			0x00800000 },
> +	{ CS42L43_SWIRE_DP3_CH2_INPUT,			0x00800000 },
> +	{ CS42L43_SWIRE_DP4_CH1_INPUT,			0x00800000 },
> +	{ CS42L43_SWIRE_DP4_CH2_INPUT,			0x00800000 },
> +	{ CS42L43_ASRC_INT1_INPUT1,			0x00800000 },
> +	{ CS42L43_ASRC_INT2_INPUT1,			0x00800000 },
> +	{ CS42L43_ASRC_INT3_INPUT1,			0x00800000 },
> +	{ CS42L43_ASRC_INT4_INPUT1,			0x00800000 },
> +	{ CS42L43_ASRC_DEC1_INPUT1,			0x00800000 },
> +	{ CS42L43_ASRC_DEC2_INPUT1,			0x00800000 },
> +	{ CS42L43_ASRC_DEC3_INPUT1,			0x00800000 },
> +	{ CS42L43_ASRC_DEC4_INPUT1,			0x00800000 },
> +	{ CS42L43_ISRC1INT1_INPUT1,			0x00800000 },
> +	{ CS42L43_ISRC1INT2_INPUT1,			0x00800000 },
> +	{ CS42L43_ISRC1DEC1_INPUT1,			0x00800000 },
> +	{ CS42L43_ISRC1DEC2_INPUT1,			0x00800000 },
> +	{ CS42L43_ISRC2INT1_INPUT1,			0x00800000 },
> +	{ CS42L43_ISRC2INT2_INPUT1,			0x00800000 },
> +	{ CS42L43_ISRC2DEC1_INPUT1,			0x00800000 },
> +	{ CS42L43_ISRC2DEC2_INPUT1,			0x00800000 },
> +	{ CS42L43_EQ1MIX_INPUT1,			0x00800000 },
> +	{ CS42L43_EQ1MIX_INPUT2,			0x00800000 },
> +	{ CS42L43_EQ1MIX_INPUT3,			0x00800000 },
> +	{ CS42L43_EQ1MIX_INPUT4,			0x00800000 },
> +	{ CS42L43_EQ2MIX_INPUT1,			0x00800000 },
> +	{ CS42L43_EQ2MIX_INPUT2,			0x00800000 },
> +	{ CS42L43_EQ2MIX_INPUT3,			0x00800000 },
> +	{ CS42L43_EQ2MIX_INPUT4,			0x00800000 },
> +	{ CS42L43_SPDIF1_INPUT1,			0x00800000 },
> +	{ CS42L43_SPDIF2_INPUT1,			0x00800000 },
> +	{ CS42L43_AMP1MIX_INPUT1,			0x00800000 },
> +	{ CS42L43_AMP1MIX_INPUT2,			0x00800000 },
> +	{ CS42L43_AMP1MIX_INPUT3,			0x00800000 },
> +	{ CS42L43_AMP1MIX_INPUT4,			0x00800000 },
> +	{ CS42L43_AMP2MIX_INPUT1,			0x00800000 },
> +	{ CS42L43_AMP2MIX_INPUT2,			0x00800000 },
> +	{ CS42L43_AMP2MIX_INPUT3,			0x00800000 },
> +	{ CS42L43_AMP2MIX_INPUT4,			0x00800000 },
> +	{ CS42L43_AMP3MIX_INPUT1,			0x00800000 },
> +	{ CS42L43_AMP3MIX_INPUT2,			0x00800000 },
> +	{ CS42L43_AMP3MIX_INPUT3,			0x00800000 },
> +	{ CS42L43_AMP3MIX_INPUT4,			0x00800000 },
> +	{ CS42L43_AMP4MIX_INPUT1,			0x00800000 },
> +	{ CS42L43_AMP4MIX_INPUT2,			0x00800000 },
> +	{ CS42L43_AMP4MIX_INPUT3,			0x00800000 },
> +	{ CS42L43_AMP4MIX_INPUT4,			0x00800000 },
> +	{ CS42L43_ASRC_INT_ENABLES,			0x00000100 },
> +	{ CS42L43_ASRC_DEC_ENABLES,			0x00000100 },
> +	{ CS42L43_PDNCNTL,				0x00000000 },
> +	{ CS42L43_RINGSENSE_DEB_CTRL,			0x0000001B },
> +	{ CS42L43_TIPSENSE_DEB_CTRL,			0x0000001B },
> +	{ CS42L43_HS2,					0x050106F3 },
> +	{ CS42L43_STEREO_MIC_CTRL,			0x00000000 },
> +	{ CS42L43_STEREO_MIC_CLAMP_CTRL,		0x00000001 },
> +	{ CS42L43_BLOCK_EN2,				0x00000000 },
> +	{ CS42L43_BLOCK_EN3,				0x00000000 },
> +	{ CS42L43_BLOCK_EN4,				0x00000000 },
> +	{ CS42L43_BLOCK_EN5,				0x00000000 },
> +	{ CS42L43_BLOCK_EN6,				0x00000000 },
> +	{ CS42L43_BLOCK_EN7,				0x00000000 },
> +	{ CS42L43_BLOCK_EN8,				0x00000000 },
> +	{ CS42L43_BLOCK_EN9,				0x00000000 },
> +	{ CS42L43_BLOCK_EN10,				0x00000000 },
> +	{ CS42L43_BLOCK_EN11,				0x00000000 },
> +	{ CS42L43_TONE_CH1_CTRL,			0x00000000 },
> +	{ CS42L43_TONE_CH2_CTRL,			0x00000000 },
> +	{ CS42L43_MIC_DETECT_CONTROL_1,			0x00000003 },
> +	{ CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,	0x02000003 },
> +	{ CS42L43_MIC_DETECT_CONTROL_ANDROID,		0x80790079 },
> +	{ CS42L43_ISRC1_CTRL,				0x00000000 },
> +	{ CS42L43_ISRC2_CTRL,				0x00000000 },
> +	{ CS42L43_CTRL_REG,				0x00000006 },
> +	{ CS42L43_FDIV_FRAC,				0x40000000 },
> +	{ CS42L43_CAL_RATIO,				0x00000080 },
> +	{ CS42L43_SPI_CLK_CONFIG1,			0x00000000 },
> +	{ CS42L43_SPI_CONFIG1,				0x00000000 },
> +	{ CS42L43_SPI_CONFIG2,				0x00000000 },
> +	{ CS42L43_SPI_CONFIG3,				0x00000001 },
> +	{ CS42L43_SPI_CONFIG4,				0x00000000 },
> +	{ CS42L43_TRAN_CONFIG3,				0x00000000 },
> +	{ CS42L43_TRAN_CONFIG4,				0x00000000 },
> +	{ CS42L43_TRAN_CONFIG5,				0x00000000 },
> +	{ CS42L43_TRAN_CONFIG6,				0x00000000 },
> +	{ CS42L43_TRAN_CONFIG7,				0x00000000 },
> +	{ CS42L43_TRAN_CONFIG8,				0x00000000 },
> +	{ CS42L43_DACCNFG1,				0x00000008 },
> +	{ CS42L43_DACCNFG2,				0x00000005 },
> +	{ CS42L43_HPPATHVOL,				0x011B011B },
> +	{ CS42L43_PGAVOL,				0x00003470 },
> +	{ CS42L43_LOADDETENA,				0x00000000 },
> +	{ CS42L43_CTRL,					0x00000037 },
> +	{ CS42L43_COEFF_DATA_IN0,			0x00000000 },
> +	{ CS42L43_COEFF_RD_WR0,				0x00000000 },
> +	{ CS42L43_START_EQZ0,				0x00000000 },
> +	{ CS42L43_MUTE_EQ_IN0,				0x00000000 },
> +	{ CS42L43_DECIM_MASK,				0x0000000F },
> +	{ CS42L43_EQ_MIX_MASK,				0x0000000F },
> +	{ CS42L43_ASP_MASK,				0x000000FF },
> +	{ CS42L43_PLL_MASK,				0x00000003 },
> +	{ CS42L43_SOFT_MASK,				0x0000FFFF },
> +	{ CS42L43_SWIRE_MASK,				0x00007FFF },
> +	{ CS42L43_MSM_MASK,				0x00000FFF },
> +	{ CS42L43_ACC_DET_MASK,				0x00000FFF },
> +	{ CS42L43_I2C_TGT_MASK,				0x00000003 },
> +	{ CS42L43_SPI_MSTR_MASK,			0x00000007 },
> +	{ CS42L43_SW_TO_SPI_BRIDGE_MASK,		0x00000001 },
> +	{ CS42L43_OTP_MASK,				0x00000007 },
> +	{ CS42L43_CLASS_D_AMP_MASK,			0x00003FFF },
> +	{ CS42L43_GPIO_INT_MASK,			0x0000003F },
> +	{ CS42L43_ASRC_MASK,				0x0000000F },
> +	{ CS42L43_HPOUT_MASK,				0x00000003 },
> +};
> +
> +static bool cs42l43_readable_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case CS42L43_DEVID:
> +	case CS42L43_REVID:
> +	case CS42L43_RELID:
> +	case CS42L43_SFT_RESET:
> +	case CS42L43_DRV_CTRL1:
> +	case CS42L43_DRV_CTRL3:
> +	case CS42L43_DRV_CTRL4:
> +	case CS42L43_DRV_CTRL_5:
> +	case CS42L43_GPIO_CTRL1:
> +	case CS42L43_GPIO_CTRL2:
> +	case CS42L43_GPIO_STS:
> +	case CS42L43_GPIO_FN_SEL:
> +	case CS42L43_MCLK_SRC_SEL:
> +	case CS42L43_SAMPLE_RATE1 ... CS42L43_SAMPLE_RATE4:
> +	case CS42L43_PLL_CONTROL:
> +	case CS42L43_FS_SELECT1 ... CS42L43_FS_SELECT4:
> +	case CS42L43_PDM_CONTROL:
> +	case CS42L43_ASP_CLK_CONFIG1 ... CS42L43_ASP_CLK_CONFIG2:
> +	case CS42L43_OSC_DIV_SEL:
> +	case CS42L43_ADC_B_CTRL1 ...  CS42L43_ADC_B_CTRL2:
> +	case CS42L43_DECIM_HPF_WNF_CTRL1 ... CS42L43_DECIM_HPF_WNF_CTRL4:
> +	case CS42L43_DMIC_PDM_CTRL:
> +	case CS42L43_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43_DECIM_VOL_CTRL_CH3_CH4:
> +	case CS42L43_INTP_VOLUME_CTRL1 ... CS42L43_INTP_VOLUME_CTRL2:
> +	case CS42L43_AMP1_2_VOL_RAMP:
> +	case CS42L43_ASP_CTRL:
> +	case CS42L43_ASP_FSYNC_CTRL1 ... CS42L43_ASP_FSYNC_CTRL4:
> +	case CS42L43_ASP_DATA_CTRL:
> +	case CS42L43_ASP_RX_EN ... CS42L43_ASP_TX_EN:
> +	case CS42L43_ASP_RX_CH1_CTRL ... CS42L43_ASP_RX_CH6_CTRL:
> +	case CS42L43_ASP_TX_CH1_CTRL ... CS42L43_ASP_TX_CH6_CTRL:
> +	case CS42L43_OTP_REVISION_ID:
> +	case CS42L43_ASPTX1_INPUT:
> +	case CS42L43_ASPTX2_INPUT:
> +	case CS42L43_ASPTX3_INPUT:
> +	case CS42L43_ASPTX4_INPUT:
> +	case CS42L43_ASPTX5_INPUT:
> +	case CS42L43_ASPTX6_INPUT:
> +	case CS42L43_SWIRE_DP1_CH1_INPUT:
> +	case CS42L43_SWIRE_DP1_CH2_INPUT:
> +	case CS42L43_SWIRE_DP1_CH3_INPUT:
> +	case CS42L43_SWIRE_DP1_CH4_INPUT:
> +	case CS42L43_SWIRE_DP2_CH1_INPUT:
> +	case CS42L43_SWIRE_DP2_CH2_INPUT:
> +	case CS42L43_SWIRE_DP3_CH1_INPUT:
> +	case CS42L43_SWIRE_DP3_CH2_INPUT:
> +	case CS42L43_SWIRE_DP4_CH1_INPUT:
> +	case CS42L43_SWIRE_DP4_CH2_INPUT:
> +	case CS42L43_ASRC_INT1_INPUT1:
> +	case CS42L43_ASRC_INT2_INPUT1:
> +	case CS42L43_ASRC_INT3_INPUT1:
> +	case CS42L43_ASRC_INT4_INPUT1:
> +	case CS42L43_ASRC_DEC1_INPUT1:
> +	case CS42L43_ASRC_DEC2_INPUT1:
> +	case CS42L43_ASRC_DEC3_INPUT1:
> +	case CS42L43_ASRC_DEC4_INPUT1:
> +	case CS42L43_ISRC1INT1_INPUT1:
> +	case CS42L43_ISRC1INT2_INPUT1:
> +	case CS42L43_ISRC1DEC1_INPUT1:
> +	case CS42L43_ISRC1DEC2_INPUT1:
> +	case CS42L43_ISRC2INT1_INPUT1:
> +	case CS42L43_ISRC2INT2_INPUT1:
> +	case CS42L43_ISRC2DEC1_INPUT1:
> +	case CS42L43_ISRC2DEC2_INPUT1:
> +	case CS42L43_EQ1MIX_INPUT1 ... CS42L43_EQ1MIX_INPUT4:
> +	case CS42L43_EQ2MIX_INPUT1 ... CS42L43_EQ2MIX_INPUT4:
> +	case CS42L43_SPDIF1_INPUT1:
> +	case CS42L43_SPDIF2_INPUT1:
> +	case CS42L43_AMP1MIX_INPUT1 ... CS42L43_AMP1MIX_INPUT4:
> +	case CS42L43_AMP2MIX_INPUT1 ... CS42L43_AMP2MIX_INPUT4:
> +	case CS42L43_AMP3MIX_INPUT1 ... CS42L43_AMP3MIX_INPUT4:
> +	case CS42L43_AMP4MIX_INPUT1 ... CS42L43_AMP4MIX_INPUT4:
> +	case CS42L43_ASRC_INT_ENABLES ... CS42L43_ASRC_DEC_ENABLES:
> +	case CS42L43_PDNCNTL:
> +	case CS42L43_RINGSENSE_DEB_CTRL:
> +	case CS42L43_TIPSENSE_DEB_CTRL:
> +	case CS42L43_TIP_RING_SENSE_INTERRUPT_STATUS:
> +	case CS42L43_HS2:
> +	case CS42L43_HS_STAT:
> +	case CS42L43_MCU_SW_INTERRUPT:
> +	case CS42L43_STEREO_MIC_CTRL:
> +	case CS42L43_STEREO_MIC_CLAMP_CTRL:
> +	case CS42L43_BLOCK_EN2 ... CS42L43_BLOCK_EN11:
> +	case CS42L43_TONE_CH1_CTRL ... CS42L43_TONE_CH2_CTRL:
> +	case CS42L43_MIC_DETECT_CONTROL_1:
> +	case CS42L43_DETECT_STATUS_1:
> +	case CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL:
> +	case CS42L43_MIC_DETECT_CONTROL_ANDROID:
> +	case CS42L43_ISRC1_CTRL:
> +	case CS42L43_ISRC2_CTRL:
> +	case CS42L43_CTRL_REG:
> +	case CS42L43_FDIV_FRAC:
> +	case CS42L43_CAL_RATIO:
> +	case CS42L43_SPI_CLK_CONFIG1:
> +	case CS42L43_SPI_CONFIG1 ... CS42L43_SPI_CONFIG4:
> +	case CS42L43_SPI_STATUS1 ... CS42L43_SPI_STATUS2:
> +	case CS42L43_TRAN_CONFIG1 ... CS42L43_TRAN_CONFIG8:
> +	case CS42L43_TRAN_STATUS1 ... CS42L43_TRAN_STATUS3:
> +	case CS42L43_TX_DATA:
> +	case CS42L43_RX_DATA:
> +	case CS42L43_DACCNFG1 ... CS42L43_DACCNFG2:
> +	case CS42L43_HPPATHVOL:
> +	case CS42L43_PGAVOL:
> +	case CS42L43_LOADDETRESULTS:
> +	case CS42L43_LOADDETENA:
> +	case CS42L43_CTRL:
> +	case CS42L43_COEFF_DATA_IN0:
> +	case CS42L43_COEFF_RD_WR0:
> +	case CS42L43_INIT_DONE0:
> +	case CS42L43_START_EQZ0:
> +	case CS42L43_MUTE_EQ_IN0:
> +	case CS42L43_DECIM_INT ... CS42L43_HPOUT_INT:
> +	case CS42L43_DECIM_MASK ... CS42L43_HPOUT_MASK:
> +	case CS42L43_DECIM_INT_SHADOW ... CS42L43_HP_OUT_SHADOW:
> +	case CS42L43_BOOT_CONTROL:
> +	case CS42L43_BLOCK_EN:
> +	case CS42L43_SHUTTER_CONTROL:
> +	case CS42L43_MCU_SW_REV ... CS42L43_MCU_RAM_MAX:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool cs42l43_precious_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case CS42L43_SFT_RESET:
> +	case CS42L43_TX_DATA:
> +	case CS42L43_RX_DATA:
> +	case CS42L43_DECIM_INT ... CS42L43_HPOUT_INT:
> +	case CS42L43_MCU_SW_REV ... CS42L43_MCU_RAM_MAX:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool cs42l43_volatile_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case CS42L43_DEVID:
> +	case CS42L43_REVID:
> +	case CS42L43_RELID:
> +	case CS42L43_GPIO_STS:
> +	case CS42L43_OTP_REVISION_ID:
> +	case CS42L43_TIP_RING_SENSE_INTERRUPT_STATUS:
> +	case CS42L43_HS_STAT:
> +	case CS42L43_MCU_SW_INTERRUPT:
> +	case CS42L43_DETECT_STATUS_1:
> +	case CS42L43_SPI_STATUS1 ... CS42L43_SPI_STATUS2:
> +	case CS42L43_TRAN_CONFIG1 ... CS42L43_TRAN_CONFIG2:
> +	case CS42L43_TRAN_CONFIG8:
> +	case CS42L43_TRAN_STATUS1 ... CS42L43_TRAN_STATUS3:
> +	case CS42L43_LOADDETRESULTS:
> +	case CS42L43_INIT_DONE0:
> +	case CS42L43_DECIM_INT_SHADOW ... CS42L43_HP_OUT_SHADOW:
> +	case CS42L43_BOOT_CONTROL:
> +	case CS42L43_BLOCK_EN:
> +		return true;
> +	default:
> +		return cs42l43_precious_register(dev, reg);
> +	}
> +}
> +
> +#define CS42L43_IRQ_OFFSET(reg) ((CS42L43_##reg##_INT) - CS42L43_DECIM_INT)
> +
> +#define CS42L43_IRQ_REG(name, reg) REGMAP_IRQ_REG(CS42L43_##name, \
> +						  CS42L43_IRQ_OFFSET(reg), \
> +						  CS42L43_##name##_INT_MASK)
> +
> +static const struct regmap_irq cs42l43_regmap_irqs[] = {
> +	CS42L43_IRQ_REG(PLL_LOST_LOCK,				PLL),
> +	CS42L43_IRQ_REG(PLL_READY,				PLL),
> +
> +	CS42L43_IRQ_REG(HP_STARTUP_DONE,			MSM),
> +	CS42L43_IRQ_REG(HP_SHUTDOWN_DONE,			MSM),
> +	CS42L43_IRQ_REG(HSDET_DONE,				MSM),
> +	CS42L43_IRQ_REG(TIPSENSE_UNPLUG_DB,			MSM),
> +	CS42L43_IRQ_REG(TIPSENSE_PLUG_DB,			MSM),
> +	CS42L43_IRQ_REG(RINGSENSE_UNPLUG_DB,			MSM),
> +	CS42L43_IRQ_REG(RINGSENSE_PLUG_DB,			MSM),
> +	CS42L43_IRQ_REG(TIPSENSE_UNPLUG_PDET,			MSM),
> +	CS42L43_IRQ_REG(TIPSENSE_PLUG_PDET,			MSM),
> +	CS42L43_IRQ_REG(RINGSENSE_UNPLUG_PDET,			MSM),
> +	CS42L43_IRQ_REG(RINGSENSE_PLUG_PDET,			MSM),
> +
> +	CS42L43_IRQ_REG(HS2_BIAS_SENSE,				ACC_DET),
> +	CS42L43_IRQ_REG(HS1_BIAS_SENSE,				ACC_DET),
> +	CS42L43_IRQ_REG(DC_DETECT1_FALSE,			ACC_DET),
> +	CS42L43_IRQ_REG(DC_DETECT1_TRUE,			ACC_DET),
> +	CS42L43_IRQ_REG(HSBIAS_CLAMPED,				ACC_DET),
> +	CS42L43_IRQ_REG(HS3_4_BIAS_SENSE,			ACC_DET),
> +
> +	CS42L43_IRQ_REG(AMP2_CLK_STOP_FAULT,			CLASS_D_AMP),
> +	CS42L43_IRQ_REG(AMP1_CLK_STOP_FAULT,			CLASS_D_AMP),
> +	CS42L43_IRQ_REG(AMP2_VDDSPK_FAULT,			CLASS_D_AMP),
> +	CS42L43_IRQ_REG(AMP1_VDDSPK_FAULT,			CLASS_D_AMP),
> +	CS42L43_IRQ_REG(AMP2_SHUTDOWN_DONE,			CLASS_D_AMP),
> +	CS42L43_IRQ_REG(AMP1_SHUTDOWN_DONE,			CLASS_D_AMP),
> +	CS42L43_IRQ_REG(AMP2_STARTUP_DONE,			CLASS_D_AMP),
> +	CS42L43_IRQ_REG(AMP1_STARTUP_DONE,			CLASS_D_AMP),
> +	CS42L43_IRQ_REG(AMP2_THERM_SHDN,			CLASS_D_AMP),
> +	CS42L43_IRQ_REG(AMP1_THERM_SHDN,			CLASS_D_AMP),
> +	CS42L43_IRQ_REG(AMP2_THERM_WARN,			CLASS_D_AMP),
> +	CS42L43_IRQ_REG(AMP1_THERM_WARN,			CLASS_D_AMP),
> +	CS42L43_IRQ_REG(AMP2_SCDET,				CLASS_D_AMP),
> +	CS42L43_IRQ_REG(AMP1_SCDET,				CLASS_D_AMP),
> +
> +	CS42L43_IRQ_REG(GPIO3_FALL,				GPIO),
> +	CS42L43_IRQ_REG(GPIO3_RISE,				GPIO),
> +	CS42L43_IRQ_REG(GPIO2_FALL,				GPIO),
> +	CS42L43_IRQ_REG(GPIO2_RISE,				GPIO),
> +	CS42L43_IRQ_REG(GPIO1_FALL,				GPIO),
> +	CS42L43_IRQ_REG(GPIO1_RISE,				GPIO),
> +
> +	CS42L43_IRQ_REG(HP_ILIMIT,				HPOUT),
> +	CS42L43_IRQ_REG(HP_LOADDET_DONE,			HPOUT),
> +};
> +
> +static const struct regmap_irq_chip cs42l43_irq_chip = {
> +	.name = "cs42l43",
> +
> +	.status_base = CS42L43_DECIM_INT,
> +	.mask_base = CS42L43_DECIM_MASK,
> +	.num_regs = 16,
> +
> +	.irqs = cs42l43_regmap_irqs,
> +	.num_irqs = ARRAY_SIZE(cs42l43_regmap_irqs),
> +
> +	.runtime_pm = true,
> +};
> +
> +#if IS_ENABLED(CONFIG_MFD_CS42L43_I2C)
> +const struct regmap_config cs42l43_i2c_regmap = {
> +	.reg_bits		= 32,
> +	.reg_stride		= 4,
> +	.val_bits		= 32,
> +	.reg_format_endian	= REGMAP_ENDIAN_BIG,
> +	.val_format_endian	= REGMAP_ENDIAN_BIG,
> +
> +	.max_register		= CS42L43_MCU_RAM_MAX,
> +	.readable_reg		= cs42l43_readable_register,
> +	.volatile_reg		= cs42l43_volatile_register,
> +	.precious_reg		= cs42l43_precious_register,
> +
> +	.cache_type		= REGCACHE_RBTREE,
> +	.reg_defaults		= cs42l43_reg_default,
> +	.num_reg_defaults	= ARRAY_SIZE(cs42l43_reg_default),
> +};
> +EXPORT_SYMBOL_NS_GPL(cs42l43_i2c_regmap, MFD_CS42L43);
> +#endif

We don't tend to like #ifery in C files.

Why is it required?

And why not just put them were they're consumed?

> +#if IS_ENABLED(CONFIG_MFD_CS42L43_SDW)
> +const struct regmap_config cs42l43_sdw_regmap = {
> +	.reg_bits		= 32,
> +	.reg_stride		= 4,
> +	.val_bits		= 32,
> +	.reg_format_endian	= REGMAP_ENDIAN_LITTLE,
> +	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
> +
> +	.max_register		= CS42L43_MCU_RAM_MAX,
> +	.readable_reg		= cs42l43_readable_register,
> +	.volatile_reg		= cs42l43_volatile_register,
> +	.precious_reg		= cs42l43_precious_register,
> +
> +	.cache_type		= REGCACHE_RBTREE,
> +	.reg_defaults		= cs42l43_reg_default,
> +	.num_reg_defaults	= ARRAY_SIZE(cs42l43_reg_default),
> +};
> +EXPORT_SYMBOL_NS_GPL(cs42l43_sdw_regmap, MFD_CS42L43);
> +#endif
> +
> +static const char * const cs42l43_core_supplies[] = {
> +	"vdd-a", "vdd-io", "vdd-cp",
> +};
> +
> +static const char * const cs42l43_parent_supplies[] = { "vdd-amp" };
> +
> +static const struct mfd_cell cs42l43_devs[] = {
> +	{ .name = "cs42l43-pinctrl", },
> +	{ .name = "cs42l43-spi", },
> +	{
> +		.name = "cs42l43-codec",
> +		.parent_supplies = cs42l43_parent_supplies,
> +		.num_parent_supplies = ARRAY_SIZE(cs42l43_parent_supplies),
> +	},
> +};
> +
> +static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
> +{
> +	static const struct reg_sequence reset[] = {
> +		{ CS42L43_SFT_RESET, 0x5A000000 },
> +	};
> +	unsigned long time;
> +
> +	dev_dbg(cs42l43->dev, "Soft resetting\n");

How often are you realistically going to enable these?  Can you do
without them and just add some printks when debugging?  Seems a shame to
dirty the code-base with seldom used / questionably helpful LoC.

> +	reinit_completion(&cs42l43->device_detach);
> +
> +	/* apply cache only as the device will also fall off the soundwire bus */

Grammar please.  Some capital letters missing there.

> +	regcache_cache_only(cs42l43->regmap, true);
> +	regmap_multi_reg_write_bypassed(cs42l43->regmap, reset, ARRAY_SIZE(reset));
> +
> +	msleep(20);

Why 20?

> +	if (cs42l43->sdw) {
> +		time = wait_for_completion_timeout(&cs42l43->device_detach,
> +						   msecs_to_jiffies(100));
> +		if (!time) {
> +			dev_err(cs42l43->dev, "Timed out waiting for device detach\n");
> +			return -ETIMEDOUT;
> +		}
> +	}
> +
> +	return -EAGAIN;
> +}
> +
> +static int cs42l43_wait_for_attach(struct cs42l43 *cs42l43)
> +{
> +	unsigned long time;
> +
> +	if (!cs42l43->attached) {
> +		time = wait_for_completion_timeout(&cs42l43->device_attach,
> +						   msecs_to_jiffies(500));
> +		if (!time) {
> +			dev_err(cs42l43->dev, "Timed out waiting for device re-attach\n");
> +			return -ETIMEDOUT;
> +		}
> +	}
> +
> +	regcache_cache_only(cs42l43->regmap, false);
> +
> +	// Must enable OSC_DIV before doing any SoundWire reads
> +	if (cs42l43->sdw)
> +		regmap_write(cs42l43->regmap, CS42L43_OSC_DIV_SEL, 0x1);
> +
> +	return 0;
> +}
> +
> +static int cs42l43_mcu_stage_2_3(struct cs42l43 *cs42l43, bool shadow)
> +{
> +	unsigned int need_reg = CS42L43_NEED_CONFIGS;
> +	unsigned int val;
> +	int ret;
> +
> +	if (shadow)

What's shadow?  Comment please.

> +		need_reg = CS42L43_FW_SH_BOOT_CFG_NEED_CONFIGS;
> +
> +	regmap_write(cs42l43->regmap, need_reg, 0x0);
> +
> +	ret = regmap_read_poll_timeout(cs42l43->regmap, CS42L43_BOOT_STATUS,
> +				       val, (val == 3), 5000, 20000);

Defines are easier to read than magic numbers.

> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to move to stage 3: %d, 0x%x\n", ret, val);

Stage 3 what?

Perhaps some simple function headers would help?

> +		return ret;
> +	}
> +
> +	return -EAGAIN;
> +}
> +
> +static int cs42l43_mcu_stage_3_2(struct cs42l43 *cs42l43)
> +{
> +	regmap_write(cs42l43->regmap, CS42L43_FW_CTRL_NEED_CONFIGS,
> +		     CS42L43_FW_PATCH_NEED_CFG_MASK);
> +	regmap_write(cs42l43->regmap, CS42L43_FW_CTRL_HAVE_CONFIGS, 0x0);
> +
> +	return cs42l43_soft_reset(cs42l43);
> +}
> +
> +static int cs42l43_mcu_disable(struct cs42l43 *cs42l43)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	regmap_write(cs42l43->regmap, CS42L43_FW_CTRL_MM_MCU_CFG_REG, 0xF05AA50F);

Errr, no.  Define all magic numbers please.

> +	regmap_write(cs42l43->regmap, CS42L43_FW_CTRL_MM_CTRL_SELECTION, 0x1);
> +	regmap_write(cs42l43->regmap, CS42L43_MCU_SW_INTERRUPT, CS42L43_CONTROL_IND_MASK);
> +	regmap_write(cs42l43->regmap, CS42L43_MCU_SW_INTERRUPT, 0);
> +
> +	ret = regmap_read_poll_timeout(cs42l43->regmap, CS42L43_SOFT_INT_SHADOW, val,
> +				       (val & CS42L43_CONTROL_APPLIED_INT_MASK),
> +				       5000, 20000);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to disable firmware: %d, 0x%x\n", ret, val);
> +		return ret;
> +	}
> +
> +	/* Soft reset to clear any register state the firmware left behind */
> +	return cs42l43_soft_reset(cs42l43);
> +}
> +
> +static void cs42l43_mcu_load_firmware(const struct firmware *firmware, void *context)
> +{
> +	struct cs42l43 *cs42l43 = context;
> +	const struct cs42l43_patch_header *hdr;
> +	unsigned int loadaddr, val;
> +	int ret;
> +
> +	if (!firmware) {
> +		dev_err(cs42l43->dev, "Failed to load firmware\n");
> +		cs42l43->firmware_error = -ENODEV;
> +		goto err;
> +	}
> +
> +	hdr = (const struct cs42l43_patch_header *)&firmware->data[0];
> +	loadaddr = le32_to_cpu(hdr->load_addr);
> +
> +	if (le16_to_cpu(hdr->version) != 0x3) {
> +		dev_err(cs42l43->dev, "Bad firmware file format: %d\n", hdr->version);
> +		cs42l43->firmware_error = -EINVAL;
> +		goto err_release;
> +	}
> +
> +	regmap_write(cs42l43->regmap, CS42L43_PATCH_START_ADDR, loadaddr);
> +	regmap_bulk_write(cs42l43->regmap, loadaddr + 0x100000,
> +			  &firmware->data[0], firmware->size / sizeof(u32));
> +
> +	regmap_write(cs42l43->regmap, CS42L43_MCU_SW_INTERRUPT, CS42L43_PATCH_IND_MASK);
> +	regmap_write(cs42l43->regmap, CS42L43_MCU_SW_INTERRUPT, 0);
> +
> +	ret = regmap_read_poll_timeout(cs42l43->regmap, CS42L43_SOFT_INT_SHADOW, val,
> +				       (val & CS42L43_PATCH_APPLIED_INT_MASK),
> +				       5000, 500000);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to update firmware: %d, 0x%x\n", ret, val);
> +		cs42l43->firmware_error = ret;
> +		goto err_release;
> +	}
> +
> +err_release:
> +	release_firmware(firmware);
> +err:
> +	complete(&cs42l43->firmware_download);
> +}
> +
> +static int cs42l43_mcu_update_step(struct cs42l43 *cs42l43)
> +{
> +	unsigned int mcu_rev, bios_rev, boot_status, secure_cfg;
> +	bool patched, shadow;
> +	int ret;
> +
> +	// Clear any stale software interrupt bits
> +	regmap_read(cs42l43->regmap, CS42L43_SOFT_INT, &mcu_rev);
> +
> +	ret = regmap_read(cs42l43->regmap, CS42L43_BOOT_STATUS, &boot_status);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to read boot status: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_read(cs42l43->regmap, CS42L43_MCU_SW_REV, &mcu_rev);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to read firmware revision: %d\n", ret);
> +		return ret;
> +	}
> +
> +	bios_rev = ((mcu_rev & CS42L43_BIOS_MAJOR_REV_MASK) << 12) |
> +		   ((mcu_rev & CS42L43_BIOS_MINOR_REV_MASK) << 4) |
> +		   ((mcu_rev & CS42L43_BIOS_SUBMINOR_REV_MASK) >> 8);
> +	mcu_rev = ((mcu_rev & CS42L43_FW_MAJOR_REV_MASK) << 12) |
> +		  ((mcu_rev & CS42L43_FW_MINOR_REV_MASK) << 4) |
> +		  ((mcu_rev & CS42L43_FW_SUBMINOR_REV_MASK) >> 8);
> +
> +	patched = mcu_rev >= 0x2105 || bios_rev > 0x0000;
> +	shadow = mcu_rev >= 0x2200;
> +
> +	ret = regmap_read(cs42l43->regmap, CS42L43_BOOT_CONTROL, &secure_cfg);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to read security settings: %d\n", ret);
> +		return ret;
> +	}
> +
> +	cs42l43->hw_lock = secure_cfg & CS42L43_LOCK_HW_STS_MASK;
> +
> +	if (!patched && cs42l43->hw_lock) {
> +		dev_err(cs42l43->dev, "Unpatched secure device\n");
> +		return -EPERM;
> +	}
> +
> +	dev_dbg(cs42l43->dev, "Firmware(0x%x) in boot stage %d\n", mcu_rev, boot_status);
> +
> +	switch (boot_status) {
> +	case 2:
> +		if (!patched) {
> +			ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
> +						      "cs42l43.bin", cs42l43->dev,
> +						      GFP_KERNEL, cs42l43,
> +						      cs42l43_mcu_load_firmware);
> +			if (ret) {
> +				dev_err(cs42l43->dev, "Failed to request firmware: %d\n", ret);
> +				return ret;
> +			}
> +
> +			wait_for_completion(&cs42l43->firmware_download);
> +
> +			if (cs42l43->firmware_error)
> +				return cs42l43->firmware_error;
> +
> +			return -EAGAIN;
> +		} else {
> +			return cs42l43_mcu_stage_2_3(cs42l43, shadow);
> +		}
> +	case 3:
> +		if (patched)
> +			return cs42l43_mcu_disable(cs42l43);
> +		else
> +			return cs42l43_mcu_stage_3_2(cs42l43);
> +	case 4:
> +		return 0;
> +	default:
> +		dev_err(cs42l43->dev, "Invalid boot status: %d\n", boot_status);
> +		return -EINVAL;
> +	}
> +}
> +
> +static int cs42l43_mcu_update(struct cs42l43 *cs42l43)
> +{
> +	const int update_retries = 5;
> +	int i, ret;
> +
> +	for (i = 0; i < update_retries; i++) {
> +		ret = cs42l43_mcu_update_step(cs42l43);
> +		if (ret != -EAGAIN)
> +			return ret;
> +
> +		ret = cs42l43_wait_for_attach(cs42l43);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	dev_err(cs42l43->dev, "Failed retrying update\n");
> +	return -ETIMEDOUT;
> +}
> +
> +static int cs42l43_irq_config(struct cs42l43 *cs42l43)
> +{
> +	struct irq_data *irq_data;
> +	unsigned long irq_flags;
> +	int ret;
> +
> +	if (cs42l43->sdw)
> +		cs42l43->irq = cs42l43->sdw->irq;
> +
> +	cs42l43->irq_chip = cs42l43_irq_chip;
> +	cs42l43->irq_chip.irq_drv_data = cs42l43;
> +
> +	irq_data = irq_get_irq_data(cs42l43->irq);
> +	if (!irq_data) {
> +		dev_err(cs42l43->dev, "Invalid IRQ: %d\n", cs42l43->irq);
> +		return -EINVAL;
> +	}
> +
> +	irq_flags = irqd_get_trigger_type(irq_data);
> +	switch (irq_flags) {
> +	case IRQF_TRIGGER_LOW:
> +	case IRQF_TRIGGER_HIGH:
> +	case IRQF_TRIGGER_RISING:
> +	case IRQF_TRIGGER_FALLING:
> +		break;
> +	case IRQ_TYPE_NONE:
> +	default:
> +		irq_flags = IRQF_TRIGGER_LOW;
> +		break;
> +	}
> +
> +	irq_flags |= IRQF_ONESHOT;
> +
> +	ret = devm_regmap_add_irq_chip(cs42l43->dev, cs42l43->regmap,
> +				       cs42l43->irq, irq_flags, 0,
> +				       &cs42l43->irq_chip, &cs42l43->irq_data);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to add IRQ chip: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(cs42l43->dev, "Configured IRQ %d with flags 0x%lx\n",
> +		cs42l43->irq, irq_flags);
> +
> +	return 0;
> +}
> +
> +static void cs42l43_boot_work(struct work_struct *work)
> +{
> +	struct cs42l43 *cs42l43 = container_of(work, struct cs42l43, boot_work);
> +	unsigned int devid, revid, otp;
> +	int ret;
> +
> +	ret = cs42l43_wait_for_attach(cs42l43);
> +	if (ret)
> +		goto err;
> +
> +	ret = regmap_read(cs42l43->regmap, CS42L43_DEVID, &devid);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to read devid: %d\n", ret);
> +		goto err;
> +	}
> +
> +	switch (devid) {
> +	case 0x42a43:
> +		break;
> +	default:
> +		dev_err(cs42l43->dev, "Unrecognised devid: 0x%06x\n", devid);
> +		goto err;
> +	}
> +
> +	ret = regmap_read(cs42l43->regmap, CS42L43_REVID, &revid);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to read rev: %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = regmap_read(cs42l43->regmap, CS42L43_OTP_REVISION_ID, &otp);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to read otp rev: %d\n", ret);
> +		goto err;
> +	}
> +
> +	dev_info(cs42l43->dev,
> +		 "devid: 0x%06x, rev: 0x%02x, otp: 0x%02x\n", devid, revid, otp);
> +
> +	ret = cs42l43_mcu_update(cs42l43);
> +	if (ret)
> +		goto err;
> +
> +	ret = regmap_register_patch(cs42l43->regmap, cs42l43_reva_patch,
> +				    ARRAY_SIZE(cs42l43_reva_patch));
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to apply register patch: %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = cs42l43_irq_config(cs42l43);
> +	if (ret)
> +		goto err;
> +
> +	ret = devm_mfd_add_devices(cs42l43->dev, PLATFORM_DEVID_NONE,
> +				   cs42l43_devs, ARRAY_SIZE(cs42l43_devs),
> +				   NULL, 0, NULL);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to add subdevices: %d\n", ret);
> +		goto err;
> +	}
> +
> +	pm_runtime_mark_last_busy(cs42l43->dev);
> +	pm_runtime_put_autosuspend(cs42l43->dev);
> +
> +	dev_dbg(cs42l43->dev, "Successfully initialised\n");
> +
> +	return;
> +
> +err:
> +	pm_runtime_put_sync(cs42l43->dev);
> +	cs42l43_dev_remove(cs42l43);
> +}
> +
> +static int cs42l43_power_up(struct cs42l43 *cs42l43)
> +{
> +	int ret;
> +
> +	ret = regulator_enable(cs42l43->vdd_p);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to enable vdd-p: %d\n", ret);
> +		return ret;
> +	}
> +
> +	usleep_range(50, 100); /* vdd-p must be on for 50uS before any other supply */
> +
> +	gpiod_set_value_cansleep(cs42l43->reset, 1);
> +
> +	ret = regulator_bulk_enable(CS42L43_N_SUPPLIES, cs42l43->core_supplies);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to enable core supplies: %d\n", ret);
> +		goto err_reset;
> +	}
> +
> +	ret = regulator_enable(cs42l43->vdd_d);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to enable vdd-d: %d\n", ret);
> +		goto err_core_supplies;
> +	}
> +
> +	usleep_range(1000, 2000);
> +
> +	return 0;
> +
> +err_core_supplies:
> +	regulator_bulk_disable(CS42L43_N_SUPPLIES, cs42l43->core_supplies);
> +err_reset:
> +	gpiod_set_value_cansleep(cs42l43->reset, 0);
> +	regulator_disable(cs42l43->vdd_p);
> +
> +	return ret;
> +}
> +
> +static int cs42l43_power_down(struct cs42l43 *cs42l43)
> +{
> +	int ret;
> +
> +	ret = regulator_disable(cs42l43->vdd_d);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to disable vdd-d: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_disable(CS42L43_N_SUPPLIES, cs42l43->core_supplies);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to disable core supplies: %d\n", ret);
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(cs42l43->reset, 0);
> +
> +	ret = regulator_disable(cs42l43->vdd_p);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to disable vdd-p: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int cs42l43_dev_probe(struct cs42l43 *cs42l43)
> +{
> +	int i, ret;
> +
> +	dev_set_drvdata(cs42l43->dev, cs42l43);
> +
> +	mutex_init(&cs42l43->pll_lock);
> +	init_completion(&cs42l43->device_attach);
> +	init_completion(&cs42l43->device_detach);
> +	init_completion(&cs42l43->firmware_download);
> +	INIT_WORK(&cs42l43->boot_work, cs42l43_boot_work);
> +
> +	regcache_cache_only(cs42l43->regmap, true);
> +
> +	cs42l43->reset = devm_gpiod_get_optional(cs42l43->dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(cs42l43->reset))
> +		return dev_err_probe(cs42l43->dev, PTR_ERR(cs42l43->reset),
> +				     "Failed to get reset\n");
> +
> +	cs42l43->vdd_p = devm_regulator_get(cs42l43->dev, "vdd-p");
> +	if (IS_ERR(cs42l43->vdd_p))
> +		return dev_err_probe(cs42l43->dev, PTR_ERR(cs42l43->vdd_p),
> +				     "Failed to get vdd-p\n");
> +
> +	cs42l43->vdd_d = devm_regulator_get(cs42l43->dev, "vdd-d");
> +	if (IS_ERR(cs42l43->vdd_d))
> +		return dev_err_probe(cs42l43->dev, PTR_ERR(cs42l43->vdd_d),
> +				     "Failed to get vdd-d\n");
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(cs42l43_core_supplies) != CS42L43_N_SUPPLIES);
> +
> +	for (i = 0; i < CS42L43_N_SUPPLIES; i++)
> +		cs42l43->core_supplies[i].supply = cs42l43_core_supplies[i];
> +
> +	ret = devm_regulator_bulk_get(cs42l43->dev, CS42L43_N_SUPPLIES,
> +				      cs42l43->core_supplies);
> +	if (ret)
> +		return dev_err_probe(cs42l43->dev, ret,
> +				     "Failed to get core supplies\n");
> +
> +	ret = cs42l43_power_up(cs42l43);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_autosuspend_delay(cs42l43->dev, 250);
> +	pm_runtime_use_autosuspend(cs42l43->dev);
> +	pm_runtime_set_active(cs42l43->dev);
> +	// device is already powered up, keep it from suspending until work runs
> +	pm_runtime_get_noresume(cs42l43->dev);
> +	devm_pm_runtime_enable(cs42l43->dev);
> +
> +	queue_work(system_long_wq, &cs42l43->boot_work);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(cs42l43_dev_probe, MFD_CS42L43);
> +
> +void cs42l43_dev_remove(struct cs42l43 *cs42l43)
> +{
> +	cs42l43_power_down(cs42l43);
> +}
> +EXPORT_SYMBOL_NS_GPL(cs42l43_dev_remove, MFD_CS42L43);
> +
> +static int __maybe_unused cs42l43_suspend(struct device *dev)
> +{
> +	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	dev_dbg(cs42l43->dev, "System suspend\n");
> +
> +	/*
> +	 * Don't care about being resumed here, but we do want force_resume to
> +	 * always trigger an actual resume, so that register state for the
> +	 * MCU/GPIOs is returned as soon as possible after system resume.
> +	 * force_resume will resume if the reference count is resumed on suspend
> +	 * hence the get_noresume.
> +	 */
> +	pm_runtime_get_noresume(dev);
> +
> +	ret = pm_runtime_force_suspend(dev);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to force suspend: %d\n", ret);
> +		pm_runtime_put_noidle(dev);
> +		return ret;
> +	}
> +
> +	pm_runtime_put_noidle(dev);
> +
> +	ret = cs42l43_power_down(cs42l43);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused cs42l43_resume(struct device *dev)
> +{
> +	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	dev_dbg(cs42l43->dev, "System resume\n");
> +
> +	ret = cs42l43_power_up(cs42l43);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to force resume: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused cs42l43_runtime_suspend(struct device *dev)
> +{
> +	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
> +
> +	dev_dbg(cs42l43->dev, "Runtime suspend\n");
> +
> +	/*
> +	 * Whilst we don't power the chip down here, going into runtime
> +	 * suspend lets the SoundWire bus power down, which means we can't
> +	 * communicate with the device any more.
> +	 */
> +	regcache_cache_only(cs42l43->regmap, true);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused cs42l43_runtime_resume(struct device *dev)
> +{
> +	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
> +	unsigned int reset_canary;
> +	int ret;
> +
> +	dev_dbg(cs42l43->dev, "Runtime resume\n");
> +
> +	ret = cs42l43_wait_for_attach(cs42l43);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(cs42l43->regmap, CS42L43_RELID, &reset_canary);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to check reset canary: %d\n", ret);
> +		goto err;
> +	}
> +
> +	if (!reset_canary) {
> +		/*
> +		 * If the canary has cleared the chip has reset, re-handle the
> +		 * MCU and mark the cache as dirty to indicate the chip reset.
> +		 */
> +		ret = cs42l43_mcu_update(cs42l43);
> +		if (ret)
> +			goto err;
> +
> +		regcache_mark_dirty(cs42l43->regmap);
> +	}
> +
> +	ret = regcache_sync(cs42l43->regmap);
> +	if (ret) {
> +		dev_err(cs42l43->dev, "Failed to restore register cache: %d\n", ret);
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	regcache_cache_only(cs42l43->regmap, true);
> +
> +	return ret;
> +}
> +
> +const struct dev_pm_ops cs42l43_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(cs42l43_suspend, cs42l43_resume)
> +	SET_RUNTIME_PM_OPS(cs42l43_runtime_suspend, cs42l43_runtime_resume, NULL)
> +};
> +EXPORT_SYMBOL_NS_GPL(cs42l43_pm_ops, MFD_CS42L43);
> +
> +MODULE_DESCRIPTION("CS42L43 Core Driver");
> +MODULE_AUTHOR("Charles Keepax <ckeepax@opensource.cirrus.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/cs42l43.h b/drivers/mfd/cs42l43.h
> new file mode 100644
> index 0000000000000..9983d6f13f1f5
> --- /dev/null
> +++ b/drivers/mfd/cs42l43.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * CS42L43 core driver internal data
> + *
> + * Copyright (C) 2022-2023 Cirrus Logic, Inc. and
> + *                         Cirrus Logic International Semiconductor Ltd.
> + */
> +
> +#include <linux/mfd/cs42l43.h>
> +#include <linux/pm.h>
> +#include <linux/regmap.h>
> +
> +#ifndef CS42L43_CORE_INT_H
> +#define CS42L43_CORE_INT_H
> +
> +extern const struct regmap_config cs42l43_i2c_regmap;
> +extern const struct regmap_config cs42l43_sdw_regmap;
> +extern const struct dev_pm_ops cs42l43_pm_ops;
> +
> +int cs42l43_dev_probe(struct cs42l43 *cs42l43);
> +void cs42l43_dev_remove(struct cs42l43 *cs42l43);
> +
> +#endif /* CS42L43_CORE_INT_H */
> diff --git a/include/linux/mfd/cs42l43-regs.h b/include/linux/mfd/cs42l43-regs.h
> new file mode 100644
> index 0000000000000..91c83d36f5b71
> --- /dev/null
> +++ b/include/linux/mfd/cs42l43-regs.h
> @@ -0,0 +1,1172 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * cs42l43 register definitions
> + *
> + * Copyright (c) 2022-2023 Cirrus Logic, Inc. and
> + *                         Cirrus Logic International Semiconductor Ltd.
> + */
> +
> +#ifndef CS42L43_CORE_REGS_H
> +#define CS42L43_CORE_REGS_H
> +
> +/* Registers */
> +#define CS42L43_GEN_INT_STAT_1					0x000000C0
> +#define CS42L43_GEN_INT_MASK_1					0x000000C1
> +#define CS42L43_DEVID						0x00003000
> +#define CS42L43_REVID						0x00003004
> +#define CS42L43_RELID						0x0000300C
> +#define CS42L43_SFT_RESET					0x00003020
> +#define CS42L43_DRV_CTRL1					0x00006004
> +#define CS42L43_DRV_CTRL3					0x0000600C
> +#define CS42L43_DRV_CTRL4					0x00006010
> +#define CS42L43_DRV_CTRL_5					0x00006014
> +#define CS42L43_GPIO_CTRL1					0x00006034
> +#define CS42L43_GPIO_CTRL2					0x00006038
> +#define CS42L43_GPIO_STS					0x0000603C
> +#define CS42L43_GPIO_FN_SEL					0x00006040
> +#define CS42L43_MCLK_SRC_SEL					0x00007004
> +#define CS42L43_CCM_BLK_CLK_CONTROL				0x00007010
> +#define CS42L43_SAMPLE_RATE1					0x00007014
> +#define CS42L43_SAMPLE_RATE2					0x00007018
> +#define CS42L43_SAMPLE_RATE3					0x0000701C
> +#define CS42L43_SAMPLE_RATE4					0x00007020
> +#define CS42L43_PLL_CONTROL					0x00007034
> +#define CS42L43_FS_SELECT1					0x00007038
> +#define CS42L43_FS_SELECT2					0x0000703C
> +#define CS42L43_FS_SELECT3					0x00007040
> +#define CS42L43_FS_SELECT4					0x00007044
> +#define CS42L43_PDM_CONTROL					0x0000704C
> +#define CS42L43_ASP_CLK_CONFIG1					0x00007058
> +#define CS42L43_ASP_CLK_CONFIG2					0x0000705C
> +#define CS42L43_OSC_DIV_SEL					0x00007068
> +#define CS42L43_ADC_B_CTRL1					0x00008000
> +#define CS42L43_ADC_B_CTRL2					0x00008004
> +#define CS42L43_DECIM_HPF_WNF_CTRL1				0x0000803C
> +#define CS42L43_DECIM_HPF_WNF_CTRL2				0x00008040
> +#define CS42L43_DECIM_HPF_WNF_CTRL3				0x00008044
> +#define CS42L43_DECIM_HPF_WNF_CTRL4				0x00008048
> +#define CS42L43_DMIC_PDM_CTRL					0x0000804C
> +#define CS42L43_DECIM_VOL_CTRL_CH1_CH2				0x00008050
> +#define CS42L43_DECIM_VOL_CTRL_CH3_CH4				0x00008054
> +#define CS42L43_DECIM_VOL_CTRL_UPDATE				0x00008058
> +#define CS42L43_INTP_VOLUME_CTRL1				0x00009008
> +#define CS42L43_INTP_VOLUME_CTRL2				0x0000900C
> +#define CS42L43_AMP1_2_VOL_RAMP					0x00009010
> +#define CS42L43_ASP_CTRL					0x0000A000
> +#define CS42L43_ASP_FSYNC_CTRL1					0x0000A004
> +#define CS42L43_ASP_FSYNC_CTRL2					0x0000A008
> +#define CS42L43_ASP_FSYNC_CTRL3					0x0000A00C
> +#define CS42L43_ASP_FSYNC_CTRL4					0x0000A010
> +#define CS42L43_ASP_DATA_CTRL					0x0000A018
> +#define CS42L43_ASP_RX_EN					0x0000A020
> +#define CS42L43_ASP_TX_EN					0x0000A024
> +#define CS42L43_ASP_RX_CH1_CTRL					0x0000A028
> +#define CS42L43_ASP_RX_CH2_CTRL					0x0000A02C
> +#define CS42L43_ASP_RX_CH3_CTRL					0x0000A030
> +#define CS42L43_ASP_RX_CH4_CTRL					0x0000A034
> +#define CS42L43_ASP_RX_CH5_CTRL					0x0000A038
> +#define CS42L43_ASP_RX_CH6_CTRL					0x0000A03C
> +#define CS42L43_ASP_TX_CH1_CTRL					0x0000A068
> +#define CS42L43_ASP_TX_CH2_CTRL					0x0000A06C
> +#define CS42L43_ASP_TX_CH3_CTRL					0x0000A070
> +#define CS42L43_ASP_TX_CH4_CTRL					0x0000A074
> +#define CS42L43_ASP_TX_CH5_CTRL					0x0000A078
> +#define CS42L43_ASP_TX_CH6_CTRL					0x0000A07C
> +#define CS42L43_OTP_REVISION_ID					0x0000B02C
> +#define CS42L43_ASPTX1_INPUT					0x0000C200
> +#define CS42L43_ASPTX2_INPUT					0x0000C210
> +#define CS42L43_ASPTX3_INPUT					0x0000C220
> +#define CS42L43_ASPTX4_INPUT					0x0000C230
> +#define CS42L43_ASPTX5_INPUT					0x0000C240
> +#define CS42L43_ASPTX6_INPUT					0x0000C250
> +#define CS42L43_SWIRE_DP1_CH1_INPUT				0x0000C280
> +#define CS42L43_SWIRE_DP1_CH2_INPUT				0x0000C290
> +#define CS42L43_SWIRE_DP1_CH3_INPUT				0x0000C2A0
> +#define CS42L43_SWIRE_DP1_CH4_INPUT				0x0000C2B0
> +#define CS42L43_SWIRE_DP2_CH1_INPUT				0x0000C2C0
> +#define CS42L43_SWIRE_DP2_CH2_INPUT				0x0000C2D0
> +#define CS42L43_SWIRE_DP3_CH1_INPUT				0x0000C2E0
> +#define CS42L43_SWIRE_DP3_CH2_INPUT				0x0000C2F0
> +#define CS42L43_SWIRE_DP4_CH1_INPUT				0x0000C300
> +#define CS42L43_SWIRE_DP4_CH2_INPUT				0x0000C310
> +#define CS42L43_ASRC_INT1_INPUT1				0x0000C400
> +#define CS42L43_ASRC_INT2_INPUT1				0x0000C410
> +#define CS42L43_ASRC_INT3_INPUT1				0x0000C420
> +#define CS42L43_ASRC_INT4_INPUT1				0x0000C430
> +#define CS42L43_ASRC_DEC1_INPUT1				0x0000C440
> +#define CS42L43_ASRC_DEC2_INPUT1				0x0000C450
> +#define CS42L43_ASRC_DEC3_INPUT1				0x0000C460
> +#define CS42L43_ASRC_DEC4_INPUT1				0x0000C470
> +#define CS42L43_ISRC1INT1_INPUT1				0x0000C500
> +#define CS42L43_ISRC1INT2_INPUT1				0x0000C510
> +#define CS42L43_ISRC1DEC1_INPUT1				0x0000C520
> +#define CS42L43_ISRC1DEC2_INPUT1				0x0000C530
> +#define CS42L43_ISRC2INT1_INPUT1				0x0000C540
> +#define CS42L43_ISRC2INT2_INPUT1				0x0000C550
> +#define CS42L43_ISRC2DEC1_INPUT1				0x0000C560
> +#define CS42L43_ISRC2DEC2_INPUT1				0x0000C570
> +#define CS42L43_EQ1MIX_INPUT1					0x0000C580
> +#define CS42L43_EQ1MIX_INPUT2					0x0000C584
> +#define CS42L43_EQ1MIX_INPUT3					0x0000C588
> +#define CS42L43_EQ1MIX_INPUT4					0x0000C58C
> +#define CS42L43_EQ2MIX_INPUT1					0x0000C590
> +#define CS42L43_EQ2MIX_INPUT2					0x0000C594
> +#define CS42L43_EQ2MIX_INPUT3					0x0000C598
> +#define CS42L43_EQ2MIX_INPUT4					0x0000C59C
> +#define CS42L43_SPDIF1_INPUT1					0x0000C600
> +#define CS42L43_SPDIF2_INPUT1					0x0000C610
> +#define CS42L43_AMP1MIX_INPUT1					0x0000C620
> +#define CS42L43_AMP1MIX_INPUT2					0x0000C624
> +#define CS42L43_AMP1MIX_INPUT3					0x0000C628
> +#define CS42L43_AMP1MIX_INPUT4					0x0000C62C
> +#define CS42L43_AMP2MIX_INPUT1					0x0000C630
> +#define CS42L43_AMP2MIX_INPUT2					0x0000C634
> +#define CS42L43_AMP2MIX_INPUT3					0x0000C638
> +#define CS42L43_AMP2MIX_INPUT4					0x0000C63C
> +#define CS42L43_AMP3MIX_INPUT1					0x0000C640
> +#define CS42L43_AMP3MIX_INPUT2					0x0000C644
> +#define CS42L43_AMP3MIX_INPUT3					0x0000C648
> +#define CS42L43_AMP3MIX_INPUT4					0x0000C64C
> +#define CS42L43_AMP4MIX_INPUT1					0x0000C650
> +#define CS42L43_AMP4MIX_INPUT2					0x0000C654
> +#define CS42L43_AMP4MIX_INPUT3					0x0000C658
> +#define CS42L43_AMP4MIX_INPUT4					0x0000C65C
> +#define CS42L43_ASRC_INT_ENABLES				0x0000E000
> +#define CS42L43_ASRC_DEC_ENABLES				0x0000E004
> +#define CS42L43_PDNCNTL						0x00010000
> +#define CS42L43_RINGSENSE_DEB_CTRL				0x0001001C
> +#define CS42L43_TIPSENSE_DEB_CTRL				0x00010020
> +#define CS42L43_TIP_RING_SENSE_INTERRUPT_STATUS			0x00010028
> +#define CS42L43_HS2						0x00010040
> +#define CS42L43_HS_STAT						0x00010048
> +#define CS42L43_MCU_SW_INTERRUPT				0x00010094
> +#define CS42L43_STEREO_MIC_CTRL					0x000100A4
> +#define CS42L43_STEREO_MIC_CLAMP_CTRL				0x000100C4
> +#define CS42L43_BLOCK_EN2					0x00010104
> +#define CS42L43_BLOCK_EN3					0x00010108
> +#define CS42L43_BLOCK_EN4					0x0001010C
> +#define CS42L43_BLOCK_EN5					0x00010110
> +#define CS42L43_BLOCK_EN6					0x00010114
> +#define CS42L43_BLOCK_EN7					0x00010118
> +#define CS42L43_BLOCK_EN8					0x0001011C
> +#define CS42L43_BLOCK_EN9					0x00010120
> +#define CS42L43_BLOCK_EN10					0x00010124
> +#define CS42L43_BLOCK_EN11					0x00010128
> +#define CS42L43_TONE_CH1_CTRL					0x00010134
> +#define CS42L43_TONE_CH2_CTRL					0x00010138
> +#define CS42L43_MIC_DETECT_CONTROL_1				0x00011074
> +#define CS42L43_DETECT_STATUS_1					0x0001107C
> +#define CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL		0x00011090
> +#define CS42L43_MIC_DETECT_CONTROL_ANDROID			0x000110B0
> +#define CS42L43_ISRC1_CTRL					0x00012004
> +#define CS42L43_ISRC2_CTRL					0x00013004
> +#define CS42L43_CTRL_REG					0x00014000
> +#define CS42L43_FDIV_FRAC					0x00014004
> +#define CS42L43_CAL_RATIO					0x00014008
> +#define CS42L43_SPI_CLK_CONFIG1					0x00016004
> +#define CS42L43_SPI_CONFIG1					0x00016010
> +#define CS42L43_SPI_CONFIG2					0x00016014
> +#define CS42L43_SPI_CONFIG3					0x00016018
> +#define CS42L43_SPI_CONFIG4					0x00016024
> +#define CS42L43_SPI_STATUS1					0x00016100
> +#define CS42L43_SPI_STATUS2					0x00016104
> +#define CS42L43_TRAN_CONFIG1					0x00016200
> +#define CS42L43_TRAN_CONFIG2					0x00016204
> +#define CS42L43_TRAN_CONFIG3					0x00016208
> +#define CS42L43_TRAN_CONFIG4					0x0001620C
> +#define CS42L43_TRAN_CONFIG5					0x00016220
> +#define CS42L43_TRAN_CONFIG6					0x00016224
> +#define CS42L43_TRAN_CONFIG7					0x00016228
> +#define CS42L43_TRAN_CONFIG8					0x0001622C
> +#define CS42L43_TRAN_STATUS1					0x00016300
> +#define CS42L43_TRAN_STATUS2					0x00016304
> +#define CS42L43_TRAN_STATUS3					0x00016308
> +#define CS42L43_TX_DATA						0x00016400
> +#define CS42L43_RX_DATA						0x00016600
> +#define CS42L43_DACCNFG1					0x00017000
> +#define CS42L43_DACCNFG2					0x00017004
> +#define CS42L43_HPPATHVOL					0x0001700C
> +#define CS42L43_PGAVOL						0x00017014
> +#define CS42L43_LOADDETRESULTS					0x00017018
> +#define CS42L43_LOADDETENA					0x00017024
> +#define CS42L43_CTRL						0x00017028
> +#define CS42L43_COEFF_DATA_IN0					0x00018000
> +#define CS42L43_COEFF_RD_WR0					0x00018008
> +#define CS42L43_INIT_DONE0					0x00018010
> +#define CS42L43_START_EQZ0					0x00018014
> +#define CS42L43_MUTE_EQ_IN0					0x0001801C
> +#define CS42L43_DECIM_INT					0x0001B000
> +#define CS42L43_EQ_INT						0x0001B004
> +#define CS42L43_ASP_INT						0x0001B008
> +#define CS42L43_PLL_INT						0x0001B00C
> +#define CS42L43_SOFT_INT					0x0001B010
> +#define CS42L43_SWIRE_INT					0x0001B014
> +#define CS42L43_MSM_INT						0x0001B018
> +#define CS42L43_ACC_DET_INT					0x0001B01C
> +#define CS42L43_I2C_TGT_INT					0x0001B020
> +#define CS42L43_SPI_MSTR_INT					0x0001B024
> +#define CS42L43_SW_TO_SPI_BRIDGE_INT				0x0001B028
> +#define CS42L43_OTP_INT						0x0001B02C
> +#define CS42L43_CLASS_D_AMP_INT					0x0001B030
> +#define CS42L43_GPIO_INT					0x0001B034
> +#define CS42L43_ASRC_INT					0x0001B038
> +#define CS42L43_HPOUT_INT					0x0001B03C
> +#define CS42L43_DECIM_MASK					0x0001B0A0
> +#define CS42L43_EQ_MIX_MASK					0x0001B0A4
> +#define CS42L43_ASP_MASK					0x0001B0A8
> +#define CS42L43_PLL_MASK					0x0001B0AC
> +#define CS42L43_SOFT_MASK					0x0001B0B0
> +#define CS42L43_SWIRE_MASK					0x0001B0B4
> +#define CS42L43_MSM_MASK					0x0001B0B8
> +#define CS42L43_ACC_DET_MASK					0x0001B0BC
> +#define CS42L43_I2C_TGT_MASK					0x0001B0C0
> +#define CS42L43_SPI_MSTR_MASK					0x0001B0C4
> +#define CS42L43_SW_TO_SPI_BRIDGE_MASK				0x0001B0C8
> +#define CS42L43_OTP_MASK					0x0001B0CC
> +#define CS42L43_CLASS_D_AMP_MASK				0x0001B0D0
> +#define CS42L43_GPIO_INT_MASK					0x0001B0D4
> +#define CS42L43_ASRC_MASK					0x0001B0D8
> +#define CS42L43_HPOUT_MASK					0x0001B0DC
> +#define CS42L43_DECIM_INT_SHADOW				0x0001B300
> +#define CS42L43_EQ_MIX_INT_SHADOW				0x0001B304
> +#define CS42L43_ASP_INT_SHADOW					0x0001B308
> +#define CS42L43_PLL_INT_SHADOW					0x0001B30C
> +#define CS42L43_SOFT_INT_SHADOW					0x0001B310
> +#define CS42L43_SWIRE_INT_SHADOW				0x0001B314
> +#define CS42L43_MSM_INT_SHADOW					0x0001B318
> +#define CS42L43_ACC_DET_INT_SHADOW				0x0001B31C
> +#define CS42L43_I2C_TGT_INT_SHADOW				0x0001B320
> +#define CS42L43_SPI_MSTR_INT_SHADOW				0x0001B324
> +#define CS42L43_SW_TO_SPI_BRIDGE_SHADOW				0x0001B328
> +#define CS42L43_OTP_INT_SHADOW					0x0001B32C
> +#define CS42L43_CLASS_D_AMP_INT_SHADOW				0x0001B330
> +#define CS42L43_GPIO_SHADOW					0x0001B334
> +#define CS42L43_ASRC_SHADOW					0x0001B338
> +#define CS42L43_HP_OUT_SHADOW					0x0001B33C
> +#define CS42L43_BOOT_CONTROL					0x00101000
> +#define CS42L43_BLOCK_EN					0x00101008
> +#define CS42L43_SHUTTER_CONTROL					0x0010100C
> +#define CS42L43_MCU_SW_REV					0x00114000
> +#define CS42L43_PATCH_START_ADDR				0x00114004
> +#define CS42L43_NEED_CONFIGS					0x0011400C
> +#define CS42L43_BOOT_STATUS					0x0011401C
> +#define CS42L43_FW_SH_BOOT_CFG_NEED_CONFIGS			0x0011F8F8
> +#define CS42L43_FW_CTRL_NEED_CONFIGS				0x0011FE00
> +#define CS42L43_FW_CTRL_HAVE_CONFIGS				0x0011FE04
> +#define CS42L43_FW_CTRL_MM_CTRL_SELECTION			0x0011FE0C
> +#define CS42L43_FW_CTRL_MM_MCU_CFG_REG				0x0011FE10
> +#define CS42L43_MCU_RAM_MAX					0x0011FFFF
> +
> +/* CS42L43_GEN_INT_STAT_1 */
> +#define CS42L43_INT_STAT_GEN1_MASK				0x00000001
> +#define CS42L43_INT_STAT_GEN1_SHIFT				0
> +
> +/* CS42L43_SFT_RESET */
> +#define CS42L43_SFT_RESET_MASK					0xFF000000
> +#define CS42L43_SFT_RESET_SHIFT					24
> +
> +/* CS42L43_DRV_CTRL1 */
> +#define CS42L43_ASP_DOUT_DRV_MASK				0x00038000
> +#define CS42L43_ASP_DOUT_DRV_SHIFT				15
> +#define CS42L43_ASP_FSYNC_DRV_MASK				0x00000E00
> +#define CS42L43_ASP_FSYNC_DRV_SHIFT				9
> +#define CS42L43_ASP_BCLK_DRV_MASK				0x000001C0
> +#define CS42L43_ASP_BCLK_DRV_SHIFT				6
> +
> +/* CS42L43_DRV_CTRL3 */
> +#define CS42L43_I2C_ADDR_DRV_MASK				0x30000000
> +#define CS42L43_I2C_ADDR_DRV_SHIFT				28
> +#define CS42L43_I2C_SDA_DRV_MASK				0x0C000000
> +#define CS42L43_I2C_SDA_DRV_SHIFT				26
> +#define CS42L43_PDMOUT2_CLK_DRV_MASK				0x00E00000
> +#define CS42L43_PDMOUT2_CLK_DRV_SHIFT				21
> +#define CS42L43_PDMOUT2_DATA_DRV_MASK				0x001C0000
> +#define CS42L43_PDMOUT2_DATA_DRV_SHIFT				18
> +#define CS42L43_PDMOUT1_CLK_DRV_MASK				0x00038000
> +#define CS42L43_PDMOUT1_CLK_DRV_SHIFT				15
> +#define CS42L43_PDMOUT1_DATA_DRV_MASK				0x00007000
> +#define CS42L43_PDMOUT1_DATA_DRV_SHIFT				12
> +#define CS42L43_SPI_MISO_DRV_MASK				0x00000038
> +#define CS42L43_SPI_MISO_DRV_SHIFT				3
> +
> +/* CS42L43_DRV_CTRL4 */
> +#define CS42L43_GPIO3_DRV_MASK					0x00000E00
> +#define CS42L43_GPIO3_DRV_SHIFT					9
> +#define CS42L43_GPIO2_DRV_MASK					0x000001C0
> +#define CS42L43_GPIO2_DRV_SHIFT					6
> +#define CS42L43_GPIO1_DRV_MASK					0x00000038
> +#define CS42L43_GPIO1_DRV_SHIFT					3
> +
> +/* CS42L43_DRV_CTRL_5 */
> +#define CS42L43_I2C_SCL_DRV_MASK				0x18000000
> +#define CS42L43_I2C_SCL_DRV_SHIFT				27
> +#define CS42L43_SPI_SCK_DRV_MASK				0x07000000
> +#define CS42L43_SPI_SCK_DRV_SHIFT				24
> +#define CS42L43_SPI_MOSI_DRV_MASK				0x00E00000
> +#define CS42L43_SPI_MOSI_DRV_SHIFT				21
> +#define CS42L43_SPI_SSB_DRV_MASK				0x001C0000
> +#define CS42L43_SPI_SSB_DRV_SHIFT				18
> +#define CS42L43_ASP_DIN_DRV_MASK				0x000001C0
> +#define CS42L43_ASP_DIN_DRV_SHIFT				6
> +
> +/* CS42L43_GPIO_CTRL1 */
> +#define CS42L43_GPIO3_POL_MASK					0x00040000
> +#define CS42L43_GPIO3_POL_SHIFT					18
> +#define CS42L43_GPIO2_POL_MASK					0x00020000
> +#define CS42L43_GPIO2_POL_SHIFT					17
> +#define CS42L43_GPIO1_POL_MASK					0x00010000
> +#define CS42L43_GPIO1_POL_SHIFT					16
> +#define CS42L43_GPIO3_LVL_MASK					0x00000400
> +#define CS42L43_GPIO3_LVL_SHIFT					10
> +#define CS42L43_GPIO2_LVL_MASK					0x00000200
> +#define CS42L43_GPIO2_LVL_SHIFT					9
> +#define CS42L43_GPIO1_LVL_MASK					0x00000100
> +#define CS42L43_GPIO1_LVL_SHIFT					8
> +#define CS42L43_GPIO3_DIR_MASK					0x00000004
> +#define CS42L43_GPIO3_DIR_SHIFT					2
> +#define CS42L43_GPIO2_DIR_MASK					0x00000002
> +#define CS42L43_GPIO2_DIR_SHIFT					1
> +#define CS42L43_GPIO1_DIR_MASK					0x00000001
> +#define CS42L43_GPIO1_DIR_SHIFT					0
> +
> +/* CS42L43_GPIO_CTRL2 */
> +#define CS42L43_GPIO3_DEGLITCH_BYP_MASK				0x00000004
> +#define CS42L43_GPIO3_DEGLITCH_BYP_SHIFT			2
> +#define CS42L43_GPIO2_DEGLITCH_BYP_MASK				0x00000002
> +#define CS42L43_GPIO2_DEGLITCH_BYP_SHIFT			1
> +#define CS42L43_GPIO1_DEGLITCH_BYP_MASK				0x00000001
> +#define CS42L43_GPIO1_DEGLITCH_BYP_SHIFT			0
> +
> +/* CS42L43_GPIO_STS */
> +#define CS42L43_GPIO3_STS_MASK					0x00000004
> +#define CS42L43_GPIO3_STS_SHIFT					2
> +#define CS42L43_GPIO2_STS_MASK					0x00000002
> +#define CS42L43_GPIO2_STS_SHIFT					1
> +#define CS42L43_GPIO1_STS_MASK					0x00000001
> +#define CS42L43_GPIO1_STS_SHIFT					0
> +
> +/* CS42L43_GPIO_FN_SEL */
> +#define CS42L43_GPIO3_FN_SEL_MASK				0x00000004
> +#define CS42L43_GPIO3_FN_SEL_SHIFT				2
> +#define CS42L43_GPIO1_FN_SEL_MASK				0x00000001
> +#define CS42L43_GPIO1_FN_SEL_SHIFT				0
> +
> +/* CS42L43_MCLK_SRC_SEL */
> +#define CS42L43_OSC_PLL_MCLK_SEL_MASK				0x00000001
> +#define CS42L43_OSC_PLL_MCLK_SEL_SHIFT				0
> +
> +/* CS42L43_SAMPLE_RATE1..CS42L43_SAMPLE_RATE4 */
> +#define CS42L43_SAMPLE_RATE_MASK				0x0000001F
> +#define CS42L43_SAMPLE_RATE_SHIFT				0
> +
> +/* CS42L43_PLL_CONTROL */
> +#define CS42L43_PLL_REFCLK_EN_MASK				0x00000008
> +#define CS42L43_PLL_REFCLK_EN_SHIFT				3
> +#define CS42L43_PLL_REFCLK_DIV_MASK				0x00000006
> +#define CS42L43_PLL_REFCLK_DIV_SHIFT				1
> +#define CS42L43_PLL_REFCLK_SRC_MASK				0x00000001
> +#define CS42L43_PLL_REFCLK_SRC_SHIFT				0
> +
> +/* CS42L43_FS_SELECT1 */
> +#define CS42L43_ASP_RATE_MASK					0x00000003
> +#define CS42L43_ASP_RATE_SHIFT					0
> +
> +/* CS42L43_FS_SELECT2 */
> +#define CS42L43_ASRC_DEC_OUT_RATE_MASK				0x000000C0
> +#define CS42L43_ASRC_DEC_OUT_RATE_SHIFT				6
> +#define CS42L43_ASRC_INT_OUT_RATE_MASK				0x00000030
> +#define CS42L43_ASRC_INT_OUT_RATE_SHIFT				4
> +#define CS42L43_ASRC_DEC_IN_RATE_MASK				0x0000000C
> +#define CS42L43_ASRC_DEC_IN_RATE_SHIFT				2
> +#define CS42L43_ASRC_INT_IN_RATE_MASK				0x00000003
> +#define CS42L43_ASRC_INT_IN_RATE_SHIFT				0
> +
> +/* CS42L43_FS_SELECT3 */
> +#define CS42L43_HPOUT_RATE_MASK					0x0000C000
> +#define CS42L43_HPOUT_RATE_SHIFT				14
> +#define CS42L43_EQZ_RATE_MASK					0x00003000
> +#define CS42L43_EQZ_RATE_SHIFT					12
> +#define CS42L43_DIAGGEN_RATE_MASK				0x00000C00
> +#define CS42L43_DIAGGEN_RATE_SHIFT				10
> +#define CS42L43_DECIM_CH4_RATE_MASK				0x00000300
> +#define CS42L43_DECIM_CH4_RATE_SHIFT				8
> +#define CS42L43_DECIM_CH3_RATE_MASK				0x000000C0
> +#define CS42L43_DECIM_CH3_RATE_SHIFT				6
> +#define CS42L43_DECIM_CH2_RATE_MASK				0x00000030
> +#define CS42L43_DECIM_CH2_RATE_SHIFT				4
> +#define CS42L43_DECIM_CH1_RATE_MASK				0x0000000C
> +#define CS42L43_DECIM_CH1_RATE_SHIFT				2
> +#define CS42L43_AMP1_2_RATE_MASK				0x00000003
> +#define CS42L43_AMP1_2_RATE_SHIFT				0
> +
> +/* CS42L43_FS_SELECT4 */
> +#define CS42L43_SW_DP7_RATE_MASK				0x00C00000
> +#define CS42L43_SW_DP7_RATE_SHIFT				22
> +#define CS42L43_SW_DP6_RATE_MASK				0x00300000
> +#define CS42L43_SW_DP6_RATE_SHIFT				20
> +#define CS42L43_SPDIF_RATE_MASK					0x000C0000
> +#define CS42L43_SPDIF_RATE_SHIFT				18
> +#define CS42L43_SW_DP5_RATE_MASK				0x00030000
> +#define CS42L43_SW_DP5_RATE_SHIFT				16
> +#define CS42L43_SW_DP4_RATE_MASK				0x0000C000
> +#define CS42L43_SW_DP4_RATE_SHIFT				14
> +#define CS42L43_SW_DP3_RATE_MASK				0x00003000
> +#define CS42L43_SW_DP3_RATE_SHIFT				12
> +#define CS42L43_SW_DP2_RATE_MASK				0x00000C00
> +#define CS42L43_SW_DP2_RATE_SHIFT				10
> +#define CS42L43_SW_DP1_RATE_MASK				0x00000300
> +#define CS42L43_SW_DP1_RATE_SHIFT				8
> +#define CS42L43_ISRC2_LOW_RATE_MASK				0x000000C0
> +#define CS42L43_ISRC2_LOW_RATE_SHIFT				6
> +#define CS42L43_ISRC2_HIGH_RATE_MASK				0x00000030
> +#define CS42L43_ISRC2_HIGH_RATE_SHIFT				4
> +#define CS42L43_ISRC1_LOW_RATE_MASK				0x0000000C
> +#define CS42L43_ISRC1_LOW_RATE_SHIFT				2
> +#define CS42L43_ISRC1_HIGH_RATE_MASK				0x00000003
> +#define CS42L43_ISRC1_HIGH_RATE_SHIFT				0
> +
> +/* CS42L43_PDM_CONTROL */
> +#define CS42L43_PDM2_CLK_DIV_MASK				0x0000000C
> +#define CS42L43_PDM2_CLK_DIV_SHIFT				2
> +#define CS42L43_PDM1_CLK_DIV_MASK				0x00000003
> +#define CS42L43_PDM1_CLK_DIV_SHIFT				0
> +
> +/* CS42L43_ASP_CLK_CONFIG1 */
> +#define CS42L43_ASP_BCLK_N_MASK					0x03FF0000
> +#define CS42L43_ASP_BCLK_N_SHIFT				16
> +#define CS42L43_ASP_BCLK_M_MASK					0x000003FF
> +#define CS42L43_ASP_BCLK_M_SHIFT				0
> +
> +/* CS42L43_ASP_CLK_CONFIG2 */
> +#define CS42L43_ASP_MASTER_MODE_MASK				0x00000002
> +#define CS42L43_ASP_MASTER_MODE_SHIFT				1
> +#define CS42L43_ASP_BCLK_INV_MASK				0x00000001
> +#define CS42L43_ASP_BCLK_INV_SHIFT				0
> +
> +/* CS42L43_OSC_DIV_SEL */
> +#define CS42L43_OSC_DIV2_EN_MASK				0x00000001
> +#define CS42L43_OSC_DIV2_EN_SHIFT				0
> +
> +/* CS42L43_ADC_B_CTRL1..CS42L43_ADC_B_CTRL1 */
> +#define CS42L43_PGA_WIDESWING_MODE_EN_MASK			0x00000080
> +#define CS42L43_PGA_WIDESWING_MODE_EN_SHIFT			7
> +#define CS42L43_ADC_AIN_SEL_MASK				0x00000010
> +#define CS42L43_ADC_AIN_SEL_SHIFT				4
> +#define CS42L43_ADC_PGA_GAIN_MASK				0x0000000F
> +#define CS42L43_ADC_PGA_GAIN_SHIFT				0
> +
> +/* CS42L43_DECIM_HPF_WNF_CTRL1..CS42L43_DECIM_HPF_WNF_CTRL4 */
> +#define CS42L43_DECIM_WNF_CF_MASK				0x00000070
> +#define CS42L43_DECIM_WNF_CF_SHIFT				4
> +#define CS42L43_DECIM_WNF_EN_MASK				0x00000008
> +#define CS42L43_DECIM_WNF_EN_SHIFT				3
> +#define CS42L43_DECIM_HPF_CF_MASK				0x00000006
> +#define CS42L43_DECIM_HPF_CF_SHIFT				1
> +#define CS42L43_DECIM_HPF_EN_MASK				0x00000001
> +#define CS42L43_DECIM_HPF_EN_SHIFT				0
> +
> +/* CS42L43_DMIC_PDM_CTRL */
> +#define CS42L43_PDM2R_INV_MASK					0x00000020
> +#define CS42L43_PDM2R_INV_SHIFT					5
> +#define CS42L43_PDM2L_INV_MASK					0x00000010
> +#define CS42L43_PDM2L_INV_SHIFT					4
> +#define CS42L43_PDM1R_INV_MASK					0x00000008
> +#define CS42L43_PDM1R_INV_SHIFT					3
> +#define CS42L43_PDM1L_INV_MASK					0x00000004
> +#define CS42L43_PDM1L_INV_SHIFT					2
> +
> +/* CS42L43_DECIM_VOL_CTRL_CH1_CH2 */
> +#define CS42L43_DECIM2_MUTE_MASK				0x80000000
> +#define CS42L43_DECIM2_MUTE_SHIFT				31
> +#define CS42L43_DECIM2_VOL_MASK					0x3FC00000
> +#define CS42L43_DECIM2_VOL_SHIFT				22
> +#define CS42L43_DECIM2_VD_RAMP_MASK				0x00380000
> +#define CS42L43_DECIM2_VD_RAMP_SHIFT				19
> +#define CS42L43_DECIM2_VI_RAMP_MASK				0x00070000
> +#define CS42L43_DECIM2_VI_RAMP_SHIFT				16
> +#define CS42L43_DECIM1_MUTE_MASK				0x00008000
> +#define CS42L43_DECIM1_MUTE_SHIFT				15
> +#define CS42L43_DECIM1_VOL_MASK					0x00003FC0
> +#define CS42L43_DECIM1_VOL_SHIFT				6
> +#define CS42L43_DECIM1_VD_RAMP_MASK				0x00000038
> +#define CS42L43_DECIM1_VD_RAMP_SHIFT				3
> +#define CS42L43_DECIM1_VI_RAMP_MASK				0x00000007
> +#define CS42L43_DECIM1_VI_RAMP_SHIFT				0
> +
> +/* CS42L43_DECIM_VOL_CTRL_CH3_CH4 */
> +#define CS42L43_DECIM4_MUTE_MASK				0x80000000
> +#define CS42L43_DECIM4_MUTE_SHIFT				31
> +#define CS42L43_DECIM4_VOL_MASK					0x3FC00000
> +#define CS42L43_DECIM4_VOL_SHIFT				22
> +#define CS42L43_DECIM4_VD_RAMP_MASK				0x00380000
> +#define CS42L43_DECIM4_VD_RAMP_SHIFT				19
> +#define CS42L43_DECIM4_VI_RAMP_MASK				0x00070000
> +#define CS42L43_DECIM4_VI_RAMP_SHIFT				16
> +#define CS42L43_DECIM3_MUTE_MASK				0x00008000
> +#define CS42L43_DECIM3_MUTE_SHIFT				15
> +#define CS42L43_DECIM3_VOL_MASK					0x00003FC0
> +#define CS42L43_DECIM3_VOL_SHIFT				6
> +#define CS42L43_DECIM3_VD_RAMP_MASK				0x00000038
> +#define CS42L43_DECIM3_VD_RAMP_SHIFT				3
> +#define CS42L43_DECIM3_VI_RAMP_MASK				0x00000007
> +#define CS42L43_DECIM3_VI_RAMP_SHIFT				0
> +
> +/* CS42L43_DECIM_VOL_CTRL_UPDATE */
> +#define CS42L43_DECIM4_VOL_UPDATE_MASK				0x00000008
> +#define CS42L43_DECIM4_VOL_UPDATE_SHIFT				3
> +#define CS42L43_DECIM3_VOL_UPDATE_MASK				0x00000004
> +#define CS42L43_DECIM3_VOL_UPDATE_SHIFT				2
> +#define CS42L43_DECIM2_VOL_UPDATE_MASK				0x00000002
> +#define CS42L43_DECIM2_VOL_UPDATE_SHIFT				1
> +#define CS42L43_DECIM1_VOL_UPDATE_MASK				0x00000001
> +#define CS42L43_DECIM1_VOL_UPDATE_SHIFT				0
> +
> +/* CS42L43_INTP_VOLUME_CTRL1..CS42L43_INTP_VOLUME_CTRL2 */
> +#define CS42L43_AMP1_2_VU_MASK					0x00000200
> +#define CS42L43_AMP1_2_VU_SHIFT					9
> +#define CS42L43_AMP_MUTE_MASK					0x00000100
> +#define CS42L43_AMP_MUTE_SHIFT					8
> +#define CS42L43_AMP_VOL_MASK					0x000000FF
> +#define CS42L43_AMP_VOL_SHIFT					0
> +
> +/* CS42L43_AMP1_2_VOL_RAMP */
> +#define CS42L43_AMP1_2_VD_RAMP_MASK				0x00000070
> +#define CS42L43_AMP1_2_VD_RAMP_SHIFT				4
> +#define CS42L43_AMP1_2_VI_RAMP_MASK				0x00000007
> +#define CS42L43_AMP1_2_VI_RAMP_SHIFT				0
> +
> +/* CS42L43_ASP_CTRL */
> +#define CS42L43_ASP_FSYNC_MODE_MASK				0x00000004
> +#define CS42L43_ASP_FSYNC_MODE_SHIFT				2
> +#define CS42L43_ASP_BCLK_EN_MASK				0x00000002
> +#define CS42L43_ASP_BCLK_EN_SHIFT				1
> +#define CS42L43_ASP_FSYNC_EN_MASK				0x00000001
> +#define CS42L43_ASP_FSYNC_EN_SHIFT				0
> +
> +/* CS42L43_ASP_FSYNC_CTRL1 */
> +#define CS42L43_ASP_FSYNC_M_MASK				0x0007FFFF
> +#define CS42L43_ASP_FSYNC_M_SHIFT				0
> +
> +/* CS42L43_ASP_FSYNC_CTRL3 */
> +#define CS42L43_ASP_FSYNC_IN_INV_MASK				0x00000002
> +#define CS42L43_ASP_FSYNC_IN_INV_SHIFT				1
> +#define CS42L43_ASP_FSYNC_OUT_INV_MASK				0x00000001
> +#define CS42L43_ASP_FSYNC_OUT_INV_SHIFT				0
> +
> +/* CS42L43_ASP_FSYNC_CTRL4 */
> +#define CS42L43_ASP_NUM_BCLKS_PER_FSYNC_MASK			0x00001FFE
> +#define CS42L43_ASP_NUM_BCLKS_PER_FSYNC_SHIFT			1
> +
> +/* CS42L43_ASP_DATA_CTRL */
> +#define CS42L43_ASP_FSYNC_FRAME_START_PHASE_MASK		0x00000008
> +#define CS42L43_ASP_FSYNC_FRAME_START_PHASE_SHIFT		3
> +#define CS42L43_ASP_FSYNC_FRAME_START_DLY_MASK			0x00000007
> +#define CS42L43_ASP_FSYNC_FRAME_START_DLY_SHIFT			0
> +
> +/* CS42L43_ASP_RX_EN */
> +#define CS42L43_ASP_RX_CH6_EN_MASK				0x00000020
> +#define CS42L43_ASP_RX_CH6_EN_SHIFT				5
> +#define CS42L43_ASP_RX_CH5_EN_MASK				0x00000010
> +#define CS42L43_ASP_RX_CH5_EN_SHIFT				4
> +#define CS42L43_ASP_RX_CH4_EN_MASK				0x00000008
> +#define CS42L43_ASP_RX_CH4_EN_SHIFT				3
> +#define CS42L43_ASP_RX_CH3_EN_MASK				0x00000004
> +#define CS42L43_ASP_RX_CH3_EN_SHIFT				2
> +#define CS42L43_ASP_RX_CH2_EN_MASK				0x00000002
> +#define CS42L43_ASP_RX_CH2_EN_SHIFT				1
> +#define CS42L43_ASP_RX_CH1_EN_MASK				0x00000001
> +#define CS42L43_ASP_RX_CH1_EN_SHIFT				0
> +
> +/* CS42L43_ASP_TX_EN */
> +#define CS42L43_ASP_TX_CH6_EN_MASK				0x00000020
> +#define CS42L43_ASP_TX_CH6_EN_SHIFT				5
> +#define CS42L43_ASP_TX_CH5_EN_MASK				0x00000010
> +#define CS42L43_ASP_TX_CH5_EN_SHIFT				4
> +#define CS42L43_ASP_TX_CH4_EN_MASK				0x00000008
> +#define CS42L43_ASP_TX_CH4_EN_SHIFT				3
> +#define CS42L43_ASP_TX_CH3_EN_MASK				0x00000004
> +#define CS42L43_ASP_TX_CH3_EN_SHIFT				2
> +#define CS42L43_ASP_TX_CH2_EN_MASK				0x00000002
> +#define CS42L43_ASP_TX_CH2_EN_SHIFT				1
> +#define CS42L43_ASP_TX_CH1_EN_MASK				0x00000001
> +#define CS42L43_ASP_TX_CH1_EN_SHIFT				0
> +
> +/* CS42L43_ASP_RX_CH1_CTRL..CS42L43_ASP_TX_CH6_CTRL */
> +#define CS42L43_ASP_CH_WIDTH_MASK				0x001F0000
> +#define CS42L43_ASP_CH_WIDTH_SHIFT				16
> +#define CS42L43_ASP_CH_SLOT_MASK				0x00001FFE
> +#define CS42L43_ASP_CH_SLOT_SHIFT				1
> +#define CS42L43_ASP_CH_SLOT_PHASE_MASK				0x00000001
> +#define CS42L43_ASP_CH_SLOT_PHASE_SHIFT				0
> +
> +/* CS42L43_ASPTX1_INPUT..CS42L43_AMP4MIX_INPUT4 */
> +#define CS42L43_MIXER_VOL_MASK					0x00FE0000
> +#define CS42L43_MIXER_VOL_SHIFT					17
> +#define CS42L43_MIXER_SRC_MASK					0x000001FF
> +#define CS42L43_MIXER_SRC_SHIFT					0
> +
> +/* CS42L43_ASRC_INT_ENABLES */
> +#define CS42L43_ASRC_INT4_EN_MASK				0x00000008
> +#define CS42L43_ASRC_INT4_EN_SHIFT				3
> +#define CS42L43_ASRC_INT3_EN_MASK				0x00000004
> +#define CS42L43_ASRC_INT3_EN_SHIFT				2
> +#define CS42L43_ASRC_INT2_EN_MASK				0x00000002
> +#define CS42L43_ASRC_INT2_EN_SHIFT				1
> +#define CS42L43_ASRC_INT1_EN_MASK				0x00000001
> +#define CS42L43_ASRC_INT1_EN_SHIFT				0
> +
> +/* CS42L43_ASRC_DEC_ENABLES */
> +#define CS42L43_ASRC_DEC4_EN_MASK				0x00000008
> +#define CS42L43_ASRC_DEC4_EN_SHIFT				3
> +#define CS42L43_ASRC_DEC3_EN_MASK				0x00000004
> +#define CS42L43_ASRC_DEC3_EN_SHIFT				2
> +#define CS42L43_ASRC_DEC2_EN_MASK				0x00000002
> +#define CS42L43_ASRC_DEC2_EN_SHIFT				1
> +#define CS42L43_ASRC_DEC1_EN_MASK				0x00000001
> +#define CS42L43_ASRC_DEC1_EN_SHIFT				0
> +
> +/* CS42L43_PDNCNTL */
> +#define CS42L43_RING_SENSE_EN_MASK				0x00000002
> +#define CS42L43_RING_SENSE_EN_SHIFT				1
> +
> +/* CS42L43_RINGSENSE_DEB_CTRL */
> +#define CS42L43_RINGSENSE_INV_MASK				0x00000080
> +#define CS42L43_RINGSENSE_INV_SHIFT				7
> +#define CS42L43_RINGSENSE_PULLUP_PDNB_MASK			0x00000040
> +#define CS42L43_RINGSENSE_PULLUP_PDNB_SHIFT			6
> +#define CS42L43_RINGSENSE_FALLING_DB_TIME_MASK			0x00000038
> +#define CS42L43_RINGSENSE_FALLING_DB_TIME_SHIFT			3
> +#define CS42L43_RINGSENSE_RISING_DB_TIME_MASK			0x00000007
> +#define CS42L43_RINGSENSE_RISING_DB_TIME_SHIFT			0
> +
> +/* CS42L43_TIPSENSE_DEB_CTRL */
> +#define CS42L43_TIPSENSE_INV_MASK				0x00000080
> +#define CS42L43_TIPSENSE_INV_SHIFT				7
> +#define CS42L43_TIPSENSE_FALLING_DB_TIME_MASK			0x00000038
> +#define CS42L43_TIPSENSE_FALLING_DB_TIME_SHIFT			3
> +#define CS42L43_TIPSENSE_RISING_DB_TIME_MASK			0x00000007
> +#define CS42L43_TIPSENSE_RISING_DB_TIME_SHIFT			0
> +
> +/* CS42L43_TIP_RING_SENSE_INTERRUPT_STATUS */
> +#define CS42L43_TIPSENSE_UNPLUG_DB_STS_MASK			0x00000008
> +#define CS42L43_TIPSENSE_UNPLUG_DB_STS_SHIFT			3
> +#define CS42L43_TIPSENSE_PLUG_DB_STS_MASK			0x00000004
> +#define CS42L43_TIPSENSE_PLUG_DB_STS_SHIFT			2
> +#define CS42L43_RINGSENSE_UNPLUG_DB_STS_MASK			0x00000002
> +#define CS42L43_RINGSENSE_UNPLUG_DB_STS_SHIFT			1
> +#define CS42L43_RINGSENSE_PLUG_DB_STS_MASK			0x00000001
> +#define CS42L43_RINGSENSE_PLUG_DB_STS_SHIFT			0
> +
> +/* CS42L43_HS2 */
> +#define CS42L43_HS_CLAMP_DISABLE_MASK				0x10000000
> +#define CS42L43_HS_CLAMP_DISABLE_SHIFT				28
> +#define CS42L43_HSBIAS_RAMP_MASK				0x0C000000
> +#define CS42L43_HSBIAS_RAMP_SHIFT				26
> +#define CS42L43_HSDET_MODE_MASK					0x00018000
> +#define CS42L43_HSDET_MODE_SHIFT				15
> +#define CS42L43_HSDET_MANUAL_MODE_MASK				0x00006000
> +#define CS42L43_HSDET_MANUAL_MODE_SHIFT				13
> +#define CS42L43_AUTO_HSDET_TIME_MASK				0x00000700
> +#define CS42L43_AUTO_HSDET_TIME_SHIFT				8
> +#define CS42L43_AMP3_4_GNDREF_HS3_SEL_MASK			0x00000080
> +#define CS42L43_AMP3_4_GNDREF_HS3_SEL_SHIFT			7
> +#define CS42L43_AMP3_4_GNDREF_HS4_SEL_MASK			0x00000040
> +#define CS42L43_AMP3_4_GNDREF_HS4_SEL_SHIFT			6
> +#define CS42L43_HSBIAS_GNDREF_HS3_SEL_MASK			0x00000020
> +#define CS42L43_HSBIAS_GNDREF_HS3_SEL_SHIFT			5
> +#define CS42L43_HSBIAS_GNDREF_HS4_SEL_MASK			0x00000010
> +#define CS42L43_HSBIAS_GNDREF_HS4_SEL_SHIFT			4
> +#define CS42L43_HSBIAS_OUT_HS3_SEL_MASK				0x00000008
> +#define CS42L43_HSBIAS_OUT_HS3_SEL_SHIFT			3
> +#define CS42L43_HSBIAS_OUT_HS4_SEL_MASK				0x00000004
> +#define CS42L43_HSBIAS_OUT_HS4_SEL_SHIFT			2
> +#define CS42L43_HSGND_HS3_SEL_MASK				0x00000002
> +#define CS42L43_HSGND_HS3_SEL_SHIFT				1
> +#define CS42L43_HSGND_HS4_SEL_MASK				0x00000001
> +#define CS42L43_HSGND_HS4_SEL_SHIFT				0
> +
> +/* CS42L43_HS_STAT */
> +#define CS42L43_HSDET_TYPE_STS_MASK				0x00000007
> +#define CS42L43_HSDET_TYPE_STS_SHIFT				0
> +
> +/* CS42L43_MCU_SW_INTERRUPT */
> +#define CS42L43_CONTROL_IND_MASK				0x00000004
> +#define CS42L43_CONTROL_IND_SHIFT				2
> +#define CS42L43_CONFIGS_IND_MASK				0x00000002
> +#define CS42L43_CONFIGS_IND_SHIFT				1
> +#define CS42L43_PATCH_IND_MASK					0x00000001
> +#define CS42L43_PATCH_IND_SHIFT					0
> +
> +/* CS42L43_STEREO_MIC_CTRL */
> +#define CS42L43_HS2_BIAS_SENSE_EN_MASK				0x00000020
> +#define CS42L43_HS2_BIAS_SENSE_EN_SHIFT				5
> +#define CS42L43_HS1_BIAS_SENSE_EN_MASK				0x00000010
> +#define CS42L43_HS1_BIAS_SENSE_EN_SHIFT				4
> +#define CS42L43_HS2_BIAS_EN_MASK				0x00000008
> +#define CS42L43_HS2_BIAS_EN_SHIFT				3
> +#define CS42L43_HS1_BIAS_EN_MASK				0x00000004
> +#define CS42L43_HS1_BIAS_EN_SHIFT				2
> +#define CS42L43_JACK_STEREO_CONFIG_MASK				0x00000003
> +#define CS42L43_JACK_STEREO_CONFIG_SHIFT			0
> +
> +/* CS42L43_STEREO_MIC_CLAMP_CTRL */
> +#define CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_VAL_MASK		0x00000002
> +#define CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_VAL_SHIFT		1
> +#define CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK			0x00000001
> +#define CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_SHIFT			0
> +
> +/* CS42L43_BLOCK_EN2 */
> +#define CS42L43_SPI_MSTR_EN_MASK				0x00000001
> +#define CS42L43_SPI_MSTR_EN_SHIFT				0
> +
> +/* CS42L43_BLOCK_EN3 */
> +#define CS42L43_PDM2_DIN_R_EN_MASK				0x00000020
> +#define CS42L43_PDM2_DIN_R_EN_SHIFT				5
> +#define CS42L43_PDM2_DIN_L_EN_MASK				0x00000010
> +#define CS42L43_PDM2_DIN_L_EN_SHIFT				4
> +#define CS42L43_PDM1_DIN_R_EN_MASK				0x00000008
> +#define CS42L43_PDM1_DIN_R_EN_SHIFT				3
> +#define CS42L43_PDM1_DIN_L_EN_MASK				0x00000004
> +#define CS42L43_PDM1_DIN_L_EN_SHIFT				2
> +#define CS42L43_ADC2_EN_MASK					0x00000002
> +#define CS42L43_ADC2_EN_SHIFT					1
> +#define CS42L43_ADC1_EN_MASK					0x00000001
> +#define CS42L43_ADC1_EN_SHIFT					0
> +
> +/* CS42L43_BLOCK_EN4 */
> +#define CS42L43_ASRC_DEC_BANK_EN_MASK				0x00000002
> +#define CS42L43_ASRC_DEC_BANK_EN_SHIFT				1
> +#define CS42L43_ASRC_INT_BANK_EN_MASK				0x00000001
> +#define CS42L43_ASRC_INT_BANK_EN_SHIFT				0
> +
> +/* CS42L43_BLOCK_EN5 */
> +#define CS42L43_ISRC2_BANK_EN_MASK				0x00000002
> +#define CS42L43_ISRC2_BANK_EN_SHIFT				1
> +#define CS42L43_ISRC1_BANK_EN_MASK				0x00000001
> +#define CS42L43_ISRC1_BANK_EN_SHIFT				0
> +
> +/* CS42L43_BLOCK_EN6 */
> +#define CS42L43_MIXER_EN_MASK					0x00000001
> +#define CS42L43_MIXER_EN_SHIFT					0
> +
> +/* CS42L43_BLOCK_EN7 */
> +#define CS42L43_EQ_EN_MASK					0x00000001
> +#define CS42L43_EQ_EN_SHIFT					0
> +
> +/* CS42L43_BLOCK_EN8 */
> +#define CS42L43_HP_EN_MASK					0x00000001
> +#define CS42L43_HP_EN_SHIFT					0
> +
> +/* CS42L43_BLOCK_EN9 */
> +#define CS42L43_TONE_EN_MASK					0x00000001
> +#define CS42L43_TONE_EN_SHIFT					0
> +
> +/* CS42L43_BLOCK_EN10 */
> +#define CS42L43_AMP2_EN_MASK					0x00000002
> +#define CS42L43_AMP2_EN_SHIFT					1
> +#define CS42L43_AMP1_EN_MASK					0x00000001
> +#define CS42L43_AMP1_EN_SHIFT					0
> +
> +/* CS42L43_BLOCK_EN11 */
> +#define CS42L43_SPDIF_EN_MASK					0x00000001
> +#define CS42L43_SPDIF_EN_SHIFT					0
> +
> +/* CS42L43_TONE_CH1_CTRL..CS42L43_TONE_CH2_CTRL  */
> +#define CS42L43_TONE_FREQ_MASK					0x00000070
> +#define CS42L43_TONE_FREQ_SHIFT					4
> +#define CS42L43_TONE_SEL_MASK					0x0000000F
> +#define CS42L43_TONE_SEL_SHIFT					0
> +
> +/* CS42L43_MIC_DETECT_CONTROL_1 */
> +#define CS42L43_BUTTON_DETECT_MODE_MASK				0x00000018
> +#define CS42L43_BUTTON_DETECT_MODE_SHIFT			3
> +#define CS42L43_HSBIAS_MODE_MASK				0x00000006
> +#define CS42L43_HSBIAS_MODE_SHIFT				1
> +#define CS42L43_MIC_LVL_DET_DISABLE_MASK			0x00000001
> +#define CS42L43_MIC_LVL_DET_DISABLE_SHIFT			0
> +
> +/* CS42L43_DETECT_STATUS_1 */
> +#define CS42L43_HSDET_DC_STS_MASK				0x01FF0000
> +#define CS42L43_HSDET_DC_STS_SHIFT				16
> +#define CS42L43_JACKDET_STS_MASK				0x00000080
> +#define CS42L43_JACKDET_STS_SHIFT				7
> +#define CS42L43_HSBIAS_CLAMP_STS_MASK				0x00000040
> +#define CS42L43_HSBIAS_CLAMP_STS_SHIFT				6
> +
> +/* CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL */
> +#define CS42L43_JACKDET_MODE_MASK				0xC0000000
> +#define CS42L43_JACKDET_MODE_SHIFT				30
> +#define CS42L43_JACKDET_INV_MASK				0x20000000
> +#define CS42L43_JACKDET_INV_SHIFT				29
> +#define CS42L43_JACKDET_DB_TIME_MASK				0x03000000
> +#define CS42L43_JACKDET_DB_TIME_SHIFT				24
> +#define CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK			0x00800000
> +#define CS42L43_S0_AUTO_ADCMUTE_DISABLE_SHIFT			23
> +#define CS42L43_HSBIAS_SENSE_EN_MASK				0x00000080
> +#define CS42L43_HSBIAS_SENSE_EN_SHIFT				7
> +#define CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK			0x00000040
> +#define CS42L43_AUTO_HSBIAS_CLAMP_EN_SHIFT			6
> +#define CS42L43_JACKDET_SENSE_EN_MASK				0x00000020
> +#define CS42L43_JACKDET_SENSE_EN_SHIFT				5
> +#define CS42L43_HSBIAS_SENSE_TRIP_MASK				0x00000007
> +#define CS42L43_HSBIAS_SENSE_TRIP_SHIFT				0
> +
> +/* CS42L43_MIC_DETECT_CONTROL_ANDROID */
> +#define CS42L43_HSDET_LVL_COMBWIDTH_MASK			0xC0000000
> +#define CS42L43_HSDET_LVL_COMBWIDTH_SHIFT			30
> +#define CS42L43_HSDET_LVL2_THRESH_MASK				0x01FF0000
> +#define CS42L43_HSDET_LVL2_THRESH_SHIFT				16
> +#define CS42L43_HSDET_LVL1_THRESH_MASK				0x000001FF
> +#define CS42L43_HSDET_LVL1_THRESH_SHIFT				0
> +
> +/* CS42L43_ISRC1_CTRL..CS42L43_ISRC2_CTRL */
> +#define CS42L43_ISRC_INT2_EN_MASK				0x00000200
> +#define CS42L43_ISRC_INT2_EN_SHIFT				9
> +#define CS42L43_ISRC_INT1_EN_MASK				0x00000100
> +#define CS42L43_ISRC_INT1_EN_SHIFT				8
> +#define CS42L43_ISRC_DEC2_EN_MASK				0x00000002
> +#define CS42L43_ISRC_DEC2_EN_SHIFT				1
> +#define CS42L43_ISRC_DEC1_EN_MASK				0x00000001
> +#define CS42L43_ISRC_DEC1_EN_SHIFT				0
> +
> +/* CS42L43_CTRL_REG */
> +#define CS42L43_PLL_MODE_BYPASS_500_MASK			0x00000004
> +#define CS42L43_PLL_MODE_BYPASS_500_SHIFT			2
> +#define CS42L43_PLL_MODE_BYPASS_1029_MASK			0x00000002
> +#define CS42L43_PLL_MODE_BYPASS_1029_SHIFT			1
> +#define CS42L43_PLL_EN_MASK					0x00000001
> +#define CS42L43_PLL_EN_SHIFT					0
> +
> +/* CS42L43_FDIV_FRAC */
> +#define CS42L43_PLL_DIV_INT_MASK				0xFF000000
> +#define CS42L43_PLL_DIV_INT_SHIFT				24
> +#define CS42L43_PLL_DIV_FRAC_BYTE2_MASK				0x00FF0000
> +#define CS42L43_PLL_DIV_FRAC_BYTE2_SHIFT			16
> +#define CS42L43_PLL_DIV_FRAC_BYTE1_MASK				0x0000FF00
> +#define CS42L43_PLL_DIV_FRAC_BYTE1_SHIFT			8
> +#define CS42L43_PLL_DIV_FRAC_BYTE0_MASK				0x000000FF
> +#define CS42L43_PLL_DIV_FRAC_BYTE0_SHIFT			0
> +
> +/* CS42L43_CAL_RATIO */
> +#define CS42L43_PLL_CAL_RATIO_MASK				0x000000FF
> +#define CS42L43_PLL_CAL_RATIO_SHIFT				0
> +
> +/* CS42L43_SPI_CLK_CONFIG1 */
> +#define CS42L43_SCLK_DIV_MASK					0x0000000F
> +#define CS42L43_SCLK_DIV_SHIFT					0
> +
> +/* CS42L43_SPI_CONFIG1 */
> +#define CS42L43_SPI_SS_IDLE_DUR_MASK				0x0F000000
> +#define CS42L43_SPI_SS_IDLE_DUR_SHIFT				24
> +#define CS42L43_SPI_SS_DELAY_DUR_MASK				0x000F0000
> +#define CS42L43_SPI_SS_DELAY_DUR_SHIFT				16
> +#define CS42L43_SPI_THREE_WIRE_MASK				0x00000100
> +#define CS42L43_SPI_THREE_WIRE_SHIFT				8
> +#define CS42L43_SPI_DPHA_MASK					0x00000040
> +#define CS42L43_SPI_DPHA_SHIFT					6
> +#define CS42L43_SPI_CPHA_MASK					0x00000020
> +#define CS42L43_SPI_CPHA_SHIFT					5
> +#define CS42L43_SPI_CPOL_MASK					0x00000010
> +#define CS42L43_SPI_CPOL_SHIFT					4
> +#define CS42L43_SPI_SS_SEL_MASK					0x00000007
> +#define CS42L43_SPI_SS_SEL_SHIFT				0
> +
> +/* CS42L43_SPI_CONFIG2 */
> +#define CS42L43_SPI_SS_FRC_MASK					0x00000001
> +#define CS42L43_SPI_SS_FRC_SHIFT				0
> +
> +/* CS42L43_SPI_CONFIG3 */
> +#define CS42L43_SPI_WDT_ENA_MASK				0x00000001
> +#define CS42L43_SPI_WDT_ENA_SHIFT				0
> +
> +/* CS42L43_SPI_CONFIG4 */
> +#define CS42L43_SPI_STALL_ENA_MASK				0x00010000
> +#define CS42L43_SPI_STALL_ENA_SHIFT				16
> +
> +/* CS42L43_SPI_STATUS1 */
> +#define CS42L43_SPI_ABORT_STS_MASK				0x00000002
> +#define CS42L43_SPI_ABORT_STS_SHIFT				1
> +#define CS42L43_SPI_DONE_STS_MASK				0x00000001
> +#define CS42L43_SPI_DONE_STS_SHIFT				0
> +
> +/* CS42L43_SPI_STATUS2 */
> +#define CS42L43_SPI_RX_DONE_STS_MASK				0x00000010
> +#define CS42L43_SPI_RX_DONE_STS_SHIFT				4
> +#define CS42L43_SPI_TX_DONE_STS_MASK				0x00000001
> +#define CS42L43_SPI_TX_DONE_STS_SHIFT				0
> +
> +/* CS42L43_TRAN_CONFIG1 */
> +#define CS42L43_SPI_START_MASK					0x00000001
> +#define CS42L43_SPI_START_SHIFT					0
> +
> +/* CS42L43_TRAN_CONFIG2 */
> +#define CS42L43_SPI_ABORT_MASK					0x00000001
> +#define CS42L43_SPI_ABORT_SHIFT					0
> +
> +/* CS42L43_TRAN_CONFIG3 */
> +#define CS42L43_SPI_WORD_SIZE_MASK				0x00070000
> +#define CS42L43_SPI_WORD_SIZE_SHIFT				16
> +#define CS42L43_SPI_CMD_MASK					0x00000003
> +#define CS42L43_SPI_CMD_SHIFT					0
> +
> +/* CS42L43_TRAN_CONFIG4 */
> +#define CS42L43_SPI_TX_LENGTH_MASK				0x0000FFFF
> +#define CS42L43_SPI_TX_LENGTH_SHIFT				0
> +
> +/* CS42L43_TRAN_CONFIG5 */
> +#define CS42L43_SPI_RX_LENGTH_MASK				0x0000FFFF
> +#define CS42L43_SPI_RX_LENGTH_SHIFT				0
> +
> +/* CS42L43_TRAN_CONFIG6 */
> +#define CS42L43_SPI_TX_BLOCK_LENGTH_MASK			0x0000000F
> +#define CS42L43_SPI_TX_BLOCK_LENGTH_SHIFT			0
> +
> +/* CS42L43_TRAN_CONFIG7 */
> +#define CS42L43_SPI_RX_BLOCK_LENGTH_MASK			0x0000000F
> +#define CS42L43_SPI_RX_BLOCK_LENGTH_SHIFT			0
> +
> +/* CS42L43_TRAN_CONFIG8 */
> +#define CS42L43_SPI_RX_DONE_MASK				0x00000010
> +#define CS42L43_SPI_RX_DONE_SHIFT				4
> +#define CS42L43_SPI_TX_DONE_MASK				0x00000001
> +#define CS42L43_SPI_TX_DONE_SHIFT				0
> +
> +/* CS42L43_TRAN_STATUS1 */
> +#define CS42L43_SPI_BUSY_STS_MASK				0x00000100
> +#define CS42L43_SPI_BUSY_STS_SHIFT				8
> +#define CS42L43_SPI_RX_REQUEST_MASK				0x00000010
> +#define CS42L43_SPI_RX_REQUEST_SHIFT				4
> +#define CS42L43_SPI_TX_REQUEST_MASK				0x00000001
> +#define CS42L43_SPI_TX_REQUEST_SHIFT				0
> +
> +/* CS42L43_TRAN_STATUS2 */
> +#define CS42L43_SPI_TX_BYTE_COUNT_MASK				0x0000FFFF
> +#define CS42L43_SPI_TX_BYTE_COUNT_SHIFT				0
> +
> +/* CS42L43_TRAN_STATUS3 */
> +#define CS42L43_SPI_RX_BYTE_COUNT_MASK				0x0000FFFF
> +#define CS42L43_SPI_RX_BYTE_COUNT_SHIFT				0
> +
> +/* CS42L43_TX_DATA */
> +#define CS42L43_SPI_TX_DATA_MASK				0xFFFFFFFF
> +#define CS42L43_SPI_TX_DATA_SHIFT				0
> +
> +/* CS42L43_RX_DATA */
> +#define CS42L43_SPI_RX_DATA_MASK				0xFFFFFFFF
> +#define CS42L43_SPI_RX_DATA_SHIFT				0
> +
> +/* CS42L43_DACCNFG1 */
> +#define CS42L43_HP_MSTR_VOL_CTRL_EN_MASK			0x00000008
> +#define CS42L43_HP_MSTR_VOL_CTRL_EN_SHIFT			3
> +#define CS42L43_AMP4_INV_MASK					0x00000002
> +#define CS42L43_AMP4_INV_SHIFT					1
> +#define CS42L43_AMP3_INV_MASK					0x00000001
> +#define CS42L43_AMP3_INV_SHIFT					0
> +
> +/* CS42L43_DACCNFG2 */
> +#define CS42L43_HP_AUTO_CLAMP_DISABLE_MASK			0x00000002
> +#define CS42L43_HP_AUTO_CLAMP_DISABLE_SHIFT			1
> +#define CS42L43_HP_HPF_EN_MASK					0x00000001
> +#define CS42L43_HP_HPF_EN_SHIFT					0
> +
> +/* CS42L43_HPPATHVOL */
> +#define CS42L43_AMP4_PATH_VOL_MASK				0x01FF0000
> +#define CS42L43_AMP4_PATH_VOL_SHIFT				16
> +#define CS42L43_AMP3_PATH_VOL_MASK				0x000001FF
> +#define CS42L43_AMP3_PATH_VOL_SHIFT				0
> +
> +/* CS42L43_PGAVOL */
> +#define CS42L43_HP_PATH_VOL_RAMP_MASK				0x0003C000
> +#define CS42L43_HP_PATH_VOL_RAMP_SHIFT				14
> +#define CS42L43_HP_PATH_VOL_ZC_MASK				0x00002000
> +#define CS42L43_HP_PATH_VOL_ZC_SHIFT				13
> +#define CS42L43_HP_PATH_VOL_SFT_MASK				0x00001000
> +#define CS42L43_HP_PATH_VOL_SFT_SHIFT				12
> +#define CS42L43_HP_DIG_VOL_RAMP_MASK				0x00000F00
> +#define CS42L43_HP_DIG_VOL_RAMP_SHIFT				8
> +#define CS42L43_HP_ANA_VOL_RAMP_MASK				0x0000000F
> +#define CS42L43_HP_ANA_VOL_RAMP_SHIFT				0
> +
> +/* CS42L43_LOADDETRESULTS */
> +#define CS42L43_AMP3_RES_DET_MASK				0x00000003
> +#define CS42L43_AMP3_RES_DET_SHIFT				0
> +
> +/* CS42L43_LOADDETENA */
> +#define CS42L43_HPLOAD_DET_EN_MASK				0x00000001
> +#define CS42L43_HPLOAD_DET_EN_SHIFT				0
> +
> +/* CS42L43_CTRL */
> +#define CS42L43_ADPTPWR_MODE_MASK				0x00000007
> +#define CS42L43_ADPTPWR_MODE_SHIFT				0
> +
> +/* CS42L43_COEFF_RD_WR0 */
> +#define CS42L43_WRITE_MODE_MASK					0x00000002
> +#define CS42L43_WRITE_MODE_SHIFT				1
> +
> +/* CS42L43_INIT_DONE0 */
> +#define CS42L43_INITIALIZE_DONE_MASK				0x00000001
> +#define CS42L43_INITIALIZE_DONE_SHIFT				0
> +
> +/* CS42L43_START_EQZ0 */
> +#define CS42L43_START_FILTER_MASK				0x00000001
> +#define CS42L43_START_FILTER_SHIFT				0
> +
> +/* CS42L43_MUTE_EQ_IN0 */
> +#define CS42L43_MUTE_EQ_CH2_MASK				0x00000002
> +#define CS42L43_MUTE_EQ_CH2_SHIFT				1
> +#define CS42L43_MUTE_EQ_CH1_MASK				0x00000001
> +#define CS42L43_MUTE_EQ_CH1_SHIFT				0
> +
> +/* CS42L43_PLL_INT */
> +#define CS42L43_PLL_LOST_LOCK_INT_MASK				0x00000002
> +#define CS42L43_PLL_LOST_LOCK_INT_SHIFT				1
> +#define CS42L43_PLL_READY_INT_MASK				0x00000001
> +#define CS42L43_PLL_READY_INT_SHIFT				0
> +
> +/* CS42L43_SOFT_INT */
> +#define CS42L43_CONTROL_APPLIED_INT_MASK			0x00000010
> +#define CS42L43_CONTROL_APPLIED_INT_SHIFT			4
> +#define CS42L43_CONTROL_WARN_INT_MASK				0x00000008
> +#define CS42L43_CONTROL_WARN_INT_SHIFT				3
> +#define CS42L43_PATCH_WARN_INT_MASK				0x00000002
> +#define CS42L43_PATCH_WARN_INT_SHIFT				1
> +#define CS42L43_PATCH_APPLIED_INT_MASK				0x00000001
> +#define CS42L43_PATCH_APPLIED_INT_SHIFT				0
> +
> +/* CS42L43_MSM_INT */
> +#define CS42L43_HP_STARTUP_DONE_INT_MASK			0x00000800
> +#define CS42L43_HP_STARTUP_DONE_INT_SHIFT			11
> +#define CS42L43_HP_SHUTDOWN_DONE_INT_MASK			0x00000400
> +#define CS42L43_HP_SHUTDOWN_DONE_INT_SHIFT			10
> +#define CS42L43_HSDET_DONE_INT_MASK				0x00000200
> +#define CS42L43_HSDET_DONE_INT_SHIFT				9
> +#define CS42L43_TIPSENSE_UNPLUG_DB_INT_MASK			0x00000080
> +#define CS42L43_TIPSENSE_UNPLUG_DB_INT_SHIFT			7
> +#define CS42L43_TIPSENSE_PLUG_DB_INT_MASK			0x00000040
> +#define CS42L43_TIPSENSE_PLUG_DB_INT_SHIFT			6
> +#define CS42L43_RINGSENSE_UNPLUG_DB_INT_MASK			0x00000020
> +#define CS42L43_RINGSENSE_UNPLUG_DB_INT_SHIFT			5
> +#define CS42L43_RINGSENSE_PLUG_DB_INT_MASK			0x00000010
> +#define CS42L43_RINGSENSE_PLUG_DB_INT_SHIFT			4
> +#define CS42L43_TIPSENSE_UNPLUG_PDET_INT_MASK			0x00000008
> +#define CS42L43_TIPSENSE_UNPLUG_PDET_INT_SHIFT			3
> +#define CS42L43_TIPSENSE_PLUG_PDET_INT_MASK			0x00000004
> +#define CS42L43_TIPSENSE_PLUG_PDET_INT_SHIFT			2
> +#define CS42L43_RINGSENSE_UNPLUG_PDET_INT_MASK			0x00000002
> +#define CS42L43_RINGSENSE_UNPLUG_PDET_INT_SHIFT			1
> +#define CS42L43_RINGSENSE_PLUG_PDET_INT_MASK			0x00000001
> +#define CS42L43_RINGSENSE_PLUG_PDET_INT_SHIFT			0
> +
> +/* CS42L43_ACC_DET_INT */
> +#define CS42L43_HS2_BIAS_SENSE_INT_MASK				0x00000800
> +#define CS42L43_HS2_BIAS_SENSE_INT_SHIFT			11
> +#define CS42L43_HS1_BIAS_SENSE_INT_MASK				0x00000400
> +#define CS42L43_HS1_BIAS_SENSE_INT_SHIFT			10
> +#define CS42L43_DC_DETECT1_FALSE_INT_MASK			0x00000080
> +#define CS42L43_DC_DETECT1_FALSE_INT_SHIFT			7
> +#define CS42L43_DC_DETECT1_TRUE_INT_MASK			0x00000040
> +#define CS42L43_DC_DETECT1_TRUE_INT_SHIFT			6
> +#define CS42L43_HSBIAS_CLAMPED_INT_MASK				0x00000008
> +#define CS42L43_HSBIAS_CLAMPED_INT_SHIFT			3
> +#define CS42L43_HS3_4_BIAS_SENSE_INT_MASK			0x00000001
> +#define CS42L43_HS3_4_BIAS_SENSE_INT_SHIFT			0
> +
> +/* CS42L43_SPI_MSTR_INT */
> +#define CS42L43_IRQ_SPI_STALLING_INT_MASK			0x00000004
> +#define CS42L43_IRQ_SPI_STALLING_INT_SHIFT			2
> +#define CS42L43_IRQ_SPI_STS_INT_MASK				0x00000002
> +#define CS42L43_IRQ_SPI_STS_INT_SHIFT				1
> +#define CS42L43_IRQ_SPI_BLOCK_INT_MASK				0x00000001
> +#define CS42L43_IRQ_SPI_BLOCK_INT_SHIFT				0
> +
> +/* CS42L43_SW_TO_SPI_BRIDGE_INT */
> +#define CS42L43_SW2SPI_BUF_OVF_UDF_INT_MASK			0x00000001
> +#define CS42L43_SW2SPI_BUF_OVF_UDF_INT_SHIFT			0
> +
> +/* CS42L43_CLASS_D_AMP_INT */
> +#define CS42L43_AMP2_CLK_STOP_FAULT_INT_MASK			0x00002000
> +#define CS42L43_AMP2_CLK_STOP_FAULT_INT_SHIFT			13
> +#define CS42L43_AMP1_CLK_STOP_FAULT_INT_MASK			0x00001000
> +#define CS42L43_AMP1_CLK_STOP_FAULT_INT_SHIFT			12
> +#define CS42L43_AMP2_VDDSPK_FAULT_INT_MASK			0x00000800
> +#define CS42L43_AMP2_VDDSPK_FAULT_INT_SHIFT			11
> +#define CS42L43_AMP1_VDDSPK_FAULT_INT_MASK			0x00000400
> +#define CS42L43_AMP1_VDDSPK_FAULT_INT_SHIFT			10
> +#define CS42L43_AMP2_SHUTDOWN_DONE_INT_MASK			0x00000200
> +#define CS42L43_AMP2_SHUTDOWN_DONE_INT_SHIFT			9
> +#define CS42L43_AMP1_SHUTDOWN_DONE_INT_MASK			0x00000100
> +#define CS42L43_AMP1_SHUTDOWN_DONE_INT_SHIFT			8
> +#define CS42L43_AMP2_STARTUP_DONE_INT_MASK			0x00000080
> +#define CS42L43_AMP2_STARTUP_DONE_INT_SHIFT			7
> +#define CS42L43_AMP1_STARTUP_DONE_INT_MASK			0x00000040
> +#define CS42L43_AMP1_STARTUP_DONE_INT_SHIFT			6
> +#define CS42L43_AMP2_THERM_SHDN_INT_MASK			0x00000020
> +#define CS42L43_AMP2_THERM_SHDN_INT_SHIFT			5
> +#define CS42L43_AMP1_THERM_SHDN_INT_MASK			0x00000010
> +#define CS42L43_AMP1_THERM_SHDN_INT_SHIFT			4
> +#define CS42L43_AMP2_THERM_WARN_INT_MASK			0x00000008
> +#define CS42L43_AMP2_THERM_WARN_INT_SHIFT			3
> +#define CS42L43_AMP1_THERM_WARN_INT_MASK			0x00000004
> +#define CS42L43_AMP1_THERM_WARN_INT_SHIFT			2
> +#define CS42L43_AMP2_SCDET_INT_MASK				0x00000002
> +#define CS42L43_AMP2_SCDET_INT_SHIFT				1
> +#define CS42L43_AMP1_SCDET_INT_MASK				0x00000001
> +#define CS42L43_AMP1_SCDET_INT_SHIFT				0
> +
> +/* CS42L43_GPIO_INT */
> +#define CS42L43_GPIO3_FALL_INT_MASK				0x00000020
> +#define CS42L43_GPIO3_FALL_INT_SHIFT				5
> +#define CS42L43_GPIO3_RISE_INT_MASK				0x00000010
> +#define CS42L43_GPIO3_RISE_INT_SHIFT				4
> +#define CS42L43_GPIO2_FALL_INT_MASK				0x00000008
> +#define CS42L43_GPIO2_FALL_INT_SHIFT				3
> +#define CS42L43_GPIO2_RISE_INT_MASK				0x00000004
> +#define CS42L43_GPIO2_RISE_INT_SHIFT				2
> +#define CS42L43_GPIO1_FALL_INT_MASK				0x00000002
> +#define CS42L43_GPIO1_FALL_INT_SHIFT				1
> +#define CS42L43_GPIO1_RISE_INT_MASK				0x00000001
> +#define CS42L43_GPIO1_RISE_INT_SHIFT				0
> +
> +/* CS42L43_HPOUT_INT */
> +#define CS42L43_HP_ILIMIT_INT_MASK				0x00000002
> +#define CS42L43_HP_ILIMIT_INT_SHIFT				1
> +#define CS42L43_HP_LOADDET_DONE_INT_MASK			0x00000001
> +#define CS42L43_HP_LOADDET_DONE_INT_SHIFT			0
> +
> +/* CS42L43_BOOT_CONTROL */
> +#define CS42L43_LOCK_HW_STS_MASK				0x00000002
> +#define CS42L43_LOCK_HW_STS_SHIFT				1
> +
> +/* CS42L43_BLOCK_EN */
> +#define CS42L43_MCU_EN_MASK					0x00000001
> +#define CS42L43_MCU_EN_SHIFT					0
> +
> +/* CS42L43_SHUTTER_CONTROL */
> +#define CS42L43_STATUS_SPK_SHUTTER_MUTE_MASK			0x00008000
> +#define CS42L43_STATUS_SPK_SHUTTER_MUTE_SHIFT			15
> +#define CS42L43_SPK_SHUTTER_CFG_MASK				0x00000F00
> +#define CS42L43_SPK_SHUTTER_CFG_SHIFT				8
> +#define CS42L43_STATUS_MIC_SHUTTER_MUTE_MASK			0x00000080
> +#define CS42L43_STATUS_MIC_SHUTTER_MUTE_SHIFT			7
> +#define CS42L43_MIC_SHUTTER_CFG_MASK				0x0000000F
> +#define CS42L43_MIC_SHUTTER_CFG_SHIFT				0
> +
> +/* CS42L43_MCU_SW_REV */
> +#define CS42L43_BIOS_SUBMINOR_REV_MASK				0xFF000000
> +#define CS42L43_BIOS_SUBMINOR_REV_SHIFT				24
> +#define CS42L43_BIOS_MINOR_REV_MASK				0x00F00000
> +#define CS42L43_BIOS_MINOR_REV_SHIFT				20
> +#define CS42L43_BIOS_MAJOR_REV_MASK				0x000F0000
> +#define CS42L43_BIOS_MAJOR_REV_SHIFT				16
> +#define CS42L43_FW_SUBMINOR_REV_MASK				0x0000FF00
> +#define CS42L43_FW_SUBMINOR_REV_SHIFT				8
> +#define CS42L43_FW_MINOR_REV_MASK				0x000000F0
> +#define CS42L43_FW_MINOR_REV_SHIFT				4
> +#define CS42L43_FW_MAJOR_REV_MASK				0x0000000F
> +#define CS42L43_FW_MAJOR_REV_SHIFT				0
> +
> +/* CS42L43_NEED_CONFIGS */
> +#define CS42L43_FW_PATCH_NEED_CFG_MASK				0x80000000
> +#define CS42L43_FW_PATCH_NEED_CFG_SHIFT				31
> +
> +#endif /* CS42L43_CORE_REGS_H */
> diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
> new file mode 100644
> index 0000000000000..96d6f86220770
> --- /dev/null
> +++ b/include/linux/mfd/cs42l43.h
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * CS42L43 core driver external data
> + *
> + * Copyright (C) 2022-2023 Cirrus Logic, Inc. and
> + *                         Cirrus Logic International Semiconductor Ltd.
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mutex.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/workqueue.h>
> +
> +#ifndef CS42L43_CORE_EXT_H
> +#define CS42L43_CORE_EXT_H
> +
> +#define CS42L43_N_SUPPLIES		3
> +
> +enum cs42l43_irq_numbers {
> +	CS42L43_PLL_LOST_LOCK,
> +	CS42L43_PLL_READY,
> +
> +	CS42L43_HP_STARTUP_DONE,
> +	CS42L43_HP_SHUTDOWN_DONE,
> +	CS42L43_HSDET_DONE,
> +	CS42L43_TIPSENSE_UNPLUG_DB,
> +	CS42L43_TIPSENSE_PLUG_DB,
> +	CS42L43_RINGSENSE_UNPLUG_DB,
> +	CS42L43_RINGSENSE_PLUG_DB,
> +	CS42L43_TIPSENSE_UNPLUG_PDET,
> +	CS42L43_TIPSENSE_PLUG_PDET,
> +	CS42L43_RINGSENSE_UNPLUG_PDET,
> +	CS42L43_RINGSENSE_PLUG_PDET,
> +
> +	CS42L43_HS2_BIAS_SENSE,
> +	CS42L43_HS1_BIAS_SENSE,
> +	CS42L43_DC_DETECT1_FALSE,
> +	CS42L43_DC_DETECT1_TRUE,
> +	CS42L43_HSBIAS_CLAMPED,
> +	CS42L43_HS3_4_BIAS_SENSE,
> +
> +	CS42L43_AMP2_CLK_STOP_FAULT,
> +	CS42L43_AMP1_CLK_STOP_FAULT,
> +	CS42L43_AMP2_VDDSPK_FAULT,
> +	CS42L43_AMP1_VDDSPK_FAULT,
> +	CS42L43_AMP2_SHUTDOWN_DONE,
> +	CS42L43_AMP1_SHUTDOWN_DONE,
> +	CS42L43_AMP2_STARTUP_DONE,
> +	CS42L43_AMP1_STARTUP_DONE,
> +	CS42L43_AMP2_THERM_SHDN,
> +	CS42L43_AMP1_THERM_SHDN,
> +	CS42L43_AMP2_THERM_WARN,
> +	CS42L43_AMP1_THERM_WARN,
> +	CS42L43_AMP2_SCDET,
> +	CS42L43_AMP1_SCDET,
> +
> +	CS42L43_GPIO3_FALL,
> +	CS42L43_GPIO3_RISE,
> +	CS42L43_GPIO2_FALL,
> +	CS42L43_GPIO2_RISE,
> +	CS42L43_GPIO1_FALL,
> +	CS42L43_GPIO1_RISE,
> +
> +	CS42L43_HP_ILIMIT,
> +	CS42L43_HP_LOADDET_DONE,
> +};
> +
> +struct cs42l43 {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct sdw_slave *sdw;
> +
> +	struct regulator *vdd_p;
> +	struct regulator *vdd_d;
> +	struct regulator_bulk_data core_supplies[CS42L43_N_SUPPLIES];
> +
> +	struct gpio_desc *reset;
> +
> +	int irq;
> +	struct regmap_irq_chip irq_chip;
> +	struct regmap_irq_chip_data *irq_data;
> +
> +	struct work_struct boot_work;
> +	struct completion device_attach;
> +	struct completion device_detach;
> +	struct completion firmware_download;
> +	int firmware_error;
> +
> +	unsigned int sdw_freq;
> +	// Lock to gate control of the PLL and its sources
> +	struct mutex pll_lock;
> +
> +	bool sdw_pll_active;
> +	bool attached;
> +	bool hw_lock;
> +};
> +
> +#endif /* CS42L43_CORE_EXT_H */
> -- 
> 2.30.2
> 

-- 
Lee Jones [李琼斯]
