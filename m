Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E002753F0
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 11:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgIWJEF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 05:04:05 -0400
Received: from mail-eopbgr60062.outbound.protection.outlook.com ([40.107.6.62]:46069
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726178AbgIWJEF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Sep 2020 05:04:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEY6BBI4ORuz6i/xFRQqIXZqtAL4vKIjbWzr4m784qV66+Jy6vLKX5yPHt5ufPjUIG3n7LZCeC0S4tMQdScckAvVUrTQ+7u0+rTfS4XjbnH2y63Af794yjK/AeGZppewNYNOLoVnyLWFzPqCFNM1AXEp2s43mls2B7Sy5zpdGIF7XK/sIx3pKgrLK5xmtKa6tujXeDwU85N3zvUlorumDnrhqoZ+tH19wNqYGiMHyieMoOfO9Euc1lRYweKG2Ccm2uZaUZsYuX4tvmsINzrMBdELGKJRtRC8NYzrNraQU8h2fkqt7s/2zYOO60LcyQt0aPBSLv9fpZdY94dfqvw5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3varojlpv+2UQg6Om1VbAmdAgkbb+uCjs+iYQmwUnRs=;
 b=SnMC6+r/Sqw3Ehd3T2DLf7UT/64QRUnohjT30fIYhkWdiTSlSKptrHgjSB1J6yYixDgBriTuQWLQ0b76ffGJJ7MceA51YVgziNiSJHhEbb5SR9V4D/Y7rH5DatKi6F5D6HuAJfreYUYHTKZeQ2XzZeTnum4kP1p5Y2xn+O3CetPHBUrxlIO0MmnOC664IPUonnAi1Ee6VVxR+8SiMrNr++pGJzpCT01osET50JbfZhMyB0TlHSDrgCS9b4ii4wB0FNBrp3QLDcERuXvlRr6gN0sicHK043FPSgLSIizBIcz0VjiZB6vTzavgAbtn19OPaHE3GN2Xm8YaEaw11qoI1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3varojlpv+2UQg6Om1VbAmdAgkbb+uCjs+iYQmwUnRs=;
 b=srSuOh5G7PihbPs3jMqDYdiQehSTjuEQDtxxfBThpt+amITkgfgMhQR+Lkf5uKd7I7kDBYI/OCANByNPNqcqDFmxb+46t1k3ZAFpiqo7MrXZjApgif+lbf77de4FV0XKiK4D63JE+0JwIYyYv1jhVRPhrz+Oj+4ngJchdC29ebw=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4414.eurprd04.prod.outlook.com (2603:10a6:803:69::13)
 by VI1PR04MB5997.eurprd04.prod.outlook.com (2603:10a6:803:d0::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Wed, 23 Sep
 2020 09:04:02 +0000
Received: from VI1PR04MB4414.eurprd04.prod.outlook.com
 ([fe80::45d0:c9e1:21ba:1d61]) by VI1PR04MB4414.eurprd04.prod.outlook.com
 ([fe80::45d0:c9e1:21ba:1d61%6]) with mapi id 15.20.3412.021; Wed, 23 Sep 2020
 09:04:02 +0000
From:   Ye Li <ye.li@nxp.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        andriy.shevchenko@linux.intel.com
Cc:     linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: pca953x: Fix uninitialized pending variable
Date:   Wed, 23 Sep 2020 02:03:44 -0700
Message-Id: <1600851824-4608-1-git-send-email-ye.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0194.apcprd06.prod.outlook.com (2603:1096:4:1::26)
 To VI1PR04MB4414.eurprd04.prod.outlook.com (2603:10a6:803:69::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (119.31.174.68) by SG2PR06CA0194.apcprd06.prod.outlook.com (2603:1096:4:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3326.19 via Frontend Transport; Wed, 23 Sep 2020 09:04:00 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.68]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bda8192c-7fcf-4951-2c26-08d85f9f9d9c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5997:
X-Microsoft-Antispam-PRVS: <VI1PR04MB599725776AC261AA4792FDB3E4380@VI1PR04MB5997.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LW7lHPQNZX2Yy/fYjkAMyt3tx05d13pmjzbdaRD3wTSFaF/0elgCHqJVG160G9WcoKPbxw9KdZJrqjqEzsCSFGYa0bXglnbAX5ZKg7oP5W2KFsomehp9WlhCeH/TLDcFwTApiT1rbkYIbXG1tDIJdVSqKy06Xhmwip5hBeRIjyPC4xb3vQ5J7j0U6DzZK2/FCRobz5al8xgIVSSZxrS7zxVcgCVNadwJTgpEkGdbjCNy5iS7rff+QT4tLV217iiJUTTizlBLZeboyAIHQphPE/6KjXGrflNJjj6tcjmM0sWOtD8pF9dSWEiBniEaQbQEYiGmQUgEdvKj/4zgdy3d9MTEOyQgk1nU7dn2VEGHqiPBsc8/e72WmjjX6eX40ecR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4414.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(86362001)(8936002)(5660300002)(83380400001)(2906002)(6512007)(66946007)(66476007)(4744005)(66556008)(6666004)(6486002)(36756003)(4326008)(8676002)(52116002)(6506007)(16526019)(26005)(316002)(2616005)(956004)(44832011)(478600001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: mow3Ex43VOUDVCPpSIldAS7Z7p880qIO9t/tTZzwSWNuccj3yKqWVnAe0vB7kCM46cbjx5/y3p8nJoQrnFq5ZMWHGdYQncGgZ5YS/N28q4sDEwkdrSj6kP6BGl2P5Bkz6LnyMCAGj9UiD5I5skCsMhmKYG5jVrs2yxhBAW4Eu9YGDFzEXDUSQCqpxilYH1gPoUUADsttDFx7EH9yzJzwPhlT0Vpe+GlJxzcyG91PhgbkfGkqSPaqlnVq2D3hf++Iw1e0GmeTJvimAB6dtYXXMHsFl3bQOrUtznq2ShIXxFmcQxOYwRc/QOLayf7DEjHuUsRm6BxCTrWZXrjdN637ZwcHotwbLBtpQtE0js5pNBUTlR8jcw8hXbQ4sj+Eg57zGMVUBN512WH5/4FJXnEMLzEsorspIJxm8JAuHJdHYS+tZVmx4LsqmBkzz/RXcqlJaLzI0Hy6qtvLB0emqtz1OEndRiFM1xSmcB3QFurznEQOrLbnu2PTavXbM/yuWB5K50AzdTvUFU9gpsJNubOeCYmCIRRXZNKMteh5tizugLnl9XCylImTOesjMp8xDkmCEPNWVbJy3LqUZI7cLMSgcFPf7z6UTGROwSHhzAIIAHjqc+QJSqUSP3Sc9wTlLwoGP+gsrQ6oI2EBlL5gMQBRmA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda8192c-7fcf-4951-2c26-08d85f9f9d9c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4414.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 09:04:02.5839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfeOc6etU+kQOBZfGv+akSB5dRKfQYelOuMDcL/AM2l6QpzHX4dKycJMd8I4bDZ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5997
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When pca953x_irq_pending returns false, the pending parameter won't
be set. But pca953x_irq_handler continues using this uninitialized
variable as pending irqs and will cause problem.
Fix the issue by initializing pending to 0.

Fixes: 064c73afe738 ("gpio: pca953x: Synchronize interrupt handler properly")
Signed-off-by: Ye Li <ye.li@nxp.com>
---
 drivers/gpio/gpio-pca953x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index b5c3e566..0a49ab6 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -814,7 +814,7 @@ static irqreturn_t pca953x_irq_handler(int irq, void *devid)
 {
 	struct pca953x_chip *chip = devid;
 	struct gpio_chip *gc = &chip->gpio_chip;
-	DECLARE_BITMAP(pending, MAX_LINE);
+	DECLARE_BITMAP(pending, MAX_LINE) = {};
 	int level;
 	bool ret;
 
-- 
2.7.4

