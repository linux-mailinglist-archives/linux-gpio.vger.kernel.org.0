Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8087114AEE0
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2020 06:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgA1FYw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jan 2020 00:24:52 -0500
Received: from mail-dm6nam10on2069.outbound.protection.outlook.com ([40.107.93.69]:33121
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725283AbgA1FYw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Jan 2020 00:24:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpOZznjheobWGllyKl2FNZXEX6ocZZ5i5AZNcln1BkExE9ljH5qmM5kYSyDqi5Q96E74mS+zTCO0xbXeeE/dQRXslRdWwfVZOx4xJnBfJkIDpToC1Y6lgnoiyKbC5niC8ehnPb6bdsmS6H6qqL68e19HI9xQTlySlq4vgKWjble+MvT5z84sa3c97s84mqv2ZFpAtyprZy8lwtZTLoy4MSfMT8tm0fYkQF0c2t147b61szLMYTJTjuxGxTPjw9NXkmepU+mnxS7+LXMWQsYMgnFOhJNUx6sNRuT5ua+9tK+1dMaobdWjJdGidMxAjAg7/DpCBO9q6ndQLB7AE1unhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLvwF4MZHjfJl3MTx+48LRPrq2rycKZfEQWZnqCcbfc=;
 b=ezJkpYP69cfmhDbObg3h4j4aFYUO8pRcjfo/cwzQnEgGkcRzQ06sXFtN0+gi8jwX4IQHB2+F07KbSrfwkJJQYekVXI6w0HhS5LD+XSnsoEihW9AjV5Y/F5jjowPBspiTnBPeVqZzjjR2meFdoSBeQDE9YB1+2Uy5//Iv6ni4xLWVKU3oqNN2SsP+GsH+GHuFpZJlAElEGZZWZe+pJE5O3e6vSpl7pQMB56n6MBFTa68euTzEgE9tRw0G1O8z3e92OW80fWxkD9buD+gtWUMXc9dtP0Z2Esc59GCMwAPwIiyyAZXAd/3fzMNUdhMrfjN29w0nFc5G0BvOWvYjTQbHjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sifive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLvwF4MZHjfJl3MTx+48LRPrq2rycKZfEQWZnqCcbfc=;
 b=R2xwrCFtHSlPb3xBdgzTY7VgjK2mDsx3c4aVcLYwOp+l+DUVJCOIjeGMIkVH+ZOdV8JCRG/T4FKi4U6ygQ4pcHPV5VkDU11gPg5Z6HnoDK0LvIwjIxuBqDHPXTohSZtI6GucUnTc3E/9KufM/f/6ucGc4+rpjBu0/xqMx9LNElc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=yash.shah@sifive.com; 
Received: from CH2PR13MB3368.namprd13.prod.outlook.com (52.132.246.90) by
 CH2PR13MB3592.namprd13.prod.outlook.com (52.132.246.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.10; Tue, 28 Jan 2020 05:24:44 +0000
Received: from CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::eccb:16ac:e897:85d5]) by CH2PR13MB3368.namprd13.prod.outlook.com
 ([fe80::eccb:16ac:e897:85d5%3]) with mapi id 15.20.2686.019; Tue, 28 Jan 2020
 05:24:44 +0000
From:   Yash Shah <yash.shah@sifive.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        palmer@dabbelt.com, paul.walmsley@sifive.com
Cc:     wesley@sifive.com, maz@kernel.org, atish.patra@wdc.com,
        linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
        Yash Shah <yash.shah@sifive.com>
Subject: [PATCH] gpio/sifive: fix static checker warning
Date:   Tue, 28 Jan 2020 10:54:21 +0530
Message-Id: <1580189061-14091-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0107.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::33) To CH2PR13MB3368.namprd13.prod.outlook.com
 (2603:10b6:610:2c::26)
MIME-Version: 1.0
Received: from osubuntu003.open-silicon.com (159.117.144.156) by SG2PR01CA0107.apcprd01.prod.exchangelabs.com (2603:1096:3:15::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.2665.20 via Frontend Transport; Tue, 28 Jan 2020 05:24:40 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [159.117.144.156]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbfd3523-c66f-4e50-722a-08d7a3b2621f
X-MS-TrafficTypeDiagnostic: CH2PR13MB3592:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR13MB3592940038BD9CB8AD1837178C0A0@CH2PR13MB3592.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 029651C7A1
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(376002)(136003)(366004)(396003)(39850400004)(346002)(199004)(189003)(6512007)(6636002)(44832011)(2616005)(2906002)(26005)(6666004)(6506007)(956004)(5660300002)(186003)(16526019)(6486002)(36756003)(316002)(8936002)(86362001)(52116002)(81166006)(81156014)(66556008)(66476007)(107886003)(66946007)(4326008)(8676002)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR13MB3592;H:CH2PR13MB3368.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: sifive.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DRU1csd8YWk7aHTLxkgJ9PlechIahme5Xro76KXkEU5DQ6XZcQsx1QMv7Xhanl8CK64GPveIf+Ie23bDYWqWFbhL+bL5vEFzQ/MXM5Jzx9DUy7h9bp840LAs2xlGSrVcvrwBaxC2CdnXRAu6RPTDxCSE4uR9je8ZigKy8oQx+8l0LZemUaKYx0S82VED873e9APDVOeQ2Hf5Pfj4o8QmYu3+UqIiAW8jVMAaX6Q5YbRyN57SZiKMLWoURKPUCU0bTRFPJzAyb/5/NOr4LkoV/Jq6HfWvG3p4/FVSORJbreuGPMsp+gBraF9zD1m8Vam2fhWxVdaXmEk3CDXxE27/AF5ugrtU5IPUcTWaMZqeqa+plM/YDkvL5CoxzEZxxHDtsM5HHi7Hvaa/DkTds888fWImwKHi9moPbkapqAhbZGTVXj8+weU3h1Kg1ZPkzKS4
X-MS-Exchange-AntiSpam-MessageData: C6fp+cuD8yVezJrGVrs34IGfv/l67XDx2uXKJn7SdWlJwLjbN7rkO+aAj899dna7uf1Ct5sPLbb4yM8qbvJkFKOtpHiKXCUmQ0ojJpHGO6S9EEYWRaf6zVrTCOxkwVGBG2NRX+8k22ZP9OKk/f24Fg==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbfd3523-c66f-4e50-722a-08d7a3b2621f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2020 05:24:44.4517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ROz5AnFn5ozONxnzSmCF7P6N7FNVwUC9EeDW3PnH4h5QSRkjYcKjK8z3LtmKaw5he2bfAXGj3M9HsFd/Vy8nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB3592
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Typcasting "irq_state" leads to the below static checker warning:
The fix is to declare "irq_state" as unsigned long instead of u32.

	drivers/gpio/gpio-sifive.c:97 sifive_gpio_irq_enable()
	warn: passing casted pointer '&chip->irq_state' to
	'assign_bit()' 32 vs 64.

Fixes: 96868dce644d ("gpio/sifive: Add GPIO driver for SiFive SoCs")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 drivers/gpio/gpio-sifive.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 147a1bd..c54dd08 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -35,7 +35,7 @@ struct sifive_gpio {
 	void __iomem		*base;
 	struct gpio_chip	gc;
 	struct regmap		*regs;
-	u32			irq_state;
+	unsigned long		irq_state;
 	unsigned int		trigger[SIFIVE_GPIO_MAX];
 	unsigned int		irq_parent[SIFIVE_GPIO_MAX];
 };
@@ -94,7 +94,7 @@ static void sifive_gpio_irq_enable(struct irq_data *d)
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
 	/* Enable interrupts */
-	assign_bit(offset, (unsigned long *)&chip->irq_state, 1);
+	assign_bit(offset, &chip->irq_state, 1);
 	sifive_gpio_set_ie(chip, offset);
 }
 
@@ -104,7 +104,7 @@ static void sifive_gpio_irq_disable(struct irq_data *d)
 	struct sifive_gpio *chip = gpiochip_get_data(gc);
 	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
 
-	assign_bit(offset, (unsigned long *)&chip->irq_state, 0);
+	assign_bit(offset, &chip->irq_state, 0);
 	sifive_gpio_set_ie(chip, offset);
 	irq_chip_disable_parent(d);
 }
-- 
2.7.4

