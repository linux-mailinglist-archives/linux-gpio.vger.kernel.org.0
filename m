Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9984641119D
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Sep 2021 11:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236166AbhITJIB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Sep 2021 05:08:01 -0400
Received: from www.zeus03.de ([194.117.254.33]:54262 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236106AbhITJHR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Sep 2021 05:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=BLeN3aWGvmhC6O
        T7d18ejB5diYjwZjYQYq05PqGUqXk=; b=AxanZlvKFbWYt0LlZfzjao09kXgYzl
        yy30P2Bfey4RoDaqY7/2Jm5wpzdC5zsxzDdA9KD+5UXepw6CMiA424XdMF8m5awq
        7aYYpdxroaOen++2WBcT5sP7uDq7ucZbXmg8CCmk/KXaLi5MGLHYCF3ThDzRtiOe
        pE5btDya/RTpk=
Received: (qmail 2412655 invoked from network); 20 Sep 2021 11:05:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Sep 2021 11:05:24 +0200
X-UD-Smtp-Session: l3s3148p1@37PYlGnMDIsgAwDPXwlxANIWpbLKE1Uh
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/9] gpio: xilinx: simplify getting .driver_data
Date:   Mon, 20 Sep 2021 11:05:15 +0200
Message-Id: <20210920090522.23784-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
References: <20210920090522.23784-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/gpio/gpio-xilinx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index a1b66338d077..b6d3a57e27ed 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -371,8 +371,7 @@ static int __maybe_unused xgpio_resume(struct device *dev)
 
 static int __maybe_unused xgpio_runtime_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct xgpio_instance *gpio = platform_get_drvdata(pdev);
+	struct xgpio_instance *gpio = dev_get_drvdata(dev);
 
 	clk_disable(gpio->clk);
 
@@ -381,8 +380,7 @@ static int __maybe_unused xgpio_runtime_suspend(struct device *dev)
 
 static int __maybe_unused xgpio_runtime_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct xgpio_instance *gpio = platform_get_drvdata(pdev);
+	struct xgpio_instance *gpio = dev_get_drvdata(dev);
 
 	return clk_enable(gpio->clk);
 }
-- 
2.30.2

