Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 475B2433B9B
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 18:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbhJSQGk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Oct 2021 12:06:40 -0400
Received: from mail-sn1anam02on2061.outbound.protection.outlook.com ([40.107.96.61]:31168
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233718AbhJSQGi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 Oct 2021 12:06:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xzr19SVJC5eLAtj5HCrXBJh1O1nL4PU7ztAGNhuHRMCPneFGOQ0c8dNL6+RVb6JWYCtllHOekSp37sFcaPCHYpvRetSLTAoVV2hcuKkmgLPpRSpkEJalfj5fn5lDAslnRnvwX1PC2x2DOXBRD+MPUvTHZ39vB6XgX+YrFmu2o3pO4QRDyEv95rgI/L5Jjyr57cy+3Xib40yccMDPLE4SkyRW9GDk612YSDUP9E1UIhAmxmn/VOvYO4BBEE7ZipqLynR357ifPhdZVJD41LVUKZoSWes1I6aaKKAKfVuomzXCMNHmgFx2C+5Cq8J2NssZCSIvaiP7i1g9RLXi2DuC5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrGPLe1SEQkvNtSee211EK8AwR9jo6TWWQYRIUIOtZo=;
 b=kysTqILVnMIZrnzjhaTTUw/Q1mn/bH9hrw84u+TCM5pFkRGvNZf5utLEw+FyJvMUhtx0NLsezOWy5d/2PemrdxQFU5sd9Ms/jQfSq90LsZ4/RbopdAfHdzC6vrsgviCCh6Uo202B1WYaAXIjK2BQwySob4WxaHbFsdJl2oLP4wN+ahzc/gEcD6qviCttMwPSYVb70h8BYWqUf5RUinsMaPTd7Q/KjBdAf1Fm6g8GxVaZr6kVcL+aEYE1iThta8+UlWMmg8FMgAq6SD+oMgotIMhRxjv3FT3uMfy+uAV+RrJsmuZmvYipEOrw8J4gJo6AjydTkyK5I0qDmGK/O03DqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrGPLe1SEQkvNtSee211EK8AwR9jo6TWWQYRIUIOtZo=;
 b=Uu2DsVulWoJafoG821MzlyQ6LQPi9Di1Zf2TEnOTB1OTsdtgrawyOXIuoIpuf1SGvpanrYmqFQIsnqrtrXa6ZyK066/22nELHPYPgd/XoD7JowF8baI4q/sJXwMATDFFawO/Ch8DGcNcqoHaXkLGwP3NbKkHDMiks3olePNreCA=
Received: from MW4PR04CA0350.namprd04.prod.outlook.com (2603:10b6:303:8a::25)
 by DM6PR12MB3467.namprd12.prod.outlook.com (2603:10b6:5:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 16:04:19 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::83) by MW4PR04CA0350.outlook.office365.com
 (2603:10b6:303:8a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Tue, 19 Oct 2021 16:04:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 16:04:19 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 11:04:12 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
CC:     "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v3 1/2] ACPI: Add stubs for wakeup handler functions
Date:   Tue, 19 Oct 2021 11:04:00 -0500
Message-ID: <20211019160401.8296-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e097ad86-5b58-444a-928a-08d9931a1bf6
X-MS-TrafficTypeDiagnostic: DM6PR12MB3467:
X-Microsoft-Antispam-PRVS: <DM6PR12MB34674E427F4EFA4296FA437EE2BD9@DM6PR12MB3467.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zRRzXSEm/s/xouDs67HDAPTBDS8NJK3Vyh32Yd7o8UyIik7D3mhGbpkpCkKhA1uKdQa9ClmyG6ELdjVhM9XQjPSEcCFtHn5ZRxLecKwnNPLSuv2X2dmhxErhfAOj9jbsuYRq8q6/lrmy7eety61YP34Roc/tfneVVSaNHMGuB0b5IvK2T9E1i/D7GLbNYXNquJd7Ti+lWJivEfp/sqebDqwxr9xnqh43P4aH0mOvoyRjcb/MWN5IZ37RpDSgMxnaGX5n/aCxfQVnuBfOnptBfox3Bv1OvCjHPRsh+DaaYsEpEmUyPprkQbc0Dw97gHKlGZ/UhrdJoMcdMtk8/+0JGcCKxGpnQM/av2elHMpirPTw9KV2PvVRe8nlQyHJZe09anBr26PW12lbmVWnKRa/Ax6Nwnd1LyzYDK8Na9y+lFLZ92hmo8zB12GH5oT4MWpF1ZwIvL5TeEa5eJ/RX7iCA2cB/cfBNoH0R96//7SHynA47pmGBVrkzkW41XC7SqpgS4vFwIVjz5+lKWPyNSC+FVn8meTcp+zi/JUYP0UkmwCR3Yo1RJGj7OrSLtJD1mkWKwAiRheRlBIkAPoeOfj74P/ncX37aeiMDKv8iFy9CgvQ3KXGx7UJDeYmc2aOLDEpPB9iTEIKrk3OGkEYAAmIW7fJN+Q8NCw1oakpZP9wPa317UzHbAXrTzxK64pi+/J1QGg1t7exaZkISddcoAZ7p360L1IUPEbPsOe+TSw7K9w=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6666004)(426003)(2906002)(336012)(2616005)(316002)(44832011)(5660300002)(7696005)(110136005)(1076003)(54906003)(36756003)(36860700001)(82310400003)(6636002)(508600001)(47076005)(86362001)(8936002)(26005)(16526019)(81166007)(356005)(70206006)(186003)(4326008)(8676002)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 16:04:19.5793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e097ad86-5b58-444a-928a-08d9931a1bf6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3467
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

commit ddfd9dcf270c ("ACPI: PM: Add acpi_[un]register_wakeup_handler()")
added new functions for drivers to use during the s2idle wakeup path, but
didn't add stubs for when CONFIG_ACPI wasn't set.

Add those stubs in for other drivers to be able to use.

Fixes: ddfd9dcf270c ("ACPI: PM: Add acpi_[un]register_wakeup_handler()")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 include/linux/acpi.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 72e4f7fd268c..b31bcc0f4c89 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -976,6 +976,14 @@ static inline int acpi_get_local_address(acpi_handle handle, u32 *addr)
 	return -ENODEV;
 }
 
+static inline int acpi_register_wakeup_handler(
+	int wake_irq, bool (*wakeup)(void *context), void *context)
+{
+	return -EINVAL;
+}
+static inline void acpi_unregister_wakeup_handler(
+	bool (*wakeup)(void *context), void *context) { }
+
 #endif	/* !CONFIG_ACPI */
 
 #ifdef CONFIG_ACPI_HOTPLUG_IOAPIC
-- 
2.25.1

