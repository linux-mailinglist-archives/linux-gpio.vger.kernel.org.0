Return-Path: <linux-gpio+bounces-33286-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEwJOh0Ms2nURwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33286-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:55:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C64277659
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:55:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A66FB317189E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 18:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8774E4014A8;
	Thu, 12 Mar 2026 18:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xD6eN/AN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010045.outbound.protection.outlook.com [52.101.193.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D4740149A;
	Thu, 12 Mar 2026 18:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341390; cv=fail; b=F8gmTnyua+PE8viGSEOmr26t4cAcH3fufYx+uIWJUzIcCwLXbJLN+HLcXNYkcXMUDOwIXhMAPai2V8CEPBKGljAG71v+ZwXLLCVqaoGC4FrTYA6m1FxVbbxohjh8m9dPVVbhHo2S9lIUu3M7qzcQxGOOls27hlTu4RJBwWenTco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341390; c=relaxed/simple;
	bh=m/B17rV5/BoiWW8ktijztS+J6IMCSnibCcF+FFHYyJY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g7LJXaeZ461mygkSbM4stxXwltjBnqDOylets4bQ6jHk5AkjMGTsYliFXapo5uZQD8EejPeE6Ka5IlQICzhfR3fA2LOAlzIjLKz+H/wBhGYpuLB4eGF4wowTH3WDH2BEdmNndUbqIHo/hNAtbp1rszhanMTEQ60jUhq/bGhB/Q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xD6eN/AN; arc=fail smtp.client-ip=52.101.193.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgupc/G1N/6+yBwgQz5qJpP568ueeoQZBjePIxb9H9jydGvdNw6F9F71/XUFUUvus05NIxoMVJqsRSElryJH5oRBLOYJMHfVViWRm9UAHtaWWjvx4gHeAcYICcie4aBSr4Y7mlzn6cwJJWjBWFhQL7J4dbqSgbdB8GSDCevHAt7iPT4mV5BqVJwM3gStGcJmvr/fVJJI8rLA13KIhWKaUdG3iXIxVZAbjKuDWkarqfPnUGBB6w70W1uywLg4+RwsMAy7VPR+bajbsn8NMJb3cmlgF6KS+O/KGywlmd9xQzCAZB3ae63JpGWdIxi2g/T6AQ4VrA4vSDL53CLP1unvBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLxTNhFhG6Ob4bnZuid3HldOyVIMo4W8eVtRItIo6nk=;
 b=fTW6lMvFLIGbz53Gp4urB1SNcBYlvJ8fV5c7Fh6ZGEoNmF5SLc2O5/EURSDtYdPO2Fj1jXNMe4VxTcOWZEdxRI9HYfLumu/TUU3AzCgc47+PWydqjOMcRtqmOHHE1L1E0bGilF1E9iudgIjWX6E3pRwQzhwA+LIzN52HIv0MEfGZlP29QdPcBtuL0ynqYgS7W2MRyJvWbi8CVlAplMFodFgJnZbE4YcAVZgkV6R4B9gJMjVR83Sap98iLfTRLzO0YpyTZ3uuHD6zDz07FTlFdq3PR9Vj5Yw2RcJ91n/9xLMmFtO4ThVhqpbNqLQS96RiadfaVn/axIWTKOOBAdlUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=tipi-net.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLxTNhFhG6Ob4bnZuid3HldOyVIMo4W8eVtRItIo6nk=;
 b=xD6eN/ANgkAcY2r1ORz//HUOw3xDB2SdBJX9ug+dgNCmA9wndar93xWNX8kSnSVn4VTCxvb8lq73XQMSwFsVeLZvBDi0U0QIQBfBBEAtjzLhzvX6NtfNx8OYj3SOKkvtQRUfpYLKvUvWKnLl4cLae9RCWSbofw/ncznN5WIT22Y=
Received: from SJ0PR03CA0230.namprd03.prod.outlook.com (2603:10b6:a03:39f::25)
 by DM4PR10MB6743.namprd10.prod.outlook.com (2603:10b6:8:10d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 18:49:41 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::87) by SJ0PR03CA0230.outlook.office365.com
 (2603:10b6:a03:39f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 18:49:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 18:49:39 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:49:30 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:49:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 13:49:30 -0500
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.135.133])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CIn54n2829533;
	Thu, 12 Mar 2026 13:49:25 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <lee@kernel.org>, <linusw@kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <niranjan.hy@ti.com>,
	<nb@tipi-net.de>, <navada@ti.com>, <v-hampiholi@ti.com>, <sandeepk@ti.com>,
	<baojun.xu@ti.com>, <shenghao-ding@ti.com>
Subject: [PATCH v1 3/8] dt-bindings: sound: Add bindings for TI TAC5x1x codec
Date: Fri, 13 Mar 2026 00:18:28 +0530
Message-ID: <20260312184833.263-4-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260312184833.263-1-niranjan.hy@ti.com>
References: <20260312184833.263-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|DM4PR10MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: e7cb6b84-6dbc-494b-2095-08de80681d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	hP3iwjYTKEnaT7PwU3jtvzjFUmTf3iYrxpwIJgWsb+QKhtwBpOsb3ygbeYmc3irlkvFS94p9/B5kmbJgNFL3Q2WDgKTfgA0RdaP/vHUhsSPhLv5fDG3gFQWcWCAHyVFd5Of1a0nXtANqL6UznK6bVwdPJYHn3rXRD2FCgS567XSdxeK21AD1VaG9eWRWHgR/krvuHPvENwzoh28RRg6dCRf76/DbblG7MhW34LSAyq/RRe2G8LAoST1QmsbRVfe1AZUCF8N4+4lj3aHbyfUeF8WB/7iFWXaOfuYZiZ8XYsMqRDIgwhhd+6Pz62B0M4oc3faxVQK2ivpW5ZPog6OfWKGpUvGkuj0ZmYrcErFozWZDnNYrkiEFnzEroGQhubqMFa0pEgBE5uV55dXTi4FkAckSNV2xPeAHsF24aCFcmdfh07wfDvB8Yip54zzn3E10us+w2LmiZHXRbYucejjP+35gikOpt65cq6jNxfc0cMlfYvSsNsYIuh0CD6bmPt+g8BuW4kG7AbfnSksPr5KAkN9Etah0ZgcpLC77D0XKbjzPim8ojv8oCrNTf+QQ9paIirYWsOisW7y+VrnROloruPBFcRiHyebhpG1sI4WZl2H2Lm58/nC+qwWqdhlQmguZMCsjAvDK45xtTnu6uOV/qTVHhVDbQXoxDni6vVarBRGd/cNbdFBnBr7tdOKQ+cfhrVj53h3fK0HKx5pOD5CnIts0FqVgBUC0xMs3P2xRtq0=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zWv7wh/U2EVhVV0x6r2qaXstz3my2qkcrOuqF+TRzjW7SbDZVx5RD9MeAN46jnUY+Y8AKBn90fSi8GlcD/QVC1X814t1eSJhzaTnWbA3WL7glc4hKaWRKG67ABUOoFqtC+ezenF0swYx6JQIj4iNpJ8ksBOfMCLFA1odzkW9O9Q+ebHCdZ3kkHEBL379kKkcpSmc0JHkyZWb/KpJwhhEORqrHXFGV1Af3PAx2Wte4z+xHdW/MLP9w7UYbz7wAEyL4xfQDsM/G2Swbbn4xoWMyd4bBtPFUkOyBluJc/g9M3suWDk+yZrmQlOCaHr2kA5AVUsetIH48L285TDuufWXyT9uFSr2qzIwW2XcxYJoZx2rL4+6xttE6Tvp3J4Q8l3Q/z/E0wAhTwPO6rCc31220xxm0kg2rDa2H7gxQLoOCuEeAVH7cujRHCsIgSCFuUYy
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 18:49:39.2463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7cb6b84-6dbc-494b-2095-08de80681d8b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6743
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,ti.com,tipi-net.de];
	TAGGED_FROM(0.00)[bounces-33286-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niranjan.hy@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:email,ti.com:mid,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 64C64277659
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree bindings for the Texas Instruments TAC5x1x family
audio codec. These bindings define the ALSA audio interface and
regulator configuration.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 .../devicetree/bindings/sound/ti,tac5x1x.yaml | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml

diff --git a/Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml b/Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml
new file mode 100644
index 000000000000..05fc93027fea
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,tac5x1x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TAC5x1x Audio Codec
+
+maintainers:
+  - Niranjan H Y <niranjan.hy@ti.com>
+
+description: |
+  The TAC5x1x codec provides audio playback and capture functionality
+  with support for various audio formats and sample rates.
+
+  This binding describes the codec functionality of the TAC5x1x device,
+  which is instantiated as a child device of the main TAC5x1x MFD described
+  in Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml
+
+properties:
+  compatible:
+    const: ti,tac5x1x-codec
+
+  '#sound-dai-cells':
+    const: 0
+
+  clocks:
+    maxItems: 1
+    description: Master clock for audio processing
+
+  clock-names:
+    items:
+      - const: mclk
+
+required:
+  - compatible
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    codec {
+        compatible = "ti,tac5x1x-codec";
+        #sound-dai-cells = <0>;
+        clocks = <&audio_mclk>;
+        clock-names = "mclk";
+    };
+
-- 
2.34.1


