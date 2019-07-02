Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9BDF5DA77
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 03:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbfGCBMc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jul 2019 21:12:32 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43181 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbfGCBMc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jul 2019 21:12:32 -0400
Received: by mail-wr1-f67.google.com with SMTP id p13so713011wru.10;
        Tue, 02 Jul 2019 18:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K7ni9UM28FpD/k7nkpFsWw7aGdJuOADK0tvwXCdIFII=;
        b=XUQwjWyCmFtubExU8PzLfrARKbRw0z6VjMVgtYU+nuxrdym1bhC67W5aqZ0gvRp2RA
         Y4QWsxI5SX8pExi6QbbpNea2gV0wgrrowlSJD162cBQ8hrAlEUwZJ6jda65+Zw33aycH
         Bc8BEhLoPQ1HqSu743IaGvR59natR4WKtzKZlCtC7Oo1YZE9trffuFxEi49iEc8RCe2Y
         W+fdIzsAH5jFAJotXlGdNxgq+fq2UDAASRRPmKbOdyIUXH4UPZygJMzJzTUsedDVNw8L
         cqMGNk56GQfMOrA2HQW6S/tM146UXAwA0LJ6Q/UiLKdYfpaSKxHF2JO1Yo95MzwmMU6h
         oSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K7ni9UM28FpD/k7nkpFsWw7aGdJuOADK0tvwXCdIFII=;
        b=LJaHLe3Vn+1XpKVADLHMKBluSK+yUXW7Hli6ptxRdZjTdso+usVv3CgJgJKFyaIRd8
         1lbYBCzgf8NIEvKbr4rW5vt4p+3VXIYr74C1fPwQT5ciS/PIdahPjxSVCOxq9IkOqEt6
         fVYGY+mRUIP6JhGvAW//eQiQQ9w/OXfbjngiFkVe2RwQ0s+LPhlhiSiyAXPIUrSWhEsk
         JbjTsBBS6teO3crPOFbxsDipRcz+jtRqcXNA4iWdkNYlULXlQN0oDC1UFYfUiTdd/q4V
         eLzIfwJaSGY4n+fXaXri3ogSOC5tPEn4poQishdOWYKYacPTlTzNXVJAxEmfRPggfMVL
         l6Rg==
X-Gm-Message-State: APjAAAXLek65CEn2UIrzNa9u4liaV74D7NfLYcVpDYO6JcNkHUFn951W
        2PGgBUTdLIYhYH1mt1xYe5TB1Qy/
X-Google-Smtp-Source: APXvYqxuWTZ6QLovwtI+F2WWdSLMlSfZ3cTk0wHb/ZmTptUJUfUzP7v+CkTEDhHX8agLoms9Ecm8CQ==
X-Received: by 2002:adf:e9c6:: with SMTP id l6mr4014wrn.216.1562106790356;
        Tue, 02 Jul 2019 15:33:10 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133D62000A09003363445C98E.dip0.t-ipconnect.de. [2003:f1:33d6:2000:a090:336:3445:c98e])
        by smtp.googlemail.com with ESMTPSA id 18sm253513wmg.43.2019.07.02.15.33.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 15:33:09 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     blogic@openwrt.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org
Cc:     dev@kresin.me, linux-kernel@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/4] gpio: stp-xway: improve module clock error handling
Date:   Wed,  3 Jul 2019 00:32:46 +0200
Message-Id: <20190702223248.31934-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190702223248.31934-1-martin.blumenstingl@googlemail.com>
References: <20190702223248.31934-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Three module clock error handling improvements:
- use devm_clk_get() so the clock instance can be freed if
  devm_gpiochip_add_data() fails later on
- switch to clk_prepare_enable() so the driver is ready whenever the
  lantiq target switches to the common clock framework
- disable the clock again (using clk_disable_unprepare()) if
  devm_gpiochip_add_data()

All of these are virtually no-ops with the current lantiq target.
However, these will be relevant if we switch to the common clock
framework.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpio/gpio-stp-xway.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index a3326255ce3c..b31e08f84681 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -256,18 +256,23 @@ static int xway_stp_probe(struct platform_device *pdev)
 	if (!of_find_property(pdev->dev.of_node, "lantiq,rising", NULL))
 		chip->edge = XWAY_STP_FALLING;
 
-	clk = clk_get(&pdev->dev, NULL);
+	clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
 		dev_err(&pdev->dev, "Failed to get clock\n");
 		return PTR_ERR(clk);
 	}
-	clk_enable(clk);
+
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		return ret;
 
 	xway_stp_hw_init(chip);
 
 	ret = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
-	if (ret)
+	if (ret) {
+		clk_disable_unprepare(clk);
 		return ret;
+	}
 
 	dev_info(&pdev->dev, "Init done\n");
 
-- 
2.22.0

