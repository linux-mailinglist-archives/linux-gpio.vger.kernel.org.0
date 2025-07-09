Return-Path: <linux-gpio+bounces-22987-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA497AFE7B1
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 13:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B27A61C2863D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 11:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E304A2D5A14;
	Wed,  9 Jul 2025 11:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fF7Y/HpT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74F72D59EB;
	Wed,  9 Jul 2025 11:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060458; cv=fail; b=o2nzDowgY4I2amSUh+fGv1eyLTpmDWFr7HDHcb0hNIsWOVJ4aVEs5RJaVSRZlXgYDBQcjYSh5jD7xOEmpmmVLRrgAo7Pa3Z9bzqvoP7Z8QXOembiHms1oov6SBUDoZGzbH7wYbQy7WDWFugdG9nP9v408ac15a5xv2AbokcFKXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060458; c=relaxed/simple;
	bh=lEo5OkMR6nXPG8JUfzIl1xOdrhrp5q4GLMqzrMxOkdU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m4zQNzf3WAHkG/IcXXDGBKAKZYjTdG4NSeKDnXUVFhoNcp6emAxxNlRwF3AwhLTfq9+WqeGkpD70R5i7UNRzxnNqkVmaKoQuyx2DiMBpNIpPoiO/OlamYDFecKXykF3wYjqyq2GKGDi9nBMGAScMzQ5ifvjCg2idoTfgwLOgyNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fF7Y/HpT; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAWqjRV7/RcLXrIJzoLkjIKrVtUwdvlzjKf8P8Tdxp78wpGmqZ8QSY8C08Cg5o1EJjobP32UQqJxyJ6CeUecphYJ3YHXBrZmLdVfehWvgPbCOmM7cG8JmvRAImKYj8zi+hCEKC1+57BByQnWji2UFweEH1SWRbJ19Y4H5RraBwe7NiV2AzK1iH8roa6LdVCK1tR6rP50Y3g8rCfroTIFO60GmrFPSDQ7FImDxFE3t3lRbaCfp9uWvrOILbCemptho8/IfBo8YaruqdoIVYh2qGpKGHrwQpFIStffX4hg6hsZwJhFIjYauzgfMqDoPsg+/uvuHSgiaaxcDPVH8PY8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCRUH+E8Pmfa0xtm4B5pV/+AN9wHDdSKjEHmMP8R+3w=;
 b=YiRr5wwCpNIkuy0tS5LJkr2NTQQDIX1Zd6mjqltIhDKM1f2YLDQJE8777At5uCI94QUReCrhAjFZwsWtdKfDkmHDwACpxvBOqeFkpi0bVFBZH3/eKMlqKnSZoewCH2A0dGZ/BEyk4xD2HG0EAj3gMvvihPBQjr1yKQfPoabQQvbP4ANPpQdZ4Q6SghUbXMnk81pp17ElksylMeu0plhB/3xccY0/iNhcuvqEN98b7/Ab4DrUlJZnsDY8CRyot2MCYwH0nDbGEHiArMGF4BNwrdw0VeOqX72zMYEYwjqZGiMPNQ+PsJsUkdr8uZBywMqNj+mw3AVGeuMxqoyj5M290Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCRUH+E8Pmfa0xtm4B5pV/+AN9wHDdSKjEHmMP8R+3w=;
 b=fF7Y/HpTx2SOUiE9CpkD0PiwOCKGq6SB0l1C8SR6LmXvWzjgDHmXF//0m0HXacz9WHZp3QXVpWyWzXyByquJ47w+RSBGHtZmkefMyz640DJJp0vngZIy+b87tiafp+PvoMQCU0KIqwayjrqkXKAHwozbZHwyQHCiuGbTKUPAY5pv7EZYA06cQnDcFMQTVsa0XaEWvp5laJv/pXCur5b/czmAoJAhJAEnkJ0FEPzLVrfZILJHWjYlAv2ltNzTG5ZWfjq8wWqOJumZNRwsuTynzlfigHdmhaOvV/x5o+Qo3oR7IPCDBmytCU/eM+UrcSfhpS3xXhnF6cAv6pyOeYpwFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 11:27:34 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Wed, 9 Jul 2025
 11:27:33 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 5/9] drivers: gpio: add QIXIS FPGA GPIO controller
Date: Wed,  9 Jul 2025 14:26:54 +0300
Message-Id: <20250709112658.1987608-6-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::7) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: cfda981f-4ecd-4a60-dce6-08ddbedb990d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QK3xi3G42o3NCnm91391ZH+dAGuWpBnAe+zj9mr6xAof9wjCKiLtvR4et1tt?=
 =?us-ascii?Q?N2+Q5x9S5ztZN9mNLx6JWJL5EAql4X+Xsgo/D1NDmd0R0BK6KOje2A6fl/RY?=
 =?us-ascii?Q?+P7hbJaqYKvRKQuFwXrVh7G/1y59BbCT7bs+ZY8zOAN7/o1Cyj30nHwBOf6f?=
 =?us-ascii?Q?TEX/bZHWiwJo9rvQeMh62SWpIkTi1qLABWbXB/ygt7t5of/WDLAfHPreboCh?=
 =?us-ascii?Q?XeH+tIb6+lm3tZ/dYn8IU1ROl+Mqzi4S8MsFlBnPo5g5xwN0EAAm2uSqR/fK?=
 =?us-ascii?Q?abjOVcQwXhm2yhqHE1/uluxl71lvL+b59EYiHOxKLvVDPW3i7K9SJarIl0nm?=
 =?us-ascii?Q?9eqFnwG2b2xfYvG9onoUKrVie9EMaRi0hqFGzIGwB5WjMCAa+dPYJRfxQ4L6?=
 =?us-ascii?Q?9y6+g7BsqaZmARVTS5dh3QG92mp+eTdAXv4uLfFWlExJoIPUwvTISwsd1V/C?=
 =?us-ascii?Q?CsgHh4nBLazsKKjUGcmIjBfZ7w2UKiDZ403UOpMbSGp4UfEptWMGpVJZlSQY?=
 =?us-ascii?Q?Hc4wd9wiguQKd/Wl5NNuSZvmIpnl7Da84TJf0k+jJnsH2maUgpKuJOBtkzmx?=
 =?us-ascii?Q?GVJrzAV127aGVAS0HaWT/eB1PbvX1LpNxK1ySvJc5cNJQ5xw5nKs90FimoBE?=
 =?us-ascii?Q?aRZhs6e37D+DXkD1jSZyQrfAosDE+ebvtzHyapMGn09lA8oypMY7BQzi8FW4?=
 =?us-ascii?Q?yCxmQ3MDZ+SIaBAf+m+SKblymj0hVI1hBqeWC5EHH2r6JE8ZeZsGC0lALcry?=
 =?us-ascii?Q?elzgrBaHRA/TJhFLsD+GjX377dSW1dEfIaHdF1qXWBcS4fx73qgiwmC2GAgN?=
 =?us-ascii?Q?qFdK63d6Vvr20Teo1ulg0602ZaeM60EBa9cTL0ecyMYqo2RnOIrfekCoZ74b?=
 =?us-ascii?Q?MuHSELLbp0VgqnwFWRu4oNAC3dzKbU8UVlG2pSuFkWmTy4JCQJ4TN4uwZdUf?=
 =?us-ascii?Q?lhIYp2eIpEXRUuYdNuSVMzWcT3nCQ9vnqmTakN7yLcQdh55mJIX8dAwXCVy2?=
 =?us-ascii?Q?wPQymLy8YfITpd+WNmbEXvpfaqlpTPALy+ETbkUZr+MGOq1uDjVaYZzZrt9e?=
 =?us-ascii?Q?ifNY7SmqbtPhuMzLe6Z+bVLTHY/4xTtMfiDSYDFW9I0hT5JIpe50fZi0VaFi?=
 =?us-ascii?Q?I4Shfn5Rmaff1ybJ+DU3RAcxal+9inSV1U1dqRGNIyoTCmwZITn0536gLQ1r?=
 =?us-ascii?Q?qOXRGcp+UxZ6na7WNSpC4UShnv//C/PQJvgfTSEf98Q2UBcxPt1/7p2wl9US?=
 =?us-ascii?Q?lHkkX9ppJy4u8FZNu2pejMLrCl0tNyxQcvJyjm9WE8iYggoeZLZUGASrOfE7?=
 =?us-ascii?Q?MiSAQDrNMsWItCB/5RUrUeVy9rdRm+QkkhtTGxhljDojbLmUqKzme/s/t3o9?=
 =?us-ascii?Q?2eMino34DzvhT5fa8tRRieZOkl9kvhHqigq/f22ol1mgrSQgKA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QousqBNQAVeYQs+knigK5HPQXqicTA9bGgTg4HC0tTJHk4oQZpZ/c9RsF/k9?=
 =?us-ascii?Q?Fe56LQgWsyyScWForevSXTrTmFrHIea2D6NRJxMUvIrhzmNVHj/eiGe2xSsN?=
 =?us-ascii?Q?Pw4qIVGRHSuuYD5ytYA3wHL4rJ8ptIhSi3IVR8eIvrbkrlsc0HLquPIxWcWI?=
 =?us-ascii?Q?Z4ar5LfTCS3nfgSrY4GZ+J9IFnjJHTgTE+ebuI7FQIuqTlC2gX33fpimOT9o?=
 =?us-ascii?Q?BRuyGgX6/1p44Gi/Abrii7UkXCLZOZERMD7QVhGFnvJ/d0YcZEAmhCZGp5z7?=
 =?us-ascii?Q?aWUkyvQqaZyK3CSzQgmCHCKfdYKKUuqHm51y5sYHRsERMwx02Qbj5qWI3v/l?=
 =?us-ascii?Q?wzHmdhAUhfxyxk7plcqfQ/cVTJQ0lrFqOhxdkGw51NmIQIAWztB45pTQjqYY?=
 =?us-ascii?Q?2NzZFv188GFdLZlJffFnd3bnGpv/HOc0DY9mHYBSRzGUI5w6U7y1i+CqgyRp?=
 =?us-ascii?Q?pGh7ukiklH2eL56y3bBxMZKfGnrtRuMMXhvj79Yok7KaPT6XEEfZW7JQtC4w?=
 =?us-ascii?Q?NZxDFyIJQEYYGiCkRj+J4gGCiYxgr16ykPWH+8Wa1xWtFhj/MUug3/AAmz0V?=
 =?us-ascii?Q?oDfbLZvzNTLLi6cy1MtI8Yxsjxcd9zASSqe1uyYPCADsx3qT6KvkETUWzmV8?=
 =?us-ascii?Q?TPLB7/NLV6ZZ1/SzHujVhCr75vxdaWYvMerG7cOfT59QuRhAJt4Iryew7xo+?=
 =?us-ascii?Q?C/WwWd2L5w/TAGXvrVeAnoz2tTqksmmsRLWHgn+x3HN//7tz0AmJrsS56pNm?=
 =?us-ascii?Q?6MslTtJG57McNd5Z27GSFLKkCq+hmIw5rgn73t0WcCsXLB9+h2XAPGP0vCSI?=
 =?us-ascii?Q?lU6QJKw+FmUdVy+BwnrF9CiuQT6TAg6rZwm+vkNLxfERD5QUMlQxVyJADKj7?=
 =?us-ascii?Q?fivYRFJ4mPNF3nczLWWn/1q5Et1Iyv7JnR41TG4aCbklapqh698RDUKyy5Su?=
 =?us-ascii?Q?7+7SkMJ7qSG1SjyqadaDyvxRMM+IBM/NoF1jDn0g6PuSagaBkXbLlSSZhTYc?=
 =?us-ascii?Q?sqHF0ce8T+G+QhrNzbucxy1lbwA7oKwze9ZeFXRKRbPHrgPC9+XD9G8BIY3W?=
 =?us-ascii?Q?iauv0dqM/9JjstQdcSBvs6uh4TNnwhkxmqSWQgch3ZVh/VbUxQjedPQ6Apr7?=
 =?us-ascii?Q?VasYanZQANYXq/KCxL8Ju3CS7H7A7868pRAUui3rj3G5v49xLCgnTGOmJEjp?=
 =?us-ascii?Q?fA4PPBjbPmvs38M0ZkbvGPnvZ5svTEGX8wKJ4e5HV/z8cluwx6rY8FqWB9VI?=
 =?us-ascii?Q?NiLF6SntfQESTc0lUyOyorUgrIrbhoF6vQQY69fTJ/PRARj6F2K2an58gH6m?=
 =?us-ascii?Q?dC8CdrJ8TG/aQEdEqS1GhLa5jBqWpec307DOHQY/FsdYv7Z71hjwGTR4vDDN?=
 =?us-ascii?Q?1P7QcY4EvCz6Vi2hNIZT/Su+XiAWZgT+nbhWJg77Zr3GQNOEXUcTKnc2HxrE?=
 =?us-ascii?Q?JWg2t5aT8NB+s5LbTcCgQYzIwPzFLKsXeQ/SZ87TgFQheZYnF2lhByVHipqV?=
 =?us-ascii?Q?NURuIAWtILE22NLlwZn5udSkHXNulZSFDiK4LNg35bGeh2dsNR+U/RkSxwsI?=
 =?us-ascii?Q?i/g2Y4JR/ZSEm6af6HznnWGyhwDga5P43fdAnkqJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfda981f-4ecd-4a60-dce6-08ddbedb990d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 11:27:33.4199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJM7f0X0aUp+fyoDCFm0Dm71CTklJp4ZzA7DgaPzFdHaR6nY9TvKAOI+mAHXE7ttrCpkLK8jipXJsIS+roQB6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830

Add support for the GPIO controller found on some QIXIS FPGAs in
Layerscape boards such as LX2160ARDB and LS1046AQDS. This driver is
using gpio-regmap.

A GPIO controller has a maximum of 8 lines (all found in the same
register). Even within the same controller, the GPIO lines' direction is
fixed, either output or input, without the possibility to change it.
This is why the driver also implements the newly added .get_diretion()
callback exposed by gpio-regmap.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 drivers/gpio/Kconfig           |   9 +++
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-qixis-fpga.c | 141 +++++++++++++++++++++++++++++++++
 3 files changed, 151 insertions(+)
 create mode 100644 drivers/gpio/gpio-qixis-fpga.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 6802e549621b..fe69b9fa12eb 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1926,6 +1926,15 @@ config GPIO_LATCH
 	  Say yes here to enable a driver for GPIO multiplexers based on latches
 	  connected to other GPIOs.
 
+config GPIO_QIXIS_FPGA
+	tristate "NXP QIXIS FPGA GPIO support"
+	depends on MFD_SIMPLE_MFD_I2C || COMPILE_TEST
+	select GPIO_REGMAP
+	help
+	  This enables support for the GPIOs found in the QIXIS FPGA which is
+	  integrated on some NXP Layerscape boards such as LX2160ARDB and
+	  LS1046AQDS.
+
 config GPIO_MOCKUP
 	tristate "GPIO Testing Driver (DEPRECATED)"
 	select IRQ_SIM
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 88dedd298256..b8dbd1aa2c85 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -143,6 +143,7 @@ obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
 obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
 obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
+obj-$(CONFIG_GPIO_QIXIS_FPGA)		+= gpio-qixis-fpga.o
 obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
 obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
 obj-$(CONFIG_GPIO_RCAR)			+= gpio-rcar.o
diff --git a/drivers/gpio/gpio-qixis-fpga.c b/drivers/gpio/gpio-qixis-fpga.c
new file mode 100644
index 000000000000..d5b7619970e9
--- /dev/null
+++ b/drivers/gpio/gpio-qixis-fpga.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Layerscape GPIO QIXIS FPGA driver
+ *
+ * Copyright 2025 NXP
+ */
+
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+enum qixis_cpld_gpio_type {
+	LX2160ARDB_GPIO_SFP2 = 0,
+	LX2160ARDB_GPIO_SFP3,
+	LS1046AQDS_GPIO_STAT_PRES2,
+};
+
+struct qixis_cpld_gpio_config {
+	enum qixis_cpld_gpio_type type;
+	unsigned int input_lines;
+};
+
+static struct qixis_cpld_gpio_config lx2160ardb_sfp2_cfg = {
+	.type = LX2160ARDB_GPIO_SFP2,
+	.input_lines = GENMASK(7, 1),
+};
+
+static struct qixis_cpld_gpio_config lx2160ardb_sfp3_cfg = {
+	.type = LX2160ARDB_GPIO_SFP3,
+	.input_lines = GENMASK(7, 1),
+};
+
+static struct qixis_cpld_gpio_config ls1046aqds_stat_pres2_cfg = {
+	.type = LS1046AQDS_GPIO_STAT_PRES2,
+	.input_lines = GENMASK(7, 0),
+};
+
+static int qixis_cpld_gpio_get_direction(struct gpio_regmap *gpio, unsigned int offset)
+{
+	struct qixis_cpld_gpio_config *cfg = gpio_regmap_get_drvdata(gpio);
+
+	if (cfg->input_lines & BIT(offset))
+		return GPIO_LINE_DIRECTION_IN;
+	else
+		return GPIO_LINE_DIRECTION_OUT;
+}
+
+static const struct regmap_config regmap_config_8r_8v = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int qixis_cpld_gpio_probe(struct platform_device *pdev)
+{
+	const struct qixis_cpld_gpio_config *cfg;
+	struct gpio_regmap_config config = {0};
+	struct regmap *regmap;
+	void __iomem *reg;
+	u32 base;
+	int ret;
+
+	if (!pdev->dev.parent)
+		return -ENODEV;
+
+	cfg = device_get_match_data(&pdev->dev);
+	if (!cfg)
+		return -ENODEV;
+
+	ret = device_property_read_u32(&pdev->dev, "reg", &base);
+	if (ret)
+		return ret;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap) {
+		/* In case there is no regmap configured by the parent device,
+		 * create our own.
+		 */
+		reg = devm_platform_ioremap_resource(pdev, 0);
+		if (!reg)
+			return -ENODEV;
+
+		regmap = devm_regmap_init_mmio(&pdev->dev, reg, &regmap_config_8r_8v);
+		if (!regmap)
+			return -ENODEV;
+
+		/* In this case, the offset of our register is 0 inside the
+		 * regmap area that we just created.
+		 */
+		base = 0;
+	}
+
+	config.get_direction = qixis_cpld_gpio_get_direction;
+	config.drvdata = (void *)cfg;
+	config.regmap = regmap;
+	config.parent = &pdev->dev;
+	config.ngpio_per_reg = 8;
+	config.ngpio = 8;
+
+	switch (cfg->type) {
+	case LX2160ARDB_GPIO_SFP2:
+	case LX2160ARDB_GPIO_SFP3:
+	case LS1046AQDS_GPIO_STAT_PRES2:
+		config.reg_dat_base = GPIO_REGMAP_ADDR(base);
+		config.reg_set_base = GPIO_REGMAP_ADDR(base);
+		break;
+	}
+
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&pdev->dev, &config));
+}
+
+static const struct of_device_id qixis_cpld_gpio_of_match[] = {
+	{
+		.compatible = "fsl,lx2160ardb-fpga-gpio-sfp2",
+		.data = &lx2160ardb_sfp2_cfg,
+	},
+	{
+		.compatible = "fsl,lx2160ardb-fpga-gpio-sfp3",
+		.data = &lx2160ardb_sfp3_cfg,
+	},
+	{
+		.compatible = "fsl,ls1046aqds-fpga-gpio-stat-pres2",
+		.data = &ls1046aqds_stat_pres2_cfg,
+	},
+
+	{}
+};
+MODULE_DEVICE_TABLE(of, qixis_cpld_gpio_of_match);
+
+static struct platform_driver qixis_cpld_gpio_driver = {
+	.probe = qixis_cpld_gpio_probe,
+	.driver = {
+		.name = "gpio-qixis-cpld",
+		.of_match_table = qixis_cpld_gpio_of_match,
+	},
+};
+module_platform_driver(qixis_cpld_gpio_driver);
-- 
2.25.1


