Return-Path: <linux-gpio+bounces-26163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4A0B57AED
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 14:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56770162D22
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 12:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BF1307AE5;
	Mon, 15 Sep 2025 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KWx1UJdq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7207530F55C;
	Mon, 15 Sep 2025 12:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757939108; cv=fail; b=YLu4NcmPxXRQ8Sdz9WA1yyVWZd+W3ZIcE84aCc+JrU87SLTmnVj6Rd1DWP6kyUVA8XANLx9tJYTGyOgYpTu3FSG9aTic1/dhEruODu6T1lpdbcc2JhE+8UtavZ5fzuHJfLuDN6CldKk/vLKKUeRRPTyIqVuFtfxB1b54c/KkA7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757939108; c=relaxed/simple;
	bh=ufAP7SN/Balu6a/rcjrqGe0x/zZgmGCUxLfe6cYFhuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ec6y31F+bCfmGFjKC57QsaUM/hRGHWao/YZmuSt0a44OugWV7NLOA7sHVLhC0XIGNdssCWXdD89SzBDGcOxkRJAjDqlMMp3QFUfO2KVolGHldidOzJtptSbVTCc1MoiXIXhtKPIo4kc8X9Jmbt7IdUOQgGqfEgPYj+5fe7gidyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KWx1UJdq; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7NjoDRT0jNR04Oztkc2VugZJxPKLqCLfYAybWudiZfQIKDPgr9Qv97ti6o3tPeTSgUsyzwGmup/eDjmHWu7xI3WW8Drk8eNrbUIXGKswbYC1s5pnmkQqBj56JzfH4yhYQIjRMLdP0rj1U0sxzz+aOautJYWPM4IVTt26cDhzfnbMKaWU1ywZikKGhe8GkwbcO1j2VUyjyOJttkMIXJ4czFoQorf0ZkiUQB0POJk2/ZFTTUQOOm3vB+yS9KQ9e1Q8wOlreRqByZnVW7+sIK+KqUwEdiDE+LoEbhJTpCg2QYYZpHVvOyvGBf9NAjw5s7ZKHVREt4cLrZrK3PED4O+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTdTD3jAFDtRgp7Admw2eE6/r/wNa/19LLy2SujxGVk=;
 b=VkIN8xwwVRnXOhyrY5k7P1ZOHrJlCmojZfLBhvWM4DcAGXFokKwanYM49fZYhZZhrN/z6JDui/jO3hnlQ7zOZMIJad35oQmLdIHCDytMF6h9ESybWUfp8nQQGuacBZ+ru0FnowERNhRXsgCtH2Xx66JTDMDd4490NcFDb+Kk8l59F7Zbl12jGZzni3MSgvtaXZb8cTjECMY7+J90KdX2pp7I97waOFvKkHg0ULS5pognTwITHy+Tem1VpLl5FgbX9cXeBc51zmJV7wOpAizbiUjyGeb7TH26U1yGOKt3e55OhTYlrAKlFoghCOwvZJ8ADMcItKATi0UysN5cgAeRmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTdTD3jAFDtRgp7Admw2eE6/r/wNa/19LLy2SujxGVk=;
 b=KWx1UJdqn7qFsNPDX23IhiFQgzoKSA07aGtF7T6aAzhN8g9a9ysLGIE+IQUV4FAQq3ZQm+WbonB+N/XTY8J04l4DAArpKx9D2FQZA6Z1fZsf2mf61hfxNn0Lqd8wLUqZcsBtgqCZgJsxOSYeXJPFMfWev2jre0GNVU0f6Q7Drota6QFAP8LcIGFmcUFfJuaRWpgLz4L+cRy+laqCMX7r3piEmClIBLwi/Hj3OI9pQoCVnYix8mN6mpcnzWGY9QJ1Xh1hq7KE6e6J1MlC7YZeUXuvGpvXAm1OjE2HAEQUw2kS+LtPmX/39nvFpyOCvNMFVyVqMagV1/QAEDiVQ34nOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by VI1PR04MB6974.eurprd04.prod.outlook.com (2603:10a6:803:133::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 12:24:59 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 12:24:59 +0000
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
Subject: [PATCH v2 6/9] arm64: dts: lx2160a-rdb: describe the QIXIS FPGA and two child GPIO controllers
Date: Mon, 15 Sep 2025 15:23:51 +0300
Message-Id: <20250915122354.217720-7-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915122354.217720-1-ioana.ciornei@nxp.com>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0021.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::31) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|VI1PR04MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1a8cf6-f62e-412b-c1d9-08ddf452e2fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B5m9vwzFo9DNBFjxnfnyLbMAOrQYyX6MwVUgZJM/YOGVt8A6DmEQouJObWtm?=
 =?us-ascii?Q?ipiLxOeFMCHXpphdlGmAHE5WTM2kOyWihGk/cC9EMCTb7arvh3XZlo3FtfgF?=
 =?us-ascii?Q?SMcnfC0ah7epBSfBrFj6U26EqDPfmUwQkv70Zj+85VxbtU30rZ5xUtVya1Bq?=
 =?us-ascii?Q?K4F1NyjeuffHCCKlElX8hcB6IRfdabhrv9jjPQMzp+agLwyUAesd+7ZrYgQ9?=
 =?us-ascii?Q?Nqgxj+25i8A6nUtgPNw4NswbUQMGEnwavKV6L+AjKaU0AORuKHN1v7Mi6gM/?=
 =?us-ascii?Q?z8cR8H3OYe5VwyQE5pMn0vIt4F3UXltLDAESiI+qBYmZNfzaPqcm3cXmHlYW?=
 =?us-ascii?Q?7ysAdgz/zLacroW2kSN754U7Y5huqfi9ChtKa2PibXsMO8QsKv1IMAgCx8oK?=
 =?us-ascii?Q?U4ZhwBKuEUHjb9ac6myUdq52rl8Ny/nDo6xDRcngdQS8nxHJx6iR8i0RTsxb?=
 =?us-ascii?Q?7FvAjhBHF/TayktI6dUnJOiNB7OuxRQy68aIkLaUFbNGj8dT2qTuXA7fvSU7?=
 =?us-ascii?Q?IrdJXZLvyyQpnfG5GXlfe0B54F9BVdXU7kr60W3aeTetcPq0x5HkNdGywuyp?=
 =?us-ascii?Q?BjWploKugDgbe+oXkccB6u6cYJvgRVfTyITo2CPPipQMaYqSyUGcrZToXn8s?=
 =?us-ascii?Q?YDTTKs4aD8zpGnhTJ4zHq49EZPdxSzj6zmKRjnIsM2vgg1dsg+8O22//ltio?=
 =?us-ascii?Q?QXtjbIUC22aAhdlDL+Z/iQm4YJP/72Po+6YILQZ9NtE4jOP95enRnYf4lSR+?=
 =?us-ascii?Q?l6CVWjIi+3ue+QtRUG7wD9GQSlacRPl7siQ4mUDtPN1kBRbRZEWSBBVIQvwB?=
 =?us-ascii?Q?eLtQP4vI7ORzBvirU9UAP3jpjl94IsM0Z33dN6NS4ISDyd8r/dewpJp4taWc?=
 =?us-ascii?Q?6K/0ir9Ghd3LyIoa/rIj2XVE3V6NPI8NuaWwEsfCt1yJfGymb0wETi6PACKJ?=
 =?us-ascii?Q?L5eSOqnaQ4yBeA2DkjxjCm5yabIm4eQIloyK+uU1r2TATRQTFmN51gea+Mr3?=
 =?us-ascii?Q?kvn5/wAHFC0f02192jZUegcTYTDpsbweGG7Rpx83A3AShmzcWeaTVSv+P+/6?=
 =?us-ascii?Q?g27sidzb4YTn8KMF6OAAiChkge2eTUFYYipBIHeN+gQ367di4MTAnVweHsqN?=
 =?us-ascii?Q?rw6KRXA8Ni7v34Kg1KY1GSWxmYd+lFaabtGovIidz466PGgUWmZGE2MJ00Y3?=
 =?us-ascii?Q?O1hdazzX+LCU2z4jz3ysj5Qwws1JpVtkrsRhvyzatE8sjFNDIqJZhPF6cmnG?=
 =?us-ascii?Q?8O4a4X5XUuV4XFVpCaLWde+K0Gna8Y6sxdwLIZ3OrYOiHLXutLpOQtvSWExh?=
 =?us-ascii?Q?JCtwwNJ6OyI162dJY1f4KxzflJ1Jn7sCve/iHenfHMtE9FaaKmchcdyTLitU?=
 =?us-ascii?Q?7FCJodiiHRth9h1HmgsqhW1WthHht3zQpDVbKgv3n2D2FGuEy4C4w2FH6umv?=
 =?us-ascii?Q?EpPodeM+m2ranaVNnuIIlb5ZXFpx4BtfD9/Q8RROacPixLDkZ4pH3w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rfhNVQxM5K8d8ao7vIz45cXIigL8XuSzgAMfaMCzPqGr2G1G6QjooQpsfeGb?=
 =?us-ascii?Q?FHfUFNGV++dDTWQ27DIhUa2nz9h3mqHUWoF+SD1VxGnsJYAdcLVCdWx+TLit?=
 =?us-ascii?Q?8QvSaVlYvN8neBfJpQqSTxn94nOoHP0dOwZVEHf8ET+859Es8s1EelXhDTF/?=
 =?us-ascii?Q?YmE4Qtdlh/l2/dTh1hTNvm+DZgq44+2dX0guWmMQvbhpZtmAG1BnRxybga6Q?=
 =?us-ascii?Q?XVdGjOMihRlwytjbj347UNRIEJ/eGcNNTrm6MgC5LGY3tbmxgx5pcsXbPQfT?=
 =?us-ascii?Q?p2gu0KiK1fSIxivqAtloURfM0LEyRIc89+aVxXOKFOBsLukybY1PEBL1p5Xk?=
 =?us-ascii?Q?7pJ6LS+ejbR8geTf1FKk+m2fsOw0HALm9gyGkox3u9dPuFOFOBpqKHAFA75a?=
 =?us-ascii?Q?yooduIxImrVFOla2Wl09ocI19OGnZ3HpDWC5USeYKgw2TUahdhjhT33OPBng?=
 =?us-ascii?Q?WQk+nrVvgiOly3k372Q7iX2r33GbBXauNg0VDMKFFW8Kzsctkbc6Aq66eA3l?=
 =?us-ascii?Q?7gIrRE2aXHoQmqB4/MnZRkR8QODXae09LEPjiuFWmmPaavo/XOcx7e2TsH8B?=
 =?us-ascii?Q?cmfw4jd81rkl5oR5Vmq7iB3ZpitFKAPxPpxUcv7THy9y+lFCYu55K2NuvQDd?=
 =?us-ascii?Q?zpKEOTM5bYFGh3TiPj491bbvA9mfpZTgi/j6sWoxzwQyVmP+VV3qs9xeFPx9?=
 =?us-ascii?Q?g9EiJ2IuSXm3YjWbkRSZ4F51+I88G2GB2F1u3/OB8DBYrJkdnwzWZbjxGmSj?=
 =?us-ascii?Q?4Z0IrxGeXGo8BxHg5/T9nnwbK/UmQIZP2guI+KtMnm2R5NuKpVFutOri/NB6?=
 =?us-ascii?Q?0JVaipC51g6ZBDrr1KbtwhHf762/Rr4pMEbEY8MIA8DXLxkaFO2YIXW+3MGz?=
 =?us-ascii?Q?fXYP2CExoKkAEk8KNYxIqJQdlp2K4nmNFHk9Fgbc/oG5u9rAkWI/sZJBN7cd?=
 =?us-ascii?Q?2JmT91JT1iUkBrgGvBoKSOsu3DDHmc6dwCospMnz566P9uP729/Q9JSnS3RN?=
 =?us-ascii?Q?sWiJKQH71xIoPDCX/qzaR1DgxqIyr2OndQF37ife9FoV6eJWbgPPSndOh1du?=
 =?us-ascii?Q?xZIWt0vxKxVc74qbuDQvzJ5WQ/PT5w5g2nALy7doN1V+2MhCNdkjqo8PCMSF?=
 =?us-ascii?Q?Y0+nIdGtojtWX4L4v2RYsEHm/UnoXnItAaAFAw/+quIaZhb1NVlDK095KQcO?=
 =?us-ascii?Q?pkaILCifQFuX7DjXhjIE5KrCZ2ZzNVKh2jiojaLsq+9pJYFZE9ckEV1CwCSo?=
 =?us-ascii?Q?Hm4CjUZA+iBlJ6P0pxmyPHCan4EEY9/awBCKuAYzhUmWjPZrJp+xz+f++Xgq?=
 =?us-ascii?Q?6+ZBZ0/+GlToNdNOxLcA3hkAYyJEdE4/6Z7O7MozmJL/SZtoz1J41cLWnkYO?=
 =?us-ascii?Q?lZ3NixUgGemI2xwaa9aAJqreIr8FHhDIPHI76j398rAOKgCjsVWzW91LFrwR?=
 =?us-ascii?Q?f1zLcncT6U7TonBVZhixsXTx0IYs8+B01JomP8vyVtGZt6+ItDwZ02b9IlCC?=
 =?us-ascii?Q?wpCc+WBb10avA7egY8X/qOwmYoYWt8a32HpNcKvyzvYegP2h1wHP4yf+HduV?=
 =?us-ascii?Q?HybX/bFQ+arEBg4uKi/FMsZyVtRUbotqg90MaKjN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1a8cf6-f62e-412b-c1d9-08ddf452e2fe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 12:24:59.1045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kvxo0QcIypzUQtM3q8z3j7/JAj6no/VWmvvgZE56rPh6V5V3A0/wICmzn7edvIGfZL00bvMdCDggOhF1ojHMUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6974

Describe the FPGA present on the LX2160ARDB board as a simple-mfd I2C
device. The FPGA presents registers that deal with power-on-reset
timing, muxing, SFP cage monitoring and control etc.

Also add the two GPIO controllers responsible for monitoring and
controlling the SFP+ cages used for MAC5 and MAC6.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- Use the same compatible string for both GPIO controller nodes.

 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
index 0c44b3cbef77..4ede1295f29d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
@@ -170,6 +170,37 @@ mt35xu512aba1: flash@1 {
 &i2c0 {
 	status = "okay";
 
+	cpld@66 {
+		compatible = "fsl,lx2160ardb-fpga";
+		reg = <0x66>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sfp2_csr: gpio@19 {
+			compatible = "fsl,lx2160ardb-fpga-gpio-sfp";
+			reg = <0x19>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names =
+				"SFP2_TX_EN", "",
+				"", "",
+				"SFP2_RX_LOS", "SFP2_TX_FAULT",
+				"", "SFP2_MOD_ABS";
+		};
+
+		sfp3_csr: gpio@1a {
+			compatible = "fsl,lx2160ardb-fpga-gpio-sfp";
+			reg = <0x1a>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-line-names =
+				"SFP3_TX_EN", "",
+				"", "",
+				"SFP3_RX_LOS", "SFP3_TX_FAULT",
+				"", "SFP3_MOD_ABS";
+		};
+	};
+
 	i2c-mux@77 {
 		compatible = "nxp,pca9547";
 		reg = <0x77>;
-- 
2.25.1


