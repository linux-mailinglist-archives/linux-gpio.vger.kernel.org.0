Return-Path: <linux-gpio+bounces-35310-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBnuGzdV52nz6gEAu9opvQ
	(envelope-from <linux-gpio+bounces-35310-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 12:45:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E45DF439B06
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 12:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 44F5A303FFD8
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 10:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A865F3BBA1A;
	Tue, 21 Apr 2026 10:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nVtqLown"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013066.outbound.protection.outlook.com [40.93.196.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288463BBA09;
	Tue, 21 Apr 2026 10:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776768269; cv=fail; b=mLpedfhMhgbb7n7qUtPpsl4qecP2+sEwD00+Oe+bj/qT3IYNUgsvg0GV12E1qBz4+CIb2Vul7lKGc9Bkp5pjcEa/Pfdkqx++qIga4P1cgeuDFhCNBJCxPKnDI6WVyZBnfZ5nnphYoPSQu7n0uNmJn/kgQUjVcT+FJz3kc453+7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776768269; c=relaxed/simple;
	bh=OV1EOfgrPR8jRQo531I9wj3Cr5ceU698kZh1srP5/tE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KRl65E71hChXdugckMCBg69vhJ6zLbO9I9pOcIq8mAZGK2y8rnLmnf+mThxFbkpoqspqNYv80n3yJ32AX++3IXfPwlKLbINrg8Btp+wThu5tGDRscGdzAc9HaE+Vg/WTyIWwAaaROcvDp6KVb7YK4thQZ3W/PlkhXWgjqdXOSqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nVtqLown; arc=fail smtp.client-ip=40.93.196.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PI/uGucdCNz5Q8FNAOHx2rcKiT3fvV/TjIYEH1xhMeK1z69N+gvpkmmERd+7gqu70Twoo49IXGuvUKrOLxzVzcf1gzA2vokc1bYtUlj9QfYtNe4Mce3G+Sl5o/zebdB+KzAy2nuCXcs3LgnpxH50Q0JEWApX0EQn8NtbTe1BCdFK8zybtpH89y1wxaR5Y5I6SzflUkOlHtaPBLpHxsZ0Ipl3mGlzu0jsldi7pzSGqOjdueyqwDjqkcnEBX9lSZe5MBJoZuBMbDslx7pLVcSEMS5nJFZrrtomEAFHc9veKFzuCDL94iCSDpKVsei+wPudBxBSfeW7BEaU+eXgAv9IuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ah0PhSeyxPJ+iyZTlPevBN3vuUak12Ucav+orIO6GFc=;
 b=R8+uAAALpcJ4s5x/9Ow0UdLLCS05Sr7EjCO//Pakx7irc7vA02jOF+vMxcddo9vp3T4JpMG1VK2SNgggdWlmvcbrCSSqM/UffiWBQ56x7fA9QXsE1B5WdtQZh/CI16KiP6+ziDjUMN7DBWyZHbmiEUWE4P4cTZXbqVEftK3HHQHEVymbXWoE3PmY+dSBIRweo/jX4NNm+hPvZ/+SIaTELKyHTO6B1SHmBacXSlXjzbFq8QcliEvuNLI4Fp0Wrc653Yw21FVBhhRknhtrpnmSQl2fDUDs2ehhlhgAdE2JWoLfIzMfAofXA41Ck/JUMh+p8odUtKwp+kK0Mij6xoERLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ah0PhSeyxPJ+iyZTlPevBN3vuUak12Ucav+orIO6GFc=;
 b=nVtqLownOfhlpiFNGfpRgK8ltNcJAUX0jLS18/nGF8PMXhl/d/f8v4bSHsqcNmZhbs/+iruPaSIyUz2LLpRlB8Pg7xnrYplaZPCzY3VoRu1zdbpLfCfnWOSfnCazF+TTDyoOmqVwbv275EIuA2hd1hSW+r2rJORcXb9vzbAGvuQ=
Received: from SJ0PR03CA0336.namprd03.prod.outlook.com (2603:10b6:a03:39c::11)
 by CY3PR12MB9631.namprd12.prod.outlook.com (2603:10b6:930:ff::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Tue, 21 Apr
 2026 10:44:21 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::ff) by SJ0PR03CA0336.outlook.office365.com
 (2603:10b6:a03:39c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 10:44:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 10:44:20 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 05:44:15 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 05:44:14 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Apr 2026 05:44:10 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, Michal
 Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 3/3] gpio: zynq: Add eio gpio support
Date: Tue, 21 Apr 2026 16:13:58 +0530
Message-ID: <20260421104358.2496125-4-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
References: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|CY3PR12MB9631:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ee9bad-fdf9-402a-c8f3-08de9f92f20d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	F96hpq+psGR2+MsUDeCU/lxlTi2+3wf0ojspz/OJMoZYyemITNSrAx5KNv/R1oziART8hs9XXU9838eKIdCuCkiw6Gf86WpfE94Nvfh2e/eDX9EN2yaf2g+/298A210Hrd/DjoIoCy4fuY4cy/azZr2VDI4ozJQc2MlPwalTVBcmttrAIwmpEBElHkauYNigzmvWLYj4lXxwnFyawOlRjjcBQfsv8L5PXICxS0BiB7jDLu4m4X9s6YkOM9Aht/LMHsJbSK1X+k47z1XfIvcxJwoQm1w2X7HSPVCoNsbUqn5g/DzSynHAX6o/Fkq+Ucm3c76cF68hY75ehAqGAfuONqLFCX4PegegWAq3LTBMBq71XamYnLsQcsMpMMryZBXRF38Zyu08owyH57eLWocfSx39Nm+TSrpu9EPyok1HFbv3ezOxNR+t9pApEupLCtYmrT/2dHdopCZ2IpbJWPyFCCaB4viDvUaxZloRIWSX/LYXOXITP4iKwDXVEPw5Z6STKaDFxZvZW+cWmsno1lRjBP1Q81rb/MJyHO5rbK8rzt5UPP99M6jPmmxopJ3FtgC4TCLJoRY3pb2rNl66N7maJm1wE00ZbuLVEcwIEJF86vBIOiVBaqWDyc7ha3TraOouqRd7om2GQoznoVp+K/rMb7kBft5IZfg3FXyehYHcR0oO7lBy1NMVuGtyr7xKKJf9PAR+0vnEWqTTBvv/SyHptKdqPswIfShlWSPfzmIY9QH5hVK28SYUl3w/bEZzzSI6DiXW6UhkYCVwXAkiMZLJuA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FhH7oHggh00kqbCHzlKI1N3w+U2scz5XsDTrUnaq7mW4kMg3CpOicHj+BBu+oK8U6+M8TuGugzHmLlolWa0DE2VC3MozvI+eCNSYZLFanL2A2lHKdD9xA41mP2c4y5zcet9V47+HeUIqpyuJg01ewXI+LhuaNY3dQeRk7jORtovL/oc4YBxVEjd7EHfZBVHe9CufR1/xveb9oC/l8qi89PpPIr1/O4Oh79grEcyO5qGPlUGksa4bYw6+8zTqfXFbfeo0ZmmZrk0UE9QBySV2tArozJp2v2q7K+QdeaK4WWbFPOsjXfchmAbHS3s09TQ/GZP0Kp4ozwED7ePozCLlranPQxFSmM7+Jiq1W/8VtgowL0bXDwSfLh3QSfb9RtIB3CIpREQfkaN5+RSzrpwmJQkQlljXayj2RpCbW6dwFQixxtXv96hKoW16D+h2mWrd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:44:20.7418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ee9bad-fdf9-402a-c8f3-08de9f92f20d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9631
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,kernel.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35310-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shubhrajyoti.datta@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E45DF439B06
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


