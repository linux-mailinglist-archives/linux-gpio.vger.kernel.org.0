Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC1336FB43
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 15:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbhD3NNL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 09:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbhD3NNK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 09:13:10 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86A2EC06174A;
        Fri, 30 Apr 2021 06:12:22 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id v23-20020a9d60570000b02902a53bac99a3so9576162otj.5;
        Fri, 30 Apr 2021 06:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qYDD+DWpqcYXRZG1KuT26uihnHLtkK+MGAl3G9lCgX4=;
        b=u4bivZ73rvv1kHoOsCthCEzQAzAccoikHvqqFa1S5d3DBOThqLwtQpCv7bsYS0dm5F
         BojLAdZihMFBOOtpuDeN5Fm+IBTXkufZYfMxby23iYw9rVnCbwtKd7jnkexm/Vh+UmT4
         mS50lOy8jgjEOURe5VAvYaxbUF3NXR4J6fkBQzHsXnGOuaqsejntGOFc6lE/hqjB6p0m
         EGJxO3wuxGfXpm/osH3EFKj8Ka14Dv52w9xo/XVOs1i/83h2b+BGhnJE0aSdQZIutusf
         YPWbMX8H2CDpS9ZogZyfJHSHK2sdSQ/ucqoXJVzSo2KmV+WNxJ95UwBpk7sw6uHTZwk3
         8tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qYDD+DWpqcYXRZG1KuT26uihnHLtkK+MGAl3G9lCgX4=;
        b=mYS9c6ucsYGf3iJ6nyEn3SBPgQRO5GkGEdhRA/mlNZWYtvabXrJAMhvEoj2oE6RNA5
         kE75DdwJKb8z/hsZtXNm8BaWiflGeiFAzWl3oOoLiCVS4LrYxujhVaSKABKOz2lm1Rdv
         dFE8i5tMCB4UKLAZnPphHvMsWIiPL/x+u9qMNQ7psTsqGSWjtSfHGSxkacjxWQ/IbwdB
         Y7/QUoDxrkfV/kB1ztmajnUyzm2CNl3vGnAZ7H7LH4QCw42xIrZcikRE2t4r2chZREge
         nmnk1yPnqdajgNq3CFzl1kTA2iNsh132kp105SKhDGszHATJDPOs5API6GAc1heYFBIQ
         hPCA==
X-Gm-Message-State: AOAM532niPgUR/8+YJ+0+LnYVDWalkeL+uWUMj1DdF/kmRHfQzU7sI+f
        02PSrS5+sC3qU2UNpz9k5H8=
X-Google-Smtp-Source: ABdhPJy0OmHfuITE7zrH3EZgYmw0LO/N/gK7vB7M2YUle1W63vyy7DnGt9d9JlMwwLoAB7LrMc2nmg==
X-Received: by 2002:a05:6830:214f:: with SMTP id r15mr3519644otd.204.1619788341880;
        Fri, 30 Apr 2021 06:12:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j22sm679109otr.0.2021.04.30.06.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Apr 2021 06:12:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 4/6] hwmon: Add Delta TN48M CPLD HWMON driver
To:     Robert Marko <robert.marko@sartura.hr>, lee.jones@linaro.org,
        robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jdelvare@suse.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc:     luka.perkov@sartura.hr, jmp@epiphyte.org, pmenzel@molgen.mpg.de,
        buczek@molgen.mpg.de
References: <20210430123511.116057-1-robert.marko@sartura.hr>
 <20210430123511.116057-4-robert.marko@sartura.hr>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <f5bc39d4-742d-4403-7b5d-172a2410a631@roeck-us.net>
Date:   Fri, 30 Apr 2021 06:12:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430123511.116057-4-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 4/30/21 5:35 AM, Robert Marko wrote:
> Delta TN48M has a CPLD that also monitors the power supply
> statuses.
> 
> These are useful to be presented to the users, so lets
> add a driver for HWMON part of the CPLD.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/hwmon/Kconfig       |  10 +++
>  drivers/hwmon/Makefile      |   1 +
>  drivers/hwmon/tn48m-hwmon.c | 148 ++++++++++++++++++++++++++++++++++++
>  drivers/mfd/tn48m-cpld.c    |   3 +
>  include/linux/mfd/tn48m.h   |   1 +
>  5 files changed, 163 insertions(+)
>  create mode 100644 drivers/hwmon/tn48m-hwmon.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 54f04e61fb83..89271dfeb775 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1924,6 +1924,16 @@ config SENSORS_TMP513
>  	  This driver can also be built as a module. If so, the module
>  	  will be called tmp513.
>  
> +config SENSORS_TN48M
> +	tristate "Delta Networks TN48M switch CPLD HWMON driver"
> +	depends on MFD_TN48M_CPLD
> +	help
> +	  If you say yes here you get support for Delta Networks TN48M
> +	  CPLD.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called tn48m-hwmon.
> +
>  config SENSORS_VEXPRESS
>  	tristate "Versatile Express"
>  	depends on VEXPRESS_CONFIG
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index fe38e8a5c979..22e470057ffe 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -187,6 +187,7 @@ obj-$(CONFIG_SENSORS_TMP108)	+= tmp108.o
>  obj-$(CONFIG_SENSORS_TMP401)	+= tmp401.o
>  obj-$(CONFIG_SENSORS_TMP421)	+= tmp421.o
>  obj-$(CONFIG_SENSORS_TMP513)	+= tmp513.o
> +obj-$(CONFIG_SENSORS_TN48M)	+= tn48m-hwmon.o
>  obj-$(CONFIG_SENSORS_VEXPRESS)	+= vexpress-hwmon.o
>  obj-$(CONFIG_SENSORS_VIA_CPUTEMP)+= via-cputemp.o
>  obj-$(CONFIG_SENSORS_VIA686A)	+= via686a.o
> diff --git a/drivers/hwmon/tn48m-hwmon.c b/drivers/hwmon/tn48m-hwmon.c
> new file mode 100644
> index 000000000000..80fd18d74f1d
> --- /dev/null
> +++ b/drivers/hwmon/tn48m-hwmon.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Delta TN48M CPLD HWMON driver
> + *
> + * Copyright 2020 Sartura Ltd
> + *
> + * Author: Robert Marko <robert.marko@sartura.hr>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include <linux/mfd/tn48m.h>
> +
> +#define PSU1_PRESENT_MASK	BIT(0)
> +#define PSU2_PRESENT_MASK	BIT(1)
> +#define PSU1_POWERGOOD_MASK	BIT(2)
> +#define PSU2_POWERGOOD_MASK	BIT(3)
> +#define PSU1_ALERT_MASK		BIT(4)
> +#define PSU2_ALERT_MASK		BIT(5)
> +
> +static int board_id_get(struct tn48m_data *data)
> +{
> +	unsigned int regval;
> +
> +	regmap_read(data->regmap, BOARD_ID, &regval);
> +
> +	switch (regval) {
> +	case BOARD_ID_TN48M:
> +		return BOARD_ID_TN48M;
> +	case BOARD_ID_TN48M_P:
> +		return BOARD_ID_TN48M_P;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static ssize_t psu_present_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
> +	struct tn48m_data *data = dev_get_drvdata(dev);
> +	unsigned int regval, status;
> +
> +	if (board_id_get(data) == BOARD_ID_TN48M_P) {
> +		regmap_read(data->regmap, attr2->nr, &regval);
> +
> +		if (attr2->index == 1)
> +			status = !FIELD_GET(PSU1_PRESENT_MASK, regval);
> +		else
> +			status = !FIELD_GET(PSU2_PRESENT_MASK, regval);
> +	} else
> +		status = 0;
> +
> +	return sprintf(buf, "%d\n", status);
> +}
> +
> +static ssize_t psu_pg_show(struct device *dev,
> +			   struct device_attribute *attr, char *buf)
> +{
> +	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
> +	struct tn48m_data *data = dev_get_drvdata(dev);
> +	unsigned int regval, status;
> +
> +	regmap_read(data->regmap, attr2->nr, &regval);
> +
> +	if (attr2->index == 1)
> +		status = FIELD_GET(PSU1_POWERGOOD_MASK, regval);
> +	else
> +		status = FIELD_GET(PSU2_POWERGOOD_MASK, regval);
> +
> +	return sprintf(buf, "%d\n", status);
> +}
> +
> +static ssize_t psu_alert_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
> +	struct tn48m_data *data = dev_get_drvdata(dev);
> +	unsigned int regval, status;
> +
> +	if (board_id_get(data) == BOARD_ID_TN48M_P) {
> +		regmap_read(data->regmap, attr2->nr, &regval);
> +
> +		if (attr2->index == 1)
> +			status = !FIELD_GET(PSU1_ALERT_MASK, regval);
> +		else
> +			status = !FIELD_GET(PSU2_ALERT_MASK, regval);
> +	} else
> +		status = 0;
> +
> +	return sprintf(buf, "%d\n", status);
> +}
> +
> +static SENSOR_DEVICE_ATTR_2_RO(psu1_present, psu_present, PSU_STATUS, 1);
> +static SENSOR_DEVICE_ATTR_2_RO(psu2_present, psu_present, PSU_STATUS, 2);
> +static SENSOR_DEVICE_ATTR_2_RO(psu1_pg, psu_pg, PSU_STATUS, 1);
> +static SENSOR_DEVICE_ATTR_2_RO(psu2_pg, psu_pg, PSU_STATUS, 2);
> +static SENSOR_DEVICE_ATTR_2_RO(psu1_alert, psu_alert, PSU_STATUS, 1);
> +static SENSOR_DEVICE_ATTR_2_RO(psu2_alert, psu_alert, PSU_STATUS, 2);
> +
> +static struct attribute *tn48m_hwmon_attrs[] = {
> +	&sensor_dev_attr_psu1_present.dev_attr.attr,
> +	&sensor_dev_attr_psu2_present.dev_attr.attr,
> +	&sensor_dev_attr_psu1_pg.dev_attr.attr,
> +	&sensor_dev_attr_psu2_pg.dev_attr.attr,
> +	&sensor_dev_attr_psu1_alert.dev_attr.attr,
> +	&sensor_dev_attr_psu2_alert.dev_attr.attr,

Literally none of those attributes are standard hwmon attributes.
I don't know what this is, but it is not a hardware monitoring driver.

> +	NULL
> +};
> +
> +ATTRIBUTE_GROUPS(tn48m_hwmon);
> +
> +static int tn48m_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct tn48m_data *data = dev_get_drvdata(pdev->dev.parent);
> +	struct device *hwmon_dev;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_groups(&pdev->dev,
> +							   "tn48m_hwmon",
> +							   data,
> +							   tn48m_hwmon_groups);

Please use devm_hwmon_device_register_with_info() to register hwmon devices.
Of course, that only makes sense for actual hardware monitoring drivers
which do support standard attributes.

> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct platform_device_id tn48m_hwmon_id_table[] = {
> +	{ "delta,tn48m-hwmon", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(platform, tn48m_hwmon_id_table);
> +
> +static struct platform_driver tn48m_hwmon_driver = {
> +	.driver = {
> +		.name = "tn48m-hwmon",
> +	},
> +	.probe = tn48m_hwmon_probe,
> +	.id_table = tn48m_hwmon_id_table,
> +};
> +module_platform_driver(tn48m_hwmon_driver);
> +
> +MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
> +MODULE_DESCRIPTION("Delta TN48M CPLD HWMON driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/mfd/tn48m-cpld.c b/drivers/mfd/tn48m-cpld.c
> index f22a15ddd22d..4d837aca01e7 100644
> --- a/drivers/mfd/tn48m-cpld.c
> +++ b/drivers/mfd/tn48m-cpld.c
> @@ -20,6 +20,9 @@
>  static const struct mfd_cell tn48m_cell[] = {
>  	{
>  		.name = "delta,tn48m-gpio",
> +	},
> +	{
> +		.name = "delta,tn48m-hwmon",
>  	}
>  };
>  
> diff --git a/include/linux/mfd/tn48m.h b/include/linux/mfd/tn48m.h
> index 9cc2b04c8d69..eb2cfc3a5db7 100644
> --- a/include/linux/mfd/tn48m.h
> +++ b/include/linux/mfd/tn48m.h
> @@ -22,6 +22,7 @@
>  #define SFP_TX_DISABLE		0x31
>  #define SFP_PRESENT		0x3a
>  #define SFP_LOS			0x40
> +#define PSU_STATUS		0xa
>  
>  struct tn48m_data {
>  	struct device *dev;
> 

