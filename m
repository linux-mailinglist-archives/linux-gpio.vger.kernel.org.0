Return-Path: <linux-gpio+bounces-32214-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDPOHj4hoGkDfwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32214-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:32:30 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FEA1A450E
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 915403028079
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 10:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612223A783A;
	Thu, 26 Feb 2026 10:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="e9pSowpL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013048.outbound.protection.outlook.com [52.101.72.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11183921C3;
	Thu, 26 Feb 2026 10:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101870; cv=fail; b=cxfDotmfK8aW0h4uCFx8l8eSrMjs7ZXmeUcyjyK4PQdzVZvqVrsnvTP6JeHTTfV2V6AftjdR/4358UwLIfsXqlbWfKvkrtcG2iiUTKXaZjgP4GEsLDh3Rmur043F3XJbRTR0EOv2gBCMwN379cZNZRY8f8CwtFcTpK0KhaUVKxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101870; c=relaxed/simple;
	bh=gasJ4wp05ecZjpZOI+s8AzkqVLnWLbhhK6NGrLZN2PM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Ahx5jKt/u6DYZPRUBTsbRRuPI5u55naQrUwly+lvAPaBRAoY9ltBXyAu6fETHpkou+yDtUZ/50Dey5zgJyxSR2xBODZ44oTRsS4FL5rwCbXoDRwlJCMoBNmCgYPoph8A51KKCAskHBwb4BydikyjocWFXZNModnzuBBulkCuvaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=e9pSowpL; arc=fail smtp.client-ip=52.101.72.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4r5YMlYUOXe+9CeJUYT93euKKCEaPcNGNe6xGx4+NVCO9Tunrx+Nxw8pkemvxtksrUyJcTCaKLf3NBXHU0qYSET4OuGCEGpdfR8JqKKZKb3jxJIea9G5JOVX08m7d84zYSOwKnaH2AF4cXOj60G3B/DWpd6dmJkLfx0wgD3Uk0xRhhbQfi3K3WHEiJhThEQkF8frMArYup4E3cXmDJZwlOZDRcZ1YGYijg6XG37zc5wkAwBLNJptgtQyHZ1ZtYVSP4Js5ZMt5g/C+f6fhFckRlmcjaqV/CCwFSRuIp9RdZpoxnF071aPVTKE2G247Vk4+6mUnSQlq4KZor/BZ+ZFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnp+WbmrpjbSYXP4bPIS18SJNcmQ7PlBkN1d3WO5f7c=;
 b=UCMq6pfv6r62eTB2rHvrEFBd/YTWCciQSvvyDjHX/bVFdMoZo6ueuMt9ahzWiYQ5jNpRTyYtlVqvYWEj5XD0IgdKoWiOwtP650aUcM/STy9wsboXse5VBlyjHi6FZP2JL6AAZ5G9O21XfBquV51a/S4DU7bSAIOvZTt9M0EcRmuJS+jx9iuTOXyuJPSeyjp7MJsoCJXM2ioHZnhyMAWzI7S7r7QFm3E2vAfCFGwkacdWhd8LIbk/c9gyAz8R2oU/JmUvzRW/9zeNRjB17uBtiWc1Lk0BkwIA8cqAM82RC7kUezC6ovOdWWHOhEML4gZnxiMxFbl3qWTjW10w0FOJlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnp+WbmrpjbSYXP4bPIS18SJNcmQ7PlBkN1d3WO5f7c=;
 b=e9pSowpLVGhL96G+yVe7QhGqgMj+oJ2YqSfTrlnThvmzwk/t1vguYQP2uFttcmU1VC1/ogtU4r7xrGXrDbWJunth7HpeS69vftHxrzqanEtyP+z8Alq91IUbGdFmNLBSHWiemqAbhpalKov9QR8YoPLZA5qgnFY4T53HBWQ3Dez+R0jYLbniMsQd87Bi/vDLNaiV6r9ozVKy1BdpJrsuPl6OJZ1HEKiMEk9mMxeJT7e1g++QRSc4SPKuG9Z/wO/K0eK6qufMvdDolPyMF53c5ndzx8pd3cNhlH6ap0aIAfTCfjZ4Oabz2oX6FMoEfC+OBaD2KyfOOl7GUb+9KlIStw==
Received: from AM0PR10CA0006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::16)
 by VI0PR10MB9125.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:23a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 10:31:05 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:208:17c:cafe::c) by AM0PR10CA0006.outlook.office365.com
 (2603:10a6:208:17c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.24 via Frontend Transport; Thu,
 26 Feb 2026 10:30:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:31:05 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:33:12 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:31:04 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:19 +0100
Subject: [PATCH v6 04/12] bus: stm32_firewall: allow check on different
 firewall controllers
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260226-debug_bus-v6-4-5d794697798d@foss.st.com>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
In-Reply-To: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan
	<leo.yan@linux.dev>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <cristian.marussi@arm.com>,
	<jens.wiklander@linaro.org>, <etienne.carriere@foss.st.com>, Sudeep Holla
	<sudeep.holla@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA2:EE_|VI0PR10MB9125:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb216ec-6eea-406f-cf35-08de7522257b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	+zC2QTfIX7mf5snqaXQXTnP2+gSJkS9uQyTWpcw38Jj0Qg9sP2cDuahS+iRDH7vPG5QIfZCQiYLpcc4hDvhAGYOBjFWYhov8TrBAR2i5C7foGlYlCNZAhWspCdzvFnt1q781TvvGCN8+Yud7hitEsZEABteIC4MtTivAVi1Z6PYh5btp/b4gN4NcDAST6bblLL3yGzlxYVdv4XQtDN1xbY3k/wH4V1NZIW11Qf8J7kBvUWUI66xLvoqud24fQx+5CNjBBK3dx9WCYsnEfH2NEQdgp686i5BWDNhTU/qBxEFwG42nyUtDnxfu7TyJXqYfzOdx9itqN4w8tkVvHFcSErgqELFdK0m4QkRpNIZzySwaCvymmauMyaxYDqG7Os50NSM8JsMwooAbUodmOpuPGkJUg10OVdY1RitxlX8Fz0FZnuUuBqUNE5hlc3933sFtvkmhIgAgSIODLMMNv6Pz/m654bFLwNwt9gHqAMbHnDAPYj/F6he5iKw5sbPGzF88udUgQoyzYZzXdmhdmnzVriRV1j/bzmceN8yrgYNF9eUKTRgroxRDmLIauUksuTw8pK498YwYapodfi+vaKeu7AQLS5FKBGQoK5rEM+7k2Sr6a19nglysFZRXxamML40ct2ro65geONCFY7eioafvgRLV79KQ8/AEUswQJX1vE8o6TXFLhXGMn+8rb7OzRlZdcAT6kBDURDt4FpGuVYrXQT6+m1KTU4mjzMsdZO8wDg0YJOmFlfFj1GlQJxoMNx4v0OlFEzw0fJCKvZTLLbzqyhlWD8eqe7qcd2O5wkQ2pJCfP3TmGHFDv8Fl3I6Y3okVf4UxclR8zC5FGaVt93rlP5OusBdq3WOc9KXpBpvqP/k=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+/FcO7gNwGU7me/sYKJnnDxw7HJPxdD5TIf05BzjdwKOF59BY8Vyj1SYUVp9dkOwRTTlOLyZaM4BshbWmx6zLMa0YqSTnoSn2vjN/J9zpSE/Gx4oiyLYYO6j601x7UHf3BZ0ELML2C66jjS5rkgioztdftTMJL1bgSmDxmCnUAnj+opwkB/tlq2pO1W5rBlDNEKY9pBfEB+G4c3IW5tts8Ok/4CY+EZFDU4eLLYEbz8fSFR0VeFoldgVAnb9B1kf0V19IDb2Jkg6AoSMKP7uYJWzgdIbk8dcYHrGW9vXSNpVzDSZIOBKBO9M/2s7XqiDgVsN6wlq75zkj+8IYHeA1OJoQ4Y5nBI8ZJEG6WDUx+TdXcj4WTgVq07/N8dtfYGer4QmMhR4+2mrDTVhXsZoRobwKhu6QBZiDnYV1C+YT9KDI/0nIPPualynmL7sfcSO
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:31:05.0509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb216ec-6eea-406f-cf35-08de7522257b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32214-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,st.com:email];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E4FEA1A450E
X-Rspamd-Action: no action

Current implementation restricts the check on the firewall controller
being the bus parent. Change this by using the controller referenced
in each firewall queries.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/bus/stm32_firewall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 7e7afe8007db..41cc1e7190ed 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -274,7 +274,7 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
 		}
 
 		for (i = 0; i < len; i++) {
-			if (firewall_controller->grant_access(firewall_controller,
+			if (firewall_controller->grant_access(firewalls[i].firewall_ctrl,
 							      firewalls[i].firewall_id)) {
 				/*
 				 * Peripheral access not allowed or not defined.

-- 
2.43.0


