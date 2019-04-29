Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15312DBA9
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 07:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfD2FuO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Apr 2019 01:50:14 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36125 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbfD2FuO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Apr 2019 01:50:14 -0400
Received: by mail-pl1-f194.google.com with SMTP id w20so3925873plq.3;
        Sun, 28 Apr 2019 22:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ex/wtvFh2LFQHAMf1Hh9PK5P1Lhyqf0a9tTK9sge9xk=;
        b=CBU82FhgablygK35UzOKv2SgpPcjcujsSP/UUsEGT/SMOMRi9MaKMzA6+oDZeV2W+w
         xmgVaqaWs4mN13kqw0q7JFsg8Kr6w9oqxIKvUljNzyy6aM/bqu+N7twvIvp0Pf817soR
         Syoi2M+sGB/T7FwoiETpJRvTX17KHB1OQFGf5sjSP9oAfZQY8LoX5NRBch7FL/mK0tC8
         jqPbraWZysNQocjzRMS2PSnhr7uh2te1ZWrvh1m/DUt7DBaplNjVc7QdjmD+m3hwHykp
         BQIQJhgjVru3CsHQJuVbOZMMeCWj/GSEVz1PM04Bbiv3g9hq1C2lw0jUkRIvjQrgg1vn
         AEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ex/wtvFh2LFQHAMf1Hh9PK5P1Lhyqf0a9tTK9sge9xk=;
        b=DoT0G5IwkipfQXlTY0gWSFxtPmt6dA6FSwNfCHAMQEcnVy7Qe/c3tpNWxpWFlNZqrc
         mmhdv0ion4MQjoqyYZrq9MMI7cvh5cQ6wTTthOhNN/WMF8AzqoQszLvwNxpLknW4MjT6
         ye6/GcTwKCMISW/+frqdqsNxe+hVL6rAKJ0adt0RzXxXJ07DX375wRql8HWgnBI/4kLF
         7930w2VMYZksCumQwbWkdH2DS4EQNWuNRVBaDyDTdE9V266D0DOI7C7D8oMajfgipggX
         sQ5PpxQJtLSmBEt6e/l4z2ARV2fGJCIpzGmILmxJwnXJUG8+EbhtzBhKCysJMiECbvH2
         /aSQ==
X-Gm-Message-State: APjAAAWL07RA0zh8IcCCO8kP3mrrBUzLHQR/n5A6irzHlKq+Ms0o2/+R
        zG3n8BrRPehqwyqLJQSY9wAsqd19mbM=
X-Google-Smtp-Source: APXvYqz/9SFVYQabsBysw74iG7onoc3zdKpkL2tocCsMGiOf94ZphQFsikUupJnMT771LF1Kw6O54Q==
X-Received: by 2002:a17:902:a988:: with SMTP id bh8mr41019202plb.243.1556517013668;
        Sun, 28 Apr 2019 22:50:13 -0700 (PDT)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net. [24.22.235.96])
        by smtp.gmail.com with ESMTPSA id n188sm19613605pfn.64.2019.04.28.22.50.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 22:50:12 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] gpio: vf610: Use devm_platform_ioremap_resource()
Date:   Sun, 28 Apr 2019 22:49:47 -0700
Message-Id: <20190429054948.9185-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace calls to platform_get_resource() and devm_ioremap_resource()
with newly added devm_platform_ioremap_resource() for brevity. No
functional change intended.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpio/gpio-vf610.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 6f6558715b88..30aef41e3b7e 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -242,7 +242,6 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct vf610_gpio_port *port;
-	struct resource *iores;
 	struct gpio_chip *gc;
 	struct irq_chip *ic;
 	int i;
@@ -253,13 +252,11 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	port->sdata = of_device_get_match_data(dev);
-	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	port->base = devm_ioremap_resource(dev, iores);
+	port->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(port->base))
 		return PTR_ERR(port->base);
 
-	iores = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	port->gpio_base = devm_ioremap_resource(dev, iores);
+	port->gpio_base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(port->gpio_base))
 		return PTR_ERR(port->gpio_base);
 
-- 
2.20.1

