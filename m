Return-Path: <linux-gpio+bounces-29489-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D33CB8DC3
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 14:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99FD73091CED
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 13:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09961322C65;
	Fri, 12 Dec 2025 13:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="F5+nefdD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023094.outbound.protection.outlook.com [40.107.162.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92029285418;
	Fri, 12 Dec 2025 13:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765544623; cv=fail; b=UNc1/SsB95y7FI09db39OKydU5sd4XCLZQinzeQHZv7it4hz6NH/CFOzjto+c2haV9kyxu+oJwUbpc1v19F0nwq8TH32SPUCnYs2e+0jAQbioIIT+z/dA0rXIzUXt77J0jKjZ+WyKfueQnul5dTHll5IluqmNMZUw3c0W3iKxT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765544623; c=relaxed/simple;
	bh=ULo077wprbCM2UTLeZI/zuSb0NBX2hNNDHyOmMC2sJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=E7ZqDpiNVH4IDQ+e61VmxOd+NkgTqOLaZ8tC2rSs06BNC/5kX2fFvfphx9FGSPGeKVHcgHizS3BlqLIBMZ9O0gI6rC2POJc3Z6C3gk6VbQDLHImJi4aitmhjZf/lPWJyTEl31zB/JpFBusknC+mpGNhPkMIdYx9VXQ2dUNPn5hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=F5+nefdD; arc=fail smtp.client-ip=40.107.162.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ww0TD060OG49dAX53UqXtnhlxesBpGSTKHAbYyPnpDGLgPLCNi0hE4jtxROoYU/a/RSDv+rZxtnXb58eGX9KhOlaWQz6jjUlEUI5iWPBwxuoEXw/HC/L2KD8AC/Rd7yvRQOAG/BPpvfNBlf6QbH2rnbVm2yEbOJSEtTbYN4UXrSmSrb2cHr4avhE+7sGWzrFp+A3VhI6AhJTTpGieYuUjWjWN5+44z547WqG+p0MqtXeNj7o+ct5E8lq223JbZQDbt9Q1mgpEi5kzMysoP50wdibp2NRqzbGTKhNwgpDdIt2h401ScykClw2Cng3ldPlg7ZLAYg5jvwm+5iYsFJKfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWS1MKF3PdUJezX0uUC4Bh0UF4iiPjXcPgvxMY8A+CA=;
 b=BWam9Hf9frhf1D2HlrpSLeWMil3fTGY9H+SXfcw3anCF76/D2724IkLXZQpvIAfH+jwSMA2Psph1ylBdZ2EKIlyfT1Zn62MjioPMyL8TwqfsuRg4C1TVWPIsjG1t+CnZOsiN4UDed0zFd6oduX5MxSRQLm1CH8B1CSzoaTayqYNj8HVgH6n5Y2+xUz4WiNpTMBACYPRyQ/f65RpJpLt6RnK1G8NajWaFKX1DSZC7cBSjmFS5DTZU5z41v32bIsUyOrwSyIJOlvFfnXgxFBGBdpoZkpK/RZz5YKsMZ1GmcFJlRv0kT9PgmmejqK2//77Zsw+7CQDKVddB6Aijl6Ge7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWS1MKF3PdUJezX0uUC4Bh0UF4iiPjXcPgvxMY8A+CA=;
 b=F5+nefdDT1t8T7oKv3re5YeuJnxB3PBrLHw3Qp23xCRMM/x21DOWrXv2BiQ8LnXT7JnQ5DIrnlZkO4L8YF8dZfE9boFHcw1uPUHzSlbry5BAYl2fa5qBoDI8W4mjONSThDbaDSha659YXeQ2/0a9O77vH16ieeK2E3IDWYKma02Gwve+IxOLer9ZgewBn+SQN465h/8hlsI2QYuNP4KcMzcAZUV7PbWAZSNaMR8viYuqexcdeFW1J3M3WhP2IyP+WYL7Cn7bjGm0M95jYddyl132zCN6sL+xnz26zjEwX4N3yzaZvC/G0qnH5F9avHRcy+boaH3qFoc18VaOddpC+w==
Received: from DU2PR04CA0237.eurprd04.prod.outlook.com (2603:10a6:10:2b1::32)
 by GVXP195MB1736.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.13; Fri, 12 Dec
 2025 13:03:34 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::ea) by DU2PR04CA0237.outlook.office365.com
 (2603:10a6:10:2b1::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 13:03:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 13:03:34 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 12 Dec
 2025 14:03:32 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Fri, 12 Dec 2025 14:03:16 +0100
Subject: [PATCH 1/3] gpio: pca953x: Add support for TCAL6408 TCAL6416
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251212-wip-jremmet-tcal6416rtw-v1-1-e5db1b66d4cc@phytec.de>
References: <20251212-wip-jremmet-tcal6416rtw-v1-0-e5db1b66d4cc@phytec.de>
In-Reply-To: <20251212-wip-jremmet-tcal6416rtw-v1-0-e5db1b66d4cc@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B96:EE_|GVXP195MB1736:EE_
X-MS-Office365-Filtering-Correlation-Id: da4aba32-6f5c-4bcd-8e05-08de397edb58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700013|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?algzVGNyZVJMcDBlRGlJZXBVcmIyV2ZCQlIxdlc0Q3dxVklKTktNSWlXTnZ4?=
 =?utf-8?B?OXp1MmxIeHVxVzJacDVmU1JiYXlwVVptNldXU09vYjgvZmdUL0RiWGczV2Qr?=
 =?utf-8?B?RVZrVWkybnpZSHJQU0dmaWZ2R0laTGh1cTNEaitIZnJwYzdsamZtWVFNTUNv?=
 =?utf-8?B?VW03N2dybi91WWs3bThVb041T0ZrSzJEc2dGcEd5dEo4djg5MkNPWnVSTm1R?=
 =?utf-8?B?L3NBamN0NHR4TDZBdk5FNkZDb1RvdEpPZzFQMGlpOXFIY3Rkd2NNZlg3cUY1?=
 =?utf-8?B?V3hHUWhUV1NwSUNPclpBSXdaeXlkMStROUhITHFuSEp6cm95V0tyUXZmNWlV?=
 =?utf-8?B?NjBrVHZXYk9RWjZpaTNRbFdFNE93R0w5bEtFdGNNTGxSTFYzZHlQdEppUXBS?=
 =?utf-8?B?UWs5TXgzWUJTSS9meXFCVExYaG5WbzZ2WUJKT2JtdmpGd1Y3am9MV0IwQTdZ?=
 =?utf-8?B?NFlyZmhId1U0bC9jYWpLTVZGc3M3eDhtamlpOU5xbmdYclVyNlExeFlZSk02?=
 =?utf-8?B?ZE9LeTRJVjNUbXVCTE44cFBJdy9vRTBSaFRkTFFkaUpOQUlzeldyeW04OFhS?=
 =?utf-8?B?V3I4NDRSNG9IRHR6Tk8zSElkM3VlVUdjZldRNnEwVGJTNEFVWXc1YW1ORlIx?=
 =?utf-8?B?cmJDamlFK1ZlMkRsaFBiZmZSdUp3elZTVFQ3bjVuSVdlUXhYN2hURXBadHlO?=
 =?utf-8?B?eisvV0lHeTVBYmEwWE1IUUYyWTVmTG8vcGNxL3RxeUkvbjR1RXY3ekRyb0lJ?=
 =?utf-8?B?L2NpODd0K21lNG1yQVVUWHVKWk5TV09nbVorUHNYOFY4Z2VXYjIrdEJVclBm?=
 =?utf-8?B?ZDlKRHlDb2xHREFQMzRXaXZTMHBSaTk5MDhVbk9vRXBVY2lBZXNIUWJudlN2?=
 =?utf-8?B?d010c0UyRlREcmFHUEtteVRyd1ZZN1FkNGw1Vno4YU5FMDJ6L01FSWIyQ1Q3?=
 =?utf-8?B?OXZVU0IyOTQ0MGRUajZyZVN5c0p0YUJjVkxJV3kxRTRublBjRzFubDFXaVJu?=
 =?utf-8?B?Z3A4TDRpVVBKb1F4RVByQXMyK0NYZnUxamFqUC93c3E3L1ZGMmZhRk9ldWxO?=
 =?utf-8?B?VWZGSGtvMFB4ei9kRm9CZDlCUG8wRklEV1FiTEFYM0tMRGUwc3JuK2xMZUNu?=
 =?utf-8?B?SjVzc3ZGUlZ3aTZHTHVhVHZXTXZQMzUwbU9nSGRQYTg3dmRObG1DbktidFdy?=
 =?utf-8?B?ekw1S0RoVEY2MnZrOTkxQXlYZGRxWGdlMSt1cVhLV09hcldSendRYkhJbkFy?=
 =?utf-8?B?dDRDSHFJZk04aG1JSUo4eldBa0x4TTljUm52M0NCalExNXcrcWg4elh1UlJE?=
 =?utf-8?B?ckN2ODU4UjByaG5hYUtaVHVrTU5xa0lBbk04c2VtTnVhdFdBbHFSR2JlUzY1?=
 =?utf-8?B?YnhsaHhMcVZKeDdvZnhjQnh1S21sblJab1ZHSlZMWDZmNkJFRlQ5WktjWFg0?=
 =?utf-8?B?OGhkdkYwOHZLZXBUQzM2YWRaWTNzVHlnaWp6NTcvbjlHaWZla2M2ZEVKNXdt?=
 =?utf-8?B?b0ttWnRZTEl6Y3VZYTlQMmsrNWNMRGh5ekZKOUxDQWhqYXNBTTNXQjF6RXV1?=
 =?utf-8?B?MFVBT2txQktTQWh4SWZTZWxJSHFJblFpWENVVHFDQk5CTW9WUG4ydXl2QWJm?=
 =?utf-8?B?OHJtTE5BLzlqWERpdU5qYm1EbEtlQjRXVGJLZityT0dQcWZOTWRvNnR0MDRT?=
 =?utf-8?B?anlnb000WUhlL1NGRjA2dnRubzJBMmFFb3dQUnNXS1NiMk5jSThnZlhEUkJS?=
 =?utf-8?B?WlVzRm9YNldnaGYreXZlUWQ5NGJmeXlPbS83SktpTEJuaEw3TWRTMTU2c1dh?=
 =?utf-8?B?SnBSRnpNajF0a1Nmam5aN0NZNTNzdG5VeXl1S2R4MW5mbHplejVGOUNyUFM3?=
 =?utf-8?B?REwzSms2aS82dWRHUkV0azRrTEV0dmhvSTJyWi8zalQxaGFoWUNrZS8rVDJW?=
 =?utf-8?B?RmRpK0RwRW04bXhRcWQ1d1RCL2NSWUIvVFV4cVJIL2g1NjgyNGpQR0Z2dERG?=
 =?utf-8?B?SERDTmdrVnlDWmdNbENrZlF1QkF4R2hiZ1E3VkRzNWxORXJGakZjVm9QdnNG?=
 =?utf-8?B?NUd2S2QrL25PeGpERkhnRllVeVBQdm9FSVFyYWRZejROTHA3dzlJek5kNHJy?=
 =?utf-8?Q?xQrH2gasVP0ocWjFeW2O2IOkx?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700013)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 13:03:34.1140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da4aba32-6f5c-4bcd-8e05-08de397edb58
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP195MB1736

TCAL6408 and TCAL6416 supports latchable inputs and maskable interrupt.
Tested on a TCAL6416, checked datasheets for the TCAL6408.

Datasheet: https://www.ti.com/lit/ds/symlink/tcal6408.pdf
Datasheet: https://www.ti.com/lit/ds/symlink/tcal6416.pdf

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 drivers/gpio/Kconfig        | 4 ++--
 drivers/gpio/gpio-pca953x.c | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c74da29253e810b51540684b1186e8f274066b69..2a0e8d007e8814d8c31b8b35c8ecc401056dcf90 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1194,11 +1194,11 @@ config GPIO_PCA953X
 
 	  8 bits:       max7310, max7315, pca6107, pca9534, pca9538, pca9554,
 	                pca9556, pca9557, pca9574, tca6408, tca9554, xra1202,
-			pcal6408, pcal9554b, tca9538
+			pcal6408, pcal9554b, tca9538, tcal6408
 
 	  16 bits:      max7312, max7313, pca9535, pca9539, pca9555, pca9575,
 	                tca6416, pca6416, pcal6416, pcal9535, pcal9555a, max7318,
-			tca9539
+			tca9539, tcal6416
 
 	  18 bits:	tca6418
 
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 0a3916cc2772a19de90c7683cb7dc7010524f71e..dd0e09961bc9dacfbd4d5d0a146b59edb218962a 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -126,6 +126,9 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ "tca9539", 16 | PCA953X_TYPE | PCA_INT, },
 	{ "tca9554", 8  | PCA953X_TYPE | PCA_INT, },
 	{ "xra1202", 8  | PCA953X_TYPE },
+
+	{ "tcal6408", 8  | PCA953X_TYPE | PCA_LATCH_INT, },
+	{ "tcal6416", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pca953x_id);
@@ -1444,6 +1447,9 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "ti,tca9538", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "ti,tca9539", .data = OF_953X(16, PCA_INT), },
 
+	{ .compatible = "ti,tcal6408", .data = OF_953X( 8, PCA_LATCH_INT), },
+	{ .compatible = "ti,tcal6416", .data = OF_953X(16, PCA_LATCH_INT), },
+
 	{ .compatible = "onnn,cat9554", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "onnn,pca9654", .data = OF_953X( 8, PCA_INT), },
 	{ .compatible = "onnn,pca9655", .data = OF_953X(16, PCA_INT), },

-- 
2.43.0


