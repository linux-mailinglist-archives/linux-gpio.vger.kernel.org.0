Return-Path: <linux-gpio+bounces-34841-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGj7MkVS1Wkf4wcAu9opvQ
	(envelope-from <linux-gpio+bounces-34841-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:51:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 310493B3123
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 20:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B1F130523EC
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 18:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A659342517;
	Tue,  7 Apr 2026 18:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="uhnY3w9m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazon11020135.outbound.protection.outlook.com [52.101.188.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF9E34DB74;
	Tue,  7 Apr 2026 18:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.188.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587770; cv=fail; b=u+CFgF1u23nEqzJATVIobcHaziSkDA+wgpDxo8J0eN8DC84vB0VXyCAoueFZHMbVnkIorqeScUQtxkM2xiVrtOgUe4X2A0acc3qyFZyYLGUfJPDuEWbj1oI1GBmOI2HJFPBLX29qtad6z+nH4pmiIdmEz6TsL0BGNarl86Ute+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587770; c=relaxed/simple;
	bh=oYQmwLb5zzIXWtIOore2afE/CK+BKd+eTNNQY6aOkWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=njVaA0LO9FxyNY+XCr4nFRhRN5C7YRtla9VRNA0YSJ+ha581EqnOLzgYJ8+EnzIUqtCTqd8I2gSbT4fDYzQCSYBTYYjM7EFS50JbLq7qBImbd4/Lsj9+RWR75CClXLYWE3WtltoATl7wugbN81mE01Q/wiZ7ZaEA8uaYL1QC8L8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=uhnY3w9m; arc=fail smtp.client-ip=52.101.188.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6CAcyba/diEjJ7/Vr2174jFdhKxc32iaTRrTlIuGIMdezkzw+suQYWF/LW9VI5XJaWXh1acVMhF1aPND2Z/oJdyp44vxmENbvtCvhKJogVWdyq7FlWnq729BG8xGegsNFJ/I4egPiSi/8rC8hcFebIT8GBnd3rP099FjhLwGQvWRy8gjd+kW8Q5WRFXQ7omyEOOUwFKzC6rrXvDrsRa+/CDOXsaHzZAhioG01GPSOxe8BrMDj8Gks3T6IfG/ebk9JG7g/kvQpVORt9KpV2hSGLmPv85LEPjs00tbBHCga5N1CFuyoiU3CcUKll8Id2jvvg79LkgzngtSI92uSFM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrV85HYfQuXHRQ8zJAYDFHmceCUeAemRNx18mQXDifE=;
 b=cQmz/XcDyMOUjIRavDSFFTv982bJzJGfcwjBTQDR3co5DuZdMW+M1akJ7n6RXf9TqnAy1Ianf9KUlVWLnBWIFtGD59V4Ows+j8qd/BHEvaV+kyDVrMt2L7gtUj+/fkTtaVG9w1FdPvYTqIELT1yG6Fqm7vZ/pBNzwJ3JBmgEoE7DqkPCnNCpBvWFsbOAfBf8y0fM1VARoWJpE8tHdx1oAumdFHzHSrvvfmEJCLuDYwbNlKQK/aOBeCF8AzuyCP5UuaYr1Sy6esPNHMq6BbQF/qIsnaZVoiySWP14NnrEje4mroexZe24WbqltPrC5n5RIrVX4uIbmGh5IpkKsPFF7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.1) smtp.rcpttodomain=kernel.org smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrV85HYfQuXHRQ8zJAYDFHmceCUeAemRNx18mQXDifE=;
 b=uhnY3w9md8kW9mJxy59tbr62rCu1b0PAu76OyBFtt8WxasBjGxvJCcL6C6dRvMrKFS/9qBlGdh0GvX93VD3fgObKcmDf1c7c4NIqLofpBs+HHwyBM0gszpCmsTTE2oRlAmcFj6uuyLV++8CuVCPMMiflWv2phFDNuKgAp7O6bf4=
Received: from CWLP265CA0393.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::9)
 by ZR0P278MB1555.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 18:49:24 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:400:1d6:cafe::96) by CWLP265CA0393.outlook.office365.com
 (2603:10a6:400:1d6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Tue,
 7 Apr 2026 18:48:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.1)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.1 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.1; helo=ZRAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver01.de.seppmail.cloud (2a01:4f8:a0:13df::219) by
 AM4PEPF00027A65.mail.protection.outlook.com (2603:10a6:20f:fff4:0:5:0:6) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 7 Apr 2026 18:49:23 +0000
Received: from hz-glue03.de.seppmail.cloud (unknown [10.11.0.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGW4JJKz4vjx;
	Tue,  7 Apr 2026 20:49:23 +0200 (CEST)
Received: from hz-glue03.de.seppmail.cloud (unknown [172.18.0.4])
	by hz-glue03.de.seppmail.cloud (Postfix) with ESMTP id 4fqwGW3vvrz23hg;
	Tue,  7 Apr 2026 20:49:23 +0200 (CEST)
X-SEPP-Suspect: 0010cf92ddc147dab155d3cfc9f2197e
Received: from hz-scan05.de.seppmail.cloud (unknown [10.11.0.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue01.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGW2r3kz20Tv;
	Tue,  7 Apr 2026 20:49:23 +0200 (CEST)
Received: from hz-scan05 (localhost [127.0.0.1])
	by hz-scan05.de.seppmail.cloud (Postfix) with SMTP id 4fqwGW2H5Pz8n8v;
	Tue, 07 Apr 2026 20:49:23 +0200 (CEST)
Received: from hz-m365gate03.de.seppmail.cloud (unknown [10.11.0.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan05.de.seppmail.cloud (Postfix) with ESMTPS;
	Tue, 07 Apr 2026 20:49:22 +0200 (CEST)
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp17010001.outbound.protection.outlook.com [40.93.85.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate03.de.seppmail.cloud (Postfix) with ESMTPS id 4fqwGT4YXBz1yxg;
	Tue,  7 Apr 2026 20:49:21 +0200 (CEST)
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 GV0P278MB0162.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.18; Tue, 7 Apr 2026 18:49:20 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 18:49:20 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [RFC PATCH 4/5] gpio: mmio: convert accessors to generic register descriptors
Date: Tue,  7 Apr 2026 20:48:04 +0200
Message-ID: <20260407184805.807328-5-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com>
References: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA3P292CA0072.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::17) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|GV0P278MB0162:EE_|AM4PEPF00027A65:EE_|ZR0P278MB1555:EE_
X-MS-Office365-Filtering-Correlation-Id: e50c837f-201f-4046-ce72-08de94d66307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 P4LzYqE2EweHNbX9/MJ2+GsiMjEd2Bd+fGgSOvPrCwRbta9nPi7CjU0PIadQqGNiMM38glsuHRyczG2wZITvzETkQ1QfGNryqS4oXHjMnTM0s+L0vxLN+/UrnFSPvSumjQfYYdQ1FB4E5Zl1U/AHEqqFUU8/dkxP9b4ii1G+AjC+QDJ7Oe3O6/jMDgm9XkuNCW+7QQMw9r9BSHsT5i/I0XWC1uKQ5dirJScoXB34gkWgQh1s45iR1uAg0IraUxTIA6Q++ahuuwu8jhNBhrrI/k24jUIU4jrjYWPlZQcLNJ2mSqOKi8R/c9wzI0bs4qLshO3Pp0BWYtixscBpWkHykYbC9+U0ih5Pg1lIhQzptDJBT4QJsFzfWXxGmAwDIK0GeybW6fKTYirw/qeY2ZN3EZ7sQmkIi4iNn1YYERJZFmhFZvcKkXnlgodj19tg0rP3MciGu6Zn/4XR9pBnbfEjfkzI84nhs1Hdh8Bzu6U04jUFR5E4ZZiiAHtZ/QFBhppR+PQ4e8U4gwWxFpN8XHhJ+IrCeXFZq7BgDdyxYUeDwYBjDFKnqYilbAEQLcOG6YmpZ3IbqfhDDzP2Cd/58dzf9pAYT9koA7ptqYxIfXuPngUswVNs6f3YlL3QFf0NkONvAXWgNtvkyJPgMD94dKP4zARs5qIIhQus5YgtK1kL4jnvydeLxjz1hRlYu/8ggK6e/0+nJx7RRYrSYALuFIElOttaD+V/XZoHRZgmTWgN25+iYkQhjwx5CoN/H7SNiX5vnCCeb4zeLoDbWK60oBVnIDbtCFgVuktDVXWI3fRUMJM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 T86sukeDEo3GdUc/8dk6MhHLTgiTFl2LgZnu7DklMZjsIIDe/xRdfUf0HcEdzuEqcXHEQNueRRF08yed+wpMtPfkr+cK9FOVtzL6XvaQBGt+bFI3GYDt2orQPGSo9Iskwt2KneKRFkrj2CirucUANh1mQe9YJplsDSoNCwocz8S9ixQnqA9+3fEd8ElEDus95xhzUrVfFeD3X7QcNcvVknGGI3Sqeu+ejMzHM1rQKpPeKz1Yd4GOXKBfy7sVC09WduRe5YH8MqC+3En6b7l6X7tYcFg7U2+6fdidv2FONrovaWpKwCukXAJHLx6Kdn5ShI7GWSBLLE7sYwhwXAKkEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0162
X-SEPP-CCCVersion: 2026-03-30T09:40:10+02:00 639c564b
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.1];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.1];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	34df44b7-48ee-4ef6-1c14-08de94d660ae
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|35042699022|36860700016|82310400026|14060799003|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k/q0jf/ExWqJrvyyHx2kvmnyEcsSC24alCnrUvqYx/iI8HFItbUjldGtu4KS?=
 =?us-ascii?Q?ojElsFG+sSx8nbi7858K9dxJ5VyIblJ6ibLIHl37PQ5GXv2sFCrs2eBTxzpZ?=
 =?us-ascii?Q?Dhw/6PU6B+xiwv8y1P+3lfexUaHIgSLkpR73K66226nTkAhLpf+bE6SNJL41?=
 =?us-ascii?Q?iI4gn4bJfdKfg+NLW/Uf9Vpee3frKdeIwE98j2RmaXkEmJ8WHJHBJeoUCrAh?=
 =?us-ascii?Q?FCojj8QPRASXPdaLI86Fql+Yxz0amsRgVb46yuwXbknpoT1klkio93RIix+J?=
 =?us-ascii?Q?Z0EhlIH9FOEDWQlxsXHDepVJW7P15I6XM8juKrMgoHG1genjxdgxEochvvUm?=
 =?us-ascii?Q?/IaYnLCKeDuhTe5/IFXp3YL3hIsyBZ5n5DAWYwL22xu/Od2QuRK/L7ACoA8O?=
 =?us-ascii?Q?zYJohlyDCiG+raYDNM7vskxKcR4/7dVvHgr3PjcnoRXQvQ7MPVVYdkjgU0Vm?=
 =?us-ascii?Q?xP7D02ObT2rz2kG6141vmyEajPKyTJZG/KhbYQFzDB2DK4rGMFMrE5gr3Lh0?=
 =?us-ascii?Q?3/7FuAOKciydgdD7IAYWGFNSP7pqSvjqQ0tZBP7LaT5NLP1Kp39qVY6c1cmZ?=
 =?us-ascii?Q?XM2TorTIqr8vp/XBYE5Ola5hArT+ZnnqOjr4jgT8ZvVBTIqTc5IPCVFdY6NR?=
 =?us-ascii?Q?EbnaPf8yKjRWmhZZjS9zUIDtJ4GNXBFjzw+2aaztzcYK1FNrkNLsxihFoZtd?=
 =?us-ascii?Q?9YG4jorcM89u+i8Nu4B0GQqvm0DMrJk/IAgagi0jBwtegJkpyVjBbkidJDWk?=
 =?us-ascii?Q?R5XEduQZc9JqrCjWULgeAZ2LxdiX1sYsSoXQMJ6ZOtnFuSxFQeV/lTE8XolJ?=
 =?us-ascii?Q?nvTz59mVDBh6U22OibI4UsTkMfJ+nibATioZpva1DO9gL+11in0Co5RYHA0G?=
 =?us-ascii?Q?/jXG5YVuQQ9riMMcuFLnfBRq8EAxUmdAgmWqYr7BRj05MU+afyEe/miHgetu?=
 =?us-ascii?Q?aU0X3UfheJ1TpM6WJIWel+Ynav6CN6IQkLzs+BSuiKBntxCIaOxTRLpGn8rR?=
 =?us-ascii?Q?ldXT+kkFljMLKOOGC4eiGOEWeyk0hkCo4LBAaZ0FsWDpeynlyjjYvJQ7qXru?=
 =?us-ascii?Q?rGeevol2V4ZUwIc2rG8SHteBYVwrPJ0ouRP4w3oS8o8BMhpZ7k5VMwiuu4fY?=
 =?us-ascii?Q?DItlo0efNHjdB/vKHj9o3hwdAA0tVn79F1qXc/CGPDDfAj9sTOti4M+5zNaq?=
 =?us-ascii?Q?QdQ+uGhDIGM8ZlVBT6wcbOe8h/HLvYpNRcOwhYlxNIxoj36NrlWcY2v6OAbs?=
 =?us-ascii?Q?JAOqHzpSb5ax6w6qImCks3V28L+TrzKhcET9sYk7pg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:a0:13df::219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17010001.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(35042699022)(36860700016)(82310400026)(14060799003)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1AkDXq5xkbEnrCKyB3aSQsL3RTk82jc0XkSsF30htHcwom7d4nBWzoWcmilnXrO0O4ozJ4Y6aWWlXs0w/aJWwT7ogdKUEDLC+PtCAztX9m+TBCyz0o8cPdZ/BPMgYCJbgoneDPZCcQEcEvSPG9yfUP7xIerOELjMSyaXsNwqIpnXBVoq9YYf7amFpvbdYsHwI4akbn7LEM3OQephlzAnrQykBWDsyD+OgYd72N+ohNh8nr2+c3EqlruElCeLUjNJ4b3t4LGMFbLgRddpfbNsJTnPGnsRVKjIvJwjyhBmkIAAlxGKOMuSgoW6HFDV+A+Hw/IbFj4IsTEJfcPpq5FKX4acsWpkArFyF2G4oZE3EBGJL3TVMd774lATFLu9A2f3BRiJIHI+RaTKHvzb+c4njh0409obRL7NwG6c+aJ7G45/WX/6N+mefcQ51w9Ie3JX
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 18:49:23.7902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e50c837f-201f-4046-ce72-08de94d66307
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:a0:13df::219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1555
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[duagon.com,reject];
	R_DKIM_ALLOW(-0.20)[duagon.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34841-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev-josejavier.rodriguez@duagon.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[duagon.com:+];
	RCVD_COUNT_TWELVE(0.00)[14];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,duagon.com:dkim,duagon.com:email,duagon.com:mid]
X-Rspamd-Queue-Id: 310493B3123
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert the gpio-mmio accessors to use struct gpio_chip_reg instead of
the previous MMIO-only register type.

This allows the same accessors to operate on both MMIO and PMIO
registers and aligns gpio-mmio with the updated gpio_generic_chip API.

Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
---
 drivers/gpio/gpio-mmio.c     | 174 ++++++++++++++++++++---------------
 include/linux/gpio/generic.h |  24 +++--
 2 files changed, 117 insertions(+), 81 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 37e1ed6569e6..247ce5b76441 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -62,66 +62,83 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 
 #include "gpiolib.h"
 
-static void gpio_mmio_write8(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write8(struct gpio_chip_reg *reg, unsigned long data)
 {
-	writeb(data, reg);
+	writeb(data, reg->mmio);
 }
 
-static unsigned long gpio_mmio_read8(void __iomem *reg)
+static unsigned long gpio_mmio_read8(struct gpio_chip_reg *reg)
 {
-	return readb(reg);
+	return readb(reg->mmio);
 }
 
-static void gpio_mmio_write16(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write16(struct gpio_chip_reg *reg, unsigned long data)
 {
-	writew(data, reg);
+	writew(data, reg->mmio);
 }
 
-static unsigned long gpio_mmio_read16(void __iomem *reg)
+static unsigned long gpio_mmio_read16(struct gpio_chip_reg *reg)
 {
-	return readw(reg);
+	return readw(reg->mmio);
 }
 
-static void gpio_mmio_write32(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write32(struct gpio_chip_reg *reg, unsigned long data)
 {
-	writel(data, reg);
+	writel(data, reg->mmio);
 }
 
-static unsigned long gpio_mmio_read32(void __iomem *reg)
+static unsigned long gpio_mmio_read32(struct gpio_chip_reg *reg)
 {
-	return readl(reg);
+	return readl(reg->mmio);
 }
 
 #if BITS_PER_LONG >= 64
-static void gpio_mmio_write64(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write64(struct gpio_chip_reg *reg, unsigned long data)
 {
-	writeq(data, reg);
+	writeq(data, reg->mmio);
 }
 
-static unsigned long gpio_mmio_read64(void __iomem *reg)
+static unsigned long gpio_mmio_read64(struct gpio_chip_reg *reg)
 {
-	return readq(reg);
+	return readq(reg->mmio);
 }
 #endif /* BITS_PER_LONG >= 64 */
 
-static void gpio_mmio_write16be(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write16be(struct gpio_chip_reg *reg, unsigned long data)
 {
-	iowrite16be(data, reg);
+	iowrite16be(data, reg->mmio);
 }
 
-static unsigned long gpio_mmio_read16be(void __iomem *reg)
+static unsigned long gpio_mmio_read16be(struct gpio_chip_reg *reg)
 {
-	return ioread16be(reg);
+	return ioread16be(reg->mmio);
 }
 
-static void gpio_mmio_write32be(void __iomem *reg, unsigned long data)
+static void gpio_mmio_write32be(struct gpio_chip_reg *reg, unsigned long data)
 {
-	iowrite32be(data, reg);
+	iowrite32be(data, reg->mmio);
 }
 
-static unsigned long gpio_mmio_read32be(void __iomem *reg)
+static unsigned long gpio_mmio_read32be(struct gpio_chip_reg *reg)
 {
-	return ioread32be(reg);
+	return ioread32be(reg->mmio);
+}
+
+static inline void gpio_chip_reg_init(struct gpio_chip_reg *reg, bool io_port,
+				 void __iomem *addr, unsigned long port)
+{
+	reg->mmio = NULL;
+	reg->port = 0;
+
+	if (io_port)
+		reg->port = port;
+	else
+		reg->mmio = addr;
+}
+
+static inline bool gpio_chip_reg_is_set(struct gpio_chip_reg *reg)
+{
+	return reg->mmio != NULL || reg->port != 0;
 }
 
 static unsigned long gpio_mmio_line2mask(struct gpio_chip *gc, unsigned int line)
@@ -140,9 +157,9 @@ static int gpio_mmio_get_set(struct gpio_chip *gc, unsigned int gpio)
 	bool dir = !!(chip->sdir & pinmask);
 
 	if (dir)
-		return !!(chip->read_reg(chip->reg_set) & pinmask);
+		return !!(chip->read_reg(&chip->reg_set) & pinmask);
 
-	return !!(chip->read_reg(chip->reg_dat) & pinmask);
+	return !!(chip->read_reg(&chip->reg_dat) & pinmask);
 }
 
 /*
@@ -162,9 +179,9 @@ static int gpio_mmio_get_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	get_mask = *mask & ~chip->sdir;
 
 	if (set_mask)
-		*bits |= chip->read_reg(chip->reg_set) & set_mask;
+		*bits |= chip->read_reg(&chip->reg_set) & set_mask;
 	if (get_mask)
-		*bits |= chip->read_reg(chip->reg_dat) & get_mask;
+		*bits |= chip->read_reg(&chip->reg_dat) & get_mask;
 
 	return 0;
 }
@@ -173,7 +190,7 @@ static int gpio_mmio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
-	return !!(chip->read_reg(chip->reg_dat) & gpio_mmio_line2mask(gc, gpio));
+	return !!(chip->read_reg(&chip->reg_dat) & gpio_mmio_line2mask(gc, gpio));
 }
 
 /*
@@ -186,7 +203,7 @@ static int gpio_mmio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
 
 	/* Make sure we first clear any bits that are zero when we read the register */
 	*bits &= ~*mask;
-	*bits |= chip->read_reg(chip->reg_dat) & *mask;
+	*bits |= chip->read_reg(&chip->reg_dat) & *mask;
 	return 0;
 }
 
@@ -209,7 +226,7 @@ static int gpio_mmio_get_multiple_be(struct gpio_chip *gc, unsigned long *mask,
 		readmask |= gpio_mmio_line2mask(gc, bit);
 
 	/* Read the register */
-	val = chip->read_reg(chip->reg_dat) & readmask;
+	val = chip->read_reg(&chip->reg_dat) & readmask;
 
 	/*
 	 * Mirror the result into the "bits" result, this will give line 0
@@ -238,7 +255,7 @@ static int gpio_mmio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	else
 		chip->sdata &= ~mask;
 
-	chip->write_reg(chip->reg_dat, chip->sdata);
+	chip->write_reg(&chip->reg_dat, chip->sdata);
 
 	return 0;
 }
@@ -250,9 +267,9 @@ static int gpio_mmio_set_with_clear(struct gpio_chip *gc, unsigned int gpio,
 	unsigned long mask = gpio_mmio_line2mask(gc, gpio);
 
 	if (val)
-		chip->write_reg(chip->reg_set, mask);
+		chip->write_reg(&chip->reg_set, mask);
 	else
-		chip->write_reg(chip->reg_clr, mask);
+		chip->write_reg(&chip->reg_clr, mask);
 
 	return 0;
 }
@@ -269,7 +286,7 @@ static int gpio_mmio_set_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	else
 		chip->sdata &= ~mask;
 
-	chip->write_reg(chip->reg_set, chip->sdata);
+	chip->write_reg(&chip->reg_set, chip->sdata);
 
 	return 0;
 }
@@ -297,7 +314,7 @@ static void gpio_mmio_multiple_get_masks(struct gpio_chip *gc,
 static void gpio_mmio_set_multiple_single_reg(struct gpio_chip *gc,
 					      unsigned long *mask,
 					      unsigned long *bits,
-					      void __iomem *reg)
+					      struct gpio_chip_reg *reg)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	unsigned long set_mask, clear_mask;
@@ -317,7 +334,7 @@ static int gpio_mmio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
-	gpio_mmio_set_multiple_single_reg(gc, mask, bits, chip->reg_dat);
+	gpio_mmio_set_multiple_single_reg(gc, mask, bits, &chip->reg_dat);
 
 	return 0;
 }
@@ -327,7 +344,7 @@ static int gpio_mmio_set_multiple_set(struct gpio_chip *gc, unsigned long *mask,
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 
-	gpio_mmio_set_multiple_single_reg(gc, mask, bits, chip->reg_set);
+	gpio_mmio_set_multiple_single_reg(gc, mask, bits, &chip->reg_set);
 
 	return 0;
 }
@@ -342,9 +359,9 @@ static int gpio_mmio_set_multiple_with_clear(struct gpio_chip *gc,
 	gpio_mmio_multiple_get_masks(gc, mask, bits, &set_mask, &clear_mask);
 
 	if (set_mask)
-		chip->write_reg(chip->reg_set, set_mask);
+		chip->write_reg(&chip->reg_set, set_mask);
 	if (clear_mask)
-		chip->write_reg(chip->reg_clr, clear_mask);
+		chip->write_reg(&chip->reg_clr, clear_mask);
 
 	return 0;
 }
@@ -394,10 +411,10 @@ static int gpio_mmio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 	scoped_guard(raw_spinlock_irqsave, &chip->lock) {
 		chip->sdir &= ~gpio_mmio_line2mask(gc, gpio);
 
-		if (chip->reg_dir_in)
-			chip->write_reg(chip->reg_dir_in, ~chip->sdir);
-		if (chip->reg_dir_out)
-			chip->write_reg(chip->reg_dir_out, chip->sdir);
+		if (gpio_chip_reg_is_set(&chip->reg_dir_in))
+			chip->write_reg(&chip->reg_dir_in, ~chip->sdir);
+		if (gpio_chip_reg_is_set(&chip->reg_dir_out))
+			chip->write_reg(&chip->reg_dir_out, chip->sdir);
 	}
 
 	return gpio_mmio_dir_return(gc, gpio, false);
@@ -414,14 +431,14 @@ static int gpio_mmio_get_dir(struct gpio_chip *gc, unsigned int gpio)
 		return GPIO_LINE_DIRECTION_IN;
 	}
 
-	if (chip->reg_dir_out) {
-		if (chip->read_reg(chip->reg_dir_out) & gpio_mmio_line2mask(gc, gpio))
+	if (gpio_chip_reg_is_set(&chip->reg_dir_out)) {
+		if (chip->read_reg(&chip->reg_dir_out) & gpio_mmio_line2mask(gc, gpio))
 			return GPIO_LINE_DIRECTION_OUT;
 		return GPIO_LINE_DIRECTION_IN;
 	}
 
-	if (chip->reg_dir_in)
-		if (!(chip->read_reg(chip->reg_dir_in) & gpio_mmio_line2mask(gc, gpio)))
+	if (gpio_chip_reg_is_set(&chip->reg_dir_in))
+		if (!(chip->read_reg(&chip->reg_dir_in) & gpio_mmio_line2mask(gc, gpio)))
 			return GPIO_LINE_DIRECTION_OUT;
 
 	return GPIO_LINE_DIRECTION_IN;
@@ -435,10 +452,10 @@ static void gpio_mmio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	chip->sdir |= gpio_mmio_line2mask(gc, gpio);
 
-	if (chip->reg_dir_in)
-		chip->write_reg(chip->reg_dir_in, ~chip->sdir);
-	if (chip->reg_dir_out)
-		chip->write_reg(chip->reg_dir_out, chip->sdir);
+	if (gpio_chip_reg_is_set(&chip->reg_dir_in))
+		chip->write_reg(&chip->reg_dir_in, ~chip->sdir);
+	if (gpio_chip_reg_is_set(&chip->reg_dir_out))
+		chip->write_reg(&chip->reg_dir_out, chip->sdir);
 }
 
 static int gpio_mmio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
@@ -504,6 +521,20 @@ static int gpio_mmio_setup_accessors(struct device *dev,
 	return 0;
 }
 
+/*
+ * Initialize registers based on whether the config is io_port or not.
+ */
+static void gpio_mmio_setup_regs(struct gpio_generic_chip *chip,
+			      const struct gpio_generic_chip_config *cfg)
+{
+	gpio_chip_reg_init(&chip->reg_dat, chip->io_port, cfg->dat, cfg->dat_port);
+	gpio_chip_reg_init(&chip->reg_dat, chip->io_port, cfg->dat, cfg->dat_port);
+	gpio_chip_reg_init(&chip->reg_set, chip->io_port, cfg->set, cfg->set_port);
+	gpio_chip_reg_init(&chip->reg_clr, chip->io_port, cfg->clr, cfg->clr_port);
+	gpio_chip_reg_init(&chip->reg_dir_in, chip->io_port, cfg->dirin, cfg->dirin_port);
+	gpio_chip_reg_init(&chip->reg_dir_out, chip->io_port, cfg->dirout, cfg->dirout_port);
+}
+
 /*
  * Create the device and allocate the resources.  For setting GPIO's there are
  * three supported configurations:
@@ -531,17 +562,15 @@ static int gpio_mmio_setup_io(struct gpio_generic_chip *chip,
 {
 	struct gpio_chip *gc = &chip->gc;
 
-	chip->reg_dat = cfg->dat;
-	if (!chip->reg_dat)
+	if (!gpio_chip_reg_is_set(&chip->reg_dat))
 		return -EINVAL;
 
-	if (cfg->set && cfg->clr) {
-		chip->reg_set = cfg->set;
-		chip->reg_clr = cfg->clr;
+	if (gpio_chip_reg_is_set(&chip->reg_set) &&
+	    gpio_chip_reg_is_set(&chip->reg_clr)) {
 		gc->set = gpio_mmio_set_with_clear;
 		gc->set_multiple = gpio_mmio_set_multiple_with_clear;
-	} else if (cfg->set && !cfg->clr) {
-		chip->reg_set = cfg->set;
+	} else if (gpio_chip_reg_is_set(&chip->reg_set) &&
+		   !gpio_chip_reg_is_set(&chip->reg_clr)) {
 		gc->set = gpio_mmio_set_set;
 		gc->set_multiple = gpio_mmio_set_multiple_set;
 	} else if (cfg->flags & GPIO_GENERIC_NO_OUTPUT) {
@@ -579,10 +608,8 @@ static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
 				     const struct gpio_generic_chip_config *cfg)
 {
 	struct gpio_chip *gc = &chip->gc;
-
-	if (cfg->dirout || cfg->dirin) {
-		chip->reg_dir_out = cfg->dirout;
-		chip->reg_dir_in = cfg->dirin;
+	if (gpio_chip_reg_is_set(&chip->reg_dir_out) ||
+	gpio_chip_reg_is_set(&chip->reg_dir_in)) {
 		if (cfg->flags & GPIO_GENERIC_NO_SET_ON_INPUT)
 			gc->direction_output = gpio_mmio_dir_out_dir_first;
 		else
@@ -651,6 +678,8 @@ int gpio_generic_chip_init(struct gpio_generic_chip *chip,
 	if (ret)
 		gc->ngpio = chip->bits;
 
+	gpio_mmio_setup_regs(chip, cfg);
+
 	ret = gpio_mmio_setup_io(chip, cfg);
 	if (ret)
 		return ret;
@@ -670,10 +699,10 @@ int gpio_generic_chip_init(struct gpio_generic_chip *chip,
 		gc->free = gpiochip_generic_free;
 	}
 
-	chip->sdata = chip->read_reg(chip->reg_dat);
+	chip->sdata = chip->read_reg(&chip->reg_dat);
 	if (gc->set == gpio_mmio_set_set &&
 			!(flags & GPIO_GENERIC_UNREADABLE_REG_SET))
-		chip->sdata = chip->read_reg(chip->reg_set);
+		chip->sdata = chip->read_reg(&chip->reg_set);
 
 	if (flags & GPIO_GENERIC_UNREADABLE_REG_DIR)
 		chip->dir_unreadable = true;
@@ -681,20 +710,21 @@ int gpio_generic_chip_init(struct gpio_generic_chip *chip,
 	/*
 	 * Inspect hardware to find initial direction setting.
 	 */
-	if ((chip->reg_dir_out || chip->reg_dir_in) &&
+	if ((gpio_chip_reg_is_set(&chip->reg_dir_out) || gpio_chip_reg_is_set(&chip->reg_dir_in)) &&
 	    !(flags & GPIO_GENERIC_UNREADABLE_REG_DIR)) {
-		if (chip->reg_dir_out)
-			chip->sdir = chip->read_reg(chip->reg_dir_out);
-		else if (chip->reg_dir_in)
-			chip->sdir = ~chip->read_reg(chip->reg_dir_in);
+		if (gpio_chip_reg_is_set(&chip->reg_dir_out))
+			chip->sdir = chip->read_reg(&chip->reg_dir_out);
+		else if (gpio_chip_reg_is_set(&chip->reg_dir_in))
+			chip->sdir = ~chip->read_reg(&chip->reg_dir_in);
 		/*
 		 * If we have two direction registers, synchronise
 		 * input setting to output setting, the library
 		 * can not handle a line being input and output at
 		 * the same time.
 		 */
-		if (chip->reg_dir_out && chip->reg_dir_in)
-			chip->write_reg(chip->reg_dir_in, ~chip->sdir);
+		if (gpio_chip_reg_is_set(&chip->reg_dir_out) &&
+		    gpio_chip_reg_is_set(&chip->reg_dir_in))
+			chip->write_reg(&chip->reg_dir_in, ~chip->sdir);
 	}
 
 	return ret;
diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index eec63f8fe144..d0de8f77d0bc 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -108,15 +108,15 @@ struct gpio_chip_reg {
  */
 struct gpio_generic_chip {
 	struct gpio_chip gc;
-	unsigned long (*read_reg)(void __iomem *reg);
-	void (*write_reg)(void __iomem *reg, unsigned long data);
+	unsigned long (*read_reg)(struct gpio_chip_reg *reg);
+	void (*write_reg)(struct gpio_chip_reg *reg, unsigned long data);
 	bool be_bits;
 	bool io_port;
-	void __iomem *reg_dat;
-	void __iomem *reg_set;
-	void __iomem *reg_clr;
-	void __iomem *reg_dir_out;
-	void __iomem *reg_dir_in;
+	struct gpio_chip_reg reg_dat;
+	struct gpio_chip_reg reg_set;
+	struct gpio_chip_reg reg_clr;
+	struct gpio_chip_reg reg_dir_out;
+	struct gpio_chip_reg reg_dir_in;
 	bool dir_unreadable;
 	bool pinctrl;
 	int bits;
@@ -168,10 +168,13 @@ gpio_generic_chip_set(struct gpio_generic_chip *chip, unsigned int offset,
 static inline unsigned long
 gpio_generic_read_reg(struct gpio_generic_chip *chip, void __iomem *reg)
 {
+	struct gpio_chip_reg rg;
+
 	if (WARN_ON(!chip->read_reg))
 		return 0;
 
-	return chip->read_reg(reg);
+	rg.mmio = reg;
+	return chip->read_reg(&rg);
 }
 
 /**
@@ -183,10 +186,13 @@ gpio_generic_read_reg(struct gpio_generic_chip *chip, void __iomem *reg)
 static inline void gpio_generic_write_reg(struct gpio_generic_chip *chip,
 					  void __iomem *reg, unsigned long val)
 {
+	struct gpio_chip_reg rg;
+
 	if (WARN_ON(!chip->write_reg))
 		return;
 
-	chip->write_reg(reg, val);
+	rg.mmio = reg;
+	chip->write_reg(&rg, val);
 }
 
 #define gpio_generic_chip_lock(gen_gc) \
-- 
2.53.0

