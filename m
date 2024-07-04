Return-Path: <linux-gpio+bounces-8035-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C45926F15
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 07:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5911B1F23589
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 05:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72FE71A0AF0;
	Thu,  4 Jul 2024 05:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="HQ9n8h1E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2060.outbound.protection.outlook.com [40.92.42.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAB91A08DE;
	Thu,  4 Jul 2024 05:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.42.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720072075; cv=fail; b=EwVQ56UPH9d8nyHv1puZEMRD08xSTO3VowfnpYHYb/Ms79usJZ5zDiISs33cnhNpt3/gyu+/O9EHwtggKygE2eJYVgvytO+N9ksC2fF4D2ji2C12iPro8sXiKWTkV0goNtw1wvCSLQEUvuoKH3m2O2w8grryynAmI8ftge7MdWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720072075; c=relaxed/simple;
	bh=7EXkwChZ63UJqzoRGabKR2gbVGn7fwypkUHSPKVsM9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TvA/57jTGtFNNRMUJbxTC9PIBdzNYkWcL5AD8y8SlW36W6EXBy3cKk611fL7L7GCMBfdrC018aBIdZ1K1Vl9q6nJgWpRYMzcVTwN8DjXjsU3CFxNG+Cn6GHzGxYgw7SmKVv4p/TQnWdM0jc8PQ1NFbVB1KZ1MMFfzKCgue7tsvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=HQ9n8h1E; arc=fail smtp.client-ip=40.92.42.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpVdYjUfJqbRtBqU5PZNQwQkI+Ej+A+JVILNEDP/pz1kOiM2Xv4vUAqq5O/2Cep+U32geqOLZ9Ga36oUzFN1jPkqvQ61yjKd9wt0FfAWEN9CL77dVLLH0LEze4tZvTB94pyzE1g4jgG7jr21kNNAnqVSSjU1Dnn4xjoIc7FCPOxduQZCS5d48bJeY85liGVfSj0WgHjzP7lDXBcRBoALrWko9uXZLYg0yW2Sfa0ChElAUUyGVUDpoJT7OC56I/U7fP+Ma6nML7pNBbHlP+cS7opHFJJiTFF1gGxKr3DiG2q/0AsaM7rSkEWTKNFlb+AWwFE1z/BIbFYlDXQKT0tuVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vgqR4RoQwuztUJqb/siUY7tTgEmE4Ogs26S4ZfMSQg=;
 b=F24CkoUUpbRkRzHLXilISJOj4r3PdcAXMy0RvZQXivcArxC19Gid1rzbn+wx4I/3Dx6GCNbf7LtJDQUmNn83MW5mL5UHjHZERF1c6usNqiz/J7biE1TR/CkXWiddenJ5g6YhVUS7RoyAzigM4FALLzWRTmNoevdVX8nDJHhly3QJXkIpv/QDfw2wPPuqxl3v0tXRrZGl9OlHvOO7AtH6jSVY0rUjvmxlz/cR9rUlb19oIIiVsHT09KtBLDPlUhiyuL9F/5n+V3LFvi5zVztD2Q3CyedAZbw/YAzkuvxL8BobYOaCr6v62n2rDScqiuM41G9mhvzFIPWcuuFZOVC15w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vgqR4RoQwuztUJqb/siUY7tTgEmE4Ogs26S4ZfMSQg=;
 b=HQ9n8h1EBCtvlRYaClug3M3GVN3+D6o8E8XduGquA6yEBcpXlDVPwHYEngSgA/7AdrWKMO1+4PEKD3E+G7fn6PFrAoQuB5chqwCjE24ftoV0VhH1SNpA9aNtO5/A0/PTP/dTS99VAYaTiohz2RZU9jTtes9GDczMdG20dXRrPGsdenuxHw/6oO6oLcQAAg9I+8QKL3HlXT/X3DCKo4qZfRtXpkfihXcqmZ4DjN1KT2E5hqCnIAL+RE7RcpfGdUjho20jn3EAbXt7l7m1ZUCPOrxRblcLwIpGyH0EQWyY1siZosjY8ug6yDVQYRa/aJ+G/YRcY4QR0jyTdNZnFB0Rvg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW4PR20MB4293.namprd20.prod.outlook.com (2603:10b6:303:184::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Thu, 4 Jul
 2024 05:47:51 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 05:47:51 +0000
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
	Haylen Chu <heylenay@outlook.com>,
	Drew Fustini <dfustini@baylibre.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 6/7] riscv: dts: sophgo: cv1800b: add pinctrl support
Date: Thu,  4 Jul 2024 13:46:42 +0800
Message-ID:
 <IA1PR20MB4953D8E70CE81147D1938B2CBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [bNbiyOfaM9YNFGSP5+5h5HmmCS4vCjp+yyY6i7Ovakg=]
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240704054647.1747392-6-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW4PR20MB4293:EE_
X-MS-Office365-Filtering-Correlation-Id: f3ced59c-cd0f-41e4-536e-08dc9becd79a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	QKp2TL7w3kNSgbOYLn7fRP0rsql1/ZP7SDnfij/bUSozG3FFRCrv5VAYAs/ggUQhhxnuUDU5r+WWPRQ5UtYWMfJpYNb7NNqVHXOXoAL6/zg7tntLz1JInbR89wxEuTdgWqyrEakUqpSJnSESlaFNWLefXjBh256B//yerEO20ePraOyLjtEHWcR5rUbelLdOz02Y1rHIl0SimG116I/seCt7nZ87PWAl3RHIOg4Mzo7hbzxNy8GOjrxSBCZ7r5HyUsjNJDy388KCrf/S5ostcKioOotbdTEul7mi/Xtx1M0C0H8mkM6mdJmDI3XsjkQ08MDZLdOGcFkUWYoTZeZBSXcPHFxDKt1j3F1sVDPEMVewNMap1oCtVpfYn8PjO4ynAUn3c6iB6udKKtpT/AJBHT0H2MVYqqKvX88eScY8j0wQWPJbfKNfshx3MKZloYNeWwI21UOk//X5Xj6xLnixGw81fUVg7K8zfzlV4QqQ+sV2svncwZ8M4KST7vYVu01mR0ORCRt3w0AAQPv752PrcQ29XxVhYz/8SkCOBZsq2KQnohx7uDGQvxw1VGVISn4HWglpTN0dbNQnHb/hV8hEWp/9Ihd+qoolsf4mkYNnKJezGoZiur2tlaTgt/L6+wHTsCl+dDleGnlszXkwk2ENrw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sW6I/AZkQc6z2HAP7yFBl4MZJDr+B0LP2qlGME7YE2uJRY2/c3d9YUaoI8MV?=
 =?us-ascii?Q?vZGniBlhZQ1zVmEz2tj8uMVkFPU+XwP1+XFRnfReeTSLowQ7Myeqeew0KyfN?=
 =?us-ascii?Q?QCehC6FWxZfEAslUtqWTNbj6wsMuy+nlM+VIFQOwiKLkQkZLdxlrHMXcowWn?=
 =?us-ascii?Q?aikY0OPmCU8YDTs/IQDfqIGLcXtj9t4DdOAGPmAfvzDBPZR6pS+4TsXdfnj2?=
 =?us-ascii?Q?GR2heP6CTMMCJZz+XNoFpMR5O/J5Q/i9w8OZRSUxixJDGY0aHrJJ+HthkiSf?=
 =?us-ascii?Q?N3QoXMU6hVnJtVlS3fQX8jmW7T+bq4cFKmZAdNO2uB8LQNc1a8c/Y8Uvcpqf?=
 =?us-ascii?Q?bVeWxqX/1KVZSkPwMeOdpYejchvx2kA+E6pDUEH/sSZ6kJNeSwIU5J16CsP7?=
 =?us-ascii?Q?uTQyLSCy3JvdhpFvBA9Gagos1Naw7G3CmiqohP2Dc5thvnrmlXUfl8xGnS21?=
 =?us-ascii?Q?yZbsXFKxcth21fcpyO8356hMg25zWrBs5fdc4/gXZnFw1bcBui89b4D0PNFP?=
 =?us-ascii?Q?RngiE6Kk3Ba1WHY4Jlt4ORivacnREU8V7Ryg201RCm87a6NF1GvFzCCiMThe?=
 =?us-ascii?Q?BnWF/BYfYdLrdgr3dsQh9iGGadMVEvLGKJzkVWjdS63mDzzdlH+u69UMRXAY?=
 =?us-ascii?Q?ZL5mIfrg73TJkJD6ZP53uPSxGZE8uS/c5lbQDW39kWiUmKEbpQF/O+gLqIYw?=
 =?us-ascii?Q?gpfMphZyqFu0BM3O6fiildU54DnJN8apEcguie4Keje+R45p38My4BNMBHts?=
 =?us-ascii?Q?1fy+JYxPVieaG7UR32WM24ufd4dvUrUlNaNjGaz2tG8VpmKWH4gsiTvGoqbg?=
 =?us-ascii?Q?tgZTxLCZ65X8+rBr/FuFdwLChfqG+//YWuEtZjegxSnFnntMq6qGDEyAIZY3?=
 =?us-ascii?Q?5KU4pRmcd33cadhYlDSuQgppfpV0q277iAe/B1GKWGzk5Ty3SwFzWWve/Pyq?=
 =?us-ascii?Q?4g9i2PEFp28CJZucO02GWyDhxPIq2ZAe0nAfGtjaIRRFaPnkyujGPFJcIYiN?=
 =?us-ascii?Q?KBMWh5TgEynmYovEaURUKGDL4/wzYT9On5XP9LQYQ5taQzch9tNui8hG71QE?=
 =?us-ascii?Q?dzmpFG6WZY9GuGqZlCk10IAG2vklmiWbLGah6a2FxuIDMeoTqy+pRIYbVsYw?=
 =?us-ascii?Q?mPUJ0og/Ik9kfwViZqoAX3bgr+n7SElRo9qUwqPMSOOdpCmpqGkTIcObFAxj?=
 =?us-ascii?Q?OAzjoIssu4H35rb60yRexxka3Gj55PNeI8z+dJuYvXEbeeeAIKJ4MblvGd1i?=
 =?us-ascii?Q?tDszEX8eb1nIqnOkOlA3?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3ced59c-cd0f-41e4-536e-08dc9becd79a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 05:47:51.3031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR20MB4293

Add pinctrl node and related pin configuration for CV1800B SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     | 44 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 10 +++++
 2 files changed, 54 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index 375ff2661b6e..a099746f95ef 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -39,7 +39,49 @@ &osc {
 	clock-frequency = <25000000>;
 };

+&pinctrl {
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+	};
+
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength = <4>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength = <2>;
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
@@ -49,5 +91,7 @@ &sdhci0 {
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


