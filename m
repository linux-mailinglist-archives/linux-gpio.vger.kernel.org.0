Return-Path: <linux-gpio+bounces-6465-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C54178C94A4
	for <lists+linux-gpio@lfdr.de>; Sun, 19 May 2024 14:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC9291C20941
	for <lists+linux-gpio@lfdr.de>; Sun, 19 May 2024 12:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028B745C1C;
	Sun, 19 May 2024 12:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VRsvdWlA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2065.outbound.protection.outlook.com [40.107.100.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE97614F90;
	Sun, 19 May 2024 12:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716122492; cv=fail; b=VVSFyv2+WHR2EojB1CXIFm/iJiKfNdI/q0rTD72NRxr7+0cZMuLu6TXzGh6YJBIsCwjN+3UOK7kpfmryDL5W16bJFSIjCW7JSDVPqlkQB8I1C+q9ZUsZDsDH+DAZCBBrgDwugJoh/FALxFiLgupXgWzjmTRTBi+qmlE67n2jG9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716122492; c=relaxed/simple;
	bh=nptNWQxcEE56MSU54h8cwoc7gARh1JQgiIoParjH/oQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aihwq60o4cCug8VEplIe9JLgpU85g57AM8OTVgi8Az04azgPLMDna1Iyu0vP95gryimQwQ4lfbbnDxt+/65LaO8Yt6SJlNfoewr78R/0+Fy71sVzMSuMMB+9pPF6mAomMfS7+xHcSmrfP5YW93tQBmabQh6bj1SsQOzzXaznrbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VRsvdWlA; arc=fail smtp.client-ip=40.107.100.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QaqBG1vbFfr6CMdnOLOojfvgkVnPvZI3bvbmCAtFre0F+jl0iQNo6NNk09tHgnFON3G3aRNAoG6rL31uIZwSeAopuERj6e6EPr228VD/ItVBmCV5/vrCOJ3TQ6qSZ20M79UxeJP9vCwOsbK1QxTNdn+1GjZVKgKpVtVjNOD7bd4Xmyekj5bODlBYOWkrtmUfuUX2wHb0oUWtBUMh122J//OiypJVo4nzLajPiuIiWxAHClycGlMJ7Dn0RS0NPQOGZgi3HyAF1rQjjSajEE61UiFmnzYPL+tX5eUeiWM2Q0ABfhPK68Ip72KYI7k7vQ4B84PkX/eEUmVCT3gYIkD3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJYo0kk9hHlFzWxakBRTwEPBFEQo8AICK/bMfwcExFM=;
 b=I/FbVdbPCbXppk+NiCghhSgeUz36XkdKl8o7bmzDRkE1bv9+kRacjO74bF/6nutaTNPc3ipXFB4p0b/IkWjBIAJ1PQ+tHLv4Q+0cTbGQF7CoP+PDw1FxNBK1kO7TmisXmgVVw4eIawQ6MOvmyGQhtF65xkLWPGWYE3clJi+uH4Kc14oah+oaxjU8n82QMRwxwGG2v1xHlu8ic2a+C681aJrPyy6RkD1NxLgWHJxdbsVwZEpvGBlnE73KuxLljuS57BYFZSz+TkvNjtNzLvl8eDf0VL9uFqWHc6bR4ymEIxVhjYMEleF86bsc5p90fbUxaZkDxY1U1z/H6RQxhUi+8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJYo0kk9hHlFzWxakBRTwEPBFEQo8AICK/bMfwcExFM=;
 b=VRsvdWlAMoW86yTqYC/TAndQbiC3pJkoVDXaIWLARteFOv4VK6b4u1lGEwEYGYKtwcaZO7fo70ZO2qAI4wvhV/fE0IuiUetAaXq5lklp2gJGmzuJ+JGFYRhICrBbilqhsBdKaNJMrtwVICYYMjC0Ha01LG/WNJ5Dak3/TZr/RW4=
Received: from SA0PR11CA0042.namprd11.prod.outlook.com (2603:10b6:806:d0::17)
 by MW4PR12MB6801.namprd12.prod.outlook.com (2603:10b6:303:1e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34; Sun, 19 May
 2024 12:41:26 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:d0:cafe::4) by SA0PR11CA0042.outlook.office365.com
 (2603:10b6:806:d0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.33 via Frontend
 Transport; Sun, 19 May 2024 12:41:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Sun, 19 May 2024 12:41:25 +0000
Received: from SITE-L-T34-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 19 May
 2024 07:41:23 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
	<Basavaraj.Natikar@amd.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Mario
 Limonciello" <mario.limonciello@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>,
	Kieran Levin <ktl@frame.work>
Subject: [PATCH] pinctrl: amd: Set up affinity for GPIO lines when enabling interrupt
Date: Sun, 19 May 2024 07:41:09 -0500
Message-ID: <20240519124109.1523-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|MW4PR12MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: d9754e95-e617-4c6b-d08a-08dc7800ff4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|82310400017|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QzTyti48SRjpforCWSUZNfIXopSEqfB41ZKv9djCKHu5G3wOz5pADrSFttK5?=
 =?us-ascii?Q?WtGDDzhOqAZhutdqFn6DKDJQSDXO+KusS0FtctujptsndSXgYrq36k+yDKRs?=
 =?us-ascii?Q?NDrCbdNDgSPahk+eX6faeao5LmBG5J7oFZPaU23MnIfJK68RCrLXoafOOWEn?=
 =?us-ascii?Q?h0+cTalvW6sXtnnSLG71Af7vCOt5SKdlG2ewMth+3Y5SCLTZUUUKH5dhWS01?=
 =?us-ascii?Q?26y1CF9GA+lw7Cffgox2RgVe4frd4P/XXl3y1lqb+Ug1+lewdSQqPotFRUZb?=
 =?us-ascii?Q?lEcVYGf3K7x14TcSM/2QvSBRQ79RGEUK339GDVhW8KgzPj6v3RWwgxYLzreQ?=
 =?us-ascii?Q?BTsHw+YLqk5SBifGpG7AAMfFHCzXvOgq1S+enbQlPrexIJjdp/2bWhpGLR6H?=
 =?us-ascii?Q?qeumh0qPXGrAxKYrZ3e83qZwUfBsAFEqDeBrV1ntVy7v9hLz97jQY0ie8yL2?=
 =?us-ascii?Q?ptfb6ba6/01jMNr5rPEPGfUT1jYX15XGtrWBGqZ7dqdUkJpCDtez1VwjbDji?=
 =?us-ascii?Q?pgzqKkjzhKoA9gIXip1m8uErqjodO5fzMEryIQnfjdS/dRPNGObRijMjDFSc?=
 =?us-ascii?Q?MMsDljuul/JeVO6qqvdUgg/mwlpGY4VXgBscyvJWJd00b/a5ZR0YfWuA82G6?=
 =?us-ascii?Q?Bx2UHkdKoMgTVQeUJi5RClJag3cC6107S5KykpCEjkr4zeiaQUF1CJH0ptei?=
 =?us-ascii?Q?s1qjg6HdlpI/CwFD8i+iUIFPru1ESeSKFwlEpQwAI9fDrr9NGTD4agJi6Bt6?=
 =?us-ascii?Q?AOaT3G3S83cYqb67K7fb4F50Ws6HD/gf+DQpTOPkAYeWUdyunU8dm7tcIFJB?=
 =?us-ascii?Q?p0BktmAee/PZ2JJ5PCFXCXaMUI6U2XEYF0zm29vvkTo2V7tGBowu6rlca2F5?=
 =?us-ascii?Q?kr9eSmjsas+vgzKFotqi+UTFdo2pcO4JgYV5rHR+I6XVt0PP2xVIQZEPb4X5?=
 =?us-ascii?Q?n7k//QbBWR3twqGlrRGtGrrYLWG9OhLzfkKFhcesbsO3kHRXCUKSjw46VLg3?=
 =?us-ascii?Q?NqJ1PZsImK2JcCns50JRjvSW/IRwX11zRy2Sr0g21Ka8S/VVPl0/ecMFJSn/?=
 =?us-ascii?Q?T6aOX78HC1HM+n4qL5z0Qz7iATVLJdRXFbvhR+Zw0qY2e1RFcwIUx90zx1wU?=
 =?us-ascii?Q?LQf1OeZePEv9/nIbvXvAOFdSazYFuJlSoOEpnrMsmA6jIfOSH/Fceu7zo3LS?=
 =?us-ascii?Q?iA37PtM2EjI3TbKjuNohQe6rj8fCS/UDpgHNWlwAV2hUf4wa09IUCnTPOAOv?=
 =?us-ascii?Q?kHtVSCAj0U3j8m6wydQJTch1zV5kJ9oLEVZ8AFV8mHaW1CV/XBfPK9m7eUXd?=
 =?us-ascii?Q?LNcDUPbB3N0LtB68n6+PYcnd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400017)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2024 12:41:25.7634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9754e95-e617-4c6b-d08a-08dc7800ff4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6801

When a touchpad's attention interrupt is triggered on a different
CPU than the GPIO controller interrupt multiple CPUs wake up the system
and can cause higher power consumption than necessary for operating
the touchpad.

Waking up the additional CPUs is especially unnecessary as the
irq_ack() callback for pinctrl-amd doesn't do anything.

To solve this save the affinity of the GPIO controller interrupt when
it's set up and assign that affinity to the GPIO line IRQ.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Reported-by: Kieran Levin <ktl@frame.work>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218169
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 18 ++++++++++++++++++
 drivers/pinctrl/pinctrl-amd.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 7f66ec73199a..0f126caa8dfc 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -561,6 +561,21 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	return ret;
 }
 
+static int amd_gpio_set_affinity(struct irq_data *data, const struct cpumask *dest,
+				 bool force)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct amd_gpio *gpio_dev = gpiochip_get_data(gc);
+
+	/*
+	 * The affinity is explicitly set to the GPIO controller as amd_irq_ack()
+	 * doesn't do anything and pinning to a different CPU is a needless wakeup.
+	 */
+	irq_data_update_effective_affinity(data, gpio_dev->base_affinity);
+
+	return 0;
+}
+
 static void amd_irq_ack(struct irq_data *d)
 {
 	/*
@@ -580,6 +595,7 @@ static const struct irq_chip amd_gpio_irqchip = {
 	.irq_set_wake = amd_gpio_irq_set_wake,
 	.irq_eoi      = amd_gpio_irq_eoi,
 	.irq_set_type = amd_gpio_irq_set_type,
+	.irq_set_affinity = amd_gpio_set_affinity,
 	/*
 	 * We need to set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND so that a wake event
 	 * also generates an IRQ. We need the IRQ so the irq_handler can clear
@@ -1163,6 +1179,8 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		goto out2;
 
+	gpio_dev->base_affinity = irq_get_affinity_mask(gpio_dev->irq);
+
 	platform_set_drvdata(pdev, gpio_dev);
 	acpi_register_wakeup_handler(gpio_dev->irq, amd_gpio_check_wake, gpio_dev);
 
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index cf59089f2776..1a97c7570374 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -106,6 +106,7 @@ struct amd_gpio {
 	struct platform_device  *pdev;
 	u32			*saved_regs;
 	int			irq;
+	const struct cpumask	*base_affinity;
 };
 
 /*  KERNCZ configuration*/
-- 
2.43.0


