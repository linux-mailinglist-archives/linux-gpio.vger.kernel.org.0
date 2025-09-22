Return-Path: <linux-gpio+bounces-26469-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C20B91ADF
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABDD57AA100
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BE225C81E;
	Mon, 22 Sep 2025 14:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aoq/7BnE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEB1258CFA;
	Mon, 22 Sep 2025 14:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551100; cv=fail; b=AJXL2ara/mj7n8lf8owwwTWDjCxjS2JebPIWMvxQSIQN0RvuR6NmSsVWNFSOmdz4R0UyMlLr1CROvlnvVHs+C63oEOm25rC019PrWMLULjh9j/cxIP1iq9BpkFaNJfw1J8iv7BAfgCgob1mipnUIkInN4hP/zpxBnPZrScVD1zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551100; c=relaxed/simple;
	bh=vbg2mgA93XraEftrzv9mRRD130eFRB3AKiYH+/MrMJE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ra9XvMzmwh6O14+X4YeiP36qLrt0nOjPoOiG1DRGsQ2e28oxHJdpUv/aFrTQ3dgLIkCYZiN05u1Hwt3wVXSbJJJ8Our3bgazTcMDkMCuK0Xqft8tayC2N+lVeTpenY45wS7Unt06mEKLxIRbnSWqI2g4AkhlaKqVeCrhCSMf7OM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aoq/7BnE; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkEZUTHyclx2OkQ/aDip1Ut3RAWnAMzGlCdVFy4Drc1XOk1z2aTkiXwimtJ7OitIDOvKhf9qDRCrNE0Fuml1M2bTWvC3JMJYpoAJKe6u5OLCTFTGiXEwb5gX3fdeUbvhhmPk3pLQ27Hl0TPChqV4pHxIbDHx0u/4196t+0FNzK/nfELx7EwFrhn/ukuPBZuEgf8lKscBWcyFF+CzEwqzR6EA+D6hzNEK0/zGWPYVem5tr6H4mwQ1lrJPvcRZGgHMNcyDh+zaltzO1X8QqCpTCGANaWTy1MmkDHHya8SgOSBaQYDRD1I4puujuk7PKOA3edb7bNLDiBBmn0PRDMwnvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3ZsvNN8Qpr4ThHt4PmSG1A8P6GmnjGSEjZe+eJUmmY=;
 b=NvUorjrpNWndva/8hKBN462SqK9vn7goakfcDfV2A8Ps2rGHCaPKhtonw9+48sDd2kcliCvxHqEs960Lee8WN+zaXCxfWTY1iP+is7VGdC197zgaeaTAQzx+tXzmvoVrw1knMVB6j/Bx+4EdkiQg9usZ48XjkKkFMSTBdXVb3fHobgJnXBTNg62mhylwElm2Q1v8VdiqUX0nId5u5keKreGYXKaVIl1zQ32rdG9IrbS5RpRDaxC/u/kXbBAYip9RBLJNDTEzjXsTWaMYbscJwgb1OCUV2VG9QLpl620fdy4YDTT+GDgTqrDWz6nwQ3KQJmGLuq17XIr2MUF1ZZmb6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3ZsvNN8Qpr4ThHt4PmSG1A8P6GmnjGSEjZe+eJUmmY=;
 b=aoq/7BnEfglWX4wF4yWqRBQF4QJLZaCjO6M/kQK60qUZufQLzuoFzaMcunOe4IFYMD1zx2alutZbjPL5uJz3zHR6XNW6kAmrE1YEBqjYqt7H0APY/xGN593/8TiAPOYFUhkg3aSeRqG3FJh6DlgRvlGoTJ5pEZ/FYXaeAKNo176qJCH3kJCDh8IDCf9OgZ6xn0SpnHwU8g/yExzF7pFTnxS6uDJt2OCwm6VTLtB0LVkh9Sa2WmSKKUZdwQ98+JNAullc6+omF78/hNy8K2K3MNm3SAsvwi3W+iFdu1ogenimgcJndIf0sAgUGcRJBnV8N9dJrwTHPxJjz71+G12RNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBAPR04MB7207.eurprd04.prod.outlook.com (2603:10a6:10:1b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 14:24:53 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 14:24:53 +0000
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
Subject: [PATCH v5 08/12] gpio: add QIXIS FPGA GPIO controller
Date: Mon, 22 Sep 2025 17:24:23 +0300
Message-Id: <20250922142427.3310221-9-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0039.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::16) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBAPR04MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1eaae3-e1df-4d3f-c615-08ddf9e3cbf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DMemuYW/RJVI4jE6XgaeRnZ35uzXtuJTwImi/qyLb04N89R/OmeYAYAGUltQ?=
 =?us-ascii?Q?t1lht3NUv4mSbHwr7pnnl99TL7XMX3K98832oRQ791aFBJHUY6DewVxryDsh?=
 =?us-ascii?Q?fcP6ZPcRf578d7KPs0hVxR9UIFM59TsbqrDgJoWULzLFRqjf50EU+b8kRxK6?=
 =?us-ascii?Q?WDNqVYRm19UKFmYywXWhrn7RG3ScqD+G1zHBI5cwfd4B6Kko7O1igRsKNzAf?=
 =?us-ascii?Q?AjWck006eYkAliuGgwpRn2W08k80wSZAzGpMrcarwIA+paBmcFh3yPcI3mYl?=
 =?us-ascii?Q?Mhen10oDmvRbj5TXuompkUgQ3i3fK/qEbQL21gbyHFhFQo6Qy35NW6FFf49Z?=
 =?us-ascii?Q?JGldvf6LlhIVSKJ7fC8LV7gWZaLF13iWxB7Mq0O9rer+nK9Gi4C1+x2RUqyT?=
 =?us-ascii?Q?Ycwqk+eTWEK7l0KJfGY4Jpqmm6mw6qLI5w7prg3u7xv4wbpMFJxNs680GH8L?=
 =?us-ascii?Q?trQA9u8ViFfbfxY1CkBwJOL/vd3a7H6CLWli7waammwm+g/4P0wtMdVWc+UE?=
 =?us-ascii?Q?DCRE4JSew1tcPV+Az8rlrLWp/AM47WX3vBIRzUJCKLJX94IRHOrfkMdqvDeR?=
 =?us-ascii?Q?hXdk6MIG87OYQuBfZJPNKCZGJPfdO3DB5PSGURaoulpjLMt9X2D1NZHTJCyM?=
 =?us-ascii?Q?ELsWaXWxj2jHD96UwgR348bLMZjed40p3zA0bXXsj/zfk/8mMGlitb+BeZMN?=
 =?us-ascii?Q?RegCvMaFNUeCwdSuUbhKPk9aRvqHtEwA2XHzuhXHtX9ZVkeftouHH26thN6F?=
 =?us-ascii?Q?KWzIthUlfLeuIsGZT/M1IGc1oWwbCftOFklGT7/Blt5WfZAQiMm9QLLMTNSR?=
 =?us-ascii?Q?fwYLEXhBAWJDMrjToy/iqq2KmY5OY2MMnrc4CXNlx5MNv1X+bJo7rDQ/4N4C?=
 =?us-ascii?Q?Q13tsWhF4F2peTX7Dggx7wHmXn/iw/qUqIlSFOH0ItTQnWAa1DC+vipgCS0N?=
 =?us-ascii?Q?Rrr98ffH7HdBSCIKZJ7xITcz8gZb1lt696DfzoKxCx1WFrHMkDsLyzLwnfrs?=
 =?us-ascii?Q?yHV1AAP2at92CtLWZ2rKs9ndVJp4eJ9KVwDRSogXz246ckx0v6LNLHNtkpBq?=
 =?us-ascii?Q?vbhIYUQhVZWOoyD4JrgDSIP9RwOxtVfhlRPPhsKWqkxAPT+HF6IlXQmKus2R?=
 =?us-ascii?Q?rjsWYVPNdCBlsQzW7+vYEa7RvoLSvcRBRIYbb/W5fOVbC5bisJUMKvOFKomM?=
 =?us-ascii?Q?olI3QH8svzIS85qZOQZ+UD3/+geFH/W3pcRyQfcK2uryMuTlJyHbpYULzqeV?=
 =?us-ascii?Q?Y3AjT24cVouP/IOxUXY9uUth9vBjMHho2gE/wQGSJf+2CILrnZovpt2LeStm?=
 =?us-ascii?Q?uQU86THErHjDXkGbrnVrWRagbx/n2LYU72uhoRlZDomO/Y+YqdFQqVQcxp9E?=
 =?us-ascii?Q?FNydjv1TB/TMj7x6LKYlDswnIpv315c44y0ibKO1+EjLeaJs2YXaklx1DMGu?=
 =?us-ascii?Q?tnxY3VobBfNeuMSmZ/ijq0JHcTLWxBQF9dvWxcA9h2BB4ECcKCGhPQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pCQGaEmxQC6T7OHIxkL3ajTFUOwb1C+ySvpVWQDPVfVvNwOGerYIW5XoNYuq?=
 =?us-ascii?Q?vXhjvlQvyKRKisIiHjUvdamn1yfnCofzKeukN4iuA9FR94H4fKgCBQfhrIW3?=
 =?us-ascii?Q?2ITRkPKLz6ELCYo/kenAkrQRwHQwjGis9Eykpogt6xwsu8zKov3sB+ZnNu+c?=
 =?us-ascii?Q?3A/RAkYpE6jX3FXG9vuKmW/YxS9AdPSAt200te0VpjumBAeYTejcrzE3/6C6?=
 =?us-ascii?Q?jux4OeAeWsNlHBcq8RUABNeh+qmroz8yM7TSFPirP7wXfb9a8718dXNvOoEg?=
 =?us-ascii?Q?YKMHz3iSA39MJ6sQ5+Qnm5xN6OJ2MExqnV+tQdGEdXBgdTko+2110wB/wvoi?=
 =?us-ascii?Q?4oBKnho05KHcyxktPGtjwvGvQdFa05/nSpuPfHc1vvUiTfzT/LxQkg3jWiBa?=
 =?us-ascii?Q?vBMOUM1zPhh7KnuLDmqJNfGd/QLquXbp9adHx5l+cI3DgbY4J6tzFL6u+o+Z?=
 =?us-ascii?Q?W4kCxMLt68GdtUFpdfyojn7Bz11l9ksnpvdtY/CssGHU52LSDs8wqC+dl1Gn?=
 =?us-ascii?Q?f2B5NCi2E2QNTjAZk3vR6UNtHN8rbWHNEW4gsMQUXMDgXF0kmsceCzzahTZd?=
 =?us-ascii?Q?egumxqPZGZ7iIutoQZhdUfo/A9YKOpuhMtT2t+knfHHbm0ESh2RIXqdgO7un?=
 =?us-ascii?Q?gV1dc+E2h5ia2vgbVuuJj7DHsOX+O6pQ1Q3jIoLnEbH7FeoWPtMImZ/wG/HL?=
 =?us-ascii?Q?sQLX1bs4xS8Valp5eWAnBPrQiI8i69c3Q8bHgYWxioEDFqpIilvJqRJOSMrV?=
 =?us-ascii?Q?VMHicYbTJtWfsHBJzBhEOJ2P0YWjnQhV6qHqgSOLxHokb+3y0CgfjELj73hS?=
 =?us-ascii?Q?JMnRbSOvjG53lzY0sV1bVQHuM8zu8+GGw9C4QezXgLHsvr4XqXnDPI2e/ox1?=
 =?us-ascii?Q?ZDof3y3o647MLwjuD87qeMAs5nXzv/J9odRKgOop7Fnhq3tS0vMDC8xXgzva?=
 =?us-ascii?Q?OGaOaZv6ZbMaVYXWmo4wHtmT5SN64voRL4Oj0HlCSW7VUf9rZe0R+iflHhZ/?=
 =?us-ascii?Q?lVcv90pzelmRDdppuUZ4PusaJP/fNVcy2IePR1eUJuki7M4U1QDPvVIgwxH0?=
 =?us-ascii?Q?T5ooRTiPsHJ/GZcXFP9+6vkPSsuHIGNhDbR0vmQ0euuSbWMZKSgmTzlBxcC6?=
 =?us-ascii?Q?J2tMpFSShdrf/TRRNN8aPDLBmJ8TXSeuAcs6sq1OKZe01iiO1uZe/eyDxapI?=
 =?us-ascii?Q?oYNJWBxEZPVsVEOiGGfQBy/enlpDEEhIv/hbDrgKJQuoMQwERkcXKIHjgvDJ?=
 =?us-ascii?Q?vfUH6QjVME1i6BzSCgsD0paUcKdc76dM2jTFhVH7qR7PnD+1VoR5bDAF9E9R?=
 =?us-ascii?Q?zmB1iopWdRU8SBJIR7F06WigmZSH1CsUH9Yhz/2LX8wtnKLOHVaHuiFe+gNC?=
 =?us-ascii?Q?KQG8Wpw4W0Uyke70qeHFqBZ85e2EivCS6litU+1JEeSAXwuaCR76LRMD72AA?=
 =?us-ascii?Q?mgSHLtQdFMwmGz3fUWDafPjtwHB68WRRJMg8Wnd+fpKEnkjyWRIVR/0hjLLt?=
 =?us-ascii?Q?Thj9nl3m7SUvsXa2AYUirmcdOTnSyDu2vs624fP7ZtLCFtaFuAHDfsTHap1Z?=
 =?us-ascii?Q?Jrc7OjWTW7u5eN+s/k/0/cgRIJ6iRX3PJD5KaINx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1eaae3-e1df-4d3f-c615-08ddf9e3cbf7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:24:53.3305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBIf7H5ggCPbhTuy0N7cQJQscMQPhL5b/DwIjz9vP/0GasRNk3LkzL9lUHKIG3YzT1TDMEOxsW6bs/+id/QfrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7207

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

 drivers/gpio/Kconfig           |   9 +++
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-qixis-fpga.c | 107 +++++++++++++++++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 drivers/gpio/gpio-qixis-fpga.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 7ee3afbc2b05..c9f18ef3cc3d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1986,6 +1986,15 @@ config GPIO_LATCH
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


