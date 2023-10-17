Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8C57CC0C3
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 12:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233570AbjJQKhu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 06:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234594AbjJQKht (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 06:37:49 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE328E
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 03:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNCuCj9OMwG7NRWB6wzGM9PTLrvlaFzP6oOYenAunx3q9LtfQyV/1qP4r0HSaQj63gCRb1c8ZIq7e3N2YglI+dcV+dNbLXomuRksB4BU+5s1X00f4mqu2R1m6cD9jzV0tsCHZKXpr+1H7LDmGg2DLig53ObSHBW+3tPyB7Mi7xXLkdeis/s2slkrRQFMeh8oysDnr5ZPdp4+6o+AR/vbMcBDbQv8W/m0ohx+zood8bpzvqZ2tRluHrABGwO7m80wGGn/gqOqQfQ7tFBSTcmTSx7qiAi5UvSb2gHui51l0pALrqNe8hRIJ/2yv6U5F1w1jpixjzGrZv5T+V6kUXNNxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vp+qPtM7wDtxHTIQUrSk4dQm4XFDOqXsWFRXwRKEMWQ=;
 b=kjEC6zXrrEHTwM2TldSCHlYCpEJ/0BrXYnVAFd6/rBDQQOaMFV4DJqlAr/fjdEmQMVsMfh9PM1nPQJIADjheLGJ47AW08i7HtGopWd1uOC2xiqfsTE0QFqhjtF6q4UP88dtXRMYIYNnaxUSbcGPIxKN+fcNuLp950y3+WfFA7C+GWW1ZC+vnvFaBb4qdnjGopOZm0hj/W0UO2baMFm2ab3wa863ToQ51CV2WVFTaEoMNTz6CQQHMcyR/vNXW+OFI0ATqAZaTsQ0Hy4Z4nSEuODfnqpsCNdGqThWIlL1QU5eSERh7eFdL5v78hw/rZg0Fr6LWAM14RWsKwOuw+FurXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vp+qPtM7wDtxHTIQUrSk4dQm4XFDOqXsWFRXwRKEMWQ=;
 b=VWbwnQAGjgXltPw0jwuC5sWLfR7BhssLeD395hRrpQewPHrRESnY89Ym0Lr2h+XCHOCrFOfHk3t2MnIX0piNNlJuwYGVvFQCVQbTWGi6y7pmv8xBFxRDqMNT9/HvpZ4wr7Q6T6/s1+h7qLBeptYrblElgGYyrjVPIzwCgaT2ZPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com (2603:10a6:5:21::30) by
 AM7PR04MB6837.eurprd04.prod.outlook.com (2603:10a6:20b:10b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.46; Tue, 17 Oct 2023 10:37:46 +0000
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::e796:8366:5d4:4188]) by DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::e796:8366:5d4:4188%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 10:37:46 +0000
From:   haibo.chen@nxp.com
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     andy@kernel.org, stefan@agner.ch, shawn.guo@freescale.com,
        aisheng.dong@nxp.com, linux-gpio@vger.kernel.org,
        linux-imx@nxp.com, haibo.chen@nxp.com
Subject: [PATCH v2 1/2] gpio: vf610: mask the gpio irq in system suspend and support wakeup
Date:   Tue, 17 Oct 2023 18:42:36 +0800
Message-Id: <20231017104237.1966094-2-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017104237.1966094-1-haibo.chen@nxp.com>
References: <20231017104237.1966094-1-haibo.chen@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To DB7PR04MB4010.eurprd04.prod.outlook.com
 (2603:10a6:5:21::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4010:EE_|AM7PR04MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 601f0c25-e0da-4f24-d1d5-08dbcefd1a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OrRADBMstuH4Z0QisWVGjTrndHw0ssdHCNKvLnd5ORQiewU5jDTWKlzsHAdLo5hrsjgMbMrhkEAovaVnrAGQfdJiyHGGZQhWBVSDsO3uVUpE0gRwAbLFkRAJ3IJRelqLyHccTDgt4EFq5Q3SXBbUGy1lpNMArgfYq/m7LQhb0uKsbi2kCDpOWeRiXpMPLA3Hn8RQotLvIoqFtRUt9OPmGFQj/WEGuBCXamJVkuPYey8NSbbKeh9pXIGTLmruT68HrIWT99XfE/3a77zf0ZDlq9cy0+Rjqxx8bzJmk4xGVFI7iKKXC5R5Vf0VnrK8YHpi7+huBEhhAihNZE+a9Rfbyb7dEzwQ7iBUZHPbtGUlB2QTIZdhVsQozRAuITv7riQvQn7DKf7rA5dRvu87tX/G/kEmL0Lwv6xpRd6IBk0BcEbtlCOaVleYwZej/ElxkYCa9/jN6N5d9I558thaEQfCfys6KrKNUlDru/JZzzClp/s5O1n8mTS/KhLHOwfzp2mCdnkI0uwWg9aR33zMgwMCk03RLzkrVYH0h5QqXkwKwHlQNbV+8pmOUrr9Dz/G0TiC5ZRXP4lswv5m5emFASJi7U1DCYWVxVgwBfZoVNwbQ+s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4010.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(38350700005)(52116002)(6512007)(6666004)(6506007)(9686003)(36756003)(6486002)(478600001)(38100700002)(83380400001)(26005)(1076003)(2616005)(66556008)(66946007)(316002)(8676002)(8936002)(4326008)(66476007)(5660300002)(15650500001)(2906002)(41300700001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hXa+NaweZWx3+YEoyN0qjlX6qyL3W324otqKCyBPZtm/7PEQlyVtRd3icbdQ?=
 =?us-ascii?Q?Y52BTUC2nRYM2iSxHR2Zcx5BTxE27DlRU5EV+aESZvHXuePzkuLCoPxF9oBZ?=
 =?us-ascii?Q?cGhfHg4Sn64rOptwGfD+qsmvEq6SSzdOJCtr1teq6yNPXueHNea5BBChZepI?=
 =?us-ascii?Q?bT/tX6o6hJuldmmeqpjOwtNr8SuOqgt8e5cx7FxkSUZ5yJZMOLRmazPcAj7K?=
 =?us-ascii?Q?0GzEHtih8mhJehrm5dN/QX+b6R0YyNkBPpQIyjLH3iIIcL8MjgZDOQEh/OdN?=
 =?us-ascii?Q?tDOL/7xOrGK0sDVxI0j7aFw29O+6kftpOgb0v2ioMTPr8V0ES+z00L+X8cMY?=
 =?us-ascii?Q?0l1v7rJswdTetW/FKxwMprKBe/nNMIhYgOLbn1+H81E2vTvSPRFPI6eZ/ve3?=
 =?us-ascii?Q?bEwMaQQATj7XJUMKz3ubp0/0XIY5NfPrPrvUFQaem6uXwfZcBdqICFgJ5yc6?=
 =?us-ascii?Q?V379bEKkmZpCRWuq/x8Vrc9w2WRdf6eF1jJEEdjo77ivR8miL1ZCim0FQf4r?=
 =?us-ascii?Q?lt7adSFYf76Px12SmfjVmPCrlYELMsccxImXUpQk9ZL4kDziMu6EFQ7XcFWQ?=
 =?us-ascii?Q?nWg6ssdVM8OP+WPkI6BT4izNDOsmpT6XILhEWG2VXX7EuFFATQMCv087bsNS?=
 =?us-ascii?Q?0YSEmR5osiuPkyogf184mOGCLyq7vRePMcBzY5Ipm02uSQoFapXunKBu+XpQ?=
 =?us-ascii?Q?l2Z0fJfhus7udIDJv9Dm40dQK74YlJVORdmGoYYXxw9ornonTawAg0Yrigm0?=
 =?us-ascii?Q?KlcMWCAtW4WnYvSJS3b2hsDKzlvpwIhKqKgF6ZKDafKycrJtup0sFbfrcNJW?=
 =?us-ascii?Q?h5OqFimjcnDh5Tjh9esI7D184kOiDMmhn7SfFf7wlnz+dv6G09HG6KK8M1uG?=
 =?us-ascii?Q?QJWRAnG9l2CvDSzALK+oaOG9jbTlaUpkK6c2sldlXx4IbScGGI+1cyEg1SkO?=
 =?us-ascii?Q?UYNVwpNyCXcsAeEVKkpO0YX0BLYsageIFD5HTwPehVjwHYIl4dIdn4sbV39O?=
 =?us-ascii?Q?rM3e7WuBDaEVj92nPf7rbnmO0OHZSrusD6wDNT0BZrZbRZedI+LIxf/lQTi8?=
 =?us-ascii?Q?2/mahmfjJ6gPbHITS7zPHsjP+OE7s6llexL3M9BqHPhYI3XQcYjkjpzE4o/F?=
 =?us-ascii?Q?ohpmPKnmjroNuhm+y6aN7TM1rlCQixmG/07oF8KzZ2sWv1zTkrfC4J4yNQY7?=
 =?us-ascii?Q?yt4dWOm1WtVG7gItoV+8XFjTfhXc4ZeNDgLOql65TIILiIMWhrRbEkDhwCAd?=
 =?us-ascii?Q?nyekYevkn/mK560oXGfdVBYhRObNN82979IDGlacQiZz4XMleUMF0srrvgml?=
 =?us-ascii?Q?m2YJ3LFnVJOd3lzqGEV8d4M0S6fE0yMG0XA46/OJMnaXJQxPNHpE59TQyauE?=
 =?us-ascii?Q?TmDB763+YKZJS/RGzXaLm5y+iW7NloTa1inAbEiZht436eSVbMK3M2ogbCwi?=
 =?us-ascii?Q?G6SU//aGGfx19bY2LHjumDgqx7qzrk5Cq/0K2kh1t4e8JCldDtYGIghKm21E?=
 =?us-ascii?Q?c2ORL0r5V7XeU2fYQQnKscFHl+VJrbYBqvZri1LT58E9+N580eNMRIpH91zC?=
 =?us-ascii?Q?M+Qg3uDb8lu7kAzz4/YT0cUl4AsoA7Dcmyabl8xB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 601f0c25-e0da-4f24-d1d5-08dbcefd1a33
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4010.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 10:37:46.7909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/5sFJfEN4xXSOageWojiuOXUkMIO8J2/0iSj26+90KuUF3mMj00le5FkwF2U56oBLCXJf51wD0bdvCFrVqmiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6837
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

Add flag IRQCHIP_MASK_ON_SUSPEND to make sure gpio irq is masked on
suspend, if lack this flag, current irq arctitecture will not mask
the irq, and these unmasked gpio irq will wrongly wakeup the system
even they are not config as wakeup source.

Also add flag IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND to make sure the gpio
irq which is configed as wakeup source can work as expect.

Fixes: 7f2691a19627 ("gpio: vf610: add gpiolib/IRQ chip driver for Vybrid")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index a89ae84a1fa0..77d5b8dd2bd5 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -260,7 +260,8 @@ static const struct irq_chip vf610_irqchip = {
 	.irq_unmask = vf610_gpio_irq_unmask,
 	.irq_set_type = vf610_gpio_irq_set_type,
 	.irq_set_wake = vf610_gpio_irq_set_wake,
-	.flags = IRQCHIP_IMMUTABLE,
+	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND
+			| IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
-- 
2.34.1

