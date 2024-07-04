Return-Path: <linux-gpio+bounces-8036-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7969B926F18
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 07:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 305592878FC
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 05:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4347B1A2541;
	Thu,  4 Jul 2024 05:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Bkv4eIKS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2104.outbound.protection.outlook.com [40.92.42.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649921A0B18;
	Thu,  4 Jul 2024 05:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.42.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720072081; cv=fail; b=nIAcyMmpapXNuq3F+cIlVL76EEtqgtXmO9kpRu4IaU0CC7k0UoNNeUkHxt/JR2vWlg7fS/0lntNOdefMHXZxraqkAuwYAEjcu7qYgLqOQyqxykldtxJGRQLS2u9MllR46jgJCOZ1JO0bDww+nJHTdLsmuOO/rvkwHu5WeR0/PqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720072081; c=relaxed/simple;
	bh=SFDYXb41hzaVr/2WoC+AvD8kqIKjfmUMZxcCzEfDYbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a01Mx3Gjsug27IiqgsxlkEL7EnyZMubZj9o/5WyGMcWwH6ecca0R1r3L8Mskhqxi4AB3sO2xVt6gc7JITQo0rltQHpqpU9TVvyQOgmB/2WmPWFwSKKAo2M5GeP7Xp6YbqIB6hMa3nDaH6ZqbxbtZ/HNAM8Vn5H23DYyit5iMOdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Bkv4eIKS; arc=fail smtp.client-ip=40.92.42.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+V2tAJ0ag0jOlFgm8mUexkmLmN5Q5r/T4WUk0EvhLhcuVrr+l98TY2s9ore4w4ch/wfNZMmSsCxkMFsoBSFy3/TY1jXCv2H1sdLxyzVBBGScCziEIVpp9oVplyLKnl+78zJLZ6S0vzdyfElQWuyOAYWmlRBI54FBHf6EkiPKnLKymmteD9YpPZ+uGldrhPykL8sRaONuWAo+bfs5rDrOpijmKyUa8PRP/p3bWlyYTHWDRJT3IPE9fb5lh1uabGZ8Q/N51skwtAQ4XwPGweE1QdYWOc14w0uk3oSY4B2mpss0dxh3DzM7lCh5mj/64wlA1vg//Js7GzcoRRMaSWKVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4TbHAu4Ja1EaLRb+ZVAL1MGcs0f/SOJyTBB1iLZqZQ=;
 b=VpIX4SVY8lsPpeHlZhFszQXt/WcHr26DFL/gwfiaox/dfpGtMUNp/3XaXZovPFLifyXYUS/YVRL/Qa3n+gczchBejltB8s2M25MbQfhfei3/DgVv+P2qiWfL71uOe6PxlA1cAxNF6D9QMtWI2+yHYkPS30EB69sHNumXtMRncFPp9sjZIVgukWazA2+scwQpSKQzfCPpHBul+fohYxilpd5KKWisolaXt2GvlEH0behhzZ8HHTEcItE3YY9yNufvgIiHBFYYlOmDRQeFepGb6cb4pUCqdAFIrbrpt8sVFK1Nhz+ECKu+n2pyBlUGf7rHBEM3GbJC35yt/1PqZH8sMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4TbHAu4Ja1EaLRb+ZVAL1MGcs0f/SOJyTBB1iLZqZQ=;
 b=Bkv4eIKSvi1NRO5NSSl1eD3WRGasUB0uEUmExa29BCRxHnPoAs/YgLWMiaUcyZ1yglTYBWurnfpJbK2nYQvIZG97ed7UWaApq/16ZLcwDtWu3VmDMFfJip3tEGcTT6BI9+5jnkHhJ1jZyT7MqUnGVVxUPbq1Mfs/4FFsp9cEKOQ2As2cLFu7f//7pU5Biz1x//VKc9155l1xFRAFW6DvkQSAroXXtC951SxHPT7w17iB7oMiSine2hyDO9Q1+3YfkTXm3GQz7nhuyN8wD7T+5+L3gfW7mH/fIPllF/b/pi47jrd7ywFMsUkVkV/Ti2urDmIHxSs+1STEfeQZMHchwQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW4PR20MB4293.namprd20.prod.outlook.com (2603:10b6:303:184::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Thu, 4 Jul
 2024 05:47:57 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 05:47:57 +0000
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
Subject: [PATCH 7/7] riscv: dts: sophgo: cv1812h: add pinctrl support
Date: Thu,  4 Jul 2024 13:46:43 +0800
Message-ID:
 <IA1PR20MB4953963FAB62D30A6D890440BBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [8iHOWFNaa5lxhYEnzhGLWF2P+vnyRrzFHBMB5wpWAzc=]
X-ClientProxiedBy: SI2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:195::7) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240704054647.1747392-7-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW4PR20MB4293:EE_
X-MS-Office365-Filtering-Correlation-Id: 6370bfaf-8620-4daa-29f2-08dc9becdb07
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	bPOABhv177xSeBDPtZjpKAV6Dew5KQ+wNsgYxgDoNJasMNoBtWdpWwh4LH8mOg1plgKFohMi6Rx5513fL6cKqYKfK1z4aNhNg1XLma75Kyq1yuvzBRQIZPqAvkxz16pcb3bKq5pPk6SXtrRfNHEJmDa9dC8SBLW3C3BnhNbDEd2cSXQxdgoGZcHi8ezG4flVeIz63P+cBKnkKbcbnQsrBUyiste08al8UEYr+SgLQuiXMkisG1KT2jF9u6xTI+GVeBTA6wS9da1Y6AkQTImP9gDKVLWfvahFr/jshwbsB3rYLIA2nUQ6kTRAD/7dpF+Gvib08cZgAVfMKOt3Vo8HxyFSNYmwafpHdBskmYli7pn5XIW067a2X6eAWGRRU6lBT/bn1lr+V2XaVt7KD7Ndg1kV6VRdrjmd+FrGmb2ZEeO2Y/2yKIK5VoV0GRICB9V3Y2zEtSXtp5hdf55UktkjHBphZ/mplvrDWpudr5LFHEKRt5azk31Qu8xtNZZKCLJN9xqJ90wNwOQ2NO1yHjsVNcfLz/zp5WDalq0KBOXXyYLF23Qf8D0df5GgYA6HXF+LKGa1gWVlDxdfQyoltLrlWIk+I5KMsCptFQGdllcuG+cb/dvTaXYu+ZQiS1kpzppaJAh6vwmJ6XRH0LMMVuW4cQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Vcd5HnbkNHx/7gm88E5g/INlyTM2cVbU1r6O1HNvoxWfYJVtnzc8obzaUGYN?=
 =?us-ascii?Q?IQVhdfj+Hxmc22Ep5EkhpvxjOpA0+GLhP2HvyX2U/fTJabqZozbWEjrcQAoT?=
 =?us-ascii?Q?J/5fDgKSs5Pj7OWoNjP5wWCpnskJehImouISZdPDRZd7+bSIA7BU4C5e0Cga?=
 =?us-ascii?Q?6aL4HYIKqbBsqRpvRC8VKK27jEZZb9KuIDMJaAWOCtf6e2s0xswEcWp9hAS+?=
 =?us-ascii?Q?PrqZyBEyfYBQdg7eVennXsEf+3Y4ePYhit2IQnj2zhL5D/wthXN8iMl8oFfc?=
 =?us-ascii?Q?2fgJ/moOS9hABiI0LBBaoJtIq/2a9/zDSSQxmooO4BeZw7cLfaTKKWp1vRsG?=
 =?us-ascii?Q?0SGlguQqoXNToBV/m9a9BoXV5UTH7xAGjx56y0sFrHC0VSLOHlE8LhURVnIB?=
 =?us-ascii?Q?rxSNNIugihC0AmQBCU1euVuTmaxR5SujvJkNW6QgY6NQkMxiQppOT8oMxy+e?=
 =?us-ascii?Q?6gXIxB/JFgM4RdH4AUR/W6GNYC6GgMHAh0zam8IlIPIe4FVPl+9dTiaZhCqZ?=
 =?us-ascii?Q?Gm4/ipPlvT3Wh1VcbBdDcPnfLFwsPSzcT5IvVxeKaTTDR0bNSWcdzdgiwlHx?=
 =?us-ascii?Q?o9m1V81o5XLwSOWizgibS0PTOnxCT8XWvmiTmHjO6+1D6MtvKPP3HpLkr+no?=
 =?us-ascii?Q?a3nPT15xu3MQbHh7JNiUjhRiBebCFxW2b0pGMLqF6h/D3sAUTkkKKOhT3dvi?=
 =?us-ascii?Q?FPqTEHvfqIuGNLMnY2HfDu1cneEBkVxWm4kL2i4ItbwMMPmp+hmzSD4vfol9?=
 =?us-ascii?Q?qR2XqcKTS1G2IhnQ+SxvltkgbqPfBjb44IsvZVoC3oxameMy+Cq0xpzfCov0?=
 =?us-ascii?Q?IJTpAK7aNctMTpUVdUYO1LlyZFDplSJ51fTPoEle0GbxIdt/nTRguVKiIWdp?=
 =?us-ascii?Q?AmNrgf2DU+cDXVQ1v/g78ALIiTS3G2kf4wzUhnP3PjpJS5tT2PhlHy7T3ry3?=
 =?us-ascii?Q?D3O/bdRB6RG1Y/26QoQTdTliZL4Cd9Cw/bowX4fMEJa8kY0GZqCs0elWS7gz?=
 =?us-ascii?Q?hTLU6IR3rJfyIKS0/sHcq2lFJcO1g7JUU+Vt6Z3c1j3Q0DXakmRAkMVZzq7p?=
 =?us-ascii?Q?91hr0F8EuYZcaYm9kTN0yktzB9x33RW9jHZm+1CkuBRbmljtK8kEzxz9TX5Z?=
 =?us-ascii?Q?+DqD0kZ3M5jRiHardGDdFIniU+vm0QCH2BJKXWun5d8QxpEXqnpPlLNqVJgS?=
 =?us-ascii?Q?+k7/PsWmn0LgG6+9swXrmSehPkZkpN7wwm73C2xisjfRhfPc1M5HbD2Sk1br?=
 =?us-ascii?Q?dE5nrzKyxsKqbEbLDmZf?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6370bfaf-8620-4daa-29f2-08dc9becdb07
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 05:47:57.0382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR20MB4293

Add pinctrl node for CV1812H SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 7fa4c1e2d1da..12e44edebfc1 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -4,6 +4,7 @@
  */

 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
 #include "cv18xx.dtsi"

 / {
@@ -13,6 +14,15 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x10000000>;
 	};
+
+	soc {
+		pinctrl: pinctrl@3008000 {
+			compatible = "sophgo,cv1812h-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+	};
 };

 &plic {
--
2.45.2


