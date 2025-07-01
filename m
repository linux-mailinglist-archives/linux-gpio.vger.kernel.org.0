Return-Path: <linux-gpio+bounces-22539-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7C0AF04CA
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 22:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D9D41C074F7
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 20:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352EB2EF65A;
	Tue,  1 Jul 2025 20:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="oCo+99VL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2130.outbound.protection.outlook.com [40.107.101.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE45B25D53C;
	Tue,  1 Jul 2025 20:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401673; cv=fail; b=MHQyteImZ4PTx3ARSqVoK0/vyE1WbQYwtchupuIjF5aNgd2+awUVjpsa7CikC4gfg8UE9XFcdwxQhykrz1wRcmv3ysh11jhN04pjrB3c1Den+v/WQhWDtr2EgGvVNjQf4nmV78sC72gMvHi+bYJrnX5lVYwlav27tHYrsWgGETg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401673; c=relaxed/simple;
	bh=2P0fqQ4rK4FrrY5jP0Z+4ts52LSAML5KAClXxLndh0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g/VY4tfAUU2j0O4ALFhO02ahe4ngwNUl41qohQxqJyF0k+5Q7CrjI456qjJXMRntEBWP6XWmXdXjRVxCluB/Fs9yqtilsqsuDe5/+DFaJKHlnJ6Mi170pTVl37u12tNuEwAj7zUfvftIKS54ZNce/gSKC+8sKSNsQfUnMP6OQsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=oCo+99VL; arc=fail smtp.client-ip=40.107.101.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4j/vGMIDVd+RShCoU/6r6b282p2JMEufb3IN0RxCIyizB+Hr+r5dOU7JkaF7WiOraVJhHHXs6jri8bK8FXp2rjifsPAdgf9Szca+JMcebl6xkU7gyimi/kgcytt22DOdz04Jp6IBWgJB0m+jyLJ5jJyWhItxEDmof4gebLbzn9NjVE4eM0v+nzXW8QBFWGr7hKXx4ax7nB62h4BWHW7ScX24WBDCOr/1TlOrqsh0hAcGKe8GA4UBWVKcXlWyuM7uklwnLkCWpt1tr4rf2sMaOx3ilphz8u6/JY/vnJsSUp+wbZ00gL5TJpFS70JwpgAIU+3dS2yBBz0otgH3DzF3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84FxozLh+z3Mz5Az4nAW/8Rmh+SGSo1C4c0QaxoJcYs=;
 b=uYNlgeMLiotukcgE9ZpMvb5db9MMMX/0csnIJ1bspZ7GpdVIS7Lj64GAxnyd1aV9Y4N3GNfchtjk4akPYE2e1KH9MPzzPaUAMiBxddrZWGv8Xq01h/A8nqsFFb5wqj3v0kinJQ/fhMJnhOgb4N691Bd7rEJ9QpBnP56hUogiVkeCIa3ixsVHWBdUecVd6G54ZD/0Thn950bt7LhgJbEvlAN9sXH4FSZkrxUat6PG2IpMRVNNrBkx0+uoEGeYJ8CLtUNeLP6u3T1be/Lox9J/S7QqN4bG1CUQJhrh8s0mwmhMHZvKsM1AXlCu8cvdvtqq2hBhOm4PlvVLRaZ0w2QgCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84FxozLh+z3Mz5Az4nAW/8Rmh+SGSo1C4c0QaxoJcYs=;
 b=oCo+99VLFjaomN6NPFFZbUKl5PkbZurLSDE0Ojt0x052z7bN5Cjmgb1imlvU7/VP7OqoTt6otTJGw8+DudDlp5eoxPF1+RIbreQc4gdjC6+ewqqAXh0x1744vEOTacoFz5a/uR+kg1fnYAtRDoRp2pb36zaeSaS/4euvc18BiO4sYIB3uzDFQZau9NV4rPlD3IghT0FXxM1AZ9+mq14yokaholEOkxbF/Bs11/3Cr4wom+q3NXqAgTnNbezpeYWvoEBUUtjbEI3Gzg+yT0deBy1nbfxH+fF737ZdzJRQR8v7c4/Dhl9FPYJEHcQLinq39ismaGy8T5qlyauHbjkWhA==
Received: from DM6PR14CA0047.namprd14.prod.outlook.com (2603:10b6:5:18f::24)
 by DS7PR18MB6385.namprd18.prod.outlook.com (2603:10b6:8:256::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Tue, 1 Jul
 2025 20:27:47 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:18f:cafe::47) by DM6PR14CA0047.outlook.office365.com
 (2603:10b6:5:18f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.31 via Frontend Transport; Tue,
 1 Jul 2025 20:27:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 20:27:46 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 01 Jul 2025 13:27:26 -0700
Subject: [PATCH v4 02/10] dt-bindings: arm: axiado: add AX3000 EVK
 compatible strings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-2-11ba6f62bf86@axiado.com>
References: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com>
In-Reply-To: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 linux-serial@vger.kernel.org, linux-i3c@lists.infradead.org, 
 Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; i=hshah@axiado.com;
 h=from:subject:message-id; bh=2P0fqQ4rK4FrrY5jP0Z+4ts52LSAML5KAClXxLndh0k=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZES9eLSjtcoX+W+R/5/PonCdXrxiO5gh63ygA
 Xg4eBfSqUqJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGREvQAKCRDxWHMRoTLV
 +0wCC/9UMh8fjD+t6pEdtRw//QWhgGgTRGLvA2EOGya19hVVrxaFIFrzrMVkfKXVP2oPH1mh0sP
 X1byoqNXwYWynKwR7ttrajrFSMrRXi/sQPXcvZnwkqyiOLLvTqE/hzr/4ESQTzzhhJK75xRPqDp
 nKKNF0sok1yR3IEj+mHgP7NE7rj83A4a6M248/99zdBC8QQtWcpB2DuYerfJOR5u6kQk9vdU2qF
 W8GV9iqmbl84vKvUvDCPz4roHdj2S6nfvYzEWmoKMMmLj/C8rO+eOY3sSWkYf5OLihSN2zC63zu
 PO8FPKSkUY8GOGkQ5rK9xE8ioGtUfqGiuQC/1ZECV5B36kRXygrBTJFKgiiE3IlYwgKpSDfX/Jq
 dHIzB5xo5RZs1UVOzkDl3XjtmLenGpNTCYSZm8GE1nj8o3V2Fjp5yAw9YsVGHmB95WYFGReHm0X
 kgYHIfXuhJSqdQs6AUIiVxonD6p6U0231JNhX2iK2Sdej8aL47wBSFiuxGa+GNFMAqzo4=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|DS7PR18MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a060db-f67c-437b-5394-08ddb8ddbe66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWVERVZpaDhTL0paRSt1ZlNZWWNnVFNlNXBlV2VtSmVDNUg3OFljQkNNeUc1?=
 =?utf-8?B?NDZTWmV1bDNWaTJqRlhSSGZnamRGMkZQSlZ0KzV2ejQ2UU9aV0pDTzdnYUoy?=
 =?utf-8?B?ZWREME9pVFRsYS8zaW1iL1B6aUhiL3BpTURlVmE0OWRZTTEyemREZjlENG14?=
 =?utf-8?B?elVrdHNINlVSQVVWd0xOYnczMHhwQk1GVmNhYnRUR1JsQ3M2bE9MUlVUeVZu?=
 =?utf-8?B?a2Fudzd3YjBDMTIranFBU0drb2NIZ2NhM2NuVm0wUTFyeXZFWmp6dnkwTlRC?=
 =?utf-8?B?a3htYjVFYklHUjNLaWFxQUx2bDFIOXBkT0VDc1luRzdBZTQ2aENPYzh1djFC?=
 =?utf-8?B?aWVtVG5WVVRDVXg2V0c0NHlaUktzbjRwK0ZBRlM0dStVZDdVVHpYYis5MHRl?=
 =?utf-8?B?dG1kZGRWMjE0L0d3SHZZc3dSczZQckQxZXNqakpJUHFrR09QSWZKMnZ5RGhp?=
 =?utf-8?B?NTNUVGd2enR3b2luSFEycnpoQVM4c3hKekw5YW5nTlhqZWdnRmNWMWltNmpC?=
 =?utf-8?B?akFZaEhPOGpHVVpRMmpwUnBlUkF4Q2MyVmRTalVuTTFQRnhpZlUxQm5NeG85?=
 =?utf-8?B?c2NMb2pkTm5tZXB0amZCNk5KWVRldENlVFJiOUlDVysvVWhYNngwT0FkQUg1?=
 =?utf-8?B?UC9oWlgvb0RNc2dXSTduMkNLZmpkQ0xhSWRzc2FjMm1ZQmhHVlA4YkQvaTA1?=
 =?utf-8?B?a0V0ZnNiZXRqUGNQaHAwOU9aSFY1Zis0bmd3NHNzUWFEZld1YnV3T2N0aDZn?=
 =?utf-8?B?SUM3UlZZREZyUmJtMWZvVnQ3RGpVNUZPajJkNjdubU5rN0g4b1RJaEZUNGF3?=
 =?utf-8?B?a21qOUpsVzBsUXVZaTAxQ3FEZEMwSlhZSGNnZXUxZDVPenVYeFE1MXVZMzVW?=
 =?utf-8?B?QTVHSUVYZDMyb1pNUm8wYlIrajJFSDdBajB1QW9OMWdUZ3htZWxYOTlZYjBV?=
 =?utf-8?B?VjlOMFMrQU03VUprWEV3dSt6V3F5ZzNibjF2RzBVZnFKK2hoL05kcWM0TGkv?=
 =?utf-8?B?RE1HQy9jWHBWQ0NNVDVNdWlMbG5VYkNoa2dSRk0xNlFjbkN3OG81bDF0QTkz?=
 =?utf-8?B?RUZ0aHFxVjlBV3crdzlmSGYvY2hmSXMvM0puc254MXh4UmRJZ3hObk1KUXBV?=
 =?utf-8?B?bjdLejFoK2V5QlBYS1BSLzRXN2xxMmlxcFh6MHpKNGlVS0JlNmYyNWtnZExv?=
 =?utf-8?B?ZktxYUhpV1k0dk50VWp1MWFuVmdOVG4rN0xYYlF2NkNaemp1MWo3SjNYTk9J?=
 =?utf-8?B?WHYwTmwvaTkzTUVjRFhOb2hKamJGWHhIS203aFJUMEUvOEpqZk1xU0M3WFNv?=
 =?utf-8?B?VGxEY3J1bXhuUnZtSlZxSFhpRUg2cGJWcnhOTjRlNWlHWENYKzVFSytINlVZ?=
 =?utf-8?B?NXJaTWZaVkh1ZjZqdE1KeVlaL1FJL3dwZEswSSt1VnFwT0EvbWNuY29lVkpx?=
 =?utf-8?B?aE1xZnhSdk9EVGpGb2FYSFhiRTJKeDZkMkthNCtoT2JYaHdHV28wbzV3KzlJ?=
 =?utf-8?B?VEl4MTh1STNPVnVMaVRhbHBINzRRWXNaY3ZQUTRhcEN3eTdyTmZ6ODBvM0Iw?=
 =?utf-8?B?UXlhVkxyVzYydDdyZmM2U01HZk4yaUFxcVUrOEh2Z2tNaXA3a3gwMWExb1FV?=
 =?utf-8?B?ZDlhZWFtWnNjM2U4Z3czcWltMVd4TUhQY3JpRHBGSmVvaEZ3TDg3VC9WQ3Fr?=
 =?utf-8?B?bmpYYzRha0lrMTlIQ21xZXRDZTdkVVJ1eEdQdE9mMmxUR3k1aXZBeHRrS1Rh?=
 =?utf-8?B?Ty8vbW8xWDNuT1ovQlZCbE4reGNlN1k0Wm8rMkdPa3QxUjBMR2VsamNOZUQw?=
 =?utf-8?B?T1dzZU1Gdm04cmVHeHpYTTdwSXFjb05KZlJPT25UK3poS1U1YXNMd3N2SFlv?=
 =?utf-8?B?OHpYNVFRSkZTMVhhUmxDMFd3bDRxNk9HSENhaUNtM0ZYMWlWZjZWK25mYXdy?=
 =?utf-8?B?RnFsSWh2T2hUcmFPdGhEWituOEdjWnc3bGp0c011TG5WNTFDY0JSTk9DQWdO?=
 =?utf-8?Q?G5g2OMx1X4LjXrI4ZCot1ziGf9XnQ0=3D?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 20:27:46.5579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a060db-f67c-437b-5394-08ddb8ddbe66
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR18MB6385

Add device tree binding schema for Axiado platforms, specifically the
AX3000 SoC and its associated evaluation board. This binding will be
used for the board-level DTS files that support the AX3000 platforms.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/arm/axiado.yaml | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/axiado.yaml b/Documentation/devicetree/bindings/arm/axiado.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bfabe7b32e65fb06d1f4faecfad032219f95dfca
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/axiado.yaml
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/axiado.yaml#
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
+              - axiado,ax3000-evk       # Axiado AX3000 Evaluation Board
+          - const: axiado,ax3000       # Axiado AX3000 SoC
+
+additionalProperties: true

-- 
2.25.1


