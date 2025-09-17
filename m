Return-Path: <linux-gpio+bounces-26297-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B129B7E527
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 14:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E54F5483FB9
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 09:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D892F3324E9;
	Wed, 17 Sep 2025 09:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XCTHNnUN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86E7331AF1;
	Wed, 17 Sep 2025 09:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099917; cv=fail; b=jbf7zNqoC8WcQuatwk40K/a+UqACrOYRY0LQX1P3PdcbRG/GZ5fMjv4rc7NQdAvcYi84TFNMge0eVnACiPFsAeqVir48qby9EfY8IMWhMRtbNUNxRE7yo78qctyoekbQc3GQynCrM2VqTdB51LZQpikjL6C6xisefdXwj473Lpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099917; c=relaxed/simple;
	bh=R8kN5NN2ySQ750ocT0Hlurtrp7/V2mqqN7mKOzCzlAY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p1k0kM4uDYDt45CqH+LGM2lrS5TqBAmlx3MDtrVBF11yM9TXtmDvMGcYNEfOvdVmTTPuxwEAFwe1sAwreyCwz5th1YvaaDIbS65+uUXmrRPitgH+YfXqd3GXVGy6SINZpqddProXgmkHfysKYC3Hp4dp8sK9KWHz5YaYzuELD1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XCTHNnUN; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zq6llOzNPRkGGAaYP3cTHEYoxxq15snePv+yhR76cUrOlnQeRnO71sQvYhEDwi6bjp9IHb46gjY92KSPr45l2XQG7N89Tq3njXXPmSag77JAXTs6g7yC+/eRmnAptIc5cvdiQcPgs9WhoJazDojgD3vb7Vw6yY2CdlB30CgBg83AXc3Qcxw1gDIPno2C3XOnA/jgqtbOfgc1Fcy8OcFLqw6aIBa1BR0qo1SAmiyMhhIzL473ZlIsiCoFsy7WNc+cq47RnS+TZ7BI92FxvZvX4RnTJstDfpEESNv/qbsMCI27wo1L8rG2MYrQdNf91p75DoeJ727V44nndtOGt0yt7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXZnF3rLNIFy5YF1G7C7lZObudVTQfh2E0E93LNSQG0=;
 b=Ooh5yk3vssSO5wqMXHmXCpdzqZp6Qraq4Xf9aAu9OhFRtc+TmSyp1Puz3p3kS4NCks6/7hqp0VxHdfDqH2OtvD5iBLtfnmO2VYXkHaIJUZYiZIKjWgnD3BTKOYhyNVTjAhmRR6gNih+Cqp+2khBoZo2dqfRiqSud2qGolHIf/IJTlU1yWHkVIMuLxHDbyavIrzsgA3c9sZ139xp68rprGNYB+C9XePf7TynzguSDzsdQZ0awKVEGxeo71RZN2E23j8S9RqWYwCTxWySUFsDgxiW8+LiBbG+OvU/BTZvNh3cjhaHzsx63AYdcItRm90c66NTHDPROSWAhmj2LixazNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXZnF3rLNIFy5YF1G7C7lZObudVTQfh2E0E93LNSQG0=;
 b=XCTHNnUN9WSzc/EK0fezkwFokAiNlLzJ+RwowKON9wclHDSClTBiSDp6/X6X9PQLqCZDPXEuhISHXAsVrUL27aEeJWtSw10V60wGVg8boJakTkArNBE21VvRFjgThXS3DrrekdyFsYTn009/XglqFIE/hT6J0JJ8px6Ix/u+9/9hLSLxp0+x1eRNI1U4gPAcfejna80IjFE2KCKkd+Bs97TZd66RKUOXQWc7toDH0CTp9Yfxv6uiBfOOf7n1sYMkUv/GGBWv28WR1VKSAppAmQVNjbuTkemehmn3B1Bp68bn+/yf/4KlboXdL6SNKiwaG9QFYTdTOT/1jgPFxAgMGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PR3PR04MB7387.eurprd04.prod.outlook.com (2603:10a6:102:91::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Wed, 17 Sep
 2025 09:05:10 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 09:05:10 +0000
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
Subject: [PATCH v3 10/10] arm64: dts: ls1046a-qds: describe the two on-board SFP+ cages
Date: Wed, 17 Sep 2025 12:04:22 +0300
Message-Id: <20250917090422.870033-11-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917090422.870033-1-ioana.ciornei@nxp.com>
References: <20250917090422.870033-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0014.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::19) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PR3PR04MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a964c8-d981-415d-fd89-08ddf5c94e0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H4/zFASOgg91ehWKyEty/UOFLM0SKCnu6XXcVsBfws+VfOefg5xO8uUS75Mt?=
 =?us-ascii?Q?a2quYSg88xIYhE9NiuRBP7FCgMMYw/DGoh9Py5PbIYnexwPHUKzEswSMrhmv?=
 =?us-ascii?Q?PbQq8Cj1Jttu4dHd1WPqlXdwzqIcjcPJ1hPa9QfvmogoArWfrHvAIR4NTiLR?=
 =?us-ascii?Q?AJO0Ydh2hmkev0DX+9nmDaaB7LnwyJjvD5VK708KV+15kCj07d3qwTTB3BHN?=
 =?us-ascii?Q?K7XnIups4adRNLEO4kSTCEA0kVARHOk5LqG08vf/PrOXuq+ANMCiJsI43rSR?=
 =?us-ascii?Q?6KO4cJ3zXHm/6wF/gfkjjRXMCY5Q1u3BABHg0R7PXxaOtFnX2OxUxJKVPsCn?=
 =?us-ascii?Q?zH0Hb6D7KgwFQ5q/mMV0uke6ru69P3B2+1U7rjobFh3o7r+Q+leVbFhsEBBz?=
 =?us-ascii?Q?KGQt8WS0tqCfSL8nXluhMzZUIH89JS2ixROmGo5NSd97O5BOOpXsvYTvXMNm?=
 =?us-ascii?Q?RQrNejJKKjGz3Ylhm12BKBfZi5yIoZez+6x5AKg2sfATsVJIcQG//lA8k2ZQ?=
 =?us-ascii?Q?eXx2pww8EL8ggv4utE/tUuFz4KGaSsN+MzLmXXVE4BJfM8FtAYOAQUtA4+BY?=
 =?us-ascii?Q?d6yz0sm8Z5rXnL0fWkvsOHVQCDvIVr9WgsGTx/okrjN7YjhjvaKfk/z7r/Ef?=
 =?us-ascii?Q?ywofk7hRC/AXMFndn26ovmXr2Q9hoieb5jFuCLXYFj7sKDmDZRyLokKaGT2R?=
 =?us-ascii?Q?BVOzZ+312GmQg2dmIRe2HZtBLp5Yle3UuufxgrOYC7S1Cf1ek39n/fc5fxQ9?=
 =?us-ascii?Q?66KDerwfq8zMqbIZPduDk0OG/+kFVRSAoI+BJUN/Um6Ef38hQb9guUHFLsph?=
 =?us-ascii?Q?2HbXg4cL15lxEnXrTFS1Mo32Mw88Q2ad0cBdtvunDq4Xg8WnSrNJgDnnZSDk?=
 =?us-ascii?Q?WqTlhNLScuFEUi6Eo9sefnDK2JuItKQvKhJx6Rci7sJeyvFLTpastXW7Raa1?=
 =?us-ascii?Q?Gygemn3nncCg4Oyuk5hJyVoTbgXww3RPLCEDGDlfPvwBevp83mg/xCGHuKm8?=
 =?us-ascii?Q?UduARKQYh8lfAiWH9+dAidQS9JuEg7UYg4n/9K9+DvptViLiNv+Ecvny4wy6?=
 =?us-ascii?Q?xE0R0swKcrxpinxuCmufHxp05nIKfnElAo2yKbvqEvBdHnJ+B0ppjG4gIpWd?=
 =?us-ascii?Q?lpHQJLBQTxb9VtG9+0D8OVMt6QUljiSDh6FaStwv2wUUHNOJPRxrkFze9VWI?=
 =?us-ascii?Q?xEXGlbxN/lslewYYOAmhCLeRIsLBzTjJ+mJmaAV9p9Vx85ZepFuAQGWvZo5j?=
 =?us-ascii?Q?kbiQdCHbFzVxU+oxR3pdtUqEGgu4B4mydB3ocxmMolGNVahSK5w8vy6ArIeB?=
 =?us-ascii?Q?U1UrxRUOoUGD6AIwUcx5l+QClkShq9M9PUdBU6jMMJoihxmobq6Azf2v8FQF?=
 =?us-ascii?Q?NO+XCOi3RFypI61AqMfPn972ZKTQWsHWqZ0cJwaniVC+MzTeB1087j1L1qCd?=
 =?us-ascii?Q?OOX5J7RHtWqExHtdrfaoi+J9O+sHam7/X9yu74bCFN9xGy1ZB4xsQQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+pH6L6kkcAnAQQzZE3kuK+U5x7PRL7/su656a5MEmMZyG209uyLtv6hfuogX?=
 =?us-ascii?Q?paB+tgt1kX+ZVTfBI1S61HU8gnG+lCYo4lbOibTvMmKa6R/sH0Azlf1pPBMM?=
 =?us-ascii?Q?vXF7f0cKaottMizPdKMET60BtYjUFjQiGiNyxvdHFDf3jimF4oE8KzAZJlF1?=
 =?us-ascii?Q?AY00uI5Od3tNZR0OPa/wiJaU1gOtcqOnCG4AdSzalJY6i59Sp0eNTTFj7bsM?=
 =?us-ascii?Q?xHAFVzaBlTM7JGcd9F5DMPaefBMtcJsTsONsTDK5Q257gS71cFaw+TFIPzxv?=
 =?us-ascii?Q?Jawjz3XZ9tvMjZHkD1eitOA2UZTzOfdYZXFLCQMoWwVF5iTA78JYYMjVezp9?=
 =?us-ascii?Q?/lSnvMMf3kThwhqjXaimiE7pjjp36sLfLl8MMCsBVTwRS19fCN5TLC9aLcyC?=
 =?us-ascii?Q?aFWQnmbAKqSju9yysyKDBiQQVNWKudduOPv4XyWU9kd0saPad4T4pAUJ/TJ4?=
 =?us-ascii?Q?Oac2R6kATf3H5/42WMx1cWOBg9eCp0qtgFoVKn19S2BPm9kFbne4SEXcGBzs?=
 =?us-ascii?Q?sxyGeC0LOv/zqibeDYGxzWpUtgMvK70T0gQVi+gfhAsUmKMDUmekOZvtCNHV?=
 =?us-ascii?Q?hpfp8Ol9IjQB+SvW+EZpMUa/iqbj3074xqSvhVIRgo6L3DSBzUQCG7QOtZy7?=
 =?us-ascii?Q?PdZDQWt2sQxOHPq844+kOz7eD+NvO/hQU544TYRhnl+8TCdV3OnA0l3mf7j7?=
 =?us-ascii?Q?5wheRI8Kk5FLhqsWt/QyaAhyjNOc71m2xz6mOwwR9IqqrLOBN1Gor8HEd85H?=
 =?us-ascii?Q?7ryLrNWLW4RC5Z1ozZ9VJbTyEEqaspNm64YLMFsYoKbUkinaWBafUxg9pBlu?=
 =?us-ascii?Q?KM9qNpelzuws+kQiCZ3bdglVcoye2Vfn+j+P7g887lAs178hcVf8ql55LVsH?=
 =?us-ascii?Q?RUR9kvAp9yNsFPdYDNbzRxUzAZkygS1XlCMpuwYcydcZY3sKLKUDCR5LoPSp?=
 =?us-ascii?Q?+vjxH7dlrzhBUH1IWfQDZnTpxRVtzT6csLLWp6riM9CrO/CFf4nHRDiw74Kc?=
 =?us-ascii?Q?FY7n0tZzNdQroCRCjWYUmCUiBjhUAUbUQPkY/LNAiA5RroA9E+aPm4KvMn7m?=
 =?us-ascii?Q?OEBmY+uwy9+qYVqF3P2eb9rN7RYZzmIHwXJv6q8EfXIVi679PjX2rCY4uyJu?=
 =?us-ascii?Q?jDT75OVLm2uzndhMX13MqeLK8XWmT0/0rn7v+NP5KGavQZ+Zv8D0i4PsbMVY?=
 =?us-ascii?Q?9iif9vf/yNgpC6HNGM6i6Ex6MG/R9j3n3be5/wqWVMqN0Q8AAMW/KDc8J0oG?=
 =?us-ascii?Q?RpiMPtkVLn0CpF+DsSMIvQfzVAU0ZMjqJG3/s/1uWuwBObT2Y8RTTuTLt4gB?=
 =?us-ascii?Q?nA4jNN7S0tDNriEsuPkVTZEiP+rJ4/YJtCwNSSDqGHkxQwrCXiBN3zes5poK?=
 =?us-ascii?Q?5+FzsbTMf5ujLOf6WAFGb4x8SRXGXUjNkqU+F4Ua5cEToZtblhWhN7wdpzk7?=
 =?us-ascii?Q?GeTEbOXrbnYRF4yAU93I3fi56fv9QS9VqYbnpovENqzHAO1qr8jucuqxLrN/?=
 =?us-ascii?Q?mb1DtJYq+dzDpsGFDvKE+QGiG7a/kxJjzJff9pggvnqwUuf1+DaaensGLWgP?=
 =?us-ascii?Q?ymIfk6MZxXDhsyRc2MCOOg7al5hSE9qIjm2Y/ztw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a964c8-d981-415d-fd89-08ddf5c94e0e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 09:05:10.4466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8N+WdFJKOcj1ThSd6sfUg/lBawNE9Tj2/Wi6DyqpWLHoBguAioXNtPrMmxzFQQ+7ADa0wus6/CxRGBdPJE8MCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7387

Describe the two SFP+ cages present on the LS1046AQDS board and their
associated I2C buses and GPIO lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- none
Changes in v3:
- Moved the reg property before address/cells-size.

 .../boot/dts/freescale/fsl-ls1046a-qds.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
index 812cf1c5d7f4..48a6c08fcea8 100644
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
+			reg = <0x7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			i2c-mux@76 {
+				compatible = "nxp,pca9547";
+				reg = <0x76>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sfp1_i2c: i2c@6 {
+					reg = <0x6>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				sfp2_i2c: i2c@7 {
+					reg = <0x7>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
 	};
 };
 
-- 
2.25.1


