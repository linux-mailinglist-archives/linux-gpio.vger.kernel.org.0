Return-Path: <linux-gpio+bounces-35216-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIBEFo124mnh6AAAu9opvQ
	(envelope-from <linux-gpio+bounces-35216-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 20:06:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C88FD41DCE4
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 20:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 491AA302E32A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 18:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFC0314A83;
	Fri, 17 Apr 2026 18:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XGt88K/e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011041.outbound.protection.outlook.com [52.101.52.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1EA359A9E;
	Fri, 17 Apr 2026 18:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776448808; cv=fail; b=N3NPHCkfSeBwQgeOGeQMulzYBs9XfwRtiOXq894yGtBxkhGb49jw/UP2KqAoB+WKPk7ANXe1rjNn8ewYAoKiN5zxFXtdT1vzV5r+EzpYNQU8kwloeimEBN5AidMxrvan4vLF2bbFzY/lnikUvzvSr4pi1NGN+DU1uZ4C5TkSB0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776448808; c=relaxed/simple;
	bh=RwI1lmS/9z72RRHRj7/hvWSdIMbT/tB0cQ+52tT1ATc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OJQBb0xjLmd7/WjDpr6J0vTuZo4xRUiJBAtMl/LLUQ0BhjATMVknCxOb3vRvagPek0KpFD0614r5ybDzP8AFdbpD923/zemMgiA4o72xCwxap1wofXyByYkCfUJT2BHxnvO9+59zOIm6puKjS2aUloZDJoKPIN13Ai0k/srnrCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XGt88K/e; arc=fail smtp.client-ip=52.101.52.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLU6AKLAexVtYwDV+mNVT38yQtqXhh6t5cmYkNzN4z3LnMJvEQRUPlU4H68TohLad5TDyxQIhefOl9ufiuFMgIdjdr0RqGwujOPTuSv2CMOdzQzDpHy+VF8wq8xZBD3ZML39mhkF4PBwZdf4b1UAk92jwunRnOTF3zRGMzMY0Gq5UMzqbt6HnBkjWnW4O+cVmZKqoDPCB1YIByrcMXdoW0DWduuPU6ChbsHUFqOFrvWfu/l9itg8QltUyaUIEU6G+EXczfhMzBvIb/VG8tjs61q3ZE2NB8Oj7Ynd0qe+BK7a84wzmE8ULoQNB2BjI9r0cq/bIYFCc6SQ5UCooFmG0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKnuqK5gxXv4kVl8+1xi85Th1iksv24OjLJBXHj7S2s=;
 b=oGVLzT5SjhrupIpRtHxvrdGnNyoartiw/D1OI95n6W8ketEjFYhaV6cyoreYpxa6TTSLN0rsSbmo0jUWjzqvLj4LCNM9vLashHJ8ZgDmUxRhDJWbYbiOqRLLC8PyCAzDatXuVHwGEuihEAhv8kpHFpYRjPwh0rk60je0Ttk6NxeYgsU3wcRLf7O+G1fi4JKyw5WVtzMJyumCbNsWUQhgFHJkPU0pF2rV67K68kIIwCK0+j5AhS3gwYvwbmrQN8tLSSfq7vUMA6ib4Eyms8vgOYzhv7rh2CiFUyWBA0QK071EM0wWB9z66fVIVWxg33Moh+IbAMcD0Pie2a0BSKhj4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKnuqK5gxXv4kVl8+1xi85Th1iksv24OjLJBXHj7S2s=;
 b=XGt88K/ek9/ZeXgLY78bpyqNSap51Udeu7gwoDL5moYUW7hP609t0JFRYLcmhVbw5590KmtAA1DuXn9ApdIeEx6UENuaQCoxwYcm3Sld/8IxyKcF7VixIKDkeCWGUvAWP3DVVe86mJUfUs2vBzUfhxDremirm5p4xw71iOWFyweQ/XP1iAraDM8gAaqHBMl1SFfNlpAnOjAE8IA+xDdtRtxhsxd9nyAAG8M/oY44HqBE4GA8RBQHLDHgFXt8XE/J05JnoSXdOKnXM84T846bplPXx6yWhGTVfmSwZ/lgf7KXuPWQGeTGJ/hH+bglc1HxoGWZgMXOsd1gXAGPB4eAFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by MN0PR12MB5737.namprd12.prod.outlook.com (2603:10b6:208:370::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Fri, 17 Apr
 2026 18:00:02 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 18:00:02 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Yury Norov <yury.norov@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH v2 2/2] gpio: xilinx: drop bitmap_complement() where feasible
Date: Fri, 17 Apr 2026 13:59:54 -0400
Message-ID: <20260417175955.375275-3-ynorov@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417175955.375275-1-ynorov@nvidia.com>
References: <20260417175955.375275-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:408:ee::8) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|MN0PR12MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: fc4d9610-e520-4cbb-149d-08de9cab2622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OfWYIHm9AvgkKgxtJ/4bHLZc3gxARy1WvrDZIoKxDUjJGEG7ktEzRqFgfFv60D7V9eLZTrGWySpzztVx7/6rEHNYlo3mGgy4r/FVZyMChKkqTRb8E64FxNtjtfxEsXQ+smRQziueO6kfnXsiDK7WZj+3quyglik52xCbU8jfU8JlWVczgLr6kREzT3cbMoDBIqFiaSYwTx8PV4tII8ut04tmVqg/nE/mV88usqPjl4yxTyqJoyMwVWrcPBekDMrQOdtNoFoZu9NIuhLtqVnOQYxevIb9jh7bcqT3R8Wvpy5IJbe9yoktO2+A+/J6jOopvJaifNsxu0h1j91/6BpZXwz9679UeQcAWwm9zlTk2UVlyBMF2jQSAcFTNRv7tA6GE0D7xtt5s4ZRJ6gRIf8SyVQ37f93DXPH1i6USkffQlcr5Z5+ysRdHRkhgBL/kCzvn2EEO198u89OTBblNTBVPCfdkf6GBNJuH3xUfAJep1wtalg5RyZYQigeaKbup4GZMu5glE5AQ8pwR3CBdNX1DZVToM0K5GejHxMX0zTXl24DPtNfSPkhl6rYsIMz5siHMB76KbsPbl5ZPcBIhhgssN1zrJJf2GDYz/UiTG2BUtCiTq8ceFaP+DJ64TC40n+sgPre86UJnZU8clitf9su9vLA+ipB9+lswBK+fonM3t8Z0o2h7aNt0cUEMcnJG9XmkpZ8EgiRROC3mDJsBdVkGAXNxKWX0BSIfIzEai0VmxPb2HPa3J5iOblQXczoHp36PDvQkRMf8Uh/g6QuqIq1tw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x5KmoIJ1xgUaz36zafzxcO14ofBD4vS69lcS6Z02JcghrPw9ZcsLHH2XUBGA?=
 =?us-ascii?Q?bWXxY7ntqifnN1X6L4Kv4S5cJ3BCoNMbYOHBivkMyitjYC8wUdVrsGmmUpGT?=
 =?us-ascii?Q?AqIEzEJCC7iK79UnSJO6OMQB8BSkaqVK5FeAYE+mLEFrCk6F7BibMd0lE3pt?=
 =?us-ascii?Q?B31PtQVCd3TH2UqfwQH6UZzvIBwQe2sNkDLu6VdDLKbNPyjfskcn1gPjkj+H?=
 =?us-ascii?Q?Jpu403WYmt24UVRY6XGMfYpAMjepuNAQkMJr0D3tKyMbL0J5YCklHLGC3ssa?=
 =?us-ascii?Q?x/MtAPT3Nkj46QnmxrKH/7KK9U32d7VjW0T3wAu1Aaf6PedxV6iZXstlo03K?=
 =?us-ascii?Q?BtSPZVtlFQ7dflWcxmtfwV2JAi/HgC8TVSARrmdyXGfilCdbcXd9xK3Cg20G?=
 =?us-ascii?Q?7OISdm2zokcjnFUv+BT8nxpy32LQB0LlfPOpYxsOx3Y2q5mnTrV9Bnb8JkAy?=
 =?us-ascii?Q?UEiGf7ojuj39rB3I2mLCa5tPKi1KJuB3G2tkbCaUs9bsj+T8cQQWZWrbp2Gs?=
 =?us-ascii?Q?GJecHhdiwg6/nkfwf93Qtu33t6TVCa2r4rS0zZPAAIRjleO4gPMJFQEmGSFo?=
 =?us-ascii?Q?sBxDps9wC1CAa5rzIIb2ayjx6ZoeokXlcQfT61HHl/cf16lJVmnyoX2rZYjH?=
 =?us-ascii?Q?xb0i3qwQgvDdHB95v3Y/FQnwnFD+wXwqJ53Y36BCJueEbClcsAs9IqwbRv/S?=
 =?us-ascii?Q?0Ivpltu9hlaaSnSp38V7uupEXPkss8OGMTx5VfH577+493F2PZsPvYTke7GC?=
 =?us-ascii?Q?cgOi7u+UmMpDWMnpDuVrSJsNSgv0EjckiDEVrMYlYAlhPkyWVy5A018Pmbut?=
 =?us-ascii?Q?rSCX4ranuxyavGR5oeuzu55Jig1OV4HZ/ByMJ+38FXdn3AZAxjolh1ac+8W9?=
 =?us-ascii?Q?C2VjrCciJcVBd2kzu8HDO1bI5l4nnQ8ROyMdKtVuZzKgGMAAdBoFvs9negVQ?=
 =?us-ascii?Q?xUHI7st6LAZnbIhuxMGUVHhFXWi+87dzb57L+nIzKDXNNxf7ROOR9nwRUThP?=
 =?us-ascii?Q?EcbIO2ANgXRT8MWtQuLoHqlW5vonmO0gb9dlxrLy5FDj/GMh/0JUKebjclMW?=
 =?us-ascii?Q?AoeSYaUu41PzLz4Cfq+pbQk//x/hU4JVuLS4aaFdCsXqT6ZO4Yi1+tjDc5KK?=
 =?us-ascii?Q?+okvOFSd83CwiRlRdXehAB9DoZMWfqg+T639RcNlR+CFZ4M4rA3QRclAS9of?=
 =?us-ascii?Q?cBuhHwdj+N1i3YLGuKXV3msQrq7o92avBfGHPdhf1dhQpISJJgxg4FQHdvvu?=
 =?us-ascii?Q?krCPznViMejNZCM30YYUfsua9U1yQFskoW7smma0CIu1aYrJjpe7eDSuX2Oj?=
 =?us-ascii?Q?waqC7iinm9CYwZD7Lq2pUzteuJ+U+h2MGy+CxhCCPI3GXSp7aWFuV23uLEPw?=
 =?us-ascii?Q?Ts06EQhiuxM3nMrbjPJsan96vGW1u8rmFT5lwxzrmLBlQfys3Y+QBTXGj4gH?=
 =?us-ascii?Q?5LxKM3UINzIFS8HT4HIn67PYpBrGZgD4iwLVz5x2A7TF3TeNV3OYCpGxB9sD?=
 =?us-ascii?Q?qOFZdhz699KYyy8IyYyZwG6dcnqIqesHrtMMTboFNX/NvJHJ3ybweXzEvuTQ?=
 =?us-ascii?Q?nkvxZWd8GM/LzLi4sKhQNaebsjJTcWystMTtrL/vQbzrvksjrCH0EWmpCH17?=
 =?us-ascii?Q?fBwpjSgzdswV+X0ERBSH8EiuzW6f0ZZXzy0mRluX+LRYBuf7IVCuIiKWz1r+?=
 =?us-ascii?Q?fl7cQ/umVisZx2oCM53bOcGSkx8Kh0BsF23kpcJBki698qEkxa+KjT/UKMsg?=
 =?us-ascii?Q?2yUHyK3QoiwgcbRIeynwMyr2GR2PzlJTE69XjNolvIDfV7rsWZ47?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4d9610-e520-4cbb-149d-08de9cab2622
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 18:00:02.7501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyrlVo8/6vBbbOfMJ4cUJU24AKsTbVY3RAvsa6AGshB6HvBNtGql3h9ZRZaMxtYvlPtBUm9FOsblfodqNOvs/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5737
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,amd.com,gmail.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-35216-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,intel.com:email,Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C88FD41DCE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The drivers reproduces the following pattern:

	bitmap_complement(tmp, data1, nbits);
	bitmap_and(dst, data2, tmp, nbits);

This can be done in a single pass:

	bitmap_andnot(dst, data2, data1, nbits);

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/gpio/gpio-xilinx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index be4b4d730547..532205175827 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -495,13 +495,11 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 
 	xgpio_read_ch_all(chip, XGPIO_DATA_OFFSET, hw);
 
-	bitmap_complement(rising, chip->last_irq_read, 64);
-	bitmap_and(rising, rising, hw, 64);
+	bitmap_andnot(rising, hw, chip->last_irq_read, 64);
 	bitmap_and(rising, rising, chip->enable, 64);
 	bitmap_and(rising, rising, chip->rising_edge, 64);
 
-	bitmap_complement(falling, hw, 64);
-	bitmap_and(falling, falling, chip->last_irq_read, 64);
+	bitmap_andnot(falling, chip->last_irq_read, hw, 64);
 	bitmap_and(falling, falling, chip->enable, 64);
 	bitmap_and(falling, falling, chip->falling_edge, 64);
 
-- 
2.51.0


