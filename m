Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2434A3C5AA3
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jul 2021 13:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236883AbhGLKHs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jul 2021 06:07:48 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:18865 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236948AbhGLKHg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jul 2021 06:07:36 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 16C9lfEp099610;
        Mon, 12 Jul 2021 17:47:41 +0800 (GMT-8)
        (envelope-from steven_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Jul
 2021 18:03:35 +0800
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
Subject: [PATCH v6 9/9] gpio: gpio-aspeed-sgpio: Return error if ngpios is not multiple of 8.
Date:   Mon, 12 Jul 2021 18:03:16 +0800
Message-ID: <20210712100317.23298-10-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210712100317.23298-1-steven_lee@aspeedtech.com>
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 16C9lfEp099610
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add an else-if condition in the probe function to check whether ngpios is
multiple of 8.
Per AST datasheet, numbers of available serial GPIO pins in Serial GPIO
Configuration Register must be n bytes. For instance, if n = 1, it means
AST SoC supports 8 GPIO pins.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/gpio/gpio-aspeed-sgpio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index b3d05fc724f0..191b82a2560c 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -537,6 +537,10 @@ static int __init aspeed_sgpio_probe(struct platform_device *pdev)
 	if (rc < 0) {
 		dev_err(&pdev->dev, "Could not read ngpios property\n");
 		return -EINVAL;
+	} else if (nr_gpios % 8) {
+		dev_err(&pdev->dev, "Number of GPIOs not multiple of 8: %d\n",
+			nr_gpios);
+		return -EINVAL;
 	}
 
 	rc = device_property_read_u32(&pdev->dev, "bus-frequency", &sgpio_freq);
-- 
2.17.1

