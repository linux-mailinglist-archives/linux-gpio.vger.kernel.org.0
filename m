Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60C3473E662
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jun 2023 19:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjFZR0P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jun 2023 13:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjFZR0O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jun 2023 13:26:14 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A5E6BB
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 10:26:13 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3420b22365fso20248505ab.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 10:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687800372; x=1690392372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jAa9/qyqoIOUnYhC99LNfoissbeamAdrpMuCz28sW8s=;
        b=H7zijVZ9COkKnC8EPRrq0SG3bgmwwD4JD/ym7AGril6FAWmKwYPiTnmRm+uTCXiYrV
         3Cnd/INrDqhDJQToc37RsQd2bw0lUmbz+L+2LIur1mo3m0/akE1hqdtuxAyNSTPgqyD6
         Vyh/o6lP7U5Hh0EVqcqKGizcYaT9V4qIO6tg06VvRIMpBBaEYlQwLXZfbjOGfAteYyuG
         imlXyaxx5bK9XHbXUYCPhZsaXZri/2yMPFRMyTbKAjTGKAY4H5H5Y15qjeILlxgzn4fD
         3QpHy9j4aDe8fF+A+ja630+GEGHBJ7Svrc4nFrTZ3ZM+Fk8bmf+kVQjFHeNEtDpFG41H
         ViFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687800372; x=1690392372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAa9/qyqoIOUnYhC99LNfoissbeamAdrpMuCz28sW8s=;
        b=h0ontRZhlGO86OQ7Nn8OlDpHVwIYiCFlNnQ4MR9niE7YhXzUE2u/AHMVt7jaWFoWo/
         WfSQlub0UPIdVUgq8JZKFfTYxdZQszJmBRaFENZXZy4wsST5NElTVCOXw1CHxntesLlf
         zHi/hnvpTjrjVuIitU2KxhWX6Ioie70Djc9ed7HkGuRM9pLai01ErKngbTMf6+zp8AdE
         VUTedM0tL9Tn9dYiYdfuiCXmGfCRBTvwNuLnMravayRkgdr2GrrxzYWqLoTKi+AweRUA
         1oGjm29fzViDe3Q1+DOr6l+89Zaxehrg9AVlPCE8JDnPH/W2cz1YY17RkwqUC9FfeRbb
         fxgg==
X-Gm-Message-State: AC+VfDw2HeQMMJtBkMDWYQFwE8KRZV+Kct4AsxpzeSi5zcaP6Ro7i4Oq
        yAojNN8QIF1VyIaD+Sfo1yKQvw==
X-Google-Smtp-Source: ACHHUZ6RhZwQfHzkxUhFwFFWIzRQlw5p95P6F2U2d7QYXTJkZAt/nhSYpUch6hK1aPN88nc7hZ+DmQ==
X-Received: by 2002:a92:d30e:0:b0:340:72d1:69a with SMTP id x14-20020a92d30e000000b0034072d1069amr31425660ila.28.1687800372473;
        Mon, 26 Jun 2023 10:26:12 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id u15-20020aa7838f000000b0066a6059d399sm4026648pfm.116.2023.06.26.10.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 10:26:11 -0700 (PDT)
From:   Samuel Holland <samuel.holland@sifive.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Samuel Holland <samuel.holland@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH] gpio: sifive: Support IRQ wake
Date:   Mon, 26 Jun 2023 10:26:08 -0700
Message-Id: <20230626172608.2978505-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Each pin drives a separate interrupt in the parent IRQ domain, so there
is no need to set IRQCHIP_MASK_ON_SUSPEND.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/gpio/gpio-sifive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 98939cd4a71e..c2653313f3a2 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -150,6 +150,7 @@ static const struct irq_chip sifive_gpio_irqchip = {
 	.irq_disable	= sifive_gpio_irq_disable,
 	.irq_eoi	= sifive_gpio_irq_eoi,
 	.irq_set_affinity = sifive_gpio_irq_set_affinity,
+	.irq_set_wake	= irq_chip_set_wake_parent,
 	.flags		= IRQCHIP_IMMUTABLE,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
-- 
2.40.1

