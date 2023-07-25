Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7DC760423
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jul 2023 02:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbjGYAkv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jul 2023 20:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbjGYAku (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jul 2023 20:40:50 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3275510F8
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jul 2023 17:40:49 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b8b2886364so25288405ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jul 2023 17:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690245648; x=1690850448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBxigjkHLT26fx4MKMtaVEtMyHCitliLAz5UQAux20w=;
        b=WZLiqvPphZp2WlZ1ZnEhvYWQlvYox6mkBzRwKNXSEaEcIBtHZmJOqFz3y5ctV+C9Ja
         ydG8XHMTHzmxDUulcxrZZZ9vN9aAnJZklNgcDsZ12J3q1hrbRubisRAecjEQMajFYQ1H
         +rMSI1HuUkJERk1ObD9d6InI9b/9wU5tBI9fW054Tp5uVJwTILezeGr/0dUBkd8OXEar
         A8xOEAeazmyF7M1Su2kHHUT9XCm5jJFwMtlxtKyIE+q9ykxKIv3OjgSPulZEm0w7Xf0F
         ECf4CyJzqU5PtGO2XL/g8PjosqYEZdLlyE48bhYBOAqfzoLESAwcXXk0Npq53qdb/pkH
         bXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690245648; x=1690850448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBxigjkHLT26fx4MKMtaVEtMyHCitliLAz5UQAux20w=;
        b=FiVqxhHqP7PWyi0MEKnJcBYdvD/KO1di9luc375Lj6To5BSn3oeWt6n1jPZPjTSY31
         mZQLkO3Auodjc5YtHP6eZ50k8SDgyy2vwX+BxznaQsjhstMjinZk0ac6h2Nqe2AaECUb
         GK8qy1Aao2fw/zOSQVEWvsn+aGD/rpKeQ8WYmQG72QqV8DEUO9ZAtmbIWd+jWW9AO47P
         c5w0i/qlXv8FDk8bE1hByfBT+nmf/fY8WmNNnG1NtMIqhbei/Gmbz9b7X2eCE31KiXRD
         rMMFhw9MKyBTO4ERVWEPJJByuh0KjY3hFwn5Xs31+484Z0e0d4Mxjn6EQeE/2JGIQZpV
         8NoQ==
X-Gm-Message-State: ABy/qLZbGcH6M5h+PmrkEX/rcXe/SS1DVqBdNvVtIpYU0wBY1e8w1oDD
        pDBgkxVwmCDvc68KBLy3ZE5YMg==
X-Google-Smtp-Source: APBJJlHktQtCw+j1j8iMYY1ICtRykWLvEpnHmtnMYvGbQrb3fXX3CsElOJGtSObCOKk714nx3RADZA==
X-Received: by 2002:a17:903:1245:b0:1bb:b855:db3c with SMTP id u5-20020a170903124500b001bbb855db3cmr1053335plh.41.1690245648721;
        Mon, 24 Jul 2023 17:40:48 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id be11-20020a170902aa0b00b001b8a3e2c241sm9528297plb.14.2023.07.24.17.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 17:40:48 -0700 (PDT)
From:   Samuel Holland <samuel.holland@sifive.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH v3 2/4] gpio: sifive: Look up IRQs only once during probe
Date:   Mon, 24 Jul 2023 17:40:40 -0700
Message-Id: <20230725004043.381573-3-samuel.holland@sifive.com>
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

of_irq_count(), or eqivalently platform_irq_count(), simply looks up
successively-numbered IRQs until that fails. Since this driver needs to
look up each IRQ anyway to get its virq number, use that existing loop
to count the IRQs at the same time.

The check against SIFIVE_GPIO_MAX functioned as a bounds check for
chip->irq_number. That is now handled by the loop condition.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Mention the SIFIVE_GPIO_MAX check in the commit message

Changes in v2:
 - New patch for v2

 drivers/gpio/gpio-sifive.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index db480cd7271a..e96829ac731d 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -186,7 +186,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	struct irq_domain *parent;
 	struct gpio_irq_chip *girq;
 	struct sifive_gpio *chip;
-	int ret, ngpio, i;
+	int ret, ngpio;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
@@ -203,13 +203,6 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(chip->regs))
 		return PTR_ERR(chip->regs);
 
-	ngpio = of_irq_count(node);
-	if (ngpio > SIFIVE_GPIO_MAX) {
-		dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
-			SIFIVE_GPIO_MAX);
-		return -ENXIO;
-	}
-
 	irq_parent = of_irq_find_parent(node);
 	if (!irq_parent) {
 		dev_err(dev, "no IRQ parent node\n");
@@ -222,11 +215,11 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	for (i = 0; i < ngpio; i++) {
-		ret = platform_get_irq(pdev, i);
+	for (ngpio = 0; ngpio < SIFIVE_GPIO_MAX; ngpio++) {
+		ret = platform_get_irq_optional(pdev, ngpio);
 		if (ret < 0)
-			return ret;
-		chip->irq_number[i] = ret;
+			break;
+		chip->irq_number[ngpio] = ret;
 	}
 
 	ret = bgpio_init(&chip->gc, dev, 4,
-- 
2.40.1

