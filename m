Return-Path: <linux-gpio+bounces-33285-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFXbNgwMs2nURwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33285-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:55:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5107A277651
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65E7C311BBD7
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 18:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6223FFACF;
	Thu, 12 Mar 2026 18:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Ts2MTXyO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9193375C5;
	Thu, 12 Mar 2026 18:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341385; cv=fail; b=ZgnQiBaaeYRXPEFrkuJaYib/kUNS+c2l5vr6OB/Qj6k+iu6wrs5E/PejWnB3JyOD7AUMSkhA29MlItRD4MizZDbrgGNhmq3yi3qQyplmk5j/m8FAHa2kqMOOtafc3e+Qyc7wnK2CBZybSlFjc4yTUS0tODsO47TFCuHj6vdYPdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341385; c=relaxed/simple;
	bh=hJ9XaGCSAEPUHHFpYdtxpxQvbHUd/4V2sAxbI4MD8pw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PcvKzHQoXAOiHTWaVMpYNLgrC88yZ8N5XhbKg5+PSJEStr+N8k6VeXSOIfTpl/quF7Cy+Jj1wLi5hshJ3+mWfPOfvuwyx6peuDhwKBQeS1rIkpi9zqEvR2XSaOVwaB96lFfp/+fR2vIgSAUvH5nOChErdnRuiX/U03hcoy+3l9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Ts2MTXyO; arc=fail smtp.client-ip=52.101.61.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eavl/jRokf5KQKlioR759vlJnIvn97Zl9XIj5PGXdxf7/nykNbACJuwt9i45Ui4AC4V0PZr6GoNQtwEheAAxBMKnBB63spOw2KyosUD2bgWr1zRH2uqibZc3SkGbmpOSUO0gBfzpfEB+wI8TC1XDVZ2WL+gki/8c5THtGcEF+E/bVfwiNey/67Zlw6ROWgmFPdSCC15sUOrjO0hTXzCx7eoo0NNkVdrltH1kvEZZlPsGviNCpNPLgYsGmFnSj8euX0LeCU1D6MHbzKmVCflQbY+ATflt2MkJ8M1P1qQfN9GnyjTz2zlncucZkOlYbUxh8kLISFbIZfIWuga0VjIljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/Z+xDnfhGtfpb7LVopZzl0d7zy5L18yeO74Z+wwoP8=;
 b=mWJ7nXcJFqLSaKQod7bHdX3fmACC49KEm++Uoxs9Y2OwW+OsbhGLLN+Rhj0Hk5edkuj4H5eR4gtQkmfBLJDw5Z0+cvqX028NodRKee0z80hUgsAr4C0DHyonNE8yNfaYmnQdNUzVLmv684AZrYhHGOuBJHqCex2EwPyMZK0tZZi6r4C+5RK5/qX42gz+4d2HttwEHgXpAKxVSEhuuPn82uEvbRG6KdYFhc8GaW+tBUwTlspRoenYDsWljS+cA+N24fNaspqob2WDZl2F0tUrem5qCNaBcNGvKP2KoUGZ2qFNSn9YYIahAfQ3Ng745zCqnH5Z2NeYk1lbmV5+LCbDiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=tipi-net.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/Z+xDnfhGtfpb7LVopZzl0d7zy5L18yeO74Z+wwoP8=;
 b=Ts2MTXyO33uEJ/Jj2csuYtSplvsKTBE5niK5qdofEKBq5Ipq5PZqteIxxl1H0fbmYP2kABAVU3sOuVNlyJ7kMxEhhbowm2JeCQCnCoo74MjbBALKEcOqsyQR/yWrkJzgXVpyqvicWPgBBUw0IYQDH3e8mWMCuS0aJqd6xyaXQrk=
Received: from SJ0PR13CA0108.namprd13.prod.outlook.com (2603:10b6:a03:2c5::23)
 by BN0PR10MB4902.namprd10.prod.outlook.com (2603:10b6:408:12a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Thu, 12 Mar
 2026 18:49:42 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::b5) by SJ0PR13CA0108.outlook.office365.com
 (2603:10b6:a03:2c5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.8 via Frontend Transport; Thu,
 12 Mar 2026 18:49:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 18:49:41 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:49:37 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:49:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 13:49:36 -0500
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.135.133])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CIn54o2829533;
	Thu, 12 Mar 2026 13:49:31 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <lee@kernel.org>, <linusw@kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <niranjan.hy@ti.com>,
	<nb@tipi-net.de>, <navada@ti.com>, <v-hampiholi@ti.com>, <sandeepk@ti.com>,
	<baojun.xu@ti.com>, <shenghao-ding@ti.com>
Subject: [PATCH v1 4/8] dt-bindings: sound: Update ti,pcm6240.yaml to remove TAC5x1x family
Date: Fri, 13 Mar 2026 00:18:29 +0530
Message-ID: <20260312184833.263-5-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|BN0PR10MB4902:EE_
X-MS-Office365-Filtering-Correlation-Id: c687ad9d-d074-4b7c-b276-08de80681ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|82310400026|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	HzQhmzaG102/IJnmNt9mvAgxIARydOBMIRcoyztYYx0m2OyVpMeoNRfHQDnWOxyFzrfXKOYT8DMk1OH8uctEF1LmF+lIupH+V8oeet3TO4DMiODdmBnvSGRpWJvQ/XBWAxP/9OM+K1pJ4g2s2tolsT+2MHBkraBEJzr+N0lS0ILwotg+LJptq9S/dAnCdaxyqZk1SQextD4my9FATZysD7hri8ZS2vgXhPr8cjow5FcECrnzoc2AlzlWqrOIhiP8S64EP6mjY7PxfAQAmGhkgasbHB0yo5htxHhDNNaddOXX7O9v1BkrOoTbs3o0l/f4ZIjrPXLz+Lp9nxxIqZJfHSwsJW5sn67usKhwAlyQ+/pnXoGDywvoXzSigBNHpOCcPwM/ibAyBr2icIWLSopOoNdMHZXwVJBpQmsqc7oMTzfI4lOAAEnNcX/hyfVLxVJlFtbCKkc+oRrdksiSi8RgMiZq9uRHfuuJQ4Qb7cEcJjAez1gf3U2loTzvsQyL+BWuQ7MixPi2ZpH2hKmJTVToCtHtqzYuaTuUROlNIh8QqHatrt16TumrO+tNHgHHpTmZ4Zjx5gCjWKMmrY2iKXLKjBC+NBrHWOXfECXMizqVSWByFpMObONsL/jp7HowGhqvy8dkU4cYCI0ik2Cc7aTJMW1BN/nHj4AJmAemhATaMJ2FiUMIJ89QHq5H2EjJ+y6rkHg5CuAN8rhiPwJBz6tgSd4hJFaZFTPDVB90Sq97MBoLDyThWyXF8izXgpinCRBO9t7aQuSP5tBfSp3uABg/B8YcSs+Zj3iK4pwTjEjgr/o=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(82310400026)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8W4lgTvQu1nwAYERSyOxhcbNmPX8OTGy34ZDsVf0M0MWlzfA0pA7uXB7DrJFw9+4FS0ENUCbPIRT1khmbvGzDFRowkFF7zHHW7/BTTlnxMHM0dughltL8W5p8OjI4WWicUAzUi3oEOk6kLFFyhJQ65PO5FZK+xLBvGpMo2FOFyQ0MIfOCgp0pWCg9wc9QY/KW3F9b6eLWXuH/I2xDCNW0pWxXO1ajVcCP8tkKdnTdD3qhz0XiDCTsr+nKqBJcwKrpN3BpesFA75pIHIo7nR34yLkRuUfmxYQekWTUMGgle8vHuk9hl0JLL2Lk7NhowtLnuzj5TJmYnYAC91Tku6SN/DO5tQEtcofjL6AeuU8CM8hwV6N/vh6c/csgFSbaQArilhJZN2hLz1UUr0XdgVMl+RPdjnxCw3l1V+EL+4smd2o6kumGPnrwS267PH1Wcl6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 18:49:41.3199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c687ad9d-d074-4b7c-b276-08de80681ec5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4902
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
	TAGGED_FROM(0.00)[bounces-33285-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niranjan.hy@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:mid,ti.com:email,ti.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5107A277651
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove TAC5x1x family references from the pcm6240 device tree bindings.
The TAC5x1x family (taa5212, taa5412, tad5212, tad5412) now uses a
dedicated MFD-based driver with its own device tree bindings defined in:
- Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml
- Documentation/devicetree/bindings/pinctrl/ti,tac5x1x-pinctrl.yaml
- Documentation/devicetree/bindings/sound/ti,tac5x1x.yaml

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 .../devicetree/bindings/sound/ti,pcm6240.yaml     | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml b/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
index d89b4255b51c..0ba2032e45b0 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
@@ -11,6 +11,11 @@ maintainers:
   - Shenghao Ding <shenghao-ding@ti.com>
 
 description: |
+  Note: Support for TAC5x1x family (taa5212, taa5412, tad5212, tad5412)
+  has been moved to a dedicated MFD driver.
+  Please update your device tree to use the new driver as described in
+  Documentation/devicetree/bindings/mfd/ti,tac5x1x.yaml
+
   The PCM6240 Family is a big family of Audio ADC/DAC for
   different Specifications, range from Personal Electric
   to Automotive Electric, even some professional fields.
@@ -29,8 +34,6 @@ description: |
     https://www.ti.com/lit/gpn/pcm9211
     https://www.ti.com/lit/gpn/pcmd3140
     https://www.ti.com/lit/gpn/pcmd3180
-    https://www.ti.com/lit/gpn/taa5212
-    https://www.ti.com/lit/gpn/tad5212
 
 properties:
   compatible:
@@ -81,10 +84,6 @@ properties:
       ti,pcmd3180: Eight-channel pulse-density-modulation input to TDM or
       I2S output converter.
 
-      ti,taa5212: Low-power high-performance stereo audio ADC with 118-dB
-      dynamic range.
-
-      ti,tad5212: Low-power stereo audio DAC with 120-dB dynamic range.
     oneOf:
       - items:
           - enum:
@@ -98,8 +97,6 @@ properties:
           - enum:
               - ti,pcmd512x
               - ti,pcm9211
-              - ti,taa5212
-              - ti,tad5212
           - const: ti,adc6120
       - items:
           - enum:
@@ -114,8 +111,6 @@ properties:
               - ti,pcmd3140
               - ti,pcmd3180
               - ti,pcm1690
-              - ti,taa5412
-              - ti,tad5412
           - const: ti,pcm6240
       - enum:
           - ti,adc6120
-- 
2.34.1


