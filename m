Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB9839F387
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jun 2021 12:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbhFHK3f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Jun 2021 06:29:35 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:22674 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbhFHK3e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Jun 2021 06:29:34 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 158ACFGJ009916;
        Tue, 8 Jun 2021 18:12:15 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from slee-VirtualBox.localdomain (192.168.100.253) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 18:26:05 +0800
From:   Steven Lee <steven_lee@aspeedtech.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
CC:     <steven_lee@aspeedtech.com>, <Hongweiz@ami.com>,
        <ryan_chen@aspeedtech.com>, <billy_tsai@aspeedtech.com>
Subject: [PATCH v5 09/10] gpio: gpio-aspeed-sgpio: Use generic device property APIs
Date:   Tue, 8 Jun 2021 18:25:44 +0800
Message-ID: <20210608102547.4880-10-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608102547.4880-1-steven_lee@aspeedtech.com>
References: <20210608102547.4880-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 158ACFGJ009916
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace all of_property_read_u32() with device_property_read_u32().

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Acked-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 38f4900d84bd..f1e40486d401 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -564,7 +564,7 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 	gpio->max_ngpios = pdata->max_ngpios;
 	pin_mask = pdata->pin_mask;
 
-	rc = of_property_read_u32(pdev->dev.of_node, "ngpios", &nr_gpios);
+	rc = device_property_read_u32(&pdev->dev, "ngpios", &nr_gpios);
 	if (rc < 0) {
 		dev_err(&pdev->dev, "Could not read ngpios property\n");
 		return -EINVAL;
@@ -575,7 +575,7 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 	}
 	gpio->n_sgpio = nr_gpios;
 
-	rc = of_property_read_u32(pdev->dev.of_node, "bus-frequency", &sgpio_freq);
+	rc = device_property_read_u32(&pdev->dev, "bus-frequency", &sgpio_freq);
 	if (rc < 0) {
 		dev_err(&pdev->dev, "Could not read bus-frequency property\n");
 		return -EINVAL;
-- 
2.17.1

