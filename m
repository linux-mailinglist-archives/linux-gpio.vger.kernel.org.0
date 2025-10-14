Return-Path: <linux-gpio+bounces-27126-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8005BDA869
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 17:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 29F184FDE65
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 15:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC7F3043B7;
	Tue, 14 Oct 2025 15:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M6VlSLH1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013070.outbound.protection.outlook.com [52.101.72.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5551B303A08;
	Tue, 14 Oct 2025 15:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760457279; cv=fail; b=CNNJMtpthScsEdrF1N5VbQLUjSr+X4NlxlfD9mNGtaPHoX+yzyl9VWpXs7NHnksVvlGjL2tXCtT4GYaKeoO5dIW31GT5vvu7A8307GhQrAWN5kJSRgXVbP/cXZS/ZfmFWjThtb6h3aSSjlDR+JGWXHPfM8B2AGAJ1PQhgdx8CNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760457279; c=relaxed/simple;
	bh=Z27nbh9pHR6bxY5goN+Jw4L0EGaSMnwZdpJZ+IOJPeE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YbWESSE71B2mttEr1oGIRyVScEVLAyVEit+IlXeS9qSENRagvcQY+5s27xrs1wpdYz4pU9tzxG4iOxNuwzAjk5/dnpcV4gihBa0DiS8QCYjGV1MTzFihCtijXI+9TBpF/FaVENW/S2wL5rZ/b34cOgOGbV4NS9oqDvlxnkvq6NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M6VlSLH1; arc=fail smtp.client-ip=52.101.72.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hlt5AaBv6VFaXNe2i28px7C/4G7dUjJX4Q9L/uW8giCwbP531SHv/hlDKw3X1W9DxYhHwNi84o7Jaxjr47KQL0FcRGGpmEe7SrVp8vUSRJl9PmdWjJpzNy8yB5gJaLWlZ171qbXcX1Y7ohNmBCGjTT2ppXYRmoasfftX5GbXi8DdZCy5vvmf62t0VsujoNF5OoDurwi4Q70sjaipdFjDKxt/CQQghxfYZf+qzDK21++dOyzA2ee7WHgMeX+bfVlRtcjmotNtS2pnNe3X1dww5YxVn/i9ou+dGKgFXyYoqMDZCdFnUDJhhIREAhd057E9uW/PmGlvNPQ1htq/Z0UO7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PuvaECtGQh6kErLusOu2hm6oq6fXQWy/ztx6eFRGM0I=;
 b=kVPNxvQFe71Jg7kpLvdR29nlnY8EFznb5dwPFvRozWdXjbSSTpH1Uw3kWcRb42BMURfuZJeVK0dFxLYD9n/MfHPXct5ZsdvrPhSwmFElekd/l0mRvVL91C90hITTSy40Ry3xt/TXGprww53wW3ONL4KDsNjxvfOW/dV7iyI2CITCjBSWRzb3ys4A0nAa4iFoe4rPMJq75NB4Osp62gE9dBCsAwUTbVIqh80rBHtmLuKBttDnRMjayyB6LpT/kDMubeIi+JkHNVmHOHxBPQQ6Rv0nuZo7hk8oBWIGscCtw6mGXEvRmbMK9uLtG6B2tN4wg5ImvHADdeoU5/97U9bO4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PuvaECtGQh6kErLusOu2hm6oq6fXQWy/ztx6eFRGM0I=;
 b=M6VlSLH1qNNlyOBbrt421IAXFBRg5Dcnz57hXHpVyzhdI8ZXIDkB/9cS0rPGyaa35lebDvxv0IHHOCNta/iIpB3kZm1BvuQoetzSV1KVkOKqbsB4mgT+5MC+twtEvHBnDvSKa5VCNjDvww0Jf1rBdfxGf0iFSEsKywnc2ICoZBcM3hVrjimKe1Rn+qEGzbXvnXVQ22By1URGg3ACvLfGKO0VObbxdhu+9o7Z7EENmbtb06k3HDmD6p9pTnA2Me3bsEHphY0Yu1N/XyjQauYY6AVN+MNGtVot0y60R1XCk8B4ZPA+7OJNLqd6NRsbbdW26jILJ1sopltdoKu2lKmXnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 15:54:22 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:54:22 +0000
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
Cc: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v6 9/9] arm64: dts: ls1046a-qds: describe the two on-board SFP+ cages
Date: Tue, 14 Oct 2025 18:53:58 +0300
Message-Id: <20251014155358.3885805-10-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
References: <20251014155358.3885805-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR04CA0114.eurprd04.prod.outlook.com
 (2603:10a6:208:55::19) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PAXPR04MB9185:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ed36ed5-8b42-44a3-5e55-08de0b39f18c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x60tgCvvvPS1+xYi3TcJYr/I2XiHWtWTMhKwYTUhJLAezRz5Sn2y11Q6lpGP?=
 =?us-ascii?Q?45PUBQflT6fPBV0zFRKtJ/D9cM1+78hIt5gmoH9sHQqCrqW6XqMWLCaFEtnL?=
 =?us-ascii?Q?8woJRSJN/wCVX7wWm/X7oQrvDPumJDOPhJSK0kTi8bYb/OgMvAlF9rwFc7Zx?=
 =?us-ascii?Q?/pBvMjDFnxUPbUypr/Ia6j+S83IRsSLbJd4WuX4EruvrGw4RJPgkMcV6VpMh?=
 =?us-ascii?Q?rZMCYudJFSqkERm1uAFCAMkh5LYk7ikdLqV+j7g/RWJkFxgs1oGMZ+BD2gap?=
 =?us-ascii?Q?GYsspmdHKUO6+dNASLzkEMtN2VHyofUU6bC/goYlbtdsDjEqSSmjRSB5wKM8?=
 =?us-ascii?Q?0ZsQbjHwnleXSDZ7eUvOWHBxHh7E03mbzeKLbGdKDXgLO4WD6J3lDo+FLVRQ?=
 =?us-ascii?Q?+E/N3EOLI3tOH4A3C7zvzIBlHLzu2wFPf4c3ZMoBRQ7NLM55T9Ay1RSgHZ9T?=
 =?us-ascii?Q?27zch96zwoRXfE502DnitKVqnPzzXci01Rp8BY8b/s4cmcRTl0TiCMWXRea5?=
 =?us-ascii?Q?7b45iVJc7WtKJ+fd3t0o4EhPUq8UtEtIq+0foVQW+ElUsNrAY5Cl1Y78I70Q?=
 =?us-ascii?Q?u9eijgAktIcjMVRGws8CddjsMhGTY7mZWQEA+/Czj8f7XT2oYIQLEzv2M7xD?=
 =?us-ascii?Q?Cyh00rGsCw+HwDA7mHxXwEtyuvD/oj2WIhoNfZbwc2Tc6asDqi5xL1QIGkoh?=
 =?us-ascii?Q?+W7cbDiV+MpKGK1tV53AD3IQnNQyxAIaCc6wN9XZENk73craDUMg9Q8FDOpT?=
 =?us-ascii?Q?EX7rqjkMyIcFbFm4yBbarG+NnU6dmCF5ViSX5RG19/O1V83u7c7U92PLKe4E?=
 =?us-ascii?Q?vYCH/yQrKzSrABms8FgewNynbPfodtpoOaenwDHXS+zgwRecbRC0bomX+8SO?=
 =?us-ascii?Q?w4l7/0GxYC8YSxgRrpCYUe60o8oVdhWeEfc51/Wgcbcv/5YEVeXJtjiH867i?=
 =?us-ascii?Q?DYf/+Ub4M/qouhV8IpKareSVU8HdvDaRco2BLX1J2j1b6nQHTXk11P/JhlTN?=
 =?us-ascii?Q?Xxsg0wKXQv9U2jX8vKbUFcgynVTaNS2RZWLJKfDiNV/jOGjBPpJ/Tq0bJ4fF?=
 =?us-ascii?Q?FWQDzBCIgzYKEzcfqzKSAm5fM/kJayeAsZU69GHPYF7mVvXjMAoNRvDf/TCr?=
 =?us-ascii?Q?rx7Uxhib0Itji5Rg64BqZhMSiq/3IhLSZF1OeI9KrtE0GsNsvRVHvwQ1sIxo?=
 =?us-ascii?Q?+HJeFtd/WU19HtQeWAWoNysX65vNNCs/q10vv29GyodCXXxTnXgww2ViG46x?=
 =?us-ascii?Q?DnDNKnAiYZSA0Zl2kIhNk9xWkINU8Q2h/wtcCGZCYLLQYHLsm/VD8FG8jfuz?=
 =?us-ascii?Q?9ca5xr/LyV5E9s3A1EubSK2P+BIy6WSRSm4Ts6bDl7nXm1X1Cp4RBh+0SNJb?=
 =?us-ascii?Q?RlCyHcA95dTTe+mNLHfWlcamUmZB0f/HoVBVh0VX7YAEHEIawtlmwbijFs6M?=
 =?us-ascii?Q?YCkkisqKDJxkzYtyKnHUi7nNFdgMqhMDmgTbmtu5WoXWTq+ORiwBM1oNdUyY?=
 =?us-ascii?Q?3+6yHduYOjeb72k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K4Us91S8zNayAR+PUzags4NIAe3KVrtsbD9r0lebIUv0Yq0lEcfNLoK49JZF?=
 =?us-ascii?Q?K7VU0eTAk+FL5dd39WM/ljcnIPcpIukKbyJrmIoMvm4nV0tW6I3+b/wMO/Xf?=
 =?us-ascii?Q?0leOaVe6zaf/VSjhLrVrErjButQbyy4KCr3bdMc/7f0sxXhmert+GSVL79ue?=
 =?us-ascii?Q?q171vxoY3NIuIzZCrJMNg1uDkimtbdPvCLVjrjci7hVyIuxBGtaBpv1xokNa?=
 =?us-ascii?Q?bnuoCAAMMrQrdNC/3V7R8/BLIEgbh7izzVI2rk7QbRm/2iSvy3GGULOTbci1?=
 =?us-ascii?Q?WOy4Ook5GmCCDXWv5dGhqj8SjOFkoSX3lqZ9rEa1N1crnD8IUAqbWbZlDkRK?=
 =?us-ascii?Q?qPmHb3A0BNnFGvEMVUBIbafvBhV0lZ1oCz9AkdctPZQb7OqRyzRJLewgpR2P?=
 =?us-ascii?Q?Bhh5FgcRHxX3tu0jDdij/q1mK0KkfekM2jayRk5kSTC0opP4G7yeZSByHeKb?=
 =?us-ascii?Q?brptQQQbXcw0IURDYoz/1/vQ7uoMLHW0SJgmF8yWyHiIDsshfCDMV/C0CXAq?=
 =?us-ascii?Q?STBIjZ9B1beXGH//SWEPb6s60+kwCBty+fvTcbPWmAeaOFg1UP8pnVAPHTfS?=
 =?us-ascii?Q?OiXTJ37A7NrPwUWqqX/Dhs4kXtILzMR/qSAdlIiCZvDHa9ETttdDZw7eEkIG?=
 =?us-ascii?Q?0z6+GFg0gfHSuWTKYUBPukX2zHL75ABZm6bsayGk/sDw6jnYgk8sE4wS4Gg8?=
 =?us-ascii?Q?w0l1dsbf7S88MdbXOewXkP680AJski5AALOE502F12jS8Jd7AMS0tnxuBIDr?=
 =?us-ascii?Q?LmssgmZMVAEk63e2pMxFCdz+TOIbuDCE44LU7G2kM+Yxde4ul4NVFhwsSKfT?=
 =?us-ascii?Q?XEaa4S4+msy6moSL1GgQb/B5bhSENT09y2uBnlTMmpV2Gr7NfxfNfwLMMUzT?=
 =?us-ascii?Q?EHp6pztHBjOCoKjyi615kQYRPquYt3/OyECzyUs4veyYSMVCmBXkF36QJKDs?=
 =?us-ascii?Q?tckYIltncxHQ6JfkEKZn5AnYzP7hw5uTVzPHmO0cAdXwy28P6s929GdC+NzL?=
 =?us-ascii?Q?XswIcwl/EmI5dzR4/8679cS9CGvrNbUqPAeQ6LqjUhsqEc8J/BVVf7g9GwBu?=
 =?us-ascii?Q?9F7Ce7NMt0sAWAjwB5Duw0dJ5ZEe9PcZsbWfUABRB/p9rQdH52lIK+2AwLTU?=
 =?us-ascii?Q?ukBrATq/VZ7dH7b6xsWmvRc7beztrXm/qmnpjZfdcVfeP7aT6sODdAKId/2b?=
 =?us-ascii?Q?QTPu4FVxn4wVWRyQJhbNOsPanNPZ853GOrz0jD02EFOwLO1HHlDEj0G1MqBF?=
 =?us-ascii?Q?mU8b+rPDiOT/mEL72H8UiQOnF5h/4jaxCXNSRqMwQO++70qejeBIop4jQmx9?=
 =?us-ascii?Q?SVJBLFcVu2/zKDMXN/d+mqNvCZLx8wvuqaUG9f4QaKyTxH3/Fu6YMfv4725q?=
 =?us-ascii?Q?B02bRpt2ZY2kSZqypGUjaQ/oLZcJ/UOB0ujZhlvCmDCR2Ifrggp4sN7jzjpY?=
 =?us-ascii?Q?CKbf31sYTRqY/A9y4fanlaYfQawWoHpkh2FnDbm8wwfFTjkxTDlrbGPwgZpe?=
 =?us-ascii?Q?nMZGTvDEvl/XpeZUK8kEjKkvYiskyvSnDNwqN4LzEzgt6wlA2pO3VsO2gaBL?=
 =?us-ascii?Q?R7gPcM+Z65b7whY86FzPdbZGhT4Hk63ShWdTDJNd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed36ed5-8b42-44a3-5e55-08de0b39f18c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:54:22.7856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: er23FAk9jBwe2jShMXozCrhtJVbN6sH+imPyuxJChXsVjPSZH2IbnOlLu9zjvAnApCAbtJEWQk7c4CpEFvgZ2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9185

Describe the two SFP+ cages present on the LS1046AQDS board and their
associated I2C buses and GPIO lines.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- none
Changes in v3:
- Moved the reg property before address/cells-size.
Changes in v4:
- none
Changes in v5:
- none
Changes in v6:
- none

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


