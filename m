Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59C15759ADF
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 18:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbjGSQfC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 12:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbjGSQe7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 12:34:59 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28DED1FD6
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 09:34:55 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b8ad907ba4so42629675ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 09:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689784494; x=1690389294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKB5qFFhQfmSiP15ZwnXAvSg+5ghnoWFBwWWZp0+n88=;
        b=Fzuo/o3DY4Sh5Qgsn7fB60HWZEm8qGCWfWwgkORpj1Uwy42N1moshxGGiv1RhmQuTp
         VFcCfw/xlYoOkI+FAmpTbSI+DdJ3jReOTIqODtR6XdLpfN4N3VIlGaXC05aJ++w/kGpe
         RFfW+Knv7wWpKU6Uf+gGYkSmiI6jzgU5UOUZtFnFqL4zJwQu2KHE44WrbnPWBRsHJayd
         lLlQCVrl3BPnXJfJPEwUsEMXpma82wUKYiTejzT4M+7yDWyvaf7lKyBAGA2kKf1CVG7H
         szfCCXrfRq8DHlKaOXiAAkaAi7Wl+TDX8tVsZkev8j2LX4Eg3R9xUjcQ+V9dfZ9Vc3gT
         j1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689784494; x=1690389294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKB5qFFhQfmSiP15ZwnXAvSg+5ghnoWFBwWWZp0+n88=;
        b=Gyh+6UfJXx1To9HNHW1ebSypD/ryxcSmvmHfJJWitTiS85jLAelQOIZPWts3fv0/hi
         4lr0NTs8AV7iSwSILdRm0nG3aqHRE/oGRaVaLa0CeJ1uHwBNBUY3wuKcptuCfl0pLw9N
         7beC79o8r6xdFkNf9qiN0BYuJh4YPAzS4MPdHlUeOAdUVjyNIp8wAp1883s+CoUiiO87
         FUfLoWMJSKsS5HA3FhiDCSBw9yghbbI8F3duMr9WKMoAcw65wGAscAO/WATrRoD7Ys6L
         yZWgMvmXWslbvEQfQUYtoytUbgspegN+mQaAAVfi5pYKUqi4Fkwpb79vMkI4ZUZ8+els
         jVVw==
X-Gm-Message-State: ABy/qLabnBp/icxs4X9vYerV3fQadxVmyTZdMhrOZD+SDylXJg3oN07X
        0LLDzY5zRDX9kOVI8XNhL3SqMQ==
X-Google-Smtp-Source: APBJJlEr2JhRNQslVvd4bf3YmcEKWm1LZVkXGrEjXE4E1ojG1uF3du72OmlgajKo9Nox25sMHDZYHA==
X-Received: by 2002:a17:902:7589:b0:1ba:1704:89d3 with SMTP id j9-20020a170902758900b001ba170489d3mr14046930pll.54.1689784494582;
        Wed, 19 Jul 2023 09:34:54 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id x6-20020a1709027c0600b001b0358848b0sm4199276pll.161.2023.07.19.09.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:34:54 -0700 (PDT)
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
Subject: [PATCH v2 4/4] gpio: sifive: Allow building the driver as a module
Date:   Wed, 19 Jul 2023 09:34:45 -0700
Message-Id: <20230719163446.1398961-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719163446.1398961-1-samuel.holland@sifive.com>
References: <20230719163446.1398961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This can reduce the kernel image size in multiplatform configurations.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

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
index 46a42109d6f5..eacd67982de0 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -258,4 +258,8 @@ static struct platform_driver sifive_gpio_driver = {
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

