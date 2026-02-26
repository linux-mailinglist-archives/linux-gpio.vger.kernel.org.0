Return-Path: <linux-gpio+bounces-32215-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOVoECwhoGkDfwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32215-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:32:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 941881A44EA
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDF9030957B8
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 10:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C08E3A783A;
	Thu, 26 Feb 2026 10:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="XbPR2OUO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011033.outbound.protection.outlook.com [52.101.65.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D04D1946C8;
	Thu, 26 Feb 2026 10:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101885; cv=fail; b=PSuGysCil8VuS/Fo/rq1Z11kM9ihArZ/BZQZWcCFIMslVyS5phYJ9+gS+4sGSRwiX8+4MwugJGKelKaBCuFWlLr61PKSe/6jtsumUHQAZe1rm6swCAMtw+fUFbWbny4isLf7wp8ucjAb9bG/zRUdLEBhrdNhZ8u7h1gHcmioVh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101885; c=relaxed/simple;
	bh=XxXmuJunmmI7TQJrJJeUE6HI3hXEt4Bjw4ry0mHYzAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=j6qa3iZKUsAYm2q9KpkpIUnVooqOs8Dl4auGi8iB3X/DgiwC1yx7P1O8xYHNsl0q8z16F2m/VESC1PNHDozGb72cGvKOSMQ11PWJpxOivDKvBWPtmEps2s9JU8dk6pjc+ymVvGQDtQrQoJQUhIpzk/Xs83XqlmnKSb1CgNaVZXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=XbPR2OUO; arc=fail smtp.client-ip=52.101.65.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9NJRDpzOTU563nIPdSVPlpsXGeIEFtIx1m4wPnnUqeqq9w5AI0LcT+9lrXqDDH1xueinqIclZD7XxRZDRz5B+3k0z0zOIwh9fDfbC0S9rVFMp0nTDM7dtyjkFDouDyumDL6udrXX68c3Zmc2cKBnwXgvkJ9goxn6qtNUOgRW+Bfu6JGQRIIRct9+nAQLa7XOgAY+dAPGkBY23cXPjKFhCmX01e0ilwykLYOBRDCEjWVZpyuaKGy2op7gBXXjQHsrSKS7HVPVSJl3X9M11tt2q7QlMRcWePNiFu+7PiT0B9D/rbTgSy1593t4xZ1JUO6I5JBoU8lOIeDvwuClIx5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTxY4vaHvPhGf09cw3rqjyoTFV1wj4Y/GHYfrTd165I=;
 b=wp0MOvLMquGaqalWRCGKwTdpD+CubY8fdzKfC/x24+6gCLXQU5GlfrB+iDYvXPkxTOGZtpsQf6uMiNvmtfeFA0O4lx2ogd1cbHUci/kuxYv3St1iwtlwVjYd/ao7/E1vnepjMkavP1YDXTdT4yBvtmkYaMCZUV3eaBpE+H8W0hrc85dx7v5gx4ByrA+jU885NPlI76X2yGWXd/2rMhDQz5cs+ot0wNlbSPdZFy7bAhNWrJBwSDky50NIwKf5qokxl6DoGbu+yW2NuvDyPlvY3RYNMFY89/WStizBhfUNZ6l3dN6ZBWcccxwCAsf71C+j8P+6pTbBo1VdCNAnkEFC4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTxY4vaHvPhGf09cw3rqjyoTFV1wj4Y/GHYfrTd165I=;
 b=XbPR2OUOQFS3pkHvHmkyyZZvQ12fO21zHPov7Uyav+mUvzKjfAy540bUBftFiJ2XQQBFq3XgtwMfb+behFuKCpJle8cqXBQ62PtFDDvNbnN4QKfHEWbSZ+i+VTMcOuLFFpGfocUiFSPKv9B33Hqn/RqwQVwGy6JWsGL4YUmX9O0L9EfOEDTwl81/TFYvdp+lDghU0CzKGQJ+5ojA9fSk+bij3/xq+1dNKCcdYnJkD/OCUglEqc+w1mHgXoGWIsz/7k68FEJEEFK9GIPRTTLoMLAMWLHmbLDtSfPni0Valnb551IjZK0orTKSHDJeomt42TCClmrUuqlrqgz4moR3WQ==
Received: from AS4P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::11)
 by PAVPR10MB7418.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:300::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.24; Thu, 26 Feb
 2026 10:31:17 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::72) by AS4P190CA0018.outlook.office365.com
 (2603:10a6:20b:5d0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 10:31:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:31:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:33:23 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:31:15 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:20 +0100
Subject: [PATCH v6 05/12] bus: stm32_firewall: add
 stm32_firewall_get_grant_all_access() API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260226-debug_bus-v6-5-5d794697798d@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA0:EE_|PAVPR10MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: 2516629a-1593-4799-a2e4-08de75222be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	+gdz2V0pZutdm2PFVZVcU7lMYjOGcAae6KsfpQA85PPxadI6x97rswqcueWkebEE46p8ed0EeyPIP/bmMW498SSqQI4Q+uVuP78EVn4BBYaLB8yKBlfNt64Cl8F7paAjbflsbpquU86AsUSG9P2My6nG68Tv5E7GDTlyc+rPDThTAYx4qpeCJFoZ4nipIEPAOPnc1F7jdG0gibUJqU45ffh8nAH39ylFp2vmvTO8LFcglsRAysX78d95/la9NnazFIeCPHYcIo1BvJIDC2Ks12kMMmmqnu43RI+9HfvtSUZJhr7VX1qwQfR54VY5XnGlUhxvg+GVFPuC9kwGkXHH5IOMTUcwIBec/vHzQA7xTx6Q9pQvGWCz2lsei7+vZGAT81eirWPIoldfPFNqB8qpzB7jegnWEiN5E/Wb85FZrOGba9MbUNb6bNdL7/zlvE6J5e5GLgJWZD6KYlxVj4d8dSp5yUJCYWwxudZ8kdkn9Vzw2n/wttdFllQKOgxrvCIcS3gyRk0KomsyeQ/3jFSi6NAAVgEEmxWG2pqMuDhULbXTjV42ddorpGLLGePHZl+rT9rnBnAZEHKntu1HrB2yExCQF8FWpAP0qmHGpwfF8G+6w0N6ue2uwCinZH46EBIU3EZaeawlY+FNP20BsruHhl8ovSrNuAjKr+dAqFI4boX43qlFA+lNbI8kIvx0a3QCVtc6he4x+2wkbETK6OExwVZHRm70pu+pyMg/ou/74ZUKIdLT8MTi489sr6zBJ81PARfDsOgvoPVOyCUViFSSgZZaYJGVDm6ecSuS3OVDTv7Pw1JrqHm1FhfZ64opVasX+IHiXUW9Pg4N0/FkrzSRMN0P6/cfBQ5/npmkutbYzmg=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KEei1739pH0oF16S+OcR9h0kOgEMcQxS4sVv8oIjsmeXpEVkPazClK4QkjpXrEaYyVrFbEX3t1blvLFDeRhkzEOtEXWQlmvdYGjRExG+SSVv9iO2c/NtuxE0PYPN7Uc5bI17Xa3Rau33MroL7brQMnhYe+mhXRrd/Zks+o2N9e+kgbIkW3N5mRLmz1o3nkDTgsR0e0K2YaNw3a0O00xMPaaKo9Kzukd1jnI7JeyZCWRhzHelhH845WvUYb6Vm2advwtr5oJbU2cd2/Qwar3c1d+dih4hR1nnz+SEv9clKghqodrWa0pWrJv2RliKhjXtlEn72VHrPBg9lNlnRCaB+kUA6ieDW3l+PRNv5exej/IZJOXVC+acvQ7Jwo4m1vj7wOX5d6OkDxRCMoK7nw1A2vzJtpqSQ1xSvvrCkrRxKrpEISIZuNQyopkNF7/kB2cD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:31:15.8022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2516629a-1593-4799-a2e4-08de75222be3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7418
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
	TAGGED_FROM(0.00)[bounces-32215-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 941881A44EA
X-Rspamd-Action: no action

Add the stm32_firewall_get_grant_all_access() API to be able to fetch
all firewall references in an access-controllers property and try to grant
access to all of them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/bus/stm32_firewall.c              | 42 +++++++++++++++++++++++++++++++
 include/linux/bus/stm32_firewall_device.h | 26 +++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 41cc1e7190ed..0b22b8e2fdf2 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -185,6 +185,48 @@ void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 su
 }
 EXPORT_SYMBOL_GPL(stm32_firewall_release_access_by_id);
 
+int stm32_firewall_get_grant_all_access(struct device *dev, struct stm32_firewall **firewall,
+					int *nb_firewall)
+{
+	struct stm32_firewall *loc_firewall;
+	int err;
+	int i;
+
+	*nb_firewall = of_count_phandle_with_args(dev->of_node, "access-controllers",
+						  "#access-controller-cells");
+	if (*nb_firewall < 0)
+		return *nb_firewall;
+
+	if (!*nb_firewall) {
+		*firewall = NULL;
+		return 0;
+	}
+
+	loc_firewall = devm_kcalloc(dev, *nb_firewall, sizeof(*loc_firewall), GFP_KERNEL);
+	if (!loc_firewall)
+		return -ENOMEM;
+
+	/* Get stm32 firewall information */
+	err = stm32_firewall_get_firewall(dev->of_node, loc_firewall, *nb_firewall);
+	if (err)
+		return err;
+
+	for (i = 0; i < *nb_firewall; i++) {
+		err = stm32_firewall_grant_access(&loc_firewall[i]);
+		if (err) {
+			while (i--)
+				stm32_firewall_release_access(&loc_firewall[i]);
+
+			return err;
+		}
+	}
+
+	*firewall = loc_firewall;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(stm32_firewall_get_grant_all_access);
+
 /* Firewall controller API */
 
 int stm32_firewall_controller_register(struct stm32_firewall_controller *firewall_controller)
diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
index eaa7a3f54450..6c878f3ca86f 100644
--- a/include/linux/bus/stm32_firewall_device.h
+++ b/include/linux/bus/stm32_firewall_device.h
@@ -112,6 +112,25 @@ int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsy
  */
 void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id);
 
+/**
+ * stm32_firewall_get_grant_all_access - Allocate and get all the firewall(s) associated to given
+ *					 device. Then, try to grant access rights for each element.
+ *					 This function is basically a helper function that wraps
+ *					 both stm32_firewall_get_firewall() and
+ *					 stm32_firewall_grant_access() on all firewall references of
+ *					 a device along with the allocation of the array.
+ *					 Realease access using stm32_firewall_release_access* APIs
+ *					 when done.
+ *
+ * @dev:			Device performing the checks
+ * @firewall:			Pointer to the array of firewall references to be allocated
+ * @nb_firewall:		Number of allocated elements in @firewall
+ *
+ * Returns 0 on success, or appropriate errno code if error occurred.
+ */
+int stm32_firewall_get_grant_all_access(struct device *dev, struct stm32_firewall **firewall,
+					int *nb_firewall);
+
 #else /* CONFIG_STM32_FIREWALL */
 
 static inline int stm32_firewall_get_firewall(struct device_node *np,
@@ -141,5 +160,12 @@ static inline void stm32_firewall_release_access_by_id(struct stm32_firewall *fi
 {
 }
 
+static inline int stm32_firewall_get_grant_all_access(struct device *dev,
+						      struct stm32_firewall **firewall,
+						      int *nb_firewall)
+{
+	return -ENODEV;
+}
+
 #endif /* CONFIG_STM32_FIREWALL */
 #endif /* STM32_FIREWALL_DEVICE_H */

-- 
2.43.0


