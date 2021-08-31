Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC6A3FC21F
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 07:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233873AbhHaF3z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 01:29:55 -0400
Received: from mail-bn8nam12on2063.outbound.protection.outlook.com ([40.107.237.63]:2400
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229526AbhHaF3x (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 31 Aug 2021 01:29:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpI1vtGxCGfFVTjAYZQ/PoHb9zXrNEZed6yjCb+gOuc/zX+7KGb+UK/RDXVVr+mtLvSDjyNg3zEru2MtcYOh8i4bu3Dh17exujg1WS+fKn/8Qh0/2yxU40iRGBFe4jW9S6Olo/kIldw9pLhFlkmjU76GGONFu0wvXajZSy/7vDvS9vpi5YOlzc+VhaD71TyOT/k3DOOs5znMYgxaW/DQMmX2crNdH68+hVnLqDBrMcmfc8i6KTLa3lSRJyDZFnCdrishw6cWFHE07pfhUve0YTysynP2ENgGs8YF060Ga9WY7aBE0rihqndpDg0lGWMcJBUD+PBolZPPXK738zFruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M75efZuaRpOGftCoZlLD1i8lz6Itdfkg5OKhT0KWOZk=;
 b=aw13L2khehWhOqE84wz9MHNHNc3gq/H0mEM+1oizEW+K48NqhAxrZz8B55RY2VHpMbYTb+lt34O2XcNLXLAGls88y8/w2keRv+Pjd1Cabxivom1vQHFVJfXjQpCX8xFNBElXGFFeXwPbr/hXJbNlD0TOPuvkc2BXzwh/O7E8JUHwypjycA75hY3TWRr4mVYTEKdWRf5+IegM9JxfZ7h6GBPazM1YDYPOigUT6VTBYMOOShbwOFbuhgT5I0F5XmGmBscUQAs+pcyyMBo+AxQ9zdAtPs7Bg4yeu1ICOuIVobN56hJtBLqGjqiDbYKWyS02qS8qLJwb/d/NZq7wjDdx+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M75efZuaRpOGftCoZlLD1i8lz6Itdfkg5OKhT0KWOZk=;
 b=OeQ3m5KewSRy6fzhBYeDyZZrSOnS/ap1xzx99MQ+6KszCay+ZgGFboqjgAirI5orsqBloQctUbrWwF4xqaSlT6ANWRZE5/QznOmsf/pqlBwd+assYbuvvQuCe8XbONY3Q7X1Wcb3lTP21WkxaeejtTecqJ/tn0HkxgM1X3kHPFKAuqq+rcjWOt1VAqq7oUabjIHwQ5s7Ue+TOXz7hw2f5XdhT5YEiXBsA8B+qSFwkj/cK468HyEFXGjBy3bqFGBpR6RgAN015Jr44ztSGBdhtJDs5GFBbWP0MqwHKjIpRV3L0HABGgZqxNFE0i0kKIvJorR1RnJODpUPls0IuiaNKg==
Received: from DM5PR06CA0061.namprd06.prod.outlook.com (2603:10b6:3:37::23) by
 MN2PR12MB3648.namprd12.prod.outlook.com (2603:10b6:208:c1::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.24; Tue, 31 Aug 2021 05:28:56 +0000
Received: from DM6NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:37:cafe::53) by DM5PR06CA0061.outlook.office365.com
 (2603:10b6:3:37::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Tue, 31 Aug 2021 05:28:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT008.mail.protection.outlook.com (10.13.172.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 05:28:56 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Aug
 2021 05:28:54 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Aug
 2021 05:28:52 +0000
Received: from pshete-ubuntu.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 Aug 2021 05:28:49 +0000
From:   Prathamesh Shete <pshete@nvidia.com>
To:     <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <ldewangan@nvidia.com>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     <smangipudi@nvidia.com>, <pshete@nvidia.com>
Subject: [PATCH 0/2] pinctrl: support to save and restore GPIO conf.
Date:   Tue, 31 Aug 2021 10:58:32 +0530
Message-ID: <20210831052834.4136-1-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d858a876-435e-40a6-c160-08d96c403aaa
X-MS-TrafficTypeDiagnostic: MN2PR12MB3648:
X-Microsoft-Antispam-PRVS: <MN2PR12MB36489A06DB61E254625D3B47B7CC9@MN2PR12MB3648.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aXPbZNRO6cTkB0pkSHWczj6C1ekeu+jZ985bYI07vO+g4OC/oUxjxkf6J3IZBuGRAZxt4Hl/90kyYq4QfiSKh8wuTG62dD6iJ8Y62frK9JKvhl6FtZ1QCybE2YRC3bpvrBXWJuhUtk5wo2C4/ZKTETF9uVXpupS6EJW4YpwGlLesNeDEZSbXe8+God7kbtohHW4dwsBVgkJmO+13MWPkCmasUmoGkhXgU+w7epaEyMw8ew6ViMoVwKg3/JjI8ZecuV9lUIcneHa4xwrwvDqPJx04q1ziDwGxIK/aTSoQlR2RU1NK+nf0f4U+MDlfHAiIxbi6FZWuPPdetkxDoGr6aY0/8xOl+Ve6tuNp2LhQRggQjGj+ntWDmBF6oMPS9vfM9zKvs6dZE0cMBnfk2LhoNFZXS7vHFPR9Oc6wOFEaiVLsoirvgH5MGC2xN0zjIbzRlcCopvIEEGQjBqT6AY9wWmGOK+e46tMlcDHoziaD0FOluzf5szH4e/udALM0hv4ex6UOF85gMia3Va/JwRleWGcx7fPABmxcOwnawYCS/ueEzE0RA765vcIbrqZoBVlhyilWQ3hKHfJI6x71xVGOZrWE6oBbyXIJTfbvZj758FiPJ4fvBhNWlMEHsIkN4Kr5eC3YtdVev3DaDFarZn/d+DrKguRO9j4+/MXriE0yOqe7ivFqfhXsGlLwDXQSemR/SCgrL5XmOcumLkJ8l1syZHw1zghy67PMOvhvzwwaHC4=
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(7636003)(110136005)(5660300002)(54906003)(7696005)(508600001)(70586007)(8676002)(86362001)(4744005)(316002)(82310400003)(36906005)(356005)(70206006)(36756003)(47076005)(6666004)(8936002)(4326008)(2906002)(26005)(2616005)(83380400001)(426003)(107886003)(186003)(36860700001)(336012)(1076003)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 05:28:56.6362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d858a876-435e-40a6-c160-08d96c403aaa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3648
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: pshete <pshete@nvidia.com>

This change adds support to save and restore GPIO configurations

Laxman Dewangan (2):
  pinctrl: pimux: Add support to save and restore HW register
  pinctrl: tegra: Implement pinmux register save and restore

 drivers/pinctrl/pinmux.c              | 24 ++++++++++
 drivers/pinctrl/pinmux.h              | 18 ++++++++
 drivers/pinctrl/tegra/pinctrl-tegra.c | 66 +++++++++++++++++++++++++++
 drivers/pinctrl/tegra/pinctrl-tegra.h |  1 +
 include/linux/pinctrl/pinmux.h        |  9 ++++
 5 files changed, 118 insertions(+)

-- 
2.17.1

