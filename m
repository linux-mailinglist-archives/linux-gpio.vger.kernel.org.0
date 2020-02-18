Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05E261623A6
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 10:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgBRJnA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 04:43:00 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36802 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbgBRJnA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 04:43:00 -0500
Received: by mail-wr1-f65.google.com with SMTP id z3so23099239wru.3
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2020 01:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bJLLdBI8eSvzBXxk2WonDxxaPfclFHkWN/z2Zz+tXoI=;
        b=L1flL6XqWU4M7oQtBfIfwPtQhIvdy+VOqidwc+iCrhNvPHGfUWj8VoIwaGBvqG9Ur6
         zcbcVnmJ6IdllG9BUggzYIbB71NMRJ2lkEK9y2nctzjtrtgj+4uMZgFi2iDdHiWi/tAP
         f/f6LFs464cgY+XJnpbqb9bhOulcr4g68CdzFkyrEc4AfLGl5KoKwQfKReOlVRSmhp4s
         kiSvssfv4h1nMnmvQtR2cG74FteQ0497Q4Ji0S+4Dd6MLMcve66TsBeGL4ZwuL/kcrWP
         XJhcn1q8vgmi04kNKt+nsH+SWLU6q9Si334XAJeQqyft2JNDCmjai0bQQZgBIJzcqrUf
         SxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bJLLdBI8eSvzBXxk2WonDxxaPfclFHkWN/z2Zz+tXoI=;
        b=YjwKwAiyeljAZ7InkafJjjbkadJg0o5Xm2qbr4T2JXzB/igZr9UoKYlQI8ifyNtkJD
         mN+Vc/VMhNmbrt44hkdYHcuWTIHrKZQkxlgWoydagP9BBrPJPRoUq5Sx55Wka3nLK3Lw
         eoJNgGGoLoe+YHLqtfcHoDvKGXyNXMhuZdkwurH1iEpsoKLGnlBw5XVvDcxh638fLOY1
         bvow17KBkZlY0YmeYtN3Kx6IzMeDllqOpKU8G+AFuLH2KqlH5EwDCcfcmRE1UVxFftEV
         FW4JCyG3mX6Rsxw9u3o8PcutqSFh3uxRoCUhFFSxLZbjjwvvE2qC5fUj2PIB8L7B86rE
         +23w==
X-Gm-Message-State: APjAAAWW45sv09/klUCigJBexvktvGYEf8ab6/jt+YbM6FFKQS/PRAZI
        2ERGudhDqD3i2cvjsogBqeKlJA==
X-Google-Smtp-Source: APXvYqz1nBzHiRJhepLQ/Wjne/xscI1ej8VHDh7ccYeXeFP7+XHWMd5f+Q3k2fAhEqceDdthDfeLKQ==
X-Received: by 2002:adf:e781:: with SMTP id n1mr29596110wrm.56.1582018977732;
        Tue, 18 Feb 2020 01:42:57 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-188-94.w2-15.abo.wanadoo.fr. [2.15.37.94])
        by smtp.gmail.com with ESMTPSA id s23sm5351095wra.15.2020.02.18.01.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 01:42:57 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        stable@vger.kernel.org
Subject: [PATCH v2 1/7] nvmem: fix memory leak in error path
Date:   Tue, 18 Feb 2020 10:42:28 +0100
Message-Id: <20200218094234.23896-2-brgl@bgdev.pl>
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

We need to remove the ida mapping when returning from nvmem_register()
with an error.

Cc: <stable@vger.kernel.org>
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

