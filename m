Return-Path: <linux-gpio+bounces-34600-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK5UFAugzmlZpAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34600-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 18:57:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6948638C441
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 18:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49F9130981F1
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 16:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC6838AC66;
	Thu,  2 Apr 2026 16:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1p/cHN/d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010052.outbound.protection.outlook.com [52.101.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF1E3CF046;
	Thu,  2 Apr 2026 16:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147946; cv=fail; b=M4tw9lS7aW/IH7jF2xJ6TqdKYG9kDac47UlUfHxOT//VXPZJoSrFW6+xz1M138GDgD1Xw8zewf6DMgUDN5GFk2TTpabqeNZEeLIv79BhV3xszuWARnwpMt6Z8VfWm/MEboi5JyDY+EplowRLFC/3cekTXex37q7H4NAseFTS8Q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147946; c=relaxed/simple;
	bh=ZqUG2Et5MbWXip5393WbwkVp19pBds98lX23kN37Gi4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qwzc5WM3BwZGbTLDcId4EaUeEZi35mlkQBvIALvqmNTw4bz5C2sEINEXd0f9+RPd7Tsw2tc80mD3KrSdyLOCA4G6h3Ie/OndOC/RB37IlL/o+rE1Lfv6gXm8Q2WoV2xJ0WJz8x62irBKnKIOwce0Y7VuJkDkBmH0dDXXQvlF3Lw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1p/cHN/d; arc=fail smtp.client-ip=52.101.201.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuzTf4DdvXg+Yp9VLRR3g2lJmXOVZZTOWpMZyVLh/HdDqbehfvMX4XX7cJKcAYxq/7sw1piuE1sAfpxUAPgXrhpC/Fx1A4GOXRaBByhVxdUAW6ahtXXsviQZdSdcemimbFR8A+8DXMu4xPkjpYNJOlUBCtvhpsk0d13ICj5FriFzyJoji23t/t8wmjfJgJ8vrMOsaaaRxPu5fmphJN+6lVh4NDB8Tn95ih78gYIUVOGnmvqNNIo83ERoLCyHf/IUCSxozjBE+ypZNgRexy4BOj4JHVbM1ymZJPuxyNySn6/xKFU6tqPflz7AtaSQuorqsSFNJB72sEPFLZKxjO29YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZjcwMAJltdpwZlNUWZF9WLsgEQmZVEKWtmvzomSe5U=;
 b=DLPgmE/xMT8WG4gE15cbvQihbrdtyFwh183EBjyTgaNJpg/WmSGUet5gxCfEdqOk7AXL7fgz5cnS+m+vDjK82LU2vC/6q1rrWvOFv/xpi6HIiX+kswM28IH2t/mxfnZKbo/YLwUWDOMJgwxsjdqKLRR+NiZtFGfHgUjaZd060nz0o7NmjgS3pCTT8jjlj2Ezto01ZrcZ+pLm3sIyoouLDLRbB/bzkI0HsSpciVQB+nX6RbcBCUlXTE6aaSSRMN42qEUoO+v5c7YZ2fQPzg5HurHs8I6Kmunahh54yr/zVOfEZFR1MARSbO+BCDaChYLmzboaQD1dBuLW0e/tppd9Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZjcwMAJltdpwZlNUWZF9WLsgEQmZVEKWtmvzomSe5U=;
 b=1p/cHN/d7JrQufGeesYrtwBO9mLd/z7b4b27v3RVdWWId+nRJFQs50r05irUi3i2dpW+S+ICa9MbyDTzXFJxn/PTkPlH1aE+yG8s/UIODbhA76akrj0XsOnsPcZB0mW+10Ec7j4tMhYHRraez83WyIHIP3H1OfrIheFHxE9PzeU=
Received: from DS7PR03CA0358.namprd03.prod.outlook.com (2603:10b6:8:55::7) by
 PH8PR12MB8608.namprd12.prod.outlook.com (2603:10b6:510:1bc::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Thu, 2 Apr 2026 16:38:51 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:8:55:cafe::b1) by DS7PR03CA0358.outlook.office365.com
 (2603:10b6:8:55::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Thu,
 2 Apr 2026 16:38:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 2 Apr 2026 16:38:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Apr
 2026 11:38:49 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 2 Apr 2026 11:38:46 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>,
	"Michal Simek" <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
	"Bartosz Golaszewski" <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/2] gpio: Add EIO GPIO support
Date: Thu, 2 Apr 2026 22:08:38 +0530
Message-ID: <20260402163840.938417-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|PH8PR12MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e9f30a5-1577-441d-b0c5-08de90d65274
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vo5n9DYqIeyHbJM/xm+xNO62nOZ1v4UR8np+OzKd3q0XA/vMUlEa4u/jYlrm2bF531XGnjBvt8CZE+HxhIRly9d/AVvicRyCfYzBIpbBIbpVLNFVNQDwClJfudKFfJGeYfMHJhwLgWFa11s4EedpXt5LlNtwf04KyamOu9QpsTJ8FmDUWuWKI597eBfo1VwEDgUbqGeqJJkENI8j4WrcEy9pe+dU4Eg1cTZYigsGTsguT1B4tvhDrpU1KSAzlORIDOCI7G4wCVg7jGH5BNA+37qF2TUSwWYNI4DPVfZPsTo09pDMxGm2ZsBOZsqpzeenSjFC63g7K74L40CcsJWC+TJW7hRpu94WXmmrr8O55kcIpBKumonHcKBHoYl9J00O3A4lQHokZXRx/LCuMxYOeuCRHlAPEIIoy1PHmHOM5E61upf3rdrrcEdHqwL9sd+1Fk5DoJKn0B0EgaphxHz8YAdXJEwt4WYFgEr2v3t07FAe88Gl/sndeprIevrcMFS2Qhqa9YttoINdUC5rVN5aa+fjlRPtxHd9Ud0nQSNoxSf82mrkig/gpBtuEehydzv7GLpCpDAZn8svFCsRrYsptDln3lAD2+Er+RLUgkV+3Oq5EyTW9vlblr3TfnG2TII6cyDCI5Wcml1uqfIkSTFc5qjeGeBdW5FRz2+d2IgjSLJoLROvsuN5m+m72F9GPB/lMxURF3wRcTMIhUmK5Dcgp4NmoZ8nfMXiQWE1qWtWr3uNB5+Z/aGuD8jRfWds0iby34AOF9gG8HXRw3JGqlbCew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mMsD/w5WfRjar1w0lHBEua41JXi+O1BcAdYOsiy2pcOtuF1sv00Yeg2uTnek8bTs1eKpBczkfxI5aiM7VQR1lUvc3Lwz4UtUz7hZFgQ5u6rYd9zRkoMMOKhR/j/LW1ezZ5o9f75vWhsBX0dwFpzC8pyvhQGorLev8VHCRXABSKOmnWQgtRihkxuL/PPBumcZ3LAX4CT/LwXcCVoj8tjBE9R9q9wEFWN91PldSKQWL1Snsvkn/IZWvepHVxC1WzeXzYg1oCZC0ZExch6e5QVQ7Mosd4tjvj6D1k0+TvefE5HFqf/KPwWKAPGZ7vIHnM6iF2BWLl4JNlZjG8y42i7WVUPCyMIZ3f2/xw3OT86S3wqkQu6D9gK7RnFvQtrkUUqbM3qSnHW2wIwkyLftBkSt1bUVZbMM8Y2yM4i0H9VYOU2AaBwMYkSpQoJJAe1tjPxG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 16:38:51.3177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9f30a5-1577-441d-b0c5-08de90d65274
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8608
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-34600-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,amd.com:dkim,amd.com:mid];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shubhrajyoti.datta@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6948638C441
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the EIO GPIO support.
Add the dt description and the compatible to the driver.


Shubhrajyoti Datta (2):
  dt-bindings: gpio: Add eio gpio node to gpio-zynq
  gpio: zynq: Add eio gpio support

 .../devicetree/bindings/gpio/gpio-zynq.yaml        | 14 +++++++++++++-
 drivers/gpio/gpio-zynq.c                           | 12 ++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

-- 
2.34.1


