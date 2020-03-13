Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB4D183FAC
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 04:34:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgCMDd7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 23:33:59 -0400
Received: from mail-eopbgr70041.outbound.protection.outlook.com ([40.107.7.41]:10052
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726254AbgCMDd6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Mar 2020 23:33:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQeVSZF1F1NT/7iBP1LKupVTYGtDvJwyHtQFoY3Y26hKl870Bi0b5ieFyvmu/e2ZjHgqE9Bmlo9pUQEHaLDgJjHsAQ9mUiUhQsYCqBwNak7fkw2J/MCf9Di8Ohp791FQ0wyrHqRqGPGLU550iRCzB5PSTcOES4Mf72Y0M/ERGSPgzMu81jOinLkTURiNLHR+ZVCaaljxjuJK9KOheAWtuwyHIIsaJLRb/w6rutu0uX3uwebmNzoDWcZk3r5P9m7Og8Y1Cbon4KCC4zaMoybm9t7vB6+mzvVb8YKiWvOsTpber2johcx9e1EEHIf4YoSDSqcI2IP7wISzz3TGX3Y2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESkbsp3iQ8ftsnrvkaXmzzB/wsyf0tNFrkz77dQOMek=;
 b=Uu6+2MTK1WhDmNW1gXEg+6vnV7dhWcer69pvK/mAzpPLPc1y8/I3+B06N9MH+1G3ktM5cQiZHKQ3IYgRIBQsYonXvg93/9B97GNpQ09W7CjdmASAO+b/3fHr7WpVGzriX7BFhmJvOSvsdkUYGwD+eq9JSPRAC3FZBxnp+5yoRx8BSoXQiZd88rzeEGYcOYgiTutJEnRFM4pjQrR8Jb9Czmv7PApIpsgwpW0fX6o5u+4+smVGAhNJYrdN/6qAyYKSaufH2c3AROhjpajiFlzSDjcNkbq7e3XOiRG+XYlAUOe72becPeWN+dmR0v+gpMJmqVQ4cB6nd9fbxWnTiJBI7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESkbsp3iQ8ftsnrvkaXmzzB/wsyf0tNFrkz77dQOMek=;
 b=TN4a6n7A5UQgj7Kn2x3ZhmWU7nuWD4w+6bUgUm7zhzBXuZiaU8BD+w4OEZkzctPC5qBpGhfTyPgHgFx11Xn/h0qNgbMtBy4TXqZAsLnL24Zu0f+/o4wn5XbbZ+kBTX+SioX5UKT37qabhQea6BM6xGvPKuHbCN+iKMgHTSVDbXk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB4979.eurprd04.prod.outlook.com (20.177.40.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Fri, 13 Mar 2020 03:33:54 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::548f:4941:d4eb:4c11]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::548f:4941:d4eb:4c11%6]) with mapi id 15.20.2793.018; Fri, 13 Mar 2020
 03:33:54 +0000
From:   peng.fan@nxp.com
To:     shawnguo@kernel.org, sboyd@kernel.org, s.hauer@pengutronix.de,
        linus.walleij@linaro.org, arnd@arndb.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        aisheng.dong@nxp.com, stefan@agner.ch, Anson.Huang@nxp.com,
        abel.vesa@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/3] imx: drop dependency on ARM64
Date:   Fri, 13 Mar 2020 11:27:13 +0800
Message-Id: <1584070036-26447-1-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0178.apcprd06.prod.outlook.com
 (2603:1096:1:1e::32) To AM0PR04MB4481.eurprd04.prod.outlook.com
 (2603:10a6:208:70::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0178.apcprd06.prod.outlook.com (2603:1096:1:1e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2793.16 via Frontend Transport; Fri, 13 Mar 2020 03:33:49 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 31c984c1-8f8e-46fe-fc57-08d7c6ff5b1c
X-MS-TrafficTypeDiagnostic: AM0PR04MB4979:|AM0PR04MB4979:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB49790AC6C66C6ECCA263336788FA0@AM0PR04MB4979.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 034119E4F6
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(199004)(81156014)(66476007)(478600001)(66556008)(8936002)(956004)(8676002)(52116002)(66946007)(2616005)(81166006)(4744005)(26005)(7416002)(69590400007)(86362001)(6486002)(4326008)(36756003)(6666004)(316002)(6506007)(2906002)(5660300002)(9686003)(6512007)(186003)(16526019);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4979;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: An9/yVWB/pYb0kRVDIU7KnbGIWmITIJ7zM0sybVvy/YiZH5o3Zur/3nYP0ddt7REnQTJWGlJXJqJQjEJVTgAcvFYDTJ4R574Mv05nVsqwdkfb2fSVH0HiWiVnf0+0Gqc8mQni6yKAgpzNbtWayyGCwemJ37bt8Lw1O8HzDnJkbbX+jJK5M3pw0QWTuLL20usy49maPZl9HZrUw9KP768Ipf5aChqpjoxdQfPkRfGSbNDysXrWbf7sbDSdKnto6PiFHVRmueZaUTfm+TTTC6MLUIpeXyvif0XQfVcSVxuY6yqy4WfPggXA96V95HRyu5UXmekCypAyINGULc1+ERy/JtGmzVHNS4rGgLo320kZIPgo63IVBe0agbFTuuqQndbFid7/w29wwbYrs+ISp4ojd/C1IEwMJGGQc1pFlpqmap6WU9odvzG91j+r4IMr5H9OwbKfEwsJ4IYNJFCb8aQ7ra/OCpumBwQkmUS/Wau6tqUKxBZMQe8JI/OeYgDHLcD
X-MS-Exchange-AntiSpam-MessageData: Hj66Awoan8s3FwLLL3JJ7uuEktji9EJuFTMfqxNHSmVRJ02IYTuvDVwYK/mlQxDjdE3mzG8MyM3jLxMZjWWuLssm9I5nTjxs0fpaqpbjqyhLAzUvaihzbjmFO2Q4xXK2fS0J4JtLuDfzKUmhSJ9zdA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31c984c1-8f8e-46fe-fc57-08d7c6ff5b1c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2020 03:33:54.6899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +vycYaJD3a7ShMSqAibo7xOszC3htH1DIbEONUWwmofiplNgrjwIEyhpx4H6bst7dv4qDD1HUBtWmLI0f7i0yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4979
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

It is possible to run aarch32 linux on aarch64 hardware, but
with the ARM64 dependency, we are not able to build those drivers
for ARM32.

Select ARM_GIC_V3 for i.MX8M is to enable the gic-v3 driver for i.MX8M

I did a basic boot test on i.MX8MM EVK board. A few ATF changes
to make psci smp work still needed.

Peng Fan (3):
  pinctrl: freescale: drop the dependency on ARM64 for i.MX8M
  clk: imx: drop the dependency on ARM64 for i.MX8M
  soc: imx: select ARM_GIC_V3 for i.MX8M

 drivers/clk/imx/Kconfig           | 8 ++++----
 drivers/pinctrl/freescale/Kconfig | 8 ++++----
 drivers/soc/imx/Kconfig           | 1 +
 3 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.16.4

