Return-Path: <linux-gpio+bounces-21601-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32228ADA07B
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 03:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E58FF173BEA
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 01:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA11273451;
	Sun, 15 Jun 2025 01:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="Lv5krsI3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2119.outbound.protection.outlook.com [40.107.244.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D5F3B1A4;
	Sun, 15 Jun 2025 01:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749950004; cv=fail; b=f7078YlDc2an4OG9N7Pbzf9Jy8tFiNxMEB7YIGury4qrFNnbzt2avHrMD6JoXfuxXYiP9NJKhWVUVBNs5oXbff5mULP2JapubOZhM1k2zEjLAiPXUP898X8GOlLbUyldrZ54/CT67/K15oxtPGGQ7YMOJHNEpRVhMOGaaWccMRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749950004; c=relaxed/simple;
	bh=JAGaJAgF70FsEE1A6ROffWctId2EeB9y6UTWjPZpY1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IM90Lm8L3fBPSIqpYVqytZbRmdudr5NIxGgiqfQutJvOkhKyLzJS4ylNSR1QxiEtze65Zru4Gz8Bg5sldB5mCtGAEnSp2/JeOHMOe/dK92o0706FHrbUmAVDDg1+xGWCKnZk70hzl74w3EGLHTJK8vsBs5QEjLplGl0eFxBsCO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=Lv5krsI3; arc=fail smtp.client-ip=40.107.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AANnnKzVKycuoaf8XVv9l3InwOiMU+oFTadFxQhwUd5lHOob4711cmQ1aLNqQfSeNWdqlL74VmI42wIP3gg9srrjESdLdq4LIG3llsb6MA6feZx1zVVn/vMTAXfTtkOsIS/KvcXF4M4iIEf0b0JL+Qi36YUc8rldEioECRhehWd7q2T34KusqJGj/Ic4uPiaPI9O06dKwrGcm+lr4auFl8PZtR98Y7Apgioc+jiyZkFGt1bkLUEcgppCMv2RGGDblNRsg7cRnwCPhZc0H7uqM4luxDK+H7eazKF397LwzYj/ExJsX+FRJavQp+UGI1iqB6GfbbrSN3TwOCFfBjcolg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4JtBHgpR5hiyNlkhaWHHnj07mcCufxaOMYaWWxy3Tc=;
 b=wLuh/mjTIJwOSqMse9CmZn1i+nFNnvISuIjtrNQrgO+FO0Mm0dm2a5PP3C3gEwOQt6St1UzEEMJRHEt3WBcAiMtLmJdkYpn2miZmgp4WExURm474J9WPdXJh0iETrrMVS7qkxTpGuODA4hf3PjUYd4oK9SGr6IBD1mV6jGRvYNVHwgJ/62mAhB0U5tBjOsbUzLs39u+yt6/JU54e/OwhA8JMiXv40aePs1z0CgzNxi2DU7N+CHcthzRzvcIHESBz4hxWREpv+ZX1e52QtuF0gNWNS9nI3DQYvqTxsHGvKKKvdP5Ro0AELMNlJJKRBfR43vOnE6JR86Ssxxo7OCvpnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4JtBHgpR5hiyNlkhaWHHnj07mcCufxaOMYaWWxy3Tc=;
 b=Lv5krsI3lCGeMADWzb8c0VHPV5QhKUmSSbJ0jkVqU5BIJzYcYJOYFkXUY56c5PwMorsY1JrTZgkFPEDslYL/xHjW8Xb6kMr5AC8+6qPbccyd5ZJaZhV/0jL1b2fsyyOWaXH895/MfwtGhFqkUoiuSfhEADWgaIp/YaNBjTHUniXGevUdTOhwpDQ1DblNdntjCOzRagQf3OhzmhxRdk6i+A1fa/Z/SLN6/efOs2Xdoo1q41KPfse/SPB3VIJeJVWYqnvVKoTSstXKGWIlWMIWJXQsBI/x2ul6+1yd1XnpD/KFPUfhYRF7rcCaKhA+gnCnLUnWU99zhlNpFF/UmkecxQ==
Received: from BY3PR05CA0004.namprd05.prod.outlook.com (2603:10b6:a03:254::9)
 by MN6PR18MB5496.namprd18.prod.outlook.com (2603:10b6:208:478::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Sun, 15 Jun
 2025 01:13:18 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::ac) by BY3PR05CA0004.outlook.office365.com
 (2603:10b6:a03:254::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Sun,
 15 Jun 2025 01:13:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Sun, 15 Jun 2025 01:13:17 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Sat, 14 Jun 2025 18:12:48 -0700
Subject: [PATCH 2/6] dt-bindings: arm: axiado: add AX3000 EVK compatible
 strings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-2-327ab344c16d@axiado.com>
References: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com>
In-Reply-To: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1332; i=hshah@axiado.com;
 h=from:subject:message-id; bh=JAGaJAgF70FsEE1A6ROffWctId2EeB9y6UTWjPZpY1Y=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoTh4nkVRoFj1GVEpwkKz5iponHcahlqg2sR8Tf
 ata6lPpE2+JAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaE4eJwAKCRDxWHMRoTLV
 +4jJDACNF3xFDZrpiFEwMFNm2Cx4LN+PtlQ0STs38NNZWkwAOo2wLHwrNBwW4eFdW3MUgjRKWhb
 3akU1TB8C2bUoeCyvP3hC2HqsO9LWd/uwtwI0gQbgrnyqbvJjNxjylPdHlYYol5qykz6vv7k6oO
 X+lOmIS1X7dmwoJslByumMR09zHo0eeXIqZZ4VTTVvcNI3Ex1e1/rLAL5bpT6DRjRxGJi2tGURv
 5hVLCJVK2Q/Jr1qfsKKvx3YHOFt90OLb9RWbXwekQP1OZQC6PEoFk9Bh8/JBCiE9MrfMiOU0PW2
 4fQZ4v0noY5zX6yOR34n4rHdoJXCz+9V29oBfiZMy1Vkh4hPPATVdEbYhXIHqqzyaM7jqiUD6z4
 Lt0RdbEf0G0OmIU3PITbUv+IJzGBHCgHOw4PRbUSE+dzQ0N9x1UYwa6q89Cn0XUJIA8VmR989zd
 ylH0XDZjVOUpJFdoWubGDxOL6WEukR71FbxmTL+ETvl4Vzhcf1j26ANIQ1gM1xp9XiZ/I=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|MN6PR18MB5496:EE_
X-MS-Office365-Filtering-Correlation-Id: 25399687-8ba7-421d-8088-08ddaba9cf90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0w4NWozdkdWM2N5Q01ZZC95Y2RYY05tQUlBRDNFdzZ1bHVydHh3TWQ5b2tt?=
 =?utf-8?B?c0dQbDNBbTZCOXh3eUdoUktUdEFIb1U3Y3VFUVRYZFRlZ2Q5TjZtWE9HRjJr?=
 =?utf-8?B?N0M0OTliZU5OQnZ6UmJMdWVoSWtZVUpEVHM1a3ZxM1VLc01ncVJNdWg2akRW?=
 =?utf-8?B?bkNUK2VUaTBUSlBKTUl0NWEvbW5tRzFyVWZoa2F0d0hQbGNYRzUwS3p1d3F5?=
 =?utf-8?B?cmdXY3lSb09WQTRoaFVWQVBhK2FXZERnUXVuYXZrVVVqZG44akxhMmxFbGFo?=
 =?utf-8?B?SDBaMTk0Z01QNjlnRGJZWTkyMGx2UDhMTXBnWTREUndMOXZPTDg3SnQ5akE4?=
 =?utf-8?B?Q3dNV283MnA1amNBK0VSMGhLSnJlNUhDTE85VVJwOW5ZQlJUdzEyWnNGMVJu?=
 =?utf-8?B?SkxtbUg2cTdJdzFOTnBNeWhtYlRYR2lkZFFNbmtPYmdLVzZoSDhiK0Y5R1du?=
 =?utf-8?B?dG9mbHhnTXVrQm5GaExhSXNRVkdHTExyZzNySUZRdzF3am91b2tZQ1krZEo3?=
 =?utf-8?B?TFpnMXQrM3Z3VFpwWDYxcFJ6VWhnWWdEM21SdHNveWMrTlRObmJVL1BvQytY?=
 =?utf-8?B?TjhXZUhyWFkwWE1BeDhCbXpoNUdJeEFldnFtR1dGTzc4SVdhYi9aUm5oc292?=
 =?utf-8?B?RmdKejg2WVlpeVBwa0RrSnVqOG4zS05KRktYSnllZUhBZnlNNkpTWmhkS1hk?=
 =?utf-8?B?MG5hMldOUmhVblVNUlV5N2w1dzhwSy9DMnRqMWo4bHdpQXBGM0lnbkRiTzRU?=
 =?utf-8?B?d2ZFL2pwOXRIb2cwL0VTN09BQmVNQjAxaGFKYUsrOXlQOEVCNGJEcnNnY1Jq?=
 =?utf-8?B?V1hERm9pT01BUExzUUdDczdsOTRNRWtNVmZTTDM3WnVXVDlvYzdyMDJ3V2t4?=
 =?utf-8?B?Z1A4SVBpdE5KZU9rVjlXeWRzNDZFTTIwbnA3Y3dDU1dXN2NaZnUyT3N0aWMy?=
 =?utf-8?B?bHBrcm5nVXdjZUowcE1IcFlzYzVBNGVhZ05FVXNyVlhtcHYrbE5BUlVteWNm?=
 =?utf-8?B?dUVYWml1THl0emhlTlNEMlhTdFZZVHcwOE9PNk1JNHB1SC81czlZM1dwSWZO?=
 =?utf-8?B?TyttMnZXMTlPQlNNVVhDZWNhRFFoZ241VGM1SzNiMURocDhqenc2SXJDRGhN?=
 =?utf-8?B?bGdDN1pWdjcyNlVEZGN4YUR3K1FnZWcvTi9DWXJOOUdNdGNMVHd6cXdHZ1ho?=
 =?utf-8?B?NzJDZlE0TVZsU3VITFd2d1ZNVUJaMEJtZy9JN2s0V05qZXJON2RsYXBDTk44?=
 =?utf-8?B?bUMrdlZXMTZGRTFXTGtJdU9QaUFJTkxsWmFyMGo1b3o4bWRLNzNNMVNRelJM?=
 =?utf-8?B?Z1JOSmIxYkV6dFJsT3Q5Z0Z5SVgyZ295NzY4Y2Q3UXFnQnhxSmxwWERDUUJq?=
 =?utf-8?B?aDhZVVkxU0I0NDVBOEQ0VlRBUkcrMzJrME1sbmdqZ3ZKQ3JpdTBZVmlKVEhM?=
 =?utf-8?B?REdjb0t1anUycGZ2Qk15YkhhbS96Y0pPaG5pSTFnWXJ0TlBpSnplMHZ2Zko0?=
 =?utf-8?B?MG82WnFFa014dnI0TGVMMDZSS21aRmhpRVJTd1FPSXo0YjFuL3BOL0JwR2Jl?=
 =?utf-8?B?ODRnODFzT3dsOEUzZWlrVERNNGkwV2crTmwxL1NBbWRSQ0VTdHkwTFRabUd1?=
 =?utf-8?B?TnVRVmVhcVNFZVMxK1k0a1FzcUljbUZCY29OZ2dsRDA2M0hVaUVsbFVEcUN6?=
 =?utf-8?B?dktnWEc3SDRpdEF4VFVsNzhpeUFZM3EzOWNIcUhHVncrOFVpNmx3TVd6clU4?=
 =?utf-8?B?eXJna294d3BSQU0xOVQ4eUdZS0daYUI1ZURUekdnb0hTbVo0RkwxUmNEcGxm?=
 =?utf-8?B?VUFyMVpqZkJsU2c1RXVBMWYxYXcwbGJLR1FteFlHdnFXcFY5R1lyckQ2SXYy?=
 =?utf-8?B?MVA4bzRuMWlRdVBGaGduQ2d5RWJGSm1TTFphRzE4WjVzeDlGMzJscU9kMG16?=
 =?utf-8?B?dDBKMFVSNVhYY2k5L1gzajJqWEVXOUpWZDJMOTRUYTJFaCtndW81UHNVUER4?=
 =?utf-8?B?d0thdVd1ZWlBPT0=?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 01:13:17.2946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25399687-8ba7-421d-8088-08ddaba9cf90
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR18MB5496

Add device tree binding schema for Axiado platforms, specifically the
AX3000 SoC and its associated evaluation board. This binding will be
used for the board-level DTS files that support the AX3000 platforms.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 .../devicetree/bindings/arm/axiado/axiado.yaml     | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axiado/axiado.yaml b/Documentation/devicetree/bindings/arm/axiado/axiado.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b4b7f9418a1a264b04f448cc24b3292ab18cd3dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/axiado/axiado.yaml
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/axiado/axiado.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado Platforms
+
+maintainers:
+  - Harshit Shah <hshah@axiado.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: AX3000 based boards
+        items:
+          - enum:
+              - axiado,ax3000_evk	# Axiado AX3000 Evaluation Board
+          - const: axiado,ax3000	# Axiado AX3000 SoC
+
+additionalProperties: true

-- 
2.25.1


