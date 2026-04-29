Return-Path: <linux-gpio+bounces-35740-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI6xMZdy8WmggwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35740-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 04:53:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BEA48E73D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 04:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD5EF30148C1
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 02:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEFF535E931;
	Wed, 29 Apr 2026 02:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vy4Hw+uV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012064.outbound.protection.outlook.com [40.107.200.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D0927CCE0;
	Wed, 29 Apr 2026 02:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431183; cv=fail; b=XBhUXHr8u9v0pmxRVUCuSvABPhyxEo6FTiSZxjkmGQWj9c43+F3LbWtaDoYd3+Jc7U1OTSXDXlKsAGkoSNmHjgDqog5J/HtslDJhRwX+2D4UI1DbKLP7swK+xd5REtLDxJy6ZN/6kUjlVz6YknjTlFkQZVneOnK80ursK13QdOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431183; c=relaxed/simple;
	bh=s65iGYiuGKIXPK/K7W6Fd0YmB9G7G2CbeIuHEjp4gIY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tvXv0eVeFfwAN8A0ZYtKLrHt90hluPYONzq+TRN8FmM4n3itc2l0JPFYgRMpgl5bbkNyDo3ePZVoDMSDVkUQowfRAT+V62HFu/7JcIKmUuEY/D1BkLA0ysv3YzkYw1HjEICEt58dGO3ZogZRRz9LYebYTnIe83Gd81GkRkWO5O0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vy4Hw+uV; arc=fail smtp.client-ip=40.107.200.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9We3vjdEFG87jmduU5R7needkRwr4N9c+G1CrraYjymj5TJuBmC3LedbgI/fW6gpuNdNFQ3fGC2mx7cxtuopa6cfRFBeQd+r88lvFyK18vlGruZSJB6czRHGhwUvWENQNxshPRnsYxs6GHH/BMDLOhXXce1xF8EYGSl+IyDpYFNv0FhR2dgTrRPvVlXoduZmsF6RaFGeBv9h/TVYmm6JQ7jssrARetpdJd6VQ20F9ReIGuPEwpkLEUptSGSlg8/JfNg+po72J9F+zE6ApiS5crdV1VZTDXJqqT76rgxTAVvsEPqhUWxyQBrpEfTA1hn1g6NPDthvWZME4dpubk7lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKn72xxoNMpEebuHZfyfLnDSSRkL4s2pLib/P/AELA4=;
 b=xx6zHUsMnfajvO64c9BkGAsaAAqLaTh8aow2NtCFm570LNw/b4J8ncTwVXw/fyzhIAO6aUWHzynJPu8TA/EP1/IunOp5pNthdNBpuMbHbWroJqGInEO/4FUvtpjUc5t6UAbnILSCQarUEu2fj01wo1ruq9632hJ5E8Pk6EuAJpghremjioG5Iw+h2h6jgDVnvve7Uc1RJp189ElwNF/4LmjRFLBjshaek+7D3F6Cc+QMs7b9N7Po1kbmkQ/nVOmwn45Zmd7GxXLAkGOcxXR9v1AVaP5WjI0QeD8nqMpIJZ+UYZjWfN4d83+n30KvixS1B0AHr8iYJX40fhz0hRM+2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKn72xxoNMpEebuHZfyfLnDSSRkL4s2pLib/P/AELA4=;
 b=vy4Hw+uV9mVKLUAXTP8X0CZJ4Kk4oiddjaneIM9AXBGlfiPRegFel/dkFP67/wddaMkoyu0gtedheTGtandnsN3st+Gma9Jmsnd2ZT9f/Q6MvqAxBWv+6b0ReTUpb6jp3bkDP5dKZh2nVbghDw6z29G4OpHKcIT3Flqi+Up03A8=
Received: from SJ0PR05CA0206.namprd05.prod.outlook.com (2603:10b6:a03:330::31)
 by IA0PPF12042BF6F.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Wed, 29 Apr
 2026 02:52:57 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::f6) by SJ0PR05CA0206.outlook.office365.com
 (2603:10b6:a03:330::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Wed,
 29 Apr 2026 02:52:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 02:52:56 +0000
Received: from ausmlimonci-lx1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 28 Apr
 2026 21:52:54 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <westeri@kernel.org>, <andriy.shevchenko@linux.intel.com>,
	<linusw@kernel.org>, <brgl@kernel.org>, <bentiss@kernel.org>,
	<hansg@kernel.org>
CC: Mario Limonciello <mario.limonciello@amd.com>, Francesco Lauritano
	<francesco.lauritano1@protonmail.com>, Marco Scardovi
	<mscardovi95@gmail.com>, Armin Wolf <W_Armin@gmx.de>,
	<mika.westerberg@linux.intel.com>, <linux-gpio@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>
Subject: [PATCH] gpiolib: acpi: Only trigger ActiveBoth interrupts on boot
Date: Tue, 28 Apr 2026 21:52:39 -0500
Message-ID: <20260429025247.1372984-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|IA0PPF12042BF6F:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a98b2d6-848b-4fb2-5aa1-08dea59a6a88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|7416014|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	yxutk3QxiJVNQpFM/kVyZ5qQ4oqAGXcxedQzmgUN5c6zXFnFToAoZlFXD4iOPUDVWsPw9l6pgyEfkez/ZZjCO7dFQ9wGlwRWFLLwxcXfmerfT2QwVf5+39J1e+mLRzMUj6YInxPRD7qdiRu7TuNg39vSgrZoy67OKSTKznKHuKcr9r2C64uM2d0UOFD+m836/vB4D+KK51tCu32mTMLzjOFM4+zRVf2mKUj7XOUGqs4dQ89xPJgY4WhuKoqKmoVefWxw6QlI2f/JV4gwgbZ1fHebcbHs341hXEOs+lAYpcNPjAHIJrQIy/qnMnMPAXr2lbc/IJ0XG2tHf/REOTOnEWURVfBOA2TgAvUN+kRTAZojsh/5/dMO4pJODT6DJfJ2ClzmoBobu4nhRRuS8paBshwlwGTQUpE+9E/fs6jT1b9GjTBrET46OWUjPhbxjaKWx6BZ4ZlxihIt65nyDTSRk/L3VvFRYXdumu6VXh0iEsH5LsFoj92js7tX0ub6mN1cMdrdddYIC9mcRAXE8ykjeYYSmD/r2/YR7HeuQqIRwSXebL+xXlp9YPgg5EF0yjpVWsl8+EwI7XzMhVz+0GTQyanP+O3Kn5wMchD/C0+t81rdFtZXRAEKhWMQlRvBgdpOZQptawV04gh8PrI+2OI2KUsH9Z4pivURtr7Z7He7onoDGLqcKcw0daifqycLE/EjvzSvQD86WIjpjb4LxL0lEZ2MTs2Cb2tWdd5yvVMmSzc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(7416014)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Hd7SqZ4RWZa2nFTIDggCq0StVOFdZqr676yAwZCy0YLPPjt4bKi7CAFx4Or0Cge+RhFfu9X5p4C5h5WCx2sIhTnjG9x4eA943KPEDOVVtaesqyR+rF1W6w+03drh6RWbZhzVCc5MFax8EeGE7Dm+pLrtNeYT6I5aMTKaP4W/twNu2P3ezSsshkyXbBZrR3sCLCSH5NGrwHi3r7FqRFe+8dDknrGTYgoRrxDNjPNspYNYrlY7Jut/pdyJOEYNOLE7uQ2r0FLSZ5vn21rn/3AvbFZtda1bBWp23KLaErP9fadVVeo97crVAJlrj+yUtQWLolSSnU2Qs8TpH8XNoQTtsfMxS0SupzP/FjGciogbgpW9c5LNdukGrPmBbvR51w4gEkFVxqXTPh2y3oKDy+98csfzHj4k8M+Ld1/5CppcguPwXQr20Ye8ixH9ddFVeQ7n
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 02:52:56.2707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a98b2d6-848b-4fb2-5aa1-08dea59a6a88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF12042BF6F
X-Rspamd-Queue-Id: C5BEA48E73D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[amd.com,protonmail.com,gmail.com,gmx.de,linux.intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35740-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gmx.de:email,amd.com:email,amd.com:dkim,amd.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Commit ca876c7483b6 ("gpiolib-acpi: make sure we trigger edge events at
least once on boot") introduced logic to trigger edge-based GPIO
interrupts during initialization to ensure proper initial state setup
when firmware doesn't initialize it.

However, according to the Microsoft GPIO documentation, triggering GPIO
interrupts during initialization should only happen for interrupts
marked as ActiveBoth (both IRQF_TRIGGER_RISING and IRQF_TRIGGER_FALLING)
and only when the associated GPIO line is already asserted (logic level
low).

The current implementation incorrectly triggers:
1. Any edge-triggered interrupt (RISING-only or FALLING-only)
2. RISING interrupts when value is high and FALLING when value is low

This causes problems at bootup for single-edge interrupts that
don't follow the ActiveBoth pattern.

Fix this by:
- Only triggering when BOTH rising and falling edges are configured
- Only triggering when the GPIO line is asserted (value == 0)

Reported-by: Francesco Lauritano <francesco.lauritano1@protonmail.com>
Closes: https://lore.kernel.org/all/6iFCwGH2vssb7NRUTWGpkubGMNbgIlBHSz40z8ZsezjxngXpoiiRiJaijviNvhiDAGIr43bfUmdxLmxYoHDjyft4DgwFc3Pnu5hzPguTa0s=@protonmail.com/
Tested-by: Marco Scardovi <mscardovi95@gmail.com>
Fixes: ca876c7483b69 ("gpiolib-acpi: make sure we trigger edge events at least once on boot")
Link: https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/general-purpose-i-o--gpio-
Suggested-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpio/gpiolib-acpi-core.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index 09f860200a059..eb8a40cfb7a98 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -233,12 +233,23 @@ static void acpi_gpiochip_request_irq(struct acpi_gpio_chip *acpi_gpio,
 
 	event->irq_requested = true;
 
-	/* Make sure we trigger the initial state of edge-triggered IRQs */
+	/*
+	 * Make sure we trigger the initial state of ActiveBoth IRQs.
+	 *
+	 * According to the Microsoft GPIO documentation, triggering GPIO
+	 * interrupts marked as ActiveBoth during initialization is correct
+	 * as long as the associated GPIO line is already "asserted"
+	 * (logic level low). We should not trigger edge-based GPIO
+	 * interrupts not marked as ActiveBoth.
+	 *
+	 * See: https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/general-purpose-i-o--gpio-
+	 * Section: "GPIO controllers and ActiveBoth interrupts"
+	 */
 	if (acpi_gpio_need_run_edge_events_on_boot() &&
-	    (event->irqflags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING))) {
+	    ((event->irqflags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)) ==
+	     (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING))) {
 		value = gpiod_get_raw_value_cansleep(event->desc);
-		if (((event->irqflags & IRQF_TRIGGER_RISING) && value == 1) ||
-		    ((event->irqflags & IRQF_TRIGGER_FALLING) && value == 0))
+		if (value == 0)
 			event->handler(event->irq, event);
 	}
 }
-- 
2.43.0


