Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6974402464
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 09:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhIGHdw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 03:33:52 -0400
Received: from mail-mw2nam12on2047.outbound.protection.outlook.com ([40.107.244.47]:3392
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232056AbhIGHdv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Sep 2021 03:33:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irA25gZ+Bi4LA5ojOLfG4iflfuqIaIjBFtylJIqnrfv9OK+DrpeNp8hlygjM4fAmfMB3yebEvVsnrcRnOyZSmusAXeSskZu/8YLlNVbTqicdsvm73bESp5qPaAPjeX+szw+GfXqb9FeaREwi59forrDYEMmKOXydMRMxowFhG1O7LLEWWy/x5FcOR0GfDyr6rH8z8FipFeNBORWwnS7tmroZ9s1ZakxtRdiLI2+RVaZfBTy0iCapXHyUeV9s7PMM0ZcVaH1S9qfSp1f/+RERcvSRQ1+A4Jo4a7quFNMd95Gyz/aqba67oDjE9c6Ei2Wl0zV/ESAcVAnVooXVfstvNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Kr64PJWVuq+i6M51qQ4AbuX6fhTLqzcd52KDE2X/dnc=;
 b=kaEhcl+HajyvsNxUGk4fOqGDRcAyUXLUyExZAFc6L43GQWsCVX7TTrD35A1pLHIO+O14i1pRmjaXTRww3/6QilUUYr6UUV5rMXxyQ2FIqupdlziGuFu5d+u/2UqX+3PSOt0Lq+HKSb6xmkoofXH5u2XSp4AF2EMqok/xD0tjGcC1FJBGmzuv2w4WS/Rn9iYKbM05EWWc9rT0Mg/v9zPaAxYgtmoAMvO8FCUgQkU/NBnVfawEIiZhjcihWOvE4iPaWy6Nf4GDMGKe5HBvhbHkgsFi32utdMlePQNPghsJjsNA8N+WoepS+h/1oqOVIFq9gzEKwCFBhE/qdmWWyFKQdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=baylibre.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kr64PJWVuq+i6M51qQ4AbuX6fhTLqzcd52KDE2X/dnc=;
 b=ru0V0rj6A+0o8iaeqgUwOFXPDRrvu3xBCeEhMBz1VJG+kNNI5/lSNx83P+HYKREvC2l2NOdTrk7uZ2S/OH14m6WBgbcvBRnEprjwikCpgHohTvpPRwuUEV5vRHLcZRWot9OSj+VuTwDhmmZR0/uL89E7XRFcQ2Yd62g4BfL8y6oroebXiflekpFUpJcvQIEvimEX3PBHzmcwePgW3POYOplxG102wmBCTLAUaf0PgI/SY6b2/WRuza0pbfXIjJcFakT84I6S4H8cxcpLEqPcbIenzaHIR6/u8bwoLLo6C3rLhWiSbhDD59szTJpiVWpk2VRHZPNidyoEXLhHoxeM6g==
Received: from DM5PR07CA0056.namprd07.prod.outlook.com (2603:10b6:4:ad::21) by
 DM6PR12MB3420.namprd12.prod.outlook.com (2603:10b6:5:3a::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.24; Tue, 7 Sep 2021 07:32:44 +0000
Received: from DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::8f) by DM5PR07CA0056.outlook.office365.com
 (2603:10b6:4:ad::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.25 via Frontend
 Transport; Tue, 7 Sep 2021 07:32:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT048.mail.protection.outlook.com (10.13.173.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 07:32:44 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 7 Sep
 2021 07:32:44 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 7 Sep
 2021 07:32:43 +0000
Received: from pshete-ubuntu.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 7 Sep 2021 07:32:41 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH v3 0/2] gpio: tegra: add multiple interrupt support
Date:   Tue, 7 Sep 2021 13:02:22 +0530
Message-ID: <20210907073224.3070-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <YTWeSJ7jGamxx9Uu@orome.fritz.box>
References: <YTWeSJ7jGamxx9Uu@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ebbc245-d811-40f6-d3c2-08d971d1aef1
X-MS-TrafficTypeDiagnostic: DM6PR12MB3420:
X-Microsoft-Antispam-PRVS: <DM6PR12MB34204A045C9B228EDD51FE1EB7D39@DM6PR12MB3420.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YmFCh+ze7ArEKSwMI/TVWwLQ+Rus8WNHfYI9tGf2fExIf44WqOqKjWkhNy4u8IBNYX2Swld0Lh5lBNzFEZjOBUQk+XoDB79VkwJqCnctxzXfTp7fn9Oca35p5QFsd+gUJUJb7x9BJxXG8D7hzU5J+XijyAdZx6G9k+HoGO4oIahOCRoz7jm1Jb7x6/go5PhpNqZ/WX9iqzZVcqWW/uHWKxyo5JGeEgk4wgYT7t9GoBLrpNPEAWXfn9Kdd+WatlgeRp6p2PfNdZzprdmNDtRudXiiLy4aXvRuih2aQ4b4m9fFhsPWhHv1oqc189kpN0HtaTTT3Wt+90RBHenpJf5W9ZhU0cOfrFwHspwg/CLtlPc5zsIwOgozr1xbzNNR3pA6aZenUG2I28NUktbfc1HqyxuTS64deiwULSqHkTdi//m6UX0tx7VhOxKbV+ghMg8tirCPbpRNk/RdbjrRQmgS9ORN6bJOUAuMimg94EznFAXSFXudEaPW5juJKaJK1mU6aAWOnz/dhguGLa5AyS3U5HnA4jefTC+Ufj03TUupl4DrmKXLjwZoBGgRrfqlFVpjHRXOJGGSUrj/Xxy12gzEfZ5e8c77ZGjxg693+LaipcYbr1dEIRix3NujjIX8XpyO5XeAaVhUxJ9KhuuJO+tdTdRVNWNm84PttYtL93ihEapiVmh6GLaPEMZNgwpCvzshWFInshObzaztu+/zNWGZww==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966006)(36840700001)(7636003)(2616005)(356005)(8936002)(26005)(4326008)(47076005)(336012)(82310400003)(83380400001)(7696005)(107886003)(426003)(8676002)(86362001)(186003)(5660300002)(6666004)(1076003)(54906003)(110136005)(4744005)(36906005)(316002)(36756003)(478600001)(2906002)(70206006)(82740400003)(36860700001)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 07:32:44.5634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ebbc245-d811-40f6-d3c2-08d971d1aef1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3420
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: pshete <pshete@nvidia.com>

These patches adds multiple interrupt support.
Each main GPIO is associated with 8 interrupts per controller in case of NON-AON GPIO's and
4 interrupts per controller in AON GPIO.
This is new feature starting Tegra194
The interrupt route map determines which interrupt line is to be used.


pshete (2):
  gpio: tegra: add multiple interrupt support
  arm64: tegra: GPIO Interrupt entries

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 49 +++++++++++++++++++++++-
 drivers/gpio/gpio-tegra186.c             | 27 ++++++++++---
 2 files changed, 69 insertions(+), 7 deletions(-)

-- 
2.17.1

