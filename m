Return-Path: <linux-gpio+bounces-33597-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B9+FGIXuWmOpgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33597-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 09:57:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 109D22A615C
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 09:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9AAD7304D670
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 08:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5747139EF30;
	Tue, 17 Mar 2026 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="UeZEv+16"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86D339EF15;
	Tue, 17 Mar 2026 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737818; cv=fail; b=isuVUG62VeyeG6DuW+CAWE2LSmksHHAJ6z5dKkitJqZVL2fgWeI0UhK2WGWGw5AT3dDNfk5PZxii6KNrIwct9hSFdPGayJ4nEcZP9aoXq0yo3TWN8Uh9IepRLb1P6aK+T8yHWkwlxiQj9Yc5KiOrqYXCoJi1cDv6Ca6F6A7m64A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737818; c=relaxed/simple;
	bh=pfLDpnE4jL8hOF23GI+hQmJTsw01tm8TiPSnX5lj9to=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZfYxalXZqh68T8JlxcuK0zjjpouz0YM6ySwLiPK3WJoJcX2eUi+GaNqiWnwPWhWR9egM9UQCDtzOZw4hZW0Yh/QZXR7/z4l8uJobOyfqh/2Y4dHTajNRg+u4sK76NvYM51iNopbOQ9r7zet5N/ELAF4zVE/76aMQD6UZov0DWHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=UeZEv+16; arc=fail smtp.client-ip=52.101.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agoVxf7+taof4sBaijWtO+qYRAM8Z2PSeljQV67PZVjPHWvXD7T0bJa/t7VoDOeAH3QsGg+tgZHEBzU0yx3s25OfWk61Xa3Z4guoSLxZQVcb84eP3K9To3cZO3btqX/TNIWwPpjLJ+5COKQyO2Ag1LO5DtUMKWvE6xCYfRbuImfWAdykQrNBkVo0572Uiuh8R0yxD+q/DkPIrmjQJDd1rje372rk/tidpj5r57Db55sJQvIALLhYOTp1QjUy4cdcQCYBEEjTw2YFpLHV8lnloPDrV6OG1r6qjR+G0hn/L7v3nF+pPkRlV2t5qOG5ihO7k9rOmJ1Tlii5QyCQwGC+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPVPUOIv2jjNfOPsA+lwbNNdPVr5Iokqr58110uMtms=;
 b=XnU7+9BYmV7vKmDCSAsaR8l+pz6FRE1mfzhFC1Rqp167SfBCcHSGdWHEJ/AJY8p3sLSvENFh1sB5xnjR8psf5by96Omt+taSrLNeGTIwXC5g6cXtayAH6iH/mQ9BTbtiVR0qJ5GF8DStT0XEQQ3WxA70L6MrIhUoSPzHlOmxLDpOrEqZXr6JrmvEXBx8NJ6gr4tvOaYB4vAn35e/gbgKrgs+pdOPrkPVqk7/thSUi6uPDN6fwRwj1sEUj/pQhlMRVVjfy+vJOJWxZ9gbGDySG2ryEqx00Hi133fz5pBA5RfSQcWjuNtn0o50w1MBIhYR5dhDQydvCN1lG/C3H4Sqsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nxp.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPVPUOIv2jjNfOPsA+lwbNNdPVr5Iokqr58110uMtms=;
 b=UeZEv+16XsnXsxrW/aFRlzamHSjXQa0w5zUibkQjdXl4UPf2h+0ErUSFo/9VHTh0ZVqC345r7ci7n6PvNn4CZVvl7FLegqBX0yZBgH3Tek6LKkiFI4htmmpfxU3oUnLj3uj6TBiECYNmQiiT/VG2v3MMJ6JnkrmuGrd7yoEreSU85ZXaZwtLPg5a7UfGkP7tnQtE6fk3/nwWM3lNeQ0PzUrrd5G83ukKmSVz30LoFg3h+Gy5Q3JnnKRy8RLyXRU5GU6zm/Jtwe6TdARHssv8b+Ryo1tsXB+FHZUof6yQm1rzHd/Ie28U8KTX3r3dwIaSmyqSDxbiQkIRDaNLx4oD5w==
Received: from AS4P189CA0026.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::13)
 by VI0PR10MB9218.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2b8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 08:56:45 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5db:cafe::2b) by AS4P189CA0026.outlook.office365.com
 (2603:10a6:20b:5db::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 08:56:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 08:56:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 09:59:02 +0100
Received: from [10.252.6.208] (10.252.6.208) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 09:56:42 +0100
Message-ID: <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
Date: Tue, 17 Mar 2026 09:56:39 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
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
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20260313195801.2043306-4-shenwei.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6C:EE_|VI0PR10MB9218:EE_
X-MS-Office365-Filtering-Correlation-Id: 0265a37f-ddc5-424d-8651-08de84031d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|921020|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	oXyQ1e+lFD4Do+FgpGFw4v9hZz/MaqouoTyNonEHf5snirRw0KqN9H1CDtvkLIEJzU8FIIaRncdPFFoG3ZDdSX7KRwAehIPg4J4T1ypMID4v6nzhYs0eaBmrAgQ7vLyXcL8QoALmdB80M8/8pg0Swni77Pml7f0Fde42GSvLZaf1UaP/0dSwWmNxilU0vyt0eaWw7DeQtxTRke8r1oMDXU9zHCsAQ/aW/55WD7jOMgzTdR2CxXbsuICG46XKTqu4MYbhMMLRWzzw4+6LxNWd8El68HdJYffzmAZ/sLi1x95tEyHwwZLkR8PCjBAoWIobl5nWwMWYQOS2W4iMzkkhYD7K1MXc3w9ig/dm4F0OaSW1/lp/F8BJp5vmECSAVM279BPG1bn4DZAO9h6VChxvpZ3tGoWAWbQYMqIDWb/fWWBy/Y1uvAOOAXNwQ4i1GpWlHrYilTcw6ct38c3V3CwwIVUv7RcxA6z+9+5Q6oDzweOkeimec7+KFBIUdF0C6IvX7robv20JSIEa2sabctUjz+umP0h1gBHDhEb4xsDF76mhISuqhvNRGVbWsfgyKJr939XEBgbtlpUp6ttA6Pn0dAhq3fwSkhoKlGLxQOPedKUmbBAtS364w7ZY+nLV9VE0tPaF7+QYUZmYUPJ6HpPn/EHKeFzYecbishCQ6qnrPseI2oYJuNulGom19i1qwf35nL51ONqY2j4VZy4qWz3xySO1FED5LJShMluneogOk2NFbW6ttQ8NMcrhVmfkFpnfAfm/ZO0MkABd4dK/0M1jpsMEVb2uBt1QESDh1/bGw1ux6T2C18RMyEmdj1Q3RfX+
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(921020)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cOtND+zrSkaPUIhDRWEH+uRzEz1FMqDm/rOYw2Gaqh7r7EU0c7yzq8JtN/v2pl8myLL9m5nSD8cYabGElNkNLc5Cpe9kRtWmjRPWbICmzIlzU7lEa6q4Jm0+RF/QYqYnGoq8ncevGC2hDl9dn5Ajz1A5ApoKHZZ0sLgkg4EL69K2ogTf68Er9sgVthJyN3SWIz/9coYimIOq1s3QIrolYxV+By0CNa4UyoOc7E5NdeDUuDnwCOTIe/VNOGQS0L5RLUM3YJaNeDKhYXZ92/QpMkJWtBHllN1RLrwovSNgugXhbsMx1P6Mq+beJQov98Np5zLwBWDWdJPyV+sXPf+/VK+QssSLJ3FwDkSCXWNq4jPIy6cFlJAlp9w88oN2eSTIqnuplwZn7wTRuaNsOpLxN+s0uVk0aLs9sJhXgGIKb0Lw3VX67yLf6x6cId0yvTZN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 08:56:44.8400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0265a37f-ddc5-424d-8651-08de84031d94
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9218
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33597-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,bgdev.pl,lunn.ch];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bgdev.pl:email,lunn.ch:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 109D22A615C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

On 3/13/26 20:57, Shenwei Wang wrote:
> On an AMP platform, the system may include two processors:
> 	- An MCU running an RTOS
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
>   drivers/gpio/gpio-rpmsg.c | 596 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 614 insertions(+)
>   create mode 100644 drivers/gpio/gpio-rpmsg.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index b45fb799e36c..cff0fda8a283 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1892,6 +1892,23 @@ config GPIO_SODAVILLE
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
> index c05f7d795c43..501aba56ad68 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -158,6 +158,7 @@ obj-$(CONFIG_GPIO_RDC321X)		+= gpio-rdc321x.o
>   obj-$(CONFIG_GPIO_REALTEK_OTTO)		+= gpio-realtek-otto.o
>   obj-$(CONFIG_GPIO_REG)			+= gpio-reg.o
>   obj-$(CONFIG_GPIO_ROCKCHIP)	+= gpio-rockchip.o
> +obj-$(CONFIG_GPIO_RPMSG)		+= gpio-rpmsg.o
>   obj-$(CONFIG_GPIO_RTD)			+= gpio-rtd.o
>   obj-$(CONFIG_ARCH_SA1100)		+= gpio-sa1100.o
>   obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
> diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
> new file mode 100644
> index 000000000000..9c609b55bc14
> --- /dev/null
> +++ b/drivers/gpio/gpio-rpmsg.c
> @@ -0,0 +1,596 @@
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

you still needed to include virtio_gpio.h?

> +
> +#define MAX_PORT_PER_CHANNEL    10
> +#define GPIOS_PER_PORT_DEFAULT	32
> +#define RPMSG_TIMEOUT		1000

I wonder if the timeout is not too high. but
not blocking.

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
> +
> +struct rpmsg_gpio_line {
> +	u8 irq_shutdown;
> +	u8 irq_unmask;
> +	u8 irq_mask;
> +	u32 irq_wake_enable;
> +	u32 irq_type;
> +	struct rpmsg_gpio_packet msg;
> +};
> +
> +struct rpmsg_gpio_info {
> +	struct rpmsg_device *rpdev;
> +	struct rpmsg_gpio_packet *reply_msg;
> +	struct completion cmd_complete;
> +	struct mutex lock;
> +	void **port_store;
> +};

Except if I missunderstood Mathieu and Bjorn's request:
"reuse all the design-work done in the gpio-virtio"
We should find similar structures here to those defined
in virtio_gpio.h.
struct rpmsg_gpio_config {
	__le16 ngpio;
	__u8 padding[2];
	__le32 gpio_names_size;
};

/* Virtio GPIO Request / Response */
struct virtio_gpio_request {
	__le16 type;
	__le16 gpio;
	__le32 value;
};

struct rpmsg_gpio_response {
	__u8 status;
	__u8 value;
};

struct rpmsg_gpio_response_get_names {
	__u8 status;
	__u8 value[];
};

/* Virtio GPIO IRQ Request / Response */
struct rpmsg_gpio_irq_request {
	__le16 gpio;
};

struct rpmsg_gpio_irq_response {
	__u8 status;
};

> +
> +struct rpmsg_gpio_port {
> +	struct gpio_chip gc;
> +	struct rpmsg_gpio_line lines[GPIOS_PER_PORT_DEFAULT];
> +	struct rpmsg_gpio_info info;
> +	u32 ngpios;
> +	u32 idx;
> +};
> +
> +struct rpmsg_gpio_fixed_up {
> +	int (*send_fixed_up)(struct rpmsg_gpio_info *info, struct rpmsg_gpio_packet *msg);
> +	struct rpmsg_gpio_packet *(*recv_fixed_up)(struct rpmsg_device *rpdev, void *data);
> +};
> +
> +/*
> + * @rproc_name: the name of the remote proc.
> + * @recv_pkt: a pointer to the received packet for protocol fix up.
> + * @protocol_fixed_up: optional callbacks to handle protocol mismatches.
> + * @channel_devices: an array of the devices related to the rpdev.
> + */
> +struct rpdev_drvdata {
> +	const char *rproc_name;
> +	void *recv_pkt;
> +	struct rpmsg_gpio_fixed_up *protocol_fixed_up;
> +	void *channel_devices[MAX_PORT_PER_CHANNEL];
> +};
> +
> +static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port,
> +				   struct rpmsg_gpio_packet *msg,
> +				   bool sync)
> +{
> +	struct rpmsg_gpio_info *info = &port->info;
> +	struct rpdev_drvdata *drvdata;
> +	int ret;
> +
> +	drvdata = dev_get_drvdata(&info->rpdev->dev);
> +	reinit_completion(&info->cmd_complete);
> +
> +	if (drvdata->protocol_fixed_up)
> +		ret = drvdata->protocol_fixed_up->send_fixed_up(info, msg);

Seems not part of a generic implementation

> +	else
> +		ret = rpmsg_send(info->rpdev->ept, msg, sizeof(*msg));
> +
> +	if (ret) {
> +		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (sync) {
> +		ret = wait_for_completion_timeout(&info->cmd_complete,
> +						  msecs_to_jiffies(RPMSG_TIMEOUT));
> +		if (ret == 0) {
> +			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
> +			return -ETIMEDOUT;
> +		}
> +
> +		if (info->reply_msg->val1 != 0) {
> +			dev_err(&info->rpdev->dev, "remote core replies an error: %d!\n",
> +				info->reply_msg->val1);
> +			return -EINVAL;
> +		}
> +
> +		/* copy the reply message */
> +		memcpy(&port->lines[info->reply_msg->line].msg,
> +		       info->reply_msg, sizeof(*info->reply_msg));
> +	}
> +
> +	return 0;
> +}
> +
> +static struct rpmsg_gpio_packet *
> +rpmsg_gpio_msg_init_common(struct rpmsg_gpio_port *port, unsigned int line, u8 cmd)
> +{
> +	struct rpmsg_gpio_packet *msg = &port->lines[line].msg;
> +
> +	memset(msg, 0, sizeof(struct rpmsg_gpio_packet));
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
> +	ret = rpmsg_gpio_send_message(port, msg, true);
> +	if (!ret)
> +		ret = !!port->lines[line].msg.val2;
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
> +	ret = rpmsg_gpio_send_message(port, msg, true);
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
> +	return rpmsg_gpio_send_message(port, msg, true);
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
> +	return rpmsg_gpio_send_message(port, msg, true);
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
> +	ret = rpmsg_gpio_send_message(port, msg, true);
> +	if (ret)
> +		return ret;
> +
> +	msg = rpmsg_gpio_msg_init_common(port, line, VIRTIO_GPIO_MSG_SET_VALUE);
> +	msg->val1 = val;
> +
> +	return rpmsg_gpio_send_message(port, msg, true);
> +}
> +
> +static int gpio_rpmsg_irq_set_type(struct irq_data *d, u32 type)
> +{
> +	struct rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 line = d->hwirq;
> +	int ret = 0;
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
> +		ret = -EINVAL;
> +		irq_set_handler_locked(d, handle_bad_irq);
> +		break;
> +	}
> +
> +	port->lines[line].irq_type = type;
> +
> +	return ret;
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
> +		/* if irq type is not set, use low level trigger as default. */
> +		msg->val1 = port->lines[line].irq_type;
> +		if (!msg->val1)
> +			msg->val1 = VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW;
> +		if (port->lines[line].irq_unmask) {
> +			msg->val2 = 0;
> +			port->lines[line].irq_unmask = 0;
> +		} else /* irq set wake */
> +			msg->val2 = port->lines[line].irq_wake_enable;
> +	}
> +
> +	rpmsg_gpio_send_message(port, msg, false);
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

The number of GPIOs should be obtained from the remote side, as done in 
virtio_gpio. In virtio_gpio, this is retrieved via a get_config 
operation. Here, you could implement a specific RPMsg to retrieve the 
remote topology.

> +	if (ret || port->ngpios > GPIOS_PER_PORT_DEFAULT)
> +		port->ngpios = GPIOS_PER_PORT_DEFAULT;
> +
> +	port->info.reply_msg = devm_kzalloc(&rpdev->dev,
> +					    sizeof(struct rpmsg_gpio_packet),
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
> +	if (drvdata && drvdata->protocol_fixed_up)
> +		msg = drvdata->protocol_fixed_up->recv_fixed_up(rpdev, data);
> +
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

Here is it a bug ? else you should explain in a comment why you perform 
some actions when np != 0 but return -EPROBE_DEFER

Regards,
Arnaud

> +	}
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->rproc_name = rpmsg_get_rproc_node_name(rpdev);
> +	drvdata->protocol_fixed_up = (struct rpmsg_gpio_fixed_up *)rpdev->id.driver_data;
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


