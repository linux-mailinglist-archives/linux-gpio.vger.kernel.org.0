Return-Path: <linux-gpio+bounces-39263-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hD9QKZGARGq9vwoAu9opvQ
	(envelope-from <linux-gpio+bounces-39263-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 04:50:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 076EF6E94F2
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 04:50:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QHHTjfD6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39263-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39263-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 240483034B0C
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 02:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D973B3655C1;
	Wed,  1 Jul 2026 02:50:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3298364950
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 02:50:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782874251; cv=none; b=gvXW5cujJQB4MoE8dlF3A+LR+m8w+QSgAvk4sOUfQ6kfNo362xktnN/+dz6hyXZrv0YavgNwmK+G5Bpk9Tozt8cupK2YzLFTEIdNlyBDy8IAtwNB1MBwMX12/4fGTq4N/1In7J7noK9C3tDYHVwbeGZTGRX6Qow0kJiGsTWxwVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782874251; c=relaxed/simple;
	bh=BOoOFbQ2TAe/o7TeRXrDx828tMApqcQXYvNsT8oBmuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUrrcV2qIp8KuBf5RY3bVCQO4pJHQjsI3siV5VNdmvkVXaxGckDCTIPOQhtrXO8xNRdlpjCUovdK26K4Oe1zHOoKZIeXcGMjtyU/yXVK0/eUXuXEoOdwO3wYHdhVOxxoszjm2cV4f/vOm9QiIRyrxIHJ9MD1q9WsiIg4vF8sujc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHHTjfD6; arc=none smtp.client-ip=209.85.216.42
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37f7a5a217fso113638a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 19:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782874248; x=1783479048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PJTpC+CjT6V4l0jkY1XwpDUfcQUmvUveAir1k/ZxLM4=;
        b=QHHTjfD6MCnlTCGpB8oVRO2XD66C9gSRqKDPU/WYCUTV2ZjUlAXJCnyDcZ0shh7RWz
         SH7JJ4LncoQRyv6NlrWVl24ULK5qLS4SI4iwbhlA2QfINQC8mjRwjAHkwaogd9RZ/slZ
         QtHVtmSgHCGRxREXCK+nFb7qR8vabR+0bNIsgnHnvkVFhn5RZ6Phhso4ZlRgpiWn8S0k
         VZzMFYqc8LeD1EXsXZOSLhuFgHiHAuxj61gmdsoEutv+iSd7NDUs0fFlSm6huGFJ0taT
         8N7Ecnjn0GsC+fVYOrpb8A98CZp7d9cmy2wQt9wuaYS5qZi80SIsmhAYiva6bB7fMaJL
         GdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782874248; x=1783479048;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PJTpC+CjT6V4l0jkY1XwpDUfcQUmvUveAir1k/ZxLM4=;
        b=R6denlVpFkJ/LeV9kQTGYiX3dq8vFPRjRe9jFGf5Okn0IBjffLE3GNKUOQyko0L/Ce
         dIwLSB1MaWQVwEBkLRu5SkjPxTWZpQWf6k3czxpl4Xf6QZvAyKQbcleMEASIveKlk3n+
         q4Wg6PGFE/Yjf+DvESIrq63GAE1DmqoR2ufotVZmwjQOvQouJN+3RyAGe+WvE+ZoWFwu
         7A8o0ZhNPHF4HnRzYTlPiEkWzPoaiZLFRy5I1Tn7WF5Ve24qnlJhcjQEbqN3dn5k6rs9
         ibv/iqiLpWAegsA2ugWVkKkYVFggrEjwdjZHNg5YtkZ4pCtVUCs7f7ZEl18e8le6EZM0
         HUxA==
X-Forwarded-Encrypted: i=1; AHgh+RqYWuW434G07bpZ9imSZUnaoZaFmKcm7HL4k1ekaR0+g/sakkC1P3AH0T/8G0zjeqrMEbJddmubJX2x@vger.kernel.org
X-Gm-Message-State: AOJu0YwGsnlSkbCFhD6tJBGwjvEKFDAXR/EVQ/Zs2K258b7ebRV2hSl2
	n4YumSrmE94KNA9iubM/NtRYJwFsJzsI+XHKmZV2j3MdaUICMu6UX29e
X-Gm-Gg: AfdE7cl9RhPefzjWbzB3mI2H8xSFsgW1TitWEb+hfIiM39ugkegkkRxDZZhxIcP5NrN
	A3l62YswTxkctCC468i5yRK4u6Ea/hj+WZlDMAG7s3SJjgU3y4BTVKzrL6UAEbgUZsowEA8D/s1
	MQbQznlUFJ5q++qNeeLQnzUZlAIIxvUB9ktEOBVdrJQfiFJldOnleZdWbPIKA6SnIZ4whF54bCk
	fLZndRQKsWqAclbONj7F1PlWEWE3uKQo93peszIJpmsvooOFWyYFy3BkAd3x0p9qT9O8CWh2InR
	MIKGu5bpU3jtnZgAD67YSStCd3CXztkr6RxMeeBHWnVEfrM/NweKThzgSz5o1q1xhTULARskLST
	W1rJkun3jd6mPy4ZrsIfcS9crXZ7PN/+/nS1EMoTEb1Eo0MU7tLgjj8ifLevY5ZxGdeRQhfrrfN
	xx+dKE+MeBKvAlwq0BDPVtihzzDBzO1GTl3YmH1xsm8I7oqTyLtEnlrLglh5TxLQ==
X-Received: by 2002:a17:90b:57cb:b0:37f:a915:1c29 with SMTP id 98e67ed59e1d1-38052726b73mr4731151a91.19.1782874247947;
        Tue, 30 Jun 2026 19:50:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3809644a387sm848448a91.13.2026.06.30.19.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 19:50:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <91a9aa8c-2e7a-494d-86f4-26982676a952@roeck-us.net>
Date: Tue, 30 Jun 2026 19:50:45 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] watchdog: aaeon: Add watchdog driver for SRG-IMX8P
 MCU
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20260630-dev-b4-aaeon-mcu-driver-v6-0-d66b5fcbd2f0@bootlin.com>
 <20260630-dev-b4-aaeon-mcu-driver-v6-5-d66b5fcbd2f0@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260630-dev-b4-aaeon-mcu-driver-v6-5-d66b5fcbd2f0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thomas.perrot@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jeremie.dautheribes@bootlin.com,m:wim@linux-watchdog.org,m:lee@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-watchdog@vger.kernel.org,m:thomas.petazzoni@bootlin.com,m:miquel.raynal@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,pengutronix.de,gmail.com,linux-watchdog.org];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39263-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,roeck-us.net:email,roeck-us.net:mid,roeck-us.net:from_mime,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 076EF6E94F2

On 6/30/26 05:51, Thomas Perrot (Schneider Electric) wrote:
> Add watchdog driver for the Aaeon SRG-IMX8P embedded controller.
> This driver provides system monitoring and recovery capabilities
> through the MCU's watchdog timer.
> 
> The watchdog supports start, stop, and ping operations with a maximum
> hardware heartbeat of 25 seconds and a default timeout of 240 seconds.
> The software timeout can be changed via the WDIOC_SETTIMEOUT ioctl,
> the DT timeout-sec property, or the watchdog_timeout kernel boot
> parameter.
> 
> Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
> Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   MAINTAINERS                      |   1 +
>   drivers/watchdog/Kconfig         |  10 +++
>   drivers/watchdog/Makefile        |   1 +
>   drivers/watchdog/aaeon_mcu_wdt.c | 144 +++++++++++++++++++++++++++++++++++++++
>   4 files changed, 156 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2538f8c4bc14..7b92af42c9fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -193,6 +193,7 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
>   F:	drivers/gpio/gpio-aaeon-mcu.c
>   F:	drivers/mfd/aaeon-mcu.c
> +F:	drivers/watchdog/aaeon_mcu_wdt.c
>   F:	include/linux/mfd/aaeon-mcu.h
>   
>   AAEON UPBOARD FPGA MFD DRIVER
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index d3b9df7d466b..f67a0b453316 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -420,6 +420,16 @@ config SL28CPLD_WATCHDOG
>   
>   # ARM Architecture
>   
> +config AAEON_MCU_WATCHDOG
> +	tristate "Aaeon MCU Watchdog"
> +	depends on MFD_AAEON_MCU
> +	select WATCHDOG_CORE
> +	help
> +	  Select this option to enable watchdog timer support for the Aaeon
> +	  SRG-IMX8P onboard microcontroller (MCU). This driver provides
> +	  watchdog functionality through the MCU, allowing system monitoring
> +	  and automatic recovery from system hangs.
> +
>   config AIROHA_WATCHDOG
>   	tristate "Airoha EN7581 Watchdog"
>   	depends on ARCH_AIROHA || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index ba52099b1253..2deec425d3ea 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -37,6 +37,7 @@ obj-$(CONFIG_USBPCWATCHDOG) += pcwd_usb.o
>   # ALPHA Architecture
>   
>   # ARM Architecture
> +obj-$(CONFIG_AAEON_MCU_WATCHDOG) += aaeon_mcu_wdt.o
>   obj-$(CONFIG_ARM_SP805_WATCHDOG) += sp805_wdt.o
>   obj-$(CONFIG_ARM_SBSA_WATCHDOG) += sbsa_gwdt.o
>   obj-$(CONFIG_ARMADA_37XX_WATCHDOG) += armada_37xx_wdt.o
> diff --git a/drivers/watchdog/aaeon_mcu_wdt.c b/drivers/watchdog/aaeon_mcu_wdt.c
> new file mode 100644
> index 000000000000..347ee8269bfd
> --- /dev/null
> +++ b/drivers/watchdog/aaeon_mcu_wdt.c
> @@ -0,0 +1,144 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Aaeon MCU Watchdog driver
> + *
> + * Copyright (C) 2026 Bootlin
> + * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#include <linux/mfd/aaeon-mcu.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/watchdog.h>
> +
> +#define AAEON_MCU_PING_WDT	0x73
> +
> +#define AAEON_MCU_WDT_TIMEOUT         240
> +#define AAEON_MCU_WDT_HEARTBEAT_MS    25000
> +#define AAEON_MCU_WDT_MIN_TIMEOUT     1
> +#define AAEON_MCU_WDT_MAX_TIMEOUT     3600
> +
> +static unsigned int timeout;
> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
> +
> +struct aaeon_mcu_wdt {
> +	struct watchdog_device wdt;
> +	struct regmap *regmap;
> +};
> +
> +static int aaeon_mcu_wdt_cmd(struct aaeon_mcu_wdt *data, u8 opcode, u8 arg)
> +{
> +	return regmap_write(data->regmap, AAEON_MCU_REG(opcode, arg), 0);
> +}
> +
> +static int aaeon_mcu_wdt_start(struct watchdog_device *wdt)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +
> +	return aaeon_mcu_wdt_cmd(data, AAEON_MCU_CONTROL_WDT_OPCODE, 0x01);
> +}
> +
> +static int aaeon_mcu_wdt_status(struct watchdog_device *wdt, bool *enabled)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +	unsigned int rsp;
> +	int ret;
> +
> +	ret = regmap_read(data->regmap,
> +			  AAEON_MCU_REG(AAEON_MCU_CONTROL_WDT_OPCODE, 0x02),
> +			  &rsp);
> +	if (ret)
> +		return ret;
> +
> +	*enabled = rsp == 0x01;
> +	return 0;
> +}
> +
> +static int aaeon_mcu_wdt_stop(struct watchdog_device *wdt)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +
> +	return aaeon_mcu_wdt_cmd(data, AAEON_MCU_CONTROL_WDT_OPCODE, 0x00);
> +}
> +
> +static int aaeon_mcu_wdt_ping(struct watchdog_device *wdt)
> +{
> +	struct aaeon_mcu_wdt *data = watchdog_get_drvdata(wdt);
> +
> +	return aaeon_mcu_wdt_cmd(data, AAEON_MCU_PING_WDT, 0x00);
> +}
> +
> +static const struct watchdog_info aaeon_mcu_wdt_info = {
> +	.identity	= "Aaeon MCU Watchdog",
> +	.options	= WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT
> +};
> +
> +static const struct watchdog_ops aaeon_mcu_wdt_ops = {
> +	.owner		= THIS_MODULE,
> +	.start		= aaeon_mcu_wdt_start,
> +	.stop		= aaeon_mcu_wdt_stop,
> +	.ping		= aaeon_mcu_wdt_ping,
> +};
> +
> +static int aaeon_mcu_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct watchdog_device *wdt;
> +	struct aaeon_mcu_wdt *data;
> +	bool enabled;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!data->regmap)
> +		return -ENODEV;
> +
> +	wdt = &data->wdt;
> +	wdt->parent = dev;
> +	wdt->info = &aaeon_mcu_wdt_info;
> +	wdt->ops = &aaeon_mcu_wdt_ops;
> +	/*
> +	 * The MCU firmware has a fixed hardware timeout of 25 seconds that
> +	 * cannot be changed. The watchdog core handles automatic pinging to
> +	 * support software timeouts longer than the hardware limit. The default
> +	 * software timeout of 240 seconds can be overridden via the DT
> +	 * timeout-sec property or the watchdog_timeout kernel boot parameter.
> +	 */
> +	wdt->timeout = AAEON_MCU_WDT_TIMEOUT;
> +	wdt->min_timeout = AAEON_MCU_WDT_MIN_TIMEOUT;
> +	wdt->max_timeout = AAEON_MCU_WDT_MAX_TIMEOUT;
> +	wdt->max_hw_heartbeat_ms = AAEON_MCU_WDT_HEARTBEAT_MS;

Either max_timeout or max_hw_heartbeat_ms should be set, but not both.
 From the include file:

  * @max_timeout:The watchdog devices maximum timeout value (in seconds)
  *              as configurable from user space. Only relevant if
  *              max_hw_heartbeat_ms is not provided.

In other words, max_timeout is ignored by the watchdog core.

> +	watchdog_init_timeout(wdt, timeout, dev);

As pointed out by Sashiko, this will not initialize the timeout from
devicetree. You'll need to either adjust the code or the comment above.

Thanks,
Guenter

> +
> +	watchdog_set_drvdata(wdt, data);
> +	watchdog_stop_on_reboot(wdt);
> +
> +	ret = aaeon_mcu_wdt_status(wdt, &enabled);
> +	if (ret)
> +		return ret;
> +
> +	if (enabled)
> +		set_bit(WDOG_HW_RUNNING, &wdt->status);
> +
> +	return devm_watchdog_register_device(dev, wdt);
> +}
> +
> +static struct platform_driver aaeon_mcu_wdt_driver = {
> +	.driver		= {
> +		.name	= "aaeon-mcu-wdt",
> +	},
> +	.probe		= aaeon_mcu_wdt_probe,
> +};
> +
> +module_platform_driver(aaeon_mcu_wdt_driver);
> +
> +MODULE_ALIAS("platform:aaeon-mcu-wdt");
> +MODULE_DESCRIPTION("Aaeon MCU Watchdog Driver");
> +MODULE_AUTHOR("Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>");
> +MODULE_LICENSE("GPL");
> 


