Return-Path: <linux-gpio+bounces-4580-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 058A7887A70
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Mar 2024 22:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 273A01C211F7
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Mar 2024 21:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41D258AA4;
	Sat, 23 Mar 2024 21:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="tjxl6TsD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D4E1A38FC;
	Sat, 23 Mar 2024 21:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711228782; cv=none; b=LMuMvVJ+5eHDWM73SaRDDsAHT/3uoQvR7WJOmMCjepDVRXwqOo6DJSK7qBFRxduMcfm+xwZjFOjGE/0V/uroGX/77tOPlBrYyOr1QVDOUjCHxVJPBlAGsQjDCIA+VWju+yefAhRchiQtb/PoULt9SLKqZxXSxr7MjNU3KTb5gvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711228782; c=relaxed/simple;
	bh=JpcrUJdmS/4IgI5QI+Qh0NIsgQcKWshPCe2Rjv293nQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=edMboeycqoIgsILczUWdTZooMvWkQJz8ljhjnea89AmCjceV96dRkq4N4/yMDIiN+ZRVF19SgURZc1fQaJodcR3ZHZncmGCcpVRSdRBv4TBoc24iohtqz1lgZ27frkmpYIMTDQpmQj1yXoMTtVb0PCeef4wk1Ye6XSclLvCNVTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=tjxl6TsD; arc=none smtp.client-ip=80.12.242.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.18] ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id o8dVrHyUaxF4io8dVrca32; Sat, 23 Mar 2024 22:10:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1711228250;
	bh=081SY6ILS8irvUEzb5W45b7u/eR994khviHP2fr1g0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=tjxl6TsDtbdkGl2tLHE6xT1nCWBNpCJxkYhH5EhzURMpl98mxH5rh5iW1uIXGGgyY
	 0F803JrvMIAvwAh2Z488GCWwmvfkiL+3RAj2TYMt+kEBXcDiBRS2sFp8d1jCLtUiaX
	 mxFrq8g5v7+JU859hvjnshTSmW6h1chPSdsZZ1LMrjc+pXwfVJxJvG2Cfbd1U2V7pA
	 vXKhFIbY4Hl5OqhFhpCoAK4teirh91aSvoNFeufniFx682+SvITlGbOtK5WCr2k5nQ
	 kfVrUkOr4GajYcShZlrY7Mtl/Ep3ijYJbl32vuZLUnAQ21aX75dEK0vpCzkT5eoTtd
	 eSMZfdgQ7pqAg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 23 Mar 2024 22:10:50 +0100
X-ME-IP: 86.243.17.157
Message-ID: <f7c64a5a-2abc-4b7e-95db-7ca57b5427c0@wanadoo.fr>
Date: Sat, 23 Mar 2024 22:10:40 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/11] devm-helpers: Add resource managed version of
 debugfs directory create function
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-9-kabel__6885.49310886941$1711212291$gmane$org@kernel.org>
Content-Language: en-MW
Cc: Jonathan.Cameron@huawei.com, Laurent.pinchart@ideasonboard.com,
 airlied@gmail.com, andrzej.hajda@intel.com, arm@kernel.org, arnd@arndb.de,
 bamv2005@gmail.com, brgl@bgdev.pl, daniel@ffwll.ch, davem@davemloft.net,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 eajames@linux.ibm.com, gaurav.jain@nxp.com, gregory.clement@bootlin.com,
 hdegoede@redhat.com, herbert@gondor.apana.org.au, horia.geanta@nxp.com,
 james.clark@arm.com, james@equiv.tech, jdelvare@suse.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linus.walleij@linaro.org,
 linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@roeck-us.net, maarten.lankhorst@linux.intel.com,
 mazziesaccount@gmail.com, mripard@kernel.org, naresh.solanki@9elements.com,
 neil.armstrong@linaro.org, pankaj.gupta@nxp.com,
 patrick.rudolph@9elements.com, rfoss@kernel.org, soc@kernel.org,
 tzimmermann@suse.de
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240323164359.21642-9-kabel__6885.49310886941$1711212291$gmane$org@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 23/03/2024 à 17:43, Marek Behún a écrit :
> A few drivers register a devm action to remove a debugfs directory,
> implementing a one-liner function that calls debufs_remove_recursive().
> Help drivers avoid this repeated implementations by adding managed
> version of debugfs directory create function.
> 
> Use the new function devm_debugfs_create_dir() in the following
> drivers:
>    drivers/crypto/caam/ctrl.c
>    drivers/gpu/drm/bridge/ti-sn65dsi86.c
>    drivers/hwmon/hp-wmi-sensors.c
>    drivers/hwmon/mr75203.c
>    drivers/hwmon/pmbus/pmbus_core.c
> 
> Also use the action function devm_debugfs_dir_recursive_drop() in
> driver
>    drivers/gpio/gpio-mockup.c
> 
> As per Dan Williams' request [1], do not touch the driver
>    drivers/cxl/mem.c
> 
> [1] https://lore.kernel.org/linux-gpio/65d7918b358a5_1ee3129432@dwillia2-mobl3.amr.corp.intel.com.notmuch/
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>   drivers/crypto/caam/ctrl.c            | 16 +++--------
>   drivers/gpio/gpio-mockup.c            | 11 ++------
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 ++-------
>   drivers/hwmon/hp-wmi-sensors.c        | 15 ++--------
>   drivers/hwmon/mr75203.c               | 15 ++++------
>   drivers/hwmon/pmbus/pmbus_core.c      | 16 ++++-------
>   include/linux/devm-helpers.h          | 40 +++++++++++++++++++++++++++
>   7 files changed, 61 insertions(+), 65 deletions(-)

...

> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index 455eecf6380e..adbe0fe09490 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -12,6 +12,7 @@
>   #include <linux/cleanup.h>
>   #include <linux/debugfs.h>
>   #include <linux/device.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/gpio/driver.h>
>   #include <linux/interrupt.h>
>   #include <linux/irq.h>
> @@ -390,13 +391,6 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
>   	}
>   }
>   
> -static void gpio_mockup_debugfs_cleanup(void *data)
> -{
> -	struct gpio_mockup_chip *chip = data;
> -
> -	debugfs_remove_recursive(chip->dbg_dir);
> -}
> -
>   static void gpio_mockup_dispose_mappings(void *data)
>   {
>   	struct gpio_mockup_chip *chip = data;
> @@ -480,7 +474,8 @@ static int gpio_mockup_probe(struct platform_device *pdev)
>   
>   	gpio_mockup_debugfs_setup(dev, chip);
>   
> -	return devm_add_action_or_reset(dev, gpio_mockup_debugfs_cleanup, chip);
> +	return devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_drop,
> +					chip->dbg_dir);

This look strange. Shouldn't the debugfs_create_dir() call in 
gpio_mockup_debugfs_setup() be changed, instead?

(I've not look in the previous version if something was said about it, 
so apologies if already discussed)

>   }
>   
>   static const struct of_device_id gpio_mockup_of_match[] = {

...


> diff --git a/drivers/hwmon/mr75203.c b/drivers/hwmon/mr75203.c
> index 50a8b9c3f94d..50f348fca108 100644
> --- a/drivers/hwmon/mr75203.c
> +++ b/drivers/hwmon/mr75203.c
> @@ -10,6 +10,7 @@
>   #include <linux/bits.h>
>   #include <linux/clk.h>
>   #include <linux/debugfs.h>
> +#include <linux/devm-helpers.h>
>   #include <linux/hwmon.h>
>   #include <linux/kstrtox.h>
>   #include <linux/module.h>
> @@ -216,17 +217,11 @@ static const struct file_operations pvt_ts_coeff_j_fops = {
>   	.llseek = default_llseek,
>   };
>   
> -static void devm_pvt_ts_dbgfs_remove(void *data)
> -{
> -	struct pvt_device *pvt = (struct pvt_device *)data;
> -
> -	debugfs_remove_recursive(pvt->dbgfs_dir);
> -	pvt->dbgfs_dir = NULL;
> -}
> -
>   static int pvt_ts_dbgfs_create(struct pvt_device *pvt, struct device *dev)
>   {
> -	pvt->dbgfs_dir = debugfs_create_dir(dev_name(dev), NULL);
> +	pvt->dbgfs_dir = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
> +	if (IS_ERR(pvt->dbgfs_dir))
> +		return PTR_ERR(pvt->dbgfs_dir);

Not sure if the test and error handling should be added here.
*If I'm correct*, functions related to debugfs already handle this case 
and just do nothing. And failure in debugfs related code is not 
considered as something that need to be reported and abort a probe function.

Maybe the same other (already existing) tests in this patch should be 
removed as well, in a separated patch.

just my 2c

CJ

>   
>   	debugfs_create_u32("ts_coeff_h", 0644, pvt->dbgfs_dir,
>   			   &pvt->ts_coeff.h);
> @@ -237,7 +232,7 @@ static int pvt_ts_dbgfs_create(struct pvt_device *pvt, struct device *dev)
>   	debugfs_create_file("ts_coeff_j", 0644, pvt->dbgfs_dir, pvt,
>   			    &pvt_ts_coeff_j_fops);
>   
> -	return devm_add_action_or_reset(dev, devm_pvt_ts_dbgfs_remove, pvt);
> +	return 0;
>   }

...


