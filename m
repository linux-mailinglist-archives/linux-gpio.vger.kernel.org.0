Return-Path: <linux-gpio+bounces-29802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A5728CD863F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 08:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F4ED301E6E9
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 07:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61D6194A6C;
	Tue, 23 Dec 2025 07:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="rctCLEq2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022117.outbound.protection.outlook.com [52.101.43.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2869247295;
	Tue, 23 Dec 2025 07:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766475043; cv=fail; b=oPHOj4V1NakdrIYkmkohwp2jSqiNpx0XoA8tt3OWLjWJedkw+mL/zEaZPLOaEAY433QuE61AlWPHyZOVkVPOn5N1oUXVyyHBm6jNo6Pm5ReGHNw0DAIhuqvi2A3mvJFILZBYPGuU+QPUoFttlsW8ek/VW89o31VW8lxH4Sv6yuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766475043; c=relaxed/simple;
	bh=pJQvlZgpjtA7SsBgJ73+S4jLGzf89q2oESvz02ujBsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ehto6Jo4wwa6f6GHAefivgwRx4TK7KVQAMKiSQcBGJNh9znEilZMF3rjnaFJTVExxCr2rTyt/yRcYfa3s08BN+0G4wRnAkKqoDYLLJyuWa89wf6JIMUsuJ1Tuo5iO9adA+a7p8ILolTVjxrpq5vFv7X8KZBtdRRI4bafgr9K3Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=rctCLEq2; arc=fail smtp.client-ip=52.101.43.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxBDlJCOQCumDPgHkbhnkhXRtcwgURN8Hrs/y5IWTcaarKlPXa1IPwVaM58wHP7oRufbJb6HgxwMzyPviBCDKGc1enoNlaTkwr8I4kXUu7tXpAD8RlNYaOShsPMH/X1Wfmc8sFw1fuSyEfTBqRZM+/ITnDOQ3aOBqAcosCOToF0gZBXiCljkpUUaAPpzs4hElrsKG0novavp+STVsu/32i+vmXyTOeJoKMVy4a6KEN/tphwVMYJBoCKKs8hZ7oe2bnCVEjtGY/EiI4HBTWBzieOc+levo2ldLAmHQNRMlR8zzEFuzIq8eA/xuXs9aPO4otftxFnfAm37+0ggq/sPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4QHQAJMNNuNduICE2RK117gfS4HoYjThmsh7sSeZ+A=;
 b=qr+4pG7DesmTt2RZvrSOk8j7nbV4ntL9DvENpcs1Z5IR72BJw/ZsCg8itf+lJ3HlzAkx+/L5v7SveLCmsfmT1Ad6T8+JHfxiuckVogC7ET3Y2/rKLi0BQnRGOYxQBG5qFji3+LDODH2/te/qoMSuIKImOiFmzjiB01c4Lt4WVsacFEd1b1XKDAbgsqgEfLEF89X9zSfjXtJQxMm2EP9gNqs4MhXGcy/yT28pWYxUwYKf/knrnDRD1VRixvFXj7rFDRYAM9MSRiZ6Rl2bocbamvyUahdFrR/fLFhWMf+yXMWku2q+zSOekPLecgYUkB9jHUxzREcctZvn3DAE/G5IAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4QHQAJMNNuNduICE2RK117gfS4HoYjThmsh7sSeZ+A=;
 b=rctCLEq2CYUsXQBIPaS9qIMsB5eyZVRr7sYpiYl4da1NvVBhvE4ySXeGYiK3GvGhkPcN6ewayE5b7F84eih8jb8uli2Eiys/qSpxP9vgxtDWkCN5BwL898oSLvjoy0iBlpQnFwzeC5e0y83jEDQFIB+sIz3jlFRzsfTmDBgUZPYJaeeuBG3qTBDNcqxTAzv+g4qn+gTeHDreDrjtmrz9zk2Y5BIyY3iioupQ7Nn6Is9Bj9DAO1JAB60DkxOsGgmFiPyQsniT2ytEZF+fWZqVnaxPpnGi8n3zmfiEDdlhhoRRrSAr6s6L23jn1nRDWG2R1BxnZJW/lyJx6ZUKr4bYyA==
Received: from SA0PR11CA0130.namprd11.prod.outlook.com (2603:10b6:806:131::15)
 by SJ0PR18MB3882.namprd18.prod.outlook.com (2603:10b6:a03:2c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 07:30:38 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::a5) by SA0PR11CA0130.outlook.office365.com
 (2603:10b6:806:131::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Tue,
 23 Dec 2025 07:30:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=[127.0.0.1];
Received: from [127.0.0.1] (4.227.125.105) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Tue, 23 Dec 2025 07:30:36 +0000
From: Swark Yang <syang@axiado.com>
Date: Mon, 22 Dec 2025 23:28:57 -0800
Subject: [PATCH 1/2] gpio: cadence: Add quirk for Axiado AX3000 platform
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-axiado-ax3000-cadence-gpio-support-v1-1-c9ef8e0d0bce@axiado.com>
References: <20251222-axiado-ax3000-cadence-gpio-support-v1-0-c9ef8e0d0bce@axiado.com>
In-Reply-To: <20251222-axiado-ax3000-cadence-gpio-support-v1-0-c9ef8e0d0bce@axiado.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Swark Yang <syang@axiado.com>, Tzu-Hao Wei <twei@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4502; i=syang@axiado.com;
 h=from:subject:message-id; bh=pJQvlZgpjtA7SsBgJ73+S4jLGzf89q2oESvz02ujBsQ=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhkwvVwl1dZ/4z/cEw4Unzekot4w/O8NrS7Ci/ItS30xp2
 azVFYwdpSwMYhwMsmKKLF91vuWfzNW+17l3ZSnMHFYmkCEMXJwCMJFVeowMn338rc/u67ummn9h
 8pPMlufGRrVb3dbtOvzg9nrGujQ7Y0aG/eK3BHdFbTMrV9t3JWLt1OciZ5Zymx/S+uS19W31Zs/
 rLAA=
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|SJ0PR18MB3882:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ecc09aa-9cb6-4d0e-2817-08de41f52a3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVZyRnhjUmQyUEs2ekphdENXelBVcHkvUjRCK0paQytCTjF5WSszaXZpSDhE?=
 =?utf-8?B?bzZiYVJ5cmZtYVFkU0pHbXNxb3ZaZTlYRkhyTTJuU1hBSUxGcVFPNDhBRDRw?=
 =?utf-8?B?RW5YT0NxNTVQUGFQZXlnK1J2cXRMbytBeGJweTc0V1pudzg0MU9vZ0NML01s?=
 =?utf-8?B?M1VnM1ZSZXZTS3lkK2syc0NrTGU4QVRtRmZiZFNEQXl4OEdDSmlwbTA1aTlJ?=
 =?utf-8?B?ZmVQd2xHSFJ0clBRUExtYzRVZVd5NktPNm96SzdYdWlxMVl4VnJBRUZQL2FR?=
 =?utf-8?B?TFluNDdNV00rZzZJVnA1bUZXcmtSNUJ0ZDdmdlQ0Unhsb3RoTW8xOEozTHRM?=
 =?utf-8?B?d2M3VWk5YVpjS3ZhK0FQQm51NXRCUlMrQzNvLy80NW1qTXJsbWVkSGFUMC9M?=
 =?utf-8?B?bnJpdGs2a3dzOU0rcEh2OERzU0VOSDU4MVNLUXdjRFBDWFhjV0RqdUpCTms5?=
 =?utf-8?B?NnBpRlpVZzYzZHQ4Wi92NXdHTG5NRE45REprNXhjRFk5cnNzYzJ5SHBZTnlD?=
 =?utf-8?B?dFNqdHgyRy9PYnVuTXV1VFFBVGJQbGNaUXp1ZWdMV3BORXk4RjhvWkRzZjBQ?=
 =?utf-8?B?b2l5a2loK1JHaDQ2S3c2WlZGM01CYWQzT3p4OXFVeUFuZ1ZsR0xFRlIvWjBt?=
 =?utf-8?B?VFord25EUC8vZ2JHNmxFbkFGTDJxVnJVR1ZqM1FUZTRoOU1nRlF3b0svL2ZI?=
 =?utf-8?B?NGFJL2x1UGdmaU1SVUNmSTQxSm96bGI3eHJ5d0ZQNE9qNUllTllYVWF6RGI5?=
 =?utf-8?B?U1JQcWxRalFpMjlFSzErc3I4ZUlPbFhEL1YvVEw1WWpZTStpbVArc2tSRWo4?=
 =?utf-8?B?MXEyb1VEY0Y4di9DUWw5SUZCR0l0ODhwK01HYnNsbWU3Q0E1U0tWUDZhKzh4?=
 =?utf-8?B?U1FtN3lmRmRKRXA1L21vdjNVV243MzhKaXBCRFR1alBVY3N2YU85dElwcko2?=
 =?utf-8?B?eW5welNsQ2JFSUpDcWlkcjBsYm5FSldxcHFKTlJ3WFVrWXliQTZjYUVTSUkz?=
 =?utf-8?B?Q3BDWUpVU1lRNTFmZy9KM0pZWkNVTGYwUnpqc2lmREwreW8vbTVqUUUxWDVC?=
 =?utf-8?B?eFZVRmNOTFhFUWlFUzhFaXEvbWtlZjdsMzlDUHM2b0lKWUUvd1JTZ2wwMzI3?=
 =?utf-8?B?dzEyOG9yeUNUWWtucldvRFllUjVBMjVpSktINm1LbWVSR3VXUHNUNTZyNXNB?=
 =?utf-8?B?R2hzWUtnRCtuSVNNSkpUZHVib0RjRy9FSlBacG1kTkxNSXZNczBpOHRvKzN5?=
 =?utf-8?B?RzVYTlJiV2M5OW5rVGpPQnFJR0lXMTRMWXZ1SDFpMGVmVGVuQTM1QUdnQlFh?=
 =?utf-8?B?UEIzUmg1bytUdmJYVFdqVXhsMGFQOWJWeTA4M1lmZVlEeWlKTnZUdThndGtQ?=
 =?utf-8?B?aFljOVZIeUpMV1p2Q0NkU0luR3lHdzh6UGhGTGczelQ4Y1dhVWsxQmFKMERn?=
 =?utf-8?B?KzlRemxmWDBhSXVTb25LZ29MMWhkNEFCNGRFamMxU29SaFJIcENSaEVpTmJR?=
 =?utf-8?B?cHNaVE9jakFZL3R5QlFjYWIvcTBmajY5azZ3Mk1NaFZ0OGRxR0NNK1pIZHE2?=
 =?utf-8?B?TGpWSER6blhpNXZYaUhrRUZhanl5cjg3S3BGYzVaTHgwa2ViZWlTdWtqU0lq?=
 =?utf-8?B?YUl5aE1YL3pURHBYMmgzSUZ0Uy9vR1MvN2FnMy80YnpleWpSTUQ5RnZoV2F6?=
 =?utf-8?B?VTBidnZLREhrVFVXWHI0QTkrcWxpS09HcGhqMEU3Y1JXL2J3Szc1aUZsMTlj?=
 =?utf-8?B?NGFPeCtrcmNHcjR0b2lNVVlUWHFMY1YrYTcrV0ZIQkNQMFhPMkZmVWEwdVhp?=
 =?utf-8?B?eWlDcHNQcWF1WEVRL1ZNV1NWczZhVjUxL3BXV2VSY2I0Vjl6TGZwdktPYkR0?=
 =?utf-8?B?eFh3aGFtMVVvVVV5M1hobXQ4dTlFVExWSTZ1RkYzcm12R0gyM052RmNtalBr?=
 =?utf-8?B?enYyZUtNci9pRGhsQzVJbnQ0ZTZYZjNEUXg5dGt0SE1WZVNwUXlBZGlya1dX?=
 =?utf-8?B?NkFscm56RlJYcnNMR3JXZkRjUGF5dWdCWXZ6aENSamlaVk5PWVVwUm8wMjVz?=
 =?utf-8?B?VTQ1RDk0bjBZRVR5aUtmUStGOGxDS3B2T3pyNWMxQ052TmNCRDdFQlk1bTA2?=
 =?utf-8?Q?lJ2k=3D?=
X-Forefront-Antispam-Report:
	CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 07:30:36.1395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecc09aa-9cb6-4d0e-2817-08de41f52a3e
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB3882

On the Axiado AX3000 platform, pinmux and pin configuration (such as
direction and output enable) are configured by the hardware/firmware
at boot time before Linux boots.

To prevent conflicts, introduce a platform-specific quirk triggered by
the "axiado,ax3000-gpio" compatible string.

When this quirk is active, the driver will skip its default
initialization of pinmux configuration and direction settings during
probe.

Co-developed-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Swark Yang <syang@axiado.com>
Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
---
 drivers/gpio/gpio-cadence.c | 53 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index b75734ca22dd..b9f39566b0f9 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -6,6 +6,9 @@
  * Authors:
  *  Jan Kotas <jank@cadence.com>
  *  Boris Brezillon <boris.brezillon@free-electrons.com>
+ *
+ * Copyright (C) 2025 Axiado Corporation.
+ *
  */
 
 #include <linux/cleanup.h>
@@ -31,12 +34,18 @@
 #define CDNS_GPIO_IRQ_VALUE		0x28
 #define CDNS_GPIO_IRQ_ANY_EDGE		0x2c
 
+#define CDNS_GPIO_QUIRKS_SKIP_PINMUX_CFG	BIT(1)
+
 struct cdns_gpio_chip {
 	struct gpio_generic_chip gen_gc;
 	void __iomem *regs;
 	u32 bypass_orig;
 };
 
+struct cdns_platform_data {
+	u32 quirks;
+};
+
 static int cdns_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
@@ -141,6 +150,16 @@ static const struct irq_chip cdns_gpio_irqchip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
+static const struct cdns_platform_data ax3000_gpio_def = {
+	.quirks = CDNS_GPIO_QUIRKS_SKIP_PINMUX_CFG, };
+
+static const struct of_device_id cdns_of_ids[] = {
+	{ .compatible = "axiado,ax3000-gpio", .data = &ax3000_gpio_def },
+	{ .compatible = "cdns,gpio-r1p02" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, cdns_of_ids);
+
 static int cdns_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_generic_chip_config config = { };
@@ -148,6 +167,8 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	int ret, irq;
 	u32 dir_prev;
 	u32 num_gpios = 32;
+	bool skip_pinmux_cfg = false;
+	const struct of_device_id *match;
 	struct clk *clk;
 
 	cgpio = devm_kzalloc(&pdev->dev, sizeof(*cgpio), GFP_KERNEL);
@@ -165,6 +186,13 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	match = of_match_node(cdns_of_ids, pdev->dev.of_node);
+	if (match && match->data) {
+		const struct cdns_platform_data *data = match->data;
+
+		skip_pinmux_cfg = data->quirks & CDNS_GPIO_QUIRKS_SKIP_PINMUX_CFG;
+	}
+
 	/*
 	 * Set all pins as inputs by default, otherwise:
 	 * gpiochip_lock_as_irq:
@@ -173,8 +201,15 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	 * so it needs to be changed before gpio_generic_chip_init() is called.
 	 */
 	dir_prev = ioread32(cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
-	iowrite32(GENMASK(num_gpios - 1, 0),
-		  cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
+
+	/*
+	 * The AX3000 platform performs the required configuration at boot time
+	 * before Linux boots, so this quirk disables pinmux initialization.
+	 */
+	if (!skip_pinmux_cfg) {
+		iowrite32(GENMASK(num_gpios - 1, 0),
+			  cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
+	}
 
 	config.dev = &pdev->dev;
 	config.sz = 4;
@@ -240,9 +275,11 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	/*
 	 * Enable gpio outputs, ignored for input direction
 	 */
-	iowrite32(GENMASK(num_gpios - 1, 0),
-		  cgpio->regs + CDNS_GPIO_OUTPUT_EN);
-	iowrite32(0, cgpio->regs + CDNS_GPIO_BYPASS_MODE);
+	if (!skip_pinmux_cfg) {
+		iowrite32(GENMASK(num_gpios - 1, 0),
+			  cgpio->regs + CDNS_GPIO_OUTPUT_EN);
+		iowrite32(0, cgpio->regs + CDNS_GPIO_BYPASS_MODE);
+	}
 
 	platform_set_drvdata(pdev, cgpio);
 	return 0;
@@ -260,12 +297,6 @@ static void cdns_gpio_remove(struct platform_device *pdev)
 	iowrite32(cgpio->bypass_orig, cgpio->regs + CDNS_GPIO_BYPASS_MODE);
 }
 
-static const struct of_device_id cdns_of_ids[] = {
-	{ .compatible = "cdns,gpio-r1p02" },
-	{ /* sentinel */ },
-};
-MODULE_DEVICE_TABLE(of, cdns_of_ids);
-
 static struct platform_driver cdns_gpio_driver = {
 	.driver = {
 		.name = "cdns-gpio",

-- 
2.25.1


