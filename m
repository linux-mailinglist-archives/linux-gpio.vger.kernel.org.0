Return-Path: <linux-gpio+bounces-8335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D938C938757
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 03:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F3FE281283
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 01:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4C3134B2;
	Mon, 22 Jul 2024 01:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ElkXCvWv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2055.outbound.protection.outlook.com [40.92.20.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8646C1642B;
	Mon, 22 Jul 2024 01:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.20.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721612426; cv=fail; b=Dr4qaNWTAE0bxcqMyPtciUbt6zr267n0LtOXZg3JPGZQ5Cpj4GcqNqSgDmbrG6eDjNwd5ziwhFsvoIV8zZZQpsOb8jUdGtX5NCMAmTBvyrEwXrSrNE8UPQ+kkoKJP4QIIlOZ44NSpstqT5H94iAWiRiTXu6MIdlTvHkqXt7WX04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721612426; c=relaxed/simple;
	bh=mKNcFXjZyHeRfsdDnmc48uVYaNn/fbMjnBMMJCNRw0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zho0k2CSwJkVHNII7cx3+Dex0QFwwI6GGb7VSgxkTA901oI6d4QNku8mca+iPCDTrpbl+Dn10baN+IvizC3nKM76sxcT3xlNfPUD4hqeTuQ/vQlFUvfBNc/8F49XOPzISeXYh2ehOotC1C/DAvvo/DMhcUWXwjA9knah6VJT9nA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ElkXCvWv; arc=fail smtp.client-ip=40.92.20.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmXPziGi20g6Nkmr1t/DRYdQBbhKocPjnmadALZZmzwp1QikLw4jHV70lUeicsKwqABJ2jvS5h5T22PCqcatmRsJagIDd7fglxNLgE9GvXQwXhZTSJKhF5nqx1wI4Q8x2+l1h6pogcVkJnsn7RYqv9Nx0WmTfw4W5INCSFdPdeUtuStbuy+ieAgUhoB9L+wWtTdy2FvDV5IJhzucZbAWFi44ybSx2Oaa6wcwLe5gmCptZEDoSqGykjLF7+g6vehCnnK+mrTfWmP1Kl0QpqMsw0+nbD3lwfPO+OdntJmhsrdEY9DnS4l/IA/I9cEFouLybZelFDXsNsbmi4+LhJhN7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KADSTErtuwAYNLfw2e+mQTldxzCTuY0RDEhxiO/qFbA=;
 b=jRyrw2hpriAF/jPYPNsvf2USBhWMyLdD28hZkikeI1+4hP9pOnFjn3E9I6U9RjM3I5VunPLKIhLhkjo7ruMX/kqooUi3bXFcxJ/Lc0lTDZZ6hro74f0kcGQ8tG7/ECSSrjTnfgGAJLrm5RwEC3zIBRO90JbW7Z8/4bScT6wuabn0GZO6NEBd2Utmhr+Fn5M0bu80wbGE8nXAYcuAO0+oYnIN43Nl2BVIZZovN92BITj49+coAsjA8bpC2HfuxuchC+lOCaZlcy7Q3ZYkzW3SxUcPJ1WiYiBUgvJsV4r0MdVx+eazdPex7G1N51kRszRJ6ZGLqhUf7QcsazsF98IuHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KADSTErtuwAYNLfw2e+mQTldxzCTuY0RDEhxiO/qFbA=;
 b=ElkXCvWvjd9s1NiIDkpTG2B6R1Iq938n7PxcuWvgufm7g5PBCLqInFhc+1HvUR24qZ69e82tiL1bsD/S5swFFlIWJsldK/BM+opgAXFzxqIe4ASv8tBKovhoFMsw1iQlp8sdmZS35LijhDVaV9o/EDILJhRex7yIzr9iTbGaVvQtnMfsXIqSD25HN3WpxhWEBAZim5JmkydV8M50r4AsV1KgmjfJ2EULTckMnGuBPGSgzZE1YCQVw/3SMC+w9M+7TrCjGosN9q2AlmolADtgqjlrgp2rl/iIK7MlwHXc6LtS/hL65xKuDPvPiplkRcjIjA0oKd3hScgYZstfLLRCIA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CY8PR20MB5403.namprd20.prod.outlook.com (2603:10b6:930:5d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Mon, 22 Jul
 2024 01:40:22 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 01:40:22 +0000
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
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 6/7] riscv: dts: sophgo: cv1800b: add pinctrl support
Date: Mon, 22 Jul 2024 09:39:25 +0800
Message-ID:
 <IA1PR20MB495335E7BCCD7C8893588D68BBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB49535F9918829FA524BDB02ABBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49535F9918829FA524BDB02ABBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [VEhrLQ3W+WaV88UXVBLS1h1vTAnsImLCZLk4UEqTL4M=]
X-ClientProxiedBy: TYBP286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::15) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240722013937.623685-6-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CY8PR20MB5403:EE_
X-MS-Office365-Filtering-Correlation-Id: bb8714c9-5bec-4b22-8c11-08dca9ef402e
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|19110799003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	oDGVg0+SKGZbRD0z2aX1Eafabm4yPdAGeWO7It6GWL5GoAsmaFRD7lZHWWIqfwH1Mz95KspmelYYFolaNliKZWlDIBX62eEj6h+oIJ2RDmEsAYgkedrTfl5oh6xjAu2eUNV/FpwwTs2/6fVQABYBLj5u/FnUsfvOGrZtMsTPZXIbMB15dKzKyTVRYN8lqRVZfvhWaN/VjAIUn0OEi2ZHJoIdbsea1ATW3pPI2FxFkeDSCxT6e6DTGegddOsxvoNCXBcoeaL8VrMDv31OA4TiFs7UZBmCA8awtbHmQQkleYp+oQUdnkxdezLUsN5rnLVQEejM1Qyvv79u6358J8YGYPg4Py/J/mNFRenGyStQz1h5O/Bq5Gs9f4SDE3H5Adlh2m5Giu+q7e7vbxoF+Yy1AVajT7HQ/pv/PS/lx+6zeJb6lsoK8hQ/226X+WkI5AweTsCBSJq0RnADzYwj8xMMH7oBxfKuH5hyuXgtCe6NP2iwpi022WRMEp+rDWYv6la4bv3IR0L+NpNUAxd37dTNO4icbr2kXe/1tVRxpyZ/ivNoeHzCptYJNmWb7+zuU7O0bfZXI1/BbgijRj0X3HD9urnG8CSRQOMaY2n4WufH48B68G2Ry5Cqvq85e47W/bpiTE/HTpWFws84/txepCxj2FbbFX93ayzKCB06Rwh4RjMPxCIVya0Jiw0YTb0uN4cZ
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3kDt5F6K8tTJs+I7vB5W5Uj7goeG1GPlS1g5aR4ce9x6/TMcXyPW4WbKA7Cq?=
 =?us-ascii?Q?7G41gFYV3MkYkYHUDyGim5AkLUCT/t+GF+XWDtWbqbgJJlXyi1YbfsC8tOI7?=
 =?us-ascii?Q?BHVbZz4zr2T4W71CfZaL1m4wzOJ4U7i1XG8sTgFHAIr+GceQoQQbRQAMQ9tV?=
 =?us-ascii?Q?t7j+04DGONNtpjuyI5YhME+U/93aZN3o4qYZyHrc9e2xQtyt2fyXsbSifIp4?=
 =?us-ascii?Q?uLTkk0QiphZKsE87CbnlZ8cF9BD7h6j4Xik5WyP1KM5DyiNYV+84ZbfEqH1K?=
 =?us-ascii?Q?ukEC7GxZIWz201WgJ5NEwWmHdibHv9r3e/rcwca0aJRxNGUbGx0VBNSaINgz?=
 =?us-ascii?Q?zdKyzqQPeaamYFAbIO9/LtBFk/MkXZOV6LWGb+nR9p9w9LE9GH7ono6+DbRt?=
 =?us-ascii?Q?xpzixw32coGPL7elBnSusCHmBg/npj5w/L2h7YOp+GWVg5eqOSQEQ7a3uBn+?=
 =?us-ascii?Q?pL7a5G2XNYO7VS1gxIHj2lpvP6LAGJF38dTFtF4qpR+6wjY9bcekvh/E7YxV?=
 =?us-ascii?Q?ilT/7DS+94JPoYYRPlIMgNGRvl20yDkh+xAEjkzAXTwpL8bALr2L64BprBxC?=
 =?us-ascii?Q?zDYmrEWvT0Nv0YkuGwH++pFNvVCrcbOrUN/AuH0Lb9xuoXlL2AcTcMsu+UPo?=
 =?us-ascii?Q?++TNf7v/OZVNyEnWhPQa2lF10F/qelKumzCiF7vxD9RsTK5RHs5W01Vx4NHI?=
 =?us-ascii?Q?2zG48e9XPBbn4Dj6CX8r5v4T/fyf19OWeHaL8CGEIOgCGl3v5G5roycYmbKS?=
 =?us-ascii?Q?e/AnhqhyYKDIWyK0V8hRyh7wM/cVGPmsb0EpiwQwYf0hQrjvyzlZGFbuU9LD?=
 =?us-ascii?Q?Ji3GMt0OB3O6VIlshL0r3Gj35l1hpklEqS40obmc3jUTCQiTkziJGnYh7N/5?=
 =?us-ascii?Q?T7aPQQRqJIVTqy7/94ySc6W69fgqL4XbiCvmDi3L8kfo7G4vzIJ7d7abpA+l?=
 =?us-ascii?Q?V0HMLpHn1b3DeaIankUDNilIG2xoxz+eL8rTUYMx4N7Z2F5fb0BFPNB+qzNe?=
 =?us-ascii?Q?UOEhI+5K7fQrBna66a7SDU8hK3CHgeMkUG9QzY7Oq4+Yw67CuSaYGggkVNZP?=
 =?us-ascii?Q?o95mYaSFdNDSOcpZoBF9mQ9n/0Ns1Sok33F2y92GCL5hiQTLlWEKDGmh6k6t?=
 =?us-ascii?Q?bTx3k6q7IRcTgSJQkeNl/75s5lBIgIgGg7v5q0OXn85Rz0Hf91WOZYApAz6N?=
 =?us-ascii?Q?j/KIWb1j7j24Aj38iNUYCPfycrsnrW9OMcMXaSwUZ55CE5JK0geAfJCAvpbf?=
 =?us-ascii?Q?TSMUQM+duyeIvqHInBFH?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8714c9-5bec-4b22-8c11-08dca9ef402e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 01:40:22.0384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR20MB5403

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


