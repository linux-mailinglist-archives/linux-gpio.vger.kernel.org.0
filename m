Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B58C388F50
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 15:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353513AbhESNlu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 09:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346655AbhESNls (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 09:41:48 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B53C06175F;
        Wed, 19 May 2021 06:40:28 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id 82so1307029qki.8;
        Wed, 19 May 2021 06:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FLN0CDJlHxavKmzu7MgLtwPMPqvhYeNe5w88hhTe9Xw=;
        b=ZVhIGwQCZxUQYb0H6GT3jegT0iqlL/xDAlbzciPneWnZxT21rT5GH4vKPJAhoBWnnc
         IYCQSis1l89zxTrjgk3YMAQnC7B59iMjv3dmnok1dy0jLbadB9Q+tnkWaRdyJTtGJFa4
         ECv+SFvsK0Jj0K0bAgBvKKMbHuV+bUyFqlBFqAWxdVKY0kgIZCokFHVpEYTYMMgpxDVM
         q52aQlX4d6cj17okZAvyUocbQTy/erjgbTWhV/wh8xtjPtjIzD91CL+VI4MljifDPMnK
         vwGtXY/kNpDTOlOJhB9LxfLxy4M8+ajkkcj1v9w7IT8PtyQ/SEk73fVEyazgW6HLqRX0
         yJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FLN0CDJlHxavKmzu7MgLtwPMPqvhYeNe5w88hhTe9Xw=;
        b=ZsMh2Rk8GLjBWRMySjymhCtxwyLzvpKIWycbDNWPQqjtxJx94/WUYs+q3Q3mwpF4tE
         //b0r1vEjgVFhUG2ZV52y9ot9KaKMr+J/Ijqk8TXwJPWynBaXDIfnyQaMl3sg8Gf4GC4
         g/E/fmOwGK6x9WmwHDc/BmRb2hEjhu/HhKucsJNFKAmGpY/jmFWrv/1+suTBFTwxwIcA
         lB1KurCCfEKWF43t812Lx5XpMz/8tRbIJ/iQejGYWEMKaQ365mWdEgIjvFsM+g804VB/
         U5TugeGIQGcgFfBPMvPN1oHEK1w3RCkaWFcRCzzey43xPodZBTZdwZOIx3t4WbW//KH9
         KUXg==
X-Gm-Message-State: AOAM533yiN2jZGayPmz8CHhZeZjd3B/QJo3KAqyvgEtHzqrF4mglqCF8
        GgEX0MuV5t0li7bPtFjr0sw=
X-Google-Smtp-Source: ABdhPJy+MDenBS+R/uIb+MPCK3Tiu+R+KIprsTnCAuH4fCPrYkMxZEHHb/FCXK6w05LdkvYmrMWC1g==
X-Received: by 2002:a05:620a:2912:: with SMTP id m18mr12303145qkp.475.1621431627728;
        Wed, 19 May 2021 06:40:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c185sm15289147qkg.96.2021.05.19.06.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:40:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 4/6] hwmon: Add Delta TN48M CPLD HWMON driver
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Lee Jones <lee.jones@linaro.org>, robh+dt@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, jdelvare@suse.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
References: <20210430123511.116057-1-robert.marko@sartura.hr>
 <20210430123511.116057-4-robert.marko@sartura.hr>
 <f5bc39d4-742d-4403-7b5d-172a2410a631@roeck-us.net>
 <CA+HBbNE2E8jEnLhGE-Z3qqYFS99TnCMdS7m8rfum1MbPX+-=bw@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <659d8e96-62e2-b316-50d7-a754eb374443@roeck-us.net>
Date:   Wed, 19 May 2021 06:40:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CA+HBbNE2E8jEnLhGE-Z3qqYFS99TnCMdS7m8rfum1MbPX+-=bw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 5/19/21 5:01 AM, Robert Marko wrote:
> On Fri, Apr 30, 2021 at 3:12 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 4/30/21 5:35 AM, Robert Marko wrote:
>>> Delta TN48M has a CPLD that also monitors the power supply
>>> statuses.
>>>
>>> These are useful to be presented to the users, so lets
>>> add a driver for HWMON part of the CPLD.
>>>
>>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>>> ---
>>>   drivers/hwmon/Kconfig       |  10 +++
>>>   drivers/hwmon/Makefile      |   1 +
>>>   drivers/hwmon/tn48m-hwmon.c | 148 ++++++++++++++++++++++++++++++++++++
>>>   drivers/mfd/tn48m-cpld.c    |   3 +
>>>   include/linux/mfd/tn48m.h   |   1 +
>>>   5 files changed, 163 insertions(+)
>>>   create mode 100644 drivers/hwmon/tn48m-hwmon.c
>>>
>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>> index 54f04e61fb83..89271dfeb775 100644
>>> --- a/drivers/hwmon/Kconfig
>>> +++ b/drivers/hwmon/Kconfig
>>> @@ -1924,6 +1924,16 @@ config SENSORS_TMP513
>>>          This driver can also be built as a module. If so, the module
>>>          will be called tmp513.
>>>
>>> +config SENSORS_TN48M
>>> +     tristate "Delta Networks TN48M switch CPLD HWMON driver"
>>> +     depends on MFD_TN48M_CPLD
>>> +     help
>>> +       If you say yes here you get support for Delta Networks TN48M
>>> +       CPLD.
>>> +
>>> +       This driver can also be built as a module. If so, the module
>>> +       will be called tn48m-hwmon.
>>> +
>>>   config SENSORS_VEXPRESS
>>>        tristate "Versatile Express"
>>>        depends on VEXPRESS_CONFIG
>>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>>> index fe38e8a5c979..22e470057ffe 100644
>>> --- a/drivers/hwmon/Makefile
>>> +++ b/drivers/hwmon/Makefile
>>> @@ -187,6 +187,7 @@ obj-$(CONFIG_SENSORS_TMP108)      += tmp108.o
>>>   obj-$(CONFIG_SENSORS_TMP401) += tmp401.o
>>>   obj-$(CONFIG_SENSORS_TMP421) += tmp421.o
>>>   obj-$(CONFIG_SENSORS_TMP513) += tmp513.o
>>> +obj-$(CONFIG_SENSORS_TN48M)  += tn48m-hwmon.o
>>>   obj-$(CONFIG_SENSORS_VEXPRESS)       += vexpress-hwmon.o
>>>   obj-$(CONFIG_SENSORS_VIA_CPUTEMP)+= via-cputemp.o
>>>   obj-$(CONFIG_SENSORS_VIA686A)        += via686a.o
>>> diff --git a/drivers/hwmon/tn48m-hwmon.c b/drivers/hwmon/tn48m-hwmon.c
>>> new file mode 100644
>>> index 000000000000..80fd18d74f1d
>>> --- /dev/null
>>> +++ b/drivers/hwmon/tn48m-hwmon.c
>>> @@ -0,0 +1,148 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Delta TN48M CPLD HWMON driver
>>> + *
>>> + * Copyright 2020 Sartura Ltd
>>> + *
>>> + * Author: Robert Marko <robert.marko@sartura.hr>
>>> + */
>>> +
>>> +#include <linux/bitfield.h>
>>> +#include <linux/hwmon-sysfs.h>
>>> +#include <linux/hwmon.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/mod_devicetable.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +
>>> +#include <linux/mfd/tn48m.h>
>>> +
>>> +#define PSU1_PRESENT_MASK    BIT(0)
>>> +#define PSU2_PRESENT_MASK    BIT(1)
>>> +#define PSU1_POWERGOOD_MASK  BIT(2)
>>> +#define PSU2_POWERGOOD_MASK  BIT(3)
>>> +#define PSU1_ALERT_MASK              BIT(4)
>>> +#define PSU2_ALERT_MASK              BIT(5)
>>> +
>>> +static int board_id_get(struct tn48m_data *data)
>>> +{
>>> +     unsigned int regval;
>>> +
>>> +     regmap_read(data->regmap, BOARD_ID, &regval);
>>> +
>>> +     switch (regval) {
>>> +     case BOARD_ID_TN48M:
>>> +             return BOARD_ID_TN48M;
>>> +     case BOARD_ID_TN48M_P:
>>> +             return BOARD_ID_TN48M_P;
>>> +     default:
>>> +             return -EINVAL;
>>> +     }
>>> +}
>>> +
>>> +static ssize_t psu_present_show(struct device *dev,
>>> +                             struct device_attribute *attr, char *buf)
>>> +{
>>> +     struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
>>> +     struct tn48m_data *data = dev_get_drvdata(dev);
>>> +     unsigned int regval, status;
>>> +
>>> +     if (board_id_get(data) == BOARD_ID_TN48M_P) {
>>> +             regmap_read(data->regmap, attr2->nr, &regval);
>>> +
>>> +             if (attr2->index == 1)
>>> +                     status = !FIELD_GET(PSU1_PRESENT_MASK, regval);
>>> +             else
>>> +                     status = !FIELD_GET(PSU2_PRESENT_MASK, regval);
>>> +     } else
>>> +             status = 0;
>>> +
>>> +     return sprintf(buf, "%d\n", status);
>>> +}
>>> +
>>> +static ssize_t psu_pg_show(struct device *dev,
>>> +                        struct device_attribute *attr, char *buf)
>>> +{
>>> +     struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
>>> +     struct tn48m_data *data = dev_get_drvdata(dev);
>>> +     unsigned int regval, status;
>>> +
>>> +     regmap_read(data->regmap, attr2->nr, &regval);
>>> +
>>> +     if (attr2->index == 1)
>>> +             status = FIELD_GET(PSU1_POWERGOOD_MASK, regval);
>>> +     else
>>> +             status = FIELD_GET(PSU2_POWERGOOD_MASK, regval);
>>> +
>>> +     return sprintf(buf, "%d\n", status);
>>> +}
>>> +
>>> +static ssize_t psu_alert_show(struct device *dev,
>>> +                           struct device_attribute *attr, char *buf)
>>> +{
>>> +     struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
>>> +     struct tn48m_data *data = dev_get_drvdata(dev);
>>> +     unsigned int regval, status;
>>> +
>>> +     if (board_id_get(data) == BOARD_ID_TN48M_P) {
>>> +             regmap_read(data->regmap, attr2->nr, &regval);
>>> +
>>> +             if (attr2->index == 1)
>>> +                     status = !FIELD_GET(PSU1_ALERT_MASK, regval);
>>> +             else
>>> +                     status = !FIELD_GET(PSU2_ALERT_MASK, regval);
>>> +     } else
>>> +             status = 0;
>>> +
>>> +     return sprintf(buf, "%d\n", status);
>>> +}
>>> +
>>> +static SENSOR_DEVICE_ATTR_2_RO(psu1_present, psu_present, PSU_STATUS, 1);
>>> +static SENSOR_DEVICE_ATTR_2_RO(psu2_present, psu_present, PSU_STATUS, 2);
>>> +static SENSOR_DEVICE_ATTR_2_RO(psu1_pg, psu_pg, PSU_STATUS, 1);
>>> +static SENSOR_DEVICE_ATTR_2_RO(psu2_pg, psu_pg, PSU_STATUS, 2);
>>> +static SENSOR_DEVICE_ATTR_2_RO(psu1_alert, psu_alert, PSU_STATUS, 1);
>>> +static SENSOR_DEVICE_ATTR_2_RO(psu2_alert, psu_alert, PSU_STATUS, 2);
>>> +
>>> +static struct attribute *tn48m_hwmon_attrs[] = {
>>> +     &sensor_dev_attr_psu1_present.dev_attr.attr,
>>> +     &sensor_dev_attr_psu2_present.dev_attr.attr,
>>> +     &sensor_dev_attr_psu1_pg.dev_attr.attr,
>>> +     &sensor_dev_attr_psu2_pg.dev_attr.attr,
>>> +     &sensor_dev_attr_psu1_alert.dev_attr.attr,
>>> +     &sensor_dev_attr_psu2_alert.dev_attr.attr,
>>
>> Literally none of those attributes are standard hwmon attributes.
>> I don't know what this is, but it is not a hardware monitoring driver.
> 
> Yes, I agree that it does not expose any of the standard attributes, but these
> are the only ones the CPLD exposes.
> 
> I don't know where else to put them, MFD driver did not seem logical to me.
>>
>>> +     NULL
>>> +};
>>> +
>>> +ATTRIBUTE_GROUPS(tn48m_hwmon);
>>> +
>>> +static int tn48m_hwmon_probe(struct platform_device *pdev)
>>> +{
>>> +     struct tn48m_data *data = dev_get_drvdata(pdev->dev.parent);
>>> +     struct device *hwmon_dev;
>>> +
>>> +     hwmon_dev = devm_hwmon_device_register_with_groups(&pdev->dev,
>>> +                                                        "tn48m_hwmon",
>>> +                                                        data,
>>> +                                                        tn48m_hwmon_groups);
>>
>> Please use devm_hwmon_device_register_with_info() to register hwmon devices.
>> Of course, that only makes sense for actual hardware monitoring drivers
>> which do support standard attributes.
> 
> Yes, devm_hwmon_device_register_with_info() made no sense without any of the
> standard attributes.
> 

I would suggest to expose the information using debugfs.
Again, this is not a hardware monitoring driver.

Guenter

> Robert
>>
>>> +     return PTR_ERR_OR_ZERO(hwmon_dev);
>>> +}
>>> +
>>> +static const struct platform_device_id tn48m_hwmon_id_table[] = {
>>> +     { "delta,tn48m-hwmon", },
>>> +     { }
>>> +};
>>> +MODULE_DEVICE_TABLE(platform, tn48m_hwmon_id_table);
>>> +
>>> +static struct platform_driver tn48m_hwmon_driver = {
>>> +     .driver = {
>>> +             .name = "tn48m-hwmon",
>>> +     },
>>> +     .probe = tn48m_hwmon_probe,
>>> +     .id_table = tn48m_hwmon_id_table,
>>> +};
>>> +module_platform_driver(tn48m_hwmon_driver);
>>> +
>>> +MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
>>> +MODULE_DESCRIPTION("Delta TN48M CPLD HWMON driver");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/mfd/tn48m-cpld.c b/drivers/mfd/tn48m-cpld.c
>>> index f22a15ddd22d..4d837aca01e7 100644
>>> --- a/drivers/mfd/tn48m-cpld.c
>>> +++ b/drivers/mfd/tn48m-cpld.c
>>> @@ -20,6 +20,9 @@
>>>   static const struct mfd_cell tn48m_cell[] = {
>>>        {
>>>                .name = "delta,tn48m-gpio",
>>> +     },
>>> +     {
>>> +             .name = "delta,tn48m-hwmon",
>>>        }
>>>   };
>>>
>>> diff --git a/include/linux/mfd/tn48m.h b/include/linux/mfd/tn48m.h
>>> index 9cc2b04c8d69..eb2cfc3a5db7 100644
>>> --- a/include/linux/mfd/tn48m.h
>>> +++ b/include/linux/mfd/tn48m.h
>>> @@ -22,6 +22,7 @@
>>>   #define SFP_TX_DISABLE               0x31
>>>   #define SFP_PRESENT          0x3a
>>>   #define SFP_LOS                      0x40
>>> +#define PSU_STATUS           0xa
>>>
>>>   struct tn48m_data {
>>>        struct device *dev;
>>>
>>
> 
> 

