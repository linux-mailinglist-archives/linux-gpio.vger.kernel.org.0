Return-Path: <linux-gpio+bounces-22988-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47203AFE7B4
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 13:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E67C1C285F7
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 11:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD662D5C99;
	Wed,  9 Jul 2025 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cBmAMR5g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E981B2D5A16;
	Wed,  9 Jul 2025 11:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060460; cv=fail; b=B19Ohqa/PDj6WawBwkdDNczDkaAlegTC+BXJicBwgs06/wgBFDKV4C2x/TgwE3A+cMNn0+Fssr/v6BNvPwLpzLMpT2RCZpuiWCI/Cgw13G2D70DMn6AZqt8lJ+cPtgMDPdP/N8zYqh5pd+0f5RIbDWEm7b1DmmaqzpOmZKkqQ+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060460; c=relaxed/simple;
	bh=zgCSSip/m3r0OrsAfqxD2GdRcSYQI8f9loU2bhBJBYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Brhp20e8HJxnoQZWYG+bxPB1NiPism+0AwbsIu2NXFz2ld3gb3MYTo13yPeugrWeaTukQoDvSgh7X7NXIK8Xl2oSAYQoxNs7loRWGfk5KwKZHed4ttFr+535ceNuVophNHkiHV6+pKl69N1DHtg4/+UEBsf62aynvJEoeIuICMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cBmAMR5g; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BT57L9W0+oBTR5emmPN9CQFKNsJ63eNFIr12b87YL2h8T1TTT307h8NuyVcfdUoBU8B4lhrm6BwZslH2GUsO0pEpgp4SwrNdJLKQLNFoaiR3cQB8C4Rpwu1MPdH3wdzVdsnb+YSX9f7cwpcZ+V0W7APx8f+DiY4x5FxrknVDtCaGSXUWpPKWzcVY3DKX6/NqNDOUPO5eDAGcZq8LMA5G0ZHnWfD31Cyk8Qz7uSHvJAXOeT9c3Pb4jttGdqAfSN6PMimlW6ia1s/CKHeOokjb7JhYuOZUWdnA0j2JWUVFj3y7SB5X9O36HkdnYoVQJa0YMaWUXWSlD3krmviS+B31mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXAlEYam8lCzEl31c9xPIQHjy/2eRdceh3hVN0lg9VE=;
 b=n7/nDXKMzT/adj0d6usA4Rl/a3vzkzpL2HK6Bd80DildmPCI3YB6gWPOqsrR2+5nRIGY/2X9IdGc3C0vZTBovu8Yqb5zxHojUxBgmQLbA+4DI7E+/ZYHcJjjD7gcCqS04oaAxezIiY6ObjxKBIwgHNg7SVt26pTY9xiXRAnUxZZkdao1x0BZ/4Wfs5lO6l/6yFtikpGgNzmWgvzjRyslRgjK7tQCmbGbH5r96buTZYTlRaH03dVkMQ1Ftgaw3w3jvI596LwPgEu93Rzuk61TYWy7HnUxfwpD0BnToIP+dy44/mOzILcHKRLSg+4vjtK4kpBAMObjIUCmSQcybJeSeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXAlEYam8lCzEl31c9xPIQHjy/2eRdceh3hVN0lg9VE=;
 b=cBmAMR5g4nwwc95LTQHxQqWPqXQEb/JamVVgkT9f1cLJg1e8B6rSBuCCxtdo41RIe3mmE4uhYdTsgJ36t7l1bLbRMdM04/Y3s4oGFSn5rtBFG30Z0gAVSLzoeoziG8Dxxyd8smOfE4zwqMSZZAPYKqrPsM+BrM5DFl386SG7Me6f0r3QOGjEQA4/PfcvB5goCFxYm0pga599Lz2peEWicIIMJS63hUnRhInqUI80TnYEAtU2jBATOFPNoPbYCuXY1admOuC9sWnlywtzZFjk8QYjPetAPV90b1GPgGuKv5+WYTYfBzy0bdlScdev4k8QNb4OZxaBa3+yrUu+TlupUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 11:27:35 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%5]) with mapi id 15.20.8880.030; Wed, 9 Jul 2025
 11:27:35 +0000
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
Subject: [PATCH 6/9] arm64: dts: lx2160a-rdb: describe the QIXIS FPGA and two child GPIO controllers
Date: Wed,  9 Jul 2025 14:26:55 +0300
Message-Id: <20250709112658.1987608-7-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::20) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 470f061d-2f6b-44c7-b2fb-08ddbedb9a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?53esEwtCOtsCnPasjSFHY5Bej26FbK26+JqJwQVGRR+TpxtASWYh2KnK9sZ0?=
 =?us-ascii?Q?EOoNs1awbb0Y6WSkee0zcSlsBpfga2MNgDkzAFZlW2bWvqmR4d8Wcb+3xjc/?=
 =?us-ascii?Q?dghzXDLeSp7vjMv1xICnv2RY3muGJiklHnw1ZyeLggiFZO+1H5VrOUBSqPn9?=
 =?us-ascii?Q?XP6Pt5GLE89n/PINbKoAik2Zg1GcBpgqrNmBnMpuF8J+eNm9LzC7sUmvmtDC?=
 =?us-ascii?Q?FaAhrvTJEmCofXeK37zTzLrERX3hy6r8JvfmvkXvGzzK07a5p0UzcH8kwEr9?=
 =?us-ascii?Q?/+TMtj1BbcpYfXCIX9m+NEYJShFxieL6eCKc1IrV7Du1kU9lev9Fux3wPn4p?=
 =?us-ascii?Q?bNt7Nce3fPK9832rb6LslASVt3rTFkLcTwQKMuVX+6VvL0WHyX9kJWKakwEI?=
 =?us-ascii?Q?kO8xj6VC4wKh7WT78b6LMjtQtw4sq23lgnbtGmHJmlC+TnbBthro4CmjKoSf?=
 =?us-ascii?Q?r7vPUHPFLF7Hvf3oVnRdodA5oq7j1+I5uSqPt7Fs2EzerU8UuH5pL7BvGV9s?=
 =?us-ascii?Q?41gBTyILIeh6CRriKgutAWmFOp6ySl8Hp2OLTP9caawCoQ1ulGSIRK4+og9R?=
 =?us-ascii?Q?PHPoo6fb2ZYn51n90Vr8dxMPWl6/2wOFre+n3j1Kj0FPBLZflagJ7mlXeAOU?=
 =?us-ascii?Q?xKVwYWJIw1HueLJfPpXiWIEXd+9XacmDEp13V5nGS4d+081vAWqAd67B19G3?=
 =?us-ascii?Q?ytDe1YeSNduBb4gXJsBGBoqMGNwxyoqKxle8t95gGopyscoEpGGurfYmeMnT?=
 =?us-ascii?Q?unVCygE1yPQb3QKg3aT+OlCsNpHxhBTtV77P/DYc1w7WhScrrMGT5h5z0GsA?=
 =?us-ascii?Q?kPrStKGyaq9onz/ysc9L+CG9tIu8khIn0qFiQ23I3/7IybK310W8OwLdRUkv?=
 =?us-ascii?Q?6TZuvqWAaa2hikzfv1GTMGZ54gSc8ZjiAZwuFku2BsiQJOCsaUHX0YY56vf+?=
 =?us-ascii?Q?mBUene5OYuRD/OcKOzFoWQk3+wzDnZi2W3+1zICecNmVTWIlwGrS0P2MnE6b?=
 =?us-ascii?Q?ZtaXQnWnGIpzL1LY1rRDR0bSTPvawF6vMVQXg8SXNU2CXL5ojZoNyapVljTg?=
 =?us-ascii?Q?sSDgTnqhz7fUVzDYmDsXWyc/BlOhOUjXvWyTdIHLs6M8rza8G1iwJ+F+9r4t?=
 =?us-ascii?Q?P6iE5vit2haXIFlMGyeB15u9bD9wCqJQdGvr+98snZkc26vQiaU4ZO2dLY5Q?=
 =?us-ascii?Q?GDsJHY2TpffGZL/rSGylptz+VPmkbHqL1IR5mSTAUv3hvdyquGaCkI3PYoQJ?=
 =?us-ascii?Q?0Yq+jjQ9sFSh78zL+N50oklz+gk1303/kdGMO3tVc76MK6GEMjWHwNWhFNCJ?=
 =?us-ascii?Q?sG5Cn5YFBn++Hpn1MnXsUQ+52zACO4OeZhJkiOb++qK3z0/WS8i2YhgDGt7o?=
 =?us-ascii?Q?uZUVV0klkOHSxMYgAtZhKCbgc78F0TKD3Z90dPi8gMW3iX/+9OKbBT257vG4?=
 =?us-ascii?Q?BD78qRSqlEU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UaDdr1moHGvh5fFIIxXT4mXM9kPfnrGaj6MVh4vz9Anj6tclyQxePIPPjMRr?=
 =?us-ascii?Q?ChRJZTMtreyPC8oxjni48ZqyfBAp/XxxIq3Vtnw1TGNe+zxvZi3o9vx65mrY?=
 =?us-ascii?Q?qHKNnH5Bv49yIeXnpKosUkHK6OPahXJ90M7beKm4c/HKjCYvCdgoDMwZ0i+L?=
 =?us-ascii?Q?MBh7UIFMaYqZ6UQ5JCaoeslSi1sp0LaMrduswmY91RFVuDXfmYpblKma7BZw?=
 =?us-ascii?Q?Srz0dO+PVH5ksjQCbot/DzEe70QGCdBaojNXameLG1kK99Uk7t82TlZ4YYl0?=
 =?us-ascii?Q?8fzEo2qtRq66Y3lsPUzYRvWmITEf5+B+AEJBYJ5QfoKQl77WPOWPewCtGUKF?=
 =?us-ascii?Q?1Ti+XMyjuNXlFM3QoXnA9Ayum+IiA66wDKCTC/9x+RIaL58k2dJ0HqS0kzM0?=
 =?us-ascii?Q?SJfmDX3WdgJN4+/byMYb6rBWE1PRbE+PIHweZ9/0gQ5vqSQElCB0YwHvH8GW?=
 =?us-ascii?Q?qOsg5YlwqMoyr/0pHbNb8fJ5qvfo6qp1BsMaxniTmOSDz9pbggZnfQfmTuyz?=
 =?us-ascii?Q?X2utMXqSdSINvzsq3Q4LOT3NJsc2YXZMEVVf9dckm2Tvf9athPqWTZabOi9s?=
 =?us-ascii?Q?PQ1kg9o01ud+ZLzLKDoMwFmbVP2P+gq1AEKsnHjmgCrk++KztkXwf5N4I84I?=
 =?us-ascii?Q?0xQ7CjxlmVWQKVKIQmsdGg/cE+sMQ4bh2Vcmo+m+GbZ8RZXThSooOE/L/oqy?=
 =?us-ascii?Q?IZho5uDb3QH3BGI+amvXYEBXwcbb+XHLhIP3Qvx23wQoJnDWlT1CnazrEvIT?=
 =?us-ascii?Q?gHsK2TrQCWZdCcXfeGMbSwIBUYxVuvfANT0rKHKmiF90SPR0sqe46Fx0/8iP?=
 =?us-ascii?Q?FEAeyCDLcDKXvWqCJ6Hb/gQsJT6tv19lo6Gt5SYlOhq3dnw8RjPTkk46a99/?=
 =?us-ascii?Q?Flx6yE+OYwHCVJFFBJObl3HyD9Xc10gGl6hvRS80Hx01QUDJzAWrcYXXtThf?=
 =?us-ascii?Q?a7imQ/O0WyhmVnBgxtwrIcPDYTD8PXvnP4zIFi5k+U+qUtOkXbexMOlywQaX?=
 =?us-ascii?Q?zAC/ZBnGPyDnDxWCU8sbz5v30mGCHpyFSv/0n0jE7PwIsTD52VY/hZHneG1X?=
 =?us-ascii?Q?7QMOaF9zutnxlJ/ivA0ulwvjvFDaz8AM9I5CHaphdVlgOehiwmNCgfLjNxkl?=
 =?us-ascii?Q?Ln4WtOT7nm/IY4vfNi7XJE7Cybt+CdfPhw1qJc2OwQve6vNQVV0VYWC3T35k?=
 =?us-ascii?Q?JVw/kqrPPQ5WK9i4KSkYM1k8cTffHBkAhZviemr9HrIDS5HG4PPhXLq/Fvt2?=
 =?us-ascii?Q?r31W+4k0O9mwfAKCKDuyFeqM90EfETL0RlkkMBfFYOD1eKr8q+c5ZLQR6Jds?=
 =?us-ascii?Q?beFqZWiPldQBPV/9Vt7nIgOhd4olG2+nwz565WtI0mTay7hwG5qOw3LjsbY2?=
 =?us-ascii?Q?9eHWGvDj/hprskimzcI1ZWnsnl3hGjuWUz+fRag+fu6Iw1frJ64GY1ItlXO+?=
 =?us-ascii?Q?a4IjZxBKzmHGOOXsJYBO0Zdb+VczuEh1Hv4WutKjilv22xGtQGOFNjaQ168m?=
 =?us-ascii?Q?ZHJTjSi5n1aezxAcBAucPTjO1obPAhSEWz1zaHAnHcg5ZBoBoMv6MNHbZJix?=
 =?us-ascii?Q?GLwELioVBGxq0AvOHI0hfgYnlHD6qOvHUvR4aCmU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470f061d-2f6b-44c7-b2fb-08ddbedb9a4f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 11:27:35.4835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZzXXZR342pPjsMoyto8FtnGlrTw7YFyyJ8EseW/aGcel/XByWO6jx0hp4cgWw9s4kt2zZKR89dJewGYPSDGUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830

Describe the FPGA present on the LX2160ARDB board as a simple-mfd I2C
device. The FPGA presents registers that deal with power-on-reset
timing, muxing, SFP cage monitoring and control etc.

Also add the two GPIO controllers responsible for monitoring and
controlling the SFP+ cages used for MAC5 and MAC6.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 .../boot/dts/freescale/fsl-lx2160a-rdb.dts    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
index 0c44b3cbef77..8209dafd7768 100644
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
+			compatible = "fsl,lx2160ardb-fpga-gpio-sfp2";
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
+			compatible = "fsl,lx2160ardb-fpga-gpio-sfp2";
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


