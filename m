Return-Path: <linux-gpio+bounces-37233-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2P2LBw9eDmo4+AUAu9opvQ
	(envelope-from <linux-gpio+bounces-37233-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 03:21:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FDF59D9F6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 03:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 404EF30485DB
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 01:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A87523EA84;
	Thu, 21 May 2026 01:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HxATA96A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010041.outbound.protection.outlook.com [40.93.198.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091C654763;
	Thu, 21 May 2026 01:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779326472; cv=fail; b=XJ6RL/HLhpE8rD5402LNYYP2QcC5k+1RWR8LfKV1cvpT7P/whrTYYURDOtAoI5RHVu7sTxHifpbITUFojrW1vhHEWy7/89Q+KjpXdKVThIHtTr6DNIvYIzcbvDgvmq3MhQ9HzMK4tjxR749wsWbY9cW0BqyoSA6NXJ3xRYbIN0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779326472; c=relaxed/simple;
	bh=DjOV26PE8kB7h/ct7vJCnKqpfgZrUy1WjS+BkfkTVZM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W+CCrudDj68bqq4dnRyX6trTFyBDtR3TwRV7Z7gCta6m94QXQEDdRQrgiBFbhIY/kOIQWXYkfRzLvcwbMYYu2fEeLOj3n6q59ujjoE0oDHFPZH68yfJBuLodQGZ52PGlP/HMcOaap+YtJKmqYI97UENfGFLj2+jOo4jJd+EkSaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HxATA96A; arc=fail smtp.client-ip=40.93.198.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMu5W7LEywVFnwVMoWEf4bQHLCQlJT1c0HlZdM8h3kzhBK+9ArAb3aAD2m1zRDcZXmSqCMClNfbTAuxOdq5MiLLoTxVfOcGkYpy305Vzm0ZiYt1yMftvL8JGF2sBkULMYqc2tDlEnpFlJ/jj2VwMVIBbxulAqhEBkPIFX+jAore7ox4PVB25mlsJfnuBuvupdHtLYoeCOcjPyrufAS7lKJ+dUN1ApLKIVkx3yG521yn9RoYnYRIFrIJCYaluC7i/3Tt8fQY+s9na/aCFa77eLGpIMIPn3HdZh9HmRdYl/QjtJObSivp6PuxTgfzJqY3hN2t/ueA7jX1AGoNbtDQpnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjL4Om5Sp27DcIgZTr+6XT3KX7bkR0irz0K3nSWs42o=;
 b=HLV91QOqJoz9+CgYeE77GsVjtIm3yUiRQwwN+d8gmhb+Dk7vLuaES/mO3M64tqtl7jbVx/Dtdbyeemk1CbTKkHHiFsvXJ950m4sAavHACMX6QK7hEDGxRsDi5fVgWEaIhKjLYRm/GT4+qjgGkG3uIjnsmuvH97ZPM+grocsO2XXrBTIj03ZS7l3PwLjUZ3Oywa/QyBEe3dPHR2xFAIheOHxNXmT49rpc0qg/FCP80S8Lj3lq5m1ajjwNslpCgdYVj+LM+sPzi87ti9ErhxGWj+rw+ZrVzldnswDpxm7VSXbuL+JjGp39Qfhg0MLw8EJQf5v4cvbtQB+D3LsHZ6tVBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjL4Om5Sp27DcIgZTr+6XT3KX7bkR0irz0K3nSWs42o=;
 b=HxATA96Ah+9EBJHpZFvjmxqvJYT0f5k9AwnJDUUbOj7rFiMP6/FMapQ5Vbjm380LDoUAADBgLDWkHIRrEgHYC01XWsSsZ3n8VCO9zGGBX3zpjnXz3kJU+63u57id4kI8lFVKCLXZGlpBWa+uuq3pNWyDevJ//IWfiLWSlDAtDURsniOF1O/iw9FZcNSqtoX82ElsaW2MmAz/l1y0xGADP1AuWloWHJjAjQPD7ajjsXK40xyeL/4K2u/eu6YO2nkld8DQV43bJSM8bX9KtPWrsoJct+xKVimJxJiAT2OC6DPv/JJc/6gbquewVUQXBFw8XmMse12E7ypbvoDBk/vpNg==
Received: from SJ0PR03CA0148.namprd03.prod.outlook.com (2603:10b6:a03:33c::33)
 by MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Thu, 21 May
 2026 01:21:06 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::75) by SJ0PR03CA0148.outlook.office365.com
 (2603:10b6:a03:33c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Thu, 21
 May 2026 01:21:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Thu, 21 May 2026 01:21:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 20 May
 2026 18:20:48 -0700
Received: from build-suneelg-jammy-20260204.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 20 May 2026 18:20:46 -0700
From: Suneel Garapati <suneelg@nvidia.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <jonathanh@nvidia.com>,
	<thierry.reding@kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Suneel Garapati <suneelg@nvidia.com>
Subject: [PATCH] gpio: tegra186: Enable GTE for Tegra264
Date: Thu, 21 May 2026 01:20:30 +0000
Message-ID: <20260521012031.2003914-1-suneelg@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: e6ff0d0e-cfff-4b87-5c9c-08deb6d73ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|11063799006|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3hQXEbzGgbvPOGrKWS4doUBJOevTS0YbbLy9hL0rRxWLBVJzv9BHVgNGwaIDc79Mv/yLvpHY+VUZJMUI2BerFIF1itoKkTwQRXRpkhi51UltwMebtxJiNDfGJUb/9KMy+mFWBVW7gV92FhXd9EO71YvgJHv4FJ583Jrmjo79onxoF7hW+EZp0hz57jlT6MYaz2AXV5RJCy8X2K3vPpTlc/9pLrsIwDsIWDNNVdrimEUi48mgd6hSdRV0cEWce/VJg3630vFYziFFOU34fHhAvRTLO0CLJK1PZx+v7NxZWD7Fm3djQQOkSekXoZ4NjCS5b+Jcr2jvPIWSs1mHKpAy4xcuV5EnPFzHPsJoZaeYmErnkNeet9SEov3NwE92zRFeIA1qNFlLprC5Dae2hiRLDJO+0j5vQuSdxKB/7TdDu5ODsmjrwx496BJ2GfacXnhM1BnFyKDKavZoDhzmm4beSGoi9a++QRf/OywpiRplcRJzxDFyQZRSqkaKwymsJ5g9MdAsNYarm8u1WYFAYsXzBpHu2QypJddz/m9qcC1fcXb7y1YHypRYUwMfUPzbJUOkmLv/ACUcu1v/jfLkxZiV3rf1V4hAOxrdosLznuOtye+SWN6/tsnl+7AtGJwY8p3Zdw7ml7iQ7g0iXwPUjxL68+3kvWjNRRtEgeBlFpCO7nXvC/3yQrFGiZGXV0MqFtFZHZCe+/oGFPXXomBa2eRobu1a3HgqnJ9vvmhjIZWi4Po=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(11063799006)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9qw67h9fBiXWV3DpdIWdDFIyUhzHRdEYQhNvGIbiyGtd+N1IGt3nBULhxPZrr1VbprICiXwBGY0w4DrB3/xDI5Rwgj7CUR2E4uE4+V6b3+GL/M7WrhektvTggHTh0LOc+hGG2xfyhzrD4iaEVRcmO+N1UtXdvmmJfUWRM0qUqECdfXg19wvy3w2inft+yWaTdM27mfIDLNXdkR4WvnbpIm3ATAvfb9RMf2uYw9odBKuD/6i1KCIlQUWM+oyHryIydnpAUnkFSeoX1y5Yehn0x87tdVkS09iUlka1tb2Aj2xNb82WTEjqNbSY8TFzbSfr4deZSGOZyswOhEazUWwJXnFLgwmOGWqc8qVLSW/kiIb2FK7HtuyVtgkIB4mHwS+5VI2+pVbh+L1Jt6D+1iETaU5jTgKWZNaa7OUJVFYfrgRQnAcAB/HRsnYF37Duqmz0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 01:21:05.3444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ff0d0e-cfff-4b87-5c9c-08deb6d73ada
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37233-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suneelg@nvidia.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 88FDF59D9F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Set has_gte flag to enable GTE for Tegra264 AON pins.

Signed-off-by: Suneel Garapati <suneelg@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index f56617c298c0..d9a2dedf50ea 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -1395,6 +1395,7 @@ static const struct tegra_gpio_soc tegra264_aon_soc = {
 	.name = "tegra264-gpio-aon",
 	.instance = 1,
 	.num_irqs_per_bank = 8,
+	.has_gte = true,
 	.has_vm_support = true,
 };
 
-- 
2.34.1


