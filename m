Return-Path: <linux-gpio+bounces-22676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1846AAF66A0
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 02:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C4911C41239
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 00:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF87114A0B7;
	Thu,  3 Jul 2025 00:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="Rg8Cm2R2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2134.outbound.protection.outlook.com [40.107.243.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29E178F20;
	Thu,  3 Jul 2025 00:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751502172; cv=fail; b=nWSt7m0ipTEUdpj16MkLIJFQeEOqjMPF63amtdKNYRg36ijXO6qPRW64bNyaTRsc6btR66egL9YTa4xkYifNsnusl71RzMnN4fJrNEqGkxaRldYlX02Fnp1IkM0APqZSuxfhDbCSakwDiFsuZ5OYfE/qFEzTzvi3a98SsrG4jBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751502172; c=relaxed/simple;
	bh=+LkKLNtqktZs6BJGxQlls9eAbfyJLYkPhSllbV6tgWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K1/XKNKboRrPDab5NAUIQ0i8XSooGA297MCO1zmxTJCDsQq1lr3q6IOhM7pKe65byM2R1M6+Nz8aPKl6S2ARUX+HaMf8lsOfajjeU/1mVM1R5durGq5CDdQd9Ntk+Nz09oVPc1CF6TOEYPBzHsvselcDMnujczhQk2H+5ANdk+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=Rg8Cm2R2; arc=fail smtp.client-ip=40.107.243.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDRuqTb/pp6Z8F6vecp8wDKsaAksuFs1aF0zebhwx96uG9U4Wki5Owo4fyD2EZwo0vR6MNosbW0PZ2nyHe8O7qnL3OFPlJAxROk7syUCyNYBF4xTdSVHQ2oY8BzjOdp+lEMJxEWH/BTcIih+3W2IVNQ0ln/sE2aoD7xdNb+Zz+ZcKSSNyCMIS8joodzhe8w5c6ks/uu5/NWsue2sKUgwZMhaEu7ia+PSKorCULIrNlAUXIY++hRb/fdXs146YH7HSbBEq5j9/fq0kKU32izLONWKOiacVKyLgWAUAgUJw7qkHOk3pExRxN9d+jzl0cWEQzF5nPPgS99Swgb4hTm6CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thl99V5yXVMyPjXj7U7dTdtpXeFku2vCWOdg+nvR78Q=;
 b=TPNcLYeh1twiuQrsSpVTgFLy22XF2Cq2r5q6eG63MLt0uxYJLWLOyefbbCo++1iYYs2ODI9brP4n5PUTaXzoJYuTfIaBO9bO7b+y9H6zv3rZ+Evub1WEj0RZ/qEuIEUa/raxCL5Qsor/FKDTDB8FzT0wWTnkZDizNqBOBNoUlFS373ycR5TdAqiFj+zJU6bHuzVYELm3IJj2MVHbePmBJBErlSGpY22lVLBwtSxm+nQoPL/sNwh1S2s0KmT90zFFFrSBcx5n469TS0ZbCWAcRDsSTu1BAi7DkFb9xeUCVgRZ3IjN5ke9mDtLjfFBInOejtDvvu2XC1jG7P9BM56Rww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thl99V5yXVMyPjXj7U7dTdtpXeFku2vCWOdg+nvR78Q=;
 b=Rg8Cm2R2MPIAzJWtxhT/xy56mJD59+uojGX4WdP8TNENOPV1d/cAbJefWbeEYcssRqy8dTgW4J71zA6Ly6ahLsqKy/YK7eTVdz4H1fxTep6FJlJrmApBzhVVzec6JPV6C/2UIg0Yy+XQSopv4j1/Fr9vrbxa4qsnUooHLas4GBxynGcZNf1tdDvxk+bAQqyahmsnqAXEZVJLxHWBE4MSp2BU6xADh0hF2hs0AXqDJYGCYJz2iaNCEl0ZaAMbLi21Bmot9e3FnyBCsV+h8+c1H1MXFGIAL0YGKiOqQD4ikNCWspm7T2iTMJ1ny+sy9mTiXryKqMDdZg56F54POa3f6w==
Received: from MW4PR03CA0115.namprd03.prod.outlook.com (2603:10b6:303:b7::30)
 by CO1PR18MB4716.namprd18.prod.outlook.com (2603:10b6:303:eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 00:22:46 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:303:b7:cafe::5c) by MW4PR03CA0115.outlook.office365.com
 (2603:10b6:303:b7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.32 via Frontend Transport; Thu,
 3 Jul 2025 00:22:46 +0000
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
Date: Wed, 02 Jul 2025 17:22:32 -0700
Subject: [PATCH v5 03/10] dt-bindings: gpio: cdns: convert to YAML
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-3-6ade160ea23b@axiado.com>
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
 Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4292; i=hshah@axiado.com;
 h=from:subject:message-id; bh=+LkKLNtqktZs6BJGxQlls9eAbfyJLYkPhSllbV6tgWc=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZc1SLszqMZzpFfUO7SggPIn2Ur/bqxHFzwl5X
 SHwqicxfv+JAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGXNUgAKCRDxWHMRoTLV
 +4StDACnJju1KMvqasaUP2s1fm9KvoS1wSljrsnXPPZ1dF1cpd+QIqrlvmmOFCBx5Zs6k4kFBPE
 gKZEAbcYDVCQ5brPFhBDKr+X78FumycK/2Zg5SKOjsYWmFOOS9V0pesmWifT9wLsb9RQA485s+9
 D0gUiT/li01El7W4rz5O6OvVFMiOozLr4GvznvuNcPiku/Uta4vIx+9YH5p603K/Hqt6dKWUlBo
 EYW+BeM3MD7DWivcRVZH3zvRRvONZWuyR3pOUoAl+CsyCWwTSH48bF0YrFL0SSxKnufSCedA25/
 V7qJlMP6g6k+ERnkrRI84lbgCOptEhwSAXKdLptOMDiiq2GBZ5CZdvmLe98BxMro0QqlP6jNyQb
 M5sn91Mn1ZPxK48IJD5mVCKCCY9oy/PnOrdvKlQioSBqDrp00am0iO9zu8XjVEET03uJBRfgSO6
 ufM9/pstXs419cfDwndJ7vr8TEFi20qMAsz8dxU4dAKavfpuyRt1nj0llUfW9fIuAQ3BQ=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|CO1PR18MB4716:EE_
X-MS-Office365-Filtering-Correlation-Id: c7336610-6356-4990-c854-08ddb9c7bc2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFF4MHNxWWxtWDNJamNZUXZSZkE0d2p3bStQOFJEYkdlK0pEdGxzV1pqdHBk?=
 =?utf-8?B?eHl6VjU4R3dTWk1acHptN1R0a21YeE1kd2tYSEJIRG1qQUtTVVdxRk1FSTlr?=
 =?utf-8?B?aHMxQTlFMXYwWnZzZWVXUVNHYVg0cU93Vnc5MmNRNEpIcjZpMlJ1YjJuTzM0?=
 =?utf-8?B?OC9SbU9wNGMrUERYcHcxVU02a0lKbEJhRmdJaEJXd21DVnZUeHZnOTNKRkdr?=
 =?utf-8?B?bXk0T056aTd3SDFtdktHZWFraitzNysyS1IvN3I3amNCUDRWQzNDYzlWdCtr?=
 =?utf-8?B?STNMcWtjRzY2b1hGajhJdzhXQW9yYVhkbFlRRmM2RmRUclY0dHhUVUtjaWho?=
 =?utf-8?B?Q1RFY2IvUnlNUHR3QVQxWFZqZm5LbG9IcmRFVzhvRVc1MzExQlllVzlHTS9h?=
 =?utf-8?B?K2RnQW9lUnc3VmpMbU5LdGRTeFhEOWRRc29PcnZEc0hHZnlzUS9VWWlDS1hH?=
 =?utf-8?B?ZENuZDRMRlpMK3FYYlFGcC9GU2lxQ0NoMjd5dUxodzUyZ2QxQnphbk92SUNP?=
 =?utf-8?B?VnNEa29lSm9CUkhzMXozcncyc0U3Rkp2YVNZbTVmaHdjaUw4eGtrU1ZwWWdY?=
 =?utf-8?B?OE9MSlBRaVkxU3lhK2JGZVoyMGRXTThyd3BqWWJ6RWMzemU3TW5aNGxzRzRO?=
 =?utf-8?B?TkFya29rQmUzbnZOZHY2bHBtYmRFTHpmN2VweUtKRjlRZVJQanhyMzk1dTN6?=
 =?utf-8?B?NGdzd25qMGJrVWRzOHVmN2M3ZVUydExkZEhmdHBSVXdZbHdZSjlUQ05ndjNT?=
 =?utf-8?B?MDd3OHZDcEZ3VWpKS1V3Z0VRVWhiRnJsT0VTTXNYdGdaODRMNEJETHl6Q2Rm?=
 =?utf-8?B?Mkk5Vlp5N2pidXJpU2lhWkxuUVRBLzRIelpGTW8wUXMxTnV2ZitwN3c3NzRu?=
 =?utf-8?B?MXhyaTZTbElZMlArbUxyVlVGMnJ2RFZsMFNpdUI0WEJxcU56Yk9qdVhYWlRY?=
 =?utf-8?B?Q2Jua0s2N01PWjVBYW1lT1JIazZBTVFncmwzNVJhL290elc0V0puaGtETW5R?=
 =?utf-8?B?RHE4bWNMLzdUQ3dnRlE3VlJXLzVueUdqcjAzdmdjYWd4M1g4aXRFTnpHZkZ0?=
 =?utf-8?B?OVpXU2lxNFo2U3ZQeVEwY1RUcFdFOEFSYmFFeldKR3hDU3IvNUY4QmJKQTNR?=
 =?utf-8?B?V29jVUl6ZElqNkEvSnVZTVVKdVU2eTFqYldtN3JyREZBWnNhSjRwaGFqMVVv?=
 =?utf-8?B?c3c5Y1lQbGdMQnhyV2FkdVRvczk1VzRSUVZzN29LVDNuN29rOG9RQkJjcFZ2?=
 =?utf-8?B?c0grOHEvdzBMTXFoVmcrcGM3QUVqbG80Q3E3R3BxYmlROHRqMmtYZGxDZ3dW?=
 =?utf-8?B?M2pjeWpXRjlIQ256cUU3SGtaRU1xT1B6WVFaTnY3c2t4VVhZUGRCbVpSaDdh?=
 =?utf-8?B?RWZIL1djbml5NlU1NkpzejRTcWdCdGxIbXJTT2ZKY2pWajg5WUhHMFpPNm5T?=
 =?utf-8?B?cTUvS1lKZDFERmloK0JEWXdiSHVxUWwvZEJKRDF6U24zRWoxN0ZyVGVIVmwy?=
 =?utf-8?B?d3JPZEJ3MTZNWFpUeC80Sm0xOHpXZHdtT1ZnLy8rZnpieWJYRTUrdWJmanVx?=
 =?utf-8?B?YXQzL0tuVnpIVzR2R0lIajBaVlcyaE4vSHdwc2U3L04xcGo1cVlTSUN0U0Ni?=
 =?utf-8?B?Nmh4Q1AzUjV1aTJJbjQ3Y3NZU0Fnc1ZOdk5lMVNLbTlrSlprNmZ2MGw2UzhO?=
 =?utf-8?B?cnVmcTkwd2pzejVvSGdTT3JXRi9kOTZQME5JcDFVRTQ1Z3h5TkQxV2hJdy9L?=
 =?utf-8?B?ZThCRXZiUkgvUmM2dDlBYWFtVHkzMUtPZUlxN3dsdzY2eHFLK3Zxb1QvWkxo?=
 =?utf-8?B?WkszQ2dnWVF4cVduenJuSUJNaHJJSXZVc2pPdHp0S3lXZjJXUWZkM1dNTERv?=
 =?utf-8?B?akZJMGFHOWVuNmlic2MwSkQ0OFd2bFArVWtPNUs5Q0VwUFBNczE2djNQZXZz?=
 =?utf-8?B?bUZKOGRvUnlyMExub3E4b1YwOFhXRWxEL3psQXZmSk1EM2NmT1o1LzlOZFhX?=
 =?utf-8?Q?kno6hNXgdZCAPaiNabdU882gPL5ar8=3D?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(921020)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 00:22:46.2113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7336610-6356-4990-c854-08ddb9c7bc2a
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR18MB4716

Convert Cadence family GPIO controller bindings to DT schema.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 .../devicetree/bindings/gpio/cdns,gpio.txt         | 43 ------------
 .../devicetree/bindings/gpio/cdns,gpio.yaml        | 79 ++++++++++++++++++++++
 2 files changed, 79 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt b/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
deleted file mode 100644
index 706ef00f5c64951bb29c79a5541db4397e8b2733..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/gpio/cdns,gpio.txt
+++ /dev/null
@@ -1,43 +0,0 @@
-Cadence GPIO controller bindings
-
-Required properties:
-- compatible: should be "cdns,gpio-r1p02".
-- reg: the register base address and size.
-- #gpio-cells: should be 2.
-	* first cell is the GPIO number.
-	* second cell specifies the GPIO flags, as defined in
-		<dt-bindings/gpio/gpio.h>. Only the GPIO_ACTIVE_HIGH
-		and GPIO_ACTIVE_LOW flags are supported.
-- gpio-controller: marks the device as a GPIO controller.
-- clocks: should contain one entry referencing the peripheral clock driving
-	the GPIO controller.
-
-Optional properties:
-- ngpios: integer number of gpio lines supported by this controller, up to 32.
-- interrupts: interrupt specifier for the controllers interrupt.
-- interrupt-controller: marks the device as an interrupt controller. When
-	defined, interrupts, interrupt-parent and #interrupt-cells
-	are required.
-- interrupt-cells: should be 2.
-	* first cell is the GPIO number you want to use as an IRQ source.
-	* second cell specifies the IRQ type, as defined in
-		<dt-bindings/interrupt-controller/irq.h>.
-		Currently only level sensitive IRQs are supported.
-
-
-Example:
-	gpio0: gpio-controller@fd060000 {
-		compatible = "cdns,gpio-r1p02";
-		reg =<0xfd060000 0x1000>;
-
-		clocks = <&gpio_clk>;
-
-		interrupt-parent = <&gic>;
-		interrupts = <0 5 IRQ_TYPE_LEVEL_HIGH>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		interrupt-controller;
-		#interrupt-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f1a64c17366500cb0e02a0ca90da691fd992fe7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/cdns,gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence GPIO Controller
+
+maintainers:
+  - Jan Kotas <jank@cadence.com>
+
+properties:
+  compatible:
+    const: cdns,gpio-r1p02
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  ngpios:
+    minimum: 1
+    maximum: 32
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      - First cell is the GPIO line number.
+      - Second cell is flags as defined in <dt-bindings/gpio/gpio.h>,
+        only GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW supported.
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+    description: |
+      - First cell is the GPIO line number used as IRQ.
+      - Second cell is the trigger type, as defined in
+        <dt-bindings/interrupt-controller/irq.h>.
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - gpio-controller
+  - "#gpio-cells"
+
+if:
+  required: [interrupt-controller]
+then:
+  required:
+    - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    gpio0: gpio-controller@fd060000 {
+        compatible = "cdns,gpio-r1p02";
+        reg = <0xfd060000 0x1000>;
+        clocks = <&gpio_clk>;
+
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };

-- 
2.25.1


