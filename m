Return-Path: <linux-gpio+bounces-23652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D35B0E4C3
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 22:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AF737B11CA
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 20:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85CD2877D2;
	Tue, 22 Jul 2025 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="MMrx9AaJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2117.outbound.protection.outlook.com [40.107.223.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA39728688D;
	Tue, 22 Jul 2025 20:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753215382; cv=fail; b=Mew1Tsn4s3wJkfR3LKYFHDYSUl556vDVGfXgpDv4S7TnzcCsvBlNOG+yfk6/4zdyFiIKd8sbAPIZSeX6wq6akzZ5ONjL1lR/015vPl+4RBb84DU0b6LRBDzZZg6nrS2GQIMD7UBEKKe9hStW8d3/Fbesk7FxfY4aidFVOXtgDLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753215382; c=relaxed/simple;
	bh=oqOLnsGva+wPWKBV0xaL81/LgRPcT7TGX2bClTkgOcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=StWiS7+Mb4lE7uJALtgGR7eXZTbp+k3Uy9YSj0fDRxVJW/ScumDqVwbtlXLmN6nOsCk2a5sVlZsI+2LXOeWlNHDvsydfxppBvSuFhJUwBf/XF4lEAcHXLttPIZmBSaR/kxIlaLHiuFh9iYqI1YXsJBqEISJo0NSaLh5jO7jjOL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=MMrx9AaJ; arc=fail smtp.client-ip=40.107.223.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xaG/DE4hTTA51efToOA/MySD3Hp/bC0sfMA1fw1JbQC72mUfnHp33siwB4EIqABe7BaQpwR6pFgQHocHuNkfRAM/OAL/acLcv0DP29EqcCmYlem6wW0JDKF0o3qPjiSmgeVKj3qqQjTcjXg3xWlCwud8M7JwZaxm/yFz+4CsjPzzFX68nZrj2exSoIgNaFKCh1Fr2AvsowjkME1CwMtN4MjWdgWg5tTRvokgiMdooxYQOqG9hhOc8W77GDvHWNDXUDXRk4vN3B+ijYpSfrD3+zQXckSNPWbOvnsmbszTM0YVzQVLaaWX++1p+kca8N9XYU4/zTvbcFUbrkT6YJc+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7lcAcGYGvrReVuHrp2eFsA2+XgaPwSGUTAKG89xnGI=;
 b=kueKacGCWrFv0vSvkJ7KbAzJBeOb1E6aOVqW/4+puZO3L9hId94Hg6etny18VaAD4QJcrdDinPlOEcPv6nX8L1J0/nNFvfrre0yvN2nxp9sysIbJq4vNwCawqPns3vCEgvmyIhPurnE/1qJ68JiWRVzm/FYMxaZR3drtAUc8jPu3G1lWbLg3CiAAnsR+R+3B1PgvNJOQI08R7AAgqYPJ5YshCTsSxr2fcDUew/ulm56a7ri/g3ITdU6Mi1GrdrV4vWmWQ1lNzDCNfOEKJ3+KVND9UXCibKCwUTT7CIpByyV8iFpSX389B1V2ZNqB+bE+bW6flX08QhKrGelrZXcOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7lcAcGYGvrReVuHrp2eFsA2+XgaPwSGUTAKG89xnGI=;
 b=MMrx9AaJ+XhfMVPsGNMQt/JaJmXjjyCKWaDaouRnDsNMg4fzsukhroqm6WH4G/lVxvgcEQRIMPL9ziJwMF2kN/8MzSBnLi7w6SV9jTjg+dmP0cy5QF6JtaZhUjLcPYbhbWbxPoGsTX1EOz9U2cD9DgLqJ17srPVCb1gb2hKGt/fmfgzfpuKcS81pSACUHEJ/G+SUGT6QB5LKUcG/1LJVUYTCF1AdMM5kC7BU2O9IUVt4WZjOIphMIS8n25Zlo44SSZPHH2hovJvfAnHbLFVEioCmy9Tk66ItgRdzlMU6t2p4Hd0A5cMwef7M90Jdsp9s0mi86FPocZU2/qgVwz5xEw==
Received: from CH0PR03CA0022.namprd03.prod.outlook.com (2603:10b6:610:b0::27)
 by DS0PR18MB5432.namprd18.prod.outlook.com (2603:10b6:8:160::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 20:16:14 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:610:b0:cafe::25) by CH0PR03CA0022.outlook.office365.com
 (2603:10b6:610:b0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 20:16:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 20:16:13 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 22 Jul 2025 13:15:34 -0700
Subject: [PATCH v6 06/10] dt-bindings: i3c: cdns: add Axiado AX3000 I3C
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-6-543979a60ccf@axiado.com>
References: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
In-Reply-To: <20250722-axiado-ax3000-soc-and-evaluation-board-support-v6-0-543979a60ccf@axiado.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 soc@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Jan Kotas <jank@cadence.com>, linux-serial@vger.kernel.org, 
 linux-i3c@lists.infradead.org, Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008; i=hshah@axiado.com;
 h=from:subject:message-id; bh=oqOLnsGva+wPWKBV0xaL81/LgRPcT7TGX2bClTkgOcg=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBof/GDuoneCFUNB9UVUhaLTl/AI/tK8uL0mue1t
 3lKiyZAE3WJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaH/xgwAKCRDxWHMRoTLV
 +wT4C/9kipzPF2EhaKbU1tdr5AuuE01yPYtCqZDzHsESFoHw7Er3ppJTxMvXbdLJ/Y07G11l/gh
 /H+xJ+buhnRvu4gsRBQ7nOxYVPQc6vt5sOGV4oNxVs/fpWovXIvpUOya9pkq6o+OLQHoxjYFaZ6
 v3pPYhVg2pMxRJ6JUg1wqLgr3GOcX9C26o/T5NG0vSuI97oI6Vshp4MWSJLNI7BrC5qobMCdu0D
 M0Ks08Sh5INRZXpWT43aMfZ99G5sdkW11Bf8SrSJRm/OzCNfA83VEiHkNh9OEcMQXZOWikvj/an
 IMfJ/zI6yJl38Do41bGqe67adqixzyobnInLd6KtvWQMruFlAs9u9KIMPH6ku1lTlBQadi+xInM
 1uXRWiH1oI8DxYlagzoNCgpj1BJN1rg8Kcxb5kJUFIX/7QJficv+tAsdj4MJcgkPLlWKnH2Hbgx
 kw/ykYc3xzoisvxaxB2LV5PMtw9QzeKBwMm2IShPjXBk9dIkVCT7zLDm1yN5AWwKRCkIc=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|DS0PR18MB5432:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b258ed5-70b3-4e7d-53cf-08ddc95c9bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azlEZVVDRU5TRVllUUk3OTg1NTRyY1ZoL3JlblZiZkVkM0ZjTG4vWkt0c2FH?=
 =?utf-8?B?a3hLdVhGYW1YNWlmZk5IdFBTWjNHdDcvV3g5enZaLzFielkwNUkzOUZpU3Y1?=
 =?utf-8?B?M0lNUElMSkFVR2xmZ2RQdVh2T0hvT24ybUpNbkdGWHUxZnRoNFBxZGtRd1pS?=
 =?utf-8?B?RDh2SEpPMnE1VGdnRTJNc2FRejU5VFpsNStWeVJIRjFCdEY1cWJ3b1czU3U1?=
 =?utf-8?B?MyszUFBuNzZDdWpOVXlvMzlDS0F2NUNKeE9QU0JLY1R1bitCak5BMzBrZ09t?=
 =?utf-8?B?VzMrUUs0K0VWN3hsZWdRemhJYXo5MURNYnU4VUxITWFqbHZOR0pIeVJFYkZG?=
 =?utf-8?B?b1ZGQ3ZNVlMwTFc5Tk82YmhVbXRRUnA1UE04Mk9sVkdOeU95RnRSeHNhWUJT?=
 =?utf-8?B?MVdOWlJzN0pRY3VLb3hpR0Z4dlpWeEN0Sk9kdlVWa1lNa0plUUZCb1k3U1cz?=
 =?utf-8?B?L0FDY2doMm5NVDZOUDdNVWlZUkRHcUpNWFF4Q1I4MFNjNXBUQ3lxS3hpM3cw?=
 =?utf-8?B?amVIcm1NQ3M2aENxUkp6OG9jYWdCc1dqS2NBdEswTzV3QjdKY1BwbDUwbnRk?=
 =?utf-8?B?S2g2S09WQlJNY0xuZUNUTTVMQ2ZkL0o1UWdVV2VMcU8ybHBody9hN3lXaHZE?=
 =?utf-8?B?TkpIcUxrR0xPMjJFT1lWcXBuT3ZOV2VUQm5WQUV2SFVrTnBaS3BnTEJoalox?=
 =?utf-8?B?aFl6TFkvbDBmSTlPSGxsbXNERWVYY2NYTmR0RXdPYVM0UTZmK0cySFBqT1Uw?=
 =?utf-8?B?WW5yL3FmU3NrTURhTCtUUGVlbzNuaWxPODlhQjlmTkk4QVQ3R1ZHWERrdXlZ?=
 =?utf-8?B?OTRoVEVvWUVsRFpuRklheVRVdVJwRGdXWUpPTUFjTHc4VjVZcUhYTVZobVcx?=
 =?utf-8?B?bXNYaVNYSnZENktUdWNNRldtVnJxays5Z2xDRDlJaFVmMGs5SVd0MGsyNGti?=
 =?utf-8?B?VFRsYzNLRVhmWHM2VGJzZXRaZTBDMzBGcFl3eURJeldDbm9OaGpVMkgza0R0?=
 =?utf-8?B?TWlRQUFScUFld0ptcGR1cVNzK3dIVVNPSTY0bEFxdzRDTWFUUXkybzIxYml6?=
 =?utf-8?B?aTczaDBYTGs3d3puY0FqZ1RJQS9tWnMybHNxd2NETE9LOFAzVTZOMHlOdnpX?=
 =?utf-8?B?VTVvSjQzZkZab0hNZ3Z5dGxuUytGVytITmxhQVVHVVVoMlNXbkpXMGxhWDZK?=
 =?utf-8?B?czgyakh6RGhjWGc5YzBlYUhacy9Mc2lubXd3OVpNS1ViNG1wVFRldXpYeFVT?=
 =?utf-8?B?V3ZKWFE0cjVveHFuYzBWamNxdG1vbmJWWFdXRG82RXVCT0lrbFdXY3VjK0xk?=
 =?utf-8?B?YzBrWWpoQVVCamZmUlNGN0k3UFNOTmdpSUVha2RzQkE2eTFHT3JCeFNLa2FE?=
 =?utf-8?B?Z3p1aGwrdzJKUUcxWFF1UGUzTlJaTTRKQXliV1lxQ2lwYmtsN2ttWFNkbUQy?=
 =?utf-8?B?UWtQRmU0djZoUk50S1M1Rks2eW5IVE5qWk9hQ1ZiQ0h3alZocmNVc29UTUx0?=
 =?utf-8?B?Y0NjRzVobUhBTGczM1IzMDhoRXZXbDJhQVpyam9lWnBZQzNTRXRDUWx1eXl0?=
 =?utf-8?B?QW5UZkJkeWw5SVkvYmVYTTJGbWo3Nk5xQlN1dkF5eHVENHljVExJUVVuMkti?=
 =?utf-8?B?YWUxbHBzSENMamVsbXFMa0JIYUNocjdHcnovbHlFb2duMEpWeHhzZ2pJSXhV?=
 =?utf-8?B?dFpTbzlRM0g3NFkzREoyVS9VcjVFU2NlRXdzeFhtT2VuRXFvbXJxRzFRa1Vq?=
 =?utf-8?B?L005NEpmNThCQjJza2ZFNXZKalZKMGc2YjNPdkRqNmNTVkxtK0gyRUZsU2RU?=
 =?utf-8?B?cFNhR3BSRDFzSGtVcUxwd0JOdDZFK3NWODRZYW9GODNhTlZUaGxBOTRPM0hv?=
 =?utf-8?B?NThTV2RRN284T2Y5UmdFaDFqWjA4M1lIR01UYktKTVRZcnJWZ0MzUGZOVkds?=
 =?utf-8?B?WDgzTzEvS3V5VWh2Y29HMytZTm1ObTY4K0FDOGpDNlZqZ1hmbXFuU0tUeU4w?=
 =?utf-8?B?dWZLbER4eGk5UmNUR0FFeFRIZzZoTDUxU0tKRFlBQjZsUGtZUTNaVVc5bVdo?=
 =?utf-8?B?THlPMkswTFhtUjB6b1JYcXRDWkw4V1FEMklHQT09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 20:16:13.7709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b258ed5-70b3-4e7d-53cf-08ddc95c9bd4
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR18MB5432

Add binding for AX3000 I3C controller. So far, no changes known,
so it can fallback to default compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
index cad6d53d0e2e35ddaaad35215ec93dd182f28319..6fa3078074d0298d9786a26d7f1f2dd2c15329a7 100644
--- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
@@ -14,7 +14,12 @@ allOf:
 
 properties:
   compatible:
-    const: cdns,i3c-master
+    oneOf:
+      - const: cdns,i3c-master
+      - items:
+          - enum:
+              - axiado,ax3000-i3c
+          - const: cdns,i3c-master
 
   reg:
     maxItems: 1

-- 
2.25.1


