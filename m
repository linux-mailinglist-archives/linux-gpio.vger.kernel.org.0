Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28690161BFC
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Feb 2020 20:55:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729733AbgBQTys (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Feb 2020 14:54:48 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:32847 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729717AbgBQTys (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Feb 2020 14:54:48 -0500
Received: by mail-wr1-f68.google.com with SMTP id u6so21269671wrt.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Feb 2020 11:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nG7/CsSYEjJAJuvHDKY3X2jyLTeRabTAHO5K7wLe+ss=;
        b=Wp87GGdFrmFk3U/BZkSkkgGt/sjUYCkspxOgsVivKDbqdAWSJuc3rEaXm43AIwdpUh
         93/5GDxj8IWKuwTuMovC/U8+voqHbS69hKMSu8CWLA0CSi6JoeNJ2YECnBskVhYxIcuY
         ZKQHYTBWYwuoGihOTyTMlODqMi6EPmIWLgE4JHAosyiowDpZhg5NH6f/vkb65poh/z9u
         hKL5WylgKaKh07RqdR6+KOAHoEG4fqK7qxMzODPuA8luvcm/YUTmbNdv4/lIs1SHGUB8
         xYuDDXwvN5DxbizuG5kcpyNG3m0ZKrI8wgnhhnhK+rvLpiUfoDOzVYsR4InsqRGAFxNU
         sZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nG7/CsSYEjJAJuvHDKY3X2jyLTeRabTAHO5K7wLe+ss=;
        b=LP7K1/6zI9PtmVBENER4xDKMyoWgUqDTtR1zO4ogdMNSDAXQvZzwRwsh5es9oXERe/
         3paQtg+QZxTBjmkghzxm3GlDw6LAlGnFN+I8BsPQCFqEyOjG/qkrkLakElCgKynv+a2t
         MlnTQKXmJe99ux0Dmt2OgFDxihr+ArpXXauWyGcK6bFakPhb2vwuFJhgY+BdHNKMMu6y
         wd3RD8zWf4HPqirILQZ7zsHjJZRPjAV4vdrDqvzIW99jF205zPJuf2aWtbr0t9JPL0su
         QIyoosocU8lv28hmn46gJIDYiGZh8cQUsnqc9U8tZtPY3Z3cb1F71d3kZ5eBdXhDbX21
         50Ew==
X-Gm-Message-State: APjAAAWKkLwDR2Ht7Q+J+FhNsV0hA3Gx80QL1pIlVIt2KNyrkGIdxchC
        ybNyfuZ/3h8rNCEZYzDTDOscr4ssM+I=
X-Google-Smtp-Source: APXvYqyDRdQYeKWizyeEAiB+mDqqQRWrstWkrMThxrx53IRWtzydHMBCpPOCbtyEP6VXja+uLFHrtA==
X-Received: by 2002:a5d:510f:: with SMTP id s15mr23606937wrt.408.1581969287003;
        Mon, 17 Feb 2020 11:54:47 -0800 (PST)
Received: from debian-brgl.local (8.165.185.81.rev.sfr.net. [81.185.165.8])
        by smtp.gmail.com with ESMTPSA id v5sm2679469wrv.86.2020.02.17.11.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 11:54:46 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 6/6] nvmem: increase the reference count of a gpio passed over config
Date:   Mon, 17 Feb 2020 20:54:35 +0100
Message-Id: <20200217195435.9309-7-brgl@bgdev.pl>
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

We can obtain the write-protect GPIO in nvmem_register() by requesting
it ourselves or by storing the gpio_desc passed in nvmem_config. In the
latter case we need to increase the reference count so that it gets
freed correctly.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 096c7bae9e74..b7b1e3194453 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -349,11 +349,13 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		return ERR_PTR(rval);
 	}
 
-	if (config->wp_gpio)
+	if (config->wp_gpio) {
 		nvmem->wp_gpio = config->wp_gpio;
-	else
+		gpiod_ref(config->wp_gpio);
+	} else {
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
+	}
 	if (IS_ERR(nvmem->wp_gpio))
 		goto err_ida_remove;
 
-- 
2.25.0

