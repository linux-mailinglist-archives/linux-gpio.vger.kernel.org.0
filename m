Return-Path: <linux-gpio+bounces-27127-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A77BDA872
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 17:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 665255003B1
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D1E304BBA;
	Tue, 14 Oct 2025 15:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oBHIFEno"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2C8301015;
	Tue, 14 Oct 2025 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760457280; cv=fail; b=fNOtQ6Dd+KSYmwIMfM7+v9f8IFMtEyj0UnJPiAP6iIqI5IzTaEXYrj56Q1pQX56IzyKjzeEFV2i4BxGs9d8siId6AFhOBqopygF3N0HT+5T6H1eg/GdoOQhmfT/T2DS1ZWybIXOeUirM/tA+KrfqujrQFnuo77HUkX+cnq4gIeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760457280; c=relaxed/simple;
	bh=AGBNagRfyQ9AMLwXM2W1igaAwv41XUdCscyCnU3E2L8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s41Yc+UjXKS6/GgjfZPllGflDQXkuapT3tct7dW+l1EVeM0XEvOFPhB0V2lifHzmTo4vlVczEKGICKPAvjVgtodjJsjR0vgp9DEQ4JizMHXH00hVuc3YJW1n45oburvqE4REyviSclZU8RDK++IsDEPaE18foICNw8koeaemIT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oBHIFEno; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/B+xdROpkDEcZeUy+Omhz4OPokkucmuPeEjZRfAdoh1eWUt43gGSW9B7+ifu2s9L1WN58FBwvUTFC+uhsmrQB54inCAvDDSPnBBA7x+s5DVQCE0Oz/JSHdaOnMzKldp9MEedtobrQSSjC2JY5OnxM6gldIstsuMMkDPixzT0vYe9s7BiUQICSp+SmFjcYWINfAZMB/qxdX+9hGvDZtKMscmOEaC+sdIobVR1t3VH67Gy1a38mhRavtIYBlhYF2OyQ8ERjPB0qtoKTve8/k5zt1epxKo71zKiQh7JepgmmlcnMZ1tK8G35x2SlIeJc9KVK6js1ta6DWIQI6S9MJbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6V3IRtOuISa4rjeZpiJmhA/eCF/HvAhnQHRO7eZqoBI=;
 b=gykqQdOoA3MKVV4xh0kIBVzi6oyJTgO45u+/T/ydlKFVJPuFKlnqDyh49QZ2q/hmKoeHPsyWHNhSnhSFef8sdRUC00e77ZMesjJbPOcEQlaWDptnhgn6UOaYWg4ALQvkY4cAhwt0Ju/ullvfqjAt2wTnCQNgwbY7j3/uKSX5h5MK5OwSMF845YkcyBDW9tRH7lUivjU1uo+rdNKZyFZ+JSbdWCMu6HE3GaZ5e1ND7O/54EOchd6irl39qbntrYWwhTJWPDxQJnff96XEK6nTyi1REmgRHaOmDt3Y2tJtHJlUYWGHI6KV0EabGuExJEm4QsF2+yYZhLygisqngw1Qsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6V3IRtOuISa4rjeZpiJmhA/eCF/HvAhnQHRO7eZqoBI=;
 b=oBHIFEno0/eox458+9G/zxeTwJjflp41PhBCJ6GEOI87iVioXo4LY9OczEoGjDxLzVwa0kNEYbEtatkB9jcuOzXLnCR8mIxN+OywKhYvBVqbkn+sO5VXtXxB1/v1P8aMuRRfzIY/3F0Kd144QNkCzTR9sqFdU6CzihsLOuVYFbF4LjgKToT5VT9vqAJh4OWW6GNIXLplqqnL4ZUn0+ou8suPuBWhHOv9fDWTVlxjeR1fPaTQ2txBdPxJDVhJjLNuyI5yI8o+fgyTw2nYAaqMRzAtxGCX8dL6HmHuMGM4mVtwX3KwnzQ5zdkkkCAzS36uNtjvsOKgIoHLsNvgODXmsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 15:54:16 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:54:16 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v6 5/9] gpio: add QIXIS FPGA GPIO controller
Date: Tue, 14 Oct 2025 18:53:54 +0300
Message-Id: <20251014155358.3885805-6-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0120.eurprd04.prod.outlook.com
 (2603:10a6:208:55::25) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GVXPR04MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: 48925e3c-f72a-488a-f749-08de0b39edbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8ql97Bmp1Z7IeCp/OFqGL7t7YeLDQ0YVzHdvFypkwFwbnfNJeBXE772YwOlZ?=
 =?us-ascii?Q?NgsQ/C8KKxR+UuoBt18lTAPOqOTaUVBEMApwtHNFAng3cH97ks9fRflLiZJo?=
 =?us-ascii?Q?Lxke+hhN2l1yxUKKsyiw72zMq0umI4LBNMLceaQi3M0GXhUjeQNwfFvNjSKT?=
 =?us-ascii?Q?ECf1+N0oAmynwFRjhbkkoZjTiA7BnLWGEwfvpzLAPeMuIYWZ20K6AFEm1M8d?=
 =?us-ascii?Q?QIlxhkBvTL8rCvI2bMpSadcMy5QNgTm4QPFLTgKNkp97xEUv20V5rLCr/gwy?=
 =?us-ascii?Q?NgJPiLNkLQHruUdRNqQLWR3C3vqvDkXABZIvlEwMGbxyWrzRwoP46jOaT54f?=
 =?us-ascii?Q?WlsNwqxso4NJr/ukkqrrIpufivo32vSUE5AbpR//rDlX+mVaMyWL3xmCWFj6?=
 =?us-ascii?Q?PpmG98SkLg3gshFpxSV7YPizmP5X1iJbbXu3PCppC7PuEYtPfJyQtNuriZgC?=
 =?us-ascii?Q?oaL7dHgXn1P1xHoTOiGoA2cdat/sxIEZs3cs67r8Cz5yYpWPdTrzVVIU8bSl?=
 =?us-ascii?Q?+u9KlWnwPgDd8DDxR4bKHc+zwCgR2PwVOL1DnzZRcXtfr0jIflm9crakva6a?=
 =?us-ascii?Q?z9UDzUDrZvIhB2EnAs8aWvMkdcVEt8b/jFSizT2LE9vtUFqfruyUljatFpHF?=
 =?us-ascii?Q?opSBBP45pxdpxrh4deNZ40h7OR02HbuFnDaTTFGffy3OUjYVjG+V8qrsF7Ez?=
 =?us-ascii?Q?f4BrOaMyr9A9tdsUtXALRPRrb4PUW/dZNadZp0AQjGLrSwHzRtRQFipJ/NwQ?=
 =?us-ascii?Q?H/A88TbiCAGR5+OOambe+tHsQwh7hiWGMwev/z+GlcAFtvpVn7jCuGw8nMap?=
 =?us-ascii?Q?9zb3xXs5V0/EAuCZJO+0RJ48dnsUthU3Xjo1OdYut84daYMlT1YPxYOZBoyH?=
 =?us-ascii?Q?QjB8mqNzoqkzQn5GvJiDcmt/TtRpMy10K2Rv+/S6UsIZzVlmfeS0lt6tV40o?=
 =?us-ascii?Q?v++Xn9oS9mS5AHpEViuWJz6uDdU38uzi3YQCg4YrKp2ZuWVJCz4rIAiXoNSP?=
 =?us-ascii?Q?h+LoEO7xpT2rxvZmeKvrYhVMDSXTjVUNoQl7iwmdAYz40/IjHUWgbrq+7fUe?=
 =?us-ascii?Q?1ShyXjYuTBOBEKbpXvrJQmN3O1u1KY2Jvz03jyaCerMSNhX4SOi3aLW4RofG?=
 =?us-ascii?Q?WPCerRxyU3pyNeN1IEwY13D9+Qoo7UyTtpg+BLwg0lCR9ydgBUGYTCKITr6j?=
 =?us-ascii?Q?a6gc2HVCOsTkoPtL1CSPKwAXUBpFBPteiEg/v+5Fj4+hoN9AV290cwvO+61I?=
 =?us-ascii?Q?sWft71OV3ZQ50fxY9baszUklQjvFPMv9473YWZmg1eO+aIouDE34aqPt6qj4?=
 =?us-ascii?Q?Avpgwp7jRF3sRsp4dXCuGeS6gdsNnlc11IQpOWL8zG1HCsEuWVe6nV3BvNo4?=
 =?us-ascii?Q?SKTzpoDepcxY/P6/Mw7Zhm0HGOnpLnvAoFvhsCTcK7rFEX0VfCFV4vbD7qbq?=
 =?us-ascii?Q?P8/jQIxEBtLhcvwUFD9dcvd2llTMGyhj5B+d+oCpAegqtFyHai2ffmJxqMpq?=
 =?us-ascii?Q?QVuBuQC4kwarq3A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6nPtjJlo73eLgbfNhhnbKZCOMhxjALWKqKi0k6iFCmkVqN7gCkKS2fKtaK9v?=
 =?us-ascii?Q?xagILA66lq/QySRvDudWdjDk43ifW19Xts5SRtgW5GFs9q9thn+dtGLAlpSb?=
 =?us-ascii?Q?T8hWTimal1F6mB0J0tD9tqVZLyK5KxwfD84O3lWfRR9CMwg1lzqUlMUOMswA?=
 =?us-ascii?Q?a48o5P2MOjO8lC94vT8Kce6wg41lxs8YubOlakOsizN8fGWUioPkqgcr8407?=
 =?us-ascii?Q?mwq5z6hXsC+B0kzChM/RpqBi+wOA9b6oyFoyc+csgtzUNnlyjzkxMZASyAnf?=
 =?us-ascii?Q?17NWOet/lztpBt9jtZ+Z/EPABXyryMeK4TXMJxfLqN6LPG5AjjWVyOMxq7/+?=
 =?us-ascii?Q?O0iqhS3xc8WbPA22nhf5lGKSdc3ino7QOfiIYYw5BXoXu6wBgiPJKr36Kq7h?=
 =?us-ascii?Q?obc/K7Sku23XpOYrOM3YgA0x44UlXCbU0d0iG0FtIM6kGJrMIJWibfCC2EK3?=
 =?us-ascii?Q?0+iEuNmVMu7suiURuVtoct8T0NpAAf+2TRMcO2yVrqRyxFFqfo6AZgD5PVT6?=
 =?us-ascii?Q?EWUwqJ3u23WjmukGrJgOB845KOjwebmHqIMpL4jgtQmuG0Ebx8rZY6h0EWIt?=
 =?us-ascii?Q?Q1MqWPmyB3X3pM0Ow8t1FV0BLvXAHXeBw1/aHEWDUWVC8iDVkVf1rbxJ/ufw?=
 =?us-ascii?Q?mxWg+LyGoKHagGqdUsyRuHIwaGpFYsmP/ZpbyH2+m/ov6+fe9nwlzCPISZAm?=
 =?us-ascii?Q?8VboCJqtcTbSsOpS5p1tk/4CSn3BDHyorUf7ZuPKfYOVDCL1BNxyCOrXBOcz?=
 =?us-ascii?Q?rAvbr7FmojQkE8zYSmt/zNQtzKIvBHuT48lo+JyMwU+jlyKu1DZR2FXCcdR9?=
 =?us-ascii?Q?0hJeQLd528arP3PDjIn0y7qWME6N5O0Sxvwexi65QEAvOEic9bYwHANf14MY?=
 =?us-ascii?Q?FbbxBP7lmX8L9OXVCUO6oExv79FJFPPsHZd1lvRCGoQ8qDMzIcvoPp1o9GP4?=
 =?us-ascii?Q?jwPHrl39A9EUuVuQgXYPQLGo4TQO5/gD8vhia2AaFVUmpRjulhHX3a205dTJ?=
 =?us-ascii?Q?JbKOr/Wsb5AEBEf7nZKevk1F/n6Wx6a/ShopWtyRIzbpfdtHLnaEE7rKGaXb?=
 =?us-ascii?Q?rA9qpSjJje8EgxrSvMXdnbImgOoKA5Ua5q8ZwMCSIqBUKMxCvM23Sp+oW0ID?=
 =?us-ascii?Q?ocSdFglDCKdLcG35+fDP0IWYEmE0EOYg2HAVVSIn40Dt3sGHlu5JVH8QcSEZ?=
 =?us-ascii?Q?5KEVhuRJPqDy9wVbsIi4EBoufs9aOpJuYqLiDRqEQfxPNM65KjLiTjGkS+ms?=
 =?us-ascii?Q?43kKjqiwgjHCm1s8N7RAB+lheSzaiQm8XrkBO2cpws2AkPcrgZTRL/ezJa/U?=
 =?us-ascii?Q?IgDjYMOJzHr87cuxK9m2hVGrUBOd4mCzE0ZkHDJ9l4x3htuJEjZzMeqoiWR/?=
 =?us-ascii?Q?ipPVf87NoT9xoDuByfSooMCjdxqfvigs1mMBX5u6RPqZ38OtQOJxtxWqgnPO?=
 =?us-ascii?Q?mhXVsL8VU7PMy2yPA2BB3DIffh9uMPbw8NrtKyYwBfMHkKva9xWw9BXF5iQI?=
 =?us-ascii?Q?g+z7ZIxetwUoin/gfJL2esPJGPqOp+FUT9QMhORiX8vnG59BNgbreA//0h84?=
 =?us-ascii?Q?kzkIUvGRDfv9cQjfXoDZG9mbI53qhc/VKoCenVVJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48925e3c-f72a-488a-f749-08de0b39edbe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:54:16.4588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mx+MSZ/0RbU78QV+FDboa1ucCg8dzyVhT5a+S+may6/X0ZsY1qHylRT2iYboPSjVM3QYkufET7MF3ABFLZpJ/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927

Add support for the GPIO controller found on some QIXIS FPGAs in
Layerscape boards such as LX2160ARDB and LS1046AQDS. This driver is
using gpio-regmap.

A GPIO controller has a maximum of 8 lines (all found in the same
register). Even within the same controller, the GPIO lines' direction is
fixed, which mean that both input and output lines are found in the same
register. This is why the driver also passed to gpio-regmap the newly
added .fixed_direction_output bitmap to represent the true direction of
the lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Michael Walle <mwalle@kernel.org> # for the gpio-regmap part
---
Changes in v2:
- Use the newly added .fixed_direction_output bitmap representing
  the fixed direction of the GPIO lines.
Changes in v3:
- Remove 'drivers' from the commit title.
- Remove the qixis_cpld_gpio_type enum since its not needed.
- Remove the NULL check for device_get_match_data().
- Use a bitmap declared on the stack as the config field passed to
  gpio-regmap.
Changes in v4:
- none
Changes in v5:
- none
Changes in v6:
- Move the Kconfig entry under the mfd menu

 drivers/gpio/Kconfig           |   9 +++
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-qixis-fpga.c | 107 +++++++++++++++++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 drivers/gpio/gpio-qixis-fpga.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 7ee3afbc2b05..2dcfbc05980c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1565,6 +1565,15 @@ config GPIO_PMIC_EIC_SPRD
 	help
 	  Say yes here to support Spreadtrum PMIC EIC device.
 
+config GPIO_QIXIS_FPGA
+	tristate "NXP QIXIS FPGA GPIO support"
+	depends on MFD_SIMPLE_MFD_I2C || COMPILE_TEST
+	select GPIO_REGMAP
+	help
+	  This enables support for the GPIOs found in the QIXIS FPGA which is
+	  integrated on some NXP Layerscape boards such as LX2160ARDB and
+	  LS1046AQDS.
+
 config GPIO_RC5T583
 	bool "RICOH RC5T583 GPIO"
 	depends on MFD_RC5T583
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index ec296fa14bfd..ee260a0809d3 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -146,6 +146,7 @@ obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
 obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
 obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
+obj-$(CONFIG_GPIO_QIXIS_FPGA)		+= gpio-qixis-fpga.o
 obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
 obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
 obj-$(CONFIG_GPIO_RCAR)			+= gpio-rcar.o
diff --git a/drivers/gpio/gpio-qixis-fpga.c b/drivers/gpio/gpio-qixis-fpga.c
new file mode 100644
index 000000000000..048a2cac4f0f
--- /dev/null
+++ b/drivers/gpio/gpio-qixis-fpga.c
@@ -0,0 +1,107 @@
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
+struct qixis_cpld_gpio_config {
+	u64 output_lines;
+};
+
+static const struct qixis_cpld_gpio_config lx2160ardb_sfp_cfg = {
+	.output_lines = BIT(0),
+};
+
+static const struct qixis_cpld_gpio_config ls1046aqds_stat_pres2_cfg = {
+	.output_lines = 0x0,
+};
+
+static const struct regmap_config regmap_config_8r_8v = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static int qixis_cpld_gpio_probe(struct platform_device *pdev)
+{
+	DECLARE_BITMAP(fixed_direction_output, 8);
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
+
+	ret = device_property_read_u32(&pdev->dev, "reg", &base);
+	if (ret)
+		return ret;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (!regmap) {
+		/* In case there is no regmap configured by the parent device,
+		 * create our own from the MMIO space.
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
+	config.reg_dat_base = GPIO_REGMAP_ADDR(base);
+	config.reg_set_base = GPIO_REGMAP_ADDR(base);
+
+	config.drvdata = (void *)cfg;
+	config.regmap = regmap;
+	config.parent = &pdev->dev;
+	config.ngpio_per_reg = 8;
+	config.ngpio = 8;
+
+	bitmap_from_u64(fixed_direction_output, cfg->output_lines);
+	config.fixed_direction_output = fixed_direction_output;
+
+	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(&pdev->dev, &config));
+}
+
+static const struct of_device_id qixis_cpld_gpio_of_match[] = {
+	{
+		.compatible = "fsl,lx2160ardb-fpga-gpio-sfp",
+		.data = &lx2160ardb_sfp_cfg,
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


