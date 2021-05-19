Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCC0E388D65
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 14:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239424AbhESMDR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 08:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353068AbhESMDQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 08:03:16 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C353DC06175F
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 05:01:55 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id d24so12734159ios.2
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 05:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QbcVwQW1z15G6VjS0UeeaaJEOmNbFGmcyc8swkb4/8g=;
        b=OAv0T2Oc6tv18fE2NrzQGd43DJALHgYEWT6TjprKNCoz3x+XoHKwH9dBuwGPmcJCmH
         t2iHw4gziydt7dTF2RTp+oEAhCYOVc4XIaQyb5iq1D0pNfkHFzxOXDvkNDqSroOgUT/m
         QiQsNPKaDkr0tHXhC9/r1daj0JHiXv9/cLXG1ZN6Sn3q6AZU7H6Zi+TYzd7lCYN1zPj1
         mb2rxjYDcAuDSzbTM7EOxv3HA1Qqph1/nv4VATtXj6AxRAisa6t7xkZBU7/bZhvKHI34
         myyKCJKQb/1v4YDOdVbOfbXVh04bjeD5FA2dyl2+e/apqegxd2HS5O96JxqFC1OeW8dx
         DyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QbcVwQW1z15G6VjS0UeeaaJEOmNbFGmcyc8swkb4/8g=;
        b=JhtQIriGGf1djuwy/meXP6TqSmlRbtOjgwId1CwWNkUEOTpLcDWjXa5bFHgAulZdtJ
         +nDiQ6vOL19PhZdvLleHFTJ50ZOk3Wpv1xs0fnL/hcc7EMENjGyAC4tu+t9ffMhNFA6A
         NjlfjPYD4d1I5pRr1Jl74Kwf81io3aWSIwkGeESYtW/O8whEwdPn/blx2Tc1fFtc0Ni+
         EHN3gkU/tnR5wJlanIckzr0T+9jguw351zLL+r5vgyMtJE9F6UreoHl8S7ib0spsIS3H
         JX9aHKm1pz0ZAhopikVlsW7fVRNaayutOTGXsIxXof7EpEKpQF+X+mShNiKaY/4DZw7J
         3eSQ==
X-Gm-Message-State: AOAM530o/DekPBp/HBYP//Ojqb8dHa2RDVRx4IQJoktMVVUYKW6DJaiA
        nWb9+fJY5ZpffiiwUKVfwbHyNlOimhDt2/SE58wQZID2rrIEWook
X-Google-Smtp-Source: ABdhPJy+Dpc5p77lHiZnSay9+BoIG7EvK09vpmvABwcqk+PQ8B5i6qIjM+AqMZPD3g27HqNhlpXdB/mMz9Gdnrest8c=
X-Received: by 2002:a02:4844:: with SMTP id p65mr12234056jaa.102.1621425715190;
 Wed, 19 May 2021 05:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210430123511.116057-1-robert.marko@sartura.hr>
 <20210430123511.116057-4-robert.marko@sartura.hr> <f5bc39d4-742d-4403-7b5d-172a2410a631@roeck-us.net>
In-Reply-To: <f5bc39d4-742d-4403-7b5d-172a2410a631@roeck-us.net>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Wed, 19 May 2021 14:01:44 +0200
Message-ID: <CA+HBbNE2E8jEnLhGE-Z3qqYFS99TnCMdS7m8rfum1MbPX+-=bw@mail.gmail.com>
Subject: Re: [PATCH 4/6] hwmon: Add Delta TN48M CPLD HWMON driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Lee Jones <lee.jones@linaro.org>, robh+dt@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, jdelvare@suse.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 30, 2021 at 3:12 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 4/30/21 5:35 AM, Robert Marko wrote:
> > Delta TN48M has a CPLD that also monitors the power supply
> > statuses.
> >
> > These are useful to be presented to the users, so lets
> > add a driver for HWMON part of the CPLD.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  drivers/hwmon/Kconfig       |  10 +++
> >  drivers/hwmon/Makefile      |   1 +
> >  drivers/hwmon/tn48m-hwmon.c | 148 ++++++++++++++++++++++++++++++++++++
> >  drivers/mfd/tn48m-cpld.c    |   3 +
> >  include/linux/mfd/tn48m.h   |   1 +
> >  5 files changed, 163 insertions(+)
> >  create mode 100644 drivers/hwmon/tn48m-hwmon.c
> >
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 54f04e61fb83..89271dfeb775 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1924,6 +1924,16 @@ config SENSORS_TMP513
> >         This driver can also be built as a module. If so, the module
> >         will be called tmp513.
> >
> > +config SENSORS_TN48M
> > +     tristate "Delta Networks TN48M switch CPLD HWMON driver"
> > +     depends on MFD_TN48M_CPLD
> > +     help
> > +       If you say yes here you get support for Delta Networks TN48M
> > +       CPLD.
> > +
> > +       This driver can also be built as a module. If so, the module
> > +       will be called tn48m-hwmon.
> > +
> >  config SENSORS_VEXPRESS
> >       tristate "Versatile Express"
> >       depends on VEXPRESS_CONFIG
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index fe38e8a5c979..22e470057ffe 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -187,6 +187,7 @@ obj-$(CONFIG_SENSORS_TMP108)      += tmp108.o
> >  obj-$(CONFIG_SENSORS_TMP401) += tmp401.o
> >  obj-$(CONFIG_SENSORS_TMP421) += tmp421.o
> >  obj-$(CONFIG_SENSORS_TMP513) += tmp513.o
> > +obj-$(CONFIG_SENSORS_TN48M)  += tn48m-hwmon.o
> >  obj-$(CONFIG_SENSORS_VEXPRESS)       += vexpress-hwmon.o
> >  obj-$(CONFIG_SENSORS_VIA_CPUTEMP)+= via-cputemp.o
> >  obj-$(CONFIG_SENSORS_VIA686A)        += via686a.o
> > diff --git a/drivers/hwmon/tn48m-hwmon.c b/drivers/hwmon/tn48m-hwmon.c
> > new file mode 100644
> > index 000000000000..80fd18d74f1d
> > --- /dev/null
> > +++ b/drivers/hwmon/tn48m-hwmon.c
> > @@ -0,0 +1,148 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Delta TN48M CPLD HWMON driver
> > + *
> > + * Copyright 2020 Sartura Ltd
> > + *
> > + * Author: Robert Marko <robert.marko@sartura.hr>
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/hwmon-sysfs.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <linux/mfd/tn48m.h>
> > +
> > +#define PSU1_PRESENT_MASK    BIT(0)
> > +#define PSU2_PRESENT_MASK    BIT(1)
> > +#define PSU1_POWERGOOD_MASK  BIT(2)
> > +#define PSU2_POWERGOOD_MASK  BIT(3)
> > +#define PSU1_ALERT_MASK              BIT(4)
> > +#define PSU2_ALERT_MASK              BIT(5)
> > +
> > +static int board_id_get(struct tn48m_data *data)
> > +{
> > +     unsigned int regval;
> > +
> > +     regmap_read(data->regmap, BOARD_ID, &regval);
> > +
> > +     switch (regval) {
> > +     case BOARD_ID_TN48M:
> > +             return BOARD_ID_TN48M;
> > +     case BOARD_ID_TN48M_P:
> > +             return BOARD_ID_TN48M_P;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
> > +
> > +static ssize_t psu_present_show(struct device *dev,
> > +                             struct device_attribute *attr, char *buf)
> > +{
> > +     struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
> > +     struct tn48m_data *data = dev_get_drvdata(dev);
> > +     unsigned int regval, status;
> > +
> > +     if (board_id_get(data) == BOARD_ID_TN48M_P) {
> > +             regmap_read(data->regmap, attr2->nr, &regval);
> > +
> > +             if (attr2->index == 1)
> > +                     status = !FIELD_GET(PSU1_PRESENT_MASK, regval);
> > +             else
> > +                     status = !FIELD_GET(PSU2_PRESENT_MASK, regval);
> > +     } else
> > +             status = 0;
> > +
> > +     return sprintf(buf, "%d\n", status);
> > +}
> > +
> > +static ssize_t psu_pg_show(struct device *dev,
> > +                        struct device_attribute *attr, char *buf)
> > +{
> > +     struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
> > +     struct tn48m_data *data = dev_get_drvdata(dev);
> > +     unsigned int regval, status;
> > +
> > +     regmap_read(data->regmap, attr2->nr, &regval);
> > +
> > +     if (attr2->index == 1)
> > +             status = FIELD_GET(PSU1_POWERGOOD_MASK, regval);
> > +     else
> > +             status = FIELD_GET(PSU2_POWERGOOD_MASK, regval);
> > +
> > +     return sprintf(buf, "%d\n", status);
> > +}
> > +
> > +static ssize_t psu_alert_show(struct device *dev,
> > +                           struct device_attribute *attr, char *buf)
> > +{
> > +     struct sensor_device_attribute_2 *attr2 = to_sensor_dev_attr_2(attr);
> > +     struct tn48m_data *data = dev_get_drvdata(dev);
> > +     unsigned int regval, status;
> > +
> > +     if (board_id_get(data) == BOARD_ID_TN48M_P) {
> > +             regmap_read(data->regmap, attr2->nr, &regval);
> > +
> > +             if (attr2->index == 1)
> > +                     status = !FIELD_GET(PSU1_ALERT_MASK, regval);
> > +             else
> > +                     status = !FIELD_GET(PSU2_ALERT_MASK, regval);
> > +     } else
> > +             status = 0;
> > +
> > +     return sprintf(buf, "%d\n", status);
> > +}
> > +
> > +static SENSOR_DEVICE_ATTR_2_RO(psu1_present, psu_present, PSU_STATUS, 1);
> > +static SENSOR_DEVICE_ATTR_2_RO(psu2_present, psu_present, PSU_STATUS, 2);
> > +static SENSOR_DEVICE_ATTR_2_RO(psu1_pg, psu_pg, PSU_STATUS, 1);
> > +static SENSOR_DEVICE_ATTR_2_RO(psu2_pg, psu_pg, PSU_STATUS, 2);
> > +static SENSOR_DEVICE_ATTR_2_RO(psu1_alert, psu_alert, PSU_STATUS, 1);
> > +static SENSOR_DEVICE_ATTR_2_RO(psu2_alert, psu_alert, PSU_STATUS, 2);
> > +
> > +static struct attribute *tn48m_hwmon_attrs[] = {
> > +     &sensor_dev_attr_psu1_present.dev_attr.attr,
> > +     &sensor_dev_attr_psu2_present.dev_attr.attr,
> > +     &sensor_dev_attr_psu1_pg.dev_attr.attr,
> > +     &sensor_dev_attr_psu2_pg.dev_attr.attr,
> > +     &sensor_dev_attr_psu1_alert.dev_attr.attr,
> > +     &sensor_dev_attr_psu2_alert.dev_attr.attr,
>
> Literally none of those attributes are standard hwmon attributes.
> I don't know what this is, but it is not a hardware monitoring driver.

Yes, I agree that it does not expose any of the standard attributes, but these
are the only ones the CPLD exposes.

I don't know where else to put them, MFD driver did not seem logical to me.
>
> > +     NULL
> > +};
> > +
> > +ATTRIBUTE_GROUPS(tn48m_hwmon);
> > +
> > +static int tn48m_hwmon_probe(struct platform_device *pdev)
> > +{
> > +     struct tn48m_data *data = dev_get_drvdata(pdev->dev.parent);
> > +     struct device *hwmon_dev;
> > +
> > +     hwmon_dev = devm_hwmon_device_register_with_groups(&pdev->dev,
> > +                                                        "tn48m_hwmon",
> > +                                                        data,
> > +                                                        tn48m_hwmon_groups);
>
> Please use devm_hwmon_device_register_with_info() to register hwmon devices.
> Of course, that only makes sense for actual hardware monitoring drivers
> which do support standard attributes.

Yes, devm_hwmon_device_register_with_info() made no sense without any of the
standard attributes.

Robert
>
> > +     return PTR_ERR_OR_ZERO(hwmon_dev);
> > +}
> > +
> > +static const struct platform_device_id tn48m_hwmon_id_table[] = {
> > +     { "delta,tn48m-hwmon", },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(platform, tn48m_hwmon_id_table);
> > +
> > +static struct platform_driver tn48m_hwmon_driver = {
> > +     .driver = {
> > +             .name = "tn48m-hwmon",
> > +     },
> > +     .probe = tn48m_hwmon_probe,
> > +     .id_table = tn48m_hwmon_id_table,
> > +};
> > +module_platform_driver(tn48m_hwmon_driver);
> > +
> > +MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
> > +MODULE_DESCRIPTION("Delta TN48M CPLD HWMON driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/mfd/tn48m-cpld.c b/drivers/mfd/tn48m-cpld.c
> > index f22a15ddd22d..4d837aca01e7 100644
> > --- a/drivers/mfd/tn48m-cpld.c
> > +++ b/drivers/mfd/tn48m-cpld.c
> > @@ -20,6 +20,9 @@
> >  static const struct mfd_cell tn48m_cell[] = {
> >       {
> >               .name = "delta,tn48m-gpio",
> > +     },
> > +     {
> > +             .name = "delta,tn48m-hwmon",
> >       }
> >  };
> >
> > diff --git a/include/linux/mfd/tn48m.h b/include/linux/mfd/tn48m.h
> > index 9cc2b04c8d69..eb2cfc3a5db7 100644
> > --- a/include/linux/mfd/tn48m.h
> > +++ b/include/linux/mfd/tn48m.h
> > @@ -22,6 +22,7 @@
> >  #define SFP_TX_DISABLE               0x31
> >  #define SFP_PRESENT          0x3a
> >  #define SFP_LOS                      0x40
> > +#define PSU_STATUS           0xa
> >
> >  struct tn48m_data {
> >       struct device *dev;
> >
>


-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
