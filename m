Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7271D7A62E9
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Sep 2023 14:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbjISM3X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Sep 2023 08:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231666AbjISM3X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Sep 2023 08:29:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6C3E3;
        Tue, 19 Sep 2023 05:29:17 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382677953"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="382677953"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 05:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775529030"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="775529030"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 05:29:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andy@kernel.org>)
        id 1qiZqn-00000000Mk1-0z4D;
        Tue, 19 Sep 2023 15:29:09 +0300
Date:   Tue, 19 Sep 2023 15:29:08 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-gpio@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 2/7] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <ZQmUFPvIx91+ps6k@smile.fi.intel.com>
References: <20230919103815.16818-1-kabel@kernel.org>
 <20230919103815.16818-3-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919103815.16818-3-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 19, 2023 at 12:38:10PM +0200, Marek Behún wrote:
> Add a new platform driver that exposes the features provided by the
> microcontroller on the Turris Omnia board.

> This commit adds the basic skeleton for the driver.

Read "Submitting Patches" documentation (find "This patch" in it) and amend
your commit message accordingly.

...

> +Date:		August 2023
> +KernelVersion:	6.6

Wrong and outdated. Use phb-crystall-ball to find the closest possible values
for both parameters here.

Ditto for all others with the same issue.

Note, it likely might be part of v6.7, not earlier.

...

> @@ -11,3 +11,4 @@ obj-$(CONFIG_OLPC_EC)		+= olpc/
>  obj-$(CONFIG_GOLDFISH)		+= goldfish/
>  obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
>  obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
> +obj-$(CONFIG_CZNIC_PLATFORMS)	+= cznic/

Why not ordered (to some extent) here (as you did in the other file)?

...

> +turris-omnia-mcu-objs		:= turris-omnia-mcu-base.o

objs is for user space tools. Kernel code should use m,y.

...

> +#include <linux/hex.h>
> +#include <linux/module.h>

Missing types.h, sysfs.h, mod_devicetable.h, i2c.h, ...

...

> +static int omnia_get_version_hash(struct omnia_mcu *mcu, bool bootloader,
> +				  u8 *version)
> +{
> +	u8 reply[20];
> +	int ret;
> +
> +	ret = omnia_cmd_read(mcu->client, bootloader ? CMD_GET_FW_VERSION_BOOT :
> +						       CMD_GET_FW_VERSION_APP,
> +			     reply, sizeof(reply));

> +	if (ret < 0)

Can it return positive value? What would be the meaning of it?

> +		return ret;

> +	version[40] = '\0';

How do you know the version has enough space?

> +	bin2hex(version, reply, 20);
> +
> +	return 0;
> +}
> +
> +static ssize_t fw_version_hash_show(struct device *dev, char *buf,
> +				    bool bootloader)
> +{
> +	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
> +	u8 version[41];

> +	int err;

In two near functions you already inconsistent in the naming of the return code
variable. Be consistent across all your code, i.e. choose one name and use it
everywhere.

> +	err = omnia_get_version_hash(mcu, bootloader, version);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buf, "%s\n", version);
> +}

...

> +	return sysfs_emit(buf, "%#x\n", mcu->features);

"0" will be printed differently, is this on purpose?

...

> +	int ret = omnia_cmd_read_u8(to_i2c_client(dev), CMD_GET_RESET);
> +
> +	if (ret < 0)
> +		return ret;

Better from maintenance perspective to have

	int ret;

	ret = omnia_cmd_read_u8(to_i2c_client(dev), CMD_GET_RESET);
	if (ret < 0)
		return ret;

...

> +static struct attribute *omnia_mcu_attrs[] = {
> +	&dev_attr_fw_version_hash_application.attr,
> +	&dev_attr_fw_version_hash_bootloader.attr,
> +	&dev_attr_fw_features.attr,
> +	&dev_attr_mcu_type.attr,
> +	&dev_attr_reset_selector.attr,

> +	NULL,

No comma for the terminator line. It will make your code robust at compile time
against some misplaced entries.

> +};

> +

Unneeded blank line.

> +ATTRIBUTE_GROUPS(omnia_mcu);

...

> +	u8 version[41];

This magic sizes should go away. Use predefined constant, or allocate on the
heap, depending on the case(s) you have.

...

> +	int status;

My gosh, it's a _third_ name for the same!

> +	status = omnia_cmd_read_u16(mcu->client, CMD_GET_STATUS_WORD);
> +	if (status < 0)
> +		return status;

...

> +	for (int i = 0; i < ARRAY_SIZE(features); ++i) {

Why signed?
Why pre-increment?

> +		if (!(mcu->features & features[i].mask)) {

Wouldn't be better

		if (mcu->features & features[i].mask)
			continue;

?

> +			omnia_info_missing_feature(dev, features[i].name);
> +			suggest_fw_upgrade = true;
> +		}
> +	}

...

> +		dev_info(dev,
> +			 "Consider upgrading MCU firmware with the omnia-mcutool utility.\n");

You have so-o many dev_info() calls, are you sure you not abusing use of that?

...

> +	if (ret) {
> +		dev_err(dev, "Cannot determine MCU supported features: %d\n",
> +			ret);
> +		return ret;

		return dev_err_probe(...);

> +	}

...

> +	if (!client->irq) {
> +		dev_err(dev, "IRQ resource not found\n");
> +		return -ENODATA;
> +	}

Why you need to allocate memory, go through the initial checks, etc and then
fail? What's wrong with checking this first?

Why -ENODATA?!

...

> +static const struct of_device_id of_omnia_mcu_match[] = {
> +	{ .compatible = "cznic,turris-omnia-mcu", },

Inner comma is not needed.

> +	{},

No comma for the terminator entry.

> +};

...

> +static const struct i2c_device_id omnia_mcu_id[] = {
> +	{ "turris-omnia-mcu", 0 },

', 0' part is redundant.

> +	{ }
> +};

...

> +static struct i2c_driver omnia_mcu_driver = {
> +	.probe		= omnia_mcu_probe,
> +	.id_table	= omnia_mcu_id,
> +	.driver		= {
> +		.name	= "turris-omnia-mcu",
> +		.of_match_table = of_omnia_mcu_match,
> +		.dev_groups = omnia_mcu_groups,
> +	},
> +};

> +

Redundant blank line.

> +module_i2c_driver(omnia_mcu_driver);

...

> +#ifndef __DRIVERS_PLATFORM_CZNIC_TURRIS_OMNIA_MCU_H
> +#define __DRIVERS_PLATFORM_CZNIC_TURRIS_OMNIA_MCU_H

WE_LIKE_VERY_LONG_AND_OVERFLOWED_DEFINITIONS_H!

...

> +#include <asm/byteorder.h>

This usually goes after linux/*.h.

> +#include <linux/i2c.h>

Missing types.h, errno.h, ...

+ blank line?

> +#include <linux/turris-omnia-mcu-interface.h>

...

> +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +	if (likely(ret == ARRAY_SIZE(msgs)))

Why likely()? Please, justify.

> +		return len;

> +	else if (ret < 0)
> +		return ret;
> +	else
> +		return -EIO;

In both cases the 'else' is redundant. Moreover, the usual pattern is to check
for the errors first.

> +}

...

> +#ifndef __INCLUDE_LINUX_TURRIS_OMNIA_MCU_INTERFACE_H
> +#define __INCLUDE_LINUX_TURRIS_OMNIA_MCU_INTERFACE_H

My gosh!

...

> +#include <linux/bits.h>

> +enum commands_e {

Are you sure the name is unique enough / properly namespaced?
Same Q to all enums.

...

> +	/*CTL_RESERVED		= BIT(2),*/

Missing spaces?
Also, needs a comment why this is commented out.

...

> +	CTL_BOOTLOADER		= BIT(7)

Add trailing comma.

-- 
With Best Regards,
Andy Shevchenko


