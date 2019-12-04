Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD86A112F60
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 17:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728536AbfLDP7U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 10:59:20 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34405 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728344AbfLDP7T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 10:59:19 -0500
Received: by mail-wm1-f68.google.com with SMTP id f4so5163210wmj.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2019 07:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mslRHHSp/cuNnBW29h3HN5M5/Ygh6sAx6mKJrlS5yNM=;
        b=sp0X1oV1/HpAXBOrL6SJD4ucAhA5yp4me4sYOvskJPG+WgtnSicq1AE7f3IRNCR+nz
         ubKCiY+s0tqSxNQgr6Mrh0OVhZHGO8Po836TRyl/IIoU/AeuRAO3GZc+ygoozhvY27GD
         ni8goZVEGJLE+3itAVgt76mf4jek0kJtsugsSgBJJ/AvlY5pb0WhvwEorznNM8AQ29yd
         6XGuKGzQKKuI2/f1H5aZmT28BB+UDMVzdbqU9DgeidzeWF/xGh41zroMDp+8GRszlS7r
         b7QoL8lwNWAys6rB8vF3nOXMPWLMdJcimM/56HDYoF+AjAdgIQqeQpXPO7GXxjY4sXiE
         t28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mslRHHSp/cuNnBW29h3HN5M5/Ygh6sAx6mKJrlS5yNM=;
        b=TS604HgiQtUxWNfPyWcK38cbiBt0d8krVQd7LEjHQorgqiDDO7KESBOxsLKWghFcCz
         AYdzI8ZEzwbv/4CAqAjfWaH2JyWkpFDiZ04QkrRddjy583v90/X5VVVEEhw4Lw2szGeq
         RAr4BsFBxaAl04X3+1aMeJTszs34xNWq3YKmwKPQWivEYPPNseQpySc3Uo/sAy8hRXec
         mXZQf5AlFle94zuNpVqnw+sblnnX5GhQkSTcbw6hc3Bm5Y1SpL/gEf+W6X+WpX/fnz+E
         yZJrDgg4jhxfl4gM38AbyJXFG6uVjgSj25LEg1uSsb2w0iQi42Y2YCap2hRDSqcj35Vv
         slog==
X-Gm-Message-State: APjAAAXQQ34vhmr6qUhkwR75OXQpbPXPzpQDPzUdjXW11cebmDaubg5g
        LHxEBmhGRSV1DBTQu1vllDbzDw==
X-Google-Smtp-Source: APXvYqxUV3B6D/kjwYQmFXK7hNpMMPQEwApjdkfCje2gxgeJX1iREqHUEw1ZPy6Y5EnCjGzk2JiU7A==
X-Received: by 2002:a7b:c392:: with SMTP id s18mr153127wmj.169.1575475157805;
        Wed, 04 Dec 2019 07:59:17 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id u18sm8640508wrt.26.2019.12.04.07.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 07:59:17 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 01/11] gpiolib: use 'unsigned int' instead of 'unsigned' in gpio_set_config()
Date:   Wed,  4 Dec 2019 16:59:04 +0100
Message-Id: <20191204155912.17590-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191204155912.17590-1-brgl@bgdev.pl>
References: <20191204155912.17590-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Checkpatch complains about using 'unsigned' instead of 'unsigned int'.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 21b02a0064f8..a31797fe78fa 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3042,7 +3042,7 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
  * rely on gpio_request() having been called beforehand.
  */
 
-static int gpio_set_config(struct gpio_chip *gc, unsigned offset,
+static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 			   enum pin_config_param mode)
 {
 	unsigned long config;
-- 
2.23.0

