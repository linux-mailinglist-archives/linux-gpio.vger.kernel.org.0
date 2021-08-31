Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 718873FC70B
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 14:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241629AbhHaMH7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 08:07:59 -0400
Received: from mail-bn8nam12on2058.outbound.protection.outlook.com ([40.107.237.58]:7969
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238208AbhHaMHd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Aug 2021 08:07:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXPPVxgopRnpWkv7zj9vrcvAZXpXEi8gvx13pxPRQd+hn9CG6k84Mp5hMyxGYA4N57D1NtQi10jRHpwWW30j7lC0uExB4TzkRRT5XPLXeB6+2X2YpbhMPqEbaFBEMGBoLKX8STWHN5LdN9s5I/MExHbX1wuI74+Hj+GSnJ+b8Q6S5Ems+IURGOa/7oO4ctW5OHdoGzHCqOib2+nRPxxGIpZre/G7c87+yfvjPrsCbb/ajRoP//ESNQH1wvnz2XDOtFoj3vvKd8cAdhtbHh1zouv0MxtjyK+Zf4TvSbnV1ACWy/z3hfhy1OX6j0xOKqCVI0aoUC1JRpfIyRKNsKv7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzcTVJ6lXdtiOcI/Yu8kiduSsdKizV714jk+WJqpu6c=;
 b=nhtBAzu9XsMqOIYMQbEiyfHEwE6oCxU8njqXiqrtS35gzEtVSdEVC025K/hyUSyBmjTdRYaHxM8ZgDdHaQEKlCXLNoyZCHG9ahp0i0Lz+Rg/1jk0jIgc2tdVWmpv1cyOe/3LK2QC+ukK8aK+gFvcwmd266Wfj1Ky0Ow8WekmHc89ZUQCYmngFIzz7+AEURHSfgGmAMQqPZyd7uqjtUFgB9Qbk1P5kYKhjYbPBmxx47tqiDXgGcLggdGvzoPubmKVVkzIf/Yo9NqZRzWsc/wm8Ty0J4VOEp2WTd6Oe6idnnnPbR2UYtsv2GIT0FNWt6lqEW+MBbT9wl15Cxxmhu/Qiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzcTVJ6lXdtiOcI/Yu8kiduSsdKizV714jk+WJqpu6c=;
 b=qUUwdFwGh8wtUqMwJQ4rZlwIP4AW65UGVkpPGLkjOpQdUhcf09WMjXvaHoOztNhIW88T0HZUIQT+twKv7phoR21KHMrWI0gWfuqsMgG4C/vHg7KvGpRBs0pVQ7ybgFSgYq5ty9gm9L98KGVq23EpfcONgI3pLWktK3j+z5WRMME=
Received: from BN9PR03CA0267.namprd03.prod.outlook.com (2603:10b6:408:ff::32)
 by BN8PR12MB3473.namprd12.prod.outlook.com (2603:10b6:408:65::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 12:06:31 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::da) by BN9PR03CA0267.outlook.office365.com
 (2603:10b6:408:ff::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Tue, 31 Aug 2021 12:06:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 12:06:30 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 31 Aug
 2021 07:06:29 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <Shyam-sundar.S-k@amd.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/2] Add irq PM wakeup 
Date:   Tue, 31 Aug 2021 17:36:11 +0530
Message-ID: <20210831120613.1514899-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4068f634-bf07-4feb-36e2-08d96c77c4e5
X-MS-TrafficTypeDiagnostic: BN8PR12MB3473:
X-Microsoft-Antispam-PRVS: <BN8PR12MB347336E95BFD9B5B3748EB15E6CC9@BN8PR12MB3473.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tCjM70KGwRFGnCxjm6MlsncGyfb6te+4MSitocA8yPpJTksvTIwBGjDu+8zo3XpVAu4Zy4iy2r7FRoDnIFSRfDmgiJp5XLxi78mEmkHL2P2gwgllEnNq3aeYdzb7KaolmAmte6DBIkMYzYcoFSkLPcM5yMaxQbxKv5cGldTj4g2AijoZshUNxTXQsB5BZx3o9LjO7vvMQk8hnPYkA5L93mKjdEpFo8zVD3tqDKW3LKWVMjZy5rDK3ZGK8JFsIj7XHM6FioBQFPY/jsL9vhXHzTuNKNtXUx2DDiz+FshHoKthjvch40JVA87bn9p4gbKDunpbYWncuNtF4qrEF5dMZiV+37yLRH/7K5veCe62G59AqVIDPw6FNQQcHYHOoM1a61Ka7J5hq7ux2fVu55vnxnx5+gNAe1W1T9lWIfZ7IgvJO4Upbb11zBgoJ0jUiIuNrH5mdFB2BYy6Yo7Va0/e3/9/nKyCqiNDU4tgzVZJRwhup3uGMOrh/9WGjKy3826rLO773LeIpsBiRdOTSVE14YhK/8tXP4U5hGe/YI/Gxx7f41fOlvIGQkARn2FWBbhOoaqLXAjb+VLjYSRo6L7mcmoQRHLJcXjDrb351RmoXjFfedmhWsjT+Q8x6op5YcsGb0G7HDp0huwBh1NrQ8nUPe5eFlOcDHEcj/V2efSoUrOd2tOP0u4TcaH6oOJKNa8pxSsh35WObjhgHmBQFIp8Tf/CovvTDj0FThnemwrAuycEd2Xn95TiSr4yoppF3lSF
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(36840700001)(46966006)(36860700001)(47076005)(81166007)(4743002)(82740400003)(16526019)(86362001)(356005)(186003)(426003)(336012)(70206006)(4744005)(70586007)(26005)(478600001)(5660300002)(316002)(8936002)(6636002)(4326008)(82310400003)(6666004)(36756003)(2906002)(1076003)(7696005)(2616005)(83380400001)(110136005)(8676002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 12:06:30.8910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4068f634-bf07-4feb-36e2-08d96c77c4e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3473
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changes include to handle IRQ wakeup mode wake the system from sleep
states like "suspend to RAM".

Basavaraj Natikar (2):
  pinctrl: amd: Add irq field data
  pinctrl: amd: Handle wake-up interrupt

 drivers/pinctrl/pinctrl-amd.c | 19 ++++++++++++++-----
 drivers/pinctrl/pinctrl-amd.h |  1 +
 2 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.25.1

