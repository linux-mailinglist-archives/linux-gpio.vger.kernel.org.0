Return-Path: <linux-gpio+bounces-26462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBB5B91AA3
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 16:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 286432A547B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 14:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD09121ADB7;
	Mon, 22 Sep 2025 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GxmXOLCT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9103C1FBEAC;
	Mon, 22 Sep 2025 14:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758551089; cv=fail; b=oVxQ4qCKwThcLnEvf5kbObdp0KSt8JT2Mfq5qShj16FjNJj74qZDkn9GFlOI9yItdDd/o1ITlih50zGHTpz1UQRrypGSc08hGy/Us5ntD4Q1bncPHWXhZWcm9Ad4RHwQQo/q6X62UqfYxjwHg2pDTtDUkrqztis6dNVJ5OCRmWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758551089; c=relaxed/simple;
	bh=+faG4TjvJRpzpOd0IQZWHXWAeTlpFpb+7mC+jRnqfUo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B0RtaPEWzH6luZh0BjR03lke3BPnmMjyvwO8/O4scD+LiOquDoxQdJ3OxCdLMtrQW+KxQNXmQeeL6esyoqDomythBDKS3DF+j7nU/v0LPjEUOl0nePAXBULH7hmaJXkXyiUBlixRYfWBRZQA8V1okl+r3T2z2Mcq5iTUb33XeLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GxmXOLCT; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gc5EiqISOkqFDHSGkvya6e5ee7Ms7rEI6WVuV8Fjrga6UqUQcct4zaTlU7YDCYj0t/NhKeZDJD+SsPxglLDpg891VtqKnIMbxX7NoCC6P7ypLonKWM56IOMT8i13QZCxUfT/kT0xmqGgYixEKdt9qs5TrAO9mUGVPRqSDexwzs2WTc9FFN6qTDvj4Kyrq//tuES0O7DzGIJNdi252NnEh1hjATC0LJ7iwyFeTNdur4cASaa1H2YBf38nWFtoMzWo/WOyRK1v0W/OgM3G8fxLGx6Qfb0SQf6yLp43xSwkDlJxfWMoi0OmHPTyPPR3zmN2Ty8FKOnQ7K1TfLGRODINFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKGE+1/PMocjJgBWwJWKTRjIwOPtCgxJvLq/WfrNddQ=;
 b=gJ2MMHb2/S/YQ5vz4mIA8x8M12wi9S1i7hsPuSylJ3BUznCDejsQrZMP2SWvczU127eLp+CKzO8CFFYWXwn84VjZvnMacFWHDYUWLPTSNQ/fspyRsseE6ElIE7HNoMb25nXVsJ1TFO9QNbBzhC/x7K8I1b6fzIc32YHH5TIc4P+oZ6m0UfVMh18HXEcF4sE1zhBa8r4Pjfye+LEigoGW85c4lDwFPCGjnTmVx3JiYzDclqQ4c4oX09CR8K/vMRTObeorRvKUGwzcr8adIpum1GXCCkqTAQGyLfWk+bQzekFMv02EhF0pKfTPrZpKE2/vRW571JKpaU+tq9dMUtQ9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKGE+1/PMocjJgBWwJWKTRjIwOPtCgxJvLq/WfrNddQ=;
 b=GxmXOLCT3HGd/5mC9+lRfv/MB79di2/dcwcW2HE+YvL8LeUw4DXcAe58JGt4rG/R3UkQiQ57SAY1aUb1PxYEIbCYghlIabYDKuChswrlSZ35/UdUUAlO+0Dqms51S61fzZyhFd34Mtg0ilv3dZ7yfCsBMPFgfSlvALWhuybDP11BjSVXPAuFM7EbArovjYbybG4Kj0Z2h6u3XXjX7SiiOmVH63907kLQ1I0ZA4h5T5bLIm3FpRU1G0zxE88UXAVwNi2ASW67AQSMQIlMb/kieehUB8gSlqeejQ+Ac3LmwjwdYCdq/rBkBpQ06qViGFu5CNqNLNj0sOEftP96IQrvIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by AS8PR04MB9062.eurprd04.prod.outlook.com (2603:10a6:20b:445::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 14:24:43 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b7fe:6ce2:5e14:27dc%4]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 14:24:43 +0000
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
Subject: [PATCH v5 01/12] dt-bindings: gpio: add QIXIS FPGA based GPIO controller
Date: Mon, 22 Sep 2025 17:24:16 +0300
Message-Id: <20250922142427.3310221-2-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
References: <20250922142427.3310221-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0038.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::10) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|AS8PR04MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: bc3622f0-c927-43e8-be04-08ddf9e3c5b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?X+bBN2WFIDHBBzxmx8rUzrHrYB5EzG69TiLPfBu/Mxkn2wWuL6dJbRttF4Os?=
 =?us-ascii?Q?TDm4H2Vr1HjcMgO3yqp25cqal8/aDkqb/N3/h4S33Os67eCMPrj1mPX2beCQ?=
 =?us-ascii?Q?yf/QMP8/OipJquB/PDMzK+cMfhHiXu2wgy1UDQSIrnSBgS4gNZIPPM+Sg1Iz?=
 =?us-ascii?Q?wIHK7pSrFRTR9Ov0Y6DSfRjn4ap0PMnvMA6AdIJuq+MzKZUQWFbjsv8/KGZf?=
 =?us-ascii?Q?6wG92tSL6ODNggU+17mO3wBZHD4Ep+0iJPAAN2Woi6nvmHDv6FW98hA3pWCR?=
 =?us-ascii?Q?zflg2GEy9ltPJVU0Kt+DGxilIgh/TbHVbTuFf3wnB4oQgEr2MkXFuVZMpgpH?=
 =?us-ascii?Q?5ZiXdeddrVWU1Uzs5CthnQW5DU3Wt73DVaD+yZfmaNkSsF1LVlJ0CSwjGbRp?=
 =?us-ascii?Q?o2aGq8Ud0Q/sed2gAXb2Mqt2jEts8ipLNWQQac5M2BU0BiP8NyIxNbviqcHS?=
 =?us-ascii?Q?2PqIyKetXKMBgp+48Aw3aeGEO6ERhhbYR+b4A0Ma7cNTqUGIjHHygwXk/ytD?=
 =?us-ascii?Q?6Tv/nwZFDJA5nkgj+VLA05o1BAmQNgw0brUI1hU2Y2Y6Y60MGnwqSYlN4TIu?=
 =?us-ascii?Q?tT0z1Mj1DFYqKaS02HcvTdYM5u5rc9P4DsX33QcP79NoC72L+bKXngmR1u4R?=
 =?us-ascii?Q?/tnFeQFV23yJorEuUTaemXmZUoPcGxszwZC0iL9oP9MRWGTANm1eawZe1Myq?=
 =?us-ascii?Q?Ciaw/kz8fH2P/RzATtAaOGx0VLWuW4qo7PISYm+65a75KvbE6lpy6wfOMB8J?=
 =?us-ascii?Q?dZBIdcW/3veoG1E0yySQrEMbk3syTsYQEflyd1pQ3P6jvRJAIbogx0Ks89zC?=
 =?us-ascii?Q?brL2UihSDhY6SEBXi8ZRyWnZMNE8FL1ioBEKtH0srZG/8xxsz2sREwp2NtRe?=
 =?us-ascii?Q?BvjqcBupb9euErDxdmyDWPNGmTtniconLPdmC2BbC/mmDYzzVwlQckiU9PuB?=
 =?us-ascii?Q?+UdV97q5BmR6wDqdfLCMWk9EJ8Ku4gge8jRCXz4JHSv9Ox3Yo4SwteY6LQhy?=
 =?us-ascii?Q?U+squDUieg12gbEgGltxXaNr46Ry4irdWw0CA5KT+aqXwgUXMdbz69jW7Ky2?=
 =?us-ascii?Q?7OeLmRHkzVJlHCmfMhZUk/dnNYNmbMf4v/jTVRE2viT2NzbiFvwJ+W0h6i+y?=
 =?us-ascii?Q?j0gtnQGhurRfzE8HnSGuOeaoGQ8f0yxagOMXBHe9nWa9IbpVW8T6BUIQZAuL?=
 =?us-ascii?Q?iFtYnkPv5qC3WqrJKWAlT6i9WcnOJVfDZN7jBPDZeBXt0brqrpirplpzI/3d?=
 =?us-ascii?Q?0lIxWnVdB1FVdm+XTI6+pIwra5ocXOmEhvKV6Uuj+1TTPDJSPZt/CMAvYteD?=
 =?us-ascii?Q?k5B+pIRH9yivhEYFOw2a2qtbGxg1CpK+IR38VHkp9/mA8vEQ21cpexl8QakL?=
 =?us-ascii?Q?26TtHgV5k5QSG7fQSNtRF3c5eL8EmTuCb8+5WBiPAlISjiiPR6TGjaO5Y/ok?=
 =?us-ascii?Q?gOBWKxtGJq3ZEmqO2skyZWvav8X2Mc6B?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?SU/ZFpKqcUmjvzv5y5eWF+OQaJvhkZ4tniEXWBJBOjF2Gdj71L037XkI8W2y?=
 =?us-ascii?Q?ZFzneqQPN1fdoquf2uM/wpGm3/zu+YuKkK66kDnboRfNwlY54ZfvDkngye5w?=
 =?us-ascii?Q?F8S3Em+tSjFS48QZ7jRBKQrDg0I/GCTNoMZjmmhS2HF5mTPXtGyE/uOiihqD?=
 =?us-ascii?Q?F+i8S+GqNOwPfcT+xa5QUr2zNOolukUS12FKSglvzwwjBDMlH3WJJ8DkJIlt?=
 =?us-ascii?Q?0pf9FdIovNYYCT0O2w+fvJOuoqvL/cEbouNHYOH8HIG9O81VT2t0GBxAkoW5?=
 =?us-ascii?Q?4EQrcKRrr6m/nhD22V8H5Y41pJFCBYP7WoJzmPyGHIJJcR6LFCjPqZF7mtsX?=
 =?us-ascii?Q?5pUKfUxLi19F1To1L6Kr4mTHVT2IqN34eYW2ZwwTyTxqVlvjoU9xePX15unF?=
 =?us-ascii?Q?oI2mjy0V6Ao347ICyWVDaCMdqdd8pSbgCauAiQjZ1FFjX92glPISwiUTJHA+?=
 =?us-ascii?Q?pLd5xP3YxtQeDOPT8BVB5SxvVOlRfIE1BeeCGcvh5vequ/2zfSBzFw6S75Fl?=
 =?us-ascii?Q?h5FweBIIvbsoSVIii9Bp9ShoOW4oznaSdJOpYsHexI/gBw1+HWQAguEWT4bT?=
 =?us-ascii?Q?paw++ZisnHcly9d2MIUtfG3XJt8+u0UGbks22XT135qa+o0KOTM6vJgTpZZW?=
 =?us-ascii?Q?aEaizMsbUA82194T2qSW2r+kEkuWFWiVKMEmAHUUcTrGGg6azDaeMobyxAhg?=
 =?us-ascii?Q?eFGycwuBVClMZdbAzGBFC2ubG51ihcHTqprL0iSjDKcJoS9oO1+7hQY0zKNZ?=
 =?us-ascii?Q?6F9TJ7VMDyzCLdiLNF+ftxFTNDkOMKFrkbeiCS7caQYq4KJFndTIgkEoaoHf?=
 =?us-ascii?Q?HfIOv4EtjDF2FzqMNv26yeEPtVisk1oyFJRoaECEutkidGtayWB5+Z38c4rU?=
 =?us-ascii?Q?Sa3mu4YxMow0ppx9pgGrMsjKBD2YV4m2UMleIr60DlK/f6aK3gkeFgu9QBPM?=
 =?us-ascii?Q?Xj/YoBbfNA03J+ZbvWQPlWFg4xJPQj0S+Qnn+97tPrUKFi3Zlh3vXrHoeWoR?=
 =?us-ascii?Q?V+7DR7uUc1z/gCtLCAgx8g+huJm62kSUhp/n0VtgAUWpUGUJGSt4rmXJQD1N?=
 =?us-ascii?Q?IuzX4NGgLqsiC9hP06JVZ2vPGvrt/vSw5PXXu8TY90mX87kz8DWKUPhzFAYZ?=
 =?us-ascii?Q?lGSoy8Av5VZV07FKMxPJ1ffQBS28E26Ig6KEa/k9P9cgDpYBqR0WAceTr+jE?=
 =?us-ascii?Q?8SZa6WdBdFv9shgyTmAzIeuGRcOrK+/yGGm4dRs++H0Zbfucku01j5DJqssu?=
 =?us-ascii?Q?WaWRt595BQXLVTKOyFC3oiD/nQ/FC16wAt4GmJumz150sOlIYsuZwS8u/OoO?=
 =?us-ascii?Q?ALzzsU7z3nXLOyBljYlIFsekLCd5dNOIOPavW0hpruOnpoG8lKnLYl08+pjA?=
 =?us-ascii?Q?3rhT9+qv7KjpPtkgBkQ/VBgq5sOVdUMihy6H2wH1u/FeOMtCBcgURaDEFDP3?=
 =?us-ascii?Q?ETv9qbcfVajjf880leoLrQoPytjZTMjm9zHb87HHxa8fICRA9v6XegMLCAAd?=
 =?us-ascii?Q?P23shDIKg9jIGk61yv0Cgfl6wYr32DRGh1ob8bPOcAZZsg2hfONSxV4ZCaCF?=
 =?us-ascii?Q?NwgZMKQQbkMzodR73MO1+kfm43gQiSpLg0unHz12?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc3622f0-c927-43e8-be04-08ddf9e3c5b8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 14:24:42.7998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRZ3RX0gxXEf3gS1oDPrqJw6G8yPt7cQvT77p3g+mLTUgE1jvVeHLyjjGRbqKZbcAKKdcL8dGzJ/LfNgudHwfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9062

Add a device tree binding for the QIXIS FPGA based GPIO controller.
Depending on the board, the QIXIS FPGA exposes registers which act as a
GPIO controller, each with 8 GPIO lines of fixed direction.

Since each QIXIS FPGA layout has its particularities, add a separate
compatible string for each board/GPIO register combination supported.

Since these GPIO controllers are trivial, make use of the newly added
trivial-gpio.yaml file instead of creating an entirely new one.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- Used the newly added trivial-gpio.yaml file
- Removed redundant "bindings" from commit title
- Added only one compatible string for the gpio controllers on
  LX2160ARDB since both registers have the same layout.
Changes in v3:
- none
Changes in v4:
- none
Changes in v5:
- none

 Documentation/devicetree/bindings/gpio/trivial-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
index c994177de940..3f4bbd57fc52 100644
--- a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
@@ -22,6 +22,8 @@ properties:
           - cznic,moxtet-gpio
           - dlg,slg7xl45106
           - fcs,fxl6408
+          - fsl,ls1046aqds-fpga-gpio-stat-pres2
+          - fsl,lx2160ardb-fpga-gpio-sfp
           - gateworks,pld-gpio
           - ibm,ppc4xx-gpio
           - loongson,ls1x-gpio
-- 
2.25.1


