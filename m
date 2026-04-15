Return-Path: <linux-gpio+bounces-35162-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FHRAB9v32nqSwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35162-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 12:57:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D4B40377B
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 12:57:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90A503033D2F
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 10:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD5413AF2;
	Wed, 15 Apr 2026 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="02tvjP5y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010065.outbound.protection.outlook.com [52.101.193.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B35348896;
	Wed, 15 Apr 2026 10:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776250612; cv=fail; b=sIngp4UwABHhRceFE15ZnFUZYp1ev6smN0D/+0/KyxQr9nt9+1hOaY6kYfBbkNPzdYEoa4JXRCnVoQIXckpxPETgiiivgeAlAz6QQb0O/4fjFp4RxBvUI3EudnBiTquSKPZ4aY4UHGJGZEmdlNvo0bpX1lAqwmJB7xiu4C/2Rf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776250612; c=relaxed/simple;
	bh=Ess/x80IvFRUDccl5slJ7kQtvznWUFyxElou7cVb/a0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oB9qEOBhsVRFFg+dTlpxUawVV0O5voEwKs5yBxRTr/r7OLmobxf9ANco9B4C/vyDTdlpokRa2DNRb8qej+wnvzLtX7sCXbkAknfGC8wNUMhwkBhlpD/lJlFL6X2bacvw4ebPOtHJ9D4fcK8jaZ/enxLKZTplOB13klXaHbIpO1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=02tvjP5y; arc=fail smtp.client-ip=52.101.193.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feMAWm+AbOtCpojWt2XxYcjJIXc+ZVklRkcrlEAOhP7LWTaXKNczi2h1HnKxwt34bemEgY9+6+U3olIR2NHY0/J0oNcu1CRmOS6nZEG1nS2iJ6JzVkeXiWFmPkXUX/2cXOqCC0sQkq6TxVL1rtjAtwpPTAkWokuDG0ueNPf3wQuh/QCupDeYDcFr6MSwCW96R9KSC6mFSoFqn3ZhgI5RVWF6KF+rF3Wac05IziyY5m4y2G/gyACphmePPI7gJ6VFoU1D3DzoiS14BrTEVuNWtsJ2STUh/Jiq1WODwoGv8Jw5pnXW9RSZHeLnGQjRqd3YMMbEaLbJni8BvhVGjFHouA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrLSGcagcVwgtnPXEm8RjRDGKneiPU47M6rz9TQVWzQ=;
 b=tdb5ubXmVQJRR+eWtRZRnY+nuW3WOumF+ecG6K4+O1eiUgXLNNRk7Syw85TbzVF+IRZM/zH0P7SjuJaJzGNPWI4ywyBG6+keZUWsjIsvNDAQxuXNsAp/UyaKgD9pi/fFzWfjI11YUOTipyLw5Es9rZl8Fw/S6hmt4BKiKCPZHZUyI5h8WYyynjr8+0lW5X5mzbzXHJONwKznYNeg1L/A57Pc1cf3O5sXGG2bZdqZT3tayFmmvuXyIlkt3MlECpfoq8d6l7QHbKh8qfpN8Jq0NjZZiRnRkODsUmGEPaO2zWLOtb5DXm7D7QwzVVfppaNfPmZkkZxlS1/B/EgsZNaDBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrLSGcagcVwgtnPXEm8RjRDGKneiPU47M6rz9TQVWzQ=;
 b=02tvjP5yEk/GCVxQjjgGUnmfzLn+HcH0acCtKmfB5Bn5MhrQPAEff3gXzn8n9lz0kzBIbeGO1of4pzxv15pxT34LHgtVzNjVi0Qq498s+wkNIWbQ4H7MwiDKgepWjp4dhhZBdBcYteA++Du9l1G0oIafEy76WCxe1KqO1J8tObo=
Received: from BL0PR02CA0119.namprd02.prod.outlook.com (2603:10b6:208:35::24)
 by DS7PR12MB5960.namprd12.prod.outlook.com (2603:10b6:8:7f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 10:56:46 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:35:cafe::1c) by BL0PR02CA0119.outlook.office365.com
 (2603:10b6:208:35::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Wed,
 15 Apr 2026 10:56:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 10:56:46 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 05:56:45 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 03:56:45 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Apr 2026 05:56:41 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, Michal
 Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 2/3] dt-bindings: gpio: Add EIO GPIO compatible to gpio-zynq
Date: Wed, 15 Apr 2026 16:26:27 +0530
Message-ID: <20260415105628.957689-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
References: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|DS7PR12MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c596ab-2c75-4d51-d556-08de9addafe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700016|82310400026|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+MrHV6JdjLrCrxY/Z7Tu3nB21oCtXWAYVSxEU5nuuaemxFCeKB54uQMy4dCmEB2Q5VMWkA+VqfvCdsyfv4/QobBxhrpZktvhAHp0QDgLwU9ptDoxTl0K+4DUp0DdVavgwHdayJceZ/zVw/0Kdy3jaZHyHPM7vcBS8vlImPkHAQrDAvrB9+8zYe3DctiLhTvZmHP2DMNMnO7MP26rnamjZJRrzD1/JwojqQHpYm+iiDg0y5HneePoHjj5DTVae30U/b9Q5I9bIDhhIrgIozXVmc6kd+t0x8szeMMLKHErWMU184qe3EwZP1gNpq8Rddeq+O+3TZAFi6F/fH4h6fUUIP9IUGs8RFQ0mSovJ1WRdWnJezPH0SbXtcu7tTW6pbKtvBku/YvUbfjPrAJbM8fve6i8aB81riA/Gj+HDstbPg3sYtUUYlpnfPun65Pr04ZniUkxbEQWoSONhCOmOpqA8t0MDJAsNmh3wVXMqSN6vM2A4+N5o4YQEIChDSCOG9tqWlb4TrkCDDnknWgPdsMqV1y0rxjnFIa1REOnNgsdYaqoxHG2IRcUy7EIoJg8O9PfKkY4pd+eapYoD4eXMl5hZPt2CvzKnpkenAHouKMGjrLeUtQPSBwMLvzqru0qvRQHUsxwJJHW06i88u/PD8RoyjGVu8N9sLGl77PPeJc1zs6Yooz95wIKkZarlZ6seQiS+++WYjoVD6YCNtDUBvrzGZLg7s7GHCmI86b6gfCe59UIFIOqoaIkm7mkpPDhpMUvF1CrxIGOoOCFe4NaN/9KAA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700016)(82310400026)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NIep/w6h4oFbDkwriCKAOm7kaTvKPuo/o44etl6AwYFCkkv/+KeVmfS/qfDo8B/MLfhbEA2GcUoXdF3gtlOA4Fn2t9ssa/H2Vm3bmlF3q7l8nS6JBYj8OduGIN8fWkV1RSs3j8X5JO2xJFPHGJarOdN21cOZxLAF5f0svV9FwOt3t+eUoV4ti4/XZVSdF4B7DB4x+E+PusXibxfz15jY7i+kTgGOlOB5dtN5jc4gPIC3WOdjUAlMPbNdYR+6K4i+M/Jlo15HY+ao326PzldiUadsZBXEuI0zuhTAjE4UhAolJfgG5rRcpT4OGI4fVu0m6EM4rpMqEi8N4M2p0apwP5fAlyZ4nmI8q/JErGJGVgPvo9m5LDixLMF3l5q8yryws2TyRmgKFspwYSNP27okPGBDX1YjGvclzEDc34wAJHNb+TuWpfwMuPZZvYPgrnW/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 10:56:46.2138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c596ab-2c75-4d51-d556-08de9addafe3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5960
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35162-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shubhrajyoti.datta@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 62D4B40377B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

EIO (Extended IO) is a GPIO block found on xa2ve3288 silicon..

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
- Add description of EIO block in the dt-bindings patch

 .../devicetree/bindings/gpio/gpio-zynq.yaml        | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
index 30a7f836c341..1ca067217509 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - xlnx,eio-gpio-1.0
       - xlnx,pmc-gpio-1.0
       - xlnx,versal-gpio-1.0
       - xlnx,zynq-gpio-1.0
@@ -30,7 +31,7 @@ properties:
 
   gpio-line-names:
     description: strings describing the names of each gpio line
-    minItems: 58
+    minItems: 52
     maxItems: 174
 
   interrupt-controller: true
@@ -89,6 +90,17 @@ allOf:
           minItems: 116
           maxItems: 116
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - xlnx,eio-gpio-1.0
+    then:
+      properties:
+        gpio-line-names:
+          minItems: 52
+          maxItems: 52
+
 required:
   - compatible
   - reg
-- 
2.34.1


