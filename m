Return-Path: <linux-gpio+bounces-35494-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMPXMnJZ62nkKwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35494-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:52:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F6945E085
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9FBB5300233E
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D943BF689;
	Fri, 24 Apr 2026 11:52:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2110.outbound.protection.partner.outlook.cn [139.219.146.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C933F3BF698;
	Fri, 24 Apr 2026 11:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031534; cv=fail; b=R68UoavnAC2dIXTjwy7GHRs/XaY2ccUR2qmcuoW4Arha0IlgZNu3MWX69zDoQ1gosSmT7TRF9nnxCnB51YhDqm6N7qmTDm9IW3LjBSAhveZmwh9r/hCdrRQTxdnLbIVVjYz+7lTQLkOmpkwtbHKVeKc6CZu8Y9NZ7B9ciF4VJl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031534; c=relaxed/simple;
	bh=5bWWmlgTx/5kiqFsAaeJG2zlJ0OvJVwqhm1EORdgUVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cTz0/5vwIVbWW0fQiWfWpP602TCmoFMwYxgYxpbn9kAxs01E9cpzY+KpaFXt2CffZMwfRb3pj0Xp5RfPm0ckEeesGxIOi+c+Y9lI6yTbs4xa1W1NNV6BHBeTiwklI4AiInNF3HuAmtlTLG1hcrDJHcJc0rgRXQjP03/yYomLyjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajzTHzX9yJ2Mp6uK6L1vDRDHzDd1nTH8cEZmi/seUg2FJbV2tr2bM5CUEVAGVsM6XV7aTpEkl6cQaHI4D1ycT5vsk2apVDUBfaf8s+8CtBSrSDMr8pTRIYo8Uw0x6ja5Hz1lSCDox4/q9RggZeO0zzMCRM67SwKr89u7FiuNnf2A0/QgpbcQL9hKRNj+uWnAYsdKgsMKdvH68u1gdE04EdY8PEAA+eFID7yQfXh7lbPpSGXjK+Dz7YETf0C+bTlr46cBWHN9xtfFz2GKfDqKqhcBgoCBk5LvRm0lC+Km7AzVQxK6+peHvxo7IysGrX5LeV6Ao9Jv4jvXjxYD7h03MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Px/rLpNH8L79+NAO3MwIMeegl10YL4ImrUoTOacLLqE=;
 b=ZqJhy3MS/RlQjr7M8IYmOCotvElfI+lE1PB0Ru/fpYnCwv19W/oX/Fv9QGdFfe2OzKKtffZd+ktUmh3DWPJ8n28A9ZfDAyQg2RBB7QUyPS/1iKOfPKeoIlqkRRhAaEpBUU0WFP9ucpkLzccLIZeuocT6Ms4pZfBAouOw+YcvcX6WKsswgb+mjJY+jAK3+jsMD0sMS2ncKeg8pAu9Ngu3WAZcjcSEgf/aEc4Lh42ytX0F1V5ZgkXNpyOpkkdV3lV+I85DvAwC9BjBKydr4V5yHB+JMicg51LudkyozOO8JkOVops9km1ogoC0N5bUTaC4Y3YOufqCPNo+F2vAYj4Y0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1156.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:14:04 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:14:04 +0000
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
Subject: [PATCH v1 19/20] riscv: dts: starfive: Add StarFive JHB100 pin function definitions
Date: Fri, 24 Apr 2026 04:13:29 -0700
Message-Id: <20260424111330.702272-20-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0025.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::34) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1156:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a60dae7-0fbe-46d6-75da-08dea1f29822
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wC2m8EonuEYpwTKhAvTz11Q6YC1Bt6E9ol4xpkCP+2BsxUusSw8QUsz1ZTKKPdIQreuAqjr5n5C7EA70pu1MzXfG8UBPgrQJnXi6O/CxQm5wg3SyBST8dAsFDohENXH7lxtbChjbwblUQm04IIjacblvXYZ/2XNnomhlQ3A3oOVc+3dnoASbZX4Vh5ULYnuq/Q0SQCToD5FvWeRg0RXMmF0eYDE/qUmyOCCkmunBCwPZqlsPHVe5vKA6ju04MkSVKEJURnpowkPFMLC4SCN5JOYPaDWeec+XAOqqYsQgVtt7PbNupxc6I5wx+GnExH6FJ9ciscmx95CzMFz1wXQsQW76h9YF0gCAx/2KVPrjnpGDOhzlatqFF++xT9R0GGuh+O4tjD7nkPZJ/Q2WcchGWoN5U9w3xi2+Pvdt/TMp4RGuOiEktbwdeXJpLqtXu7UmJ4urACHw2ydrEk5jB51v1DRWLqbxCe7RH1ixSP4sbDNchTGF8HNKqTdCKOMtt5SHLq632whaeqNOc8exGTTMD8aHoDiRcAu6B9WokupFIaUWTeqB9749i65G8j/hX992qq7DBmdiS+D+e4s0rGESb1vXGXKBxbAN4h6SBa2vfZI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B2tZs/o5ZO65OfiAq5PW0Le/NHjOh57YIi8t9URAPfdkevgP8YN8B66bJ0x5?=
 =?us-ascii?Q?PtL7/uqKvl+GY0/p/Yj+5SILneNhRXSYvLY/y4PqAnqGJ37UFUHalm+F6GN5?=
 =?us-ascii?Q?jVYP/sZwxDQpkBhOyNO1+VYG57JLe0MJET0gcVqWCNg/7OOV3igEHOWHLRy1?=
 =?us-ascii?Q?ULGniZt7wC2l5KzB2da2odPXRT7ZK+Ra5D5zhhRO26krqknSlNiPSobz/TG/?=
 =?us-ascii?Q?leW/XRUUGQbdOOnWOqAYqkI5Wr8brpgfAJ6VwrD8zL0dPHeo37NnjlpZ11R6?=
 =?us-ascii?Q?AygbiBvheBISulxRwh2x2xnEM91bDPaNSnEjg7nMiu780W+B6Nc4HzycTdYJ?=
 =?us-ascii?Q?7cLG1KT2Rbqo0sq14lUl9AfCDwKmJLPZiJAWc4OH+RctqHftPgsuaxmdo2Oa?=
 =?us-ascii?Q?qTXFjZ5zfBWGrTx9o7WukvC+iOsXhO7RlF6CJCEe4hwt2znUGfCv8uhkqlgz?=
 =?us-ascii?Q?LrYGEcE/d79kpdnUHYeujBRPqZ9CUKaAbqgDyMVpPQK8UvfDlvYWRdlofbpk?=
 =?us-ascii?Q?BHmKNHajhEKKOzQ9T9vEMQ1tp1eiEnealBNdyN2LXA+mP+hgeIBUeCrESEJl?=
 =?us-ascii?Q?vGGWtr0WErbMmnsZNiBGHlqqx4OlEiClYD1QZKMWOIq8yRcFpJQuHjzeP4ip?=
 =?us-ascii?Q?tTa+7UOQuBB9ybOKmMD4YP/W7XBohjzxcNYRTDmDIStEgvh66cx09uiIeTs1?=
 =?us-ascii?Q?ndi0ZWhMPMD/6lYrBxeqgh1ny0gbmQK5Dx8YpIdsxIuCnpQDBNFo9vuP6B24?=
 =?us-ascii?Q?VgiUChVeSHeNmb7qRDBajN0jGYsR3ZKA/cYZuUZYTVY10HTGUQJJ2lG04Bbj?=
 =?us-ascii?Q?9OR30VQ32p80fHVIJUcwf/IYRs9Llz8qa056HVXOd8QT6t78ff2SgEajZCgA?=
 =?us-ascii?Q?AFpUgqE2wzKDNfLXIChaQjdpux/E1GRRYuxKpDUj0oTEeZxD/haMERdyR4Nd?=
 =?us-ascii?Q?GTJiGRBt3kvcdl9HpnEprp9BzC4ZNkHesJcwD2ENFippr7EPC5P3RdLEAr9H?=
 =?us-ascii?Q?6sR0gLYHHcRdTOJD0hIbCG1zodoA8a0ijZ9k3GCClfuRrm1EdjxeJa2uYGE7?=
 =?us-ascii?Q?Y5p7AHfr8j/HcDWRfF6SBz00RBVPD6IkUjnNPCabGZDXj2GcwsgIO4sRHCuE?=
 =?us-ascii?Q?2HTj0OCrRBpJvoecaBNZdl+ebGvg/4LC2/elTViy/8rgxg6F7m0pepmFTlrQ?=
 =?us-ascii?Q?eEVFiIUlCbNLuHanS/MuKe6L/IFBO6MfOM7oqNAetRD5NynBiFEhWKoRZeig?=
 =?us-ascii?Q?yGT8PJoqdyotw8rXh2q04OUiF+dUVO+fV7WBrru8Se+Lg0sXpHvgwima3QtW?=
 =?us-ascii?Q?yL96LQQ79Whz2mA4rx0AKszHhSpl3iAWdGCX1tkNVJb4/IMeB8dpn/+rFojT?=
 =?us-ascii?Q?qppHeGHbgpdKGKqNri4gvAenbGTuRTWWrFsa6wq++ca/iGNVsXuKNhDvAFZc?=
 =?us-ascii?Q?x9BmTEWSurqFIwjh5kfQJxZ5QmLQqTdZ0mWB2GLJEij57ozjI/rz3A/N66pK?=
 =?us-ascii?Q?iw9MkR0xI2Bsd2nn0MniiSwjh+U1YroEUwb9TKZHjzMlmLoqCC4YSAVgR/a1?=
 =?us-ascii?Q?ve1wpXrksfSUUdkKRKcfhhUEliBmeWiztnYMmjb9APKnoCd6bqZRw4jbwYV3?=
 =?us-ascii?Q?O5dURWApG66fdDbIq5BcySPJKvJ6/P2CB6z8wr/JwWxxYBWclE+WpD/hGq7B?=
 =?us-ascii?Q?Jp7pZRjKDfqmsC4oqdOC2AFCVe+wBiZ8xdd2xV+CWOBYwIbufHCYgsG2LeMI?=
 =?us-ascii?Q?8lPribqVtaszR/nas3MdZupu6BoZSfpuEaW+BBfhFewaJUuGJSEk?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a60dae7-0fbe-46d6-75da-08dea1f29822
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:14:04.1057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHnpFHasDJ/Z/xU8N0RITNj1QW63Vm9WCtmcmSo34YF/JooSzUlI49LpIb7HLvet31LDuS+csS6NTpL0QHFMbqUSk3RXbtnn6pDxunXDY+mOo4XBYHA+xyMx6qTig8Fi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1156
X-Rspamd-Queue-Id: 66F6945E085
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35494-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

From: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>

Add pin function definitions for StarFive JHB100 SoC.

Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jhb100-pinfunc.h | 642 ++++++++++++++++++
 1 file changed, 642 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-pinfunc.h

diff --git a/arch/riscv/boot/dts/starfive/jhb100-pinfunc.h b/arch/riscv/boot/dts/starfive/jhb100-pinfunc.h
new file mode 100644
index 000000000000..cddad07444b0
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jhb100-pinfunc.h
@@ -0,0 +1,642 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ *
+ */
+
+#ifndef __JHB100_PINFUNC_H__
+#define __JHB100_PINFUNC_H__
+
+/*
+ * pinmux bits:
+ *  | 31 - 10  |  9 - 8   |  7 - 0  |
+ *  | reserved | function | gpio nr |
+ *
+ * func:     function value: 0, 1, or 2
+ * gpio nr:  gpio pad number, 0 through ngpios - 1
+ */
+#define PINMUX(n, func) ((((func) & 0x3) << 8) | ((n) & 0xff))
+
+/* pinctrl_sys0 pad numbers */
+#define PADNUM_SYS0_GPIO_A0				0
+#define PADNUM_SYS0_GPIO_A1				1
+#define PADNUM_SYS0_GPIO_A2				2
+#define PADNUM_SYS0_GPIO_A3				3
+
+/* pinctrl_sys0h pad numbers */
+#define PADNUM_SYS0H_GPIO_A4				0
+#define PADNUM_SYS0H_GPIO_A5				1
+#define PADNUM_SYS0H_GPIO_A6				2
+#define PADNUM_SYS0H_GPIO_A7				3
+#define PADNUM_SYS0H_GPIO_A8				4
+#define PADNUM_SYS0H_GPIO_A9				5
+#define PADNUM_SYS0H_GPIO_A10				6
+#define PADNUM_SYS0H_GPIO_A11				7
+#define PADNUM_SYS0H_GPIO_A12				8
+#define PADNUM_SYS0H_GPIO_A13				9
+#define PADNUM_SYS0H_GPIO_A14				10
+#define PADNUM_SYS0H_GPIO_A15				11
+
+/* pinctrl_sys1 pad numbers */
+#define PADNUM_SYS1_GPIO_A16				0
+#define PADNUM_SYS1_GPIO_A17				1
+#define PADNUM_SYS1_GPIO_A18				2
+#define PADNUM_SYS1_GPIO_A19				3
+#define PADNUM_SYS1_GPIO_A20				4
+#define PADNUM_SYS1_GPIO_A21				5
+#define PADNUM_SYS1_GPIO_A22				6
+#define PADNUM_SYS1_GPIO_A23				7
+
+/* pinctrl_sys2 pad numbers */
+#define PADNUM_SYS2_GPIO_A24				0
+#define PADNUM_SYS2_GPIO_A25				1
+#define PADNUM_SYS2_GPIO_A26				2
+#define PADNUM_SYS2_GPIO_A27				3
+#define PADNUM_SYS2_GPIO_A28				4
+#define PADNUM_SYS2_GPIO_A29				5
+#define PADNUM_SYS2_GPIO_A30				6
+#define PADNUM_SYS2_GPIO_A31				7
+#define PADNUM_SYS2_GPIO_A32				8
+#define PADNUM_SYS2_GPIO_A33				9
+#define PADNUM_SYS2_GPIO_A34				10
+#define PADNUM_SYS2_GPIO_A35				11
+#define PADNUM_SYS2_GPIO_A36				12
+#define PADNUM_SYS2_GPIO_A37				13
+#define PADNUM_SYS2_GPIO_A38				14
+#define PADNUM_SYS2_GPIO_A39				15
+#define PADNUM_SYS2_GPIO_A40				16
+#define PADNUM_SYS2_GPIO_A41				17
+#define PADNUM_SYS2_GPIO_A42				18
+#define PADNUM_SYS2_GPIO_A43				19
+#define PADNUM_SYS2_GPIO_A44				20
+#define PADNUM_SYS2_GPIO_A45				21
+#define PADNUM_SYS2_GPIO_A46				22
+#define PADNUM_SYS2_GPIO_A47				23
+#define PADNUM_SYS2_GPIO_A48				24
+#define PADNUM_SYS2_GPIO_A49				25
+#define PADNUM_SYS2_GPIO_A50				26
+#define PADNUM_SYS2_GPIO_A51				27
+#define PADNUM_SYS2_GPIO_A52				28
+#define PADNUM_SYS2_GPIO_A53				29
+#define PADNUM_SYS2_GPIO_A54				30
+#define PADNUM_SYS2_GPIO_A55				31
+#define PADNUM_SYS2_GPIO_A56				32
+#define PADNUM_SYS2_GPIO_A57				33
+#define PADNUM_SYS2_GPIO_A58				34
+#define PADNUM_SYS2_GPIO_A59				35
+#define PADNUM_SYS2_GPIO_A60				36
+
+/* pinctrl_per0 pad numbers */
+#define PADNUM_PER0_GPIO_B0				0
+#define PADNUM_PER0_GPIO_B1				1
+#define PADNUM_PER0_GPIO_B2				2
+#define PADNUM_PER0_GPIO_B3				3
+#define PADNUM_PER0_GPIO_B4				4
+#define PADNUM_PER0_GPIO_B5				5
+#define PADNUM_PER0_GPIO_B6				6
+#define PADNUM_PER0_GPIO_B7				7
+#define PADNUM_PER0_GPIO_B8				8
+#define PADNUM_PER0_GPIO_B9				9
+#define PADNUM_PER0_GPIO_B10				10
+#define PADNUM_PER0_GPIO_B11				11
+#define PADNUM_PER0_GPIO_B12				12
+#define PADNUM_PER0_GPIO_B13				13
+#define PADNUM_PER0_GPIO_B14				14
+#define PADNUM_PER0_GPIO_B15				15
+#define PADNUM_PER0_GPIO_B16				16
+#define PADNUM_PER0_GPIO_B17				17
+#define PADNUM_PER0_GPIO_B18				18
+#define PADNUM_PER0_GPIO_B19				19
+#define PADNUM_PER0_GPIO_B20				20
+#define PADNUM_PER0_GPIO_B21				21
+#define PADNUM_PER0_GPIO_B22				22
+#define PADNUM_PER0_GPIO_B23				23
+#define PADNUM_PER0_GPIO_B24				24
+#define PADNUM_PER0_GPIO_B25				25
+#define PADNUM_PER0_GPIO_B26				26
+#define PADNUM_PER0_GPIO_B27				27
+#define PADNUM_PER0_GPIO_B28				28
+#define PADNUM_PER0_GPIO_B29				29
+#define PADNUM_PER0_GPIO_B30				30
+#define PADNUM_PER0_GPIO_B31				31
+#define PADNUM_PER0_GPIO_B32				32
+#define PADNUM_PER0_GPIO_B33				33
+#define PADNUM_PER0_GPIO_B34				34
+#define PADNUM_PER0_GPIO_B35				35
+#define PADNUM_PER0_GPIO_B36				36
+#define PADNUM_PER0_GPIO_B37				37
+#define PADNUM_PER0_GPIO_B38				38
+#define PADNUM_PER0_GPIO_B39				39
+#define PADNUM_PER0_GPIO_B40				40
+#define PADNUM_PER0_GPIO_B41				41
+#define PADNUM_PER0_GPIO_B42				42
+#define PADNUM_PER0_GPIO_B43				43
+#define PADNUM_PER0_GPIO_B44				44
+#define PADNUM_PER0_GPIO_B45				45
+#define PADNUM_PER0_GPIO_B46				46
+#define PADNUM_PER0_GPIO_B47				47
+#define PADNUM_PER0_GPIO_B48				48
+#define PADNUM_PER0_GPIO_B49				49
+#define PADNUM_PER0_GPIO_B50				50
+#define PADNUM_PER0_GPIO_B51				51
+#define PADNUM_PER0_GPIO_B52				52
+#define PADNUM_PER0_GPIO_B53				53
+#define PADNUM_PER0_GPIO_B54				54
+#define PADNUM_PER0_GPIO_B55				55
+#define PADNUM_PER0_GPIO_B56				56
+#define PADNUM_PER0_GPIO_B57				57
+#define PADNUM_PER0_GPIO_B58				58
+#define PADNUM_PER0_GPIO_B59				59
+
+/* pinctrl_per1 pad numbers */
+#define PADNUM_PER1_GPIO_C0				0
+#define PADNUM_PER1_GPIO_C1				1
+#define PADNUM_PER1_GPIO_C2				2
+#define PADNUM_PER1_GPIO_C3				3
+#define PADNUM_PER1_GPIO_C4				4
+#define PADNUM_PER1_GPIO_C5				5
+#define PADNUM_PER1_GPIO_C6				6
+#define PADNUM_PER1_GPIO_C7				7
+#define PADNUM_PER1_GPIO_C8				8
+#define PADNUM_PER1_GPIO_C9				9
+#define PADNUM_PER1_GPIO_C10				10
+#define PADNUM_PER1_GPIO_C11				11
+#define PADNUM_PER1_GPIO_C12				12
+#define PADNUM_PER1_GPIO_C13				13
+#define PADNUM_PER1_GPIO_C14				14
+#define PADNUM_PER1_GPIO_C15				15
+#define PADNUM_PER1_GPIO_C16				16
+#define PADNUM_PER1_GPIO_C17				17
+#define PADNUM_PER1_GPIO_C18				18
+#define PADNUM_PER1_GPIO_C19				19
+#define PADNUM_PER1_GPIO_C20				20
+#define PADNUM_PER1_GPIO_C21				21
+#define PADNUM_PER1_GPIO_C22				22
+#define PADNUM_PER1_GPIO_C23				23
+#define PADNUM_PER1_GPIO_C24				24
+#define PADNUM_PER1_GPIO_C25				25
+#define PADNUM_PER1_GPIO_C26				26
+#define PADNUM_PER1_GPIO_C27				27
+#define PADNUM_PER1_GPIO_C28				28
+#define PADNUM_PER1_GPIO_C29				29
+#define PADNUM_PER1_GPIO_C30				30
+#define PADNUM_PER1_GPIO_C31				31
+#define PADNUM_PER1_GPIO_C32				32
+#define PADNUM_PER1_GPIO_C33				33
+#define PADNUM_PER1_GPIO_C34				34
+#define PADNUM_PER1_GPIO_C35				35
+
+/* pinctrl_per0 pad numbers */
+#define PADNUM_PER2_GPIO_D0				0
+#define PADNUM_PER2_GPIO_D1				1
+#define PADNUM_PER2_GPIO_D2				2
+#define PADNUM_PER2_GPIO_D3				3
+#define PADNUM_PER2_GPIO_D4				4
+#define PADNUM_PER2_GPIO_D5				5
+#define PADNUM_PER2_GPIO_D6				6
+#define PADNUM_PER2_GPIO_D7				7
+#define PADNUM_PER2_GPIO_D8				8
+#define PADNUM_PER2_GPIO_D9				9
+#define PADNUM_PER2_GPIO_D10				10
+#define PADNUM_PER2_GPIO_D11				11
+#define PADNUM_PER2_GPIO_D12				12
+#define PADNUM_PER2_GPIO_D13				13
+#define PADNUM_PER2_GPIO_D14				14
+#define PADNUM_PER2_GPIO_D15				15
+#define PADNUM_PER2_GPIO_D16				16
+#define PADNUM_PER2_GPIO_D17				17
+#define PADNUM_PER2_GPIO_D18				18
+#define PADNUM_PER2_GPIO_D19				19
+#define PADNUM_PER2_GPIO_D20				20
+#define PADNUM_PER2_GPIO_D21				21
+#define PADNUM_PER2_GPIO_D22				22
+#define PADNUM_PER2_GPIO_D23				23
+#define PADNUM_PER2_GPIO_D24				24
+#define PADNUM_PER2_GPIO_D25				25
+#define PADNUM_PER2_GPIO_D26				26
+#define PADNUM_PER2_GPIO_D27				27
+#define PADNUM_PER2_GPIO_D28				28
+#define PADNUM_PER2_GPIO_D29				29
+#define PADNUM_PER2_GPIO_D30				30
+
+/* pinctrl_per2pok pad numbers */
+#define PADNUM_PER2POK_GPIO_D31				0
+#define PADNUM_PER2POK_GPIO_D32				1
+#define PADNUM_PER2POK_GPIO_D33				2
+#define PADNUM_PER2POK_GPIO_D34				3
+#define PADNUM_PER2POK_GPIO_D35				4
+#define PADNUM_PER2POK_GPIO_D36				5
+#define PADNUM_PER2POK_GPIO_D37				6
+#define PADNUM_PER2POK_GPIO_D38				7
+#define PADNUM_PER2POK_GPIO_D39				8
+#define PADNUM_PER2POK_GPIO_D40				9
+#define PADNUM_PER2POK_GPIO_D41				10
+#define PADNUM_PER2POK_GPIO_D42				11
+#define PADNUM_PER2POK_GPIO_D43				12
+#define PADNUM_PER2POK_GPIO_D44				13
+#define PADNUM_PER2POK_GPIO_D45				14
+#define PADNUM_PER2POK_GPIO_D46				15
+#define PADNUM_PER2POK_GPIO_D47				16
+#define PADNUM_PER2POK_GPIO_D48				17
+
+/* pinctrl_per3 pad numbers */
+#define PADNUM_PER3_GPIO_E0				0
+#define PADNUM_PER3_GPIO_E1				1
+#define PADNUM_PER3_GPIO_E2				2
+#define PADNUM_PER3_GPIO_E3				3
+#define PADNUM_PER3_GPIO_E4				4
+#define PADNUM_PER3_GPIO_E5				5
+#define PADNUM_PER3_GPIO_E6				6
+#define PADNUM_PER3_GPIO_E7				7
+#define PADNUM_PER3_GPIO_E8				8
+#define PADNUM_PER3_GPIO_E9				9
+#define PADNUM_PER3_GPIO_E10				10
+#define PADNUM_PER3_GPIO_E11				11
+
+/* Function Selection */
+
+/* pinctrl_sys0 pad function selection */
+#define FUNC_SYS0_DOM_HOSTSS_AUXPWRGOOD0		1
+#define FUNC_SYS0_DOM_HOSTSS_AUXPWRGOOD1		1
+#define FUNC_SYS0_HBLED					1
+#define FUNC_SYS0_PE2RST_OUT				0
+#define FUNC_SYS0_GPIO3					1
+
+/* pinctrl_sys0h pad function selection */
+#define FUNC_SYS0H_ESPI0_DATA0				1
+#define FUNC_SYS0H_ESPI0_DATA1				1
+#define FUNC_SYS0H_ESPI0_DATA2				1
+#define FUNC_SYS0H_ESPI0_DATA3				1
+#define FUNC_SYS0H_ESPI0_CLK				1
+#define FUNC_SYS0H_ESPI0_CS				1
+#define FUNC_SYS0H_ESPI0_ALERT				1
+#define FUNC_SYS0H_ESPI0_RESET				0
+#define FUNC_SYS0H_GPIO7				1
+#define FUNC_SYS0H_ESPI0_VW0				1
+#define FUNC_SYS0H_ESPI0_VW1				1
+#define FUNC_SYS0H_ESPI0_VW2				1
+#define FUNC_SYS0H_ESPI0_VW3				1
+#define FUNC_SYS0H_ESPI1_VW0				2
+#define FUNC_SYS0H_ESPI1_VW1				2
+#define FUNC_SYS0H_ESPI1_VW2				2
+#define FUNC_SYS0H_ESPI1_VW3				2
+#define FUNC_SYS0H_SCAP_TRIG0_A				3
+#define FUNC_SYS0H_SCAP_TRIG1_A				3
+
+/* pinctrl_sys1 pad numbers */
+#define FUNC_SYS1_ESPI1_DATA0				1
+#define FUNC_SYS1_ESPI1_DATA1				1
+#define FUNC_SYS1_ESPI1_DATA2				1
+#define FUNC_SYS1_ESPI1_DATA3				1
+#define FUNC_SYS1_ESPI1_CLK				1
+#define FUNC_SYS1_ESPI1_CS				1
+#define FUNC_SYS1_ESPI1_ALERT				1
+#define FUNC_SYS1_ESPI1_RESET				0
+#define FUNC_SYS1_GPIO7					1
+
+#define FUNC_SYS1_HOST0_PORT80_DATA_OUT0		2
+#define FUNC_SYS1_HOST0_PORT80_DATA_OUT1		2
+#define FUNC_SYS1_HOST0_PORT80_DATA_OUT2		2
+#define FUNC_SYS1_HOST0_PORT80_DATA_OUT3		2
+#define FUNC_SYS1_HOST0_PORT80_DATA_OUT4		2
+#define FUNC_SYS1_HOST0_PORT80_DATA_OUT5		2
+#define FUNC_SYS1_HOST0_PORT80_DATA_OUT6		2
+#define FUNC_SYS1_HOST0_PORT80_DATA_OUT7		2
+
+#define FUNC_SYS1_HOST1_PORT80_DATA_OUT0		3
+#define FUNC_SYS1_HOST1_PORT80_DATA_OUT1		3
+#define FUNC_SYS1_HOST1_PORT80_DATA_OUT2		3
+#define FUNC_SYS1_HOST1_PORT80_DATA_OUT3		3
+#define FUNC_SYS1_HOST1_PORT80_DATA_OUT4		3
+#define FUNC_SYS1_HOST1_PORT80_DATA_OUT5		3
+#define FUNC_SYS1_HOST1_PORT80_DATA_OUT6		3
+#define FUNC_SYS1_HOST1_PORT80_DATA_OUT7		3
+
+/* pinctrl_sys2 pad function selection */
+#define FUNC_SYS2_UART_CTS				1
+#define FUNC_SYS2_UART_RTS				1
+#define FUNC_SYS2_UART_DCD				1
+#define FUNC_SYS2_UART_DSR				1
+#define FUNC_SYS2_UART_DTR				1
+#define FUNC_SYS2_UART_RI				1
+#define FUNC_SYS2_UART0_TX				1
+#define FUNC_SYS2_UART0_RX				1
+#define FUNC_SYS2_UART1_TX				1
+#define FUNC_SYS2_UART1_RX				1
+#define FUNC_SYS2_UART2_TX				1
+#define FUNC_SYS2_UART2_RX				1
+#define FUNC_SYS2_UART3_TX				1
+#define FUNC_SYS2_UART3_RX				1
+#define FUNC_SYS2_UART4_TX				1
+#define FUNC_SYS2_UART4_RX				1
+#define FUNC_SYS2_UART5_TX				1
+#define FUNC_SYS2_UART5_RX				1
+#define FUNC_SYS2_UART6_TX				1
+#define FUNC_SYS2_UART6_RX				1
+#define FUNC_SYS2_UART7_TX				1
+#define FUNC_SYS2_UART7_RX				1
+#define FUNC_SYS2_UART8_TX				1
+#define FUNC_SYS2_UART8_RX				1
+#define FUNC_SYS2_UART9_TX				1
+#define FUNC_SYS2_UART9_RX				1
+#define FUNC_SYS2_UART10_TX				1
+#define FUNC_SYS2_UART10_RX				1
+#define FUNC_SYS2_UART11_TX				1
+#define FUNC_SYS2_UART11_RX				1
+#define FUNC_SYS2_UART12_TX				1
+#define FUNC_SYS2_UART12_RX				1
+#define FUNC_SYS2_UART13_TX				1
+#define FUNC_SYS2_UART13_RX				1
+#define FUNC_SYS2_UART14_TX				1
+#define FUNC_SYS2_UART14_RX				1
+
+#define FUNC_SYS2_I2C8_SMBALERT				2
+#define FUNC_SYS2_I2C9_SMBALERT				2
+#define FUNC_SYS2_I2C10_SMBALERT			2
+#define FUNC_SYS2_I2C11_SMBALERT			2
+#define FUNC_SYS2_I2C12_SMBALERT			2
+#define FUNC_SYS2_I2C13_SMBALERT			2
+#define FUNC_SYS2_I2C14_SMBALERT			2
+#define FUNC_SYS2_I2C15_SMBALERT			2
+#define FUNC_SYS2_HOST0_PORT80_DATA_OUT0		2
+#define FUNC_SYS2_HOST0_PORT80_DATA_OUT1		2
+#define FUNC_SYS2_HOST0_PORT80_DATA_OUT2		2
+#define FUNC_SYS2_HOST0_PORT80_DATA_OUT3		2
+#define FUNC_SYS2_HOST0_PORT80_DATA_OUT4		2
+#define FUNC_SYS2_HOST0_PORT80_DATA_OUT5		2
+#define FUNC_SYS2_HOST0_PORT80_DATA_OUT6		2
+#define FUNC_SYS2_HOST0_PORT80_DATA_OUT7		2
+#define FUNC_SYS2_JTAG_MST_TDI				2
+#define FUNC_SYS2_JTAG_MST_TRST_N			2
+#define FUNC_SYS2_JTAG_MST_TMS				2
+#define FUNC_SYS2_JTAG_MST_TCK				2
+#define FUNC_SYS2_JTAG_MST_TDO				2
+
+#define FUNC_SYS2_HOST1_PORT80_DATA_OUT0		3
+#define FUNC_SYS2_HOST1_PORT80_DATA_OUT1		3
+#define FUNC_SYS2_HOST1_PORT80_DATA_OUT2		3
+#define FUNC_SYS2_HOST1_PORT80_DATA_OUT3		3
+#define FUNC_SYS2_HOST1_PORT80_DATA_OUT4		3
+#define FUNC_SYS2_HOST1_PORT80_DATA_OUT5		3
+#define FUNC_SYS2_HOST1_PORT80_DATA_OUT6		3
+#define FUNC_SYS2_HOST1_PORT80_DATA_OUT7		3
+
+/* pinctrl_per0 function numbers */
+#define FUNC_PER0_I2C0_CLK				1
+#define FUNC_PER0_I2C0_DATA				1
+#define FUNC_PER0_I2C1_CLK				1
+#define FUNC_PER0_I2C1_DATA				1
+#define FUNC_PER0_I2C2_CLK				1
+#define FUNC_PER0_I2C2_DATA				1
+#define FUNC_PER0_I2C3_CLK				1
+#define FUNC_PER0_I2C3_DATA				1
+#define FUNC_PER0_I2C4_CLK				1
+#define FUNC_PER0_I2C4_DATA				1
+#define FUNC_PER0_I2C5_CLK				1
+#define FUNC_PER0_I2C5_DATA				1
+#define FUNC_PER0_I2C6_CLK				1
+#define FUNC_PER0_I2C6_DATA				1
+#define FUNC_PER0_I2C7_CLK				1
+#define FUNC_PER0_I2C7_DATA				1
+#define FUNC_PER0_I2C8_CLK				1
+#define FUNC_PER0_I2C8_DATA				1
+#define FUNC_PER0_I2C9_CLK				1
+#define FUNC_PER0_I2C9_DATA				1
+#define FUNC_PER0_I2C10_CLK				1
+#define FUNC_PER0_I2C10_DATA				1
+#define FUNC_PER0_I2C11_CLK				1
+#define FUNC_PER0_I2C11_DATA				1
+#define FUNC_PER0_I2C12_CLK				1
+#define FUNC_PER0_I2C12_DATA				1
+#define FUNC_PER0_I2C13_CLK				1
+#define FUNC_PER0_I2C13_DATA				1
+#define FUNC_PER0_SMBUS0_SMBALERT			1
+#define FUNC_PER0_SMBUS1_SMBALERT			1
+#define FUNC_PER0_SMBUS2_SMBALERT			1
+#define FUNC_PER0_SMBUS3_SMBALERT			1
+#define FUNC_PER0_SMBUS4_SMBALERT			1
+#define FUNC_PER0_SMBUS5_SMBALERT			1
+#define FUNC_PER0_SMBUS6_SMBALERT			1
+#define FUNC_PER0_SMBUS7_SMBALERT			1
+#define FUNC_PER0_MIPI_I3C12_SCL0			1
+#define FUNC_PER0_MIPI_I3C12_SDA0			1
+#define FUNC_PER0_MIPI_I3C13_SCL0			1
+#define FUNC_PER0_MIPI_I3C13_SDA0			1
+#define FUNC_PER0_MIPI_I3C14_SCL0			1
+#define FUNC_PER0_MIPI_I3C14_SDA0			1
+#define FUNC_PER0_MIPI_I3C15_SCL0			1
+#define FUNC_PER0_MIPI_I3C15_SDA0			1
+#define FUNC_PER0_MIPI_I3C0_SCL0			1
+#define FUNC_PER0_MIPI_I3C0_SDA0			1
+#define FUNC_PER0_MIPI_I3C1_SCL0			1
+#define FUNC_PER0_MIPI_I3C1_SDA0			1
+#define FUNC_PER0_MIPI_I3C2_SCL0			1
+#define FUNC_PER0_MIPI_I3C2_SDA0			1
+#define FUNC_PER0_MIPI_I3C3_SCL0			1
+#define FUNC_PER0_MIPI_I3C3_SDA0			1
+#define FUNC_PER0_MIPI_I3C4_SCL1			1
+#define FUNC_PER0_MIPI_I3C4_SDA1			1
+#define FUNC_PER0_MIPI_I3C5_SCL1			1
+#define FUNC_PER0_MIPI_I3C5_SDA1			1
+#define FUNC_PER0_MIPI_I3C6_SCL1			1
+#define FUNC_PER0_MIPI_I3C6_SDA1			1
+#define FUNC_PER0_MIPI_I3C7_SCL1			1
+#define FUNC_PER0_MIPI_I3C7_SDA1			1
+
+#define FUNC_PER0_MIPI_I3C4_SCL0			2
+#define FUNC_PER0_MIPI_I3C4_SDA0			2
+#define FUNC_PER0_MIPI_I3C5_SCL0			2
+#define FUNC_PER0_MIPI_I3C5_SDA0			2
+#define FUNC_PER0_MIPI_I3C6_SCL0			2
+#define FUNC_PER0_MIPI_I3C6_SDA0			2
+#define FUNC_PER0_MIPI_I3C7_SCL0			2
+#define FUNC_PER0_MIPI_I3C7_SDA0			2
+#define FUNC_PER0_MIPI_I3C8_SCL0			2
+#define FUNC_PER0_MIPI_I3C8_SDA0			2
+#define FUNC_PER0_MIPI_I3C9_SCL0			2
+#define FUNC_PER0_MIPI_I3C9_SDA0			2
+#define FUNC_PER0_MIPI_I3C10_SCL0			2
+#define FUNC_PER0_MIPI_I3C10_SDA0			2
+#define FUNC_PER0_MIPI_I3C11_SCL0			2
+#define FUNC_PER0_MIPI_I3C11_SDA0			2
+#define FUNC_PER0_GMAC2_MDC				2
+#define FUNC_PER0_GMAC2_MDIO				2
+#define FUNC_PER0_GMAC3_MDC				2
+#define FUNC_PER0_GMAC3_MDIO				2
+#define FUNC_PER0_GMAC1_MDC				2
+#define FUNC_PER0_GMAC1_MDIO				2
+#define FUNC_PER0_WDT0_3_OR_RESET_OUTPUT		2
+#define FUNC_PER0_WDT_SECRP_RESET_OUTPUT		2
+#define FUNC_PER0_WDT4_RESET_OUTPUT			2
+#define FUNC_PER0_WDT4_RESTART_INPUT			2
+
+/* pinctrl_per1 pad function selection */
+#define FUNC_PER1_SPI0_N_SS_OUT_0			1
+#define FUNC_PER1_SPI0_N_SS_OUT_1			1
+#define FUNC_PER1_SPI0_SCLK_OUT				1
+#define FUNC_PER1_SPI0_TX				1
+#define FUNC_PER1_SPI0_RX				1
+#define FUNC_PER1_SFC0_N_SS_OUT_0			1
+#define FUNC_PER1_SFC0_N_SS_OUT_1			1
+#define FUNC_PER1_SFC0_SCLK_OUT				1
+#define FUNC_PER1_SFC0_IO0				1
+#define FUNC_PER1_SFC0_IO1				1
+#define FUNC_PER1_SFC0_IO2				1
+#define FUNC_PER1_SFC0_IO3				1
+#define FUNC_PER1_SFC1_N_SS_OUT_0			1
+#define FUNC_PER1_SFC1_N_SS_OUT_1			1
+#define FUNC_PER1_SFC1_N_SS_OUT_2			1
+#define FUNC_PER1_SFC1_SCLK_OUT				1
+#define FUNC_PER1_SFC1_IO0				1
+#define FUNC_PER1_SFC1_IO1				1
+#define FUNC_PER1_SFC1_IO2				1
+#define FUNC_PER1_SFC1_IO3				1
+#define FUNC_PER1_SFC2_N_SS_OUT_0			1
+#define FUNC_PER1_SFC2_N_SS_OUT_1			1
+#define FUNC_PER1_SFC2_N_SS_OUT_2			1
+#define FUNC_PER1_SFC2_SCLK_OUT				1
+#define FUNC_PER1_SFC2_IO0				1
+#define FUNC_PER1_SFC2_IO1				1
+#define FUNC_PER1_SFC2_IO2				1
+#define FUNC_PER1_SFC2_IO3				1
+#define FUNC_PER1_SGPIO0_M_CLK				1
+#define FUNC_PER1_SGPIO0_M_LOAD				1
+#define FUNC_PER1_SGPIO0_M_DATA_OUT			1
+#define FUNC_PER1_SGPIO0_M_DATA_IN			1
+#define FUNC_PER1_I2C14_CLK				1
+#define FUNC_PER1_I2C14_DATA				1
+#define FUNC_PER1_I2C15_CLK				1
+#define FUNC_PER1_I2C15_DATA				1
+
+#define FUNC_PER1_SGPIO1_M_CLK				2
+#define FUNC_PER1_SGPIO1_M_LOAD				2
+#define FUNC_PER1_SGPIO1_M_DATA_OUT			2
+#define FUNC_PER1_SGPIO1_M_DATA_IN			2
+
+/* pinctrl_per2 function selection */
+#define FUNC_PER2_FAN0_TACH_I_0				1
+#define FUNC_PER2_FAN0_TACH_I_1				1
+#define FUNC_PER2_FAN0_TACH_I_2				1
+#define FUNC_PER2_FAN0_TACH_I_3				1
+#define FUNC_PER2_FAN0_TACH_I_4				1
+#define FUNC_PER2_FAN0_TACH_I_5				1
+#define FUNC_PER2_FAN0_TACH_I_6				1
+#define FUNC_PER2_FAN0_TACH_I_7				1
+#define FUNC_PER2_FAN0_TACH_I_8				1
+#define FUNC_PER2_FAN0_TACH_I_9				1
+#define FUNC_PER2_FAN0_TACH_I_10			1
+#define FUNC_PER2_FAN0_TACH_I_11			1
+#define FUNC_PER2_FAN0_TACH_I_12			1
+#define FUNC_PER2_FAN0_TACH_I_13			1
+#define FUNC_PER2_FAN0_TACH_I_14			1
+#define FUNC_PER2_FAN0_TACH_I_15			1
+#define FUNC_PER2_GMAC2_RGMII_RX_CLK			1
+#define FUNC_PER2_GMAC2_RGMII_RXCTL			1
+#define FUNC_PER2_GMAC2_RGMII_PHY_RXD0			1
+#define FUNC_PER2_GMAC2_RGMII_PHY_RXD1			1
+#define FUNC_PER2_GMAC2_RGMII_PHY_RXD2			1
+#define FUNC_PER2_GMAC2_RGMII_PHY_RXD3			1
+#define FUNC_PER2_GMAC2_RGMII_TX_CLK			1
+#define FUNC_PER2_GMAC2_RGMII_TXCTL			1
+#define FUNC_PER2_GMAC2_RGMII_PHY_TX0			1
+#define FUNC_PER2_GMAC2_RGMII_PHY_TX1			1
+#define FUNC_PER2_GMAC2_RGMII_PHY_TX2			1
+#define FUNC_PER2_GMAC2_RGMII_PHY_TX3			1
+
+#define FUNC_PER2_GMAC2_RMII_RX_CLK			2
+#define FUNC_PER2_GMAC2_RMII_CRSDV			2
+#define FUNC_PER2_GMAC2_RMII_PHY_RXD0			2
+#define FUNC_PER2_GMAC2_RMII_PHY_RXD1			2
+#define FUNC_PER2_GMAC2_RMII_RX_CKO			2
+#define FUNC_PER2_GMAC2_RMII_TXEN			2
+#define FUNC_PER2_GMAC2_RMII_PHY_TXD0			2
+#define FUNC_PER2_GMAC2_RMII_PHY_TXD1			2
+
+#define FUNC_PER2_HOSTSS0_PORT80_DATA_OUT0		2
+#define FUNC_PER2_HOSTSS0_PORT80_DATA_OUT1		2
+#define FUNC_PER2_HOSTSS0_PORT80_DATA_OUT2		2
+#define FUNC_PER2_HOSTSS0_PORT80_DATA_OUT3		2
+#define FUNC_PER2_HOSTSS0_PORT80_DATA_OUT4		2
+#define FUNC_PER2_HOSTSS0_PORT80_DATA_OUT5		2
+#define FUNC_PER2_HOSTSS0_PORT80_DATA_OUT6		2
+#define FUNC_PER2_HOSTSS0_PORT80_DATA_OUT7		2
+#define FUNC_PER2_HOSTSS1_PORT80_DATA_OUT0		3
+#define FUNC_PER2_HOSTSS1_PORT80_DATA_OUT1		3
+#define FUNC_PER2_HOSTSS1_PORT80_DATA_OUT2		3
+#define FUNC_PER2_HOSTSS1_PORT80_DATA_OUT3		3
+#define FUNC_PER2_HOSTSS1_PORT80_DATA_OUT4		3
+#define FUNC_PER2_HOSTSS1_PORT80_DATA_OUT5		3
+#define FUNC_PER2_HOSTSS1_PORT80_DATA_OUT6		3
+#define FUNC_PER2_HOSTSS1_PORT80_DATA_OUT7		3
+
+/* pinctrl_per2pok function selection */
+#define FUNC_PER2POK_PWM0_CHANNEL0			0
+#define FUNC_PER2POK_PWM0_CHANNEL1			0
+#define FUNC_PER2POK_PWM0_CHANNEL2			0
+#define FUNC_PER2POK_PWM0_CHANNEL3			0
+#define FUNC_PER2POK_PWM0_CHANNEL4			0
+#define FUNC_PER2POK_PWM0_CHANNEL5			0
+#define FUNC_PER2POK_PWM0_CHANNEL6			0
+#define FUNC_PER2POK_PWM0_CHANNEL7			0
+
+#define FUNC_PER2POK_CAN0_TXD				1
+#define FUNC_PER2POK_CAN0_RXD				1
+#define FUNC_PER2POK_CAN0_STBY				1
+#define FUNC_PER2POK_CAN1_TXD				1
+#define FUNC_PER2POK_CAN1_RXD				1
+#define FUNC_PER2POK_CAN1_STBY				1
+#define FUNC_PER2POK_GPIO_PASSTHRU1_IN			1
+#define FUNC_PER2POK_GPIO_PASSTHRU1_OUT			1
+#define FUNC_PER2POK_GPIO_PASSTHRU2_IN			1
+#define FUNC_PER2POK_GPIO_PASSTHRU2_OUT			1
+#define FUNC_PER2POK_GPIO10				1
+#define FUNC_PER2POK_GPIO11				1
+#define FUNC_PER2POK_GPIO12				1
+#define FUNC_PER2POK_GPIO13				1
+#define FUNC_PER2POK_GPIO14				1
+#define FUNC_PER2POK_GPIO15				1
+#define FUNC_PER2POK_GPIO16				1
+#define FUNC_PER2POK_GPIO17				1
+
+#define FUNC_PER2POK_GPIO_PASSTHRU3_IN			2
+#define FUNC_PER2POK_GPIO_PASSTHRU3_OUT			2
+#define FUNC_PER2POK_HOSTSS0_PORT80_DATA_OUT0		2
+#define FUNC_PER2POK_HOSTSS0_PORT80_DATA_OUT1		2
+#define FUNC_PER2POK_HOSTSS0_PORT80_DATA_OUT2		2
+#define FUNC_PER2POK_HOSTSS0_PORT80_DATA_OUT3		2
+#define FUNC_PER2POK_HOSTSS0_PORT80_DATA_OUT4		2
+#define FUNC_PER2POK_HOSTSS0_PORT80_DATA_OUT5		2
+#define FUNC_PER2POK_HOSTSS0_PORT80_DATA_OUT6		2
+#define FUNC_PER2POK_HOSTSS0_PORT80_DATA_OUT7		2
+
+#define FUNC_PER2POK_HOSTSS1_PORT80_DATA_OUT0		3
+#define FUNC_PER2POK_HOSTSS1_PORT80_DATA_OUT1		3
+#define FUNC_PER2POK_HOSTSS1_PORT80_DATA_OUT2		3
+#define FUNC_PER2POK_HOSTSS1_PORT80_DATA_OUT3		3
+#define FUNC_PER2POK_HOSTSS1_PORT80_DATA_OUT4		3
+#define FUNC_PER2POK_HOSTSS1_PORT80_DATA_OUT5		3
+#define FUNC_PER2POK_HOSTSS1_PORT80_DATA_OUT6		3
+#define FUNC_PER2POK_HOSTSS1_PORT80_DATA_OUT7		3
+
+/* pinctrl_per3 function selection */
+#define FUNC_PER3_GMAC0_MDC				1
+#define FUNC_PER3_GMAC0_MDIO				1
+#define FUNC_PER3_GMAC0_RMII_RCLKI			1
+#define FUNC_PER3_GMAC0_RMII_RCLKO			1
+#define FUNC_PER3_GMAC0_RMII_CRSDV			1
+#define FUNC_PER3_GMAC0_RMII_PHY_RXD0			1
+#define FUNC_PER3_GMAC0_RMII_PHY_RXD1			1
+#define FUNC_PER3_GMAC0_RMII_TXEN			1
+#define FUNC_PER3_GMAC0_RMII_PHY_TXD0			1
+#define FUNC_PER3_GMAC0_RMII_PHY_TXD1			1
+
+/* gpio func sel value */
+#define FUNC_SEL0_GPIO					0
+#define FUNC_SEL1_GPIO					1
+
+/* vref value */
+#define JHB100_PINVREF_3_3V				0
+#define JHB100_PINVREF_2_5V				1
+#define JHB100_PINVREF_1_8V				2
+
+#endif
-- 
2.25.1


