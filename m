Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB7D168242
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 16:49:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728487AbgBUPsz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 10:48:55 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54261 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729217AbgBUPsy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 10:48:54 -0500
Received: by mail-wm1-f68.google.com with SMTP id s10so2273259wmh.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vKMOxyJCt3REeokpewoFxr3MprF3IwK5sef8rIuxxMQ=;
        b=Y3lDq82otxFk1dqt1cCgRQ641wPz1qeZ6rtNOzeXPPi1P+MMOApvLh2jT/xp5t1Toj
         LtwRWOBZ91kldJcLeIqjFwAJD4oiMfh/L2qR5mR0Qk3yde0F7krR6PGl+9NYmzmfsW1M
         r1YgcVbob6eXGRs4jzn89WTOl0ZUoj4IsWKFFc+/S43BuPdn+QXPHaezhxFFCzj74GEB
         f+WcuH1RQoP959hR99K+WKUxgUexYFrZQDm2OwbqFRJEQQUuu7oh2KrMXKgIDpWea57N
         54qE/YozafBvJxOLrvPYAqwhOL+bSDozuoo1DcX10Au46MlKlRDp9+dGQZ+6ngQLcRiK
         ZGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vKMOxyJCt3REeokpewoFxr3MprF3IwK5sef8rIuxxMQ=;
        b=iC9IylV2qQSfkXfbLl8vYJ2aRZIYQfmWKg6I8a+LeLRG2hCdKYG/8Id8djedYAqLAV
         nuyDvnou1aBRCENe8ZyPOgH3iKIrhNbd7YYzDCOPitPaHBsIEKg1abSomYLx/gCOTJm4
         HHJ+Qn8M+VvR2m4AolaRSXPzDFMvngBDhGNoFpS4o1osqs6b6xbKAO6WC4fkmXOIqKZz
         ojLOukUQs/LK5FKplt4G6Xz7LT8hF8Ewf9RcXts/kXDqDeaMclsXqRjCZ/Etzx4z/ej5
         fojJ9LqNen3EQNIxVydGM6UuvGq+t3PTKqT+Hti6b+htkoSNXkBEXdm4czxAGfeO6LLh
         3kuQ==
X-Gm-Message-State: APjAAAVdDFWI5OygbSqgtfOuWPO8oXkR3lsElbgD3AuT/N1mfKCWrJgB
        tIGKa96HQej4ab3k1FmvOa/4EA==
X-Google-Smtp-Source: APXvYqygWqoO4iocVUnQ7IG/n/AV4BRCEYimoh/V9meXwbtdzSH072KLZAihSncKmBgLc0oh+YrICg==
X-Received: by 2002:a1c:a1c3:: with SMTP id k186mr4502548wme.179.1582300132694;
        Fri, 21 Feb 2020 07:48:52 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id h10sm4267947wml.18.2020.02.21.07.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 07:48:52 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 4/5] nvmem: increase the reference count of a gpio passed over config
Date:   Fri, 21 Feb 2020 16:48:36 +0100
Message-Id: <20200221154837.18845-5-brgl@bgdev.pl>
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

We can obtain the write-protect GPIO in nvmem_register() by requesting
it ourselves or by storing the gpio_desc passed in nvmem_config. In the
latter case we need to increase the reference count so that it gets
freed correctly.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 2758d90d63b7..4a4ef2049022 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -349,7 +349,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	}
 
 	if (config->wp_gpio)
-		nvmem->wp_gpio = config->wp_gpio;
+		nvmem->wp_gpio = gpiod_ref(config->wp_gpio);
 	else
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
-- 
2.25.0

