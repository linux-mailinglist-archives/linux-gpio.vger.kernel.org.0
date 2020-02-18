Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA3471623A8
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 10:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgBRJnD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 04:43:03 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35742 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgBRJnC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 04:43:02 -0500
Received: by mail-wm1-f65.google.com with SMTP id b17so2115479wmb.0
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2020 01:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eTkQGJDWHefZVFi7RvLf325NQF5TV4xQSrTAWKaZFp4=;
        b=M3nUbsApTLVf49s8cy3nMBX1nddz/hkUmLgOaxMGMvvDCJ6+R6U9faEHshl8EUoNlv
         tcose4CB7DhkO6IY4d8exh6bM6efO19LG98uJgBf8Mvfp3F5QigRv6qPR4bEMcdrWuhv
         eOImUbdFYpWSCGp3Fa7fYxVhjNlaMS0RjODnskvR8BvKe3eJpyilPS7aI8HaCWaOv7K9
         e+5Cx5Jx3D/ONhhTeqXFYuBU0P6M+ILNTOKCKNzYj43qx1Z+ooWu5Tq0CuKvidZ6pMcL
         VdNOXq0OuTHEZcjfT6cE1WKnPCZXUO2H4MIwtSONsrC8kAxdpS+RxiBYOrYRbTEpH6I2
         jPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eTkQGJDWHefZVFi7RvLf325NQF5TV4xQSrTAWKaZFp4=;
        b=QgWbb59+2ii4mmwQxXrR02XNojjkZ3SlyZU2q5dYQpbJC5nAQLEinBCKORCd6KSioS
         9poH1lO3b555MRHSnzXaocley4tzih95D4ZtNMWfBTwPfMWd3ekXiM7cZuyiLVFWPu/B
         Ns+9VfKprODfYXnf6YOAmLcUT0kaOgw5cS8rZ3Ud1IJBpwzCk3slUrL1kc0WfPnIlxFN
         ooHKYlLSDQlFsN72ExdWqwugAeE63b74E6fuLO+TGYpoJXb2Bur4w99LSZl4KMRiRIxo
         e/GkKYYExrynx1E9XQ4d0UOsPOpqEAOkJn8VUr8YdDJHXq+sKyEkpWMLUjlxqxBIZon6
         v0DA==
X-Gm-Message-State: APjAAAWDwIBKP9cTkWpC+SKxrWkPKFtNRHPmUb9OU7J9GNR2nRG1kBYd
        kXf4oyZgBaYSwrXtDqBzLLDLDJo6eJQ=
X-Google-Smtp-Source: APXvYqxmnog8aASC+4y9wrZ3h35yPUZh6IlfiebH1vUwPi+nhEPx1wxiFrENY24BdELCvaR77onviw==
X-Received: by 2002:a7b:c0c7:: with SMTP id s7mr2198987wmh.129.1582018980880;
        Tue, 18 Feb 2020 01:43:00 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-188-94.w2-15.abo.wanadoo.fr. [2.15.37.94])
        by smtp.gmail.com with ESMTPSA id s23sm5351095wra.15.2020.02.18.01.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 01:43:00 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 4/7] nvmem: increase the reference count of a gpio passed over config
Date:   Tue, 18 Feb 2020 10:42:31 +0100
Message-Id: <20200218094234.23896-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218094234.23896-1-brgl@bgdev.pl>
References: <20200218094234.23896-1-brgl@bgdev.pl>
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
 drivers/nvmem/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index c9b3f4047154..c4a6c044b020 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -346,7 +346,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (rval < 0)
 		goto err_free_nvmem;
 	if (config->wp_gpio)
-		nvmem->wp_gpio = config->wp_gpio;
+		nvmem->wp_gpio = gpiod_ref(config->wp_gpio);
 	else
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
-- 
2.25.0

