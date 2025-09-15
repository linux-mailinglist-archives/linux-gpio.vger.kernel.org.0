Return-Path: <linux-gpio+bounces-26166-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F4FB57AF1
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 14:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AB761645CF
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 12:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE6131326C;
	Mon, 15 Sep 2025 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CElItF9H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E66312824;
	Mon, 15 Sep 2025 12:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757939114; cv=fail; b=WI+epcigtsEMSdjPjcGmre25Td2bvSC2WosuwXywmqcPgXvdNM9mh4D6/71XcSUcp4IJhYY62Nb6f8291Tay+CTUQTtue2OtsN8zX7xNYekIZBjdDJVNzKGgwoo4sT3Ip5bGeevM+X0T5wOD3qlumCwzqdGecseyxmNoRrghcaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757939114; c=relaxed/simple;
	bh=HZAmtYN9bdoW/cCRLT8vwA45wWTg4hhZ4+5JV9P8gCY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WhKQK/KTnuDRYiBDRbf/j7le89I8MA6SwHnpjkn7B950IU8XPqex2U22W/pTuiUot7KNv1kE6iAENMRXpI4jkA3J+ZDIoXwukq8BRCIgLw1oGy5HGwHuRoxpgTWAZIcmOuVDMdCpsjotG55uuk4wNBc0PFRU/jwTWuyU5tUs+sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CElItF9H; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tW8/kJb4NNxTRzP7ZDZgWfodhMS2ebCR3vu5NFA/U7+/eN4+xNOuq6SXYQRG6tu58HgCgwT9qnT6lvIKXTzOkDpmbxWI4InQTcQWmbbBPaYiR8fgMKPyqIUPjLYJSm1lqg2k40/Moh9P0t181DZN2E09XXKpz7/toJUrfIu9IF8QSl0hlLm/gQv7B2fsC8L5904xytOZrO+EOWk6YvL/jT2tADKfTog2NKjgrOY6eSW5VbvwESBRl1TLBnf0LVjjN7gPp3ionyWeKjz/2vP1HeqyZDWUnetOMLsoyStumsYLy+ja3u883hh3nEalmSXDL/7jd4rVt8EWdsJFCUHpFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKqsw5LABAeb60Otvuvb7wqbNjYlhWMYtX1+WU0aTF8=;
 b=Ll78l1xxV86GDHezfvNCdbKatCYqT4gNn6fFQbYwIQfrA4jAfy5eN3scLMN0v6Ot7Mrwys+xqfTRBDjjR/LOo9pUz0oMRZOvbgf/3Tke1dpoEjI1Z8dllQWj5AI9sez0wKIZLh6i3EUmE12G0w3sIBY4POmvbcjK5KGC081Hf3476RD1FNEhEBocSRc3Yp8CEjDkJtS3W32oFGnqZ1nl0Phrw1LWduLREjl/8jlswzPT5//rmbzpSzsF8lBmCfpLKEoEKT9ZzovSU+rEwMLSB8Wfw5znvnsWk4j1PkHFC96oSRGicMAl2QZcG+SUnSoIm+QffOb+aQF1G0yiQ87pNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKqsw5LABAeb60Otvuvb7wqbNjYlhWMYtX1+WU0aTF8=;
 b=CElItF9HxtHKYLHEZUMI5y1XHupC7gc7uTl1EnhuJtUnA87ezyVvluktWqhCsGgRLTBmIIO83oX95vMqqfb92GyOslzP/LzDA4XwOFf7O5Cq3KykmkWhdzC6cy42sReqvVJNhzVntal+rSanZgWKp87UIct0hwvsrG6Tv8x7kxiXBeIYWTfE386Itk6HinIx1APhYByBPdloG4JCnaXwNFcV9o1JZ+C31GPsvVPaSp6U8n44Vf1aq605L1JzmUYBjxiCBLtg9UigmjnJ22LCUqT7uDSQ5cs6kVZmWog1bGnuNVJyNqXYaPuy0ypVv/VKXyW3UXYjA/gxeVKJ6V0yfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by VI1PR04MB6974.eurprd04.prod.outlook.com (2603:10a6:803:133::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 12:25:05 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 12:25:05 +0000
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
Subject: [PATCH v2 9/9] arm64: dts: ls1046a-qds: describe the two on-board SFP+ cages
Date: Mon, 15 Sep 2025 15:23:54 +0300
Message-Id: <20250915122354.217720-10-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915122354.217720-1-ioana.ciornei@nxp.com>
References: <20250915122354.217720-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0001.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::11) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|VI1PR04MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d644d68-55be-416a-e4b7-08ddf452e6b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EEXmWDQ0h4/lIF2N1W4bwHtmem+sjsL2031FFCwR2M0BWSq1s8BCHvMLMt1A?=
 =?us-ascii?Q?plNNFj4getCGcXgOQdBde6+UGOZKx/baSlsGZ/Botuz3qHE1eNAFRx+iZ+mj?=
 =?us-ascii?Q?+2Iy1JtnX0Mzfk0p8r/GNxqrmImT4T5zypROLVlI08tXpref3UDKSxOnTF8m?=
 =?us-ascii?Q?nZFeNrlf3T0cG057CfsE2gB++Gsfd8+6xAzHemYzTnmTptx1eFKa6M6tSacs?=
 =?us-ascii?Q?DZuFacd1NYBQ/PZNFctblf5ea9shNWzeg/FbS4hVOVPisuZmXBGKZ+UQ0tHN?=
 =?us-ascii?Q?FeXFLVioy8VkxU1voLUA4sUM3q/FBGOSS6Hv3wVOWB/bUkKfDKTiPPIT0FVM?=
 =?us-ascii?Q?Si4HqABiGeKoASbyqPta3LqWQeURT26QnJ4LsxU4LXp1M1Pez7l+LCuO+MBe?=
 =?us-ascii?Q?PgLeNp/ThplDkG6eQzy+Gr78vVHrUMGdKiea8d/YsFTUUe0mbfDhLAdmNuhU?=
 =?us-ascii?Q?50ITx0LpIvwL/kZeBMa3SwkUtVKoNm3Ea73QIvipn53yMRDuCW19ySdOsL6T?=
 =?us-ascii?Q?Gpxl4zfQvj5pi7oAD7FyyqDqJO3gFKmSm/UTK2t1iBO3Np71LkPFhcNi+qA3?=
 =?us-ascii?Q?xB2Uav/aBu60tjPczj/nKq54BPYIf8Gvw0zCCOWzjRI8Ztq5cquatLAorK6p?=
 =?us-ascii?Q?LqanpJl++sqnB6+SqVTMDGwo55gjVYtCNH7etcHc2FsSxvF2GML5QyxeHjny?=
 =?us-ascii?Q?bjnP5QEs6i8T2O7/nR8PgJrNm+7fXJINFStJwh/Bmu04ck0htmo79KVWMWQO?=
 =?us-ascii?Q?1e9RFWSns2C+/kHqMpLxpZyG4qz7328EyvhiBOMkGREwkQsrR7giVbjpR95L?=
 =?us-ascii?Q?OV5vmUVAO+FAxHl9LKX0D/bSCVmj3rsQ5EQ0eb9qXADnTm8qORIolJZB5XI8?=
 =?us-ascii?Q?sYHv1kAliJwTjITbIlaZD15HqF59a+k6yfol2F5YjD7eVYqVl3YEE+3tDGKk?=
 =?us-ascii?Q?uwxe+H1OWP8veNa9w8xWbCFggXgqoSBewTPy3B0KmdXUDvC6BbBP5JgTI0Hj?=
 =?us-ascii?Q?OqYlRKOBRdrqllaax+4dqFAUJc9XFE+80WgBG97vLfUuHk+d2Y/t19IGEPiK?=
 =?us-ascii?Q?BL+FAugy53+Rgo5CN0Va/so+YAlxlYiQZ1kqgiGlJtDQv7uYjj/s+imUpJmX?=
 =?us-ascii?Q?kIVJPv9afE/piVu6iyIAJfcg9/jhKVx4sXGJ24HNDvldPJEjeGR6QGWqwzBN?=
 =?us-ascii?Q?U2rq+5DEHhgwyK35gtRUd2dLFnj2nuzBbWBBERohA03oYLS2ppSFVYT+mF0b?=
 =?us-ascii?Q?OAg3tG2UfwBz2xEP47Fthz5zMHLFuP2r0wXQeVaz4rZC4tefTE3Fi02v3ZRB?=
 =?us-ascii?Q?/DGiBoGzyvhmQ8gk7IT5jZUf8Hxd+Yy9jD36/Jj5Ah3srDFo6aycN+tVzlEa?=
 =?us-ascii?Q?LwYCB7dBgAgEtdJHFsPHU9d/VATvCOuyY+JqY6RFu2+8hxciqVFkPyZsukMc?=
 =?us-ascii?Q?kdtpfuaXi7mrK0oJo00CGWCDa/oeL2qzrSIoIqlniT/GaVTvXlf7TA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MG/bx4y6TS9os2IMOb8lu5kwCCVamYI/gTccCHJymt60PmBs20Cki/yn01xn?=
 =?us-ascii?Q?tyZxiKw6ICDdBgk3jwgArtWFimkgrPE3owSCF3Tuue42THlzfEKpdSnAFCPm?=
 =?us-ascii?Q?QxTAJW2kziAX5+HlgTPnMYAfSucsVaSnSXv2GUysPf8jjhr/06Ow8GW6uqno?=
 =?us-ascii?Q?3eCGJjYfTYR+kq84brtYk2ojZqiTDJXQO0pssz0upkGy1oSxCywNEFU6BhmS?=
 =?us-ascii?Q?Oz64NNsLDuC6pOWCk+y+tkeG7rR5r6Zutkc9rnfqpoAo+f9Hry6m9YufI6Nl?=
 =?us-ascii?Q?I8mx2qBKm2Vpxohu1Wps0oIKPlzT+wo2hk69bErIb6TJdls3CZGQn77DtSuN?=
 =?us-ascii?Q?k2U2qhhqQtvf3mrHSDMwcHa9hqbQisyNSatICRSPCf7T5cMJxQy/TBkfJtqI?=
 =?us-ascii?Q?tNJIlI+X0eWRLnWRuwNWYCjAV4BCaythWZB8oOpSVMOi3o0wGT9NTkcdaLqJ?=
 =?us-ascii?Q?R/5xhJonXLNla72oKse/GypKoUiz5ohis0XwGx3RJHYWSY0ItHzccSvFiSZZ?=
 =?us-ascii?Q?wHDixQBkutol12Aln00D2tnfH2bhfVogPjkW+EUJ2rwCBrBtsrwmXAcdObdY?=
 =?us-ascii?Q?Zs8L0uQjNHifuGhKHsdSB1zIsPxEgyOFneSVuMHF7XzpZ6r+9/oTO+tR9Qsm?=
 =?us-ascii?Q?E5TpSWL2tdi+FQjmwpqFQh9EiBSxxxgdx5ILpYABYftrl3J2LQFxnfUHUeRV?=
 =?us-ascii?Q?H10KAyY2c/xAtP1Tpl5V7MqgfKUKqh2XRbPJCEnEhrhgroJJFGMz7xpfvnsH?=
 =?us-ascii?Q?T+p9V3N0sFOh+lAW/4T/WPJvqNZo+0rBxEWhPOqpFIDRYfsVXccVLd4fBbLd?=
 =?us-ascii?Q?NNnOhStiuWvyE6vylSxt08cpCFkewRr9Tirp6kIxJrxK0ZHNb0r2kpzl6OEZ?=
 =?us-ascii?Q?hG0/z5OzeFnt5hXq8Q4oIUr7ecPktVjifLDVVKhwLLY2rWq1oVtFpHXOOyF0?=
 =?us-ascii?Q?z6KgXDjZfcg6zo1AN9DUoVB+OtycNwtJknGW2mcwXqwAE04htXOmQBDMBDLH?=
 =?us-ascii?Q?XD4xLTCjgKzoeKo2mVCrlxi3QOqp7GwSlzhnBE68Or1BDUvyHtDAh9ec3EIk?=
 =?us-ascii?Q?gZno3q+LGP6odiU2S4D8AubqUMumw3t2tFk+r8mLheZpYeFrzmQGYvWAo+IG?=
 =?us-ascii?Q?w1CnfJ/IAjdfTrmhbmXsflkbEIY2gSYkCGlRGj1qkFDlWEgFK6XHgZ8r6wwA?=
 =?us-ascii?Q?Agr8JgOOTQXCAYazQdpoQSWNko7hvD/+yIfwugIbB4/cqUF2ra0zWmZbYJ4w?=
 =?us-ascii?Q?JxsiC9hWR+LOnDXqcOG+du6rTCEy3WmNVqxBNz7+9Z6AiV1mutIQvxfrX0us?=
 =?us-ascii?Q?33xqJuUIwTSiLAU15k/hPaaGbSGLngEZ0rVzbzKIJDOJQ5u+TVkk6k2DJT+U?=
 =?us-ascii?Q?oQKMTXh0NBu9J16h/kuU0Un0BHvFDwiin88nL1hg+gpkmnat6Wh3lbhPx43D?=
 =?us-ascii?Q?O0VwGH6JSI/fjB7Q0IYr7lwa0Gq95Wjp/JvT85vb1FIEmJWA3QEzSudVd21X?=
 =?us-ascii?Q?M3izwqZSjeNvodQ1CfxYlh6Q8Fa+n9Hh8rSg/FhSlSLeTnpG5e/cUuHmt6rI?=
 =?us-ascii?Q?h/oDo5HB3ZY76bhBYm8HikAYrXV2Xs7rLe55LS1P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d644d68-55be-416a-e4b7-08ddf452e6b9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 12:25:05.5114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoEkt93VUTziAQA9Ag12ejlzhXF8DESKrFuICUXiM40hvJ23Q/3OMaEq37W3obt8pxj0MriPEa7duDPacc+YhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6974

Describe the two SFP+ cages present on the LS1046AQDS board and their
associated I2C buses and GPIO lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- none

 .../boot/dts/freescale/fsl-ls1046a-qds.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index 64133e63da96..c188977a901e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
@@ -42,6 +42,21 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	sfp1: sfp-1 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp1_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&stat_pres2 6 GPIO_ACTIVE_LOW>;
+	};
+
+	sfp2: sfp-2 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp2_i2c>;
+		maximum-power-milliwatt = <2000>;
+		mod-def0-gpios = <&stat_pres2 7 GPIO_ACTIVE_LOW>;
+	};
+
 };
 
 &dspi {
@@ -139,6 +154,31 @@ temp-sensor@4c {
 				reg = <0x4c>;
 			};
 		};
+
+		i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x7>;
+
+			i2c-mux@76 {
+				compatible = "nxp,pca9547";
+				reg = <0x76>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sfp1_i2c: i2c@6 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x6>;
+				};
+
+				sfp2_i2c: i2c@7 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0x7>;
+				};
+			};
+		};
 	};
 };
 
-- 
2.25.1


