Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32785164041
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 10:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgBSJWt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 04:22:49 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44891 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbgBSJW1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 04:22:27 -0500
Received: by mail-wr1-f65.google.com with SMTP id m16so27252347wrx.11
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2020 01:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aMlKs3gdMW7rebTvPaScGcRlGsgZL18WOqlk6TNbQb8=;
        b=KpoSKje5FfiNu98vsu3r/t8Upv3HIMO9i1nVhxa+Sd3Mu5v1TJnar7lyRIaUbETrL/
         eLtxANb7hwJ8zsqD+zcaBbbeoT4oc+Q0tnVw5lUlqYyXAGqjV9dK7lHnY9cSsEPh5qq9
         P2b4iq42CJbo6EaHh8sQ2CCTnzGZOhTEgYWl+m1Su5rIx9Qn9nTZuZj8zM/ZzRax1Fr7
         nHCR+Wx3lqATFeNDooSoHXKemaFHfWVhNV7KR9SSzFN3KclbQeHBrDProJwIUKYlxR/V
         iWbtIESBuV02150x/zsEYTMk0ELD5diwtIv56IDtgLWBnA7r10qPkmTyj2/up9OwaJNJ
         0UPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aMlKs3gdMW7rebTvPaScGcRlGsgZL18WOqlk6TNbQb8=;
        b=WV6WQ7Ejyn5pvgwsTF64Bw7xw0tOI8rN6g/dhmZSxlnrDBVPcf7zz+cdwwzVZxGKAC
         Eflm8+fn98QxEUUvMhKl4CpLLRZR2Y5vpsOlDgZ41NrVauO1k+y/lafLmGg/ZU6aoQ1V
         7slPcO0UbKHmMmGQUv03LVcnlDEDqQPjoJnGXwpN57sR6YKtxswDuvGVEGX1VbJboTwp
         UrPdSXYrSvoEKMIgPmg9NO8wtJ15SGbKbs6j2e+jSc7KtgiYrDoVeBPBYRdbcTSLYLVK
         IOZvSr82GbvxQPeUPvh4LIUovIZkPUiefg3KGTXcS4PGfAWPYPTkSsSIf8gWjFMdK/vV
         3hRQ==
X-Gm-Message-State: APjAAAUxkmb0pM9ApZkyAxUHHMOdssRUNWe4OAojrBa6vtujtcZbD6+/
        4v8tWhJTjmQKuNfJxWFEgMcUaw==
X-Google-Smtp-Source: APXvYqz3fDhxnnxXVRK/PmTQxrfOqU0TOGJCeO//rRk9wrbyO4IeR/cNhnPEUW9TjFTxzWyITxyIdA==
X-Received: by 2002:a05:6000:1251:: with SMTP id j17mr36565929wrx.210.1582104144696;
        Wed, 19 Feb 2020 01:22:24 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id s65sm2172296wmf.48.2020.02.19.01.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 01:22:24 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 3/7] nvmem: increase the reference count of a gpio passed over config
Date:   Wed, 19 Feb 2020 10:22:14 +0100
Message-Id: <20200219092218.18143-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219092218.18143-1-brgl@bgdev.pl>
References: <20200219092218.18143-1-brgl@bgdev.pl>
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
index 89974e40d250..4e6daaa2b0f6 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -348,7 +348,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		return ERR_PTR(rval);
 	}
 	if (config->wp_gpio)
-		nvmem->wp_gpio = config->wp_gpio;
+		nvmem->wp_gpio = gpiod_ref(config->wp_gpio);
 	else
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
-- 
2.25.0

