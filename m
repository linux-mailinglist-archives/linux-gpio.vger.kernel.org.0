Return-Path: <linux-gpio+bounces-29029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B801C812E5
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 15:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EDDC84E8BE1
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 14:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F7228D8D0;
	Mon, 24 Nov 2025 14:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ik6dL38Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F0E290D81
	for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 14:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763996026; cv=none; b=ZOYJMre8cm0/XCFhkJC5j2MJCqF29aNakDU4MofSEq3vIHmZouTwXlorxIle1+V+nDy4ewkmQYXryrQMGlAJwQozfirEMn6LhPpGKbAqOfrkIJNEIdVQWnQ+cc9CYRIx2M6CDKm6oxL8sfftSfGQm1ydvjXmmSQ+98HAwHvARXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763996026; c=relaxed/simple;
	bh=wSQ341CU5vsOctNXexpEakv7qkoHtZ0v3orCbR3i2WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUBkd5Y8hjVrn61aoxXcEHC690jYzt8NAx7MqyN2q51WFC4d8lWEbrLwDldypAlNgYBrxTTlE+gf8sRasuWFjwJPKMH5lwftvQnry+tuy+s+Pppo51QEGh8mbz+RvQpGQvIfgZEjIY4l/LuKgxbJ9OriLQXHUJWBMgiYTEb78KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ik6dL38Y; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so6818653a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Nov 2025 06:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763996022; x=1764600822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DMHuhLQ2+QePhLbxyyov6Mwfn5dk2KsNTjCwuBZ/B2U=;
        b=ik6dL38YPwwICDcAYncv4pic404Eg6MF67Iq6Z11ouqvWNQS5ypzvMZZSLmYhHwzGJ
         TQIDw38S2ahEtgqzll0BdRcfRnxuCVEAFeGUZAzfMh8lnIcxD3lUyawJhJvA7XUrPGtS
         /tDoPAqdp0HAk8dVF4YLbkWNkCT6McA9QIkmWL7WVJiF3JIERVwjFOd8bcShMoAsIztp
         Eqbnpa+GUc+44aOaFJAZgE+NmccHDxC+XmzVmuQkfr4ZY+4Qhj6Yy9Uk7OZ9+cMwq0C6
         aqOgoBbSoe5Z6bdgt2N9XoogGfjgT3RHGVLf7qNfagtgiC/hvFuY9nwBWONMGvhLd7wL
         emsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996022; x=1764600822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMHuhLQ2+QePhLbxyyov6Mwfn5dk2KsNTjCwuBZ/B2U=;
        b=QhWvWGXugRmyXmS+9Dmg4vtOfE2tKVGU8RPN0do0Lgup0Zq8QvMP0KkJ/IjLL+p1LR
         G76SwN1en8jxiVSjbDddnBtgSn/4V0NrLur0I2Cv+SwqSNeDPZEj6z1FvrT+NVq6LcBK
         kJADBPwd60E15j2F6jyJq6zQOKnrznM/as5GNjzsO1Y++taGHRkVLysoX3ZcRJbQ21M5
         sodu2k5SkyoxflzejtNCdFu8KclARpYW3CcbHJ85h3VX+6itHIueqNBRWpZ5ULiPLizL
         T8dEl9wE1S6DodubQXOwbqSlEazMdvFibClI7+lMt5bWW6mnHvTCuzzZBBxV+QDRGffX
         jtpw==
X-Forwarded-Encrypted: i=1; AJvYcCWkzWuhuG+Iy7fe7r9Cj9u4Xw0xnEoppVdM1osiG9jctVgCOU4Pcd3/WB6JuBaYsM7F2KwSbydAd65/@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ/NdkcGdOykb5q4kxlohrw0NZhwpvBODBYsA/oea1BqwrqrOt
	QsgccKFlREzFcXRLc+LeM1CyCQciWrr6LGiOfOSfcEMgPYIiqxm9WQrJ
X-Gm-Gg: ASbGncvSBcEZOvkW+L8Sm7L06gsFJfhwtfnLV4595PglHY0Q6ARwxf4/Px9wYTdVv3w
	dYBSKyEdqUy84xgyqjqJNAwkuf3UdYMEEFlECNvCAE4lGRYGCsysUexT0Le5/XLZ9JxYGGvnKlV
	kAfC/nalHCacMGz9z1rU36kazJbveXaQMefXcKbzYFqwpmgz2shaq0bDvRyybcUdh0XGANrsbq+
	0sruq7IJYkkGR1a2U00xCFz1C39IrJAKufBW/vhQiB3z4+97xPdxXN1QsoYjii3rqn2UEfQ8l7r
	Q2TDuJweaZiFLaNw+TCj7SvOU+5s/hp0zBmSwMDuSr0GMMsWrs6QgMmFGM7azEI+1w91vy4wAoX
	M8skPkSLH5huCIGMhlKm2bLTy9ACSFISV1m5/jxegebuI5bd3v6bngiFF9J3/kdggPnbUdfHIdz
	uOiwOE9Pge5LXxeQ==
X-Google-Smtp-Source: AGHT+IGs/95/cJ+tL3SsaiiXXgcuCaeuAg21ZTVttRpATbc8iAWB4Al2D0iS745iUZOaE4uems77rg==
X-Received: by 2002:a2e:95d9:0:b0:37a:5bc6:ab9f with SMTP id 38308e7fff4ca-37cd92392c8mr23746331fa.26.1763989401463;
        Mon, 24 Nov 2025 05:03:21 -0800 (PST)
Received: from [10.38.18.76] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b48e26sm27317291fa.1.2025.11.24.05.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:03:21 -0800 (PST)
Message-ID: <f74ab0a2-b74b-4b96-8469-a716c850e230@gmail.com>
Date: Mon, 24 Nov 2025 15:03:19 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT
 overlays"
To: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>,
 Saravana Kannan <saravanak@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-2-herve.codina@bootlin.com>
Content-Language: en-US
From: Kalle Niemi <kaleposti@gmail.com>
In-Reply-To: <20251015071420.1173068-2-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 10:13, Herve Codina wrote:
> From: Saravana Kannan <saravanak@google.com>
> 
> This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.
> 
> While the commit fixed fw_devlink overlay handling for one case, it
> broke it for another case. So revert it and redo the fix in a separate
> patch.
> 
> Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
> Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
> Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Link: https://lore.kernel.org/lkml/20240411235623.1260061-2-saravanak@google.com/
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
>   drivers/bus/imx-weim.c    | 6 ------
>   drivers/i2c/i2c-core-of.c | 5 -----
>   drivers/of/dynamic.c      | 1 -
>   drivers/of/platform.c     | 5 -----
>   drivers/spi/spi.c         | 5 -----
>   5 files changed, 22 deletions(-)
> 
> diff --git a/drivers/bus/imx-weim.c b/drivers/bus/imx-weim.c
> index 83d623d97f5f..87070155b057 100644
> --- a/drivers/bus/imx-weim.c
> +++ b/drivers/bus/imx-weim.c
> @@ -327,12 +327,6 @@ static int of_weim_notify(struct notifier_block *nb, unsigned long action,
>   				 "Failed to setup timing for '%pOF'\n", rd->dn);
>   
>   		if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
> -			/*
> -			 * Clear the flag before adding the device so that
> -			 * fw_devlink doesn't skip adding consumers to this
> -			 * device.
> -			 */
> -			rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>   			if (!of_platform_device_create(rd->dn, NULL, &pdev->dev)) {
>   				dev_err(&pdev->dev,
>   					"Failed to create child device '%pOF'\n",
> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
> index eb7fb202355f..30b48a428c0b 100644
> --- a/drivers/i2c/i2c-core-of.c
> +++ b/drivers/i2c/i2c-core-of.c
> @@ -176,11 +176,6 @@ static int of_i2c_notify(struct notifier_block *nb, unsigned long action,
>   			return NOTIFY_OK;
>   		}
>   
> -		/*
> -		 * Clear the flag before adding the device so that fw_devlink
> -		 * doesn't skip adding consumers to this device.
> -		 */
> -		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>   		client = of_i2c_register_device(adap, rd->dn);
>   		if (IS_ERR(client)) {
>   			dev_err(&adap->dev, "failed to create client for '%pOF'\n",
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index 2eaaddcb0ec4..b5be7484fb36 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -225,7 +225,6 @@ static void __of_attach_node(struct device_node *np)
>   	np->sibling = np->parent->child;
>   	np->parent->child = np;
>   	of_node_clear_flag(np, OF_DETACHED);
> -	np->fwnode.flags |= FWNODE_FLAG_NOT_DEVICE;
>   
>   	raw_spin_unlock_irqrestore(&devtree_lock, flags);
>   
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index f77cb19973a5..ef9445ba168b 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -739,11 +739,6 @@ static int of_platform_notify(struct notifier_block *nb,
>   		if (of_node_check_flag(rd->dn, OF_POPULATED))
>   			return NOTIFY_OK;
>   
> -		/*
> -		 * Clear the flag before adding the device so that fw_devlink
> -		 * doesn't skip adding consumers to this device.
> -		 */
> -		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>   		/* pdev_parent may be NULL when no bus platform device */
>   		pdev_parent = of_find_device_by_node(parent);
>   		pdev = of_platform_device_create(rd->dn, NULL,
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index 2e0647a06890..b22944a207c9 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -4791,11 +4791,6 @@ static int of_spi_notify(struct notifier_block *nb, unsigned long action,
>   			return NOTIFY_OK;
>   		}
>   
> -		/*
> -		 * Clear the flag before adding the device so that fw_devlink
> -		 * doesn't skip adding consumers to this device.
> -		 */
> -		rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>   		spi = of_register_spi_device(ctlr, rd->dn);
>   		put_device(&ctlr->dev);
>   
Sorry, some of you will receive this message now for second time. First 
message was sent to older series of patches.
-

Hello,

Test system testing drivers for ROHM ICs bisected this commit to cause 
BD71847 drivers probe to not be called.

The devicetree blob overlay describing bd71847 enables I2C1 bus on 
BeagleBone Black aswell.

Probe is called when the driver is used with HW connected to I2C2 bus. 
I2C2 bus is enabled before overlaying devicetree blobs.


---- BD71847 Devicetree overlay source ----

/dts-v1/;
/plugin/;

/{ /* this is our device tree overlay root node */

     compatible = "ti,beaglebone", "ti,beaglebone-black";
     part-number = "BBB-I2C1";
      version = "00A0";

     fragment@0 {
         target = <&am33xx_pinmux>; // this is a link to an already 
defined node in the device tree, so that node is overlayed with our 
modification

         __overlay__ {
             i2c1_pins: pinmux_i2c1_pins {
                 pinctrl-single,pins = <
                       0x158 0x72 /* spi0_d1.i2c1_sda */
                       0x15C 0x72 /* spi0_cs0.i2c1_sdl */
                     >;
             };
         };
     };
....
....

     fragment@2 {
         target = <&i2c1>;

         __overlay__ {
             pinctrl-0 = <&i2c1_pins>;
             clock-frequency = <100000>;
             status = "okay";

             pmic: pmic@4b { /* the "test" defined as child of the i2c1 
bus */
                 compatible = "rohm,bd71847";
                 reg = <0x4b>;
                 ....
                 ....
}; /* root node end */

---- END OF BD71847 Devicetree overlay source ----

Reverting this patch from linux-next from last friday fixes the issue.

BR
Kalle Niemi

