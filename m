Return-Path: <linux-gpio+bounces-32222-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aN/5IpohoGkDfwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32222-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:34:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BA71A4579
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D36BB302C355
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 10:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4FC3A7F57;
	Thu, 26 Feb 2026 10:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="bzZR7jIW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CD92522A7;
	Thu, 26 Feb 2026 10:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101956; cv=fail; b=jM/pMGF0aCKBDt8GaajISNbaTO6Mw566IUPB4rdCasaR4lnjH9Ejg7mph5mPnIXt8tIU2qYiLZk26lZLhRXyO/bqdVOae+lndWNQYvCItMY98hcBk1JFw1Hm6O9/Ng2Dn76Dzyko+rjOin+3Mnyo7GDEJM53pMVo16faEL1EPwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101956; c=relaxed/simple;
	bh=HN3d2GQzwHP7AIM6xUdYO9TqmnAGVxQwCgmw7jg5xZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=i3i/jDov9ogARsPNPeuqnyI2hIR3QpjZKI8LolX3P8X+8YPsBlGxlJchZGe4Ek5BocffvkOpaijRLzItL3dTohqjbMZKbDBsjiBpNf8pYTviw5k4AS7CAiccwsEb3Qbp/yG5F5OHs8cisCq2s1aKJq+z4vGMeb8XryvRAtTSrLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=bzZR7jIW; arc=fail smtp.client-ip=52.101.84.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUMyI2Xju1FeQiBIgNI7Nc0VbDKMzxsj9LVkMtMA5lHPPMvLAUqgiBbsn/uyiN1+oPZ68EUA4eqL0/4vEu7xSSw4RSjVWDnFRclEob8ZtXcfmPVhVof44U++ND6w04SkFMJja+U9mTofPQ96BqBXAA6IEYtdKVl5PzNWV0zeZN4evcNRQ/3K3ypnuKyY9IzaLCguteYi7IA1vq9lNR2GQgidHR7RqYekvS1NIhPy+klRVlRUnboH2j8ftMJxTfdBOL9Ox71lupAHe8kg/rXCL/9J80gbr/Y128RcJU9d1TEFRtlJWMndfC/L7d0lHg0RJUct7e8CtEz+xMbWkWn6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVs7MxvhdLDc7zG07LLHXKs1oSCI2DtIrJ7yPKs9+JA=;
 b=SK1CmBCTaoXl0i6FFgRujNvyZnRZ26UBHzVcFTKUF3Z8FwmBEwUtqfvNrfegvSKUuU0v5FUdixX5Xn38bqI14KGvaOPWdH8Vd4zj3W0w3eM9hfrTw41sZBoXeQ/InWkMg+FmE5/wbo8JbcqjQeZbsGtuy5YI8dt16BS8c082gM/ufMnzJtd5aH+RIWRJiiPMmX4CvYmqw5Hfrsp0z/JhZcSNPFAATA/mkCWBu0xkw0aioPDIYbp6avbt0avL2J+2wx9R4EzyVFczpLRU2RuOUPVeqK6lutTuQbVkZnVebcD+7ZGk1VrlkL1PA0gjWtxnD5GCVBIIis5vv+89LfEdUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVs7MxvhdLDc7zG07LLHXKs1oSCI2DtIrJ7yPKs9+JA=;
 b=bzZR7jIWiYOCUfWmxMVOVU8c41bOjow89uztINQX0ydY0hIHK/b74yySA2UYQDVqd4SMg/y5L1OxSF5nIElNbfDmicpl41OoXLRpMdXh5+GYEZZlveJX223uhYT6VQs7WHNkNh/TbJspuF3TT4ynxhPBtXJiHR4G8ZoLHjJzsIY+fXdJXoRILCJfghNV9GKeKyP2cu2N1SKHKYcLFlKLYjQOmKgV45Rt3GDxsv/4jvKQ75kgpZ92adkM9aVPUrs9yRT0lB/p8slLG5A08LewydR+KqsFf0W00WtVAIMWWgO87qE3afqoWEtV3q1A/erX0Y4sd4lGBsGXv4u9b6cNiQ==
Received: from AM9P193CA0001.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::6)
 by PA3PR10MB9310.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 10:32:31 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::ca) by AM9P193CA0001.outlook.office365.com
 (2603:10a6:20b:21e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Thu,
 26 Feb 2026 10:32:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:32:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:34:38 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:32:30 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:27 +0100
Subject: [PATCH v6 12/12] pinctrl: stm32: add firewall checks before
 probing the HDP driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260226-debug_bus-v6-12-5d794697798d@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9D:EE_|PA3PR10MB9310:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c53ca2e-b56c-44cb-7291-08de75225895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	IABhZFfhIzsE+RoCy9h4C3b45SSZq0Zba8OzFHhmJS1LAfaOURaEJDVXOf/qliYMUAA5piFqwBElXUOBCiUNuel/twpmSss6NLi9M/6Q01dMzZiln2UAFeLbSCuI6RcMRCqA8LzvbMJ5AVi9pt0RXa8sHL2ddzGqWfYx1KdhfgWYaCed7wEl/X20sGCJ7fyuBTtXkBlAZI8jcgUhJYujSiaojtWmH7MaVStnYra1/IvfqDwy0Zg+XcyOE0LGk5D5oltBQL5ZG38Ijxd5pRS6xcyQO96BOBHSS3ijXC7J3xCXlVsYhEeCpIzcssC+Q6FxEQ+XpES2kGf590aE76jkQ9szkIDrBAgr2mshbjPaUgEjedmpKVFXFmR9OcR0dnMrPF+3pKUm6HYTsU/tF73ExcEPPgY4hy5fVtE+W2Ly9EYIuefO9Es478rw59akECusvRPco+GlxwK4+2Vuyrj7whiRDhkr7JfDU16LFnHukkZEUlJlFovsoFRNE+Bjzpg2tRQJDb+mQNV1tLITk5OaklZK8vkqhdMpMbriA9MJnHW9REdT2rG90UC+K8VFdxjbMlbMx+pu9HrjnrueSGs74hOnu0QDCenWYYVnBRKkFZ3dGRHvyRgTEEnzZqW3eCAu5wvik4w5S3jI5eKZJWqPRc4h9NRi9lNETiHf2VrHfd/9pKgcSS7E2GPbvxhx4xSRlK0MlLW3794DQZmqTjp7hEUe0/bJquPCzBf+8Sr2y5rbyXW5/jhzhuS1z4/UoaA17FxCDXrKwy/eULi6Wm2d0EgTc/No1BfkxlDgau5B4QSGWyvT5TCmai5JChJST68N6uvldtIC2mgTS7qP5C/yXUnjfazPMKiXL/HELoQ7wVc=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1mO2dnKtgdVih5HWHrK/Yrw+ZteH9NgCgB2lm4Pjqkxgjiq7iTui/SFZOULK8IUA+SWrkaUzhpyv34m45t2SqWj3qdgK7CaRYjccljmHwXnlGmnNvINcEFwmi1ucz8Li6DI2e6rigP5WptEKmTbvhDcyX3WjJVjwM9KAEPzK1y+F5qsZYhHZ55u/zkTRwsSvg49CfLUruFqfsU/dgLg6OtA8bJZrNxg1vxtpfAtq1ksff9Pb9CjfyCn1/PvYy7K7+nPAX9I7fkGymR11HPFN2JZS14zKzjwnNDg/9u3rBPwLcBvPCNiX70Ngk+0V76/GAd7s1ZAnFYKBvnwyeqKrLE8P82wpBrHWD2h+RvEg5dX7S91wywpfsI2ZgGABYE9y1gfgeflcFJrWh5DIcS7neHAIkhWgJJ43Rp4+nSGprzh3pVo8dQEjjlkRwgSy9CUD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:32:30.7956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c53ca2e-b56c-44cb-7291-08de75225895
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR10MB9310
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32222-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,st.com:email];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 02BA71A4579
X-Rspamd-Action: no action

Because the HDP peripheral both depends on debug and firewall
configuration, when CONFIG_STM32_FIREWALL is present, use the
stm32 firewall framework to be able to check these configuration against
the relevant controllers.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Clément Le Goffic <legoffic.clement@gmail.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/pinctrl/stm32/pinctrl-stm32-hdp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
index 0b1dff01e04c..cce477e86ef9 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32-hdp.c
@@ -4,6 +4,7 @@
  * Author: Clément Le Goffic <clement.legoffic@foss.st.com> for STMicroelectronics.
  */
 #include <linux/bits.h>
+#include <linux/bus/stm32_firewall_device.h>
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/generic.h>
@@ -46,9 +47,11 @@ struct stm32_hdp {
 	void __iomem *base;
 	struct clk *clk;
 	struct pinctrl_dev *pctl_dev;
+	struct stm32_firewall *firewall;
 	struct gpio_generic_chip gpio_chip;
 	u32 mux_conf;
 	u32 gposet_conf;
+	int nb_firewall_entries;
 	const char * const *func_name;
 };
 
@@ -615,6 +618,13 @@ static int stm32_hdp_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	hdp->dev = dev;
 
+	if (IS_ENABLED(CONFIG_STM32_FIREWALL)) {
+		err = stm32_firewall_get_grant_all_access(dev, &hdp->firewall,
+							  &hdp->nb_firewall_entries);
+		if (err)
+			return err;
+	}
+
 	platform_set_drvdata(pdev, hdp);
 
 	hdp->base = devm_platform_ioremap_resource(pdev, 0);
@@ -670,8 +680,12 @@ static int stm32_hdp_probe(struct platform_device *pdev)
 static void stm32_hdp_remove(struct platform_device *pdev)
 {
 	struct stm32_hdp *hdp = platform_get_drvdata(pdev);
+	int i;
 
 	writel_relaxed(HDP_CTRL_DISABLE, hdp->base + HDP_CTRL);
+
+	for (i = 0; i < hdp->nb_firewall_entries; i++)
+		stm32_firewall_release_access(&hdp->firewall[i]);
 }
 
 static int stm32_hdp_suspend(struct device *dev)

-- 
2.43.0


