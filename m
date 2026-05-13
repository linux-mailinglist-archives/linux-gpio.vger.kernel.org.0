Return-Path: <linux-gpio+bounces-36795-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNqoFwAGBWpRRgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36795-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 01:15:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EF053BDA4
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 01:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F42E300A8C5
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 23:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9FA3CB8F4;
	Wed, 13 May 2026 23:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IYGbKEj+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011028.outbound.protection.outlook.com [52.101.62.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B833CAA5F;
	Wed, 13 May 2026 23:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778713922; cv=fail; b=crF8tUPuVc9tzzZlYMqF7eM95s1xqLpUWXb5/cDDU8tsdiBpjidFOGW35QCf3GUoszafseIcsw13aeAsZdiMOgB5F5B8+QUpGTLzg88d9UMCTC6e0ZjFwJt9C7pPNiX1Wn83fIxsW3T5bA/8MkRIKqMUOExPuFjVfcnEYAF0bic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778713922; c=relaxed/simple;
	bh=ID011a9/J9b1LCR5GdYN3PLp0ETuPZgH9XxG1uPaVxQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lYK1g033MonOhjLeewAnImBNgqsXCxADqLM9oRXkXsf0kwwxMoKgCvlKJuPbAy5vFtq1ZNI3gGkLbimRfa2zFV0EhPgsng2+DWnbLfSl8TBhr4tpTjvaEbB7ztwYNXpQkEoudDiYDlhNwfUw3qrFisiVuALqP2pgeFuBB2nWopY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=IYGbKEj+; arc=fail smtp.client-ip=52.101.62.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lgkNWEAoQvqV9SH+wbp3rmsrF7ty1qfeX38ukuo70+MLyZaIx8DghBnK8zZe7nNz1K3wRNWBykMKDeU547/WU8jy4Z7GKYnBgvo23NtL6CoQGGdZL0/XUr75K/lzkNqNW0WiNuKBvAqQX/jGDA2+bKd1HzFIJs//7JsmSNMxuBgS3eq5eZOmn+KxBTyWc+3zwUYayBjqZhHq7edoc6x3i5gfHx4qrTdYme39CF2Je3x5USoDe9Riut5njF319Fs9AaAe1l+Jq53xjurccUglPTF/zFvXg/O6AQdTTOrahKpHzvXdn42EiI6KeYM/zlR1xe1knKmPMJvumqLHR5EqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyV3E+RY6WvnZSiuMYGNTPg2O6Xng5S8Emiiz/gGqBI=;
 b=qTpn7pOsODhC8FYuxWrHB7vtk2hG8qn9FIo1XTDkjW+LCif4j3e0NHuEbOn3+jAW/A2edTudIdXhyUazFCNy326A7NfPKya5+RMJyJVXVSekoZ/H+x6D6Mf4OWzZWKkXtbKXCUkZF+s+iu/P4h6CChPME+QGGG6F7EoSLXfKHNCzoBdW35yjDiLCemVm5oSIY1YL/yt4YMuXV8nugVw3hwyR5BlsZ8dROeQnCEkiX3Pb4vd1EPaYnnu6Rn2+5vKc9C2qdO1ctJyPoEm7RE381jAz8occa+uRPZpT9xcxrv7uCMiWB4q49HQYPNfCRXAPgnGdNdOhcW2XdxxhUT73HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyV3E+RY6WvnZSiuMYGNTPg2O6Xng5S8Emiiz/gGqBI=;
 b=IYGbKEj+Qc9OwTAfXp4ePgM+D4oubjc7gkwERF9VjEXs9LmeWgZyWOHmfJE5jKnyTpfXjGXLoKdjfz++liwzlR1JZp/prVeAxPKwKLV5vl2akcg0EUl7FRyr74ipxIinZZoNNoPqPLdRKHslWR6EjjyOIe/sXpyFJOJx2CADu8E=
Received: from PH8P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::20)
 by SN4PR10MB997897.namprd10.prod.outlook.com (2603:10b6:806:4ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 13 May
 2026 23:11:59 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:510:2db:cafe::bd) by PH8P223CA0010.outlook.office365.com
 (2603:10b6:510:2db::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 23:11:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 23:11:57 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:11:55 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:11:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 13 May 2026 18:11:54 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64DNBsHi469019;
	Wed, 13 May 2026 18:11:54 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Linus Walleij <linusw@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] pinctrl: mcp23s08: Read spi-present-mask as u8 not u32
Date: Wed, 13 May 2026 18:11:54 -0500
Message-ID: <20260513231154.2703292-3-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513231154.2703292-1-jm@ti.com>
References: <20260513231154.2703292-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|SN4PR10MB997897:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b3b403-d1e2-4703-9d66-08deb1450806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ksrPcr7xoqfo1afbseCoDM5d7Bf/g5J1KNyFnOSvrPNIGij8yPRSOBYYeVBMnXeDct3B3ebhKXaIE44Qy5aP7netIuZIMcC0R+3O/o56T75w3a6d7KLImfOE3t37VNIvKfyYNAgXUoXNmE7K0lmE/ow7CxeGAn4UnzM5F326dTVcQzg964RxIEcbqDnZ06DyFE0tgyhiNw/Tc8XJoOqpoTjfGXJ6kj+GHmj1cLJnEwOBD96jU87eKZASDxsMkbm1ysh9vi0HHQvSVZaXiZ+rbpNA1SPgbhqsPWFfPY91DLHCmN8L1OTamJivZXMyprFUrhkzqCSc7K5dfSukuF9M6lb8kHBpLgTqg51T4vQ7TLg6Hg1kC9W260rMEXoaSZ4Ipi0w1X22Pva8vB/U/T55f4c6CxLmsSvREoHizsQ5KnfdB8sZXKcbW7tQTJxi3iG6OTvxxuxqfLHPQGjQfW/Zu7LGthX5wVY4orPZrSEa9EGsCnxNjmRt9/fJwPLrHC9wB6Vo2Zn3ekZRC7an13IJ2AX9I3p6TYbRc5h8DN6Gck/P5s93rTWaIQ8xJRss6rzDK16tLKFwYKVcQMd+G0MBj0vSXTvPTwPnuBh8MqQCcCNtI1Z6pnc3JGPvIgOu4Y9wYswzOuTz+bcmDzKmtqfwuUtzHg37GIBLuDU2KhiYgwwg8+XkGgu5soPFtauHCWYBHXvRhz4pyE92DWZnEHA45GnKJ0PHX1gAu+d2mvYpfG4=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	49g6weKB1lAUDumcabpzPVT9Ag5YQhDbw601TrpCxN6mgurMSV0pCGk9Kp0zq+QGs1heGvu/q/oInSTTNh80vlpl7/7P8VT05/wjnko8m6QkInDWR2sWxjTmIdahexhtatW9/njMHYqYLSvWpmaE0bEaJ/zbPsz+YGPYIn3sWo6ux3WWl4UEX9+uj0o8nLpkoZ3POzjG8NfV3TVfsND4RA2VU5Ji2RwQUjWZuM8Jk15m5VgsFjFHnOTjOJPqNvHnnRjbXh1D58wzch2qrpyygdq+KM/K97JyqtDWEQqbafWXNZ7e19i7554Dl2L70xadp+2DljYBnouRSaCwnJevKw9lp1dB7gPH9YcFM1egs35ShvPEhOl7fALDpHYRp+K4BkAYuOCHbStKQmEjq3oOHXLjbW1E0uwXu6lUn9TctK7w33flHO4/t/+CbuUoEEPk
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 23:11:57.8028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b3b403-d1e2-4703-9d66-08deb1450806
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB997897
X-Rspamd-Queue-Id: B5EF053BDA4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36795-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jm@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,ti.com:mid,ti.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

The binding (microchip,mcp23s08) specifies microchip,spi-present-mask
as uint8, but driver would read u32, causing type mismatch. Use
device_property_read_u8 to match binding spec, hardware (8 chips max),
& prevent probe failure.

Cc: stable@vger.kernel.org
Fixes: 3ad8d3ec6d87 ("dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to yaml format")
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v1:
- Add patch 2/2
---
 drivers/pinctrl/pinctrl-mcp23s08_spi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
index 5ed368772adb7..30775d31bd694 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
@@ -144,13 +144,13 @@ static int mcp23s08_probe(struct spi_device *spi)
 	unsigned int addr;
 	int chips;
 	int ret;
-	u32 v;
+	u8 v;
 
 	info = spi_get_device_match_data(spi);
 
-	ret = device_property_read_u32(dev, "microchip,spi-present-mask", &v);
+	ret = device_property_read_u8(dev, "microchip,spi-present-mask", &v);
 	if (ret) {
-		ret = device_property_read_u32(dev, "mcp,spi-present-mask", &v);
+		ret = device_property_read_u8(dev, "mcp,spi-present-mask", &v);
 		if (ret) {
 			dev_err(dev, "missing spi-present-mask");
 			return ret;
-- 
2.54.0


