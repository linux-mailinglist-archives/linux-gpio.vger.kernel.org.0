Return-Path: <linux-gpio+bounces-36642-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPuVMpXEAmp7wQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36642-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 08:11:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B2D51ABD4
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 08:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8471C303331D
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 06:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0226E43DA4E;
	Tue, 12 May 2026 06:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uxCzkBjD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011040.outbound.protection.outlook.com [40.107.208.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F0343DA4F;
	Tue, 12 May 2026 06:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566198; cv=fail; b=W/Aw59UBK32+ou35OJ43fYUD5bJnG4sISCe8M6Pfm1x1DE0N9sRkgdR1L9yDfVoxuaWstSQuCvyRBJoxv1ks5fc48CJRTZ6q0zscLfuujbs7dka3qRCmQmUrHYRtQ5x7tI0ig/hx6labQLe8dXznF7z7EiZ5Ultw0tB3icbJdGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566198; c=relaxed/simple;
	bh=OV1EOfgrPR8jRQo531I9wj3Cr5ceU698kZh1srP5/tE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YOt4TVnq9gB8jsd1PGsn5Vk+IDCK6mLayv+VZhHcZSjE8U8obsEDnaGkKO9SWwoItgi4fDO/kPlZ6LAEHazdaR0PZ6GMFbgsQE1YifgL3REPFyQlvmJNpCObj7iurU7O9m9PJS2me7ID430SFn7e8Pkwcz/e//XfifovfJcIUj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uxCzkBjD; arc=fail smtp.client-ip=40.107.208.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRO44lZbcroXZXtUONIqFEGhR20rMPVFX5JcA9DUPnY/dHCinSnwRdhErwp56cuQvT3hGqzxH9s0x4IoS9Em4HZ6otTSgWvx9ybl+idE5yAKraM19s2aKKod4YoisJIzPIGhZUdZatrrhpQF2YG6MbpYShA4KSC9NKqPrzwim5599etbjbYIwXwA0vPr6S+JPtc6WmuA5kOG1703hnEckbK5x6WstfATSzavpCl015+aYY+V6fr2cUCm06k9416Y7wLFNKCMz6B2diSTAeJpgWyDJ8yFpK7zVD0dZMqxUoxw4pagSdcFTdCj4aMzC1+mOTimGWpow+rAzdDDl09ZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ah0PhSeyxPJ+iyZTlPevBN3vuUak12Ucav+orIO6GFc=;
 b=OS8iBeZwgJfbONH8Bad88VLwRgjybXTQpKJIewwutM9GA0ms/FoUq5wBLYnWBzFzLbNXqi2eV1c7zYHxWMat7t6VxF4L5G4WegGr1JD+FS1xbupL+EYtM/5I5eip1k+RpbeBOg7N0bdJeY1XH/RCwnoDhhL6HHqOrCccsoyqifWs33EVg1TYWDFqklWW01IlBT0wdmAdj2kFIeBuhWItNwasQBYAd86REU3oiB2zfmuzu0skPSiAlNpIxj2bXZXGvgFyKMSlkt0fOIG8xaJMCOLqhBryMTfXZibQRiu1IkgnH1/6YIgKayKqENIvzt0IuN8hxe3RtSUapxyNYhdMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah0PhSeyxPJ+iyZTlPevBN3vuUak12Ucav+orIO6GFc=;
 b=uxCzkBjDUCJbC4yZEaPwbg8N1cP3KuihpaKH/qdKXoXeEsdg4+vZi0ouylmM4twg7f6BQf7azvQpHMy+soi16iLdmqy5vLIMkMUK9SmZRm13OtLp/GvC4gONbda7HK2m/dHdR1fW/0xOYOV7b8okblV3oWPUQu2Udn0L2hqEn38=
Received: from PH8P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::20)
 by SN7PR12MB8790.namprd12.prod.outlook.com (2603:10b6:806:34b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 06:09:35 +0000
Received: from MW1PEPF00016160.namprd21.prod.outlook.com
 (2603:10b6:510:345:cafe::b2) by PH8P220CA0024.outlook.office365.com
 (2603:10b6:510:345::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 06:09:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF00016160.mail.protection.outlook.com (10.167.249.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.3 via Frontend Transport; Tue, 12 May 2026 06:09:34 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 12 May
 2026 01:09:34 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 12 May
 2026 01:09:33 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 12 May 2026 01:09:29 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, Michal
 Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 3/3] gpio: zynq: Add eio gpio support
Date: Tue, 12 May 2026 11:38:49 +0530
Message-ID: <20260512060917.2096456-4-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com>
References: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016160:EE_|SN7PR12MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: 911061b9-7a70-4ffe-27bb-08deafed0a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|7416014|11063799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1TtQwqfEFOHMTuOIFQH3VX4yahCtgVtTZUx92WU476R3wgOhA44hQkl2eNkn+nI2qHPlS06OzVs447ytco0ZHeOxFqO8P4keXuM8rh76DFFxwMSIAml6c2aMfVg5E/YFaKufxcg78ctOF1cw2b9gDjRwaaUw6MMMuG2cAbFEc/deEThGU8fXOoRmUgvqBQnSGGb+M1eetu7h9PV0Ob/BmFkdPfQJ3R5fD7/VDKMvQfmXajsF0GVy34iuSgtljomJlvE5RPvBk6YQWfBCC4yokp9sDTCBmNujJ2yui+wWA8nZVv+TGJ4bTfvRTj0YOf/9tjj2K4HXdFQd2lNXocMJUHZLNAeDLSWdRtyKeh4vuBRLOL0uWXwvK5SdZBYlQnwRwpeKxRUzXC6LYc0R1sS4IBHjos2NNvTfqsbvSLSZDanOtvUz4vamgkGPQn6KmOZnSjjvd2d82L6Vb7F+OhJ6B1PXj5fsgJZTB1WNRriRsWfxRencMRVf4nyXbRl6zT8ksiAM8S/8FyJsV9+BKzQc9Gt8U53nMopOuyPj5Kzc+CnkkrHwBxDu/fq12kHyogmlzVYWLs3yrNfy2Z1uHFu8E0B5q9VTDfG4TiTM3ad8PihO4TOwv26TA+9sDX5V6ZgFX1FhUqlpnPsvxniy/IFC/Ea7qjAaTpfLRNCB/5tVRnsuwRceagBw/2gysYu/EyGetYXyl7lw1BQPAj+uQPvwc7vfwH3gke4SMm9kQTGCe0A=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(7416014)(11063799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cCNfmT3IPLQS2o8ERjkOIvnrfkXFSQ7+CimLSL/pVErSfqVaZEKJPLpXJtpxQb+eeSa/ZqIekWzh+r6lU55nZMvJImB8KX6C9saC8R6ztM0kRWejbDhmwMIkx7oA0scqQIwcuazb9hWnZBwApLA4c+rFwya+pOn98ncX/OhHl2hAlJ+HK3k6tI3YF0d0PtUhWGxaIJ/s+l7RBLkXVpdWVdSgK9sBa/uxfREYNjNPn11WFQr915qJPaEkOPa7boIOGcEFb8z1u6qaZfhFJTZYvSVqEpLZ1rIqZP3sulw7mpfreAWisotkIEDGNzyldUXiOVGJacGif3dV//D6/6LzEBBbXaBJ5zKL0UKrm6RHcu6Ci4hNEy1o6TL/njhW8kJu6FQhipbn2WMAfjkEbbeLT0zVTHOVuPIphToldwm946oSuRz5azxbW3HHMUEHLoF9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:09:34.8605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 911061b9-7a70-4ffe-27bb-08deafed0a5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016160.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8790
X-Rspamd-Queue-Id: 83B2D51ABD4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36642-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shubhrajyoti.datta@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Add support for the EIO GPIO controller found on
xa2ve3288 silicon.

The EIO GPIO block provides access to multiplexed I/O pins exposed
through the EIO interface. Only bank 0 and bank 1 are connected to
external MIO pins, with 26 GPIOs per bank (52 GPIOs total). This
change extends the Zynq GPIO driver to support the EIO GPIO
variant.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v1)

 drivers/gpio/gpio-zynq.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 571e366624d2..8118ae3412c2 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -25,6 +25,7 @@
 #define VERSAL_GPIO_MAX_BANK	4
 #define PMC_GPIO_MAX_BANK	5
 #define VERSAL_UNUSED_BANKS	2
+#define EIO_GPIO_MAX_BANK	2
 
 #define ZYNQ_GPIO_BANK0_NGPIO	32
 #define ZYNQ_GPIO_BANK1_NGPIO	22
@@ -818,6 +819,16 @@ static const struct dev_pm_ops zynq_gpio_dev_pm_ops = {
 	RUNTIME_PM_OPS(zynq_gpio_runtime_suspend, zynq_gpio_runtime_resume, NULL)
 };
 
+static const struct zynq_platform_data eio_gpio_def = {
+	.label = "eio_gpio",
+	.ngpio = 52,
+	.max_bank = EIO_GPIO_MAX_BANK,
+	.bank_min[0] = 0,
+	.bank_max[0] = 25, /* 0 to 25 are connected to MIOs (26 pins) */
+	.bank_min[1] = 26,
+	.bank_max[1] = 51, /* Bank 1 are connected to MIOs (26 pins) */
+};
+
 static const struct zynq_platform_data versal_gpio_def = {
 	.label = "versal_gpio",
 	.quirks = GPIO_QUIRK_VERSAL,
@@ -882,6 +893,7 @@ static const struct of_device_id zynq_gpio_of_match[] = {
 	{ .compatible = "xlnx,zynqmp-gpio-1.0", .data = &zynqmp_gpio_def },
 	{ .compatible = "xlnx,versal-gpio-1.0", .data = &versal_gpio_def },
 	{ .compatible = "xlnx,pmc-gpio-1.0", .data = &pmc_gpio_def },
+	{ .compatible = "xlnx,eio-gpio-1.0", .data = &eio_gpio_def },
 	{ /* end of table */ }
 };
 MODULE_DEVICE_TABLE(of, zynq_gpio_of_match);
-- 
2.34.1


