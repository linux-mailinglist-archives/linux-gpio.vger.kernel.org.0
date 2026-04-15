Return-Path: <linux-gpio+bounces-35161-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOJBKwZv32nqSwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35161-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 12:57:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DFE403763
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 12:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1420D306A830
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 10:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F09348896;
	Wed, 15 Apr 2026 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ruT+Qz0x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010052.outbound.protection.outlook.com [52.101.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D13113AF2;
	Wed, 15 Apr 2026 10:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776250608; cv=fail; b=C3jcHDP4k5nE+qMrYJjGOeB37du380ixyFYWDKN1GwFsi75ZcaRH4jnZeGGQGpQ+PAT+eMPn2DVv6uhw9H6dIVlBFP7BcuDslGw4Aw87XuwRVlnzs2tYC+nxT0EabDDGQrpWKmpeU1XZaiVjnpmkydolOLUgQyUAS+mpeSJ1+ZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776250608; c=relaxed/simple;
	bh=R4x93VGa6QJy5pu1ZmmLCpkGPTpod/z0ArxDcZWSn6A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DOp/bnqqMI1113yTNtW/Q+NCXVliHylWYddLCRs2gQ5NFXRFoUwWpSonPBPjGAbrwocBsCFLLEEvlKQ0IMoX4C+WAK6YN3QBq8TPEuPrTr3kgZ7qSAiBpISFvmJBt5t9VrY3NxV85iLWqmcgMW2MYapmfl6c/AvkabSzgpv4sCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ruT+Qz0x; arc=fail smtp.client-ip=52.101.201.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Arp/3RihrnlOtCSrpPPF2SHWsIaDL+95ZG/T3AZTPMJ/GDVSVAGQV1bHhjygXwW72Ftkl2aH7UwLK7W1HmoECbLPPJVHJC53XdTbMq2Rwgg6W8hbNY49nzrNHnvH0Yd1Arew/xaY6tzVxU9LN2xXncPCil6nUIc9bIcn7y5mQYjhKT+0Sd/EVRPaMYSkt0SB8nQziLjQfTjK9ZFGV+sCa20olPOnsT3IxSPJ0WD+5sj037kAAiJ73AEXS5lO7fD0pWcbIGTE8SdpdAgyNOyzPKPjrv7Q1ywisYi4XEzX5ZXb0FHZSOvVytV3OMdn6asuXMh172jQfwbpCMovBGI8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhG2d1+Z5t+lzcdXRjdpvqEDmDRB+hY9yOVosfuDaOM=;
 b=QG0LotINUhRxx7JQSRTkT2Inyuri+SPjrAQ6skrAVmxtAwwnchur/Bz9hRuWzOMpXtFfKdX0lWSilKhDm1BzfgWM5tQtFJJnlZ358U0hgHBdvs53f28Rx9eMJ0qeqRbWH4wjWqy+XC0sY306n4EDD8eXDWCBtIKCKTdE1XDo9ANkRCIos2gLk3YiQCIjBm/PHvnaBf/90tnu7aVF2XbrDpa8vmI2H2Jr3Myo/tXDdntQiG9DDB+2X9B2TM2aq+kskGeI86PyunB//viUAHzHZk/PtQkQSCdgX2IkyhiG9kE5J3+DFX47/Mch6bfzTUuyUABrnswYbut9zvtyAAv/JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhG2d1+Z5t+lzcdXRjdpvqEDmDRB+hY9yOVosfuDaOM=;
 b=ruT+Qz0xg1nZkBbQWjLkzNpVf1AHJfJcMlMVCit9Lbx/F1FIbreepa7TtN17dKWw0RnnDeztkdPBI2ZkCyrfjLInv2Hxudx84aJFtBxxxnaWbhFDOx4kk/Y4l8NgiObK7b8jLdvaGdOtFzLLlagVk2VDqIWDdiL+gO6Y94c5U78=
Received: from MN2PR22CA0024.namprd22.prod.outlook.com (2603:10b6:208:238::29)
 by PH7PR12MB6563.namprd12.prod.outlook.com (2603:10b6:510:211::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 10:56:44 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:238:cafe::5f) by MN2PR22CA0024.outlook.office365.com
 (2603:10b6:208:238::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Wed,
 15 Apr 2026 10:56:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 10:56:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 15 Apr
 2026 05:56:42 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Apr
 2026 05:56:41 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Apr 2026 05:56:37 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, Michal
 Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 1/3] dt-bindings: gpio: zynq: Sort compatible strings alphabetically
Date: Wed, 15 Apr 2026 16:26:26 +0530
Message-ID: <20260415105628.957689-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
References: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: shubhrajyoti.datta@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|PH7PR12MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: cf26a0a9-68c9-4062-3c83-08de9addae3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fz7d0yJSlc91rrFUoF2J1S3JvHeGx0FaC8+pnBCye4RAlpvbkIQLhYRDlVEBaC2ax3hFGjPoQ5z91QtAu/QXjoitIjyYc+Cq6IIpFokHAbKMNOMKcj+wE5dfSF1VZY3NXWN7pJig/Q9XtCGXR0Bi+x7G4Dk5N4DxFLXWiRbheIfvEEfXZkud1dF/OGCvWkYYf2BkI/Wd2l8kOCjalQyHp0KEJGgkGb0X4I8cGxIewYkCBaofd5cCt9iAXIpnX/wx4TahQ6StXCgFbw1R3zczstaoY+aoDMjXKgxYpDAlb8PaMpomMjWzkxZRY/Vo3MTmIARq0Qb2cvNkSsrDChm8Y01pF5/yU2eBCVOoOzXiJiI70wPo0PXubCrkCM6ybEIT7xb2ckQWFk0u6w4msz2X1mOVmv67A5Ha9YOOlLxt4rUacy3cZwJY39LhvUoJI1hT9uqBHEojqhgAllNcI96hdglejEcZhUcml8B8aQWbzGdn2ZnvKVG2hZ7FVMpGtuqMturBagkG9Kmfkv5CQ8A6e7gRHF+mJC+Ikx7yq7XpGI2j9ugrLsvf3A0cnjizwfqhlyCBgTaiSnvnAZaGNzzQNu1yQT9Id9c9jZkl3P8RdSyM/F2SFeuzzOmCTKas+9n1RH0jpQ/g2WA2e/HuQd5Bb0GcW78tuy18IKJoeboYwJMIbgnBXKDrNtpvlMkfsqAVsODOOqigp6z1bupM3nVJM+C0LIRmy7zzvzO/8ZuH0byBzQ0Wjebd1HeCEjy4zGskzOzipZkYK+7vQUgnPIH8TA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XDLPAmV1bm2Lg97HAZ086SazL7xm0dL1MnqZ0F3XgKJ/S+Wllb1AJ2gKWfGsiVMI3NVWO+EP+mQC3wJHI3gjQnWUPCWUK2xAgihH5wvFrc21v/R9Pel1b+lrdVcOTmmNqe4Km24wC0WzjiUzX6O76yY4Jb8N+ZJqeZUOoDfGcF//hF6qkasnupD+vKoJrNuCQIPi0oDn/5rJJ8Qdiwv3iZTaDs7pSFY9fuyVP5EEL3f6LDRFUCZUMogufBmwzaRCimjf0aL/mGxGDoL9is6bPoxpPev19HuchBteUZDqBv3S6930QJD+VxIlAA3OEKodyeUewTu5rKhvL7mDgmA18iiqKUFXq6BQACzAx202BnpzIPXdGClFEXNdE7qNQJomNLQg35P/whrU5I9KDrhyMCcQPG/AfDPTG7NkK6a88wY41VDJXXPnB6t2Cd11/dul
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 10:56:43.4328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf26a0a9-68c9-4062-3c83-08de9addae3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6563
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35161-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shubhrajyoti.datta@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 28DFE403763
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sort the compatible string alphabetically.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
- Add new patch to sort the compatible strings alphabetically

 Documentation/devicetree/bindings/gpio/gpio-zynq.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
index 5e2496379a3c..30a7f836c341 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
@@ -12,10 +12,10 @@ maintainers:
 properties:
   compatible:
     enum:
+      - xlnx,pmc-gpio-1.0
+      - xlnx,versal-gpio-1.0
       - xlnx,zynq-gpio-1.0
       - xlnx,zynqmp-gpio-1.0
-      - xlnx,versal-gpio-1.0
-      - xlnx,pmc-gpio-1.0
 
   reg:
     maxItems: 1
-- 
2.34.1


