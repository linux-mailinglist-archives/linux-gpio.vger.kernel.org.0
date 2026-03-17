Return-Path: <linux-gpio+bounces-33604-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IABaCAkouWkAtAEAu9opvQ
	(envelope-from <linux-gpio+bounces-33604-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:08:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6CD2A789F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 78D67303052F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6E03A6EEE;
	Tue, 17 Mar 2026 10:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="MbXUfb+B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013049.outbound.protection.outlook.com [40.107.162.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960913A63EB;
	Tue, 17 Mar 2026 10:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742026; cv=fail; b=Rqmc7iAOJhRZbSAMzYu3T8H5s7B2u6ddWHuvimngYrHWv2vsgZPuNaLUZ6aI0Xy19280h+BKMTMz+zGpeJWK90y9TAhSOBn4TAQMt25cQN4erdOEBEWfbIzkCb7mMZGPzSFmIe/xPvWC0gSj4ojo+c07v87RYrtqP3eNvX/c2gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742026; c=relaxed/simple;
	bh=5W/8g3hrAig8hmLY52e9T/FlyEHJnnqFIUwUSYeo09M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=pEW8ASSdtUM4IK5Cm1XiV0Q9KEgFxYPqt8qaJCEClozGy1A95bWNsK7ZpESa+MUVnC4etYVpeDAT14MMKOHPoWscPVZ5P16bTx+KEiABXhEOhJBmlBsC6u68EZYCjrUMFy96OHXqJCt6/D5kddXO3DtwCaFOR1ohuyMWyp6ieZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=MbXUfb+B; arc=fail smtp.client-ip=40.107.162.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQoKe1yza82N0eWKoDBs9FzjXdxFptEApRRFF2z1usCx4UzzjAi80uNDF7ur2Ov6zfG2w/z4gJvE8y/jJR6hXdBvlX/TC2YIAU/HZGkhjIduxeUv7NI/SoH1Z5DnE3TYc7oq8F88fsnj0i46p2b4bh3Ub5CfbY759amXlGLUZouMLn4FYuK7FidZ3I7OTT4ONc8bC27BNSD95FL8/QJFjYYd9ZAt9se1SIBJ3lcUR4WhuKSG7f3NBg17zOKa3dETRFjqotCbzBs3MsvomhLnDIB2UnmtV0TlWvugibj5WjFuLojtlNVQtRTYMt+zTnPtrMK4n9yGqT2jABn0M5I3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQuzm+PPYf2abM/LhGMDylnHAW+6IZOZ+MJBp/JIUQ4=;
 b=RRYizxjJrTUQyYwIAAt/YYdiGM0uQ9Vu0WPtw51s5i73ONsbbJuyghZgPGmrnJ4Jqm9Ij74vKStMr69Jo8mRCEg/IpcKsSBkT4btjAxA2/bOeHyRC4awtYgHyrIMmzNI1kmxuK1x82tTEHtnDgSuveUlidgUj55yRDYC9vcFNuhZhUFhuwpK0MKQkGM1lTvh2Iw3CcrvJ2sw5QBPvC8Anz08QJfsBzlrTimCf+T3ydHs80Md8osg4WSEYN1pnAwilWk8tZB4+1SPr278ffuTFEgqXOzjnPCVcNncOCa3Qv+FfIUNCoDUHlz3wcgwhuJLYCkv4/6p1yUzS677CDa7bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQuzm+PPYf2abM/LhGMDylnHAW+6IZOZ+MJBp/JIUQ4=;
 b=MbXUfb+BJ+ujH/E5MD5DokjqvDst704Z+mnRjLM2S8yN6v5Us2RrPYkr9wHt5k+CrUQgBBx716kYIYmg6YNN8md9z5R/FBNRxREFo5jvltucPV1viS3lTYc9LJpr44nhHRNvL5L6DP2lXlKpd3iEF8ti8F/CI/QcB81zVa6/D0rYhqeNzFLgf4nnlxrnMZNk0NVqih2V0TMfF8C0R20pn+Ovlr9d/sHZMg7Tdpj5NXll16AKbUqKh5SjS1Yr4g6hVC4T2xNQ2SENWVcNm9KaOiAac3/fAENTHsXj+jh/KiAeKabsV3pKZlk664uCr1qSdRtTPUsAs4P23AiKAVFj8g==
Received: from DU7P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::30)
 by AM7PR10MB3509.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:140::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Tue, 17 Mar
 2026 10:06:57 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::b) by DU7P189CA0020.outlook.office365.com
 (2603:10a6:10:552::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 10:06:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 10:06:56 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 11:09:30 +0100
Received: from localhost (10.48.87.205) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 11:06:56 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 17 Mar 2026 11:06:54 +0100
Subject: [PATCH] pinctrl: stm32: fix HDP driver dependency on GPIO_GENERIC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260317-pinctrl_stm32_hdp_fix_dep-v1-1-3a6f6f02eb3e@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAL0nuWkC/x2MWwqAIBAArxL7nZCPnleJkMqtFspEJYLo7kmfw
 zDzQEBPGKDLHvB4UaDTJuB5BvM22hUZmcQgClEVktfMkZ2j33WIhxR6M04vdGuDjrVK8VKq0kz
 YQOqdx6T+dz+87weLwESdawAAAA==
X-Change-ID: 20260317-pinctrl_stm32_hdp_fix_dep-94415345dbe8
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, "Linus
 Walleij" <linusw@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski
	<brgl@kernel.org>, Antonio Borneo <antonio.borneo@foss.st.com>
CC: <linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D06:EE_|AM7PR10MB3509:EE_
X-MS-Office365-Filtering-Correlation-Id: 2882e7d5-2255-4252-c604-08de840cec3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Ow/g/BcdkWV71WY+AORFAjWRQWOFZ9FcKER0f8YQhDfDo9G4JxoWL2EOvU3ewQhQnnV8qTb7w+tjo9lTmk7QXofmdp8Ap+foKQbfA79pPDZyJIChr0qTWkxd2IJ8kWieKP/+pFi1P7m9fFdPa2pPQsbgmehqMHPauyZ3V7nGB9xzzuqbeCB4GfbVKML6ybUG1CUnhlae5CeMm34q3kac8PtdGmsjxUp/DvAJJL+BooCP4mcw1G0NlUmb3AAIgo9t2vfMsdfYULeBb5R8f59TU1JJ2hDrSbmUzF0OnE7Oqxe2UOGP+5xwZmP7/Sj5ckpV0zUgdkPBMMZ/Oubo2TJq6m9uFq9vX+bIqIe3dvVN0NpXKYYrhmll13sU7wtuR75KPull3OvT1vKs0iV7UE3kSfMndEsQGJ+b+8CpQmqIxj6LD8j3U3hjTNY4VORpu1CZMpsvmxW4z8byNLoRM6zGYuewqUA7IP17bdOMMz9vHjka3x7YeOS+t+N9iLSr8iuwPCquoY6USGyX4o9XrgwelXXfUWSq4eT9b61i+l3En+SENApurjusegG9KkIY/twUet8pvG9tVqunG1ST658viaz4RJzs9c4glPe9SJgCYz8bXqa1NVjKrkpO5dPy7VvuqnzHfHsLGwlRhVJSaRDE/StzPO16YATUXcOF6FEWjZAtMorbkVlzGr4XfFwcM/SvQ5RWleVbTFffGp3aMBxNX6+AwB6ro33FKO6WcUPnl17HgCmQ+wA4MdOjO7528ZpfH7xTjdVUuKA5H7OuPslO0Q==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4a30twd+eZ+cr8u6kUUKx/uNCqtlRpmvl6ONuKIRRT+NPYh6hsDMW4nbZa49D32V8BHpE3PeSuWYP0e9z2ydmAFVF3FpFcGYXUS2Vs28tqu1Eg5Ll/brvkh88e2+pCcJXWyJyH/QSRU+rnu2IEKST0NZwW+/dt1A8AGiM2B0/HElvS7GeXAHycL+GlP+rOtiwRE9VVbG8aFQnAF3TmV9oq10+yZ81+ngDwuFw6nuQv36W/njqgnrT2C9rfrhg7hJ8RBxxaGOJEJ5FJPhnit0M8Hf7e1KrkKJQBKCDwR2iTzzRzgApYwFIBCkLyXd6/OWxtuvvWDXGzSR+GoiY936SbCxsbC5uoKQM9SqUl6WZssGDKa8N5JSJlp/Tj9cILg9y1FqYttYbBYZiwruMIZ7UB6n1NQ6D1dDWcEOLDB1KLljOxin6yQDTH4LMXjscKm1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 10:06:56.9827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2882e7d5-2255-4252-c604-08de840cec3b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3509
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33604-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,foss.st.com:dkim,foss.st.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amelie.delaunay@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BF6CD2A789F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The HDP driver uses the generic GPIO chip API, but this configuration
may not be enabled.
Ensure it is enabled by selecting the appropriate option.

Fixes: 4bcff9c05b9d ("pinctrl: stm32: use new generic GPIO chip API")
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/pinctrl/stm32/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfig
index 5f67e1ee66dd..d6a171523012 100644
--- a/drivers/pinctrl/stm32/Kconfig
+++ b/drivers/pinctrl/stm32/Kconfig
@@ -65,6 +65,7 @@ config PINCTRL_STM32_HDP
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB
+	select GPIO_GENERIC
 	help
 	  The Hardware Debug Port allows the observation of internal signals.
 	  It uses configurable multiplexer to route signals in a dedicated observation register.

---
base-commit: 263447532463cf4444a3595e835b99a4e90952fa
change-id: 20260317-pinctrl_stm32_hdp_fix_dep-94415345dbe8

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>


