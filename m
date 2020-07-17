Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A47EA22379F
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 11:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbgGQJEt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 05:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgGQJEs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 05:04:48 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E92C08C5C0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 02:04:48 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id j18so13884373wmi.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fPSSCrAK7kPj/3cR+AEeJBFF+6hUfCRiIV39zPdcLSE=;
        b=O4aJA02RbEUNRYShZ9OCvGUwjUljzvi5eoJEED68ar8LSSGYFPgiHMpKHtBN7VyOp4
         NOV9q9vwQxsgJAZL3OJlMdJkjfPMuQe2LGPv4co156NqoxrK+6SRZW8Wo+aCYGEODCp4
         hvmOxM3Bes5RWZmIwLbajglchKuGZdob0pJuIM8YU9ncb7cs9TgGhk7HbZk9UQ8u/UEC
         mz+rCPoZGx70S04GkUp/As33ikyWh1KZl/FIMt36kT/ICYHeiZKV2oHVKOpRBJnGgbGX
         fmX86r+0n105cuNPh3O9ueYdMbPYpRqtxsEG7AgJkHuU6K5zzc5UrL6tOWiSqFDWYjxW
         sp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fPSSCrAK7kPj/3cR+AEeJBFF+6hUfCRiIV39zPdcLSE=;
        b=M42+tfKjeSNr5dTMI/P43FA+ABXQFp5TVPnzgOrF/vi9HbAoMONahfZaHDM3uu+2Kj
         K/EYRtas0jqf8kcwm/TSueY5elLSGPc4LMXkIvdhIYQM/EbYjY95YuXGy2+3Ppz1l1ye
         FefPndZErvPOqBwpHT/TMc4dsCxRV25Y1C5xtZR7id2ZVO1Z597Wj1ND29Bn4bWX8odw
         e256be2hr+JWHlJEn+lWoIVnA8TB9X76qGA/JN3uMQLcEkBiUUhHm73wnJNKeZTL27U2
         RxdY07elKQzDrmp+aUCW7AcloTI9ZR2yys7H7scuCHXFoToX6l5DesHF0icpJojDzKcZ
         NMog==
X-Gm-Message-State: AOAM533dGIOVf+HzF2Q2a2k6QIdokOX5EQHYfhpNAjkovtT0WHHUQ5bH
        F6ai82zUmYCs0Q6YicAeAcA6Uw==
X-Google-Smtp-Source: ABdhPJzkK5qp5DNZw7zuFk95PVjoD11yTntrP86JXL7TaTDkweQMjN1bqTSOyXRfkbtW9F+epTqZBg==
X-Received: by 2002:a1c:303:: with SMTP id 3mr8540077wmd.180.1594976687019;
        Fri, 17 Jul 2020 02:04:47 -0700 (PDT)
Received: from dell ([2.27.167.94])
        by smtp.gmail.com with ESMTPSA id i67sm12821715wma.12.2020.07.17.02.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 02:04:46 -0700 (PDT)
Date:   Fri, 17 Jul 2020 10:04:44 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Michael Walle <michael@walle.cc>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 02/13] mfd: add simple regmap based I2C driver
Message-ID: <20200717090444.GE3165313@dell>
References: <20200706175353.16404-1-michael@walle.cc>
 <20200706175353.16404-3-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200706175353.16404-3-michael@walle.cc>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 06 Jul 2020, Michael Walle wrote:

> There are I2C devices which contain several different functions but
> doesn't require any special access functions. For these kind of drivers
> an I2C regmap should be enough.
> 
> Create an I2C driver which creates an I2C regmap and enumerates its
> children. If a device wants to use this as its MFD core driver, it has
> to add an individual compatible string. It may provide its own regmap
> configuration.
> 
> Subdevices can use dev_get_regmap() on the parent to get their regmap
> instance.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Changes since v4:
>  - new patch. Lee, please bear with me. I didn't want to delay the
>    new version (where a lot of remarks on the other patches were
>    addressed) even more, just because we haven't figured out how
>    to deal with the MFD part. So for now, I've included this one.
> 
>  drivers/mfd/Kconfig          |  9 +++++++
>  drivers/mfd/Makefile         |  1 +
>  drivers/mfd/simple-mfd-i2c.c | 50 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 60 insertions(+)
>  create mode 100644 drivers/mfd/simple-mfd-i2c.c
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 33df0837ab41..f1536a710aca 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1162,6 +1162,15 @@ config MFD_SI476X_CORE
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called si476x-core.
>  
> +config MFD_SIMPLE_MFD_I2C
> +	tristate "Simple regmap based I2C devices"
> +	depends on I2C
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  This is a consolidated driver for all MFD devices which are
> +	  basically just a regmap bus driver.
> +
>  config MFD_SM501
>  	tristate "Silicon Motion SM501"
>  	depends on HAS_DMA
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index a60e5f835283..78d24a3e7c9e 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -264,3 +264,4 @@ obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
>  obj-$(CONFIG_MFD_KHADAS_MCU) 	+= khadas-mcu.o
>  
>  obj-$(CONFIG_SGI_MFD_IOC3)	+= ioc3.o
> +obj-$(CONFIG_MFD_SIMPLE_MFD_I2C)	+= simple-mfd-i2c.o
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> new file mode 100644
> index 000000000000..1fdca89964b1
> --- /dev/null
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/regmap.h>

I'm pretty sure you do not require all of these headers.

> +struct simple_mfd_i2c_config {
> +	const struct regmap_config *regmap_config;
> +};

No need for this yet I feel.

Let's keep it as simple as possible.

> +static const struct regmap_config simple_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +};
> +
> +static int simple_mfd_i2c_probe(struct i2c_client *i2c)
> +{
> +	const struct regmap_config *regmap_config = &simple_regmap_config;
> +	const struct simple_mfd_i2c_config *config;
> +	struct regmap *regmap;
> +
> +	config = device_get_match_data(&i2c->dev);

Have this return regmap_config.

> +	if (config && config->regmap_config)
> +		regmap_config = config->regmap_config;
> +
> +	regmap = devm_regmap_init_i2c(i2c, regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return devm_of_platform_populate(&i2c->dev);
> +}
> +
> +static const struct of_device_id simple_mfd_i2c_of_match[] = {
> +	{}
> +};
> +
> +static struct i2c_driver simple_mfd_i2c_driver = {
> +	.probe_new = simple_mfd_i2c_probe,
> +	.driver = {
> +		.name = "simple-mfd-i2c",
> +		.of_match_table = simple_mfd_i2c_of_match,
> +	},
> +};
> +builtin_i2c_driver(simple_mfd_i2c_driver);

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
