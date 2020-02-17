Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5D8161C01
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 20:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729646AbgBQTyp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 14:54:45 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36240 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727332AbgBQTyn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Feb 2020 14:54:43 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so552030wma.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2020 11:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BYR9M1clfYHE1v0ARZeaLz8iyf2HR4xKCefQlA8DsFQ=;
        b=gs3t2/TyF6gF+0zoSvNHpJqpWvhb+OJTbYK+Rimp36zPn+Um3KJI7jU6an+eaF7C1g
         6bsumWdRMHjnuu8oDRtMjAmZNmF/iEZdH8FIQIDkZW0GoN1Ni5mJC/WdxAzKosceidc9
         3KClzAWGMg9kM5UDMuCWqhF7Qya3RyFEi9tCZUhzudbH0PYxgQ3+LYPEgQWWA0OT+UrJ
         m1VtSJwQTkRE3jKrGldEeOzw/QHMImAEvgHNLITBFtM2+0TDCPKaWMdEZYXRfI/sL2nI
         lN+tYgD7vqesBkEHp6/BgDbCgcnE/c3uLWTbIAheHZ0gGv4fYRQ6leWLrsVe6x72HxBB
         RkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BYR9M1clfYHE1v0ARZeaLz8iyf2HR4xKCefQlA8DsFQ=;
        b=EOxGaDwv7/qtifAPgZbHdJa1tw1N5Hsv51D8IhUh/G5ovjsb3WaaOpoxh+YC5q7Nm2
         RL++mMBwhSU6G2o13KspT24+jve3SC27mrvHkDisetfCDC4grmuzz6r7MUvSogrqBIpl
         iFK7QCcwJyg/13LkLrHyGnob//DG0b2WuMGTHp45efobZYNI7NM1HZJ8PpXCj6opeHb1
         UMyfEljgpfYXN2oWtZXPEngpSrhb7pTMGb8MLN3RTfA2dRc8EXJaG+s+3MqgkaRewzQt
         rhpbKaePlLrG8T+uhu3GWeNm3ld7rxtcBWnFZUSLTwahEuF7+mgfn7AkpSLHlZLoOQYp
         991w==
X-Gm-Message-State: APjAAAVeB/oURMcJlOU2o+3HN0mbRLkZ991luldKCHNY/gG8l0iN6QQa
        HCvytHeQ01DBDUQVIIpNx3kQyA==
X-Google-Smtp-Source: APXvYqzCRYEvCvyjC143+OuW9Wo/mGyHqbMmxdGTb0RSKx1nDwE2TWGL9MQamtoIoyVcxmyNjrfDjg==
X-Received: by 2002:a1c:a553:: with SMTP id o80mr598696wme.94.1581969282023;
        Mon, 17 Feb 2020 11:54:42 -0800 (PST)
Received: from debian-brgl.local (8.165.185.81.rev.sfr.net. [81.185.165.8])
        by smtp.gmail.com with ESMTPSA id v5sm2679469wrv.86.2020.02.17.11.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 11:54:41 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/6] nvmem: fix memory leak in error path
Date:   Mon, 17 Feb 2020 20:54:31 +0100
Message-Id: <20200217195435.9309-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217195435.9309-1-brgl@bgdev.pl>
References: <20200217195435.9309-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We need to remove the ida mapping when returning from nvmem_register()
with an error.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index ef326f243f36..b0be03d5f240 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -353,7 +353,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
 	if (IS_ERR(nvmem->wp_gpio))
-		return ERR_CAST(nvmem->wp_gpio);
+		goto err_ida_remove;
 
 
 	kref_init(&nvmem->refcnt);
@@ -430,6 +430,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	device_del(&nvmem->dev);
 err_put_device:
 	put_device(&nvmem->dev);
+err_ida_remove:
+	ida_simple_remove(&nvmem_ida, nvmem->id);
 
 	return ERR_PTR(rval);
 }
-- 
2.25.0

