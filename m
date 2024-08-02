Return-Path: <linux-gpio+bounces-8535-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7164F945596
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 02:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C809CB232C5
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 00:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F0B6FE21;
	Fri,  2 Aug 2024 00:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="U9/W0mtu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12olkn2097.outbound.protection.outlook.com [40.92.21.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB7C127E0D;
	Fri,  2 Aug 2024 00:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.21.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722558989; cv=fail; b=UwcrydSTopUbMip2CoFRv3DAgMzwFftZnJO45xc4EqoOiSMVjBogV3Yw6gFfYQPwNo/TnpUsFqD4IaN5uhrTnO8KYXyVu8kaOG34feK05gIs06C49LG4yR0V8DHQCC9CjWS1oU7zUlepGfDj8yZvQWC+WIOkdAUq+CjV2WdqL/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722558989; c=relaxed/simple;
	bh=6vKkz3dmy+9IV71OpaaLhIgsMoOTeMEs+yBUcfdeYKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VEf/QawNdGHgnUWB33vH+6T3AAA3GaeVB4zL/E8NgWtYeqmUYKWo7JLnRuIC/5fV9rZjcdmXbIrX/LY7Y/7SqbUtE9PBjAXFten+sGrLH0r2ifFXK/GgZ3LOjxCv8UHbY9vAJF2357RswXMJ4moN0IOr7UO4PmsAmZYqOXYAmRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=U9/W0mtu; arc=fail smtp.client-ip=40.92.21.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7/YWGh1p0N4DsnOeljsDkWnaMNByZn1EZCNg4DGgTIuqBnJVFmbbOohVErruX/QWNTsMOh/LLedCXdAw4ZUI/sRDGXEZ0k0NzUehVq7rUSEsUXLMaQ/O8OAyvYXhaVES8fR+FvnBUOTnDXpQQ+La0nz5mab4uUincuU28JbNdtrmp7bfP4IHQKjEiAqfDga8pBm+alM2/nGEeemrZ7LAqRGeuILD9JlrvH51iu8Q804j6zl8lFh3mBxJWMPTf6jGWGky8ukkQpPzqDWqh8Yw1kJqdeSQITGJrYsBAcIT0AhtHF9JAOHLNLwub9LCiHU+ZO3b6HyFhkAQbHU/5ZUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tMdoJKUcFhW9N16PjBtXK4Yy/yKi0NCQNR05/20ius=;
 b=tAh7XqBWagfIk00ve9WVe1nZ+Fm2cI4tfuRckRsJuZ+XRxiUyxVYDcYPVqAK4IUWQ7S7h0/wslXJ5XCRWTNvlxroJVWSp+Gx39lXwcOlzTCHl3VK03jxzCyXRTmvLjxHg/wAO+4W8u+JHbxpJeRL6CqAeMZDJuiF+b1AjHiWZBt3oa2u8NnjPEacV+gn3q7WI6gys22N/8jTKEvDy8rhaSItKGEWDxL9sURx8r7tk3rRU611aT2tJPFtlPUSq64xm82UcyXc4MWB+Gr8qAhH0rQnx6jG5ZKPng8Xxzst+QHsCUf4Lf1XfSFgcM1x31ks3q+/uZZiZpaS9oww5Y5v7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tMdoJKUcFhW9N16PjBtXK4Yy/yKi0NCQNR05/20ius=;
 b=U9/W0mtuohcr46jpt0ptBc78F0ofCehulCI0F0DbfgxVd4G0e9LUcio3uZcV4dwQExDvdXtGBrFncwXTRiaKT11jB/nLjg6BD5Vp5scQnxW5ABBr92pPOZDvVR6hTy5IEcxPDqXwmVQb+bQh3GX3RJVOqsjHac6j8p7JMRNXsIAp7vVMPP4lyi1MlxoZKITJikhnqOMBtrVRdEge/wcfewKoEYGz7sIDurqmN7fgKlzLmE1yoKca7klMUXKLrXgtdWygRJbCT9h+Lwx3gkCYOFn+swzF54oKzDqrEfKp2us4ibQqAipLh9ixv8vq4dnvuDS5i/kDxq+EzBc2R7ym2w==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH8PR20MB5220.namprd20.prod.outlook.com (2603:10b6:510:1c8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Fri, 2 Aug
 2024 00:36:23 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 00:36:23 +0000
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
Cc: Liu Gui <kenneth.liu@sophgo.com>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 6/7] riscv: dts: sophgo: cv1800b: add pinctrl support
Date: Fri,  2 Aug 2024 08:35:21 +0800
Message-ID:
 <IA1PR20MB49531F9C8227BAD1FF83CB8FBBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [5LCZy/tPPtjqoLvatJOaO87CQnqfrG0S+as1INjabtU=]
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240802003525.260055-6-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH8PR20MB5220:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c857116-7cf7-4f88-cb72-08dcb28b22b8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|5072599009|19110799003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	41XGmoawwWcysPo+VCW16MbmeOV+hz6VV4hIcFGVbYuDx0SK69z6kdZ1kNQf9Ajo5YV70s90GToSB62IcDMWXJ0oiaZWJ9UtcWCSXQ9MrR//r0YaRkRBHrashI7XsHfyazDzHZSNrj62Ff6Da5afKnkytqk/tRjCqESWWobetd+vtDjjGK8YF1Xq9RsESDMXW7vi6CeWcx/rVb4sVMMgmc6ZVcr7JHekaUzJqxWAQpQxJ7LhwRJwB+NjRPag4iF7RUvPidaQRsqJ2zHSziLMi822DEHXtRIF0GBkSxi0PHRTam2y0+W0JaIVnyruCoqCAlhi6AkKyEJz368mqZ14BBiEjKNGgjkObAWMWYPrG+OqvEQezrMgL8rCHAtmOF3hxMYdALX9N6/Vw1BseKrXwHi44TITeI4eYQv0dxLUPqUCCyMGOLL+H5DK4U5VRMdGE/4s0XwbBM1k5qvnzvYhtcG4AGOpqSAGJ59b5L861FBc2zl9uysQ0vTmhKMdgpFBE+mIRYzScypnSmB5x0r6wDwAHVzDMwt+EZBG2EK5EyyUGPHId1OfQ7iK1wqr8t8R45KAKqSo1Qd/mYts98hTpc2Gbddb/6zt2/IMTIFpwL7Tx8meBMu2p2X9UoFVXkeMpHN32qgdIc24ZzEnadlXdykFK7z4Eeg8HqSttoxKUsIFdgK2cz0oCJuHtWRenDx5WY3vu95CWeSxiBC+G3QQXA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w6aMlojWif8HWmn7ct6XLr9SlTJuwJoJWVwhsuZ3TbEchy1we0PDdeWLpEsa?=
 =?us-ascii?Q?0LuDy+brazZ1PH9E2FfEvi+XsVU/iD2DfkrtePb6sPJAp1HlQza6q7SHkBOQ?=
 =?us-ascii?Q?79jJEDLprwLF+nruBVXlcZTJ3AwCGj4mZT9dk1rtMIyBbg8PiiwFEvZJZnjn?=
 =?us-ascii?Q?saF7hG6u6RDYQp7VxQ7W67JODpEbgdUHbTTIU0PGZiv1J47xMbu880D2eiFc?=
 =?us-ascii?Q?Oo/V9nyF8WcoJl6jSt2N3AzU5u728YacDm2gQEZ98FhXeDzx9jxPfBCiJnkq?=
 =?us-ascii?Q?bVhbxyiiSWNOsG5gzHPumoRVx7g2po0j8zGYrxnKRh74gQaLssq2US2ZAgdW?=
 =?us-ascii?Q?FTKn27JfXXOx+/XZlrytdgXE/FQ4iTncPLH99Htt8TypESUmVj3uFFyMq8XQ?=
 =?us-ascii?Q?YHMne1jiP8nln/r3j7s9J0lUbXC3k/awCPz+B1hyIbJM48QLjlWgPwvGkEip?=
 =?us-ascii?Q?tUeLo24Nr1K0gT1Yq3Raiovnnw5qIuPH+pdFtwJF0pV3R1AH9auLyi6intUx?=
 =?us-ascii?Q?zJOq+/YHvem/fk1j+tbmThU0KW/LPcT1hkWN2YUbbfE6xwu1rAoudxFj9vK7?=
 =?us-ascii?Q?zlwapoQS8QxeSoRYmEVXlCWkISzrKHTHE97ASdwsCaZLUDD43wR0vDalZwb+?=
 =?us-ascii?Q?pl3uQDfGtLd26seAqwunCqqUSpTrdno7gysxgt/z4OCXiuK1PU21qVw5uDtO?=
 =?us-ascii?Q?I631/PtjshMeCkXWRctdS1BS0imjS/Dvp12z1iI6XT7fcui0mGPhEsbo8Mfe?=
 =?us-ascii?Q?zte2pnNzBtc/ZFoSGGekbrqRt4DPw7TJ853U9r1i10/+k8yyvv+ViTwXOT5m?=
 =?us-ascii?Q?7smhlZm5k97mi57nr7sbvoqeQO1QBweDgVjmPuCeeYHGnPgkP4kk/rGoNbu3?=
 =?us-ascii?Q?cZ57XiMAzQWErD5/HhA8HnZb3hGhCcCa/hDoIUH+HRv26NzHZwdJ1Ca1jWAK?=
 =?us-ascii?Q?6+3KnTn54zsIzHYgtLmocqllcqY0m9Tu1n3w+XEgePN70mwONaaV6E3O30B2?=
 =?us-ascii?Q?AwAgnns3owyxHVWL0lBykqOUWSz1ubZR7ai31m8sUE6aucPtqvNvNp1VBH+l?=
 =?us-ascii?Q?aRzaEvK8+BacEz1QKYh3vPfNs9QNxBUsD88/KSmQxSaaNgiZvu2CPTACIVTr?=
 =?us-ascii?Q?ItOfxowwDdsQF6CCG9kw+LhqxS+wJwyzlCqy+pgUxl5dp931vUcuVCDMT9+w?=
 =?us-ascii?Q?iCb0ZKhyfvGsTjiurTpxdVydfqTVDF9zCDs66QKMOCFAyGs1o1Ow8kTcFbpb?=
 =?us-ascii?Q?numt8YRAmuAEK0J5KrPD?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c857116-7cf7-4f88-cb72-08dcb28b22b8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 00:36:23.4417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR20MB5220

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
2.46.0


