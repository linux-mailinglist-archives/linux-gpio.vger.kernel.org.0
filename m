Return-Path: <linux-gpio+bounces-36479-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADNrDAdZ/mkWpgAAu9opvQ
	(envelope-from <linux-gpio+bounces-36479-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 23:43:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B654FC039
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 23:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A256E301B15C
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 21:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133F63328FA;
	Fri,  8 May 2026 21:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MQ93Izer"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010021.outbound.protection.outlook.com [52.101.56.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A1830171A;
	Fri,  8 May 2026 21:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778276610; cv=fail; b=mQmXXhnmY2rTNOOlpy9IJ6BNK3ynoEeaSKq3PWB2vOExkYkCfgwTi1ixDYqNoDyK8AQI5JmM4TF4UExA+b+XCJrdI0Scgv+bDxNLJHJQ1luzOmN/K4Ugojz7a6lf50HCDkx8hHoHIvszRx1yZgKn6mg+ISdIaalwUMOO/Qoujdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778276610; c=relaxed/simple;
	bh=xJFqGJ9xdiOQ4HW8EMDb5rorOcyx4iZdEMu9KC2fu9E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u+4vE/n/xtNP7raBG59awTrRGvy1arGfuI94V1/1bQsX2QVuBEmn310X/llmmMpD2PwNC/j8PyAA2KkxkbO6Y2pTVLeewHQ9t3BArzdPceBBjAZMMqyvxAlfH1bpx0t13bvyvNiBWwlCg47OcRn5mUJBj3/ILvV1Cn+7tq9pTqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MQ93Izer; arc=fail smtp.client-ip=52.101.56.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yr/bw77T4xSpMF4DLfCElO8wMvy63B2CLqhAfzvgaFWCtePv8nW/o6Pp0DTfn13WY2aRxu1QtvEbZlqUYrXEHBA7P/YYc5nXGMTzMzMyYxXFAd6i2t+Pfw4vsrvqF0xBiOSjv1nRwrtwJ4EG5gT5yMMciBQK0hNMVP3xmU0Da3ocFSf8xqd5Inp8BCijSoRYzaei5JnNY6fdgxF2252s5ZBAal0iEetUxNbNFQDKWHDIRLr04CeSOgcP1qykixOlIQRuzHN2iVCFq8flcRi3mUgSJfSRJEG5smulx5R+hPqaz6oX21BYdQpTwGnRpH81oFAFlRbkMa8njRQvknf4EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrvlFSSgbm4zkw9rC79nBBfzkF1RTf1Mh7+bH9+Ge5c=;
 b=xUGzTHevbtryKhLhimLCDuMK3xAncCpczJsRA9v2fb4jQm3l8QijHpVYlZYoHEuhWLiu7U0xsU6OEC8p4a/csm6nsahgPIZP8fNcT6G85FAJhuz2veEs3X4IcE/ix7G/xGaMPB3788PRg5AiRxN+XZyAi4NVk3YYLkLhFsj7V6hFiaYu8yaadl7zQqmNqo1BTiK+YX1wIVzPdasMM1FdYxUOoLYt7YQ0JHs8W/Jp8P1XRdj26rkOJib8SKT+Rfz+tHSRs/57CXZo719Avo6zp+FLW2BIuIailo+oaOHdiHGah5o5qbOMNQWfS5nMPixnG1qjQ/Lrug17kWV3FMQKIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrvlFSSgbm4zkw9rC79nBBfzkF1RTf1Mh7+bH9+Ge5c=;
 b=MQ93IzerLoQSTnRJCXaGrETLsTIhYQB+Yb3cqPiZCjueFOAIkujDvVEqZ7dHYtue1QIMy/ewWsLlU/XKfkCZQPVl21dMRpkFzBvJ+qQFyrCKhrGczvQe1//Uc7zfkF64gEQM6+YymkFERIuBL7nIwOvxz1Iy+xR6Onl57PXn+iQ=
Received: from CH2PR04CA0026.namprd04.prod.outlook.com (2603:10b6:610:52::36)
 by CH2PR10MB4326.namprd10.prod.outlook.com (2603:10b6:610:78::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 21:43:25 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::67) by CH2PR04CA0026.outlook.office365.com
 (2603:10b6:610:52::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 21:43:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.8 via Frontend Transport; Fri, 8 May 2026 21:43:25 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 16:43:24 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 16:43:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 16:43:24 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648LhOZd2728655;
	Fri, 8 May 2026 16:43:24 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Linus Walleij <linusw@kernel.org>
CC: Maksim Kiselev <bigunclemax@gmail.com>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] pinctrl: mcp23s08: Initialize mcp->dev and mcp->addr before regmap init
Date: Fri, 8 May 2026 16:43:24 -0500
Message-ID: <20260508214324.1040460-1-jm@ti.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|CH2PR10MB4326:EE_
X-MS-Office365-Filtering-Correlation-Id: 329837c3-2618-408a-42b3-08dead4ad563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	c2DYss4WJCsW+Lwg0s70xCmrRi8XcvpjHZhmokQt9kuf/HH61bire/7QWr8NFLo3yaFQ+/UzDOyqE4wBGDn7OlG9UHkVwbtyRgefImJ3HUlHL8340LeXEqS7LXHfFMa0EuPKJrlA1pMP069hTOpb+8LoLK5n2A595kjlsA2mPY3sv8W4DAVCCvFE54CllMRONJzTKd5dCk2qd28sEI0sd1iTFsyGFucY/2K48W2+jLFQZsLmNGyGZ5PavbEh2SG1FU+8QFuyqvrBwUHGMrmVEjXNUUD85dSXZIORkeeXL1pMtgnfwVJxM8CG7urj8DnqlalZBmr9neIot0FCYmEX6jnw9sp+02/kKl8sxLlvQ4bsE0yar0HtfsIwv2/cz7DU636/bEPJaYjGhKQYb1j5PUInRqOZurEifqhcVosgONiMOoWlwcFpuxLnGchwdh1Wum02UT/jNy6qc69VP79EdVzGHZmdMG7xRU6LqzGGKCSrrKL95pPk5IMn6ZWuB6SrmiCVtbnr77qBiOO+m1t6K0FzMT2UMZgATFU1WDa3cg+EFRHH7osJYms0gcIxUC/I9T1jtuw3LGJKbCYMiVXz1L/IUB+gz1mKmpjcnyS2v8c15Ivm6bn6v7gy7YtnkulkCHeS/VMHGJ0UCnyGNz3ppxUmoLuqEKMFGxzHx7hyAcGD1cHXBubwbSUm9Ua9Rqm0+RXpdPESM30ilL+6oC2Bd5S6/UL9lT7igZD0KSj1SPY=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HUKwWrVYaJps4suSthNYzJq+o9GFcECRQXuraQzgZA8cRTDREAQRgXefX/KrYmKbNUEWhN7bWzgI8OR+i+se8dZTyWvGoFQ276BOTekaM+qJlNo0Jk08ev7CuHHAr+bWMVFobUHeuUYiZ0x4P4R/CcrOj2BR0DX/kTC/7T3uIBfNTPIfiOp/ACVas+m/qqD2fFCWdd31F4ZtyGesx92Yqk6QxEKVjRntLH7i3xTufBp3157sfo7sfd7lY3fwRCnDKfvbrx5aVMTDBu26iArnEq2XlJHP1QPshMHCLL03lrX4QdvtnLy4jTs37qnJTiUqxB3txd25iJnBHU3lfm2lHoJ++pvev7SUhh89U9Gc5wDO8MP13ywiE/aIzDbDwWMy/bPmlKL91ZOMcyd0CAaqxpBBRmKWbh40u1NESSe43NkKKcWnBo3hYTlWad89RG6d
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 21:43:25.1469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 329837c3-2618-408a-42b3-08dead4ad563
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4326
X-Rspamd-Queue-Id: B0B654FC039
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36479-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jm@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Regmap initialization triggers regcache_maple_populate() which attempts
SPI read to populate cache. SPI read requires mcp->dev and mcp->addr to
be set, without them, NULL pointer dereference occurs during probe.

Move initialization before mcp23s08_spi_regmap_init() call.

Cc: stable@vger.kernel.org
Fixes: f9f4fda15e72 ("pinctrl: mcp23s08: init reg_defaults from HW at probe and switch cache type")
Signed-off-by: Judith Mendez <jm@ti.com>
---
 drivers/pinctrl/pinctrl-mcp23s08_spi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
index 54f61c8cb1c0..1e99b2566d5a 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
@@ -173,6 +173,8 @@ static int mcp23s08_probe(struct spi_device *spi)
 	for_each_set_bit(addr, &spi_present_mask, MCP_MAX_DEV_PER_CS) {
 		data->mcp[addr] = &data->chip[--chips];
 		data->mcp[addr]->irq = spi->irq;
+		data->mcp[addr]->dev = dev;
+		data->mcp[addr]->addr = 0x40 | (addr << 1);
 
 		ret = mcp23s08_spi_regmap_init(data->mcp[addr], dev, addr, info);
 		if (ret)
-- 
2.54.0


