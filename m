Return-Path: <linux-gpio+bounces-22544-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC09AF04DE
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 22:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 688DB4A55FF
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 20:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD462F0C4F;
	Tue,  1 Jul 2025 20:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="qYvfTmR5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2139.outbound.protection.outlook.com [40.107.94.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727A72EA489;
	Tue,  1 Jul 2025 20:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401681; cv=fail; b=Cxl/SHQKK8wo56p3ah8ZteJhkZstveRet3VebRDTD/7tXnwxj+ThQ4/CqPf2hsWxmPblPKFdjhW0xMcaYWwIlUDoSh/m6mKMeLf3A+W8HUe5TYoociaD8+g0OpoxaMin4058svj1Jor27mODDs36ezPCGnk2LuuuuWb4sOMBEBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401681; c=relaxed/simple;
	bh=cl5NcuMz9Y6i+BfxOzW8SDm/AeqJ3J++rlUInBHsi2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=if0xbQ8C72H/txttePL+nfcLt0v1Lsk3PXRB5IAR6sTJE1iMaew4zrFM9iGBICdrP9a31NocC60le9lKgww0+CVh24a1y7cJWFPZLzXKcWXl1Mklwt4j3U10OTJa8ZifYSLy8h8g/4Th/0kjZBMxN7MUxh923By5xadqQjTX5K0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=qYvfTmR5; arc=fail smtp.client-ip=40.107.94.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MnL9NcE/6l3iGpCaLJT2kF8n7Uh/wPT8vbnU2RPEMixCkN8H8eICrfeMy1cFymMKNtsqT5hyylxy2JfDoEGiZAeYBjIMrxwpWUrdOy3p77975otxoNNQAnPcEyq9+1h0psGx9Ux7FW2dLHcfEILsx8BQV9xfsd/2QzL/S5pUV8c4Yj4BUU33f8xVpKxwKx2vHtX6wcALOF6CsJyxh8lY/MgxKq1lhLSRV493pfyoHUuZ5qUyynQPJYhAN6UcXUvawvLZBatCbMmSIWJYaqSrko3WHvjJL927mrY5AMCOWmgCdikU/ETFku5WWWXoD10JQWLEhVMP2FE/oW/3qvSolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wi6eIdOJZi787dC2equMVaKsWhUMs6++fSjWwFwPRxM=;
 b=JFghi1la+c4WYvXT1e4H4sY3z0nYpQsuQ8qo7yID/XQGoCaelqViRq/0FI+I3FKOzVaomNX7ZzLR8/Ca84fj1kRIZGm/ov2ljj6sSQ1T4t/A8LwRWVWeeUMf8GOr0VlsIPVWno78mawEA9bA96pyqMUwSQ/Deu47OjUsmm1692NM+DakMylfvt8CSUYEEeiMJ2rAbo/2qL+fNOy8BDCb6I3VVpoUUdf2P00RSfhn0xIv6sVtkkhQN1BOlRWMuIO455KIe3QC6+j1qJWzAOvpPlRIrRSVZIRoBjaZnttZy0r+QHsa/p1rt95/zJescUDet+1WLFVWO20Y/tBdjn3DDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wi6eIdOJZi787dC2equMVaKsWhUMs6++fSjWwFwPRxM=;
 b=qYvfTmR5fXFeUVZBmHOXA5U08sz4CuaGdcsUhaSocdap3xNKEBxLOaDpkSQrj/Ebu0B9e1I1tr3t7BBJVv3tmmpY85w626n8Pkp+u07K5XsdgLnqSOtUOOUNvB3zA3+Z0FPmRNevxtI2gZCjTGaWGSDDZIcszotWex9ofLcvQpwUT32JSTqHFXYmFqUKYPvheQE8whZ0aQ8LCUEm8t6ex7XeqicmconBZfsCt8AEXob6mo4LIPjXxbnhmJIoqlBSgntqCLhQ0Sv+LKTALB0sDG0F5BDOu68yECm77vJbtEgDqB4vUBPPE+qjBHhyD0QRBCLJ+dd3ritO767zFphPKQ==
Received: from DM6PR14CA0046.namprd14.prod.outlook.com (2603:10b6:5:18f::23)
 by BL1PPFB43CC8EEE.namprd18.prod.outlook.com (2603:10b6:20f:fc04::dbe) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Tue, 1 Jul
 2025 20:27:54 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:18f:cafe::e1) by DM6PR14CA0046.outlook.office365.com
 (2603:10b6:5:18f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Tue,
 1 Jul 2025 20:27:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Tue, 1 Jul 2025 20:27:53 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Tue, 01 Jul 2025 13:27:30 -0700
Subject: [PATCH v4 06/10] dt-bindings: i3c: cdns: add Axiado AX3000 I3C
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-6-11ba6f62bf86@axiado.com>
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
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023; i=hshah@axiado.com;
 h=from:subject:message-id; bh=cl5NcuMz9Y6i+BfxOzW8SDm/AeqJ3J++rlUInBHsi2E=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZES9JvchQ92KUSN+lPAgSimBa1k9/Xpvu/dKI
 G5qAYxjb2+JAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGREvQAKCRDxWHMRoTLV
 +0+QC/wKnZ1MyhfwA0HUwHcAsrQzUDcAWek0Yd+CCZQ6NSRNBrHmn27FH9zhLqWjvFefoD22sh3
 2W3XNBHWkvzV7XQMHTQaL8gK7JU0GNG4/yH86m/gMnfyi12Ay+kdYNZZOfyJvCV4U6T8fj0XIGT
 EfbEhVYk5y4DqhEtk+tlG+MGQLmhPX5VIHIQlVQnAyJbKEy7/CxQECKS3z/uCab+Qs/hVK2/Lb+
 PzOSB4ALm0gwSmLeGvWyO/mCgM28KJa2JZ9mcYTZAF7Isy17Im0QCJ95uF9pu/k8XqRldZlWmNo
 3qF/gd8iXQe6S4UF1loPmD9P46ijWlXFjfCWURyw9U10jacZy3q0raPeLWrx3BBiF/20dLCley3
 yHogX2saFsXEA1mwyhyusaDT040nKl4kvyE5Ysjr1cBIqHJHM2pKCC08eeyVUuWL5Si5Kh9Rbj0
 mFOl4CNbMZOYA2sXLPlvHWdqke1o1n9JCqSqHRG5RRvL2nnvLaQsWCNqeHFcpMZhG7QPI=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|BL1PPFB43CC8EEE:EE_
X-MS-Office365-Filtering-Correlation-Id: 634a75f4-7966-41a4-b7b5-08ddb8ddc254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDZndTB1bmFtNmU5ZXltRW1Vb1R3aGp0NGd5Ymc1eWlKWmFaQ3Bpd1dGS0sv?=
 =?utf-8?B?VDlJSi9pblBLazVNbmprc3k0UUt2MGJwV3RTWkFlaEl1cGhMTTFvMlhWOUhY?=
 =?utf-8?B?TmsyN3JlNExuY29lOUNsVkE2Q1ZvVkY4WGJzaFY5U2pKNzB0dmFSV3ZyUTJi?=
 =?utf-8?B?Y2NON04vNmgvM3NFQjc2NWZqY1FCMklUNUdKNFBsZm9LM1BsK2VqaktQMXhG?=
 =?utf-8?B?Zk5oUWVxYzE0TkhHUGYwYm1iWWY1M1EwYmZya213MzVpMFpYRXpaNlRHRHRI?=
 =?utf-8?B?SWYyR0hyamhrYUpUeHc3NFhzZWxsdThxZUhWMEZUVG8zU0ZyWXlkK3B1QjUy?=
 =?utf-8?B?NmN5V3pUR3o3TEVHT0txL3plNmhrUUoxMGN6dVgwb3d4dkNPU1FIRmNOMVZk?=
 =?utf-8?B?SU9PdGFKakJpNnBOQlRkMjVTNzh0UFVuOVlvcmdIQUJzckhja2ZXS2Jhajl0?=
 =?utf-8?B?eTVSUFhYTFMrNXcvN3VpSE50YWxndUFsUENtbkVkS3h4MUNwWGNCODMrYjBD?=
 =?utf-8?B?SXJKc1pCUzVuQmpBNGF4MklEQUN4VlZubFZnb0p0WUVvcUpoT2xwOFNJRFRI?=
 =?utf-8?B?dzBxaVhPZzAvOVNPcXN2a1ZUUitqRmlIeCt5ZGxQbE5yeHB3dmtvOE55aklt?=
 =?utf-8?B?YldKdHI2QjYwajZSdzVvaDVObXVleWdCL05iMytWS3Jic3FYZEoxSFpGbE1m?=
 =?utf-8?B?a1ZuMUhMYkFFeW1EcExoZWdLRU9FeU9JSk1jb0RoTFhaL1lTL2tYeitHRFJu?=
 =?utf-8?B?RWRNMWI2TFBxeGxFYVNEbXZXNlVtOHFvMWJLRVg4SDdOdHl6TzdieUpzTGVN?=
 =?utf-8?B?UFA1WDN5VjNlREY4MzJHd0NwbnJJYnlpbTlpMERiNTBTTmVYMExvWmEwQXo5?=
 =?utf-8?B?Nnc4VFM4RnFNb0RYS1ZzS0FMc0V3WTRDclBvQkhwK1V3b2VRc05BT3hjN2lO?=
 =?utf-8?B?NzRIYkQrSnNLZ0kwZ25tbG02a1JBNWF3ZUh1dnpnQUtsMGlzT1VjekpGSFJ6?=
 =?utf-8?B?bVRRSlRJeWE2UHRIN0RVUER2TCs1SkNndWRaZm45d1g1Umw4akRkUG5pT1NJ?=
 =?utf-8?B?QzB1Yms5dU9aT21wZTVwWE90cVNCM2lUYUxtV2FJZzA4OGNvQTNTYkhWOFhi?=
 =?utf-8?B?UldGd2NrV1FBZG1oWi9McXZJR0xjZHdpRmpVZ2Z6QWt5bk5uY2Z6OTRZc3do?=
 =?utf-8?B?RXYzL0loZmRzL3BJSXVCdlVob1RRaTdhd3lzbFNnNUNBdEVOTVAxMHZsRDJ2?=
 =?utf-8?B?U2tmajNwSStRTG5xTk5tRmNkRTdEUVBiKzZvVis0b251WGJkYlJjaWIwcERy?=
 =?utf-8?B?NlI0QVV4MzBTdmFzZFJSVzhrNUVMVTNYT1Rjd3B2VDJJR0p1V0xsdjNtUTNa?=
 =?utf-8?B?eHNUVVhUN3RPLzdJS3NXc0RndEpVRERuOVh4TzRKSGJDTGNKdzN2TXpFaUh5?=
 =?utf-8?B?T1lkZkg3Qk94ZktpN2pweEVwckx3NnVjSGh3OVV6Z0RpM1hScHF4NFNmRXBl?=
 =?utf-8?B?K2RQNDltS2ZLc3NlN1BnQzFCVzBZdWVKa2xmVlJjL0d2S2wwc1VCMCszcWhI?=
 =?utf-8?B?eHBCeUM3MXU1TTN5RkdLVHprS0h0KzVDTnNuNzczeWg5S2FHcHg3R0FQMi82?=
 =?utf-8?B?eTZFNGhNT1RPUFdTeFJBOHZNMUYza1BzdFF6S3dOVXVWNEUxbFBPUVlwM3FL?=
 =?utf-8?B?aUdkcUt4U3o5NkF0Y2hHL3hpbWRmaWpGdGcyTmZ3Qk54Q3JSMUxjVEloUVFN?=
 =?utf-8?B?VndyVkloZmlxcDFINXY3Q0wxTkNlUXN2NVJGclNHN2NzcC9vMm9DWkp0c2l0?=
 =?utf-8?B?SXB5cG00VDJCTkpEWURNOU0wZ1Q1anVudyt1TnhZWTdyaFlnOHpCcmExK0RY?=
 =?utf-8?B?RmNDY0dySExSTDRCSVU0UVN4UjhmbEtodmMzd21WeXlid0NrcWJvbFgxTFRX?=
 =?utf-8?B?dmMxcStkZlVBQ0dYS2FEOEZTWWZDR0g3a0NSb1grMmRpV251R2hiTnBFYkVi?=
 =?utf-8?B?RGN2bkFYaGNZV1phRzJmZ0lpUnlVd1p1WmxRNFZzdHlOUEc4UDd4OHF5RVlI?=
 =?utf-8?B?cTdtQ3hTQ2dFOTdha3hYWHk5ZUcwWTRhTnNtdz09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 20:27:53.1942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 634a75f4-7966-41a4-b7b5-08ddb8ddc254
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFB43CC8EEE

Add binding for AX3000 I3C controller. So far, no changes known,
so it can fallback to default compatible.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
index cad6d53d0e2e35ddaaad35215ec93dd182f28319..bd3f31a03376b3351276ae2cd247615ee4eff52f 100644
--- a/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
@@ -14,7 +14,13 @@ allOf:
 
 properties:
   compatible:
-    const: cdns,i3c-master
+    oneOf:
+      - description: Cadence I3C controller
+        const: cdns,i3c-master
+      - description: Axiado AX3000 I3C controller
+        items:
+          - const: axiado,ax3000-i3c
+          - const: cdns,i3c-master
 
   reg:
     maxItems: 1

-- 
2.25.1


