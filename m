Return-Path: <linux-gpio+bounces-4584-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC792887C66
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Mar 2024 12:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B27BB20F4A
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Mar 2024 11:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA2C17589;
	Sun, 24 Mar 2024 11:02:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4456517591
	for <linux-gpio@vger.kernel.org>; Sun, 24 Mar 2024 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711278120; cv=none; b=bwMi4uVdNSey3NG9iLmCrr630ogSTPFYzwuW/ng0XWuPdj7Ztjry8jsD8vNpL5QezHGgya6DBcvvea08+g1VKBk1bBVKvxR3f9kvSDCzpCxvCYxjHge0E8oy7TvrQUgBLve9478xiIv/OBkHutoenJ2xLS1E08VZiA2rL2l4XkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711278120; c=relaxed/simple;
	bh=lNW864cvfYqn2OeFEfu2Vz3ViVE9lz6fktyhQFwFVhA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCCGGcrZNM5sO6i2icAJENudoTxo5hUkW+ucyZB4H4kqUYkg1HwwBDwqAgBruVXVr8t/iRW/pxzBwbQn+IBOdYiObjNqHmVzIuUE1zsVEOQVpld3mNhZKiyoH4XefJhpN3efkhoR27eMjjns0DVyMzpiXJk/3j52wCVBEyXXMCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id ed5c59f1-e9cd-11ee-abf4-005056bdd08f;
	Sun, 24 Mar 2024 13:01:56 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 24 Mar 2024 13:01:55 +0200
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>, soc@kernel.org,
	arm@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v5 02/11] platform: cznic: Add preliminary support for
 Turris Omnia MCU
Message-ID: <ZgAII1B03bLUisWr@surfacebook.localdomain>
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-3-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240323164359.21642-3-kabel@kernel.org>

Sat, Mar 23, 2024 at 05:43:50PM +0100, Marek Behún kirjoitti:
> Add the basic skeleton for a new platform driver for the microcontroller
> found on the Turris Omnia board.

...

> +++ b/drivers/platform/cznic/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_TURRIS_OMNIA_MCU)	+= turris-omnia-mcu.o
> +turris-omnia-mcu-objs		:= turris-omnia-mcu-base.o

'objs' is for user space. You need to use 'y'. Same applies to the entire
series.

...

+ array_size.h
+ bits.h

> +#include <linux/device.h>
> +#include <linux/hex.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/turris-omnia-mcu-interface.h>
> +#include <linux/types.h>

+ string.h

> +#include <linux/sysfs.h>

...

> +	err = omnia_cmd_read(mcu->client, bootloader ? CMD_GET_FW_VERSION_BOOT :
> +						       CMD_GET_FW_VERSION_APP,
> +			     reply, sizeof(reply));

Wouldn't be better to have a logical split?

	err = omnia_cmd_read(mcu->client,
			     bootloader ? CMD_GET_FW_VERSION_BOOT : CMD_GET_FW_VERSION_APP,
			     reply, sizeof(reply));

?

...

> +	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));

What's wrong with dev_get_drvdata()?

...

> +static ssize_t fw_features_show(struct device *dev, struct device_attribute *a,
> +				char *buf)

One line?

...

> +	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));

Use direct call (see above). Same applies to all such constructions in your
code.

...

> +static const struct attribute_group omnia_mcu_base_group = {
> +	.attrs = omnia_mcu_base_attrs,
> +	.is_visible = omnia_mcu_base_attrs_visible,
> +};
> +
> +static const struct attribute_group *omnia_mcu_groups[] = {
> +	&omnia_mcu_base_group,
> +	NULL
> +};

__ATTRIBUTE_GROUPS()

...

> +static struct i2c_driver omnia_mcu_driver = {
> +	.probe		= omnia_mcu_probe,
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

> +#ifndef __TURRIS_OMNIA_MCU_H
> +#define __TURRIS_OMNIA_MCU_H

+ array_size.h

> +#include <linux/i2c.h>
> +#include <linux/if_ether.h>
> +#include <linux/types.h>
> +#include <asm/byteorder.h>

...

> +static inline int omnia_cmd_read(const struct i2c_client *client, u8 cmd,
> +				 void *reply, unsigned int len)
> +{

Why is this in the header?

> +	struct i2c_msg msgs[2];
> +	int ret;
> +
> +	msgs[0].addr = client->addr;
> +	msgs[0].flags = 0;
> +	msgs[0].len = 1;
> +	msgs[0].buf = &cmd;
> +	msgs[1].addr = client->addr;
> +	msgs[1].flags = I2C_M_RD;
> +	msgs[1].len = len;
> +	msgs[1].buf = reply;
> +
> +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> +	if (ret < 0)
> +		return ret;
> +	if (ret != ARRAY_SIZE(msgs))
> +		return -EIO;
> +
> +	return 0;
> +}

...

> +#ifndef __TURRIS_OMNIA_MCU_INTERFACE_H
> +#define __TURRIS_OMNIA_MCU_INTERFACE_H
> +
> +#include <linux/bits.h>

+ bitfield.h

> +#endif /* __TURRIS_OMNIA_MCU_INTERFACE_H */

-- 
With Best Regards,
Andy Shevchenko



