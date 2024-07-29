Return-Path: <linux-gpio+bounces-8409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 436BB93EA72
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 03:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB035281554
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 01:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233D58BFA;
	Mon, 29 Jul 2024 01:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="NNyioFz2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02olkn2032.outbound.protection.outlook.com [40.92.43.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56622168A8;
	Mon, 29 Jul 2024 01:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.43.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722215008; cv=fail; b=srx/RQyiJHOx7nBHBfP50R/an6b/RbufkUXzJW7cn2CCnjHtg4eXih8w4HGcLYecbH+8UsZ4Um77oR+SCxQ+1mSUrLU/MiKMeexU26AFAKWbSeHUqCo6hSH68YSaXwc8A5ktee3ITx96VZDiofKvcl7efIuTtnkLccJgdAPWu64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722215008; c=relaxed/simple;
	bh=mKNcFXjZyHeRfsdDnmc48uVYaNn/fbMjnBMMJCNRw0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PM0iGNvXzukzHCnEKXHQYhQhyFu2cqdegEOk2cx2U+F3A/yh4JgMPyAKvO0E2BD+gfp6t0IFa47ik8cWZ7/DTP9IvbrBMSNylUzaVpybqeBAkKU4xqJZKxCAOtvVCFRRTSI4ZQHtgaOr1caeQAsjOaFxxWT3BHJSlJ/tBqqxQmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=NNyioFz2; arc=fail smtp.client-ip=40.92.43.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ex/+di1FOsLL5rxc1tp21sy6figQUrN7eCnDpOwg++K63Lks5AbOzs+bTmG3y7+we5KcLn9SZTi+R2ZpoPA7t3dCCnjRs8h84xCFZvDFBnJ3TdvIZ2TNhQn3Vg1kxxSmpYaT5iP3ehmWHnyw57nF/LHmy20hQgquCZj2NT9/ZaIVH2xk+bEcL4TZoOhF0GtONECyIAB/6xikCowbF/bZMIpFTk+3i0mYfAAJ07aRLvUNOdfFdHmENgImAwvhsfixbzdbAXeNinaywJOAnrAVtqSrLg5l9AUJq19fpMEPl2aI+QKRXXc/1yNTVd+aEiH4Koo7W6zOjLB0ApgD52Ji+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KADSTErtuwAYNLfw2e+mQTldxzCTuY0RDEhxiO/qFbA=;
 b=P4QwXggvwLUtISe90touYNjFMtVCH3PMcCojEiCjMLhlwwfqaHs8ba3sIw1ycoxK+ovHtb40o/NUNVgAWtfFdd9rxk2/o5RXgNbmzQbIRougmX2rS5TzGT3DaqAYJQFmAimdky/5aIodVvlALICs1KL+7FU5876ZrZ2cBjOIHEFaDjpFjVQ6v9qY6KzPWppfP+MJxmBmrzeCtZfnYVEsXgLAkXU+/B2tdB+4SUdU0zXzJCXHStb35p07lmnic4pcTItAhdTQVbsHbg9+6+/Hmn6kFS4C0SLnXQzqfuPts0wAScE7eO+kSDSRwGdhwu4bRPI3mkDC4SS1gaegrp53NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KADSTErtuwAYNLfw2e+mQTldxzCTuY0RDEhxiO/qFbA=;
 b=NNyioFz2JmacMDk7GnyrEsO5l9YgBlzSFu7SraFdMBh1En86Ef/ArX1jAcd8X2vBXM5Z+JpPNvAA83nRYEugAP4IlIAkAIn8ckHVPG89qTNj9VbLsBXOK/RjgCEVomHT0uYc5rfG6/VebXDcgvDvcrlCLC9VtLBEL1VwOJqoYcOTJ3yTL/ViG2R58+pzV7McSaSn6x/0GKa10IGkk64plRRizgcp2FGf7WLO6ENz1lEVI+OUxDjCo8hTLqafSxbadr9Y6652vusfgItGTWDktzB0pgbBLM4BqSnIf0dxw8DvFIoRmgfbeg99EawoU/S16PF70d0otdbnoMOe1YPPdw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV8PR20MB7300.namprd20.prod.outlook.com (2603:10b6:408:232::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Mon, 29 Jul
 2024 01:03:23 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 01:03:23 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Drew Fustini <dfustini@baylibre.com>,
	Haylen Chu <heylenay@outlook.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 6/7] riscv: dts: sophgo: cv1800b: add pinctrl support
Date: Mon, 29 Jul 2024 09:02:32 +0800
Message-ID:
 <IA1PR20MB4953E9C96270B7C648C976E7BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB4953B8B0014FA82A8E141CB0BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953B8B0014FA82A8E141CB0BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [jzvwyg5IMSaDhRSl9d1aGJCwVAjYXAq8s7CwiWwSUgw=]
X-ClientProxiedBy: TYCP286CA0234.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::6) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240729010237.650411-6-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV8PR20MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: 270b5553-330c-4476-2bec-08dcaf6a3ee2
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599006|8060799006|461199028|19110799003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	tmQnGzo/kri+CJigvwcFsfKC9JJR8Pkzyi4khcWyL7dhQg+yFLfm5XHmn5Df+jrb1jNfvyMoJQ2YP3SXwcbK8FixTFU/6S/t/PDFPmykmJyD0IhtmTcJ0aPhf0irnzUN5nhnsqVYTy6XExv3MqGczOTKI6Fg/3ufIjjdByRrzjma0pcWZyb1Gr3c27x4oaVwtlNjdV033XPNOAdP1I5NEfMXy1ofrhXHru3JmNz+lnB8QMe9UqXOiCRKSkwYIJx6q7aeioQwal7uaQ9Jn8mDfNW+pZYUYf9plCPdQ7q9sOrMKLpZKwfY1pRI47axmtYKk+7juXGV4Exd4Nqu/IxVAwU7+heZdQGksYv1IGjiW9U4FfVMdjP+eF84PplHfIJYOJ0vzCqrSyEp8x6x+EtD1MksxLE5s9QNlp+2NOtici/jG3cs/wEt7idqbnTbzCScfU5bIoEsBawF8aSW56tpqdgO9/DIPLPn2Xm8MVpuLfhGspEAxzwG8kkti8mmTc0FZwz+kRMzNrSlUWyi7b/vv3bclPzE3qwPLZ6HecGtVO2YnKmv/dHHub7G/R9YCELmffiUgwqmXSdeCVKCxivk7Uzn9qZYhIvzx4VfVA0WwxkcW9j5CWyGrcDgVvxtJCCX3mWUki187O7jHuI57yyHoW6iOi3CvOkzIS4OWUV2jXkGMzQxdsGqfQgEkQxSBnlLNt6s+3teaHWOJAqgtn9QNg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b5ow5lKU98OPe3DwUXrxBC7RPPXek92ja5cJjYy+FYZz5cjr/1UCHLwhI6ze?=
 =?us-ascii?Q?1mnplIH3pPoiG+YkVUn4/CAa1gjJoAfO08ljQVGZMeWrkn3ixuG9KDaYFbC0?=
 =?us-ascii?Q?2VojYHtshnsfohLv0JyW+lj/AnSJ6G+UpjiJeU76zVO96m9mrwIjbKNMjd9Q?=
 =?us-ascii?Q?h4bD955AjjijzkFW8n4PvSiTe2CcOT3b/7PPjbbyDzploaRiflIjpUrB7PX3?=
 =?us-ascii?Q?QRRx4XyYKYaSfAfqvvsV2p4SR6A4/conw8KqLkRILfO+iGwRfYxow6ERkV3J?=
 =?us-ascii?Q?CkyiUAaok3qWcAJ+YqDcnSITcqq/2oIyOOoPAWY334GE2M4dKkU0m7J90ILJ?=
 =?us-ascii?Q?tpzXvQRi2of5X4oOihSEZRseFL/5xahcXCEZHm8LR7KA671Tlm0zv+gGDxaF?=
 =?us-ascii?Q?mBJ9ZT/w5mN6RRzDnaXO0PU6cSmhzC3at6NABZRFMnc9Wre3W7tZx8vMCUvo?=
 =?us-ascii?Q?Vj2IG3TR22HtQ9iMkor7cGf36O87d5MJ3sHHzpLduDkGtb4p8e83xv0FLGUc?=
 =?us-ascii?Q?+uEXjIXpTczOuG6JR1/xGZY5IH4H7TMJGdCLJAX/3grnrKLI4JBlW300gUTK?=
 =?us-ascii?Q?PR6iEdHk6nC88HJxCKULo54SxgJa+heeOgKVaOSIapAmWhS7kO1LZhb/7iwn?=
 =?us-ascii?Q?CaeD7/XoF3yTRmE14ycOYF/sTZyXATGoxROKwZ3Gsin8wwmsCStxjEFQisbH?=
 =?us-ascii?Q?gwNuCy2H9be3F7a8Jjnc595nWmhdr08FY09oRmtAXfUEqgyOTXynBAzffmT1?=
 =?us-ascii?Q?okVk/E5bFvaWw0Q9tBPzMeSZ9N4kboP0EnZv/+aq86F67z8nROSoUWUkhxe8?=
 =?us-ascii?Q?mze/a3JPaLA4dTSH8OlacBfuoB21PSENDQuIT3u5c4QScKbka7jgh/eS5i1d?=
 =?us-ascii?Q?nf7PWST1XPgg45uYzEs3fnNAjPOSQtfqwm9PLzXV1BX0o0vRVcPqzKS5asMg?=
 =?us-ascii?Q?rA29ZCMjXa+dfd6JZqBaEai7C/yFhN8WOVAGuonf3nLKS75WrqEwu3ooUj84?=
 =?us-ascii?Q?mXSihsFzWU1HEuKcDvLiXP7dXo6JYE8hETl2bL0dBNsV0aHKo8VdNcHbhLeK?=
 =?us-ascii?Q?GARPQqoJPWbM/mNn0uty1UyjZbbP7lvbIEHJk1Qbm62PtXy05gylO4Eecxsi?=
 =?us-ascii?Q?T7807m6cabBDxAMh2yy6zwdCuHxru1yr0A5QYSK2/YEsz7fCOqG7pB5PNKz7?=
 =?us-ascii?Q?gZN7TdTfNFlreAa4n2NE4BNSa5iPWjFK/e0LPq+qtj+mr376jS7cI2yJuhAc?=
 =?us-ascii?Q?uDAE+9Js4gFp0nJ8u1wx?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 270b5553-330c-4476-2bec-08dcaf6a3ee2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 01:03:23.7499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR20MB7300

Add pinctrl node and related pin configuration for CV1800B SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     | 49 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 10 ++++
 2 files changed, 59 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index 375ff2661b6e..9feb520eaec4 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -39,7 +39,54 @@ &osc {
 	clock-frequency = <25000000>;
 };

+&pinctrl {
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <16100>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
+
 &sdhci0 {
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
 	status = "okay";
 	bus-width = <4>;
 	no-1-8-v;
@@ -49,5 +96,7 @@ &sdhci0 {
 };

 &uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index ec9530972ae2..6a958b822097 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
  */

+#include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
 #include "cv18xx.dtsi"

 / {
@@ -12,6 +13,15 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x4000000>;
 	};
+
+	soc {
+		pinctrl: pinctrl@3008000 {
+			compatible = "sophgo,cv1800b-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+	};
 };

 &plic {
--
2.45.2


