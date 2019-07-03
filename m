Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 063FC5E01F
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 10:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbfGCIqG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 04:46:06 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51224 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbfGCIqG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 04:46:06 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207so1307621wma.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2019 01:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8oSZZkf9+HhSTIcXD28cpIDkxUL7Flqx1lOkrHfDaJo=;
        b=Bxa2zv4hc9MjRWlz4xIp+xIhFqVqw5HAZ45E85IwMO6bTgMXNVQM1v07c3Dcmb7DJ0
         YBHG3ZGNkTSfkE6edc9O8h1/PErBPXhmp2C3mUZkFZRenqkyL2wgieJiYQaHEKjplQQJ
         yNrHnyR34fN887a2age1pNQnvaFJ9OxOTchWwYX8cCjEybFbYhylYgU0XtdaXQaRFQcW
         eiLsItMP7gdXYBnB7We1xbfUZ7uQKg/MUvS2nSE4AuCB3hFp3i04yLPa+CNOevzjM1ar
         B9Cu+JpPO0JTqCX53WZ+5D1l8IVG6crKHbE1Lp+uusUdS0yo8K60v8h9zNhh2jrvwaVt
         Q5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8oSZZkf9+HhSTIcXD28cpIDkxUL7Flqx1lOkrHfDaJo=;
        b=oXc6G28Pv9oawQlPoZsHQaKd0QPvBOKi8J5MGNru1NVqrfjyN0T5GWK1HRcslNbsCD
         FBCRmASADhOpb5vBbt9ClpKP8QMroK4xjzPHFIDl8lcSFfqfwkCJ8GE7vgS4KaGyHJbq
         pvnFaBOA68XmMP9S+ZBWVKVq5xNxTIX/1rNRcTOwyy2M5+pNpWTGFNpmoTFKFq2bdcMd
         J9Q0WYxI4S1CDojFMeTBwS2qB/8qx8OXJPQN25Kq+Rw3JuK7ztwm92q290Fz7YNKwnpD
         5HMeKG6hRrECn1ei6XW4ZV8HlNyERodmhbSwtH69IMyYmXq2ujEwhg3OMEEqzhnlNJZv
         lxnw==
X-Gm-Message-State: APjAAAW5Xjs+y9uIz9zswsgz2EsvCxNtOz6Th3t4UPDakOGdVh5ThyNX
        SyWOn5Ql35pfvTGzxswqkf8=
X-Google-Smtp-Source: APXvYqybglpaAkn2C7cQ2/72v2N7w7a8LlbLKknhGEtpLbl2SOTkYO1fp06cIw6zakg1NnVIMv4ghQ==
X-Received: by 2002:a1c:a6d1:: with SMTP id p200mr7234812wme.169.1562143564210;
        Wed, 03 Jul 2019 01:46:04 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id m24sm1715477wmi.39.2019.07.03.01.46.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 01:46:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] gpio: max77650: add MODULE_ALIAS()
Date:   Wed,  3 Jul 2019 10:46:01 +0200
Message-Id: <20190703084601.9276-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Define a MODULE_ALIAS() in the gpio sub-driver for max77650 so that
the appropriate module gets loaded together with the core mfd driver.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-max77650.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-max77650.c b/drivers/gpio/gpio-max77650.c
index 3f03f4e8956c..3075f2513c6f 100644
--- a/drivers/gpio/gpio-max77650.c
+++ b/drivers/gpio/gpio-max77650.c
@@ -188,3 +188,4 @@ module_platform_driver(max77650_gpio_driver);
 MODULE_DESCRIPTION("MAXIM 77650/77651 GPIO driver");
 MODULE_AUTHOR("Bartosz Golaszewski <bgolaszewski@baylibre.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:max77650-gpio");
-- 
2.21.0

