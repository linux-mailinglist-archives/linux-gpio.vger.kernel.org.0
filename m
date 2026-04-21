Return-Path: <linux-gpio+bounces-35308-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGvrEBtV52nz6gEAu9opvQ
	(envelope-from <linux-gpio+bounces-35308-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 12:44:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC45439ADA
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 12:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF1FA301FAA2
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 10:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716E13BD62B;
	Tue, 21 Apr 2026 10:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qA2tS7pt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010014.outbound.protection.outlook.com [52.101.193.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1403BA220;
	Tue, 21 Apr 2026 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768261; cv=fail; b=aOeSAF/h7J0WHBr8M6TPddZBGotx3yLMSl/C/zaD1mIz5g2R3Kj1HYtowjuotlWNIguzvCCgKJ8dBkoxa4VAYJ/dKEdwLf/HvVeUdwXU5LSn2FMNfL0HwkvjtuAmIkmLnGkfqliOTirZ4oz315Bew/U7m/nJJBq0eZGRKHVJhi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768261; c=relaxed/simple;
	bh=QqJY8uNGXKxTuSTMDzUhgwM/0UF2nW3vUWxVIjSD4go=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KVRP6OJvb1EwILyPjS9MOcJDvyw4c5OND42DeID+WFJZl/ia55VoCIpVdlxA91PN8SFcMNfqMl363nc41pCokNrfxqTHU/yHRWFbzz/4ZZJ/yhBZ5762JhyBtVgVnL2Tpil+sgdYrEfswUTDJhFhrjBTHW9E80G2Rr8rH9eQLk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qA2tS7pt; arc=fail smtp.client-ip=52.101.193.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpbv2pEfaXS9fupq8569kV/f+UE8abdIlETCv6kePaU83W+0/RZzKL7f6Mds/SMyCSDG9qZZnpYV8FEoxMlpTVbeamk3acnSljztrmZx1cN68OfHHLWuGqlZ849q/0e60X69w+lBtzYxUDJKIb6JYoKSO7EQtbclrMO7gBi6tWzQtnVg9E3ZygJeP7mWs9W7lObvBMfbAX52FOajhiVA3JOQwdD8KGbgST0l0VzR9qoJQkG07BBkQJej6RTWymNkWNhYi8Nh9ZAE2JNJRpKU2Zxk+tAyO7w2qFsYajthWedsGE+5rVSaIVzAFrXeGRTQyLBrU8gKolQMJvFW+h1Jnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlE+GhkrE0du4Uo3pZi+Gpgu8ntQtX3uvbC71vZU4lg=;
 b=fpgekkmNrPVjBCHckrDGFpJjYSo5WDN5Zzdt2jujH6cJcjOIGyTCM/mf4DrWWM0ilHjE/2DF+Pqd9HRNFbgiJXGMOCXllr3ERDLwbykMKVThddVTMk81FLpV11r1LYUf5N0t5DjUu9TowIucEVlVDGdN3jlfkme55NHU01uIOhNeAql4YBi6MrMF47DAtIWRYvMjYTMZoqkc4aeAjkmCetMimJ29td31PystJXxIaeHP/u15ZPD4+cguX5J8wnQ4Kbzhy2uf+CHjWzsJtLeVUmWc5JqRKgqAVoQdQmJLBNrgrN1RSeWhUkELIMM+hi+NI2nnl+nQajBBQ8vulntA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlE+GhkrE0du4Uo3pZi+Gpgu8ntQtX3uvbC71vZU4lg=;
 b=qA2tS7pt0mGqzsrDKenmNuBW02QzRTvs2R3ycC/WklNUEsFwTzVZgTWVm3riO7u0HgcAiTKm2Bgb3qOKdQDUMPt3f0dPM3xehAPgSs10V/iZkisrdNEvtUhnMiHXb/sI4dEhY2KmdDofFwnAybN0epXKIxtHdvI1XeSYJfdJi7U=
Received: from MW4PR03CA0358.namprd03.prod.outlook.com (2603:10b6:303:dc::33)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.17; Tue, 21 Apr
 2026 10:44:15 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::5e) by MW4PR03CA0358.outlook.office365.com
 (2603:10b6:303:dc::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 10:44:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 10:44:14 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 05:44:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 05:44:10 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Apr 2026 05:44:06 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, Michal
 Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 2/3] dt-bindings: gpio: Add EIO GPIO compatible to gpio-zynq
Date: Tue, 21 Apr 2026 16:13:57 +0530
Message-ID: <20260421104358.2496125-3-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|MN2PR12MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e673f5b-ba3c-411e-013e-08de9f92ee71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EWM4Yf5MxJS9qBkQCxAsKwNyngibrrZCtglwO1CCGvXMcL51UHVKt0RzXNUTUeCoALXCNUI61JBpxCYMuuMX67unTUTQd8hrZS0DUDa/1cQADBg9yhiZzraBeuiWgSsyz8E3x94bGFqxYdkQ4gr9xW5vXVEGPg7rzoRwsY/oo3eCrSUwhlZxMPj9NSsHUFMtCO0/pqoPOpLwYbsOyxb3eRFALjsNYeQjQSwuyTOBuOhw0XG9fJswebRy6R6dx7xrsFOiNJZLcs/WZCQ09YF0/vseGexqNOiTGpkCsYTjn/6kz6vrmmmrECw7gu50TWj5v58rqAcom+LmCfNIGXz1Ffov0PY0zjaxJyB5BqoG/tf9yUg5D5aEtidZjmwwMpxz4BqfxmTaCQRO67nMHKfdRdalHJGzA6BwCIpvEYDUbRGNqGHrNkazWMOEFWLlCPz+wD3dDBMtH52hs5Q1XlnRw6cIoPCgqxJ9Ts9JzVlmIODJ0paktTTrTTkjEDBddZQ9XCVFPOpcYdF85hk+quzPThw7rI44FRMPBufgGgj4EFBgbpwbGzdoSouaHcXyQlIkCDu2jP8kLQooGiIiAKnycbRoGPJM19PqIRJufvKh7j7IdNI8sJX+Q+GfyMjUudkr8sX7rpKm8HXZkuE9BZpytvAIWSj3OIUpSYrsYU2JbyjEmNAk3r3FO1Toh6TSdMY923mwLklPNgok7UZeUv/KMtwGHRgSS68oGsUlJFXDnQYySv5YphKaisHRk/Vi/0/V6EoXvHnTSbG3D9jz0z1Tmw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZPuWb9E/dOo0j8C7yRiVKx7UkxKjyZXWmV0ERvfGIKEuTRFHRI3OhgnSiYc/POHPBOxG3K6AsqEes8S1o2KTPZadbVUrcHZoCjYFRS3sueHEjNV/MO1wb52tuzyLmVAt3nC4UW2QactwXT3BKXNrrAuykwIy9CRGfoIS7MMhAmKqU8qcxI9UdNBHSsk07oKhhLXaS/wAe0xEsblHb1b6wPL2mO7rXvqEV+jFwIvjzlSghSkkQzKX5N8BocEl17j9zGjjd/MVV5ojAZKEoeKN5pn6SRIoquFwpKtHESHvb9+Y2NoMhCGvzHcq+VF8UTpjV49zRZAb8CoNRsGZOn/1FWRqpWi7br5Fm2bjMGoiIZ6dDqnBGAc62MjO1PCuVOBxiVwboTnc8BBk1SIsRKV7Tjy7u+VsZYo+h5cVuvuwDMQLbLTedb0jzZ+ONooeGDVt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:44:14.6946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e673f5b-ba3c-411e-013e-08de9f92ee71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35308-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shubhrajyoti.datta@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: ABC45439ADA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

EIO (Extended IO) GPIO is a Xilinx IP block that exposes
multiplexed I/O pins through an EIO interface.

The EIO GPIO block has 2 banks with 26 GPIOs each (52 total).
The GPIO width cannot be determined from the hardware registers,
the driver relies on the compatible string to select the correct
bank/pin configuration. A new compatible is therefore required.

The block is currently present on xa2ve3288 silicon.
The compatible string uses version 1.0 matching the IP core version.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v3:
- Update the commit message

Changes in v2:
- Add description of EIO block

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


