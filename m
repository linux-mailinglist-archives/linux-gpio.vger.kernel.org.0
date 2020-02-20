Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48019165AFC
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 11:01:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbgBTKBs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 05:01:48 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37908 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727655AbgBTKBs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 05:01:48 -0500
Received: by mail-wm1-f67.google.com with SMTP id a9so1325785wmj.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 02:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tb5z2UeOLZl/UqO+U9twmLjCGpyhePDzuQ8mmkofF+4=;
        b=wzgL+FZrc/X+hzZaF7lsn0YjEKYkeepxbRUqFbY9Zuc606QNHiesAFPsYD9Xxt+yZl
         SPBY4XkW/FfQcIvxmma6uJss/8oIaVkzApUSRkJm/JAb5s+KPtsn59hl+QQPRdIWnmF4
         U5BO+JM99SUUZy2CZG5B8NH04hBL1LIFBNejeo11Z831wsS7Kvxi/TG65UXiPwoH13wO
         fJyIIbSPRb3MtgwU8+b3vTSaxrZQQwxK5P8Vw75xJ6LosdFx/TbcjBe2eVnh+VRXt30P
         xFFo93zGWPSmBBoSq/v358GAMQo1S7mdUwpBDNQVjasa5Jlur6rEA6ncf9gB0UIibDPe
         URhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tb5z2UeOLZl/UqO+U9twmLjCGpyhePDzuQ8mmkofF+4=;
        b=ogJij768dHSFZ/bDhut9iqkyG/fjUocSrZWBc9FQtIvdr2TUzg9E0nd81WSjmgrEge
         TxHqgaGJjLIYwrKR6gygOtp9D7kIl3LzwjxNKvAvSke9DspbKQ3wyk/3hLsaZyCG1Z6G
         NbiHoeJjgVzvgXAQ1hJym/fSJElyUuBtQVUq/xxc4BQfOOFBFG/0OF99+5NfYhJvo0uc
         xdbxp6JZvO+rI2dg5iUICxV1IkZZhsAHuy76dh3mDBtHQ3t7dwbGBZYgTCSniU2+GQYy
         6mrRRjW/pqogQC2SV8fQ6T7vLCSseVomp6SWSU5smsIVwomUZ9QTsmKSu87wQD0J3i+w
         2gmw==
X-Gm-Message-State: APjAAAUREIR9VyPHqQGqOQdbaPJ1kNaNKMg2ABci4xZgcUTPIl2iUP7g
        TpoHeFKwMlNf6g71oK77s6T8CQ==
X-Google-Smtp-Source: APXvYqw0fTH4sWjn5ENuK3wMDJ5nqpMfOAHhHpEdjOffi/ADk7auSN+FgFBOXvarTSOCZvKpHY3whw==
X-Received: by 2002:a1c:1fd0:: with SMTP id f199mr3399912wmf.113.1582192906765;
        Thu, 20 Feb 2020 02:01:46 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-188-94.w2-15.abo.wanadoo.fr. [2.15.37.94])
        by smtp.gmail.com with ESMTPSA id z1sm3663496wmf.42.2020.02.20.02.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 02:01:46 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 1/4] nvmem: fix memory leak in error path
Date:   Thu, 20 Feb 2020 11:01:38 +0100
Message-Id: <20200220100141.5905-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200220100141.5905-1-brgl@bgdev.pl>
References: <20200220100141.5905-1-brgl@bgdev.pl>
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
 drivers/nvmem/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 503da67dde06..948c7ebce340 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -353,8 +353,11 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	else
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
-	if (IS_ERR(nvmem->wp_gpio))
+	if (IS_ERR(nvmem->wp_gpio)) {
+		ida_simple_remove(&nvmem_ida, nvmem->id);
+		kfree(nvmem);
 		return ERR_CAST(nvmem->wp_gpio);
+	}
 
 	kref_init(&nvmem->refcnt);
 	INIT_LIST_HEAD(&nvmem->cells);
-- 
2.25.0

