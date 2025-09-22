Return-Path: <linux-gpio+bounces-26471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BEAB91B00
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C1CF165F4C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D2D261B78;
	Mon, 22 Sep 2025 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZaemalMT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B9725CC4D;
	Mon, 22 Sep 2025 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551103; cv=fail; b=V1bE8l5JoAj0X8RTKGN2a23Z5ShAa2zv9I3aHa5qUyp7QfYoYYyQ9scwVk0kcmkTRiDVIoqCBzi6SyoM69ZxDs5T4z0SZdL8PS3Y67rr5jWmM+NUxAVFh6GSiZxv827rOtoZXPx1lRAdEb/gsf8BPBe1sKx2OpcGFHWWBvM+bPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551103; c=relaxed/simple;
	bh=pnpSblr1VKayvXUrZUgFzjeBYVwz/Zx5gg4T375n9QQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sbupUgGJaIkaM1psIHVYSVMXXw4ttIzt2i1GDAWQGmDKuS/afDg8mp6lIA4h1oSWB6+iIO4cNz5OU0jTC95xOfpo6mNxlM8SLZ4IDJqsRoY03il8NFz1csuIhJmMXVR1WcfnVZiOOkcTtVrzOTyTnYzVCEvc0Mff0/W81UPPGJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZaemalMT; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jii425xUXDIFTqOCnjS9AS3fnlfqgaFA2Nqidiwxr/kblJqXIObEmkuqF6W6pTOXrJ9LdG3Ar3w7KfRlj+qgt4QKkVZHh8HjiNxp3417FlxhOv8FF95VeC9os7rJu5vyUq/VgKJn2l8pPActRlh7lo/EOI9uS23aLMQUk0vxDnJk5SDgrL9QZV+hyoAHlMxjHbJTz1hLb+muyqjVQqOM2Egs5q6lUD8yBaI/QuIg0o5qA3arVEpTN01egyy2gmz2H9Y3zGm6u21T08n+G8jSGJnrri0CMPUILONcYq71IHMFHOfPd87fkW4CGkPQlNN/JTdvejHtLDWl/k6HjrjCKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mei96FQyWSDf7VqyCzuCjBelEl6Y1ODqSC7haHA4yQ=;
 b=k3gaLaM78ANxVP8Zc8DqqIwl61lTuWjD1jbWD16tVKW0Xm7dPFmKvBVibeLGMZjGGk4dhejmDLar6sfmtKxnckNa0hVUqSXGZ1Xyn62SwNRVeuffMM9gNgRS34dIv1saGLKRgaz3nsXMlsJrbsmteVtzHXLTNTE40yjZyVfqhqAJQATqm15hvIxEutCN1Obd0ZwgaGVNJ7RvrTKmK17BDa+rOgyk04ENUkNisb36WusgtQDjnMXGUFNLUyOODTIb2+1KtqCEvpBXPDdAVCKCiaT3brwW4XCcIobKfjdHjph42G3wIUZXbfrVkfjtbDp4I3whsVzV+nuoVu8St/ExXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mei96FQyWSDf7VqyCzuCjBelEl6Y1ODqSC7haHA4yQ=;
 b=ZaemalMT+S24mcIXiboKu6uRL3ZoGz1L/XIFRESLCkuqu/MjAfADqgcv+MyDF9wBtN+NgT9A8HMa/Vm9uexN0MbZIBkX+7wy/8Q2UjgpDn6AcwBKtAorE8UvnTvD5u5AJXQpHpPY62UGKZ2QjnbKhFb49z6T6FsPEQW4J4ta4BW5pciHlZLRrZwwcLkeB29QIFJcEmaMHSPrqyW1RUrx+aMybY+zJGk2cM4+dsYP2pk/7uavoKUjvteMDZXhBRFXvVa9dszOkQfU/EJMBs/b3ikB4nzDGiJ29Zuaa76sSMWSgwYoDhSOxrQ0jz9NLlDB9kpWuzWj1DvwJZZHTuHGeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DBAPR04MB7207.eurprd04.prod.outlook.com (2603:10a6:10:1b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 14:24:55 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 14:24:54 +0000
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
Subject: [PATCH v5 09/12] arm64: dts: lx2160a-rdb: describe the QIXIS FPGA and two child GPIO controllers
Date: Mon, 22 Sep 2025 17:24:24 +0300
Message-Id: <20250922142427.3310221-10-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0053.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::17) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DBAPR04MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: b2549890-fad5-459b-fcb4-08ddf9e3ccf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3tTN0F1AuFnWsL0yC/udLTb0T4pc//108qjhD8lHmdw5U8xxc5CvO2UsHkcU?=
 =?us-ascii?Q?XRWy4p4WxSzW8UejHFCyrojutp4PnvITNKtkIvfzGa+eW/tidQr28tTiJZBQ?=
 =?us-ascii?Q?lv/BJfuOKahK/G9JtBcmkofmJWDycsLwmFExWB+aLDHmTeFGDEoL/5lrPVL7?=
 =?us-ascii?Q?hxMD71lRGMX+znpDLFu0uMcwxrlDcQg5zg/5BxaFRYG5IKDvEa5LSBYgxkyl?=
 =?us-ascii?Q?ft05uJ39rkpUZBlyDJoa7ObF+uRzQ5tsmYWERzA/7vtHsbG/Ipb4xh0CsEQi?=
 =?us-ascii?Q?H83etZFzxLgUpl+FZSmb3XqyAg/N+QG7tJxXF8w9EMAhhkWYagA1CABFE49N?=
 =?us-ascii?Q?rWrKu6FXzETv6E6ERuIZd3Vi0qFCPS1lUKyrs9Y21fs4MeoAYwRnFD0XoWi4?=
 =?us-ascii?Q?VlQC2RSm31BMMpc4C4mmb8sjaQCjVeQZG3OxSpyoabZ6tWN0EeG0zHXtkcd/?=
 =?us-ascii?Q?UmGHgbOCmd9CwXy3qGps9UP9ZpLHOk5hALLoX8EC58BmpEH+4JHFRgApiH+D?=
 =?us-ascii?Q?b+nRsORwuEW1fHP+oEAZLVzVwFcPPlM7rSRF3S6GM71CKQrhZxZOtCzhSv1w?=
 =?us-ascii?Q?prJavGBTaUnlBJEYHcuzHQmCcVortXQYnhlqELy/Pze9IGszd4NP7Wx5UGUE?=
 =?us-ascii?Q?d/Q/K5sERIMGmvDtu0xp1XNFZwfILgGg1ORnjSWOIx52HEZOYUBUYmCINl8Q?=
 =?us-ascii?Q?h+K+hIZ/JHETpq8kJJT44FFp9J01lxgDStk4WN5lVRz6SAG6KJ/c87Q0jFpP?=
 =?us-ascii?Q?Vw7P5xxfUbCxd6WQqPWtBE3qnh34bfYNk0K4IlBGR9aHeORGRrNpyfh9XyM3?=
 =?us-ascii?Q?p3mpCEaeL2HDEX8HW+WAybpsM//6UnQ09yW/tAAc8/mBt1q7VO0NBsePjzF7?=
 =?us-ascii?Q?AIXA6UbvurZFxQoMAsSGV15LsKIIqT87uG0EzQ1SyTBubo7TLpHBYRFYTLCp?=
 =?us-ascii?Q?vacUUiwIxzmU8Np4yuuBtHkQqi172MkUDYkSwgqo/Y9CIo/eep+ol5nXhTUM?=
 =?us-ascii?Q?6lDu6VbXlC6azmf9YKyURuv/UYBhgi7Sd/qE39xRsuZXP1Ju7x4OoK7ASa7d?=
 =?us-ascii?Q?aagHRsVPpgndCSFT4wgW9WreWCo0IHmfHAlAogEie2HD6RgGV8z9valh3x88?=
 =?us-ascii?Q?xKBbFWhbPSfCMyXen81nihXitebE8MZ3Aqg9KHEkcc4zTzC3fQamRatyCZNh?=
 =?us-ascii?Q?d3NX931sPu0gepitTPDKkrAi+FpUFPdzoSLVHYgSijt5A3ZZ61mN6BxxDZll?=
 =?us-ascii?Q?3bm4BW0IzM4WTJFEU7sJh7MmicUdbJ+Iv4dwqYy/2x+dIBip8nGlrpvL3C/P?=
 =?us-ascii?Q?U0oNYKRP/ck9l7Xe4HFEGXW9jaApOap2IFvoJJQl63kCf/vdhcxya7P+wn/M?=
 =?us-ascii?Q?RWJArSCsBJ/b5JiQOyPR9ARKClubQ6wBujApiEQDyiffzsgDpOlyljONk+cg?=
 =?us-ascii?Q?oxGTlRT+Fv/3GkyzLhYeD6AMcYRZ14T/nfJwGn3qoKhn+IzOysk+7g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rKs4nau35/JfPWJZp9vGNpx5NG4YZRgsSlqNduj7lhKcFOuVvjI48ftny9v3?=
 =?us-ascii?Q?vfYkyyaC91zugjPH/Igu7mKLtepevUrJ7NJ0bok+ldA0iDT/e7Q6u3/6L64X?=
 =?us-ascii?Q?4FepJWxpTViYvoKzIeT4auxhw08YDQPeJcI/sc4pHVVr/Yqp3JKZu586v3il?=
 =?us-ascii?Q?ZohxbsNh0w5bu4NcyVMiNA8A7kbfZRuyasuQu1njqkGmbylIUiAnfWcPJrAS?=
 =?us-ascii?Q?7pB6DLXANuhfnzVQ/ynnhVcnRt1EHrMhRprZ5JAgFeHd+WWrD77ff6Ly0uxK?=
 =?us-ascii?Q?SzNr31v5WDHmGhnAIgsnV9WwBj6ETuKVxUZ9kN+v2dAAY5Ki3/y244Gt5Q9w?=
 =?us-ascii?Q?743OA4J1YjYrxe5AUv1DZE8GY5HoJLTqRBTPrBmiFqW+D+jBb1gJIREg96mO?=
 =?us-ascii?Q?wnZTKFDjhcNq7geFGsrDanSMyXZXkZdxWUHiBKHE6aFExH+TNDYCYihM+sJh?=
 =?us-ascii?Q?TT/z7a57Mh+GjO3J78sVB8+rwKmPKKm7LaVn5NCA7m51vVwLNrxIYc/lyXiH?=
 =?us-ascii?Q?xx5gTf6o8GWCRNxXJa9CVdm0eCKbyy+cpcuI7KNfPStTOgIc15tkXFg0iP2F?=
 =?us-ascii?Q?ub7yULUSb7JWQEDsLfCRgVhg1Rlgrwz41Yl0/RPy5bzWTNGMgjnZvY5Q3Z+K?=
 =?us-ascii?Q?T/1M6iNOrZuFBBTwuqJBW7CSUnMB/fdyf4uaohXVLMMmxPjbYkctRpEhvcXv?=
 =?us-ascii?Q?D5dbA+KJiGrAfp75+sOZUmphAUrVCxVq/mCDPe4KksfMZVNHMGw6US0V5a9l?=
 =?us-ascii?Q?2luy9mSCyWRIkSzxP+xfkWoHBMIr+uv1M72qgNv3xvhrMJqbDwhjGkCroRjz?=
 =?us-ascii?Q?/4vHjmltOSXMbk0kuuEerkw4injjy3INjFTUoQydvIGVfKxro6Qzf4dtYOJU?=
 =?us-ascii?Q?Acj9nAubSIpK/iCFlf+lfoGThKzGOwe18SpIScleD04/3CZpGAqVcTygkjID?=
 =?us-ascii?Q?r2Kh/mnXIkmqGpKhbeZ2xP5R1DH+XjhvrRY/RjezLM8sXmEcWMAp6Vh9jwTy?=
 =?us-ascii?Q?K+tiZc+glOOkQ3A9PxJkkhttwG+SH+d8zANkhmHRda47whYyWp0+r5SVqYsI?=
 =?us-ascii?Q?Bm4yW4UjVSeYsJoHcXibBHscnLrj/xR0SW83/R0rnPsDKbXwDRTVJfhHjsJw?=
 =?us-ascii?Q?2D5Cxyf9/fb87S8n60W7N1p7lh+MdPvKtauCq9/GOu9mpHBymp9aoXF1wunj?=
 =?us-ascii?Q?sHcoK0jyDP45/6hVqO/D81M8LYIiKs2A7aATqrBPNiXid6CXTf+Jx+rJHRIm?=
 =?us-ascii?Q?UdecCf08tXXb51FdxkZWiRfvSRiFAmSDlzJlye7z1ziN6+4NPBm4iYSUozXu?=
 =?us-ascii?Q?U1/HGfCkFSWLddEJcVlnz3FZY7ez4qiGsc0ppSAKAv1B1/FGgzaMEvSkhF6B?=
 =?us-ascii?Q?K2jejbuTEv/R+snLiwThbgucklhqHpmuQCIu76EfdV2hpxQDUV/fYoeDf2Rw?=
 =?us-ascii?Q?QqfA+nUcEZirklDVkiZ6ZKDDGyG7z7/mPNg+DpJY1lJOUG2ohYUq2ua5vRMU?=
 =?us-ascii?Q?dd0LQmTKotgdq2WQ9rWSyT+aWpBw6atzc7QpdP/bLS/IyQxECbxIzUTvSGaB?=
 =?us-ascii?Q?KFbOO9SvG0MohchgQF7mlQZkpqGVEFfUeiylb2j1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2549890-fad5-459b-fcb4-08ddf9e3ccf2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:24:54.9108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFrbmY/4xyMk3ObsVQ0uEb+PNJ1Oo4VEBJKEqTJM/DTxxhQ7/Z6b+BmyDWDz27nCfaIsjdJEQYTHNaW0yO8SKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7207

Describe the FPGA present on the LX2160ARDB board as a simple-mfd I2C
device. The FPGA presents registers that deal with power-on-reset
timing, muxing, SFP cage monitoring and control etc.

Also add the two GPIO controllers responsible for monitoring and
controlling the SFP+ cages used for MAC5 and MAC6.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- Use the same compatible string for both GPIO controller nodes.
Changes in v3:
- none
Changes in v4:
- none
Changes in v5:
- none

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


