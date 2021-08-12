Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562343EA419
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 13:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237090AbhHLLyO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 07:54:14 -0400
Received: from mail-sn1anam02on2068.outbound.protection.outlook.com ([40.107.96.68]:46011
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237087AbhHLLyN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Aug 2021 07:54:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irDv4w+dsCA6FusSsnJFR09V28Xz11MNVafj+7Sid9HWRkMHJejNFOkP/wEwKgsLRjSE+0HrQa2KZ31WXjrP47u6kREHeP8qfJSmvvOLHVSynbAET2yhvPikgiEoTVvBUA3Ny8XuF3zBckuWCkyAywSnCiFgQLKFfQwVOiicD8eApmwyCMsft/PBPs921ht6/JW6mzSOg6NhQkMNz/pJ5LvUq4/1RjdHDzAajMhH/O63pJ0ng+2TQ+1gylCLtUzsSGt0IIAzjj8MrH+Z9uiRYnNXDBVHGPR1p/Po0riMFE6ZMXuo6dHEy+0JoKftBIrIMtsS8yOYAHWaXECLKlx8vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHHV+ZoTFo0Cv50eGX0ZEX9gQCcgKp+rKUdibdE4/M0=;
 b=SKM8jl7J0RYlnQnsq4l3+hhBA2LNPsnaFLJAPPTTupqdrjuxRUo3zNGxhHuAeujm7AkF9U2kTNLTqRJkLLEcheusy1VsWbaErtiA2YLcBIU0tIIVtHzaAgFjfzl55dTWIMhCvk+Ks+Pz0NLGoj9iFtGhlx3MajzZpOr6SFrgXzoXvePNmC82M7A72cg/PZ88lPs2s1PCO9+MpVUzBsYC2n9mEBYjUoiiRPiVdSk8juSIPb3N7fF+migSOkwXbGKHCuE5SgoQPxPZcsUL157r14HevS1XrLXxl8EMoWlVuVkFM+cniLFGoaC6Z5+by9xmsz2ntsU8LOtqN2gLbBehWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHHV+ZoTFo0Cv50eGX0ZEX9gQCcgKp+rKUdibdE4/M0=;
 b=qOEMQuk5X/biS80e5hNfiyfEuWNmjeYYkJnP69FYC+0zDaHz6T4ujQTpPSXKxRlGJaXlQHGZvxrk6IKOfa1xIapKt22mFOF5nwJeRpwAOTZ3a7ybpCPAVjw2+z18yhLY1G3nXVnS1ABMxLUAKLyQ+hmDZiBeDuNfKNmpd5jPmGU=
Received: from DM6PR21CA0018.namprd21.prod.outlook.com (2603:10b6:5:174::28)
 by MWHPR12MB1167.namprd12.prod.outlook.com (2603:10b6:300:8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 12 Aug
 2021 11:53:46 +0000
Received: from DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::1f) by DM6PR21CA0018.outlook.office365.com
 (2603:10b6:5:174::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.4 via Frontend
 Transport; Thu, 12 Aug 2021 11:53:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT048.mail.protection.outlook.com (10.13.173.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Thu, 12 Aug 2021 11:53:45 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 12 Aug
 2021 06:53:43 -0500
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: Add maintainers for amd-pinctrl driver
Date:   Thu, 12 Aug 2021 17:23:22 +0530
Message-ID: <20210812115322.765379-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7392e4d1-7a71-4805-d19a-08d95d87d71b
X-MS-TrafficTypeDiagnostic: MWHPR12MB1167:
X-Microsoft-Antispam-PRVS: <MWHPR12MB11670E59CF3DE8AE5A4FA6DF9AF99@MWHPR12MB1167.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0zhLkdAPgviNhm7yNJshWfvOM81CbZpXjj7+uWb7/6qks8b3kYqLuw6AuJQsTf3HJ8NbTO9bJxV3mogkMWPOgkVC7sqPbvw6OAdu2VqctuqihGAR89ayGHoMXLp/RZc6VHeNQqCe3C00Hb4xn9bcYw02xSEW7/iKtobBoNZgDMx93SX7Ga3PgHCaAUoEHFFrJ/QA7l9TWyjtsv2OQz7SrhlbKXnuBJ0S5qLrLIQOp5SzXzxHTjEIEGtueOvVcDP7YoEcVWPn4wKl1seez2QdBLi5WFDcIh9j1O2TkoNfSybvIlO+vNAp+1IV+saKySTkQhqbRUGW8WlKM3OgRdGVh+ojdEBlw2n+lFZDr+sf5CXBbF3NtHah4Bxp9UZLFzC6iXuQO29DQI+nABJTCBtaMniVbftDpGGryJylrPcUurClWu0tkQUJ9BdDIqD8vm9IpgyxR4+Q+vs3G3M8XXOteigkb6iAi7siSQjMNrIWzyHLXBIiROJC0B+8qAJT2y3L110iqouRlR2e0SOyhd+Fr+Jw/vUPpw363tUHFURDl5acW3a90vLyhFUdFVHkOqJ7ywdGi6sQ/4y2m20GMxIjrhJlWfMw04sJvGLeidAfYCuqoTp0lPCC69mUDx23faixb9cwLkcZ4nmD9AmD04Ac6puytphAeZfeLMLNo8G7rpu6z2px/NK5SDbRpyVKbVQA/TkcpGEHRGPwUgQfFs6d8YSBTF2fYyIax7ioK5aj5o50tyK/Kch401VaobsxcBS1pFfoKJmQLWrFp0csgbd5cw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(36840700001)(46966006)(36756003)(86362001)(81166007)(110136005)(316002)(82740400003)(1076003)(47076005)(6666004)(82310400003)(356005)(4744005)(8676002)(34020700004)(4326008)(36860700001)(2616005)(8936002)(70206006)(7696005)(426003)(2906002)(478600001)(26005)(70586007)(16526019)(186003)(5660300002)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 11:53:45.9489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7392e4d1-7a71-4805-d19a-08d95d87d71b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1167
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Adding Basavaraj and myself to the maintainers list for amd-pinctrl
driver.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bbaecde94aa0..8a8bb5c32719 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14625,6 +14625,12 @@ F:	Documentation/driver-api/pin-control.rst
 F:	drivers/pinctrl/
 F:	include/linux/pinctrl/
 
+PIN CONTROLLER - AMD
+M:	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+S:	Maintained
+F:	drivers/pinctrl/pinctrl-amd.c
+
 PIN CONTROLLER - FREESCALE
 M:	Dong Aisheng <aisheng.dong@nxp.com>
 M:	Fabio Estevam <festevam@gmail.com>
-- 
2.25.1

