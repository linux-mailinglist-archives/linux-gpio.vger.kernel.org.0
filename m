Return-Path: <linux-gpio+bounces-36644-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPubFa3EAmp7wQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36644-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 08:11:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0158951ABF5
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 08:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 710DD3035BE9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2026 06:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC01048122E;
	Tue, 12 May 2026 06:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n2Lu/0hD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011024.outbound.protection.outlook.com [52.101.57.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43F644BC92;
	Tue, 12 May 2026 06:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566202; cv=fail; b=syJVJ8C0LaP9SxgXiZXaqGy+miBK+5AwQ0IMpbfoI2UP4eXOTlIPwxGg9yqkAKTTP89zFSqSQ8e8IsfDNMhkrhdGszy9ecNr7B+AXhU5oHzooDrFZNd3XAEuzGljrtW4LN/uSv8I+5CSO3aDaNSshR4yG2MjXiwXTV77PVOH4n0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566202; c=relaxed/simple;
	bh=o8xTLCHP8b0tKa6k18GBBB/uFLKfC0a0ihnTz36L33o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a/RLxJktYdx9Ml4cQKEWmdW/UsIooI49OhdFdvRxE8H6icrf5CPpiZr9Q8aFmf7os7HYRcUJfc1C3opyUywDADfWkioBszNvClZgAfN4sDTSVhjyhxaFqxKqvU9kaTZWElWzXWKnRANiUe4DHAqc4Pq8SkmXSKEGUIEriGk7yhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n2Lu/0hD; arc=fail smtp.client-ip=52.101.57.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlCCG4S1ITYfwXabSm8nqswivKk6PaL8QD6kdu93fp+RtlrbScuy2X6p1Z6TCclMt4G82BmO6E8D0PHHQqI8AmcbXCujZb4xmulWNYcrZNNFhQsbbA/G/Ee+4U/9/B9DuSCDTwh8vBKOKu43Y3kfETO7W4sxC6K6v5K74I85krMi5HbbHTiJ4CDNvC6uhmY3zhG4Raq09TK9o49bNDBfUEueYJHQuHen1cB/qBcvjXBakKgGMtgqmVUR89QctNMu8aaNEku0wxCQGghF+Xq9YOvSd4NdJ+L6D7sMgEwy81U8ifExtNJFZlaoGBmG0zXQoW2S2n2jh50w1+ZyUCht1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=md/GGIDIRp1UAjMLufBimrZJ+UVWByYJJsyDARmJqag=;
 b=GMWIKS+8mgxTuVlz5YvIyy/aWCNSeTYgbeG04/eMW8UnQMj3hYpmnBeDkWXGXnwB6fZLt/RdDQ5CCzOVS+GSZ922QpfB/j4nXVwt5iRea6btcgDPenrh1mPGrccn0h67bdmlnfOBtflexSHl3Ba7oV3wg8RZdO50g+s3zD+1iwDriB1H/Bj7hev+NYU5mQ/zJppvYqpkUEEjY9LFbu6k+r5186saC5qV2WHgGCi/cTz8qceMt76zi4GQ5CiemUWzib57Zbx+C/seyBpipcgbU+GIakgO7Qv+U/vjnmYkwEJT9bi5jKcEisA77SWhF3bCMvsWPXtLGO8NM9Esx5XWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=md/GGIDIRp1UAjMLufBimrZJ+UVWByYJJsyDARmJqag=;
 b=n2Lu/0hD9LcSpeMjBJWFiEbJQ1iEvVDaebtEt1yzPYV6FNSLJh2cKRjsNYMvJlFMxIghVs3Jk0uIlBojqPSv2xr3SihK7qqCf5Ouj1uaHklfgYp4PiQt/cHkps1JxhOMT4pvfyHbPiPysJQdlop8PnCSGESfshg1fYCJCfVk624=
Received: from BL1PR13CA0355.namprd13.prod.outlook.com (2603:10b6:208:2c6::30)
 by DS3PR12MB999241.namprd12.prod.outlook.com (2603:10b6:8:38e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 06:09:42 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:2c6:cafe::52) by BL1PR13CA0355.outlook.office365.com
 (2603:10b6:208:2c6::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.15 via Frontend Transport; Tue, 12
 May 2026 06:09:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 06:09:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Tue, 12 May
 2026 01:09:30 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 May
 2026 01:09:29 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 12 May 2026 01:09:25 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, Michal
 Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 2/3] dt-bindings: gpio: Add EIO GPIO compatible to gpio-zynq
Date: Tue, 12 May 2026 11:38:48 +0530
Message-ID: <20260512060917.2096456-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com>
References: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: shubhrajyoti.datta@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|DS3PR12MB999241:EE_
X-MS-Office365-Filtering-Correlation-Id: 110db0e7-2d38-482e-8e81-08deafed0edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	AkH9dVrefPwlBWFwOIPeGWJeE4VkZF2d6Lik6TisGpRrLYM84qppQbgBQGU5axkukDzAg7wsb7u9HzDNPXUp0Srn2deHTzNzWAUK8uHgT55mggrsarkPLXhaNgeRZZ/SeH9SjwpM6OA4btJbA3VTJ4fAQL5PYNLYLrv5yjPr0d6GYuD3DGrdipOK2/ZiofVCpVTuIUvWHjjG42Mj7dRhNYkkI/HDz/weuwm2V6aT/xK42cGi9XICy48i+cAhiY8x8vchg9i8Oh3ud3QbFpXcCssSkYJZEYSTasYnemZxx+8VVjLF1U/nmcdikz1ouWOVj+6gy0dKOfeaUtQkJZOJpM5nSPB3yTp5APmyNEDtVPTBq9p9ocA6lmJZkpiNj4nezQgXb8V+S7LqHJjS5VlYVDQ7Og9dBegPw5Bdo3q87R3kEg94osKcC2yKPyxZzBoSNrkpc95TjCj+wNwP+M9tVkGcyUgKOkCEo53jmYoa3lAYcLeqx+nVC7FdivjrcqIkFOe5BXHpOlOvDdMngLzP5uZvZxTwpVJvYy6BXdWtCEU4qGjzRtOPwajVCD19BIUCc8jYBem269cUvCuqyt+W/XBIFsa3kdsvIArFbylqJO6KDhgXbUVdLQdxVVK2C6wxeTqYcuahWKowtixZMo/IHfoXsHcr1Ke0kQJd6ohesxrzr2WhZcgSFcy2mcEshSVM/mNXYmxALSKkZmj2j/6jP3phOhJOYNgyrwk8hGB0+tA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0O5JCKC/2skYcZSRgIn8mAVRtld2d2VHfrt2eHTq0uQtMTswHBIlEsOFjgmmURE1LNtKV6dEGgcGbdBNn8iTQFEe/jLkrrwUn2e/4TlR7CzAXeHl+KjGegTIBDzKDP5ndV49vdxguYZlkii/jqP9JeJlELRgpquNuI4DeMxQncm4fkKzGvGd6T5pa6YG5x11LrMuXQ1INQSqybiaQ1RRXYZU9BIPGayVm3XGjxJkJ3kAD7PsZI9LPhOCKWBGlD2wEumM4P8A+hERQkEgsCMB5NQJNBv4+wiZDGJLjMIVGy6djiHbHJka6zvZtKrPAFlj6+fq3lqKF+tVuxPPPP/+Oh/9KGtYskLhKLuH7pwRYcbueCJuMrNy9Dz5b5WEqg9otV9p+nhhJiRFPPOc1bIDIG7/z7SQp9XorCLX9CIh3P32V0YeA7QCsh4lor6mk0QF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:09:42.4341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 110db0e7-2d38-482e-8e81-08deafed0edd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB999241
X-Rspamd-Queue-Id: 0158951ABF5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36644-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shubhrajyoti.datta@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

EIO (Extended IO) GPIO is a Xilinx IP block that exposes
multiplexed I/O pins through an EIO interface.

The EIO GPIO block has 2 banks with 26 GPIOs each (52 total).
The GPIO width cannot be determined from the hardware registers,
the driver relies on the compatible string to select the correct
bank/pin configuration. A new compatible is therefore required.

The block is currently present on xa2ve3288 silicon.
The compatible string uses version 1.0 matching the IP core version.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v4:
- Remove the min 52 for eio

Changes in v3:
- Update the commit message

Changes in v2:
- Add description of EIO block

 .../devicetree/bindings/gpio/gpio-zynq.yaml         | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
index 30a7f836c341..de24bb361e9f 100644
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
@@ -89,6 +90,16 @@ allOf:
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
+          maxItems: 52
+
 required:
   - compatible
   - reg
-- 
2.34.1


