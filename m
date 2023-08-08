Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3D5773C1F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Aug 2023 18:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbjHHQA3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Aug 2023 12:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231365AbjHHP6q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Aug 2023 11:58:46 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165C36185
        for <linux-gpio@vger.kernel.org>; Tue,  8 Aug 2023 08:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bo4YsUQJSpilj4DQMcqZD9gfjlL4UQsEB5IarmcRUEDMeUAlHntt2fxnC1HR3VImiTBoFoGBThiIUplwfm8VzR/SO/SNkunJ0JnzrchC37Q2u8X7nmFcwBRqAgpDCFeDOmkim698334Rl7hfsBZxJHzfvdoNQiTRm70Fze20y7NhJU1UYXayqwd6lkkbnIkysWvwT72fee6weevRubA5KUARKBhGikOzp+MoHFwOtrLOkahf8bngd8QwWmc7r+AVTe483+SJgHJuvGH2mwKAOq751/KHADUMbe9FuQV0cJ27zgSRC2TvemQKonVK0+Eg+JPi4p1yt6whOW5STfxCcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfdyVx81Ko66D8vyahU5oo+SN26lU2t40vsO0sNJEzo=;
 b=Flj7rg+6JUsfwEcfLR1XtHaq35pm/ziqjPEGUZgfi+djguUNxxmI09l8ZRslERZ+HjUtfx0SBdyLGyQPv3CMl2UPocQxtw8EY8GNKLiwt4oiwRFN9gz91C/zSumX6OhOd/3JsfSK1PFXvH48gz1aN+bTRrLmZwgtZ27hNZXaaxfKHrQlnagPytmcpVYRFaR6Z5s9cNKZYPUDxKpnkvqAeIrlpVDEzNtrdYQ4IJkICYIJm+LkkDKHj9Yk8Hau9QTis43TTxXvXEDvfQiqPEsDWuAb+izyZrMMcJWnZsjyQS2FygV5uwfXNcncEadMVnd/kUf2ye9GfXzlXdHIBNoYrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfdyVx81Ko66D8vyahU5oo+SN26lU2t40vsO0sNJEzo=;
 b=Tp2tSFSKdR7MidY9MrEZujFk/w9cJ9tJWQVXwsUYc0Hab/pGx/yg0zlRgU7mgUOWj2VkPQ5rry7LGaPYW8Puv/RbAq/oZgwotyAMtHQyqsCl4HXFAC7rf/yM/EXO5hETofbKRZRKiHEcgUZ5oewHnWzR/zsh088rEj0BwQCkyKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV1PR04MB9200.eurprd04.prod.outlook.com (2603:10a6:150:2b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 15:34:26 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::d4ee:8daa:92f4:9671]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::d4ee:8daa:92f4:9671%3]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 15:34:26 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        imx@lists.linux.dev, linux-imx@nxp.com,
        Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH] gpio: mxc: release the parent IRQ in runtime suspend
Date:   Tue,  8 Aug 2023 10:33:46 -0500
Message-Id: <20230808153346.335411-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::10) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|GV1PR04MB9200:EE_
X-MS-Office365-Filtering-Correlation-Id: 4570e937-6402-4eeb-7db3-08db9824f2e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h1ajTzOa/bPMihDw515FULHG/4K9ukMaKWrwGx56vLNvNJbGQawGTx1Va4SPyb00Or3vhm4FsnhrQwB8qn5irlU2R0M1tJOA4XnjGm5D0QDWHkN2J8jg8Qn1W6QbxqrS0ETywTYw9dzPlJxMs6ReESCzn55M1W9j95kPjUTs1IAYmy/swaoXbbF7MHRPgLqcG/uyQu+RPqP9fVS/jdoqQPbRr/cVO2+fPhmDMfTKXrs4V+A87I7RxsA8ktwXiCwsWzC1nCHj8n4s23R5fI3aEK25iUhO9kfhdAXQIrQGbwCesFrENVN/g1EoioFha02UGP0mhg2xRr3tbVfFgUfBpQBRgKrRk0EZ8T5REfXU4jhZN0Rhsen5VKXGNtR4O/H771vDBBl7z2KX3FmuEQEEG9i5ylgcQwsHsJPQ/TXAtGuL91LYwmaNDerUz88heU+PwTTtwraDHb0BaKM9JlZofMHd8nWwQIk/WWA9d2e4EKB9518c/P+gSWyM303+iSISatQWrBWJmlfVFOXIEPFhbfaW61ehUEN5TUtpjglky/YzVsEMpBuvd1h/M4Q/MsTo0LMLOIQJekYg9MOyUDNLtrn4mWzvH7zr7oVjLuJM+SYq5pa3k7XQ/EkSl77qnMbe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(186006)(1800799003)(2616005)(6666004)(6486002)(52116002)(478600001)(86362001)(6512007)(26005)(36756003)(1076003)(55236004)(6506007)(41300700001)(15650500001)(8936002)(5660300002)(316002)(44832011)(8676002)(54906003)(110136005)(2906002)(38350700002)(4326008)(66556008)(38100700002)(66476007)(66946007)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z29ZtvWCvnEfz6s6TGVvTs++70A4m7jzooEqFQ8RrYrkRwjTet7zr2SFqL6P?=
 =?us-ascii?Q?8P66cI+qE83TkDf/icHEj0qaUdwNn8KJsBt5MDS0WtrZe0vSrsYKgMZWNVGb?=
 =?us-ascii?Q?n+L3P6xBITUwLV/Es8HW2Pwk7KjrqotyKqWwXeW//Bd5VD6P5jcFzh3mKt7/?=
 =?us-ascii?Q?ccTSvn6mDiNSjqCwMQ1c4y8DDb2gROthuj6DedOKDoBlA1aZXnK9DXdS/8bv?=
 =?us-ascii?Q?rco+2888UNPWcd00F0xK/F6kmNvVHJ3XOF1mgYWKjjmelawO9fDKizd4Yf1w?=
 =?us-ascii?Q?AtqBXqJQW29+j61UeQ73YT8D7Rzb4DOSAkuDIg4w7cWMJyvK5CjEHqu0W5le?=
 =?us-ascii?Q?xd3zo14VbYCHBBwAx32UG7dGCklSmEuG8OHlPcu7Sj0Izx847LeI2IhFPzup?=
 =?us-ascii?Q?aU2TEv/ABbqikUY5ai3cnGXBAZI7R23oG/9/vuxMQkwvVYz6Gaky+v7+OtcU?=
 =?us-ascii?Q?yUpJc67psPjBVK9Qlzu/5SQQWjkJUtmrnyjknEat/t0TzrdcdqTB4wJfrIor?=
 =?us-ascii?Q?CMxA/t/Ye5Fzlu2CVLlanCfZYm0LSFScbRPMlhn09XS5DRciGYY7ttESJNGi?=
 =?us-ascii?Q?DOcdkhnAo2ONyn7ozNEtC997EGZpVypjT7gzEsv2K+q1yJjn76Ewutr0kv1J?=
 =?us-ascii?Q?HYQHFg5MxC5k6gepJ0hUTvm4t4B/WqxtVuyN8MAViUBmcCEYAdPZ5n78BfKz?=
 =?us-ascii?Q?wmugQ9wJKLuieNaMdR16nQw4pqUGkDNslkk62z+o4oQ0nid0R3DzCxCFUp4Q?=
 =?us-ascii?Q?FnHWrmcnF2oPSxDB9L4uOfBXVKspudjvpLBkOyrGAvpX7H4625H98HoZYJ1n?=
 =?us-ascii?Q?TEcye1jeoqzBrWejwKe0vWPYIf2hHKkUILiHqY1ONtWQOhz1BoBnKFPwRkKq?=
 =?us-ascii?Q?Z+yPckflPkFtx/C9vtmh7ioGfN0xFHDqS8AP5+wVhjL7Pfg9fpMBXXLtEyT3?=
 =?us-ascii?Q?Kcv5fUuPWq80y1stgaiXlSvFSTWC5CFIOnxu0kRQG1JeiCRW5cbNtY5XQ4s2?=
 =?us-ascii?Q?S/T8it6AB8LSEHbMuunXj9E9TkhwmzC25TphKosWIQ9ydgGI/2srXTbrhY5F?=
 =?us-ascii?Q?wMoxWlkfUSr7u2odpXPts1jHZ+pYkfS0UzbkKdCjegMQuptxdYjORXG47XiB?=
 =?us-ascii?Q?kuv2skqAYy/MHc98U7nY6kxBUrHRE0F5qfIXZPYUEJd3Z5ok4qJyPcU/GhAu?=
 =?us-ascii?Q?/j58gC4MVF4qimX9AT8fFw8pUGK/EEL3dALtzHE2zpPxB9LHMlRgcBLdbZYs?=
 =?us-ascii?Q?eIDuIthmzNcnLx2XLR6JGyoWdZkv599kbgmttH8Rv2NeqQXpbyE64NUg5r5G?=
 =?us-ascii?Q?f3YhkInNVLVj/YvQA3l8TqXmn4PgGJ/nOc/dfsRkIibQPdqYRy/LQT3Cct57?=
 =?us-ascii?Q?TAP30fCQ0Znt1BnuF8kuCXNHNCdGKebvUoz5aAhJmEfxrwk4DXLxDnAGEeey?=
 =?us-ascii?Q?R0g1n7w33SG5dx5pHhm5+BynEq4YBzA4WjJrCF35jFVEDsiJT7xfLvR7H5H3?=
 =?us-ascii?Q?hzXAR/HrtBNQdWhgQo8DBBQF8sD5YMDXcgbvwGuMmHJwlzQoReAF9XY9lUsu?=
 =?us-ascii?Q?JjzLaGpAlAhcJJt+wx3UgwL/EQ/vU6LMJUC3iijf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4570e937-6402-4eeb-7db3-08db9824f2e0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 15:34:26.7046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tg2vlHwit6Qh8G9NXXrlr1b9D0BuIGyHkuLw5T+z2QOm3SnGyCej62xycPAJBnmoZTTWTHnGGFFU3MlJB5uIZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9200
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Release the parent interrupt request during runtime suspend, allowing
the parent interrupt controller to enter runtime suspend if there are
no active users.

This change may not have a visible impact if the parent controller is
the GIC, but it can enable significant power savings for parent IRQ
controllers like IRQSteer inside a subsystem on i.MX8 SoCs. Releasing
the parent IRQ provides an opportunity for the subsystem to enter suspend
states if there are no active users.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 43 +++++++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 377d3ab8d626..fe417ee50b37 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -62,6 +62,7 @@ struct mxc_gpio_port {
 	struct clk *clk;
 	int irq;
 	int irq_high;
+	void (*mx_irq_handler)(struct irq_desc *desc);
 	struct irq_domain *domain;
 	struct gpio_chip gc;
 	struct device *dev;
@@ -399,6 +400,26 @@ static void mxc_gpio_free(struct gpio_chip *chip, unsigned int offset)
 	pm_runtime_put(chip->parent);
 }
 
+static void mxc_update_irq_chained_handler(struct mxc_gpio_port *port, bool enable)
+{
+	if (!port)
+		return;
+
+	if (enable) {
+		irq_set_chained_handler_and_data(port->irq,
+						 port->mx_irq_handler, port);
+		if (port->irq_high > 0)
+			/* setup handler for GPIO 16 to 31 */
+			irq_set_chained_handler_and_data(port->irq_high,
+							 port->mx_irq_handler,
+							 port);
+	} else {
+		irq_set_chained_handler_and_data(port->irq, NULL, NULL);
+		if (port->irq_high > 0)
+			irq_set_chained_handler_and_data(port->irq_high, NULL, NULL);
+	}
+}
+
 static int mxc_gpio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -460,18 +481,12 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		 * the handler is needed only once, but doing it for every port
 		 * is more robust and easier.
 		 */
-		irq_set_chained_handler(port->irq, mx2_gpio_irq_handler);
-	} else {
-		/* setup one handler for each entry */
-		irq_set_chained_handler_and_data(port->irq,
-						 mx3_gpio_irq_handler, port);
-		if (port->irq_high > 0)
-			/* setup handler for GPIO 16 to 31 */
-			irq_set_chained_handler_and_data(port->irq_high,
-							 mx3_gpio_irq_handler,
-							 port);
-	}
+		port->irq_high = -1;
+		port->mx_irq_handler = mx2_gpio_irq_handler;
+	} else
+		port->mx_irq_handler = mx3_gpio_irq_handler;
 
+	mxc_update_irq_chained_handler(port, true);
 	err = bgpio_init(&port->gc, &pdev->dev, 4,
 			 port->base + GPIO_PSR,
 			 port->base + GPIO_DR, NULL,
@@ -604,6 +619,7 @@ static int mxc_gpio_runtime_suspend(struct device *dev)
 
 	mxc_gpio_save_regs(port);
 	clk_disable_unprepare(port->clk);
+	mxc_update_irq_chained_handler(port, false);
 
 	return 0;
 }
@@ -613,9 +629,12 @@ static int mxc_gpio_runtime_resume(struct device *dev)
 	struct mxc_gpio_port *port = dev_get_drvdata(dev);
 	int ret;
 
+	mxc_update_irq_chained_handler(port, true);
 	ret = clk_prepare_enable(port->clk);
-	if (ret)
+	if (ret) {
+		mxc_update_irq_chained_handler(port, false);
 		return ret;
+	}
 
 	mxc_gpio_restore_regs(port);
 
-- 
2.34.1

