Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62241DBAD
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Apr 2019 07:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbfD2FuR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Apr 2019 01:50:17 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40070 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbfD2FuQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Apr 2019 01:50:16 -0400
Received: by mail-pl1-f194.google.com with SMTP id b3so4537174plr.7;
        Sun, 28 Apr 2019 22:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1GWGAD4Dj4+5oSlq68Je+LYnQAj+tRpSapBi4qIorTI=;
        b=lOI+j4UQTx23vyL8CoAcmHGxvJK7KkTe+5oqv8YPWs9BynQy4oU7gZyZEDB8NrjxbV
         rx8J2UVZcmnPN8iXV09neuk2nGXvRhPx6awpGgkb7FZgEdmiywfzH+PePflGiIbFUSt2
         ArP2uWeDTi5p3+ocVQnlHmF0Su7gkyztyML+FELzsYBybceDLcefAE8OnKwtohNaAf8j
         XMbrBm62BzSxZxwloctd4l23PCQjPAu08oqblD/a93yzmWKF7G8UIhN1wXTTuUhfFrs6
         u2we6+FuL5H7Qu3FXKyxJVCs90cIVzx865HhBDKb7AOKxkKqGRoiSzdGg4OYLRP1fZMw
         9kbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1GWGAD4Dj4+5oSlq68Je+LYnQAj+tRpSapBi4qIorTI=;
        b=Q4VIeDtfSw/eiQPwT+Nxzgjdpiw/aMC4SlCE49j5tHMN7t5ZP3+fPWaLmw2Z9V1VNu
         Um9qKSOUmsCMC42SRVlV4zIakQM7Disd/OD+NYX0kC6OpLLFkSh09L1CiqwkLeDUMSRS
         36gKmWO59HpjUsGkOH7Vo9AfOSeIRvh+RMP5mXPVUSPS45sHG8xNeDQsCLCGsxEAZisA
         XX+NgNCuzzkItWacqdwDoTEmbYHePFC2Use7ORB2WKz1/BGhZR8CSiQpmOh/GF9SiIPp
         exb0STcjNBO61mMXX4zzFNGWG0MldpYk2Q85h0r+TUyw/o60umJNFk2fTcbXdbtgW+vz
         qOPQ==
X-Gm-Message-State: APjAAAX7jL3iYxGhw4tjfnikhoYe1yiaqL5I3p8wcMiTyc99PWHsefTy
        6yMU7wy+adc6LIHTOWMeQuhcTqw+Jnc=
X-Google-Smtp-Source: APXvYqy/G9eK+meQhBDQerwx+8gXktQYOnj4wPJICjLfff2HmNUVr7TFpduqaekixPvTeGthh6241g==
X-Received: by 2002:a17:902:bb0d:: with SMTP id l13mr10141934pls.141.1556517015023;
        Sun, 28 Apr 2019 22:50:15 -0700 (PDT)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net. [24.22.235.96])
        by smtp.gmail.com with ESMTPSA id n188sm19613605pfn.64.2019.04.28.22.50.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Apr 2019 22:50:14 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] gpio: vf610: Use PTR_ERR_OR_ZERO() in vf610_gpio_probe()
Date:   Sun, 28 Apr 2019 22:49:48 -0700
Message-Id: <20190429054948.9185-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429054948.9185-1-andrew.smirnov@gmail.com>
References: <20190429054948.9185-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simplify error checking code by replacing multiple ERR macros with a
call to PTR_ERR_OR_ZERO. No functional change intended.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpio/gpio-vf610.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 30aef41e3b7e..7ba668db171b 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -265,7 +265,8 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 		return port->irq;
 
 	port->clk_port = devm_clk_get(dev, "port");
-	if (!IS_ERR(port->clk_port)) {
+	ret = PTR_ERR_OR_ZERO(port->clk_port);
+	if (!ret) {
 		ret = clk_prepare_enable(port->clk_port);
 		if (ret)
 			return ret;
@@ -273,16 +274,17 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 					       port->clk_port);
 		if (ret)
 			return ret;
-	} else if (port->clk_port == ERR_PTR(-EPROBE_DEFER)) {
+	} else if (ret == -EPROBE_DEFER) {
 		/*
 		 * Percolate deferrals, for anything else,
 		 * just live without the clocking.
 		 */
-		return PTR_ERR(port->clk_port);
+		return ret;
 	}
 
 	port->clk_gpio = devm_clk_get(dev, "gpio");
-	if (!IS_ERR(port->clk_gpio)) {
+	ret = PTR_ERR_OR_ZERO(port->clk_gpio);
+	if (!ret) {
 		ret = clk_prepare_enable(port->clk_gpio);
 		if (ret)
 			return ret;
@@ -290,8 +292,8 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 					       port->clk_gpio);
 		if (ret)
 			return ret;
-	} else if (port->clk_gpio == ERR_PTR(-EPROBE_DEFER)) {
-		return PTR_ERR(port->clk_gpio);
+	} else if (ret == -EPROBE_DEFER) {
+		return ret;
 	}
 
 	gc = &port->gc;
-- 
2.20.1

