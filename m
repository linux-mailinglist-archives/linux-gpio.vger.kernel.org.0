Return-Path: <linux-gpio+bounces-35307-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN1VFnFV52nz6gEAu9opvQ
	(envelope-from <linux-gpio+bounces-35307-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 12:46:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B00ED439B44
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 12:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C8D8301FF94
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 10:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510CB3BBA1E;
	Tue, 21 Apr 2026 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2SDMqBiY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013027.outbound.protection.outlook.com [40.93.196.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67B33126BF;
	Tue, 21 Apr 2026 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768260; cv=fail; b=QTvLDQgIkSUbnk6E63wfwG4MUDwg8thc9YoQsGWaR2/NZwgPpowlhfS9ouwlTxeR38S6ivOlXxFHpPD/JTBW6Wk5ymsZ3arLC4//xhosG1599vt+bxwchdpPz1GCRGoQl1GNdTk7kSgWrev10QhfyLOUYa1LDBttEVtJ/Aulxe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768260; c=relaxed/simple;
	bh=VLq91z8NlLoGm9ox3NrCFYAGHr/00B3N6hyuixeqW38=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E3zqvFB9Cw0v1AO5n/TbzUqbhQUfPky86un1scIhrpadjJkX1QuaU9QAQQuYqzbBsFcLVgZb6XcdukP5aJbOvRUXg087HdbZ0ZG7rw2K0WxC7XCM9ibxQblKEpSbuYUspUDQ3CQ1NwUrcP7BJrO526cRyHpglxr4btFOJ9W6UKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2SDMqBiY; arc=fail smtp.client-ip=40.93.196.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gc9qhEydFcXNr93kLaVZQ1SHiW3q4Mnp/6gwAz+vLAlQHFWsaLesgpYqurgcOqGIkENgMpHDG8Epp63i3cdXf4eKCnzlA1la8BveCGk2EaIqluusevXsj9HdWexgRPasvS0wdxJ2kWxeAqocCTXEj6P3IaAkY+SH+rn2jNLY+bIjxZOiQ0FTxNH3s5PIE8Mt6IDPMrTle2mhGRipdLxIFuGmFduT6hW+n9jCsHR8oOoxWYlY1C6P3oLf30YNpQItPn/RDynscie/NK7hvgaKR/RxzFPcQOWG9/aNMabEmoEahZSoxHnrjEGcezDHcJRzLBKWwNpacEzUBq3v19920A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMP2nwQiuNY9N7EuPEv5BLrjUMNSRupMN5XEYho9bhw=;
 b=Ipha6e7SepZKlkeNPvaGYyAtaPPPJyM8wFSEfE9q8YnCYvFjsz5lYkkiE2OPqqF8pv+7GKjRlgXKdEIdX3pCnHesEsaTd7QtxtHsrhTetqmTmSrkNq/f2wd+IVrlm4QYTt2X+WLhzJTNpwDaRKc/o7PqIqh43Q2BRnpS9M48tVoESPAhYwrEeShmEVOp/kKB4Z/5j24tDjtfFq0qvdouUYfBq3+L2cAbuZmU0s7TryMMtJ3KYpaXGRiLwZLertgiAcw4EwX4ROP56wpsG5QeK23J2DI0AW7mWrc6jQqSlpKz+M4z5C18UrfqrSQOK8+3rXatjQSBydxjDYuuOuANSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMP2nwQiuNY9N7EuPEv5BLrjUMNSRupMN5XEYho9bhw=;
 b=2SDMqBiYiOVFtnVit6drHBWTOwCFGqhJvX8QRtq/msIVR2Fn/xwRaLj7p1kyZ079hGcRGXkxSH4zsJZYdquuOzZrjcEahcRWQOEgxktQaBGBdtFAlmplfO7+W7OVygSaxiUqeGQyIuTQeRmLkbW9q+DISRk26zir4XwIy2MsWk4=
Received: from MW4PR03CA0351.namprd03.prod.outlook.com (2603:10b6:303:dc::26)
 by MN0PR12MB5882.namprd12.prod.outlook.com (2603:10b6:208:37a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Tue, 21 Apr
 2026 10:44:11 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::a6) by MW4PR03CA0351.outlook.office365.com
 (2603:10b6:303:dc::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 10:44:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 10:44:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 21 Apr
 2026 05:44:04 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Apr
 2026 05:44:02 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Apr 2026 05:43:59 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, Michal
 Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 0/3] gpio: Add EIO GPIO support
Date: Tue, 21 Apr 2026 16:13:55 +0530
Message-ID: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|MN0PR12MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: ac42674f-24e9-4a13-435d-08de9f92ec92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|7416014|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CnGymdmdVh+tF9jfA3Ah7WfavRFM13XJ3X501vvuwjBxvRq46DpfCQc7VbA/hyYHmrbm7UmDFahEJA9J4F4CzyTsstqCAh0gx3xIULjzEnTajGcjG3/brYzXnFmP6TOyqgIvOBlUfNYz67bftNaH5cz/I6jw79QPpoCjliDrSJqJ+WerMEooq9ONOsPrYp7LFb3Cj2XvNc0E2FqC1b6PWpNL18RG/SPcGrIU2x8ieCSMHKLgP1qc0ICRVCxJi64WhKJvYt2OpiRiKIB4LkWIuwY1L1i0owQItXhkTjtiIjoNNEtE3M2G73ufyHLiYqFfUPXREm3gwAmalcejvcO0uQIDCQ0PgqUD46NziLPPH/nNUKcJCveavmrsTyAL0SKReV6DkuOIemzxKkk39sedpvibym5BAXsASQiCp/xEgCOdwvjKe6L9h8LhTb8BSerKxc7D/I90HRnNHO+POd0jdzggI5OXklgkQu5SY23dD1MFhV9kLUy/WBTOha27SXNIjGvYmqHKHzA16ircSPrS18tEQ3ur8bfeluLzqbMGKVWwBDDGuJc5VIV0/nVAXLpi11I9ObzGI6QGYRpzZq2M4C99IsZUbQVrCKAgU6LiuKPYg23rLLB3a9Iqb0Dl1WOMX1OA19rPOIt3Ff5l9wT0Q5uHk7GP6yKYc/4kzrUOXzwNajxeHIjBcRf3KZIUtiqSQRPmrvxwXAfNeBVndrqkzz9FlwN48/F2fOCdItLXgJFe9oto8ILpAa6eR44AlEqsMyYqtiCK9SmzwlXlNVEW4g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(1800799024)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mOJbL2yRUZGT/jjOlDyW/68EfOssTUKemKzjWo2o8bSjEg9uvP6ljto6Q23wYNb/DKcSj7gWgesAIWV+DX4aBNLKYp/q5vs+h/oJTL3JEEotAT7nRmb/NJJhuYMbuNEY1LBS0kty0tTiNGB/Vx6rSjMHkrYP7GZLxwyJhgynLE1kQcAQn9CWURUy92y9qOIqV86bg9dRZiWZW2YFP1KDeKQdprnUhWVqmEMkM0TE/bZNBm0Aw38/CFglGKfGgzUC/lNVeWPfcZMJWa6hyDnD9g8S3fikFPl9aIwyy+g2yTA7cmoNDoxvC/CYcqGibuwwHZD4/6gRgyBDWCajpeNIeTVlYrRsrHU+jxTDXfvadntGjcFcKkesJy0ucPD4KPizspkmj8j7cv2VC7Nh5vg5NTf28W//WaJ+CJRtimv01bf+ovaMUeKDrzoSFpQdYf4o
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:44:11.5434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac42674f-24e9-4a13-435d-08de9f92ec92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5882
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35307-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shubhrajyoti.datta@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:dkim,amd.com:mid];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B00ED439B44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the EIO GPIO support.
Add the dt description and the compatible to the driver.

Changes in v3:
- Update the commit message

Changes in v2:
- Add new patch to sort the compatible strings alphabetically
- Add description of EIO block

Shubhrajyoti Datta (3):
  dt-bindings: gpio: zynq: Sort compatible strings alphabetically
  dt-bindings: gpio: Add EIO GPIO compatible to gpio-zynq
  gpio: zynq: Add eio gpio support

 .../devicetree/bindings/gpio/gpio-zynq.yaml    | 18 +++++++++++++++---
 drivers/gpio/gpio-zynq.c                       | 12 ++++++++++++
 2 files changed, 27 insertions(+), 3 deletions(-)

-- 
2.34.1


