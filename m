Return-Path: <linux-gpio+bounces-34601-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEVuJpyfzmlZpAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34601-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 18:55:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A238C3E0
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 18:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CEBC30298A9
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 16:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C333F164A;
	Thu,  2 Apr 2026 16:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YV1Nlpfg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012053.outbound.protection.outlook.com [52.101.43.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18EB3C942D;
	Thu,  2 Apr 2026 16:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147946; cv=fail; b=R9WfBdU6aRqvOwc6pBi9hhKQmsOleGcTfONQGtYCx4PEDi+TA/UbymHf1joW/+LxmT0RaszI2flRqq2FLeMV5pvWtbzoHbXFD9ApM3Dm2/WMIpN6nE1HTn7NdTfLvvfSlv9Dqs69SRayZBZKUo6LGtWqr++M9UdqQpJE5FUPzXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147946; c=relaxed/simple;
	bh=RSe2UXaMiXwTlFp39bmMJgs544KlRbR1SoRB2aJCzeU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JSJ2F2+f02RNC3TAu6Rr8rneu2Kp4MwKAtIIXDt+afOX3BFa+ZfzkU2X38pzubc9e9DDA/WDkjNwMRybkS51sg3X/ivMYUZijGH+thYIgoqiBkL6B/MpoH32QEkM4HtyZv1GetU5ZhlPFFemzUq6xin81cJMKqw08OBVM1XHemU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YV1Nlpfg; arc=fail smtp.client-ip=52.101.43.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kzdp6e0RDv8OrIWfuz7G6LdZL9eRZcu6aWLQiop3FKOYk7F73+yA7LnwXWnRA1QeecA7CS7Jpp0KBm0D1G3Zf80h1NDmQq0j0hAe8sUNh3jHhTblULss4VLEEhHOIlluOOUlYYNug2jp06mXe43u4kDZ+/h6j7TGnbrjyj3HmdGAfeiFnL680bO2MJSesCfquKtEANju8iILfO0bXCcW3ptpWEWRLHL2jmC9/8bDQLYh2Xq9xNvF1UhkGSeLi4j49q46rbqbgTY/oypCQiDQpPaKiMAtWbuel+m02J1/auTVO2yuyAM1bH6ESsexRjNdLSPMDsH6OMq68eJTOwum6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gGP+SqqBinVX/QK2u1mNG3NnIANWWEBL89nQ/UBtz0=;
 b=iAgQquxNvWQQHq/SXCm6mRtmK4wrPwNqNJ9AKX3dX90bGf4z6n8ZSr7fUd2iSN1kbGTvwVilPvpZNwJT6PO7z4F5Yi8MFzjTugAb6NisNXtpeM4QB8nxbcQztZHdzzn3hl+Oxqs3y1BYSH/xVCXmhL8JrEZFOYsm1RTuvoGEWw20R9k7hjWQOXSebM+Sh1PkuYqpL+7/skxuL/yckzR0Ye7S1/VOfGrMVpWWDq0zuTqaReThO7UZYBJjAciyrOvi/ufP/BurS0rPiCkVXP9eD/lnLq3larR4N6PTUgMVHUwIl6Keok34msgEOxwppjqaCm4ZZ+NtaOtmUwK+OKcRdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gGP+SqqBinVX/QK2u1mNG3NnIANWWEBL89nQ/UBtz0=;
 b=YV1Nlpfg5G5YQUABEjJzL043nLHnWsSHI38ilSdIAAp2TSJD9Pu+1zTQ3YNsDId6jNG+761eCHu0w0FyiXSsx0FnDVVtxI/PF8OFEZ8BorYtbVhtRaDmY4PHcu9Dl9TwQ/ERQOkaPGP9I5cxMUR8KgQs7r+NC61z5Y9Kan4JtXo=
Received: from DS7P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::10) by
 BY5PR12MB4084.namprd12.prod.outlook.com (2603:10b6:a03:205::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Thu, 2 Apr
 2026 16:38:55 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:8:223:cafe::2b) by DS7P220CA0020.outlook.office365.com
 (2603:10b6:8:223::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Thu,
 2 Apr 2026 16:38:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 2 Apr 2026 16:38:54 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 2 Apr
 2026 11:38:53 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 2 Apr 2026 11:38:50 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>,
	"Michal Simek" <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
	"Bartosz Golaszewski" <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/2] dt-bindings: gpio: Add eio gpio node to gpio-zynq
Date: Thu, 2 Apr 2026 22:08:39 +0530
Message-ID: <20260402163840.938417-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260402163840.938417-1-shubhrajyoti.datta@amd.com>
References: <20260402163840.938417-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|BY5PR12MB4084:EE_
X-MS-Office365-Filtering-Correlation-Id: 22cbd5cd-51af-4c57-ce53-08de90d6546f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	fgr11iTbGNe9IYx54SZDcT+2FH0JB2yxjcf5cFGw509Np9nR7LrEaqU01kzFJxq0yIZqvI8AS/YtpvZ9yXc05Ap3ftHktYdSoVDbEiNO96mPEHZHAKf9IY0gy1MGTe7kltRyosKZS7dh2sQsvtmj0DH6agCFDxlMMEwM43Scj8lx21Tb/Hr7xweOs8kxAGYyzqJ0WLP7apkr96pJuJbw1c1oeob4jMFjxOLmKpmUV7CqA5ZB4zNMFeyNI6yOroCmOjUuJGftx6PTTGeSnu2o8tUMn9gzuRwvEgBMXOeY1NiI4jM2mv1r2Pe5hbyAnDVULTn6/kXMJBIxQG8pgZjwtvJX5gQW3ZkeqP1J5ATxGZLIXqMkMwbONFLjGJze6KoqjMC9bT816/Kip/MiqvPpNTmpg+QguTI36THEX34OhP81ydAWTxi7nR/UyLJ3OLpdX38xiZWCTvsSQr3O8avqinNagbEbGT2XBwbrWTcQv2gfs/do32XBHx6saZWwUUP8yVbclFd8pcS5iioxWtq2mOcOWmxv7O9qeTYbT1R+xQ6WIcdxZ61zz+s5rUUMvoXSh3UylWhx2Z82oci7Wbt78xFIlVc2830Zq0kPpdREAnryD86+CGqUkOVVRLXkAzTvvcgjv1loWeugK6l+3fSv2LgmJ80NEnjsSk1C5+7EnlJq68WaTrC/ky0s1iLjYpSQVFuN/TknsUVZxZt+Z3s/Qo9ukYVrtwdkjVK5SgAiHzx2UDQ7cm98m7wbs50t7kFwPE1QPKMy+FXx/7Cy5uyoUA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YbDdu4SL1JwpANftQl9hsshlp7MyaLHmtNj/6DF71qsE3FMSB0GzKORnvR7jKK42+OigTfTJmV2UtFu7EV3QPmvYGDdRr4elJBQ2zl8qiQMGO7WB2efJ5orEKjpmdnfIUpUz6SnegzpniO/Y0SHCbrX2dwDY1Egk/yh5Cbz/N8Gr7P4zMzOELspXAWMPIbAfgX/Ctd25imiCk0V8gLQhdd0fL/FqXcMZCJyddLX5NHLDNM+kNq51FgOh0SgVcp5yZUW1m6YRV/ewnifudA4ECxLmDUiWcCgd9z9hh1XQVLx478XcA3QqO45si5csjGCWaDiS++y9Q9I61G39d60SeCgnvPD/+jioNwOiNDSCRgKqNvdTcv8mxdxM5vhzN4fZprgT/pjre4UzoN5gTAJFGBl4PCl2ufy1PelXbCxQnzYyOnAwBJ5Z1LSfUPoKXBg6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 16:38:54.6390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22cbd5cd-51af-4c57-ce53-08de90d6546f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4084
X-Spamd-Result: default: False [0.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-34601-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid];
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
X-Rspamd-Queue-Id: 958A238C3E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the EIO gpio node to the device tree.
The EIO GPIO block exposes only bank 0 and bank 1 to
multiplexed I/O pins, providing a fixed total of 52 GPIO lines
(2 banks × 26 pins). Enforce this hardware constraint by requiring
exactly 52 entries in gpio-line-names for the EIO variant.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 .../devicetree/bindings/gpio/gpio-zynq.yaml        | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
index 5e2496379a3c..b8dd279753a5 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
@@ -16,6 +16,7 @@ properties:
       - xlnx,zynqmp-gpio-1.0
       - xlnx,versal-gpio-1.0
       - xlnx,pmc-gpio-1.0
+      - xlnx,eio-gpio-1.0
 
   reg:
     maxItems: 1
@@ -30,7 +31,7 @@ properties:
 
   gpio-line-names:
     description: strings describing the names of each gpio line
-    minItems: 58
+    minItems: 52
     maxItems: 174
 
   interrupt-controller: true
@@ -89,6 +90,17 @@ allOf:
           minItems: 116
           maxItems: 116
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - xlnx,eio-gpio-1.0
+    then:
+      properties:
+        gpio-line-names:
+          minItems: 52
+          maxItems: 52
+
 required:
   - compatible
   - reg
-- 
2.34.1


