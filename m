Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E2541E4EF
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 01:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350743AbhI3X2j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 19:28:39 -0400
Received: from mail-dm3nam07on2067.outbound.protection.outlook.com ([40.107.95.67]:19680
        "EHLO NAM02-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1350178AbhI3X20 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Sep 2021 19:28:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrUtvuRkI9qu2tOcgiL4/+F5IIye7zbv0BPN5oYQ9Uow6eek8SCD+z8RcSUjXQWJta/ueCoyUQR+tvR8UuTi6YnON44tPla9suN2gTpCJdfLmfsxtl5URYhOvkEnK5BxHJ5QB1dWa0idKd9XsAY66EvsflwB25u6MuBMqPpeUSj/O8hCJCJivEH8+smZdtYEF0nuJW4was9THGl2438HoReXcI9+m0HJQAQjEWj3/RgxSjgyVpO0YZum925+zbo3gvDTHsPcSJmDiKHKZ3i8Yae0kU+HUBDkhOmcTw0Z7+EAcz861gzt+d6bICseSJZCH3G7Bz3D6YeHQnocXBJA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+QUMly0wgQmi3zZsX6Jm0toUKr6OBDIik4TO+aYfsE=;
 b=TuT0BSVKfNleqIFESyS1ADpQ8Ab3US5eWNVbFt0sKR/le1FEtYs6HXeJHENBGZrEehMgBhCN6BD5yvDW5mBtM1RIbBmGF87zxmONChyKMRL/xL607UHdtRIJYFmqCqcDq6ibLjGCk8dZdrs1OoA4+rFFOOsLzR5qeXH1rPnayVxFweD3GgQp2aAWnVUZIsg5ZR9KblKAEypUap1YxwNXCCRmgNfoSG6VZ/ZOmuy/64vitYKNnTieBzSg8O4AC8hTonoBcUvJo5Bxpz5u1PaC54rb8i2M8LSoM9iQoRFj22JXBkPndYLQZwhSyI6i5enbR/GWme5t8Sp5J2XdIa+tew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+QUMly0wgQmi3zZsX6Jm0toUKr6OBDIik4TO+aYfsE=;
 b=Fx+z9i7Nhv+YudwjKA0Yhzcr0JrfiNvQlM9l0Exfmb5265oQKvKaSupLxYf6g2p1IMtPGLiDLJoXEMxR2NcmekktGwZNH6812MKi2t9pia1g5iHkG08Ll7DRpyuuQGbT8VtasnXpvpKG50q+jUA+b6q7yuXleCzpj6F4R6PyjJppV/P3GPI+hltIvkwCxwo290PE94ExOVbL+5SBgddnqx034LJ3o3R73pTLe4QTQZmCgBVZwX78/LodVW77Jj/q74z4g0t1qdNBL0owTWCT1MqTPADC8d00Mdp8ejcoAWnhcOO0+YAXMwpdaETk/e9mercYDbKBa85+ebzaDTEEIA==
Received: from DM5PR21CA0045.namprd21.prod.outlook.com (2603:10b6:3:ed::31) by
 DM6PR12MB3595.namprd12.prod.outlook.com (2603:10b6:5:118::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.18; Thu, 30 Sep 2021 23:26:41 +0000
Received: from DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ed:cafe::e0) by DM5PR21CA0045.outlook.office365.com
 (2603:10b6:3:ed::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.2 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT056.mail.protection.outlook.com (10.13.173.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 23:26:40 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 30 Sep
 2021 16:26:40 -0700
Received: from dipenp.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 30 Sep 2021 23:26:40 +0000
From:   Dipen Patel <dipenp@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <warthog618@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <robh+dt@kernel.org>
CC:     Dipen Patel <dipenp@nvidia.com>
Subject: [RFC v2 09/11] tools: gpio: Add new hardware clock type
Date:   Thu, 30 Sep 2021 16:26:15 -0700
Message-ID: <20210930232617.6396-10-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930232617.6396-1-dipenp@nvidia.com>
References: <20210930232617.6396-1-dipenp@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48d3e992-0c99-4857-7283-08d98469c1c4
X-MS-TrafficTypeDiagnostic: DM6PR12MB3595:
X-Microsoft-Antispam-PRVS: <DM6PR12MB359562627FE0A129F5F983D1AEAA9@DM6PR12MB3595.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zq0Gozke1izXO/aAG6dEW6vVJXWCprqUITSHYpH5WPzdLGSVIZFmsv22dcgePb9ouiL/Ma08FrLD9eYSlWU6uZnE8yYzWF96uu7plQWVaG0kJGb9LFp08rc+6swHu4+2kLClGf+8lI4OfnlFNjAiDL1+tHpDW6M+IhKNxVaaK8USAXJkwCr68W9Yz8hnchT3hqDJyeiqAxe0kq2+c5RGG/CKSLfFwx+GSHkr/K5UrW1CcRcGH09roSZ2FMiljTYMwIqXoVEiH+sELogdE/097cPgi9ja9sxsOrdLhYwZvrXDZYPTuHOsNFQkipi4GG/ceedYypdZutCYqvXWX85cBKC1eKtZvK6cs97Z8FbwT6qVI5eePVvKMPzPhkdTyctus9C8cCp5yj1O3DjGtQ2nkuMRwIg3Pe4gA1xRtIPT2PDCfLnAicWsGdbwVxlxk4pxLXQ0hRdAPsC2wkvHVHoO/qapYDEe3kA7in76A0OojFXiEEvrVsAbHDN0nJiHqv9stSWTBWuZMYPFeUL98iWqhF8CcpAGjLbRj+otGZzfWdL7Ufw0BnAgw1P3ZErPWSP+Lwm9/2y6FMDuZIh46kdxd9T6Ce9e98fXjePIoVBZ8wjS6AOgUhr2ZqX6f6Cl5yIRP78OQPPu1G2lHtSTBajq4+9WPwMLYwPo7hEkBuSF7SI5OIdahOidUh8gnj7Njy58fQJLGjUJYoUxRtZBFnIVlxacTfOUznMtxy2J6yEYqaGINGx5V0KvodCwTCfv7hKIfuJOA+mw+HToxVouPaL/ig==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2616005)(86362001)(426003)(70206006)(82310400003)(508600001)(47076005)(7416002)(8676002)(1076003)(2906002)(336012)(107886003)(26005)(186003)(70586007)(4326008)(110136005)(36756003)(921005)(8936002)(5660300002)(83380400001)(356005)(6666004)(7696005)(36860700001)(316002)(7636003)(83996005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 23:26:40.5822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d3e992-0c99-4857-7283-08d98469c1c4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3595
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpiolib-cdev is extended to support hardware clock type, this
patch reflects that fact.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>
---
 tools/gpio/gpio-event-mon.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index a2b233fdb572..bed52333698d 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -149,6 +149,7 @@ void print_usage(void)
 		"  -r         Listen for rising edges\n"
 		"  -f         Listen for falling edges\n"
 		"  -w         Report the wall-clock time for events\n"
+		"  -t         Report the hardware timestamp for events\n"
 		"  -b <n>     Debounce the line with period n microseconds\n"
 		" [-c <n>]    Do <n> loops (optional, infinite loop if not stated)\n"
 		"  -?         This helptext\n"
@@ -174,7 +175,7 @@ int main(int argc, char **argv)
 
 	memset(&config, 0, sizeof(config));
 	config.flags = GPIO_V2_LINE_FLAG_INPUT;
-	while ((c = getopt(argc, argv, "c:n:o:b:dsrfw?")) != -1) {
+	while ((c = getopt(argc, argv, "c:n:o:b:dsrfwt?")) != -1) {
 		switch (c) {
 		case 'c':
 			loops = strtoul(optarg, NULL, 10);
@@ -208,6 +209,9 @@ int main(int argc, char **argv)
 		case 'w':
 			config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_REALTIME;
 			break;
+		case 't':
+			config.flags |= GPIO_V2_LINE_FLAG_EVENT_CLOCK_HARDWARE;
+			break;
 		case '?':
 			print_usage();
 			return -1;
-- 
2.17.1

