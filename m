Return-Path: <linux-gpio+bounces-29609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 828C8CC1597
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 08:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E78DB303FE57
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 07:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C333016F2;
	Tue, 16 Dec 2025 07:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="fIwR3DP0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023072.outbound.protection.outlook.com [52.101.83.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DD91DDC33;
	Tue, 16 Dec 2025 07:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765870841; cv=fail; b=DzdtfDTaX0QcT+ohthu8e44pLIWayu1Z+2r9TzulWySXGTGnqNx2I4I1kDSGh5/szSMCGAY9HaCgJquBZ7e4bxGwa3FenNt8Ck/UU+EXL/e6WfhfMo24SfIB7LBFaqeCLsOvNvI7pFeGIBS8Pj55f5bZzeZmS8wPSs+aXW+detk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765870841; c=relaxed/simple;
	bh=dpv/bDSax0c0B86GdLRpFpHsBS5zS4r3RE+yILawXM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=f1yjdsBh54/ILfk8dHGfv0RwkNZv7yp0lT0SfHThul3/G5yhFpr3wrGMmtulLq5nsIopNY+BgJzP0oh5NyhUvY/VP+66InJZqhsaXXUJUCmB0oeiknnoLJufXDrGyCZrhrIpVrW6mLBbV7Rdc9Prlor3EGnYhUNw8MkTtJaMTZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=fIwR3DP0; arc=fail smtp.client-ip=52.101.83.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAAFaLnfaoms4uaHR7iOoIjqMY2wsuUPXqbEVq4MYRdf6TgOQNi0hyHbikuh67ex53lsFe5ebX+0sdQ5pgUGxEJ/WGIT8+xO0Pu1+lXVEvLCA5xK3GNlauAn+QhnKLz4/GDRkotGx+11gLLw9+Vc1z12mHYHoXZxWj6zNoQ+9vHieDkz9BiYGSHmU+nvdNwCXjqpUuGxVebkuS988R1AvpvuS/n7pUci2FwGP/3FB3dnnFJ7iPLZB3ynAnKGkBGak5lTvoxD+RYR52ZLRm9FlG3S9KVCt52ksrXjBVCTALWJpVFkrU3qCxcDKWle82ZUmGQtGThN9hkaagPNspRJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AINkJf2s08O2FpIdaqOK6YljkOE8ZozmTnApmE8eDmA=;
 b=xaeMHSViJcCmhbFo/PhrnlWBG9NOaiOpNq33O9DUp6olxeNJG0sXlrAZmibpJB7whSvHCf9PC+gg1IE0VfHULVOnn4FAdoWtEzgUVMy6lzCflaLOc16pv0sjfg65ICg15RR140bjeM1FxUh9AC8ccqbuza4cHdIg17YBUFGLPVspA9EbV3q1aTJkYROeVPOGiau697kt/RM7a7XpNsEDAcMXCsPi/Z4W8KRUq1NXnvdx8Na2lfej6lXLRJDFQwvapCp2LRxAORR/5jsu8wr29KRFlljeIWQu/r9GLbbeX11L0lAIUN3KDBNsF/Jhr3C67vh+hpzQCeRr4PwJsvPdsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=eilabs.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AINkJf2s08O2FpIdaqOK6YljkOE8ZozmTnApmE8eDmA=;
 b=fIwR3DP0kSSbIXBTM3Z2xiZbAEloJEYKT/L8CM4n1sGWdgY3m9srZvgGXyF3VF8pxvbnqS9oa6vVbzOufjL8z8YAMVaFwOthbBpUdjeKerOcZYONDl+H4KZ+LPdwEDn9r2+VUTg8D7B3xOH4ui8xFFav6BPJoLo+mT9zyB+yrMgfHiuE0OFlJy3U5ohwbdelhINjrYJISG/0UKIls8x/+uu8Zj47EfnzsFvnJBDX3/bm2gYmlyMabFFq+lSSHIkgMSwsS0WiRuIfdLIN2KHfmnQs/hVt8ryUh4C4+VbgA7+ZXvBpC3fJgP/w0IfS+JZeYRkonONYKNhP4saxmQC8Lw==
Received: from DU7P251CA0027.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::25)
 by AS4P195MB1936.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:580::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 07:39:52 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::a9) by DU7P251CA0027.outlook.office365.com
 (2603:10a6:10:551::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Tue,
 16 Dec 2025 07:39:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 16 Dec 2025 07:39:51 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 16 Dec
 2025 08:39:50 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 16 Dec 2025 08:39:33 +0100
Subject: [PATCH v2 1/3] Documentation: gpio: add TCAL6408 and TCAL6416
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251216-wip-jremmet-tcal6416rtw-v2-1-6516d98a9836@phytec.de>
References: <20251216-wip-jremmet-tcal6416rtw-v2-0-6516d98a9836@phytec.de>
In-Reply-To: <20251216-wip-jremmet-tcal6416rtw-v2-0-6516d98a9836@phytec.de>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?q?Levente_R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>
CC: <linux-gpio@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	<devicetree@vger.kernel.org>, <upstream@lists.phytec.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61F:EE_|AS4P195MB1936:EE_
X-MS-Office365-Filtering-Correlation-Id: d66f2901-481c-4079-9994-08de3c764c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cTc0S1VLeWFsU0tKc0lkenhaYWtySUhVNWgxYWozUWdoWmZWRmsyMEE4V1dB?=
 =?utf-8?B?MlRNVjhmMmV1SE9Mc3ZSMHAzOHZIOTBkUFBqRkJCYmdibCtlaW8wdXdDREpx?=
 =?utf-8?B?d2NxZEtxWDVGeWFHSDBJMjV6UE1Wa0QzN0xDSDFxd2lzSzBWbGw4azdOMzZz?=
 =?utf-8?B?bUp5K3lveDhQRk5PZmdpQ3BDQWY0SUEwa2lMWHJ0czdSejRhYWZhWlludHUw?=
 =?utf-8?B?TVJMbUQybVlCWFhnTUVmSTNRSXF5VEVGQ3hqK0NaUFVzYWw5Sjg4TUpsTjNv?=
 =?utf-8?B?TlNsWHEvV2FjUmQrTDgzNWxpOXRrVWpyeFJ3TnpsQlBKa00vN28xQ0tlWVZX?=
 =?utf-8?B?MjBGeVdubnVka2pwaU5zaVJYVEVZTkNUakNxTzRkcTlPaUxta0dJUExWY0g3?=
 =?utf-8?B?WlZoOVBINit3djhkSkpaQ1NObWR3RUFiMlZua2I3ZkU2WEN6VFY0TE5wZWR5?=
 =?utf-8?B?Wk8vT0Z2aXlTUzA0aXlmVG5HOGw0L3JwbGY1dGltODQrTC9zWkNrUjNNcW5B?=
 =?utf-8?B?aGtyM3lDa0pSblBoQ3B0bG82Z29yOUFXSm5jY1VKd1FZSjZTWWFQdng1NVFH?=
 =?utf-8?B?RzIzYzBQRlE3SXFLd3g2R1ZMdVNXUjQxMnB2MlU5TitBRmEzV29wRjRNMnlN?=
 =?utf-8?B?aEJVOG1wVi9aM3NSSWlsLzRFa2RWcG1vcWlCNlFyRjMyWTdqdnQzNE1QN2ky?=
 =?utf-8?B?YWJITDB1ejRRNSsxOXo3ZURpYStqZEw0bGxWYktraXY4U29vUmt2RDVjUFla?=
 =?utf-8?B?dXVGTGpIZWpYR21tQnhKTW5IdjFtNnJ0Z2E0eHJzUEVvNU5WZlA4NkRtbjhs?=
 =?utf-8?B?V2xTT1QyTTBleElrYW5RMFI1SGZDcko4MkhaSDR1ZlJ0dFVpWkk2QzYzVy9k?=
 =?utf-8?B?R0ZMbnBqTnFyQkM2bW9HYlZSYlhjQUhUTkFzanE0VVRBWmpIY0ZWcEJONGJP?=
 =?utf-8?B?RFEzbjlyclhqV3BQam9PN2tJaXJMNEF0bUdiK3pUcFRjMzNMaXMzOXlnLy91?=
 =?utf-8?B?WEVVVTVpNUhBV0w3YkZMdjl1dVRBU3dlK3ZjN0pOY3d6aUlES29xWlptUlBZ?=
 =?utf-8?B?L2d1TFFkVmhyMzlZS1UwSThPWWlDRFBGV0lvUFc1Zm4yTWE1T2ppZUlNRUY5?=
 =?utf-8?B?TUYwL1QvWFlTdFRsS3hDN1dpYW0zYThPZ0hOdS95TkdNQUpOUnlDN2U0Z3RW?=
 =?utf-8?B?T0MzbEdHVzcxNDUyUGpRYS8waFdjMU9GWXpRLzliZWpCcUNvTHAzMjBVWGUy?=
 =?utf-8?B?Y0hRUC9kS0Q0Qi8rYjAwU0tiYkVURDhqbVNEU3EwckxZUlVISkJhV2FVZEpw?=
 =?utf-8?B?QVdMVHFJekZ6QjZwekt6TEY1NjhnL2plRmp5QkV3TG1maFdiQUx0KzFVZXJQ?=
 =?utf-8?B?aDZJVkZlWUlHOFVhRDlXRHZHenRHQ002NkVGODBIaktFQjhoMXkwMTJZYU1Y?=
 =?utf-8?B?cEtxUm5UaHJMVER4RUJPd1doTGhOaFRwS09wWlRZYk5EcklReUlSWE1acjly?=
 =?utf-8?B?Zy81d2IrRDZJV1pFVDRlNWNlTTV6YzZWSEJiMlN3OS9ycERWcXNwZkJLOVJF?=
 =?utf-8?B?RlJ6NVcwdlE4TXlUMnRaNlVvRnQ2bTlxTTlUckgxVm9Jb0xCNWprTTEvai91?=
 =?utf-8?B?WnhDMGpKb2xsQkQwang1aVRXKzZIdm4wZHFKS2hWbTR4dHl4eU5oUDZLdVJK?=
 =?utf-8?B?UUFXRCtwZ0hqOHFxZW9nWVVXc0tqcE9KcU4vRUN4MVc2U1lUK0hNVGVuVU9u?=
 =?utf-8?B?TlNGbm9rRy9kZFN1bXRDdEZHdlBSbUpUY1dIeVZXQ1FSbFpVNm1XNWZNU0dr?=
 =?utf-8?B?SExMc0Q2UUFQN0o2R0lRQXZmMkRacDNSUVVKVG0xSjluSjV0UkRMY1FhdWww?=
 =?utf-8?B?dGdHTEF3T0h4ZjFMdGIzbkVCakFBRUdKWFpQTDVOZFdOREROR1lRd09rcWNt?=
 =?utf-8?B?cDU5WkJFcnRtT0VURVZnOHF1UzNoWmgvQ0JzYTFpUC9QQmZxd3hHcVZ4ZWtR?=
 =?utf-8?B?TzIwdlBpZzhoNi8ybG0xMlF4S3UzeUtqMnRQS05wbmlnenZsS2ZzWnVJSVBP?=
 =?utf-8?B?VnltZysrVm1GSjdFSVVweVI0OWdqUEUrUUlyTHJKZ1B2NEZYWWR2b3BvUHVH?=
 =?utf-8?Q?GMJU=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:39:51.8090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d66f2901-481c-4079-9994-08de3c764c66
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P195MB1936

Checked datasheets, the offsets are identical to pcal6408 and pcal6416.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 Documentation/driver-api/gpio/pca953x.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/driver-api/gpio/pca953x.rst b/Documentation/driver-api/gpio/pca953x.rst
index 4bd7cf1120cbaccfaefc346195d87d927c3afcdf..53f25fa03072d95d47443e30c89720a98f8c5561 100644
--- a/Documentation/driver-api/gpio/pca953x.rst
+++ b/Documentation/driver-api/gpio/pca953x.rst
@@ -178,6 +178,8 @@ pcal9554b      8       yes    00     01     02        03
 pcal6416      16       yes    00     02     04        06
 pcal9535      16       yes    00     02     04        06
 pcal9555a     16       yes    00     02     04        06
+tcal6408       8       yes    00     01     02        03
+tcal6416      16       yes    00     02     04        06
 ========== ===== ========= ===== ====== ====== =========
 
 These chips have several additional features:
@@ -196,6 +198,8 @@ pcal9554b            40       42      43       44       45         46       4F
 pcal6416             40       44      46       48       4A         4C       4F
 pcal9535             40       44      46       48       4A         4C       4F
 pcal9555a            40       44      46       48       4A         4C       4F
+tcal6408             40       42      43       44       45         46       4F
+tcal6416             40       44      46       48       4A         4C       4F
 ========== ============ ======== ======= ======== ======== ========== ========
 
 Currently the driver has support for the input latch, pull-up/pull-down
@@ -332,6 +336,8 @@ Layouts:
         - pcal9554b
         - pcal9555a
         - pcal6524
+        - tcal6408
+        - tcal6416
 
     2. base offset 0x30, bank 5 and 6, closely packed banks
         - pcal6534
@@ -390,6 +396,8 @@ enabled.
         - pcal9554b
         - pcal9555a
         - pcal6524
+        - tcal6408
+        - tcal6416
 
     2. base offset 0x30, bank 2, closely packed banks
         - pcal6534
@@ -462,6 +470,8 @@ Layout:
         - pcal9535
         - pcal9554b
         - pcal9555a
+        - tcal6408
+        - tcal6416
 
 `PCAL chips with extended interrupt and output configuration functions`_
 can set this for each line individually. They have the same per-port out_conf
@@ -505,6 +515,8 @@ bits drive strength
         - pcal9554b
         - pcal9555a
         - pcal6524
+        - tcal6408
+        - tcal6416
 
     2. base offset 0x30, bank 0 and 1, closely packed banks
         - pcal6534

-- 
2.43.0


