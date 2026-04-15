Return-Path: <linux-gpio+bounces-35163-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC2xFTdv32nqSwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35163-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 12:57:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9731403798
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 12:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7359630B930F
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 10:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FEF934B437;
	Wed, 15 Apr 2026 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ylGoSx5B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010027.outbound.protection.outlook.com [52.101.193.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271CC33D6E1;
	Wed, 15 Apr 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776250618; cv=fail; b=U2Nn55bU9NXG+eRnSbEuOYLCC+qW0q+nfAjlcZIyEKC/54Zy90vNtdOwtXjSsAYa6Fo9bxcpHPlTyYderUDND+R8vzjcFojk22K5mudBT+jqVBst452Im5mDNNBsBMOgiwmSuDFJtQXQl255cv8ADF0uUkckP4WklOfqoqP35yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776250618; c=relaxed/simple;
	bh=OV1EOfgrPR8jRQo531I9wj3Cr5ceU698kZh1srP5/tE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mVkV8eWL1/ItSVu4Jz781ldFPepryazwQzpPH70mCehDxMaf+iDd6YlKYunX6YH4Ix1Lo1HdGV2+2cTeyd0/0CDPFh/6vYvfzqCg5jQpPpkJe89WmW6kMEtdQfzLHBlJBWTZ1NKTEBOFLSzWD9DubtsuJQwWmOWzX1CBJyCrhX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ylGoSx5B; arc=fail smtp.client-ip=52.101.193.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CC7I3mnaBajDK3b966xTljts/NHXr6m2NJZP0YSkgrtSfnSpoTMj0/8GVMaypVcUGbPP2afVai008kX4086LZzt4zgTxOd+dnYVI8IgFYCEFYR1uj+ApuaxU0BJ+J5xPios2ioOFe1nDjuLOxg+epp2nYs7IsTzzkuA301wsDGWccsgzoeGeCnfrWwafzcZFOFX2ic1B7QYn8asXJWarQnLisvMLdiNqgnHuofTphMMZLAR/C1pl+8cW6ORqm05r7P0hFPRbbDGtzrXXL1q4HEkDANQE9qFUJK3gDL07lhw8mJKP8lzF7YcrT8HwpB+xQRiWqWpAn71PMGHVfO+dxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ah0PhSeyxPJ+iyZTlPevBN3vuUak12Ucav+orIO6GFc=;
 b=kPFCHQoZfhnWmdoEXcN7pmOf5dgNMY99QK+kcnQI2kOfGB1IVX2OQzH04voxyVQn3vhSDqxIwxICLA1X+7YWAsByCu328qVlLn1kpBtN00Rxl1+nQiLrssUag4y6EpYKjP4yi8RHAZ8gYcV6FIp2Q6+8l02cc4fV/ttAJkTSoLOmKMy7eQndNHKeQqAUQDBz5ws24y7DBgc2GzxURVwaUngOWHfN49dwEJuoTt/0XH1MYJHWdCzg/YR9bv7byLGCkEdbaCWTv4XlJx7NsQTacNp3zlsmx7DR21RFhhx4SUukOKDbZKDTvCVfrJBDdW0RFWQbl8YYxFCfdFxFw/8AKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah0PhSeyxPJ+iyZTlPevBN3vuUak12Ucav+orIO6GFc=;
 b=ylGoSx5BsDCV5Nwm6iUDrV5UO/UksQ3a/bLyCYYJSFiyk+cYHEhbnBnCYtSC4B/5M/HTLuaq9gX81Ygg+NHA7NGlW4sMEKPR6QqhVDYj9sAtT6csNmfg7z0Jn0IWD/ciVDHlPO33fsE2zac6ivnGrncMp5i3QimA8+LHj90j/Kk=
Received: from SN7PR04CA0190.namprd04.prod.outlook.com (2603:10b6:806:126::15)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 15 Apr
 2026 10:56:52 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:126:cafe::2e) by SN7PR04CA0190.outlook.office365.com
 (2603:10b6:806:126::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 10:56:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 10:56:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 15 Apr
 2026 05:56:50 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 15 Apr
 2026 05:56:48 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Apr 2026 05:56:45 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, Michal
 Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 3/3] gpio: zynq: Add eio gpio support
Date: Wed, 15 Apr 2026 16:26:28 +0530
Message-ID: <20260415105628.957689-4-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
References: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: shubhrajyoti.datta@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 6123da8f-7a59-494e-4cf0-08de9addb319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	23XL3EYY62ogfNFAJxZ3oeJtNT03sg5s4Eq4GDxI2Ye4lZYiYrg0HPytaSQ+v2/WbnlQRCPRfy9U9iiqEm7WwfHviTkrJ/55pLMmOVqSMWHg6zZlfGBwfi8NvfnAToYmXDWjHC4IaUIEUa+2dLf3Qzu8KoqTtOjodLsuv4pg1sp2MwTkNj5RiaXccGEhd0zDtbGS9RfCvn8DgxqAgRWD0WBIw1qpJm3eYTn3y4bygyEktLJ9Xs2UmwEK4kKK3OyDJD7B6biQk4KbM1GZtrrLZ7oOtEa1qAf+jatd7CiS0lVBTT9DS/jQgDcdL4fhoIUAijdxlTQyVtz/sQk0kYsuNeNfSatAOl0FaqgmybS/Ae0miTKw+DtlS3K2lNGcRpJ2epwzDuMIT2P3FoTIydz1+0c4ZsOfRFvoh9IUbcDnwM+imD992hG984aU158HO6RTE0zoAG/ytv+0yl/6v86+phd0K7Y0Wjlv/At+F8i+qaN8sh9q1jAC1fXl4fbHSxoG2ZdjUtDSQy+nLxRIDS+m5lNDiyCjkmLFafbUqwBijrxqWd1rmlVz7vm7FKrAs9tIiiai58Xy41hwnq8xjl4bRlSmwtzO7v0HO7Y1jserPhz7gGyDvmFL0puYGx90jd9rfX/YdHKVIPxxj6x8G/ps/inkva2NkYUV/ZdDxzvnmqg5VQpVlUJQvoxoCPnkNUN92VO03zYi0Lfuv0gMx6RTJd6GlOWJSSWueZthH/IPBu5fEbSBbXpwM6Gd6rU8Fp8WtCVIUgSekvUA0CPsmTZWng==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z3BTffQ2b9IPpoYQ8x6UzUtXjsAl8eFvLEOf1z1uNnSHSphXs3bh4kp+40vkp9BZyDi4lObvr39xyUQsH55HXlefhZvXVgcvyOjigVuIle58wQytD6qsCgxfw94M7Ye5UtT0JqXkCwLJ/zXpnp1/MX1SUrzx/JRmPMFbKnXIAtR2dURyZMr7KOLnz64LEn2lR20RHnMXJjJ7O+Jd4Wl9BZHlUIafb4D9otTXNpgrWtxqDAueQWGUmZhzNrCTEVRODoBggy75DkGTZ/qIkkTNfJz+4HqriWunA0DsNMWsJ19061Ofa942SOKdB7sQjRVIQNyl6/55BnGWQAOSLM/8xlvLQsaO0wqIPkVi+SYbJOk1WfLu23dDP2tQRX9uJ62Vxnf9l/yKgugS59u4HbK/MqEwsqWtHFp1CxD960KOfXUzEiWFRy3zs7+YjSdh0Yez
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 10:56:51.6035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6123da8f-7a59-494e-4cf0-08de9addb319
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35163-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shubhrajyoti.datta@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A9731403798
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the EIO GPIO controller found on
xa2ve3288 silicon.

The EIO GPIO block provides access to multiplexed I/O pins exposed
through the EIO interface. Only bank 0 and bank 1 are connected to
external MIO pins, with 26 GPIOs per bank (52 GPIOs total). This
change extends the Zynq GPIO driver to support the EIO GPIO
variant.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v1)

 drivers/gpio/gpio-zynq.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 571e366624d2..8118ae3412c2 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -25,6 +25,7 @@
 #define VERSAL_GPIO_MAX_BANK	4
 #define PMC_GPIO_MAX_BANK	5
 #define VERSAL_UNUSED_BANKS	2
+#define EIO_GPIO_MAX_BANK	2
 
 #define ZYNQ_GPIO_BANK0_NGPIO	32
 #define ZYNQ_GPIO_BANK1_NGPIO	22
@@ -818,6 +819,16 @@ static const struct dev_pm_ops zynq_gpio_dev_pm_ops = {
 	RUNTIME_PM_OPS(zynq_gpio_runtime_suspend, zynq_gpio_runtime_resume, NULL)
 };
 
+static const struct zynq_platform_data eio_gpio_def = {
+	.label = "eio_gpio",
+	.ngpio = 52,
+	.max_bank = EIO_GPIO_MAX_BANK,
+	.bank_min[0] = 0,
+	.bank_max[0] = 25, /* 0 to 25 are connected to MIOs (26 pins) */
+	.bank_min[1] = 26,
+	.bank_max[1] = 51, /* Bank 1 are connected to MIOs (26 pins) */
+};
+
 static const struct zynq_platform_data versal_gpio_def = {
 	.label = "versal_gpio",
 	.quirks = GPIO_QUIRK_VERSAL,
@@ -882,6 +893,7 @@ static const struct of_device_id zynq_gpio_of_match[] = {
 	{ .compatible = "xlnx,zynqmp-gpio-1.0", .data = &zynqmp_gpio_def },
 	{ .compatible = "xlnx,versal-gpio-1.0", .data = &versal_gpio_def },
 	{ .compatible = "xlnx,pmc-gpio-1.0", .data = &pmc_gpio_def },
+	{ .compatible = "xlnx,eio-gpio-1.0", .data = &eio_gpio_def },
 	{ /* end of table */ }
 };
 MODULE_DEVICE_TABLE(of, zynq_gpio_of_match);
-- 
2.34.1


