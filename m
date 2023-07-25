Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72531760428
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jul 2023 02:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbjGYAlA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jul 2023 20:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231262AbjGYAkx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jul 2023 20:40:53 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1FF172B
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jul 2023 17:40:51 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-55fcc15e109so2441136a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jul 2023 17:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690245651; x=1690850451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/7J7W9/s0ktyQK4BY9a6mNX04p7bPwNQDg3KLPOfkM=;
        b=P5bkF8Z6mF9jk7ij0sXr0gmtxntUZIEPfvXkrIF5IsH4hLgRx7uXgVHGdw5At7g9qd
         EENZq1PvE3GQ3V7NfQaS0zxIPvN8X8ucMSct1aL1gpKJdet4RL1Di4ZgSgUPId7oBV9H
         2q8aiXT314DQjnF0Fp32oaIGuTNVoR4SOdxUQsSjNcmCqNb+LYM+L099s9dMFdO6FnCS
         NblA5iwYPRSHpSu4CuxDq/BJR/twkmJM8N00cQr4K87FOhR9jLffcoUTfc237osg2sqQ
         JvvfkMyM4pB0FOC1Z38yOrvxbqlqzoH/8xa7xdzUZjPxlQeQfZQtfmFs5GvK3j+7AInY
         WUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690245651; x=1690850451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/7J7W9/s0ktyQK4BY9a6mNX04p7bPwNQDg3KLPOfkM=;
        b=QFqMMpmS6PQSy2kW3/tEFHFU/d+Xp1NQB836GnlpUVEiQAa6zdPxIQZUDREkR3E9MR
         AfzMGlVrhEH8ElCkYGRjYA5WvHplne7IMG/4ljsiCjzUIJ/4moDwHEPZ1rRdUBldzS7D
         v0+KVF6/qXYLMrGvvWYIJe3nlqzsFAMOl3xj841t2QIbjkX6c6CnpIb9CFhjEu9+e18/
         X0ObD3qzq/S8uEklVtsRu+pMKpaXheLTtkYO5/KX1024AgiyMFmh+J0XpbwVhwLnI5nJ
         2AkY0XNc56peJ8nJdRwanjmPOzAlORsnzuXv9p3c7d53XgFcuscg3BJJ4DAccv2SUaoU
         Kcxg==
X-Gm-Message-State: ABy/qLa3TMQHXTcFMGHVInZq05NAK1f1nAxcYp44oklKcjY1Pa3wb5Fv
        3hac80DOBrTePc1j3wZyzz4OMA==
X-Google-Smtp-Source: APBJJlEPq4iZZyiipTRgAqIyXg56eqA2/VJM2xXD73NNrvuCdDF9GyOVyXgg+dj8FpJWzMor2BH8OA==
X-Received: by 2002:a05:6a20:7d86:b0:137:9622:17d0 with SMTP id v6-20020a056a207d8600b00137962217d0mr10548315pzj.58.1690245651000;
        Mon, 24 Jul 2023 17:40:51 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id be11-20020a170902aa0b00b001b8a3e2c241sm9528297plb.14.2023.07.24.17.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 17:40:50 -0700 (PDT)
From:   Samuel Holland <samuel.holland@sifive.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Palmer Dabbelt <palmer@rivosinc.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH v3 4/4] gpio: sifive: Allow building the driver as a module
Date:   Mon, 24 Jul 2023 17:40:42 -0700
Message-Id: <20230725004043.381573-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725004043.381573-1-samuel.holland@sifive.com>
References: <20230725004043.381573-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This can reduce the kernel image size in multiplatform configurations.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Add MODULE_AUTHOR and MODULE_DESCRIPTION

 drivers/gpio/Kconfig       | 2 +-
 drivers/gpio/gpio-sifive.c | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e382dfebad7c..1a8e8a8c85d6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -564,7 +564,7 @@ config GPIO_SAMA5D2_PIOBU
 	  maintain their value during backup/self-refresh.
 
 config GPIO_SIFIVE
-	bool "SiFive GPIO support"
+	tristate "SiFive GPIO support"
 	depends on OF_GPIO
 	select IRQ_DOMAIN_HIERARCHY
 	select GPIO_GENERIC
diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 3545bc0fad13..bbc58ef0b6de 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -266,4 +266,8 @@ static struct platform_driver sifive_gpio_driver = {
 		.of_match_table = sifive_gpio_match,
 	},
 };
-builtin_platform_driver(sifive_gpio_driver)
+module_platform_driver(sifive_gpio_driver)
+
+MODULE_AUTHOR("Yash Shah <yash.shah@sifive.com>");
+MODULE_DESCRIPTION("SiFive GPIO driver");
+MODULE_LICENSE("GPL");
-- 
2.40.1

