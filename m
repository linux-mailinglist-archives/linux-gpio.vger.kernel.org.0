Return-Path: <linux-gpio+bounces-35530-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /wkzApUI7mnYqAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35530-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Apr 2026 14:44:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59565469D2C
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Apr 2026 14:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D2B7300822B
	for <lists+linux-gpio@lfdr.de>; Sun, 26 Apr 2026 12:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A96935F5E4;
	Sun, 26 Apr 2026 12:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ql74oy/c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010004.outbound.protection.outlook.com [52.101.61.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC9635836B;
	Sun, 26 Apr 2026 12:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777207439; cv=fail; b=T/8JXAMHze7i5sDQmnQajbIKFc3yFY/1eNKsKjUksYRI1VI0kcnv6kCkNmXVGZPeD7HkAqGb5GdrDHOsMk9NYIsi12ixT72vjzgTiUWZ3H2ocnGQKBxRqubpZCDufrZthQ7k1gwcs9LEIqUgwg0mEUvbMwMAv+cBBojbhc5jUDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777207439; c=relaxed/simple;
	bh=8pEsU3/gwyG3frlM1dEz1a4uNEyqB1icw6O9/XEs3fY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TOfKnCz87VbzPtfNe/WnONyGA44dju7vvNvM2Yj3ZpuKiretIbEq34VYUSbngrNOJ5sVugjk4IlaJJF8l1E4Hw3+oNUH3Oab4fYHDimbV4ZKWH0ijQ3hV4bkf7v+Iomr3drBzuXAdfMyeuLhB5ezBDaJP1vBFwO2caNJ0ZIt74o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ql74oy/c; arc=fail smtp.client-ip=52.101.61.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eb0943zRi5i9C2JsWzuNcwa5Hec6HkXO8YNGR7MGg0aiVlzVg+qwXj+Ez+NNSYxiysT6XpeI2gL32OI1zI3rXALZRWEk55GgU1Sr84ZIGG75/YhojTQ6VWauKMvYPlotsW9YFCHmE4IFIDg/GIbP/unDQruzsmxb/0m+oryNSnZV+p7FwzcGP3vdNshILJKahuw+UWFeHessNOkX8FkRKaV8FgzM5FzmznErGcLEHL6JTxcpv3ydhd5Pw7wcM20hHOyJSksagZ3aTtGkFt/uq5ev0A9cCK7YKyGClrVh4MlJx/i/I72wIQi3g8JRzHYvW58FhDWjmAGDdaO0L+HvNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQ0n0fJrEKl0xFgRtTFgfLrHcj+0Hn7NDuqhWWsMA0k=;
 b=RXGHgjahrvScqHHjo4BafjkWYb+M7d2YCeq7oeRUho27uUXHexJWTh6X4AMIMaXwdI/igIFQC3c7YP93JmqDRyU+NsS1arPy4692vBXcsL6rdEZ8soujOJ9iPdqw/awkjpna/UT/Y0Tf1q9/qqUKn0VJYhVUinxIVeEF2oHKCwRsnkMqYS6RxHh40deBuDAE2Yk6HrbCOu3tCFaZ4wXa/Q0a4e242vzGTdpYK2ybouMFNgeT4MtHxDii80wB2Fz+uQ73xRTbcCWnSwSB6sF2XrvAthQITwU2IPKI1cPfyOw9R0mWCmM/BtB/kpDbpC3CwmTmKfFz7sc53wul3XoKiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lunn.ch smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQ0n0fJrEKl0xFgRtTFgfLrHcj+0Hn7NDuqhWWsMA0k=;
 b=ql74oy/cXWI8NBU8toC5KYI9FSfMf/GGfjuPjUJScaGfj/OL+MV53ku7W6calg5gLNXmzJJQFLPw1SIEF5vsauX+cqZO1bhdxauF0kcACMuEFztMaDhLvfjAdrRr/dJTD3Kog8lsqez3/oYsVFHy2kH0Rcv+v88iE2FlXUljGTI=
Received: from SN1PR12CA0054.namprd12.prod.outlook.com (2603:10b6:802:20::25)
 by CO1PR10MB4721.namprd10.prod.outlook.com (2603:10b6:303:9b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.24; Sun, 26 Apr
 2026 12:43:50 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:802:20:cafe::33) by SN1PR12CA0054.outlook.office365.com
 (2603:10b6:802:20::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.25 via Frontend Transport; Sun,
 26 Apr 2026 12:43:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Sun, 26 Apr 2026 12:43:49 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 26 Apr
 2026 07:43:49 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 26 Apr
 2026 07:43:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 26 Apr 2026 07:43:49 -0500
Received: from [10.249.130.12] ([10.249.130.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63QCheUm1067338;
	Sun, 26 Apr 2026 07:43:41 -0500
Message-ID: <22fb5fac-2568-42be-a7e3-7e89d0017eb3@ti.com>
Date: Sun, 26 Apr 2026 18:13:39 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	"Sascha Hauer" <s.hauer@pengutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>, <linux-gpio@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"Peng Fan" <peng.fan@nxp.com>, <devicetree@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-imx@nxp.com>, "Bartosz
 Golaszewski" <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-4-shenwei.wang@nxp.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <20260422212849.1240591-4-shenwei.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|CO1PR10MB4721:EE_
X-MS-Office365-Filtering-Correlation-Id: 817aef20-e740-49c5-b0c5-08dea3917717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|18096099003|18002099003|56012099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	1JElhWHKQTUhr+CsXVhUnFF+SjsLaDz1Ky3oyqFDezor+4Ool/s3wvtmUvsXZS4ytYLgSQKBFnqvDsRpeYCmTb2rgb2Rfy7rKvdg0hsugSpiohd1mhaJBvPiZFE2xe5rKI5cF8OVV60Jt73WAIbisM26BEx2ZJOsDDMXt4euF23VxeL4y+qF3qr7nIZPJWqeGSq/ohaW2kZdlmJF6o/Xg5Az3tkF2BNqUcs8Xw/1wLp1qo56CrOjz51w0WrpNz8wCMTWdEqGitn8WQ/ubIGiLiHjoqWtljfsHjfUu0f36llKnGPxpLGkCuEo6Ee4bDU1Ygdcb1YkV+2Lx3X7bIfiMMgq1GTt4H9iXcemPFNIpg7Chc+SLgTdSFjvh7yOUBto8rIfLMB1X/gFANA2IpiuCoy7numrxpsobrPlL/HfcBd5zZtYF2jUdpvNRV8ovSU/52RUHTaM4WoYtZHKubLpip3d7TOL1vtC+gcbrG6Mcq1SFP7L3/t/hYMixk2znPl+gWDLsZPuSkzdSop5Hc7qzAnusybNbHoJ2pICfjHL9a/3TnuhdLIvRZy67ELktf+cmB2eE5l+rrAnSmJIDAohDVagkoI1xYgo4ZQOTz1bpsHAj4ZbyokbsUx3L6A22rHaUHiNhwKlb1tPCCnk8Uj1MgIZ8ZBcJIUkwNQ6aSrrlYr3uJmYMr8VOfQXxVrOvP+yCU9Gtfb/hhYxC+1bJRV7U0v2V0lxYkE7Qwmcj/c6f9T//W9U/2AZkXNPlHbOqFsBGFFmSFsKZzk+TtVjjTgvEB/oMlJsHWymO/d7JJbqDbXOAvZQWWSs0xz/19O+5i8o
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(18096099003)(18002099003)(56012099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aUR6xW2wUOX1ZBd7H85VOYVHwys/Rj7+KNIxMAi2Q+cWAGYtcG7V1Z4b1DVjlo1dFUVoq7/a2h/qsRxRHenwhumQwMAGNoI3cxA7aYRpP0fcvSWpWqAqEeZjHHlHbpGCrdr6iaasx4JFsz5TNYfxtr/O27krWBx4MPuO9E0iUIZgukG93JfPQraBsLyWdx2sOq7575blLXtvSdppSqEHMTxPVKfHOa9QHKoFmCdYp51MoHLMyxxuAi30PTQEdxbKWOYbVHnGjy4lhHr7uMb7GyFbToaRUYqpWtYgXTQW/jGBR6EkrDBORh+9GOAdLL1NbrW2qJaC3Zr7iVOIqjamxJ25QIo7EW1N7n3QrFweCRXzHwXO+ILqlzA1lLqoPMdy69aJeTGy1NhflOpcCKAboPT/EtAAaEQHMUyFyTSLlxFyXGZx03fktvF/TE6xv+3q
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2026 12:43:49.6042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 817aef20-e740-49c5-b0c5-08dea3917717
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4721
X-Rspamd-Queue-Id: 59565469D2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35530-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,bgdev.pl,lunn.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-padhi@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]

Hello Shenwei, Greetings,

On 4/23/2026 2:58 AM, Shenwei Wang wrote:
> On an AMP platform, the system may include two processors:


s/two/multiple

> 	- An MCU running an RTOS


s/An MCU/MCUs

> 	- An MPU running Linux
>
> These processors communicate via the RPMSG protocol.
> The driver implements the standard GPIO interface, allowing
> the Linux side to control GPIO controllers which reside in
> the remote processor via RPMSG protocol.
>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>   drivers/gpio/Kconfig      |  17 ++
>   drivers/gpio/Makefile     |   1 +
>   drivers/gpio/gpio-rpmsg.c | 573 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 591 insertions(+)
>   create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 020e51e30317..4ad299fe3c6f 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1917,6 +1917,23 @@ config GPIO_SODAVILLE
>   
>   endmenu
>   
> +menu "RPMSG GPIO drivers"
> +	depends on RPMSG
> +
> +config GPIO_RPMSG
> +	tristate "Generic RPMSG GPIO support"
> +	depends on OF && REMOTEPROC
> +	select GPIOLIB_IRQCHIP
> +	default REMOTEPROC
> +	help
> +	  Say yes here to support the generic GPIO functions over the RPMSG
> +	  bus. Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x, and
> +	  i.MX9x.
> +
> +	  If unsure, say N.
> +
> +endmenu
> +
>   menu "SPI GPIO expanders"
>   	depends on SPI_MASTER
>   
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index b267598b517d..ee75c0e65b8b 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -157,6 +157,7 @@ obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
>   obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
>   obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
>   obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
> +obj-$(CONFIG_GPIO_RPMSG)		+= gpio-rpmsg.o
>   obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
>   obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
>   obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
> diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
> new file mode 100644
> index 000000000000..993cde7af2fa
> --- /dev/null
> +++ b/drivers/gpio/gpio-rpmsg.c
> @@ -0,0 +1,573 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2026 NXP
> + *
> + * The driver exports a standard gpiochip interface to control
> + * the GPIO controllers via RPMSG on a remote processor.
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/remoteproc.h>
> +#include <linux/rpmsg.h>
> +#include <linux/virtio_gpio.h>
> +
> +#define MAX_PORT_PER_CHANNEL    10
> +#define GPIOS_PER_PORT_DEFAULT	32
> +#define RPMSG_TIMEOUT		1000
> +
> +/* GPIO RPMSG Type */
> +#define GPIO_RPMSG_SEND		0
> +#define GPIO_RPMSG_REPLY	1
> +#define GPIO_RPMSG_NOTIFY	2
> +
> +struct rpmsg_gpio_packet {
> +	u8 type;	/* Message type */
> +	u8 cmd;		/* Command code */
> +	u8 port_idx;
> +	u8 line;
> +	u8 val1;
> +	u8 val2;
> +};


Could you please document the fields in these structs (and the below
ones too)? From the code, it looks like while sending a message from
Linux to Firmware; val1 and val2 are used to describe the values to
set. Whereas while receiving a response, val1 represents a possible
error code, and val2 represents the actual message of get type
queries. If that is so, you might want to change the variable names to
be more descriptive and also use a union.

> +
> +struct rpmsg_gpio_line {
> +	u8 irq_shutdown;
> +	u8 irq_unmask;
> +	u8 irq_mask;
> +	u32 irq_wake_enable;
> +	u32 irq_type;
> +	struct rpmsg_gpio_packet msg;


We don't need to have this field. More info at [0].

> +};
> +
> +struct rpmsg_gpio_info {
> +	struct rpmsg_device *rpdev;
> +	struct rpmsg_gpio_packet *reply_msg;
> +	struct completion cmd_complete;
> +	struct mutex lock;
> +	void **port_store;
> +};
> +
> +struct rpmsg_gpio_port {
> +	struct gpio_chip gc;
> +	struct rpmsg_gpio_line lines[GPIOS_PER_PORT_DEFAULT];
> +	struct rpmsg_gpio_info info;
> +	u32 ngpios;
> +	u32 idx;
> +};
> +
> +/**
> + * struct rpmsg_drvdata - driver data per channel.
> + * @rproc_name: the name of the remote proc.
> + * @recv_pkt: a pointer to the received packet for protocol fix up.
> + * @channel_devices: an array of the devices related to the rpdev.
> + */
> +struct rpdev_drvdata {
> +	const char *rproc_name;
> +	void *recv_pkt;


I don't see any use of this field in the code?

> +	void *channel_devices[MAX_PORT_PER_CHANNEL];


So this is technically a rpmsg endpoint (struct rpmsg_endpoint) without
naming it "endpoint". Every rpmsg endpoint has a reference to its
parent rpmsg channel (struct rpmsg_device) which represents the same
information here. So we should use the framework standard here.

This also allows for dynamic creation and deletion of ports too! (if/when
the firmware supports it)

Which means at port init time, we should make a call to
rpmsg_create_ept() for each port tying the same callback
rpmsg_gpio_channel_callback(). And based on the 'u32 src', we could
identify the appropriate gpio port in the callback.

> +};
> +
> +static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port,
> +				   struct rpmsg_gpio_packet *msg)
> +{
> +	struct rpmsg_gpio_info *info = &port->info;
> +	int ret;
> +
> +	reinit_completion(&info->cmd_complete);
> +
> +	ret = rpmsg_send(info->rpdev->ept, msg, sizeof(*msg));
> +	if (ret) {
> +		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = wait_for_completion_timeout(&info->cmd_complete,
> +					  msecs_to_jiffies(RPMSG_TIMEOUT));
> +	if (ret == 0) {
> +		dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (info->reply_msg->val1) {
> +		dev_err(&info->rpdev->dev, "remote core replies an error: %d!\n",
> +			info->reply_msg->val1);
> +		return -EINVAL;
> +	}
> +
> +	/* copy the reply message */
> +	memcpy(&port->lines[info->reply_msg->line].msg,
> +	       info->reply_msg, sizeof(*info->reply_msg));


The rpmsg_gpio_port structure already holds a pointer to the reply
message via ->info. We do not need this extra copy. More info at [0].

> +
> +	return 0;
> +}
> +
> +static struct rpmsg_gpio_packet *
> +rpmsg_gpio_msg_init_common(struct rpmsg_gpio_port *port, unsigned int line, u8 cmd)
> +{
> +	struct rpmsg_gpio_packet *msg = &port->lines[line].msg;


[0]: We really don't need to carry the stale message in the line
structure everytime. While sending requests, we should just request a
buffer from kzalloc and use it everytime. As far as response is
concerned, we are holding a lock everytime we are sending any message,
so we are sure the pointer in info->reply_msg would have the response to
only one request that was sent.

> +
> +	memset(msg, 0, sizeof(*msg));


This also means we can get rid of this memset.

> +	msg->type = GPIO_RPMSG_SEND;
> +	msg->cmd = cmd;
> +	msg->port_idx = port->idx;
> +	msg->line = line;
> +
> +	return msg;
> +}
> +
> +static int rpmsg_gpio_get(struct gpio_chip *gc, unsigned int line)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct rpmsg_gpio_packet *msg;
> +	int ret;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_GET_VALUE);
> +
> +	ret = rpmsg_gpio_send_message(port, msg);
> +	if (!ret)
> +		ret = !!port->lines[line].msg.val2;


Which means here & everywhere else, we could just read the reply message
from !!port->info->reply_msg->val2

> +
> +	return ret;
> +}
> +
> +static int rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned int line)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct rpmsg_gpio_packet *msg;
> +	int ret;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_GET_DIRECTION);
> +
> +	ret = rpmsg_gpio_send_message(port, msg);
> +	if (ret)
> +		return ret;
> +
> +	switch (port->lines[line].msg.val2) {
> +	case VIRTIO_GPIO_DIRECTION_IN:
> +		return GPIO_LINE_DIRECTION_IN;
> +	case VIRTIO_GPIO_DIRECTION_OUT:
> +		return GPIO_LINE_DIRECTION_OUT;
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int rpmsg_gpio_direction_input(struct gpio_chip *gc, unsigned int line)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct rpmsg_gpio_packet *msg;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_SET_DIRECTION);
> +	msg->val1 = VIRTIO_GPIO_DIRECTION_IN;
> +
> +	return rpmsg_gpio_send_message(port, msg);
> +}
> +
> +static int rpmsg_gpio_set(struct gpio_chip *gc, unsigned int line, int val)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct rpmsg_gpio_packet *msg;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_SET_VALUE);
> +	msg->val1 = val;
> +
> +	return rpmsg_gpio_send_message(port, msg);
> +}
> +
> +static int rpmsg_gpio_direction_output(struct gpio_chip *gc, unsigned int line, int val)
> +{
> +	struct rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct rpmsg_gpio_packet *msg;
> +	int ret;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_SET_DIRECTION);
> +	msg->val1 = VIRTIO_GPIO_DIRECTION_OUT;
> +
> +	ret = rpmsg_gpio_send_message(port, msg);
> +	if (ret)
> +		return ret;
> +
> +	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_SET_VALUE);
> +	msg->val1 = val;
> +
> +	return rpmsg_gpio_send_message(port, msg);
> +}
> +
> +static int gpio_rpmsg_irq_set_type(struct irq_data *d, u32 type)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_RISING;
> +		irq_set_handler_locked(d, handle_simple_irq);
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_FALLING;
> +		irq_set_handler_locked(d, handle_simple_irq);
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		type = VIRTIO_GPIO_IRQ_TYPE_EDGE_BOTH;
> +		irq_set_handler_locked(d, handle_simple_irq);
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW;
> +		irq_set_handler_locked(d, handle_level_irq);
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		type = VIRTIO_GPIO_IRQ_TYPE_LEVEL_HIGH;
> +		irq_set_handler_locked(d, handle_level_irq);
> +		break;
> +	default:
> +		dev_err(&port->info.rpdev->dev, "unsupported irq type: %u\n", type);
> +		return -EINVAL;
> +	}
> +
> +	port->lines[line].irq_type = type;
> +
> +	return 0;
> +}
> +
> +static int gpio_rpmsg_irq_set_wake(struct irq_data *d, u32 enable)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +
> +	port->lines[line].irq_wake_enable = enable;
> +
> +	return 0;
> +}
> +
> +/*
> + * This unmask/mask function is invoked in two situations:
> + *   - when an interrupt is being set up, and
> + *   - after an interrupt has occurred.
> + *
> + * The GPIO driver does not access hardware registers directly.
> + * Instead, it caches all relevant information locally, and then sends
> + * the accumulated state to the remote system at this stage.


It is actually sent at the .bus_sync_unlock() stage.

> + */
> +static void gpio_rpmsg_unmask_irq(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +
> +	port->lines[line].irq_unmask = 1;
> +}
> +
> +static void gpio_rpmsg_mask_irq(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +
> +	/*
> +	 * When an interrupt occurs, the remote system masks the interrupt
> +	 * and then sends a notification to Linux. After Linux processes
> +	 * that notification, it sends an RPMsg command back to the remote
> +	 * system to unmask the interrupt again.
> +	 */
> +	port->lines[line].irq_mask = 1;
> +}
> +
> +static void gpio_rpmsg_irq_shutdown(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +
> +	port->lines[line].irq_shutdown = 1;
> +}
> +
> +static void gpio_rpmsg_irq_bus_lock(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +
> +	mutex_lock(&port->info.lock);
> +}
> +
> +static void gpio_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	struct rpmsg_gpio_packet *msg;
> +	u32 line = d->hwirq;
> +
> +	/*
> +	 * For mask irq, do nothing here.
> +	 * The remote system will mask interrupt after an interrupt occurs,
> +	 * and then send a notification to Linux system. After Linux system
> +	 * handles the notification, it sends an rpmsg back to the remote
> +	 * system to unmask this interrupt again.
> +	 */
> +	if (port->lines[line].irq_mask && !port->lines[line].irq_unmask) {
> +		port->lines[line].irq_mask = 0;
> +		mutex_unlock(&port->info.lock);
> +		return;
> +	}
> +
> +	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_IRQ_TYPE);
> +
> +	if (port->lines[line].irq_shutdown) {
> +		port->lines[line].irq_shutdown = 0;
> +		msg->val1 = VIRTIO_GPIO_IRQ_TYPE_NONE;
> +		msg->val2 = 0;
> +	} else {
> +		msg->val1 = port->lines[line].irq_type;
> +
> +		if (port->lines[line].irq_unmask) {
> +			msg->val2 = 0;
> +			port->lines[line].irq_unmask = 0;
> +		} else /* irq set wake */
> +			msg->val2 = port->lines[line].irq_wake_enable;
> +	}
> +
> +	rpmsg_gpio_send_message(port, msg);
> +	mutex_unlock(&port->info.lock);
> +}
> +
> +static const struct irq_chip gpio_rpmsg_irq_chip = {
> +	.irq_mask = gpio_rpmsg_mask_irq,
> +	.irq_unmask = gpio_rpmsg_unmask_irq,
> +	.irq_set_wake = gpio_rpmsg_irq_set_wake,
> +	.irq_set_type = gpio_rpmsg_irq_set_type,
> +	.irq_shutdown = gpio_rpmsg_irq_shutdown,
> +	.irq_bus_lock = gpio_rpmsg_irq_bus_lock,
> +	.irq_bus_sync_unlock = gpio_rpmsg_irq_bus_sync_unlock,
> +	.flags = IRQCHIP_IMMUTABLE,
> +};
> +
> +static void rpmsg_gpio_remove_action(void *data)
> +{
> +	struct rpmsg_gpio_port *port = data;
> +
> +	port->info.port_store[port->idx] = NULL;
> +}
> +
> +static int rpmsg_gpiochip_register(struct rpmsg_device *rpdev, struct device_node *np)
> +{
> +	struct rpdev_drvdata *drvdata = dev_get_drvdata(&rpdev->dev);
> +	struct rpmsg_gpio_port *port;
> +	struct gpio_irq_chip *girq;
> +	struct gpio_chip *gc;
> +	int ret;
> +
> +	port = devm_kzalloc(&rpdev->dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32(np, "reg", &port->idx);
> +	if (ret)
> +		return ret;
> +
> +	if (port->idx >= MAX_PORT_PER_CHANNEL)
> +		return -EINVAL;
> +
> +	ret = devm_mutex_init(&rpdev->dev, &port->info.lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_property_read_u32(np, "ngpios", &port->ngpios);
> +	if (ret || port->ngpios > GPIOS_PER_PORT_DEFAULT)
> +		port->ngpios = GPIOS_PER_PORT_DEFAULT;
> +
> +	port->info.reply_msg = devm_kzalloc(&rpdev->dev,
> +					    sizeof(*port->info.reply_msg),
> +					    GFP_KERNEL);
> +	if (!port->info.reply_msg)
> +		return -ENOMEM;
> +
> +	init_completion(&port->info.cmd_complete);
> +	port->info.port_store = drvdata->channel_devices;
> +	port->info.port_store[port->idx] = port;
> +	port->info.rpdev = rpdev;
> +
> +	gc = &port->gc;
> +	gc->owner = THIS_MODULE;
> +	gc->parent = &rpdev->dev;
> +	gc->fwnode = of_fwnode_handle(np);
> +	gc->ngpio = port->ngpios;
> +	gc->base = -1;
> +	gc->label = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
> +				   drvdata->rproc_name, port->idx);
> +
> +	gc->direction_input = rpmsg_gpio_direction_input;
> +	gc->direction_output = rpmsg_gpio_direction_output;
> +	gc->get_direction = rpmsg_gpio_get_direction;
> +	gc->get = rpmsg_gpio_get;
> +	gc->set = rpmsg_gpio_set;
> +
> +	girq = &gc->irq;
> +	gpio_irq_chip_set_chip(girq, &gpio_rpmsg_irq_chip);
> +	girq->parent_handler = NULL;
> +	girq->num_parents = 0;
> +	girq->parents = NULL;
> +	girq->chip->name = devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
> +					  drvdata->rproc_name, port->idx);


We could just re-use gc->label here...

> +
> +	ret = devm_add_action_or_reset(&rpdev->dev, rpmsg_gpio_remove_action, port);
> +	if (ret)
> +		return ret;
> +
> +	return devm_gpiochip_add_data(&rpdev->dev, gc, port);
> +}
> +
> +static const char *rpmsg_get_rproc_node_name(struct rpmsg_device *rpdev)
> +{
> +	const char *name = NULL;
> +	struct device_node *np;
> +	struct rproc *rproc;
> +
> +	rproc = rproc_get_by_child(&rpdev->dev);
> +	if (!rproc)
> +		return NULL;
> +
> +	np = of_node_get(rproc->dev.of_node);
> +	if (!np && rproc->dev.parent)
> +		np = of_node_get(rproc->dev.parent->of_node);
> +
> +	if (np) {
> +		name = devm_kstrdup(&rpdev->dev, np->name, GFP_KERNEL);
> +		of_node_put(np);
> +	}
> +
> +	return name;
> +}
> +
> +static struct device_node *
> +rpmsg_get_channel_ofnode(struct rpmsg_device *rpdev, char *chan_name)
> +{
> +	struct device_node *np_chan = NULL, *np;
> +	struct rproc *rproc;
> +
> +	rproc = rproc_get_by_child(&rpdev->dev);
> +	if (!rproc)
> +		return NULL;
> +
> +	np = of_node_get(rproc->dev.of_node);
> +	if (!np && rproc->dev.parent)
> +		np = of_node_get(rproc->dev.parent->of_node);
> +
> +	/* The of_node_put() is performed by of_find_node_by_name(). */
> +	if (np)
> +		np_chan = of_find_node_by_name(np, chan_name);
> +
> +	return np_chan;
> +}
> +
> +static int rpmsg_gpio_channel_callback(struct rpmsg_device *rpdev, void *data,
> +				       int len, void *priv, u32 src)
> +{
> +	struct rpmsg_gpio_packet *msg = data;
> +	struct rpmsg_gpio_port *port = NULL;
> +	struct rpdev_drvdata *drvdata;
> +
> +	drvdata = dev_get_drvdata(&rpdev->dev);
> +	if (!msg || !drvdata)
> +		return -EINVAL;
> +
> +	if (msg->port_idx < MAX_PORT_PER_CHANNEL)
> +		port = drvdata->channel_devices[msg->port_idx];
> +
> +	if (!port || msg->line >= port->ngpios) {
> +		dev_err(&rpdev->dev, "wrong port index or line number. port:%d line:%d\n",
> +			msg->port_idx, msg->line);
> +		return -EINVAL;
> +	}
> +
> +	if (msg->type == GPIO_RPMSG_REPLY) {
> +		*port->info.reply_msg = *msg;
> +		complete(&port->info.cmd_complete);
> +	} else if (msg->type == GPIO_RPMSG_NOTIFY) {
> +		generic_handle_domain_irq_safe(port->gc.irq.domain, msg->line);
> +	} else {
> +		dev_err(&rpdev->dev, "wrong command type (0x%x)\n", msg->type);
> +	}
> +
> +	return 0;
> +}
> +
> +static int rpmsg_gpio_channel_probe(struct rpmsg_device *rpdev)
> +{
> +	struct device *dev = &rpdev->dev;
> +	struct rpdev_drvdata *drvdata;
> +	struct device_node *np;
> +	int ret = -ENODEV;
> +
> +	if (!dev->of_node) {
> +		np = rpmsg_get_channel_ofnode(rpdev, rpdev->id.name);
> +		if (np) {
> +			dev->of_node = np;
> +			set_primary_fwnode(dev, of_fwnode_handle(np));
> +		}
> +		return -EPROBE_DEFER;


I know this was asked in the v10 version also. But I don't think the
answer is sufficient. Should we not continue the intialization of
drvdata etc if np != 0? Why return a deferred probe, and let the kernel
come back to it again to do the same stuff with extra latency?

We could just do:
if (!np) return -EPROBE_DEFER;
else {everything_else};

> +	}
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->rproc_name = rpmsg_get_rproc_node_name(rpdev);
> +	dev_set_drvdata(dev, drvdata);
> +
> +	for_each_child_of_node_scoped(dev->of_node, child) {
> +		if (!of_device_is_available(child))
> +			continue;
> +
> +		if (!of_match_node(dev->driver->of_match_table, child))
> +			continue;
> +
> +		ret = rpmsg_gpiochip_register(rpdev, child);
> +		if (ret < 0)
> +			break;


Why break here? If one port initialization fails, it shouldn't impact
the other port right? We should just log this and store the
appropriate value in ret.

Thanks for your time,
Beleswar

> +	}
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id rpmsg_gpio_dt_ids[] = {
> +	{ .compatible = "rpmsg-gpio" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct rpmsg_device_id rpmsg_gpio_channel_id_table[] = {
> +	{ .name = "rpmsg-io" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(rpmsg, rpmsg_gpio_channel_id_table);
> +
> +static struct rpmsg_driver rpmsg_gpio_channel_client = {
> +	.callback	= rpmsg_gpio_channel_callback,
> +	.id_table	= rpmsg_gpio_channel_id_table,
> +	.probe		= rpmsg_gpio_channel_probe,
> +	.drv		= {
> +		.name	= KBUILD_MODNAME,
> +		.of_match_table = rpmsg_gpio_dt_ids,
> +	},
> +};
> +module_rpmsg_driver(rpmsg_gpio_channel_client);
> +
> +MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
> +MODULE_DESCRIPTION("generic rpmsg gpio driver");
> +MODULE_LICENSE("GPL");

