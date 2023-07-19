Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7869B759ADA
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jul 2023 18:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbjGSQew (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jul 2023 12:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbjGSQev (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jul 2023 12:34:51 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72B0DB6
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 09:34:50 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b8a8154f9cso7284065ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Jul 2023 09:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689784490; x=1690389290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3Vmf1NOG+ODjCHOgvNL111a44nf8BOJMta6b8HQDok=;
        b=KM4n0tGjZndeHQmSDMlsp7ofZX/LnEb4qirUfsAM54X9Oy82L0EZEHRalHPNnDygG6
         nNx8cSdB5UYvQ/u+WH4OGpsBvnwtGTv2kudZfZ7ShkkiQauK8i3dA2eaFQwDICEyTDiA
         FOTbe5VBBGE6ukx1/g8oMY1+FT6DFqHeDxFS1sLciRyq295/ddfMs1GkCUjXxbtD8B6/
         4mIi3jh018Joh4zJWwGo7ikDeLCV0a2pg+1+judZ1neV+8/tFxzqjyWxWN5qPIE6WWdD
         Ys2+SxdHHuZLUcEIQr3Tehb8+F4be5mG7as7vi4F8o97xpSw8PRqEqxRlBxQJdZokZsb
         X9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689784490; x=1690389290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3Vmf1NOG+ODjCHOgvNL111a44nf8BOJMta6b8HQDok=;
        b=gBetDFbjV09DRAFtiJF9VxMRFrs/5XKyiMMxg6bL94YRlLhO3kOzi5zBPPHCboBYZ0
         oXynPQtVJ+lM0ZW6XB+mgwTXk5V7G3puevnL2v9z3VaO6QRilKVsas595nS+kOXMo3Y1
         grktzZ4qgjsgX7RKU/O3x0QbM5ie4Rz0WA+fpYz91kXU87V4FX7qinQC2mRlvZZBjtR+
         CK/4O0I5QwpogYJJNncJHJD2ShjwkWi9RRbTsw/zViyvO0d4q6verdZSYtjdZe3sm+Rv
         mXvDPgKVcXUFpH+ynPXfldSWOjbhetHRGQE6rQMu7Qn1QHv6nRBwOUZsTGJop358S8Oj
         cMTw==
X-Gm-Message-State: ABy/qLbR/pAaWLHbVWNOTaDi4KQC8oDyrHUIfM5gF8DpfSqgjsss0qgA
        ZaXfp8yVFPaV9NKXLF3VnOPrFQ==
X-Google-Smtp-Source: APBJJlE7hFmGHGL/6El2RN8C/gzU454avPKtZQT3f8vkHvUEcVT/8J+Y90iWWwoCNkPuUZMQ0MWfDQ==
X-Received: by 2002:a17:903:2288:b0:1b6:9954:2030 with SMTP id b8-20020a170903228800b001b699542030mr3456086plh.8.1689784489937;
        Wed, 19 Jul 2023 09:34:49 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id x6-20020a1709027c0600b001b0358848b0sm4199276pll.161.2023.07.19.09.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:34:49 -0700 (PDT)
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
Subject: [PATCH v2 1/4] gpio: sifive: Directly use the device's fwnode
Date:   Wed, 19 Jul 2023 09:34:42 -0700
Message-Id: <20230719163446.1398961-2-samuel.holland@sifive.com>
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

There is no need to convert dev->of_node back to a fwnode_handle.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 drivers/gpio/gpio-sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 745e5f67254e..ab32c952c61b 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -254,7 +254,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	chip->gc.owner = THIS_MODULE;
 	girq = &chip->gc.irq;
 	gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
-	girq->fwnode = of_node_to_fwnode(node);
+	girq->fwnode = dev->fwnode;
 	girq->parent_domain = parent;
 	girq->child_to_parent_hwirq = sifive_gpio_child_to_parent_hwirq;
 	girq->handler = handle_bad_irq;
-- 
2.40.1

