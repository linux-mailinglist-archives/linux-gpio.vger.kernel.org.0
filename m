Return-Path: <linux-gpio+bounces-36797-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPFgO5MFBWpRRgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36797-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 01:13:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAC353BD38
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 01:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C659A3019C91
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 23:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16DF37D11D;
	Wed, 13 May 2026 23:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MbMg6y6J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011042.outbound.protection.outlook.com [40.93.194.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE373CB919;
	Wed, 13 May 2026 23:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778713930; cv=fail; b=E21jwN38lLqN8PnM3wY7W3BKDbBumSM5TXdmibl+sbmAOXESs3hd61MSthlD9T2/gT3E1xk2fYF6g3XzlAQlxejE+oVN+lipJwYEY6HMnZZAUfGxlzX9Z4sFwpq85P6YLNQmGdWHZUAHYyW98ZdT7EPWfQ8DKUTcMblvN+GazA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778713930; c=relaxed/simple;
	bh=4FDNMDcb/QAUFVT8UzVWnfJApjETwxOnPHFrxcrMZOo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ijWpdhdXu8aEEBS5wnJTH1ENmKCBOf+IEOdjuULv/i+3vqiq1MvrFRPPx5cidvKClqlxbBhuLENjH0s001dALv6RVFm5AcHvPawsBfsWphbgR9NyCPt6MDytlRUqa6qBo5QOM7466fbz4qYhEI+UoReRKX42cLDaL+1b/jlr8aE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MbMg6y6J; arc=fail smtp.client-ip=40.93.194.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EFGAUknND7d4pKWob9bjChh+EnFWrmdv7yT8OzTz9TjXJcFJORE5lKAqKgzb/4nVwVLoyl7CFd8SvLNzT7hTSsojQLfd7ADY4JDee006wRXsSaAS2Hp48PAEmwJvi+kdb75gSjHwC0IH6PJ3xD+mXNhIJlprFKn1gTOJwAiPNSTFFG6BI2MI92Pl23YgL0w0fbJm6FuMknMKCGUkN7ZD9+i6reeyA2GUBu44r1YEfCq26VPzNkbFS+lKOBuw8NvylBY2W4XNxXbYy1cBl4NwMJX7fMMTDlbRijbevziEwId1Nx8ifHrLN1hjVpTmv0MNKD6b6UXP8vdgzntR22pY/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQxG7QgIchCnYRRQqwSIkaGPSbqfOFb0/80o9hRyu8Q=;
 b=x5ldLBYrV+yXimIqJ2WRO7ws+q+SOe1zicrV1a6Y56EkGfXgsKP4Uuuqj8PDPf/1JIgrXHhWZ9Ee8FZ+C/bFPN6/CFdaOw52GcTFGV3LC0jkEfJ1pPw47qCrHHNNQ2QrdtmQDfO9xYRcqeD/mx8Stgi73S2wZtDYPSiOi0Z9I7Rys9nFZICag6UX33BJmq+/hNXvtX7dCPoswgQJRhGfGbtvsmPwDdmpkijm+uYiOVUfmA0M9+19nRJrOL+aSllrvrzBEAYRTbUaIhJi7cXohqBFvVNqgvwUBVlpUCXRvGN0go/R4Gq8apU9EMZ2Qp4WClth+EhfUFrtTM8v5fwoVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQxG7QgIchCnYRRQqwSIkaGPSbqfOFb0/80o9hRyu8Q=;
 b=MbMg6y6JsVnKQAC4l8ZB4LQ/lpZUItAC7AX335pzsklyWfN8Sds8DAfelKHEuamJEs/ysBoB3Ct9Y1LrjSnsgq865AfXKLNjxQwEY2JXnmSKwSVZeaYdHPivbbvYpTCppzXha+2AreVbdYFCtVf7nZHQe+/wjRfN50MD5AFu5ow=
Received: from BL1PR13CA0209.namprd13.prod.outlook.com (2603:10b6:208:2be::34)
 by SJ0PR10MB4461.namprd10.prod.outlook.com (2603:10b6:a03:2d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 23:12:06 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:2be:cafe::12) by BL1PR13CA0209.outlook.office365.com
 (2603:10b6:208:2be::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Wed, 13
 May 2026 23:12:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 23:12:04 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:11:55 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 13 May
 2026 18:11:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 13 May 2026 18:11:54 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64DNBsHh469019;
	Wed, 13 May 2026 18:11:54 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Linus Walleij <linusw@kernel.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] pinctrl: mcp23s08: Initialize mcp->dev and mcp->addr before regmap init
Date: Wed, 13 May 2026 18:11:53 -0500
Message-ID: <20260513231154.2703292-2-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|SJ0PR10MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: d8189e44-e1b5-4707-acd0-08deb1450c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ygX78m+EModBzhNjbVPaeyFpICClp8q+6IbTW0+iozBSK1TPwQ9c4m9TNBmQCsjxEfEuzhI8BWkp8F6SNHirT/NsiZpgVwLy+sg11iwxUrseXF5Hc/XQaE1wHpc/nlgChR4QW+mp39rQz/OOIFClmDXyulB6BToe5OZhVLpyOcHiorB/iLYfChF5oa28A22WmZ/Xa1F5QeFvimuPQth7oLNEWQuTVFv7UX1y4rQMOuESu6PG2lr2pWfliKWFp5qLTSKWhhUgb+Y969Tb6FicwZJyfyzCc+SbrxwhUttRrRVxtG6OsfAe8+Ss82EAM+EKLWGg/N5woWuzSsPhMcR15lfE2Xgky/o6HVTvJwR5LTBGOeJ5XKTQmD17d98n9AvP8UJFM/lFTg2zlEBew2QQhSoW4/AmQ8uQXuPUgnLUM6HLQ7SjoBNN3JQZzTde2TSNw52jNI6lrHrYH6N4a8r493ZFVYLT3bpHALPPikyrioH+9ZZEQIVKWpQhih9T9Vwaoy1yPPp+kM25PpRxXHenSP1x2cnO8MuMOSs2QiWdzsrhzp0VjUeNW02gqrrUmuHSQ0beqD+5WoDxdQ0YgXjTWPivYFZfC8jzE6WKPPMpljfQ5F1ouPVo0WgiOVnvAp0YibQZ3mERzXmfrnh4oME+Cl31e/ctyx06MWHH0xRVZNSDLQd/5II2D+kcczDHPZbUS/WPGL2K5K8TCRYOl0QYtQDajooORcesG6hn4HZaTMQ=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GVWjziW3RV4sRLnWlbu25qXOEJREGH7OtVOfSYO7YA2qc9bJVP5TdA3S0Jtktm+eX0+dPgdNqeUj3xEoalGiu1/vRkDsSnrz7Qiej8fE9kFrwVNNYtcdhCIe9RSBnHvQbNtWApkJvQSt23UoVzxNAMA5DSM/J7jEUC44VGl5Xk6Zw7CRBQ+oySkCa4anSnrYEB+hdN8GzLw9cvSH7an++C1LHUZ+b3amGXzqI6YYjA9L5/bx3UO47en/yrAGTlqs/z44jz8PE1v/52uxHmsasoqm5h9gtYHHR7KaqdGZ35ojDAdTk8FmKSP4ElxAOW0usiPkmqZXK0dcKdZP+fc41JIAUauY8FZGJmP/XbBo6HK8NkzUI6v0zMOLyfRVz9btyvXDxeswxjcfmC7/eUg4wiEGXziLUBgmIQSfySE2tj8E8TTPyJLsO1w+O9pcZoLE
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 23:12:04.9648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8189e44-e1b5-4707-acd0-08deb1450c53
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4461
X-Rspamd-Queue-Id: 6BAC353BD38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36797-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jm@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ti.com:email,ti.com:mid,ti.com:dkim];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
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
Changes since v1:
- Add #define for base adress & use instead of 0x40 hardcode base address
---
 drivers/pinctrl/pinctrl-mcp23s08_spi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
index 54f61c8cb1c0f..5ed368772adb7 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
@@ -10,6 +10,7 @@
 #include "pinctrl-mcp23s08.h"
 
 #define MCP_MAX_DEV_PER_CS	8
+#define MCP23S08_SPI_BASE	0x40
 
 /*
  * A given spi_device can represent up to eight mcp23sxx chips
@@ -173,6 +174,8 @@ static int mcp23s08_probe(struct spi_device *spi)
 	for_each_set_bit(addr, &spi_present_mask, MCP_MAX_DEV_PER_CS) {
 		data->mcp[addr] = &data->chip[--chips];
 		data->mcp[addr]->irq = spi->irq;
+		data->mcp[addr]->dev = dev;
+		data->mcp[addr]->addr = MCP23S08_SPI_BASE | (addr << 1);
 
 		ret = mcp23s08_spi_regmap_init(data->mcp[addr], dev, addr, info);
 		if (ret)
@@ -184,7 +187,7 @@ static int mcp23s08_probe(struct spi_device *spi)
 		if (!data->mcp[addr]->pinctrl_desc.name)
 			return -ENOMEM;
 
-		ret = mcp23s08_probe_one(data->mcp[addr], dev, 0x40 | (addr << 1),
+		ret = mcp23s08_probe_one(data->mcp[addr], dev, MCP23S08_SPI_BASE | (addr << 1),
 					 info->type, -1);
 		if (ret < 0)
 			return ret;
-- 
2.54.0


