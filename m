Return-Path: <linux-gpio+bounces-8410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D925C93EA75
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 03:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 480141F21F1B
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 01:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A51C2D6;
	Mon, 29 Jul 2024 01:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mn8bgA6Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02olkn2102.outbound.protection.outlook.com [40.92.44.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D848122F17;
	Mon, 29 Jul 2024 01:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.44.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722215014; cv=fail; b=ddnW6o2p9PfozR1HgUxAXOs7nFMXrWVx4bhYE8G2Ypx5qakC3iwN7J8bD5xufRM6jeUtUL6kDTOgE2vtJsjGTU7W4D2RjevoIRmf9sKDG2bb69DKt2hy0O+PzqiW1LQs767Am2WQ9Ed5nlXa0azf0DLxogcn270v9zdcudJYreY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722215014; c=relaxed/simple;
	bh=GKbHufVKfx+OO2asefdEgr1YzjHbI2wIaDB2jh73m68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fdcf7R/dwLentREoR5ZSjjTAD7YRN/hS7zRoTykv76qj+90lL5EZr9b21gMt8+KqwJhFZuPUEyjnumpD86W19YHinoON4yXQe4XK8fKx25Kd+BuWzrE53OXxVz2NwX9DARxDgJfWyjLDhex26ZEk9Q0WUBqJteKlWPVHQf1QYzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mn8bgA6Q; arc=fail smtp.client-ip=40.92.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elbszSeTr9A77u7iaxzvwsSt+8jFKOr2oOGubjpXesfFFQQOEJrmKsIAR7LvOOtouTY+SXNxzvQebDuKBxO/uliEJAqo768bcI6prNY6PHn6vMhH2YfoOz3sxKslOwEGtzynmlCSbO9axVfNnPgsen+o7hZOL227AsQK4/CaasbReHCZnGOiZYSGpbzUUOAKF+V9+LMEZvyGNqMQBD4gH9jJm2Un0FZLYgsY7wGUOO7IUePNzPZ3FJ8BhZYkEn1hPjzFlgSaePVanDByK/DneQU2T2JkyqtJwP4VPfXSt3gts1CJV32K/fkYn0WZPOtHx22tWSw+HYI8GNHWhuY9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bno80+wEBfEuz/+UkWzzr/gZKqROScFNCXTxvQ5RnLc=;
 b=w7HhBqexvcaIIkPqWZoJRV9aCpa9tFmJbg9VCGOz2/3znfO88CmuNpcOKSZ751Fft42TPkxC4gGEy/7ytUStD0a8rVoYSY+z3MNYO/wroNAZW2YQ7eNlq9jZG9wniG02zJCrdMeO0UCm9FEEjnIvzOMwoEz0CAOnq/pG+OJKLgtqkZKApxmxGSixxrnY/4lP5VFow3xOQP9EzSX5E5B8y9veNm+mhbIzUkfOqW1wiTP5BR+5Yk2grLfYC2XC/9LiyVqHe2OF0DjfPg+Q7LQsQTGIFv4NKkxqHStmstZQVZwgP39AfXt5gTCvBPiVUJMgZJ3yi++vV4P4Sud32JDX9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bno80+wEBfEuz/+UkWzzr/gZKqROScFNCXTxvQ5RnLc=;
 b=mn8bgA6QmI+QQnyjMIfXqsy5kYg6RtCf7pdhf6eUG5AS/Op4CyuFPg1jOfAwiUqN7MwRVDJPdcLstUqhRyPaQ8dE42WwJ+Sf3SI5rYGlLvIKFHen5j0cgo8+JPzXRi7eqjDw+rKbDgAiiwj13zpzlumxbFV0Iq1R6sfpG1sx4fr5rgy5nWwqhK1vl4+CdiiXtAzSzlo0g4D0qzp3LIcmJNLgwD9zMQxADUypRCdtVhIVN2pn7wgeFPNltnRZBLIMfoGh5GXce1iQFuAXI8x95otqzjI58vRKdxq8fm+MMcO3e9yMdPGrhzDtDC7OaOHY7ounSB3Lgg1RKR91/6TsDA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV8PR20MB7300.namprd20.prod.outlook.com (2603:10b6:408:232::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Mon, 29 Jul
 2024 01:03:28 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 01:03:28 +0000
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
Subject: [PATCH v3 7/7] riscv: dts: sophgo: cv1812h: add pinctrl support
Date: Mon, 29 Jul 2024 09:02:33 +0800
Message-ID:
 <IA1PR20MB4953385123A52A5447332D3EBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB4953B8B0014FA82A8E141CB0BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953B8B0014FA82A8E141CB0BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [BHhp99Ru5SxA5RwafqRxB2u9p68Mn+JIGwNxJHkaBaE=]
X-ClientProxiedBy: TYCPR01CA0019.jpnprd01.prod.outlook.com (2603:1096:405::31)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240729010237.650411-7-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV8PR20MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: f13eae26-125e-4461-d825-08dcaf6a4193
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599006|8060799006|461199028|19110799003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	v1qzRHWhtEOzudRxV4VU8p+H+kFUrPeIYNNd7nId/3OLx4+CyJpdaZ5B0+qcmujxEsvzLDKFW788EmPGTCL96f+o/Drv5sxAQhwE6sxEm1YUtThy1jJ4uS1Z3tKMllQoxPfPbOnaSyOMJVj+ODy6X/szgn8KuOIn6BZGvcRZzjyZqIPyC+/uvITvRkgKBEs5T1QFnRU6lTPjgiqyEwJqKmeuPmh0twh89Vw4jo+VI3ai1P9Q3DW7C/VlpLoUElUuOdh1cJJqNfd+O3kK/eWXwJ7N7WZ6wivkaT7+9A5dQGd3jjmB0fWEYnlsh2dvL/fMvgr+Kh+IicoBfZBYmbLqf0JshpXMGYAAo8b7oORBGTEzf5ivdqZpZiki1SvhgsYcIn3zb3lbBa/SfKNBjxy6b9bA6k1c7zn2QgOerDHD981u0Rxie+imGwer9jiXJ78GdIz6OiuQIZ+h2dogW5RMWazFkJfp5VsvmXZhmmVz+8hH4l8CzIE15onCZSkcnHJzuyCieKwv+aPz21kr5VTzWS9intUQNMWkYOlpKD6y5024KEDhTU62mXDaqZQ/HXVQJ1/6SrI5Z9Y/5gkC84NVDdfFIzbFTL+AgiPSTgOY4vgrKpFjevMS/reqALxIH7RDMFgakLuYhksFHFXs12U7Ap+5QufAVXXA2bpu73LJMAJCzyCbLTCfYVSHkbQulqpWE3aKnzyHR1esH/w0lxZf9w==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i5ZPG22kRhL3NLF1CGKm6Ns5ATwFpIOXoVx7DnbUL63NvuDP8Gh4oBbX99iR?=
 =?us-ascii?Q?pCyvhrNDmSQNY1FglfEe7TBEUYx1gxK7HmOdkp4o0k2Hh3dd8Of69lVVObCi?=
 =?us-ascii?Q?IBrlaEYawi1/rxkX99+QqaH3y6rClXoRTbWakqq8Qz/mCSqJ4IK0j5YPJ+Sg?=
 =?us-ascii?Q?J2gqUIrQn+Zi+S69lDAhwyAi/G6YEAIKiCwomLLgQVdfUwFV1COeYEAya1fh?=
 =?us-ascii?Q?So7Ia8mKBUr4ZYZKRJzdeKefmTDwuhwuAjQD9CxyAwMvihs/e1BZSHUd7YPZ?=
 =?us-ascii?Q?ttj0cL6Hss4DArrgPVeiUi7Qoii/li3sLL89rYJBNtjeYLU6dElp6UvmN2cy?=
 =?us-ascii?Q?CKSMAOG2OAdbWpNY6dE6teuq9yYunPF/r74kWf6TRSfWk3AtkwHbDBUANsKR?=
 =?us-ascii?Q?c55KAbncsmGMPbjxrtqdkcoIZSjlBqvGKz6zyxk5wykpS9aN+ijG3iUB182f?=
 =?us-ascii?Q?9Il4bM8Dnc1c7JouFceZMUWdS1jm8kx5SRe5GESLwcfu4hs1PaV1+yf48k5h?=
 =?us-ascii?Q?IH6rlDgKFk0tyW8xrnckF4rwvodk43Y0CcfdpnhVmsmKYU3zHw/94bLyM/bv?=
 =?us-ascii?Q?AJFqJ8KC3uWKGFr8+kaXy8sn7aOHGly+vON3H6Zb4d/7XeJhSn9Bypu/vLFh?=
 =?us-ascii?Q?juxdENkxaoySow7AXKyZ7RmC9ejtdX0pHjuVqS/RLqiKgStKriH/zkFbPqG1?=
 =?us-ascii?Q?ocpMZBuy8sCel930LytJagdu7sTsgrC+3zjrGBbFepsQM4LOGUhMcci5ge6B?=
 =?us-ascii?Q?Xjc2f6ctHZKpqyQ0V2+vX//3gL3QSO93s4s54zYAaZgZtqf1w3bbWoPOVAUM?=
 =?us-ascii?Q?dq+StM97bgPqTvNhB+PY8fEIQ/wpLTwzpnM9AL3Z7RefBcu+7pHRaJQYKcYW?=
 =?us-ascii?Q?uS7LHTeg/6I1jfdDo/eVWU/Ow2d6kg11x3hep2cA2vRtZY9FAn3lLehmbq4y?=
 =?us-ascii?Q?d0MDjQZUgZyCPOoWSeI5lviJkPQzRnRDlNhPdSxUAGi3mPwloruf1MSANbeR?=
 =?us-ascii?Q?oxYNKMdtMCKcg0P0ovnhYpbIfc3Q4ybMY6PSALPZXiRoZBotXLdGkctbfsqN?=
 =?us-ascii?Q?mJZ9skLSuGuyxhnncyNaAp2ZP5N+8QwjqdcCAFgmxNfavKNjw6jg96PbSVcd?=
 =?us-ascii?Q?RFgPWG2EbtyrBRV7ZSberMFippcFglAZBJySGCRHT2cdziIEPFqJMfEwRpzZ?=
 =?us-ascii?Q?+2QeUxjO/cJbf89ttf+wOZxXPG/DuXtqqqyXMyw+Sh7LV5AmRZ5l0xhNXGeL?=
 =?us-ascii?Q?a9Lv4SNvP+5Iw9U6vEVA?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13eae26-125e-4461-d825-08dcaf6a4193
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 01:03:28.2662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR20MB7300

Add pinctrl node for CV1812H SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 8fcb400574ed..2dfa450f0d26 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -4,6 +4,7 @@
  */

 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
 #include "cv18xx.dtsi"
 #include "cv181x.dtsi"

@@ -14,6 +15,15 @@ memory@80000000 {
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


