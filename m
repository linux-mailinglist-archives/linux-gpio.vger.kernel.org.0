Return-Path: <linux-gpio+bounces-36843-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKYpCxbGBWrDbAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36843-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 14:54:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FB3541F83
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 14:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B15D6300BD61
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 12:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87AFC364046;
	Thu, 14 May 2026 12:46:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2096.outbound.protection.partner.outlook.cn [139.219.17.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5391548C;
	Thu, 14 May 2026 12:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762774; cv=fail; b=TfamcggznZ46/VdU+zpaAsRK8Cu4CCoHN4dDNu4rEh1j0BPt0PGxvw6vdMNa71QR83qa60TTvN/VTps4t8vtPzNCi05c4ZMPnttYOvHcgDsXeubhgM8K4mBYXBZldHgsexB9bqy5zlv+JXVxBQz7YnVqE3+fimudG06R3Blu4/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762774; c=relaxed/simple;
	bh=V4H3/QVPpB6EingwX1pohCAWaa0aHySv90BOusjV6t0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TjEkywiXeeKfpWcdCgG82X44tGzFTxG2jJJEMcSRwvYFyWiWWMegHN1ZZC0gIvK33d1guOuOb7ABxEC4DXeNrrqaWyLB8mz9naXi6tFhrhgWO5M1f6KgOJJ86TygKmYIEgNuWIf/eJSqIZJfvEVT15krl3KK/mq/mn16uzsx34s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgK0zSAGxbTUmZHVYE1Yod/tj/yqXbOQzFYCoFPdKXtw2zcejYY91/gp4WiuQpVDzq8dSpIq95jyxF3pHtLcHac31uMammr1ivKcWFDFcKEZXZKICwvBMtcUVC7zdlHk30TbFEVFGSjAgKXKPGqgIh//HPemK6oHTeNzpmN/im5mAFOHuefK1gVoVkuFQRcapIdxtZmbDHxurjH9uxb49URbsdDiShcVShchBX1lReVWpsg1wwUq0qCrPIhDG9gFpscLABfPi/wahNGHbnzhzddhM9gNbkikrTXwk3MjP2FylO+DGULBO/dQl8kwmXU5Pdhsht/A54nGbMzsiibeDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssb5WdvoAB+AVngwfT1O8Xi9CMcQiWrrChN0T0By6ls=;
 b=crQ6OB97YZ48hFCZchHq/6t7fW7rjFEr4aKl3+ebP2uv/VNG2AqWBtvjUYE1inWlzgQQWpX3LFr2FnrhMcqDCALpqdciN7Kdx5pJnQzI8a1jZLavhtEJ7lj/hTv1DgYu5INOkdDv9nn2rZlqXIJHFYlnMXVe71tp0UYMc6XEmMGmRYekACcvdHS0yHk687f8ZeJ8pjI3BJvZaGHMqMmxGl87ak9d2ehbHivRfw0SCgAazbKUR+lkKGz9dbvD4crgigk6V8zTEy04YaP0CDKVSZUbn87bEKH51GWoJMfbXs1GWlV1M3RdG3naOKgWlPkZK6fw3SG9iVN8aJ+zwgFVaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1267.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 11:12:57 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:57 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 22/22] riscv: dts: starfive: jhb100: Add pinctrl nodes
Date: Thu, 14 May 2026 04:12:18 -0700
Message-Id: <20260514111218.94519-23-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0028.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::18) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1267:EE_
X-MS-Office365-Filtering-Correlation-Id: ef15a97e-85a4-478b-03f6-08deb1a9c068
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	qmwFvdYkKXngZMJ6yTVcHc0kCivROoUBfFQOqzY0PTJTgdV+KR2WQZkTYc9VMXLV5bqq2vrvflBkXWS0HSYkGj2325z3hA6FBrUrcvmDTd4vWbzef8NvSh0e35fF08zQ8i/2EU7DNwa/U8zbrw4KUZSCWofexKnIdR5CLqKz1D7XhpdAKt3qXMSLH4fFGbTFWCnuyTy7S91VOqhffJrTBjjy0M1KlYDRCOh8YTctFeI+3VAi+DNPgg+2a+kxBuhrWUZYk7UDjIH9mnF6HWW/xP6/LxXei3lYiHftn4ajKmAcbFKfi8IDKajjkqhaj06vkz1UX/SEnzIHKX2L262DQTBuJ8ZgFANAyjOJDtKAgGiTgKW/B0L2BJQ10TZ3p8bq52j/Wz/MROrRQEts/Ly4T7/5i2xg2kG5Jl8AhbbbxQPistiMLz5DmR3EkKnWQpCnw6+uz7JAwxskY6pU8MQzbc/jOBQljPeodivhJhRoZl2mOpK0/20BzwzN3ZljiTXAMbbSGS+8fl1TcNc6XoSE/qFF1NTUP3eB7D4n+FtbLiwCQeVkzTWL5Q74PCB1iiAA46JN2AdqKom0oWvUf0rJJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kNyxjof9+EFQorx07ItbXXbh2cbo4WZWeP9u0TK4ezimvNOlQlxu+2tyoaDt?=
 =?us-ascii?Q?UFB5D/lZmQTI27F53CV347oX6GezHeo099GfXaDkGbKmy9U4X8A2PwyfDYUL?=
 =?us-ascii?Q?9VSw7Evok6W+XkpSt9k5q5X337OamOgFuwQWEQKzxCV4hvc+FZi+2fN8H3tu?=
 =?us-ascii?Q?Mgnbdq5OmrdHrRxELYQ9xdWn4BKMYqEIlHoL/qjbLRPskMEGJTxDFe2GnO1s?=
 =?us-ascii?Q?dNRC+UHdF+WRlgAhu5O6MHibwi29XCASWSFmzpJy3FXv1DHfX7U3h1b5HzFY?=
 =?us-ascii?Q?rvibcUTIOwRR+qbepmzClKcvcVkJvXMDwvkV7jMZsmZUMZwQO0wF58zesx/I?=
 =?us-ascii?Q?nION/a56mzLERqoqBq1EQxi+aB8J2EtgV/MS6BIvWwzXA8JFPbBKuj1moVut?=
 =?us-ascii?Q?w29wB6zy3DH81yVOuRoq54JTPtmj7fGxguXj+3uFb5RH6lgxuZs/YcmhsItP?=
 =?us-ascii?Q?Yhdy8ch7lgHpUiQDWGyJgmzFqSkHs77zh9HZPsCOs9VmDFcN9jO23AoeJc9x?=
 =?us-ascii?Q?ALaukBfvxNTuHT5pzUuduR1CWRrmIE3sZGAwJs887lCxdPcm42yd6k4RnkEC?=
 =?us-ascii?Q?GFVZuROUspybfgp20P0dVPQS8Zy/hHkKkEPNeHZkjaviY0sMJDjr71DkfVnf?=
 =?us-ascii?Q?OfVJSchdejTmClQ+c3ibTytESl5hC4lGA0f9O6HWIyMSTJOiSPy2r27ZNKWl?=
 =?us-ascii?Q?5jrFeEJ1x1MTkXmIh15VfmMMZcP358gfMRSyhuWFPPvrXHJkAMNSzDgr0vGw?=
 =?us-ascii?Q?dP5QH7EzL7UtXy9lIbqC/t6HXS5IghJCkm6OYaoHGVRRmZXrLaMKx/MqJSSH?=
 =?us-ascii?Q?X8t+47c6vcfJi0oAALdmpMlZryiBRCCwPqBkTjvT1PIYS1WVj30rD/KQjVPj?=
 =?us-ascii?Q?lAULArBlI8dpFGndGdsoq8d7v48Ih5qOoD/qQRgBqee5+oikWzK3a5Ybcap+?=
 =?us-ascii?Q?Hi+sLQKnQowPsApmZrUnBLievY2cdPLl8QxNsNMePPvPJXb3rGjwpAjbRQyk?=
 =?us-ascii?Q?1lStzY3fGSPM3qkTUCr2z47YnKwy9gzpXJuDobZKDSozvQrFLHEI3SmNo/Sp?=
 =?us-ascii?Q?3s8v3OLY8UCdy4c9SsSvoAWNUjLBZCHt6JgUr+NPr6/9dKrfV/wb/jh9593s?=
 =?us-ascii?Q?0zBIdReopX+xVh+572jMh+Avxkn4DfswKibSxnK5ZUF4PDpU45X6aCtzwLs6?=
 =?us-ascii?Q?xRfkbWVoKlG74RsWT1OxcpdixZOCln9E8aecVJ+jFoKBCl6TEeRJJ5IBj5/f?=
 =?us-ascii?Q?raECmUFAAoXNf6QQmKmA2urfzpW6KHSOsfa3+6zm+v9cWVIiFnL3I2kpYgM7?=
 =?us-ascii?Q?x88Vy4AIxFRtTaYHSOoRCYXQo6qCvaGYm4vaUrjaHdq4E0whD83FAeIIR5x9?=
 =?us-ascii?Q?3O7XyP3yBeCndkkhV6NNzml/kNnSNqqpQQ2sajrkdd1r0kChKUE8Bp+dJQ1z?=
 =?us-ascii?Q?k7aH39IlUPnXiDFhH/Eq7JfG+JX0QsZBYL/eu5tIiy+g+L2lShs7nhQ0OseU?=
 =?us-ascii?Q?mYHlR2t4i5RJP2/Jty4KQ5FptjCJDnZ+uJIuuzjBynfW6BmTH+OR7ULkTntO?=
 =?us-ascii?Q?YUHpJorl1iQ84iNUa1ragNvkheztEFIQ8OA7gamvsPjTbdjZJQ+uZmX52HCu?=
 =?us-ascii?Q?pEPOO8Xkjtmv8Q4fNzBFF15r/DjXGaSAJhVqx+Vk0S9ulPqfw5r6El6s9gon?=
 =?us-ascii?Q?BuOI0VpeibqbGKqLItXW0OSYFSfpna6M7CcGtcLS1bpxiNiehu7NcVCBqiZD?=
 =?us-ascii?Q?SVeHDulavYo5/HfEh89FLkputePaiPYt0F7XEy+aEAvdGcyp/M3j?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef15a97e-85a4-478b-03f6-08deb1a9c068
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:56.9897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MujG6DoranN/ko3XMsk9cdfoKRs7Wn3qzfHNpgRmAqxW6yvD5pvQUyFYHFq9Y1v44vXxRFumC47s4tfgDZAJAoj///U7i46GL5h6wXdnkB48YcplL2RcnBcmE6DYebDo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1267
X-Rspamd-Queue-Id: 33FB3541F83
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36843-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.908];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add pinctrl nodes for starfive JHB100 SoC. They contain
pinctrl_per0/pinctrl_per1/pinctrl_per2/pinctrl_per2pok/pinctrl_per3/
pinctrl_sys0/pinctrl_sys0h/pinctrl_sys1/pinctrl_sys2.

Simultaneously initialize the pinctrl hog configuration and add a
pinctrl reference for uart6.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jhb100-evb1.dts  |  35 ++++
 .../boot/dts/starfive/jhb100-pinctrl.dtsi     | 188 ++++++++++++++++++
 arch/riscv/boot/dts/starfive/jhb100.dtsi      | 110 ++++++++++
 3 files changed, 333 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi

diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1.dts b/arch/riscv/boot/dts/starfive/jhb100-evb1.dts
index 462b6fb7953b..bffecc986b30 100644
--- a/arch/riscv/boot/dts/starfive/jhb100-evb1.dts
+++ b/arch/riscv/boot/dts/starfive/jhb100-evb1.dts
@@ -4,6 +4,7 @@
  */
 
 #include "jhb100.dtsi"
+#include "jhb100-pinctrl.dtsi"
 
 / {
 	model = "StarFive JHB100 EVB-1";
@@ -27,6 +28,40 @@ memory@40000000 {
 	};
 };
 
+&pinctrl_per0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpioe_i3c0_configs
+		     &gpioe_i3c1_configs
+		     &gpioe_i3c2_configs
+		     &gpioe_i3c4_configs>;
+};
+
+&pinctrl_per1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpioe_spi_configs
+		     &gpioe_qspi0_configs
+		     &gpioe_qspi1_configs
+		     &gpioe_qspi2_configs>;
+};
+
+&pinctrl_per2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpionw_configs>;
+};
+
+&pinctrl_per3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpios_configs>;
+};
+
+&pinctrl_sys2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpiow0_configs
+		     &gpiow_inner_configs>;
+};
+
 &uart6 {
 	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart6_pins>;
 };
diff --git a/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi b/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
new file mode 100644
index 000000000000..926e018165fe
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2025-2026 StarFive Technology Co., Ltd.
+ */
+
+#include <dt-bindings/pinctrl/starfive,jhb100-pinctrl.h>
+
+&pinctrl_per0 {
+	gpioe_i3c0_configs: gpioe-i3c0-hog-grp {
+		gpioe-i3c0-hog-pins {
+			pins = <PADNUM_PER0_GPIO_B8
+				PADNUM_PER0_GPIO_B9
+				PADNUM_PER0_GPIO_B10
+				PADNUM_PER0_GPIO_B11
+				PADNUM_PER0_GPIO_B32
+				PADNUM_PER0_GPIO_B33>;
+			power-source = <JHB100_PINVREF_3_3V>;
+		};
+	};
+
+	gpioe_i3c1_configs: gpioe-i3c1-hog-grp {
+		gpioe-i3c1-hog-pins {
+			pins = <PADNUM_PER0_GPIO_B12
+				PADNUM_PER0_GPIO_B13
+				PADNUM_PER0_GPIO_B14
+				PADNUM_PER0_GPIO_B15
+				PADNUM_PER0_GPIO_B34
+				PADNUM_PER0_GPIO_B35>;
+			power-source = <JHB100_PINVREF_3_3V>;
+		};
+	};
+
+	gpioe_i3c2_configs: gpioe-i3c2-hog-grp {
+		gpioe-i3c2-hog-pins {
+			pins = <PADNUM_PER0_GPIO_B16
+				PADNUM_PER0_GPIO_B17
+				PADNUM_PER0_GPIO_B18
+				PADNUM_PER0_GPIO_B19
+				PADNUM_PER0_GPIO_B20
+				PADNUM_PER0_GPIO_B21
+				PADNUM_PER0_GPIO_B22
+				PADNUM_PER0_GPIO_B23>;
+			power-source = <JHB100_PINVREF_3_3V>;
+		};
+	};
+
+	gpioe_i3c4_configs: gpioe-i3c4-hog-grp {
+		gpioe-i3c4-hog-pins {
+			pins = <PADNUM_PER0_GPIO_B36
+				PADNUM_PER0_GPIO_B37
+				PADNUM_PER0_GPIO_B38
+				PADNUM_PER0_GPIO_B39
+				PADNUM_PER0_GPIO_B40
+				PADNUM_PER0_GPIO_B41
+				PADNUM_PER0_GPIO_B42
+				PADNUM_PER0_GPIO_B43>;
+			power-source = <JHB100_PINVREF_3_3V>;
+		};
+	};
+};
+
+&pinctrl_per1 {
+	gpioe_spi_configs: gpioe-spi-hog-grp {
+		gpioe-spi-hog-pins {
+			pins = <PADNUM_PER1_GPIO_C0
+				PADNUM_PER1_GPIO_C1
+				PADNUM_PER1_GPIO_C2
+				PADNUM_PER1_GPIO_C3
+				PADNUM_PER1_GPIO_C4>;
+			power-source = <JHB100_PINVREF_3_3V>;
+		};
+	};
+
+	gpioe_qspi0_configs: gpioe-qspi0-hog-grp {
+		gpioe-qspi0-hog-pins {
+			pins = <PADNUM_PER1_GPIO_C5
+				PADNUM_PER1_GPIO_C6
+				PADNUM_PER1_GPIO_C7
+				PADNUM_PER1_GPIO_C8
+				PADNUM_PER1_GPIO_C9
+				PADNUM_PER1_GPIO_C10
+				PADNUM_PER1_GPIO_C11>;
+			power-source = <JHB100_PINVREF_3_3V>;
+		};
+	};
+
+	gpioe_qspi1_configs: gpioe-qspi1-hog-grp {
+		gpioe-qspi1-hog-pins {
+			pins = <PADNUM_PER1_GPIO_C12
+				PADNUM_PER1_GPIO_C13
+				PADNUM_PER1_GPIO_C14
+				PADNUM_PER1_GPIO_C15
+				PADNUM_PER1_GPIO_C16
+				PADNUM_PER1_GPIO_C17
+				PADNUM_PER1_GPIO_C18
+				PADNUM_PER1_GPIO_C19>;
+			power-source = <JHB100_PINVREF_3_3V>;
+		};
+	};
+
+	gpioe_qspi2_configs: gpioe-qspi2-hog-grp {
+		gpioe-qspi2-hog-pins {
+			pins = <PADNUM_PER1_GPIO_C20
+				PADNUM_PER1_GPIO_C21
+				PADNUM_PER1_GPIO_C22
+				PADNUM_PER1_GPIO_C23
+				PADNUM_PER1_GPIO_C24
+				PADNUM_PER1_GPIO_C25
+				PADNUM_PER1_GPIO_C26
+				PADNUM_PER1_GPIO_C27>;
+			power-source = <JHB100_PINVREF_3_3V>;
+		};
+	};
+};
+
+&pinctrl_per2 {
+	gpionw_configs: gpionw-hog-grp {
+		gpionw-hog-pins {
+			pins = <PADNUM_PER2_GPIO_D19
+				PADNUM_PER2_GPIO_D20
+				PADNUM_PER2_GPIO_D21
+				PADNUM_PER2_GPIO_D22
+				PADNUM_PER2_GPIO_D23
+				PADNUM_PER2_GPIO_D24
+				PADNUM_PER2_GPIO_D25
+				PADNUM_PER2_GPIO_D26
+				PADNUM_PER2_GPIO_D27
+				PADNUM_PER2_GPIO_D28
+				PADNUM_PER2_GPIO_D29
+				PADNUM_PER2_GPIO_D30>;
+			power-source = <2>;
+		};
+	};
+};
+
+&pinctrl_per3 {
+	gpios_configs: gpios-hog-grp {
+		gpios-hog-pins {
+			pins = <PADNUM_PER3_GPIO_E0
+				PADNUM_PER3_GPIO_E1
+				PADNUM_PER3_GPIO_E2
+				PADNUM_PER3_GPIO_E3
+				PADNUM_PER3_GPIO_E4
+				PADNUM_PER3_GPIO_E5
+				PADNUM_PER3_GPIO_E6
+				PADNUM_PER3_GPIO_E7
+				PADNUM_PER3_GPIO_E8
+				PADNUM_PER3_GPIO_E9
+				PADNUM_PER3_GPIO_E10>;
+			power-source = <JHB100_PINVREF_1_8V>;
+		};
+	};
+};
+
+&pinctrl_sys2 {
+	gpiow0_configs: gpiow0-hog-grp {
+		gpiow0-hog-pins {
+			pins = <PADNUM_SYS2_GPIO_A36
+				PADNUM_SYS2_GPIO_A37
+				PADNUM_SYS2_GPIO_A38
+				PADNUM_SYS2_GPIO_A39>;
+			power-source = <JHB100_PINVREF_3_3V>;
+		};
+	};
+
+	gpiow_inner_configs: gpiow-inner-hog-grp {
+		gpiow-inner-hog-pins {
+			pins = <PADNUM_SYS2_GPIO_A40
+				PADNUM_SYS2_GPIO_A41
+				PADNUM_SYS2_GPIO_A42
+				PADNUM_SYS2_GPIO_A43>;
+			power-source = <JHB100_PINVREF_3_3V>;
+		};
+	};
+
+	uart6_pins: uart6-grp {
+		uart6-tx-pins {
+			pins = <PADNUM_SYS2_GPIO_A38>;
+			function = "uart";
+		};
+
+		uart6-rx-pins {
+			pins = <PADNUM_SYS2_GPIO_A39>;
+			function = "uart";
+			input-enable;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/starfive/jhb100.dtsi b/arch/riscv/boot/dts/starfive/jhb100.dtsi
index 943324b3b2fd..f9a7fa9d37e3 100644
--- a/arch/riscv/boot/dts/starfive/jhb100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
@@ -428,6 +428,19 @@ per0crg: clock-controller@11a08000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per0: pinctrl@11a0a000 {
+				compatible = "starfive,jhb100-per0-pinctrl";
+				reg = <0x0 0x11a0a000 0x0 0x1000>;
+				resets = <&per0crg JHB100_PER0RST_GPIO_IOMUX_PRESETN>;
+				interrupts = <60>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_per0 0 0 0 32>,
+					      <&pinctrl_per0 1 0 32 28>;
+			};
+
 			per1crg: clock-controller@11b40000 {
 				compatible = "starfive,jhb100-per1crg";
 				reg = <0x0 0x11b40000 0x0 0x1000>;
@@ -443,6 +456,19 @@ per1crg: clock-controller@11b40000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per1: pinctrl@11b42000 {
+				compatible = "starfive,jhb100-per1-pinctrl";
+				reg = <0x0 0x11b42000 0x0 0x800>;
+				resets = <&per1crg JHB100_PER1RST_IOMUX_PRESETN>;
+				interrupts = <61>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_per1 0 0 0 32>,
+					      <&pinctrl_per1 1 0 32 4>;
+			};
+
 			per2crg: clock-controller@11bc0000 {
 				compatible = "starfive,jhb100-per2crg";
 				reg = <0x0 0x11bc0000 0x0 0x1000>;
@@ -464,6 +490,30 @@ per2crg: clock-controller@11bc0000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per2: pinctrl@11bc2000 {
+				compatible = "starfive,jhb100-per2-pinctrl";
+				reg = <0x0 0x11bc2000 0x0 0x400>;
+				resets = <&per2crg JHB100_PER2RST_IOMUX_PRESETN>;
+				interrupts = <62>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_per2 0 0 0 31>;
+			};
+
+			pinctrl_per2pok: pinctrl@11bc2400 {
+				compatible = "starfive,jhb100-per2pok-pinctrl";
+				reg = <0x0 0x11bc2400 0x0 0x400>;
+				resets = <&per2crg JHB100_PER2RST_POK_IOMUX_PRESETN>;
+				interrupts = <63>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_per2pok 0 0 0 18>;
+			};
+
 			per3crg: clock-controller@11c40000 {
 				compatible = "starfive,jhb100-per3crg";
 				reg = <0x0 0x11c40000 0x0 0x1000>;
@@ -483,6 +533,18 @@ per3crg: clock-controller@11c40000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per3: pinctrl@11c42000 {
+				compatible = "starfive,jhb100-per3-pinctrl";
+				reg = <0x0 0x11c42000 0x0 0x1000>;
+				resets = <&per3crg JHB100_PER3RST_IOMUX_PRESETN>;
+				interrupts = <64>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_per3 0 0 0 11>;
+			};
+
 			sys0crg: clock-controller@13000000 {
 				compatible = "starfive,jhb100-sys0crg";
 				reg = <0x0 0x13000000 0x0 0x4000>;
@@ -517,6 +579,54 @@ sys2crg: clock-controller@13008000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_sys0: pinctrl@13080000 {
+				compatible = "starfive,jhb100-sys0-pinctrl";
+				reg = <0x0 0x13080000 0x0 0x800>;
+				resets = <&sys0crg JHB100_SYS0RST_SYS0_IOMUX_PRESETN>;
+				interrupts = <56>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_sys0 0 0 0 4>;
+			};
+
+			pinctrl_sys0h: pinctrl@13080800 {
+				compatible = "starfive,jhb100-sys0h-pinctrl";
+				reg = <0x0 0x13080800 0x0 0x800>;
+				resets = <&sys0crg JHB100_SYS0RST_SYS0H_IOMUX_PRESETN>;
+				interrupts = <57>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_sys0h 0 0 0 12>;
+			};
+
+			pinctrl_sys1: pinctrl@13081000 {
+				compatible = "starfive,jhb100-sys1-pinctrl";
+				reg = <0x0 0x13081000 0x0 0x1000>;
+				resets = <&sys1crg JHB100_SYS1RST_SYS1_IOMUX_PRESETN>;
+				interrupts = <58>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_sys1 0 0 0 8>;
+			};
+
+			pinctrl_sys2: pinctrl@13082000 {
+				compatible = "starfive,jhb100-sys2-pinctrl";
+				reg = <0x0 0x13082000 0x0 0x1000>;
+				interrupts = <59>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_sys2 0 0 0 32>,
+					      <&pinctrl_sys2 1 0 32 5>;
+			};
+
 			intc: interrupt-controller@13220000 {
 				compatible = "starfive,jhb100-intc";
 				reg = <0x0 0x13220000 0x0 0x80>;
-- 
2.25.1


