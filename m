Return-Path: <linux-gpio+bounces-29607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1263CC1585
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 08:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E4753051143
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 07:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15A331ED71;
	Tue, 16 Dec 2025 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="Ue8RrIza"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023135.outbound.protection.outlook.com [52.101.72.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF531624DF;
	Tue, 16 Dec 2025 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765870799; cv=fail; b=Sq+NKQFcmCxYF7pXir93E4lFg/mJXADLaILID5zBgoAdEC7O8eGbi5WHpuahvrxqH2KCBlQAzcijj+dg+3QXkgjVcT3ncevZB3kfnUa6GqLCYcH5X49GjhhYT6MK3prJcFCVHMCpk9FXWUYrsr6W+qgC8VZjJLFERpjxrwLmiqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765870799; c=relaxed/simple;
	bh=PzbICR87U3Fg/xhy0QyQVqOnv8GrxkKcO3UxpiFtgT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EQTCaaB2J4ryzLC6H/xKBz1Qf+61m6mB0ResB07y/uyeE/09OadccbIn4P8oip+uhXfBMgLyd6EUg2Fg/3yBUIqDIVDs0hxv4bee4wZhWX0XqpH/CF2tLuvE1a/58VfCiK+IiodntbZv3FIJlPztnf9TLLQVHU6rsurnkACULlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=Ue8RrIza; arc=fail smtp.client-ip=52.101.72.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsWV5YrLMzi4bejzUmtXUNGBqI/ueaHVmw6XLVQ7U43jslx6UBAbv0tnBmTLvl51Vx39l4eHlQQQsPpLr4aqfhuge2J2Za/gBQPP5UeOt7ZAapBmzSBYQBmT3VdZhOf7zwCcU4Qxb2m4rVWieOfLm3/Zno3ioIRi+P9AMIvQjOlQMgeXqnBRExcu2PgYzEsGkXjC7PnoC2XLR4oStRr9a1BLD9lwysbbCE5HwLXnipKsNP02SNaZ0ueMi6ucTNqSEjV+IZlDXcMUtxhUpIyYGNOvTfzEoxOKmsZLWI9tKr2/ffWpHgJwGhterOclyoIZycTN32clXqb6SHkNridQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtoLsUDSUO8rHf6W6FhwQUelJKb0JodKuH2XUC1kiH4=;
 b=uoULNyBkeFw6/se1hCT1w8l+lwpwS/oaIUMJvkcnRh4dEwZwH6v7sSj7zV9wK8PiZS7rfdvEWyi+cIjaLpX709dE7sbiNxQmkuJe4sWsHTOCx6WBCCT+xpIYN8THT+EBX7uLb/zZe7gU31C8M5nLn3PN/8gnBAIoHC0CFw3BQHnucmX8XIHJEKlUVYOQCs/WvnKRj9gWA2CNMpCd71O0c2Z+/2hZ0oHHxiEVPlzUlNfJgP4IKP0QWj8fNZLnOO8qTwRo2P35jbrbOF/fSZc7c/ZNF9BjryTG5bJkrxUmoRI0An5OZNg9pwnqtLQvCmXzCQL0r8gAxzlb/WsCfBcDmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=eilabs.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtoLsUDSUO8rHf6W6FhwQUelJKb0JodKuH2XUC1kiH4=;
 b=Ue8RrIzasU+QloO1urSXKN1Hx42XmIa6Zk1VVUXmFUjNHOFTAqCT4/n3g6IbY/bAe0lgzGiJgdEHpMVt9uZO0qScaZVgRmSaRGWFRnYE9u8GnVzFPkShgDzEHDKhxJ7FqVyDtBy7BIzIzMEahLqh2KljbL0iX2mV3L31Z8Zys+UxWlyWXQ+4pquFufwjiCUi2EDwtB+KEUww4GsD4mBtjmVSqMEO15OauqdWeeFqteStCaRif3ZW2AOtewflmQUH8HqFPgI5ZG5JvIgfLuyIwgew3OqsJRZpVNDZ5W5tnftgV0KzomEGkYf/VY6xtkSToIVt2+wyqTu1rk6XO7NKxg==
Received: from DU7P251CA0011.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::13)
 by FRZP195MB2661.EURP195.PROD.OUTLOOK.COM (2603:10a6:d10:13e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 07:39:52 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::27) by DU7P251CA0011.outlook.office365.com
 (2603:10a6:10:551::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 07:39:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 16 Dec 2025 07:39:52 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 16 Dec
 2025 08:39:51 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 16 Dec 2025 08:39:35 +0100
Subject: [PATCH v2 3/3] gpio: pca953x: Add support for TCAL6408 TCAL6416
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251216-wip-jremmet-tcal6416rtw-v2-3-6516d98a9836@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61F:EE_|FRZP195MB2661:EE_
X-MS-Office365-Filtering-Correlation-Id: ded14172-05dd-44e5-aea5-08de3c764ccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|1800799024|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnNkME1IMjd4R3A5T0J0OXhWekNpR1A0eUlIalZ3SC93UWdrOWpOUFNoelM4?=
 =?utf-8?B?QUdJc3lOS1dtM3pQOGdiRlFOTkxnQzQrbCtBTEtWdHZTdUpndnVZY25MUldO?=
 =?utf-8?B?dm01Ui9JUEJMRmdHTVBnQmx0MC85RVFhNDg1ck5WVTc2MW1BbDkrR0YzNUZu?=
 =?utf-8?B?a0ZQR2NwSVFURnd4amhTZHZMaXFRV2sreUNVMS9QVTRBVUNNVFBlc2F1dUJv?=
 =?utf-8?B?OGJ6Y2hlRVBKTzhneXpvSDlrdjhPSXk5VGNNVUIwRlJJRitmSC90Zks4bDNG?=
 =?utf-8?B?cGxJM3c3ckNXdVppS0lXZHR2aitmYXdiUTFSbmpJKzhIUEJuZm5rVzZGTURQ?=
 =?utf-8?B?em9NcWZvL3J0UXBQSmtnQXJSQnJob0tlMmlVTno3c1dmWTJLclR2M0FnT3Jj?=
 =?utf-8?B?S1IySVV5allaNjVJMFJzZE1sdWxtYk5uZWFxZ2JGaTdPbWY3VXNpSnlHQmpX?=
 =?utf-8?B?TEFDOXNyQ3UrVklyRXJONUhMKzIvc0VHWEVvUE5oUnpwK0huSW91VGFGMDYy?=
 =?utf-8?B?WlExQXJCSEw4clhUZ0w1OFUyMGdRWDhlT1BUbkRtQ2gzOTcxakdUOTVwMW5G?=
 =?utf-8?B?NmlBVmd0UVg1VHNIRFdIZVkrVDA4Z1RNQko0REVhdHpQdTJuU1BKT2lZS3Jq?=
 =?utf-8?B?ZFVRVTQxZ2NoY1lGeDlGK1BDbm1Zc096Zm5vdmw3TmhvaDlaUWlURkc2djJJ?=
 =?utf-8?B?OUQvSlZTWFUrR1NLU2tEbnpPNjBtRm9sZkkzQ2F5S0psQ1V5Tzh5azZHYVFS?=
 =?utf-8?B?SG5PZlNCZXFLQzYzS2FxdzcvVTVocW1oa1hReG43U3ZhMGNkcFp1U2hyZjQ5?=
 =?utf-8?B?dGlaSi91akpieDh0dkt4UEt4akxVY0YwVVdpTDVrVzJmWkFPeVc4bUNDY0NJ?=
 =?utf-8?B?YU02S0toeThIbnAvY3lvaGgyMlpORm9UR0p1ZTNZb0d0c1lTSTloaFhON3lz?=
 =?utf-8?B?NzR2VWk0Vlg3Q1paQ25sWXBIaDBPUncrOWczb3hwU1Z2cWEzS0hzNUxVa0tq?=
 =?utf-8?B?S0Yva3RrcWF3M2laRk1DL3dpaTJNd0lQK2o2VXFzdDRGRzZGUGF1WTJuN3l0?=
 =?utf-8?B?ZEx1M2ZDQzhDYVdrdWxid0t6Y3o0NTBmQktaOXNkeHVjVlVtejJjZU5KRCtI?=
 =?utf-8?B?THJlWnVZc056REpkbVBSU0s2VEZsSllGQWkydGxuZkpFOWpXeXR6eTVRM3Ez?=
 =?utf-8?B?Qkp6MWJCc1R3TFBYQ3R6SGNkNi9KazhkZ1hiM0hFTzJWdTlIUWROdHJtd3JB?=
 =?utf-8?B?TFZFM1JFeFNYMlhDQ1QyVGtpNE9aNDJSYjlGSGg1eWdjdDliMkEwTDJvMlVE?=
 =?utf-8?B?UU1IYXR6c2RpdHN5Y2x1R1JONm5xU3FKTDZVb1hMdmpTMHc5SWJuYURDTkpY?=
 =?utf-8?B?VUZISXBiR2JuRVRUUHVIdmVMcFVyMWtNVjg1OTJITHVyVis5dE9CdmZUcWxR?=
 =?utf-8?B?VThqSG90dzhqVDE1bHVpaGgwZjRGeTVkeVJwYWYzdnRYdDNvRDdVYXpwQ1Bq?=
 =?utf-8?B?YjlBQ2RZeGRZRTh6M2VJMDJEMUt3bm9xRXdkTUNWZ2ZNM2MwZU1YTzBnMG9n?=
 =?utf-8?B?N0IvcklmR09aTkFsV0ZTbXcxR3BMbVI5N3hpcnJJVFFVU0hkM3pESWlDRW5w?=
 =?utf-8?B?Y3hZTWp0dU5QaHJ0SzNUTlJnNHZmd1IvdWZWekI4OXliQTZsM0hiY0w0cUFy?=
 =?utf-8?B?NkJCT012MGswUzZQak8vL2VUZk11NHRLWjZnUCttVEk2eGh4RUtJN3RlbXRS?=
 =?utf-8?B?OFVMUXNEaUI1SktzTXdOcVpXdE96Zm1ab0thaGZTUi9LWHA0eUx1NHBLR0Fu?=
 =?utf-8?B?eTg5RnlMa3pBazF1RXdaV1JDZjREUmlSSmg1SFVyTVdXV1MvdlRCei96cnJm?=
 =?utf-8?B?WEdrbXpaK2Q1ZzNud1JpTVA1VGJkcUJEckNnQjlxb2FNaDU5b2dBa05Pd1pY?=
 =?utf-8?B?V0doKzc3dFVmVkJHMlJzUmRGMW9WaDBKQVE0WERXSWVZcnUxekc1VHo0OVYv?=
 =?utf-8?B?bnJpUXJFa1ZEbHZtQXV0YzVCaGRMVU1vQi81WnFqbTlSU2hYZXN2ZjdpL2tX?=
 =?utf-8?B?ejYvemlPLzQydTUxUEgwNnlvU2tmRWQ4ZytJZ3Z5S1dXRXIvOVBuM2NTQ29j?=
 =?utf-8?Q?UIVlnD39dVkzU+N1hYHnLbCVA?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(1800799024)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:39:52.4723
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ded14172-05dd-44e5-aea5-08de3c764ccb
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZP195MB2661

TCAL6408 and TCAL6416 supports latchable inputs and maskable interrupt.
Tested on a TCAL6416, checked datasheets for the TCAL6408.

They use the same programming model ad the NXP PCAL64xx, but
support a lower supply power (1.08V to 3.6V) compared to PCAL
(1.65V to 5.5V)

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


