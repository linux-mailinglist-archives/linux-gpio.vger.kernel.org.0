Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B480183FB3
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 04:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgCMDeJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 23:34:09 -0400
Received: from mail-eopbgr70044.outbound.protection.outlook.com ([40.107.7.44]:6214
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726254AbgCMDeJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Mar 2020 23:34:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iylNvMpHH7Takv3gkDaww3/bNJHWbyrHptSC1yqYPxOFKaii3pbUMdlpjngK2YMyIz+208UdSXvUDTIUwNAmb41gAkEeWkIBs0begqzajkS/DFN1uCUshEnOOjjgqMulJ3PV19nDEu1w36WpIAZv6vGjmLvGipwLVfVsRYt0HNPy0jn6jRWnwyt4tTHY1TWlJRvA1NJxDDFt50fj6CujLk84Ft0PWOjFY4RRNzyrY8CFLbjbF2bXao9DKtC9PpfxMkVlq1Sdm0d1qK3PCoZrKWctlxgMQhBGXB4QydV72/HO7aFpmQuXYSn45xOxrUGyv3C8gC+ZHuA1ji08HI9z8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mk9KwdyRqoX4usFSakHze7PgC8YnvVzQ/WvFEYFxo8=;
 b=j9gBAd4EeJBsJcCVZffAToZGJfEt6kZoTWd+uC/RttzU7XAjFQfLmfjB5OjdrXXYMb9xiJbVIi0rsk2aI6w+2qefwDkmLbx3Oep85ZsHddtP9q/f+FOqvB84SM5iGG9RX1VJ/Wi1ClnMkFxz5YUHWxFvGAJz7U9BgUuY5qG7/xJ5IqUwh80lXeORosfB287KXrMYHaZigQaT3ZXQtOZwIF9dSYG2MIBLDWB2eOWh+4sJ9M7xRvk2VpGfRm/gfqGwG3uDFv6UlSm4e3hHgd2DLAsFiMkolDqKko2T10uiUyZ4D6Y0jQpcsr+vu8AdXSRotrSmj5aeNA8FYLOUamtJeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mk9KwdyRqoX4usFSakHze7PgC8YnvVzQ/WvFEYFxo8=;
 b=NzS2eXX66BO/wBEsx1v8DBivhbIWPFvUKQ6ozJbCtpJCovUvhdbpujlf5UrHlB/ys73j8QpxZUFAlKqq3GRXX990ciCAxxtBp0PQqfjlIad4VdJzE13brWyaV3n+pQxch0Mcp5n781XrrCaOgDEROCRvHW2l1sizyYw7yJqbEfM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB4979.eurprd04.prod.outlook.com (20.177.40.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Fri, 13 Mar 2020 03:34:05 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::548f:4941:d4eb:4c11]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::548f:4941:d4eb:4c11%6]) with mapi id 15.20.2793.018; Fri, 13 Mar 2020
 03:34:05 +0000
From:   peng.fan@nxp.com
To:     shawnguo@kernel.org, sboyd@kernel.org, s.hauer@pengutronix.de,
        linus.walleij@linaro.org, arnd@arndb.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        aisheng.dong@nxp.com, stefan@agner.ch, Anson.Huang@nxp.com,
        abel.vesa@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/3] clk: imx: drop the dependency on ARM64 for i.MX8M
Date:   Fri, 13 Mar 2020 11:27:15 +0800
Message-Id: <1584070036-26447-3-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584070036-26447-1-git-send-email-peng.fan@nxp.com>
References: <1584070036-26447-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0178.apcprd06.prod.outlook.com
 (2603:1096:1:1e::32) To AM0PR04MB4481.eurprd04.prod.outlook.com
 (2603:10a6:208:70::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0178.apcprd06.prod.outlook.com (2603:1096:1:1e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2793.16 via Frontend Transport; Fri, 13 Mar 2020 03:34:00 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7f748913-d8a6-4e67-d112-08d7c6ff6187
X-MS-TrafficTypeDiagnostic: AM0PR04MB4979:|AM0PR04MB4979:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4979164EBF30D5D38769B0B288FA0@AM0PR04MB4979.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 034119E4F6
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(199004)(81156014)(66476007)(478600001)(66556008)(8936002)(956004)(8676002)(52116002)(66946007)(2616005)(81166006)(26005)(7416002)(69590400007)(86362001)(6486002)(4326008)(36756003)(6666004)(316002)(6506007)(2906002)(5660300002)(9686003)(6512007)(186003)(16526019);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4979;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s8VVqKCCry/ux/hSTiEoGxmWEBlGIGIiigzcmCnGoZCjzIOrLuFiHp7y2NBICsjOFuE8cnhcplTFqxuDTeWxE5XcdEi8fJ80b3hQtrYtjCKMNDW71ht9e4N6Q45QpnyWeV+yIFI6mbMlmwmtvR7p5RDwIVwy06bsOmZezab0E50U7kNm2dGy1Kglo4sNERxmuOZIt6b+Mre6DOtN6X5nl2tS9Gxs9PlxFed+UwTle76et8Wp6+7m55BDiCSd6g4a4AWUhrHRDJmnY8f2TFH/+jVX2Xnqzl7HtmVmwHm3mELQg2KYtfhbcvm4B9qZJdEB3y5y2ulmbz9kY/Q3QaqKBmVZHVBzIvYjERmWqoFpGabHmflPmnTM+fRdQYUdXyiOYfco9vDXZgIfh7bBxkFXx+mxFwtlC3+4b1vq1JYPdKSkS/EQswrM413/xfzHuW1HIfMmpWI4lTJq1FpF6b1nCQZKxMWDWIUhHBqWIMfqjI6A4MhGcZVWpusHJNUeEtSV
X-MS-Exchange-AntiSpam-MessageData: wcMpxnxKheqCaS9SNj3Fr1MQOpz5xeunQqyzQ3Y3tiSrvCilPor8SQ81V/tBZyfrVqo6QBMQcFOieF4DiCGRYeW+gQsfT8078V5UdcStDwTa7bVUZaA9X0hSUEDO6kA9FnntnNF5Be/7WD3wkyTRkg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f748913-d8a6-4e67-d112-08d7c6ff6187
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2020 03:34:05.5173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tG59xrob7/sVG9s8OWf8+uQL6jIeqvNrRTOrpGCJebT7qQywj/TYjiroxrMV/52fVEZBk/QY/hCBuTyiMnVgCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4979
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Moving to support aarch32 mode on aarch64 hardware, need to drop
the dependency on ARM64 to make the driver could be selected for
ARM32.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index 01eadee88d66..db0253fa3d64 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -10,25 +10,25 @@ config MXC_CLK_SCU
 
 config CLK_IMX8MM
 	bool "IMX8MM CCM Clock Driver"
-	depends on ARCH_MXC && ARM64
+	depends on ARCH_MXC
 	help
 	    Build the driver for i.MX8MM CCM Clock Driver
 
 config CLK_IMX8MN
 	bool "IMX8MN CCM Clock Driver"
-	depends on ARCH_MXC && ARM64
+	depends on ARCH_MXC
 	help
 	    Build the driver for i.MX8MN CCM Clock Driver
 
 config CLK_IMX8MP
 	bool "IMX8MP CCM Clock Driver"
-	depends on ARCH_MXC && ARM64
+	depends on ARCH_MXC
 	help
 	    Build the driver for i.MX8MP CCM Clock Driver
 
 config CLK_IMX8MQ
 	bool "IMX8MQ CCM Clock Driver"
-	depends on ARCH_MXC && ARM64
+	depends on ARCH_MXC
 	help
 	    Build the driver for i.MX8MQ CCM Clock Driver
 
-- 
2.16.4

