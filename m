Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1701D388C6A
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 13:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346153AbhESLM7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 07:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240482AbhESLM7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 07:12:59 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81069C06175F
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 04:11:39 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id z17so13557925wrq.7
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 04:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Vc8qJg9NmyT5ZEGfIcNUqKz3BJwvE15c53tr2iQnxUA=;
        b=Ic7eZmPZ6/e2jgfkov/tZpcd1TKjFXlykvq9B2L15Gk/irhrypS5YJPmxzodwiiqsf
         DJD9hUtVjsuDlye9WDOd/rqu9BIOgAGRJt/NeV1/EVbPYKsvzmAeo4gMd4+/aMQSCMB9
         3MDn115nESViNS2wHi/2MIm/NMvoAHE5CJRbxFPcAIS7KMyTyO1RL/iuDjHZ9pzXrUJ7
         FolV404EjuHW6DsUzm+ZVP9eOQjlspWpi4dtyXBwYNfa3i9oHBIhzLcknewOSvrwI2oi
         WsMBzENlLmvjqiQ58ZhzZ6eE76c+1zGVLXBDhgazh1T8QE3OHPPeDdJvVS6x2rEnDJjM
         KNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Vc8qJg9NmyT5ZEGfIcNUqKz3BJwvE15c53tr2iQnxUA=;
        b=bBENfeLCgQmcxrxuFVl+dFAl2GAqw5sMLshdJVVVNuGPp7mY7KBPMit/vWvqRzBV7F
         4hIsoe/+AoPcyzG1UpsIOMxQ7cW33KgnIL6hkEbepfcpdnmeyu7lcOUlFcV9zSRzDJAb
         x1DcCeYhHhd7nSbm2HqNBHGUx/hTHcdft1/D2pYAibT7ciTNmQ3GGUHmwBtR9/rFnSYl
         RxSo5KnWu91WVf94K7+7tcw5oz2LBtjJPv5Zer/Yu8THSlim2I33GczCnM/c7Ylx/bFi
         ledGQS4PRevaLO4iRPV3NwSbGPrJERs1gvAVhx2vQ08WJ3ccNpZlQ/PKRk5iGIS2mX/u
         m42w==
X-Gm-Message-State: AOAM5313q+uv120j+NnjPeYzDXAO7AzRc7eKh1Reyqr3YZd9JeCNjxdl
        QXxrt9/55u0lNXZFsmKVe+eQ3ixioXXygw==
X-Google-Smtp-Source: ABdhPJx0iXQiXNiDCS1Ed60PcEy+0Zd6RrBCwtbt1gF9HqpKG8BR2R/kGw6g9cV/u+tMrD0iv53JYA==
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr13732937wrs.17.1621422698035;
        Wed, 19 May 2021 04:11:38 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id q3sm22762845wrr.43.2021.05.19.04.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 04:11:37 -0700 (PDT)
Date:   Wed, 19 May 2021 12:11:25 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jdelvare@suse.com, linux@roeck-us.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
        luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de
Subject: Re: [PATCH 1/6] mfd: Add Delta TN48M CPLD driver
Message-ID: <20210519111125.GD2403908@dell>
References: <20210430123511.116057-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210430123511.116057-1-robert.marko@sartura.hr>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 30 Apr 2021, Robert Marko wrote:

> Delta TN48M switches have a Lattice CPLD that serves
> multiple purposes including being a GPIO expander.
> So lets add the MFD core driver for it.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/mfd/Kconfig       |  13 +++
>  drivers/mfd/Makefile      |   1 +
>  drivers/mfd/tn48m-cpld.c  | 181 ++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/tn48m.h |  30 +++++++
>  4 files changed, 225 insertions(+)
>  create mode 100644 drivers/mfd/tn48m-cpld.c
>  create mode 100644 include/linux/mfd/tn48m.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index b74efa469e90..809041f98d71 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -297,6 +297,19 @@ config MFD_ASIC3
>  	  This driver supports the ASIC3 multifunction chip found on many
>  	  PDAs (mainly iPAQ and HTC based ones)
>  
> +config MFD_TN48M_CPLD
> +	tristate "Delta Networks TN48M switch CPLD driver"
> +	depends on I2C
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  Select this option to enable support for Delta Networks TN48M switch
> +	  CPLD. It consists of GPIO and hwmon drivers.
> +	  CPLD provides GPIOS-s for the SFP slots as well as power supply
> +	  related information.
> +	  Driver provides debugfs information about the board model as
> +	  well as hardware and CPLD revision information.

No need for every sentence to be it's own paragraphs.

Please re-align to be a single chunk.

>  config PMIC_DA903X
>  	bool "Dialog Semiconductor DA9030/DA9034 PMIC Support"
>  	depends on I2C=y
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 834f5463af28..974663341f08 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_MFD_TI_LP87565)	+= lp87565.o
>  obj-$(CONFIG_MFD_DAVINCI_VOICECODEC)	+= davinci_voicecodec.o
>  obj-$(CONFIG_MFD_DM355EVM_MSP)	+= dm355evm_msp.o
>  obj-$(CONFIG_MFD_TI_AM335X_TSCADC)	+= ti_am335x_tscadc.o
> +obj-$(CONFIG_MFD_TN48M_CPLD)	+= tn48m-cpld.o
>  
>  obj-$(CONFIG_MFD_STA2X11)	+= sta2x11-mfd.o
>  obj-$(CONFIG_MFD_STMPE)		+= stmpe.o
> diff --git a/drivers/mfd/tn48m-cpld.c b/drivers/mfd/tn48m-cpld.c
> new file mode 100644
> index 000000000000..b84510fb630a
> --- /dev/null
> +++ b/drivers/mfd/tn48m-cpld.c
> @@ -0,0 +1,181 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Delta TN48M CPLD parent driver
> + *
> + * Copyright 2020 Sartura Ltd

This is out of date.

> + * Author: Robert Marko <robert.marko@sartura.hr>
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/tn48m.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +static const struct mfd_cell tn48m_cell[] = {};

Please populate this.

Without it, this is not an MFD.

> +static const struct regmap_config tn48m_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0x40,
> +};
> +
> +static int hardware_version_show(struct seq_file *s, void *data)
> +{
> +	struct tn48m_data *priv = s->private;
> +	unsigned int regval;
> +	char *buf;
> +
> +	regmap_read(priv->regmap, HARDWARE_VERSION_ID, &regval);
> +
> +	switch (FIELD_GET(HARDWARE_VERSION_MASK, regval)) {
> +	case HARDWARE_VERSION_EVT1:
> +		buf = "EVT1";
> +		break;
> +	case HARDWARE_VERSION_EVT2:
> +		buf = "EVT2";
> +		break;
> +	case HARDWARE_VERSION_DVT:
> +		buf = "DVT";
> +		break;
> +	case HARDWARE_VERSION_PVT:
> +		buf = "PVT";
> +		break;
> +	default:
> +		buf = "Unknown";
> +		break;
> +	}
> +
> +	seq_printf(s, "%s\n", buf);
> +
> +	return 0;
> +}
> +

Please drop this '\n'.

> +DEFINE_SHOW_ATTRIBUTE(hardware_version);
> +
> +static int board_id_show(struct seq_file *s, void *data)
> +{
> +	struct tn48m_data *priv = s->private;
> +	unsigned int regval;
> +	char *buf;
> +
> +	regmap_read(priv->regmap, BOARD_ID, &regval);
> +
> +	switch (regval) {
> +	case BOARD_ID_TN48M:
> +		buf = "TN48M";
> +		break;
> +	case BOARD_ID_TN48M_P:
> +		buf = "TN48-P";
> +		break;
> +	default:
> +		buf = "Unknown";
> +		break;
> +	}
> +
> +	seq_printf(s, "%s\n", buf);
> +
> +	return 0;
> +}
> +

Please drop this '\n'.

> +DEFINE_SHOW_ATTRIBUTE(board_id);
> +
> +static int code_version_show(struct seq_file *s, void *data)
> +{
> +	struct tn48m_data *priv = s->private;
> +	unsigned int regval;
> +
> +	regmap_read(priv->regmap, CPLD_CODE_VERSION, &regval);
> +
> +	seq_printf(s, "%d\n", regval);
> +
> +	return 0;
> +}
> +

Please drop this '\n'.

> +DEFINE_SHOW_ATTRIBUTE(code_version);
> +
> +static void tn48m_init_debugfs(struct tn48m_data *data)
> +{
> +	data->debugfs_dir = debugfs_create_dir(data->client->name, NULL);
> +
> +	debugfs_create_file("hardware_version",
> +			    0400,
> +			    data->debugfs_dir,
> +			    data,
> +			    &hardware_version_fops);
> +
> +	debugfs_create_file("board_id",
> +			    0400,
> +			    data->debugfs_dir,
> +			    data,
> +			    &board_id_fops);
> +
> +	debugfs_create_file("code_version",
> +			    0400,
> +			    data->debugfs_dir,
> +			    data,
> +			    &code_version_fops);
> +}

Does S/W actually do anything useful with these files?

Or are they just there for the sake of it?

If the latter, just print them to the kernel log and have done.

> +static int tn48m_probe(struct i2c_client *client)
> +{
> +	struct tn48m_data *data;

'ddata' for both please.

> +	int ret;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client = client;
> +	data->dev = &client->dev;
> +	i2c_set_clientdata(client, data);
> +
> +	data->regmap = devm_regmap_init_i2c(client, &tn48m_regmap_config);
> +	if (IS_ERR(data->regmap)) {
> +		dev_err(data->dev, "Failed to allocate regmap\n");
> +		return PTR_ERR(data->regmap);
> +	}
> +
> +	ret = devm_mfd_add_devices(data->dev, PLATFORM_DEVID_AUTO, tn48m_cell,
> +				   ARRAY_SIZE(tn48m_cell), NULL, 0, NULL);
> +	if (ret)
> +		dev_err(data->dev, "Failed to register sub-devices %d\n", ret);
> +
> +	tn48m_init_debugfs(data);
> +
> +	return ret;
> +}
> +
> +static int tn48m_remove(struct i2c_client *client)
> +{
> +	struct tn48m_data *data = i2c_get_clientdata(client);
> +
> +	debugfs_remove_recursive(data->debugfs_dir);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id tn48m_of_match[] = {
> +	{ .compatible = "delta,tn48m-cpld"},

Missing ' ' before the '}'.

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tn48m_of_match);
> +
> +static struct i2c_driver tn48m_driver = {
> +	.driver = {
> +		.name = "tn48m-cpld",
> +		.of_match_table = tn48m_of_match,
> +	},
> +	.probe_new	= tn48m_probe,
> +	.remove		= tn48m_remove,
> +};
> +module_i2c_driver(tn48m_driver);
> +
> +MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
> +MODULE_DESCRIPTION("Delta TN48M CPLD parent driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/tn48m.h b/include/linux/mfd/tn48m.h
> new file mode 100644
> index 000000000000..551c550efa54
> --- /dev/null
> +++ b/include/linux/mfd/tn48m.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright 2020 Sartura Ltd

Out of date.

> + */
> +
> +#ifndef __TN48M_H__
> +#define __TN48M_H__

Better prefix with MFD.

> +#include <linux/device.h>
> +#include <linux/regmap.h>
> +
> +#define HARDWARE_VERSION_ID	0x0
> +#define HARDWARE_VERSION_MASK	GENMASK(3, 0)
> +#define HARDWARE_VERSION_EVT1	0
> +#define HARDWARE_VERSION_EVT2	1
> +#define HARDWARE_VERSION_DVT	2
> +#define HARDWARE_VERSION_PVT	3
> +#define BOARD_ID		0x1
> +#define BOARD_ID_TN48M		0xa
> +#define BOARD_ID_TN48M_P	0xb
> +#define CPLD_CODE_VERSION	0x2
> +
> +struct tn48m_data {
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct i2c_client *client;

You don't need both 'dev' and 'client'.

> +	struct dentry *debugfs_dir;
> +};
> +
> +#endif

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
