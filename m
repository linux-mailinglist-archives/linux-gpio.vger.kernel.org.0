Return-Path: <linux-gpio+bounces-32219-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HgyHeYhoGkDfwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32219-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:35:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEB71A45C2
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DA5E308604B
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 10:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845A33A7845;
	Thu, 26 Feb 2026 10:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="kGg3HFwB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013066.outbound.protection.outlook.com [40.107.159.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FF73A1D18;
	Thu, 26 Feb 2026 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101926; cv=fail; b=fGIkJLqftf7QrSPzAQxSUHaWp/B4XcnmR1mLqKxnh76ab2V45WcOORG+UxQY7G4drSg8YEJFxfNH3AEi/qTKzRu0BuI9hXdnpO2sOwFrqOs8uvzD0sPSAnl2BSHFM3ZCxG1vFQHt6XBClPdwnXmQTCtyXgAjmfK1yiZVXryCr9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101926; c=relaxed/simple;
	bh=NPMg5vqKdoyvD1tGLGmXjwMYBrsShVYXayLC2uaBcHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qcgI3JsZUNIzNWjzh9/VKHRsVpINAi1ak/k8hfShC1Oh4f7elGrZxhWK7FBl7Jpl55E6+DoAw7Hc1QjorKMwLx1E1+DTGGYQGpSksvvAkF/xRTa9+kN/ecRTmHPHqK8eee75vrTdHiR1RDWm5ro6AHkpPrzcvK1g413DrJ1C2f8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=kGg3HFwB; arc=fail smtp.client-ip=40.107.159.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2ULQNFf+mBMn2k6Asekoujy9sezhJ9DQS3+QVjzXGI7DLv0pW+7LeqNy5ief4GNzpT9keMlD6StmrXf9ry4lTN2AWNjtLrnPAGFEFR+RY71d/70p3O5i8V/oiLLAKzuOqaVtY0KVFvU8I9nb3LBukB5KB8V1oJWvbd0wlt1lxOmQrc7/73p8vDuJW4ken4yEeqC8i82NjFX/axAbQLZS4t1NtJlH2g9j8VNbb1cWptHcLtWk068l7rCvf3Hv7sZay5WbntLp5ZK2gAXG1UWdCwYjHbgwFcSjPpQb/WuIF9fi4u8mviPCpC5QXsOTi+GIsmHfHQ2AxapHhWL85MLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLtCKKu04t4U1oN14GZwDoVU4rbU2dG2WQpOkvLt560=;
 b=nHEctH8VS9Poo0YuCeGz8+dd9SUdtA5zFmg1VoUmZ3F36PpI32v5UGJspmfTG8reEkuK8Lz2mMtyvvD15+UwjVdyl446kGQUNoyD+ZGnhJAiRQ2oy2JK7b0KIuuCNXXfMv1w2h4P2Sa/JViHfpGxv8lkmxd4xpcbgt6qoOza9L+3zfH7H/6/okqkV6xOTN9ghQrsDhPD2n0Owb8W3R3fnny3OezEGzEQt8DNbzE/eX/wUmURWv+0L2UoCSJaWbBUs8draqOQ8nXK3uqgAW3d6VrnRSfUiXtp2f0b5E+6GwjnT1RvNnfd1MtUttlmpVotyql+HzCm7d+486u/XhNmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLtCKKu04t4U1oN14GZwDoVU4rbU2dG2WQpOkvLt560=;
 b=kGg3HFwBNntqBOTkX2o2faluj80h27qfB7WaXF79M8bedsMtFjIhEQAKH+00K7PKG+82wG1b1jT8z7jFRaAClJUBKIyVLDd8xrQPvSmCDJYKgBJnyzDiBAqtyIJwscwsrLLW8k3Yuwny1F+NkKydEugzvLC2R1nV5S8B7NeaUm9oz3AC3OB2WgC1KY3XMQf5JnMjQvMohy386mwtbHKkrhkuW+vVVkFX+hUxo3w0qcIg+xncrxwpOt1iH7tQ989qOuwFpo+9q//f2bP3e4yDqqIvKIqGvL+DiJPQsRCTSSBUt7IyOia0CudUOUOmurZx+MJzRpZR4LXPAYhW0H4FUg==
Received: from DU7PR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::27) by VI1PR10MB3632.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:13f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 10:32:00 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::9c) by DU7PR01CA0009.outlook.office365.com
 (2603:10a6:10:50f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 10:31:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:31:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:34:16 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:31:58 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:24 +0100
Subject: [PATCH v6 09/12] arm: dts: stm32: enable CoreSight on
 stm32mp15xx-dkx boards
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260226-debug_bus-v6-9-5d794697798d@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E3:EE_|VI1PR10MB3632:EE_
X-MS-Office365-Filtering-Correlation-Id: e5231535-af13-42c3-6745-08de75224597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	75LlAIZyDKpK8NBvdqy4mNy87hSmyV6qG3xT28y5oBkoqxl7EkL83QFk0JtLchLytRLEhWZ5o46xDaQSXr7EuBoePmQ5m8/oHIAu3WkUasmnu2f3qi1y7RUY7M5z+34GyZkdK7xAUnRvYxYLXl1vkArzsa5Tg9AsAuLTC4Zk9X7qYkdCADbYPT3hvGfG5xlUUjFs8hjSPeX4YzUdOG1sH+XHqWZzqs71Lgb+Ub+SE3f8Xwj/I4D9DdBFAYY6YbRcAnYerlHHMn8wXuQ9vo24XklS9rVyCMPBWftVKd0WCOR/7D+k+BMnmmMmCGkgqiaIr4JOp7fUb/gTpWVKK326ib6drYPsc0SziM5HOLmiDT5aec47zE3NGNTTkRVxzEvkvakFD9ye2Mzx3nnDT/UieinrvFfGTax4ICtBcLPs87XPRerauTWJACFlDDIbXgJEFs24FZLyn5aM5O6ZV7mOJab3JvD+BNKqqPFZHzDR0Mg8RC6V+fSgum/1LcOjSLfCWPq38MoG7uWrcDYv+rFmWMrHnPsZQAcvTV3VMeSHyqQ3yCom1S8/AzGLa0M7bKAhVe9S5xk5VMmEwAnjv/QvS2PD0B0/8pK0Y/gZH/vAsFieflc52aIphmfSuVJPTu++kr1OCwXbjpRn2l57G8t7ndG9PJ7zKTs7NE7+namx/5vk6GlP5mnvVo6iHZTSx2nBbnAJsdRa5t6Aqi0ftEAQ2B9BxeXdEpv4MtjRQOdtN7duBZ6OAR2ee4h31Nps8IwOm5v+jDrvPMyPnmWYWG0WuI0T01BhAjMFVlD7a697/pqgmgRCFr/k7y8QPLIoWngGncAJbl6eB0XKGo+sG8VROWLkVsTTQgDjWfgGJgcApRk=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z0RgT0dQ35U31/V0HF5U/fIxeNebgv9cxtbs4rFwQiWWqquD1qCJZq1lk/XG6Zc6KJmrBux6KL+jd1QCvlAl1xgxRgGbwVticEwt0IhbBoyPkrAnzeykljDcyky02LK9RC6PceZcK/9FGB1ZtLhkuewLEp+AYjjSyT4uEP1dZGB3JCFpt4KkTNQRxK4NefUVhhk3NkBEIri6EOAfeb7pNf9xJ+p1kMeEt6mPrEvqRWLPIpxQZ2v/CxHTMNHbhUfEC8DvLOuIAi7ruLzlUlU711hf4NKTch3p8hcQoB61RBXBzsVozDyeAjiCAGzrbOWfyD+maEM0CeJta4McodQMSjCVLWHBWWHD5GfRTtfq/RHuIHn+eHa2hPfBo/79sAaugS+Y2m+1kVcHg2H4IvazHofOQ1OqaA8pM97zAnClOtJUSw5n3khWJRKqaAj7VBaf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:31:58.9007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5231535-af13-42c3-6745-08de75224597
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3632
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32219-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,st.com:email];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CAEB71A45C2
X-Rspamd-Action: no action

Enable CoreSight peripherals on the stm32mp15xx-dkx boards. All boards
including this file are embedding a dual core SoC so this change is
applicable.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 98b27b5d1311..599ea07bdb19 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -155,6 +155,42 @@ &crc1 {
 	status = "okay";
 };
 
+&cs_cti_trace {
+	status = "okay";
+};
+
+&cs_cti_cpu0 {
+	status = "okay";
+};
+
+&cs_cti_cpu1 {
+	status = "okay";
+};
+
+&cs_etf {
+	status = "okay";
+};
+
+&cs_etm0 {
+	status = "okay";
+};
+
+&cs_etm1 {
+	status = "okay";
+};
+
+&cs_funnel {
+	status = "okay";
+};
+
+&cs_stm {
+	status = "okay";
+};
+
+&cs_tpiu {
+	status = "okay";
+};
+
 &dbg_bus {
 	status = "okay";
 };

-- 
2.43.0


