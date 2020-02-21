Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31EAD16823F
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 16:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728299AbgBUPsv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 10:48:51 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45460 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbgBUPsu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 10:48:50 -0500
Received: by mail-wr1-f66.google.com with SMTP id g3so2562566wrs.12
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 07:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t4BvL1ZlG+iRqlGHWziElUGj9TJcDWR1qYvsM7P0dRI=;
        b=Qmd6KmmROqKDsZsi7NX//sxRru6kte9rqCs1JCZoZPDg6LrdUwUHtPHDLMoRWV59Nn
         rWTaSliJhyzXfFw92h1vXLGr9A90J6tWZZrJGcIfFg7jZkfyyXJmp+ZgH6qPP4rR/7nA
         Ju7+8oJj8vfVqTyizIZLsk9Qq0DF+DZYOeQxB8TDqWpn1QKmXOLJXfO16MnriTDy+URC
         GqIxWKZeQ2Z2pmNeKOAx4ubkgi1BDEe/7I1KJXbJBeDqo7GXjHoFn6A3QxaaptD8jQp2
         n4A9UH0a/wjfilA88zTGpgAoeH/Agjgcpi7QK7BajjMUF7sqsKw43jjW1j+VMAikR8bF
         8fVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t4BvL1ZlG+iRqlGHWziElUGj9TJcDWR1qYvsM7P0dRI=;
        b=l1bBjDm2DTQVpr+xBMNKgtExK498zEOFM1U8DOsNZrU27I3gSNf1ES5mqg0z4Dj54w
         rf5rqw9Q5fMSyMkdgvySwF47Af+MpIQwUjTPcfXl2ZKk70mtWqL9RxK7YYrgc2jOtbBb
         aVhOKlRNNj2tuQzuo1JTekSDK3J4kKA1jTDk44+EdASRpsv09T7uR5ZKOc/C1K/eYWHd
         PXFPfuJK2zVer33ce34Z9aSTblCE3yklWFd3KjRyDfgFw3CLRyevwggKH32zfLBgtwDi
         oZ1GXlUvS7HxSCt5w1PWwhvV0HFMzTzbi5TUbLm7qsCfoAYcJt04UTWXXLss5eTo5nY6
         fFWg==
X-Gm-Message-State: APjAAAXwQ1KOAZSRPcGAmpKAQmC+M0VhL6XxpESrgVgEP/wgh/iR6GVv
        EN1wYIasPBGmqdc5UMflGFdB6w==
X-Google-Smtp-Source: APXvYqzIbzesr3Ocn/5qxdLjpW6lcX41+ayfLH8l4XpNrxYb95wmn2ZXDGkHP8Jf0SReVu5RGEHR/g==
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr48557796wrp.167.1582300127356;
        Fri, 21 Feb 2020 07:48:47 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id h10sm4267947wml.18.2020.02.21.07.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 07:48:46 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 1/5] nvmem: fix memory leak in error path
Date:   Fri, 21 Feb 2020 16:48:33 +0100
Message-Id: <20200221154837.18845-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200221154837.18845-1-brgl@bgdev.pl>
References: <20200221154837.18845-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We need to free the ida mapping and nvmem struct if the write-protect
GPIO lookup fails.

Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 503da67dde06..2758d90d63b7 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -353,8 +353,12 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	else
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
-	if (IS_ERR(nvmem->wp_gpio))
-		return ERR_CAST(nvmem->wp_gpio);
+	if (IS_ERR(nvmem->wp_gpio)) {
+		ida_simple_remove(&nvmem_ida, nvmem->id);
+		rval = PTR_ERR(nvmem->wp_gpio);
+		kfree(nvmem);
+		return ERR_PTR(rval);
+	}
 
 	kref_init(&nvmem->refcnt);
 	INIT_LIST_HEAD(&nvmem->cells);
-- 
2.25.0

