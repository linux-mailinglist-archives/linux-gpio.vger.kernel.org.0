Return-Path: <linux-gpio+bounces-26293-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE6DB7E3B4
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC7A61C0718A
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 09:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B715E32E2DD;
	Wed, 17 Sep 2025 09:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CHZzkdJY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A4E32F496;
	Wed, 17 Sep 2025 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099909; cv=fail; b=HIcs+JtKgbEKgy2fbTQJSf4rQPgdvOxL6o0JxRrkTrG4UqsVDCqa9qlDDWmEI4wQuaiwk4ah2h/TZOhYRQ0aBizUKbWu5j+thayE5xrKAQOlMZrStu+lCq1kHt4KQEaEM8Nn7U/rdj56h2dGTnPKV00a1yDLWH8snouoMqSbpG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099909; c=relaxed/simple;
	bh=ZuyQGtd5QDVM3xBPqhuOehFG3QqW/SBM2ac8libzrpI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kNLgorzvlyVZkfoiHGdV3mbUJ7erSGV0FUjj8RkF4Ji3smN/OdK7fdW4w512ZskJKyvI1jY0MQrqEr8fhbldSkYsRR/O2TDSshWAeHoaAUP0jRePsNY3VuX15i5XxskmbLJ98hcpVLNX+e4vDdzl7nFOp8Xg78wKDLAoIG8X/5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CHZzkdJY; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlYBY0O1IV08Rw3RsnCrJ2ieni+KCk9DJLoRhp0T0pop7k8d6zyRJ7Eu72FLWqV8ksLLCwtHBfvrB2CDiTtR6fIpFqAXl+ii3SciD3PeQlZIsrv4ifaCr2bDIHflEz8EWkV7kcNUIKjs6A9r8jWPQtKyn+/I6qTSZCx0Z+cu2FimCSpQEMA/6viTiBBrnFN54qQGOGcWj1p/d8GNORqA+kGmYXCEWVvBLVmRuG4bu2HiiiknEY1yKxZkWyHu+npB48hI60RWImRHEoW99+R1Xigs50mcI1pis0EB/IMPMsb72calMJxTX5vURhCqreD4BDf7Os1ufICQ6gARb2uT8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbQZ7WVRgAN/OTxupHQhfXKzqME8od+wHWsLSt8utyA=;
 b=GEyFCfhnni2a2JsM/m+SenfB0brzxtUjwVrsa7af9312nnIF8WQNbqcYEUTXOYovmSWZa76xsCUInu6wpsvVOmlAEO3rdkd6nR0Ir0ldO6PEHrpeUECT+ZSUSY1SoWcw4qdTYXwy+h/kKhS7fPDmK0iEMQslytXAC0ZPvfCOXAwF31/erIHB3gQXj4YZ1elL4tILT0hYOHrNINqPTpZHf4seDDrDxSKs+WmUi91rG3WpnCiBp/EJEmK2gAkMuan7Q6neV8YJZk2m7NEEUgVA5t8RNrEqXO4YSa4htdmFbuVVqrHueBlF4N0QUDz+WSynF4Hoh9/1MdibBdtgvEqWVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbQZ7WVRgAN/OTxupHQhfXKzqME8od+wHWsLSt8utyA=;
 b=CHZzkdJYUZDOFb+YdMSi0Nrm0FTJVP1QO8kHTWMLNhfGsgMCGJFMIydQNpW49u4PS3potPnUnLJ88X3RO7rS0Rn4fMWvsiDqFRStqr2Tme+0oT3dk+8NRf8w0IQaK2qISc8gfy3DXgyKiy5oq52K5tYEls+GpkJw09rj7QVHClszjZbCOAOUB7LK2/b2wYA9hrw6gy5S/J9f0MoWva7WIxOL+AdVspEP/0XiLZG6PCmJyZhTFboDI/trYec6xfnJsp0lk/afkTm513GUGp4YeHPtAItnEh+zv0rwmTocJjBhKUVmsbgxx1YhiCvFgh78P9mIGn+iOWT5ZnqdxBN9ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PR3PR04MB7387.eurprd04.prod.outlook.com (2603:10a6:102:91::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Wed, 17 Sep
 2025 09:05:02 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 09:05:02 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 06/10] gpio: add QIXIS FPGA GPIO controller
Date: Wed, 17 Sep 2025 12:04:18 +0300
Message-Id: <20250917090422.870033-7-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917090422.870033-1-ioana.ciornei@nxp.com>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0087.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::28) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PR3PR04MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: cc91a19f-f44c-4431-70d7-08ddf5c94938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qEjY0qRqvLTdyY0VQ6RVfQ6MHs8KLlvzP7PPwl7n0sGBPdMTsbIf4J1mbM7A?=
 =?us-ascii?Q?zd4sKh503VaPkl8kiyJDv9YfMat8xGOP+X4On4lKXVLDkGG9b/JSp3KYE5fx?=
 =?us-ascii?Q?+aLoj3Kbo7B/wDlj9sqK1rAujhDyP6QSzSz/1xfUdZ7afI2FSlVoxrhOOEIT?=
 =?us-ascii?Q?q3tnE/MBVz8wZjBN108lANwcTd1zSRxu/XL5clYjCY/1Ftl2+EgYIdLcMywj?=
 =?us-ascii?Q?bIiwhsNP79dCqa6KxbJ+IphaCSTRTlOvqfOqXpu84Xt05DnDHQG9bHPMLRvc?=
 =?us-ascii?Q?ETnmJDie9YgQK/PkYj7xCiyPQs/JqikTtQl59upD1cycRf88yiDvcb/EGdxy?=
 =?us-ascii?Q?2zTns6glYe4SMC0hthArv1UOPDYp/FQv7pzpQyJsxGecy2dJ/5/e9nRwGF3a?=
 =?us-ascii?Q?RJeoYjV2wEdzuaAbeisDXb/6ZM1olZRuToVk+UXHhTu/kZ8Ne3DTSowf1oG7?=
 =?us-ascii?Q?K4r5kFLRrmR3tU0fWQjVjwPMGTvV80VwsyaFZ+5S6C80oc7m3gLo+oWAgecM?=
 =?us-ascii?Q?nbEpSMmI3xy0sdlF+v0t4Gx1feWq2jkhmbCpMvKQVktim2ke8vvfQocBJIXY?=
 =?us-ascii?Q?1g0pIRie3TZZmaHxgwaG50PYAMsd36T13GPynbSpAcbwg69hdGWSiLwU96X1?=
 =?us-ascii?Q?lbcHyMiJZE2DJ44IZR1tQRMQTkqv77fLmBbGNciG/gZpOtoT0fFQZ1gwWt4U?=
 =?us-ascii?Q?VsiBZHXV76rBRjNjN6AV+uU8EI512C9zt/Bwqz3JBESIGZo+ViDKfd0wOyWR?=
 =?us-ascii?Q?70tU8vIe/DtRWCU0vl1Jz71k03ZLMW/pCX53owJ31FZv1dTZrQ1SPMZYt0VF?=
 =?us-ascii?Q?d8LJ0QnI3reTZkBrPL+tSichTidzsqLIEy6AD/Er9zyIdtFpKxM/ofyvBg75?=
 =?us-ascii?Q?6FUSaPgWcnNxLtHoj1yzBc3shDJnntJdDeVU1P1KZugMz9No0PIK4XEA3nZ2?=
 =?us-ascii?Q?PQzXwig9ddQukpKtzxA1aREZ+IWLdX4XB1pZLmf4eXAQhHRWKNuG++A0MY9K?=
 =?us-ascii?Q?dbGTYDZCOlbu1AD8pzNUUSaZe5s638+2IutJS9+9hs86IKyCi7w9zJVsZvK4?=
 =?us-ascii?Q?yYRH4/TyftR/mTfMX5F3Bwd9Ot7NraNM72Xuy4YquWa7IBNXJq8wa5pncftO?=
 =?us-ascii?Q?zkav/0nDJvheAnz4HHbvXhlJIMcXejE41jiUmmAida8HcFaMlbpt2Gdzzl1a?=
 =?us-ascii?Q?my6eQLHT5cPBPaOuSpK/aFyyfJqjXR9HHVuHvbrUhCAnw8HqUJRysZ32abM+?=
 =?us-ascii?Q?NLy2fTbjpn+8VDo6jtzv5qsuSs0Os+xGctti0oIQWO/y5vT23H0AI/V7cKAW?=
 =?us-ascii?Q?+D3lGNy8mBLyt2CNcn1vuGfZI6McWJM3wKtvDHOC0PRFSSO9SaoilCNiTdsT?=
 =?us-ascii?Q?zN1QmpIOnopVhQfmNYdWx+hw29fEV0Cmn0LLtmF8B2ey2FG5cuDanAOiwZoK?=
 =?us-ascii?Q?gElhwqRtsqGryv5RodLTt1s2/GMKTg93lOn2WIAGKgyHrfHHccOZZQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q7sKEZU9mckNAlhdLGeSKT0viyfGdzFv7iPg5ZTMVsha56wtwRu2yPZ9tJxT?=
 =?us-ascii?Q?TRHdocYrdcPCUwaZLO7CqjfwUB84jSdDjUUdoH6ssqNJtdVYBf7PWbaFJQrU?=
 =?us-ascii?Q?w0HNE1WSQnP5BjnQ1pj1LXSTLeIHbFobOTV6Dh13aKjkbtycK8f9O+CN3ymk?=
 =?us-ascii?Q?Ry7+686YYSMuQBfd0387IEAky74rzE1GH0GnMl8kmA5LuVxvtZJDIG9eseMF?=
 =?us-ascii?Q?hFvVUhGhnOxrogdGnPhqqoqkPO125T1v/HOMJ4xeY2zCsgcB6caFCPZJJk+h?=
 =?us-ascii?Q?CGQmab69pnyIq+fKCAaRR25YtIUxNLvAUpyvAszjLoXZcEDiW4NNKOOt03xU?=
 =?us-ascii?Q?mo3GpKrCnKyj59AzWmR/ABU1IAfg9Irrlsw/2ehy0V09+gC7Idexr+NYc8B6?=
 =?us-ascii?Q?V5ZtY2IX6uXhl527EAJKL2a3iHreu6frt+fvCM1DLSpzr0l+HJgWcpVj6fsd?=
 =?us-ascii?Q?zofq3DU8aWXT08ZSf8CRKbV+o3SYBkUWJ6bfY6QrVyIM+EXNsAaDngpaozca?=
 =?us-ascii?Q?bQDAPZN//t/Aid4ijm+eOGnj9YQ1CLYFFv1JNn0yIaOeOaNwJdHJEZbsMS1B?=
 =?us-ascii?Q?LZQAA5Tf2sgHrBsaaETNnGxSR7Y9BnUYnRkFkKjHkppFj45HTjw95wS0p00W?=
 =?us-ascii?Q?+ocqDVggAuhmIVJpAATF4ErmAkPU8wu90t7UIzHnd+HuWT2MgVXvvCcfEUMC?=
 =?us-ascii?Q?HLdZ9FbQ9MDgPSZkWrw+JifMeyOBuQqdaOYNvQO0XQFx+LdL+agWlGDhPhNm?=
 =?us-ascii?Q?pg3+dm0VPKX/B7WXXf75SPKaocS6RZdeA7UjuYljLbyMl8vn3zZBxT1OumEL?=
 =?us-ascii?Q?3bOrnzc92V0IPJHa4QC94IwMJmvzSkV1xZeHqRLwx+kmz0lcq26eraVhqWDC?=
 =?us-ascii?Q?g/S2lUiCYR7Mrl4M/cdGu0N5QN2VQ6QLMLhJ+2nF7YD4HOzHXraLVX2OhmAs?=
 =?us-ascii?Q?/sGF4ydqurjPgUVItjfs5AxT6llmFShlQhQLU5QdynL8wJ0LVm7oFzz55Snt?=
 =?us-ascii?Q?LfqmmPtu3A0NVzgWzuSCPj2kTgxPBwTfeIcnMdXheAtQLw7X9N6dAeTlQxSy?=
 =?us-ascii?Q?abS7c8KQrPghuSFD5GwcHbtWlNMz6l2gWNsZwiG7IBpQbYkk9ewUay/JWr1s?=
 =?us-ascii?Q?10LOUOPVKoV8xZO2HUUMIlYF1BdNuLTSIM4TLVM2PpFYlzeAlc+QA+5lu1l3?=
 =?us-ascii?Q?m4K0oQvjoTo+PABFQ+Wrlu1HJIWGOEFMk+gsO0G6LEvayBZ+lwmBexbilSbU?=
 =?us-ascii?Q?Femsep9k3UWmt4sKWGCyFrEsFjoNGq60DbD6v04TkBjhG92y6GKhwDjrmjlg?=
 =?us-ascii?Q?V1LL9uFMLfnhvQYsT54AOG1eULm7+9ujM6x8UwZyX2qHhgNLzjWXXZdrqhpp?=
 =?us-ascii?Q?fK/osOfd3fW7Cu3k2ieaWCMmlrBit9Xls+3wV3Ns9tZhWCYrPDUd5jkC7oDy?=
 =?us-ascii?Q?IKh0s6C84XO77CWKjXbpbSkOO1LD17r5Zk1lrmJCNbiTTPPbYDtdLmeP9xNx?=
 =?us-ascii?Q?/r7lA6wIm8sPEeFiSLLeMNDNu9OwRgvmo0OVLG+wJwcQY5JPdu5quQesq9ZX?=
 =?us-ascii?Q?uqdCKv2Do3k3oLrhXtDzkpyrtMBs32b+zmWaWrCr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc91a19f-f44c-4431-70d7-08ddf5c94938
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 09:05:02.3517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SejyXM1oPZ7KxcGLSHcw4aYXPFHBmrr1FCQyzSk3x/2m1Ub8CxVHaK49rqvkfVNflQht5o29GY5nDq9wdF85oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7387

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

 drivers/gpio/Kconfig           |   9 +++
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-qixis-fpga.c | 107 +++++++++++++++++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 drivers/gpio/gpio-qixis-fpga.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 81fe3b085f7b..e963a7ee4ce1 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1962,6 +1962,15 @@ config GPIO_LATCH
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
index b1593ce92ebe..850c0e086c82 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -144,6 +144,7 @@ obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
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


