Return-Path: <linux-gpio+bounces-35309-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDioNaxV52nz6gEAu9opvQ
	(envelope-from <linux-gpio+bounces-35309-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 12:47:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85676439B7F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 12:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE1DF304854F
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 10:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E451E3BD631;
	Tue, 21 Apr 2026 10:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QSdvTkZF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010056.outbound.protection.outlook.com [52.101.56.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4223BBA1A;
	Tue, 21 Apr 2026 10:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768263; cv=fail; b=ZsJQCeiAuxEAid6Nndh0qKW+5OaDfJj/1RFlYFN5WKU8kY452FRHwqNQdKhOMTHqW4ykwO8UiYAzVz29ytayNPF+6HxgN0FPUjYmXKw7qiCvfMq3KOXuh1J86hD9Z8BsR4REg9tDavnDrEQ4e55dJC6pwB6PhUQrOLMrDcj67QA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768263; c=relaxed/simple;
	bh=/W3adiaJIHTMAOR7jebYxhonWpYeMalvRq/fyNqQF20=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PlK0SwMK0bTKt00GKmJb2Kfs0AzZ+mcWqq+s5x+LyhQgqO5UgGIA/1F1b682LFduWkHSesS0z2iPEh6s4cv8g05RLhIAX85S7Vs3owl/Xfi6rV5JXYEqw5g7OSMj3ILFrQlGaj1EIJv/xdul5Ee8QromkLA5ZlvIfrzLkY2l2bQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QSdvTkZF; arc=fail smtp.client-ip=52.101.56.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jY/R0CAnR0VAPFMiWwaC6MoiiJFFfA3tYtNKIlqns/8uU9aHtSjYQPZ/3MNYMXkh8xfSHqHKhKOTYFZUriCac9Vx6kyXEIPrX/tS1TMi0MxS7368w2DpwXsy29tFBai4Lry3VVta9Dxg6JfwzSILkMRBEOUgKtDzHwzSs7q8YDrvaISnaTvpPPeAKTtnOGoVjyLyyp1bZTx6GARQy7VhwyWz79MoatD58iVGz8qv1SiwXQ3O4/7qSb4cJYduo1M+qFEnOw5HpalKv5ohLUDBScvmJbtxCX//V30kBgLfDqgUHhAvFMs3fQA+TXOkXKsFb57S9x/LzpyKYjAMgoyx4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQjSFOtTJNrYdGDQ7ird32XsXrO19nnw8Bic4tgbNUU=;
 b=ODMHEI7wtDkc/4jklIcQlywATWWryghng1nG/+sMn8Wz6b18MzjlMdqnOs7h4+ebUEu8S4KXfAbdVDwCKsSEQzLdAHceH+W5TFmb5sJD5WAA0e7LOPXFxG5QwHuP2fhuOxKFGb+sKwuSmaW5IeYVKBIsxNSWv5RU2sv9SU8j9VanWa79mWV42m/Yw7p3szLfsD+47tognRq0XjH5L+NDwqOTyph8LO0N3Xxivq7wwU5IAE6E2r+Ve05xMxHE225yZX7cgBzqho9+YvYiB1q75DpeRk5b4qMhqPJ4mgjbHpSTmmQwfcS9K84jRvMvxfd6xkBXDoAhW3KYkpVB4UrrUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQjSFOtTJNrYdGDQ7ird32XsXrO19nnw8Bic4tgbNUU=;
 b=QSdvTkZFqj9pYzA+uxbXlhEd2BUcRWwr1Q5lK1C8ffrkbRswJuIrad7WPfiCki5zNW46aPfBeIoyW4P2Ul6wyLYetFMHAWOdbCZP+QNTO2zN1lrVBctfqYQPxekMyj8Yffxuw12VRYZUSL8Azt/1zSCZLOTbAYfKe0RgZcsSvgE=
Received: from SJ0PR13CA0055.namprd13.prod.outlook.com (2603:10b6:a03:2c2::30)
 by IA1PR12MB8540.namprd12.prod.outlook.com (2603:10b6:208:454::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Tue, 21 Apr
 2026 10:44:18 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::4c) by SJ0PR13CA0055.outlook.office365.com
 (2603:10b6:a03:2c2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 10:44:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 10:44:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 05:44:08 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 05:44:06 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Apr 2026 05:44:03 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, Michal
 Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 1/3] dt-bindings: gpio: zynq: Sort compatible strings alphabetically
Date: Tue, 21 Apr 2026 16:13:56 +0530
Message-ID: <20260421104358.2496125-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
References: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|IA1PR12MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b91f433-3f19-4219-7be6-08de9f92f0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fvBNT5E9Fd7GA7x7AgpGjkz+ZvxWk1RzD+In67C1tk+ZnDqtw7s0445hOiazUb/j2f6foP/QzyEW59ysTBQXZAbyNUiPDt7d2zwqs6YuvvKbAkxNBK1wflxjpF07lSIVUzyC+SvMHl01Pm/G90YJxNKEVDPhlOB33hiniMQDC9UcqqxsfcENIkyNqAF5tk+3r+/Y4nJjypmLB3rHMgqqLjsMylXBPddQjQ48lpSvCJAPVxdKWg/7OpiGM6T6QikEuIACYruOhCVQ3a8jRmRWX88DnzFN4jrEBzkzIYcMimdZtDfXM/yKafT2P4HgpC0Dzbzfg9CHSTv6Vqbeeie9+Npga4AEWmpq8/Q1DJ1lGediFBupyK7PgpIyhVJgXzKG4+aeO3sI6MaGRu6LkQeLF0L3pUjg3qAydBoEpGEQa/Zw+snHgB+UkNH+OgehoRi5C91sl1lEac7y5i4/XUAkK4kmFMFyjADHSpUHvlVBty8BVcUKtaqVA24S84BHSv+vWB8gtCoE9WF+Bc15EoFEgv+jtgj2asDRkEzl3iHxEik1VahjzSXSozLOH3E2M53YG8phkPBusufgvYr6gQ3b+oNAOMAiQcNdUKtK7IHA6WnpfozzvR4qa17d6dE3NZrzO3P25Got8r+RsaxJqTzxFi/QjPIw0Zs2GfDhnj8+lMgDKDqY6ubrd+t4m9jAVEz380Kr5vmgRKwjkljI4fV0w+1Lc5tC1g3NXhk+YrUov+x7rzwI1JXu35ThLLFTXITLraB+qpbQ9bcGymrE+K+oCQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6lcfuv6XA9JERGrnIbvRQxvHKCwHfZzxu6YwGg+6IxBnutUjklYjHAxzzvm1Em1tcjEGLBucYJUnlfd05o62TKusK8742I/5oB8nSmXZnHZqi7BmBQk9inrMe+ghX/U0O4DdZW6uGSEaGRTKEraZuzm1keu39023D4F4hbPLtKGh717ISo55U09FBHj+O4ZY5eEVjAg3nhpak56n6162Tp5Z0J5BzZy03RYWoy0h3grpdvxOs7QnV4jUJp6q7Z3gt4mS0E2FGvxekwTqgPQkX58fHEJA+RnJVYGEXZejLaRYXQPFw+USxY6gp5l7NR14W18EOIy0+9K2dfmaK2Fg88Wk7xz1BJLP5NL5Pyos1638+D6m+oWq5Y4+iI5I+ozsuZWqT6VnpJTY1a93fL+OyxEVcZuaiS4TOY9W5Lv0rjIdLnIcvReTCE19Sv3vB6Sr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:44:18.3713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b91f433-3f19-4219-7be6-08de9f92f0a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8540
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35309-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shubhrajyoti.datta@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 85676439B7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sort the compatible string alphabetically.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v2)

Changes in v2:
- Add new patch to sort the compatible strings alphabetically

 Documentation/devicetree/bindings/gpio/gpio-zynq.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
index 5e2496379a3c..30a7f836c341 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
@@ -12,10 +12,10 @@ maintainers:
 properties:
   compatible:
     enum:
+      - xlnx,pmc-gpio-1.0
+      - xlnx,versal-gpio-1.0
       - xlnx,zynq-gpio-1.0
       - xlnx,zynqmp-gpio-1.0
-      - xlnx,versal-gpio-1.0
-      - xlnx,pmc-gpio-1.0
 
   reg:
     maxItems: 1
-- 
2.34.1


