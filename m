Return-Path: <linux-gpio+bounces-22675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CC0AF669D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 02:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A33294A4F0D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 00:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6240086348;
	Thu,  3 Jul 2025 00:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="dZQOLp7G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2113.outbound.protection.outlook.com [40.107.223.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973483D561;
	Thu,  3 Jul 2025 00:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751502171; cv=fail; b=E9r/8z9/8BnLpf3cNmMjXEx14fv0Fd7ua593G4PmYmIuD+84CiVxWsmZV+IKuhNKbs+d0MBW+iQWztg3iDKrtDb1g9wW9eLl2EFYSJfMHUafmWRoN8FlQXHY/UOVPE6mlaHfPHoEJDsQ3CuP5uAH/QwcueOZPeeW6+NSKCgSWHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751502171; c=relaxed/simple;
	bh=dz3ZT8g3Pb6xpI7ocE2Ttkq27pjwWYTKqzDV8I2uLI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lix7ROsaar1C+ur+Jes4SYwqY7LCMnF/6IybGaOQLgXZj7DUysZrc13Hmspxe5vedAeN3tbkiBPAug59xtb2Oh+1lI6Xjhw3ISGM4gHP9KxDyldiTYkUvuEri7rHsDS8EtUm/xnfb/7Y4EBSnWh/XOzpjASrldb6BZkD6FoWASQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=dZQOLp7G; arc=fail smtp.client-ip=40.107.223.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+jGlrGS8aN05+5iHpNbrlGMu6DBvS6ixmem7DJQy50wX1UEmmsinQWFE3ZDgu/mgfwrrwexi0U1S/9De/9zOtMbzZ2tFnGNJaEGoSCsrSfJLn626D0U84bufEN5jLcRrMtH431rZZHCaIVg/dCnk6dYhEKPwXM12roAUGXLuSI2VYSjU3jV64kqplmxCzX+PHuXtaRTwNdeSqDa38w62LodXNvTUE7NhdsM0UnHAyi8SW+MDgJCpWNUgk+pvf1rujqo3omKJaDA8gqyHJINypO+dURwYhzbH/ohQOvXCIzotA6q/Oebg/mgjUQqi1qOfymADkqSfPm75zT/USmW0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQIthYhlpa4BOWQKixks/sSoFe8cgp6SPyWv5EgOuhI=;
 b=kbN7BZzmWM+OtNHXYGYkcgxmUBv2YhQZ9FmFFLarDbJ+UPmN9PHKRiBSZ8NOWRu6HjvmwzzfFHvP2IWmz20po16t9+pw9dgr4M9gNeU6U/lqhkfLxo/MFV9N4QVC+VIaXXSdJl2IsITsvSla5DPP7qGSsX5hpgsAK5OS3CqisZ0njA2ZMMar38UKVIVxwxg2ibolPBoQVxGF+GzGKtFrgoh8HYutfDcURYiSYAhdhvF956DBdvSogG02FnQc0+8FO9soTjtRTcOBwkzgJ4vGCdfcZDN7JVbpBm8qyfbC0vJshwQFYA5kZqcqkR3iwVhm0Vh414s0xboKFtG8uiQwgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQIthYhlpa4BOWQKixks/sSoFe8cgp6SPyWv5EgOuhI=;
 b=dZQOLp7GZBEcM3LNsOuU2uGBtqGI3WLKLHmd+1sStrkSQkfNtsvvHab3/DFYb2s0LL4hoLxUnZcYhJ3M1gbu2gDCW0onQ282sb76tfAN4xIgsD++nJ6s5eXMx37o1CtR7YYNX2uSIjjlR/r29s39ewOrHqqHfCmC84XPrfH69MEQ7X6vK93tznMxNpORzenzr4HD+6XxwNZ/deau8Glx9wP+Mml7sdvoujXkVBaXvsaNuHsbKlupo6SY2VKUAo80sdI5CMT6kNTnwq0YRhpC3IfQvf67CarHf78zgrb/HLxtkznbsrY0rh5uJct8tjFTfQBp6zwp+y/ungwaP468PQ==
Received: from MW4PR03CA0119.namprd03.prod.outlook.com (2603:10b6:303:b7::34)
 by DS4PPF9E1D1CE65.namprd18.prod.outlook.com (2603:10b6:f:fc00::ab3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 3 Jul
 2025 00:22:47 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:303:b7:cafe::c2) by MW4PR03CA0119.outlook.office365.com
 (2603:10b6:303:b7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Thu,
 3 Jul 2025 00:22:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 00:22:46 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Wed, 02 Jul 2025 17:22:33 -0700
Subject: [PATCH v5 04/10] dt-bindings: gpio: cdns: add Axiado AX3000 GPIO
 variant
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-4-6ade160ea23b@axiado.com>
References: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-0-6ade160ea23b@axiado.com>
In-Reply-To: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-0-6ade160ea23b@axiado.com>
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
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=940; i=hshah@axiado.com;
 h=from:subject:message-id; bh=dz3ZT8g3Pb6xpI7ocE2Ttkq27pjwWYTKqzDV8I2uLI0=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZc1S5kDkyiPi274CbFqZ3GVHfIUG31rwJjGVh
 S1TAn3XWhyJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGXNUgAKCRDxWHMRoTLV
 +8HzC/9fFmnEXbhdpEn++fA6kznKo8hV2bMHicJx9RkTRT/2Dmjx/gvNV0a99OpuIsFwaxVioQP
 0UraoEsOD0Lt4vbdjLKGpe3sdujh5v7lP72MnM+aE9sl1ezTYCWP0HSzjEMmgYzVsXJ86/Wf4t1
 v7DhIsZvCDBnRM4HURIJWfxuKxeWl7txnFHocyiCpSK/PQcQf4+BjDcybvRsDZJnJTETUYdZvpS
 diJVBwUiCFovSVF+wlQvElvpOJ1wCKT1GLt5pK7h2qdL/EGOX1VnBt6wcmtbLPXNsKYzs1XvMm/
 i4yrVO29a/MxI9LJ3UvL2LYmNcl8tw5W85BuO+JcRqZVRl1kdfoIbjg+iMYoJCMaJqtd/5mu+3f
 W2WKQtFvdmWO1l20S2zA9xqOZfWGOGXbf8jnfdVyz/+r9Ts5/gR6jUOiQUtbm7ybqOQvRMw4tDl
 fMKEAZi5CDBZI45GrJPsdPfDfex/t2EFecmui47pdrwSwPVEBX3eaKBQXr2ziHchTdHEs=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|DS4PPF9E1D1CE65:EE_
X-MS-Office365-Filtering-Correlation-Id: acaf8a30-759f-4ae8-b355-08ddb9c7bca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1YreFZvRWRhOW1mTkVsMzhPWUtDWnpTTkQ1MWdTNm1xNkhBUkpwRG43ai9E?=
 =?utf-8?B?eS9JM2JuQmZsTHpYYnVMMy9iRGxRNksvaVVVMzNQY1ZrRERTTkJoWnRvK2xn?=
 =?utf-8?B?RzA2NGlUeVp5QkFNQS9CeS84TUdSUkhRc0hHVytHK1Q0eWhIMDB3RVV3WXFy?=
 =?utf-8?B?d1pSZCtXOE5pSjhMZG96YkF0SkNyWFNFc1VTeWhSYnkwRU53c2JLU3VYWUEw?=
 =?utf-8?B?RDN6WUhhclN4cllkRVlNMlYvajVzWXRGckRUSTg0aHVXa2tXVm9oTFRkM1Rt?=
 =?utf-8?B?cndBQTVSUU8wLzByd1R0VVdFL3hjRm80NWQ0R2pCUEFLbEJLZkJJTXphUlg0?=
 =?utf-8?B?MjJRaExONWRpY0FYYXBvb1JDYUpmbzNtaVZ6eVQ2QWcyUmtTOG55Q0taQ3A2?=
 =?utf-8?B?SFB3dzhnNmt0dmRJMmFxR2ZPZFozMnRCajFMZGh3emdjTTRSaEoyTXBGejlh?=
 =?utf-8?B?NzEzK0JhWExIaXJ5dHZETkNreTV6OFEvalNPUU9oRllmcjI3eE5hVXlKSEc4?=
 =?utf-8?B?ODRYS3JPcTk2YlRhUFkzWnFSSUlCdDdQTk9CMVlNV1Z2VG92TCtWbHpuVTZT?=
 =?utf-8?B?NUhqQUFRRmQ0UEErQlhBYVFsbjFVRmMwUHZ0NW5oNDl2d1o5YUdCK1dSY3hW?=
 =?utf-8?B?M1ZGZXlZSmxhWG9ibFRzRUUwcDBuaEUvZUlwdkFSQ0dJWjA4VXhwWmtjYUdh?=
 =?utf-8?B?VUdWQzBuWXlrakJVZytRQWNOMjdNTm1MV3Bkb2pzSzFZSWtrZXI4eGFjemY5?=
 =?utf-8?B?NEZXOVlYdTZBSVBHZHk1WGFKUjVWdlBqOWVsZGpwQXVHSXZyelkycXdqT0h2?=
 =?utf-8?B?RHdHeEVrV0Njc05yZEVoTTdrSGdaM1lEejgxYmZFV3VxM1ZlRnJzVWpNeDA3?=
 =?utf-8?B?TFBjT3VqRXp5VGc0cTB4Z21kRis0VXBVZ3hORFVOWjc3OHVTMEVYYWdkT3gy?=
 =?utf-8?B?NTRFVi9JNnptS3RTQTh5amZnK0ZMZFFwZUVzeTQ4WHFDUEhQL2pxSFV5NmMy?=
 =?utf-8?B?NWxBa1hVUXJ3MmhQVU5UdkNCMjhEaVQ0b0NvbVI4UmFFZklBVEU5Uk1qcXM1?=
 =?utf-8?B?ZEpLa1p1SmtuVmVPaU10RW5EZkl5VHV0Q2R0cWR4dGFjQkFOeGQraGcwVTZa?=
 =?utf-8?B?aVNTUHQ0WGFPdnpkdStSSnVQMWF2SEtXMnJHV1o2Y090Q3JIUFJ0NmdXdmRW?=
 =?utf-8?B?VjVmZXBVbE5za0ZGeE4rdVpVelBDZzFWOEsxYk9YRGxGb3VpT0xrSnNqRDFj?=
 =?utf-8?B?MWZ2aHRMek9laGY5SjBCODIySkt4Z1NGVUdCY2JZQnI5VjJkN2QwNmdaSkUr?=
 =?utf-8?B?V2Fvc25Cby9jNmJGdmFHdEZVdXBKNXEwT3hsbncxRkVRd0dOejV4SkhVQk1o?=
 =?utf-8?B?VHYrMzFBenh3dGlFdis2ckxwTmhZb2VKNkdpblpZVVVSdzJSeVQrZEU1UUFs?=
 =?utf-8?B?VEdLaXlrdjJkM05KRjh5VUpHT2txM0FtN1R5SktLc1FsYTRBRWdkY2M3ZnBr?=
 =?utf-8?B?N2hNZENxaHI3d1ZFZkRkRVdGd2k0L1hxaHV0cTlvczRLK3lZUmw5eUFIYzli?=
 =?utf-8?B?OG1oVUpsai8xNFkyNzdScGFmWjJkcU9FM2VGaVlyWVd3MFVIb0QwSVRwM2NE?=
 =?utf-8?B?d3ZYTk03TWt2d0RCK1pDTWZjc2dLaEVhcUdaYzkvaFpSSkJ5TkpzakdtSmNG?=
 =?utf-8?B?ejd1N2pDbzg3TWRqT2pOV2FXdGVuQVFCeU82eWhlWHRVcXlVaFlSSG5nUFZy?=
 =?utf-8?B?Z0N5c3Q2VUZlUkhlS1cyQld4MzJQRjU3NjgzeW1WekxFalFZckpaQ0tZVTVl?=
 =?utf-8?B?eXJERXVacGRkSWlxWURISW9CaFdseklXaWhLc2kxRVZWWG4yWlNWZG1xRGZI?=
 =?utf-8?B?ci9QU1oxMlJPL3RzSXZFL20wSjNQdDFkZk1hT0sxaWlXY1VGa0doMnBDMkhr?=
 =?utf-8?B?cEcrOGlFeTU4Ny9TN3NUeU9kekV6NlczbUt0b2Z1MUV4NlRTYjBzcEtJN25U?=
 =?utf-8?B?NHFiL29uRWtEVVZzWjZGZUVBbTFzeCs2QkFOM3A3ZUp4eWtpZ3ZsMW4wOTJP?=
 =?utf-8?B?dGFjS1VLdFpvc1Z4SDk0UEdXbC92VHRYZXhxZz09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 00:22:46.7737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acaf8a30-759f-4ae8-b355-08ddb9c7bca0
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF9E1D1CE65

Add binding for Axiado AX3000 GPIO controller. So far, no changes
are known, so it can fallback to default compatible.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/gpio/cdns,gpio.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
index f1a64c17366500cb0e02a0ca90da691fd992fe7d..ba55890d34bb41e14c3e8afde74111291e40ba7b 100644
--- a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
@@ -11,8 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    const: cdns,gpio-r1p02
-
+    oneOf:
+      - const: cdns,gpio-r1p02
+      - items:
+          - enum:
+              - axiado,ax3000-gpio
+          - const: cdns,gpio-r1p02
   reg:
     maxItems: 1
 

-- 
2.25.1


