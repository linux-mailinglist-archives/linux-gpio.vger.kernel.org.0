Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD0A6A7B45
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 08:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfIDGNS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 02:13:18 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40289 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbfIDGNR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 02:13:17 -0400
Received: by mail-pg1-f196.google.com with SMTP id w10so10634998pgj.7;
        Tue, 03 Sep 2019 23:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bcvphgpWn7tbDDJiZUCc3MKLcIk2OmmEQ53eSSM6u4w=;
        b=jNQhVRyBcDpvNHDv68xzHndXZuDP2Tf+8P45PkhLYtWd1Axf03Uu2bywcULAhtprhu
         pWhjUsc6c8Qrnq6IyNTkrK8FZQ5PusKpSTPHG0jIwSVGbZv4WgpDkQ7ISPfDWPAbd3Y/
         PColdJktp6/LGSTlwZXBlQbq5QE6cjULI1m1Pi2vqh25fNY57JDpeU1z8IiruHQsGsbi
         U3k4VFvVaY2xF79yiTAGyU1O/tk453hrTMGI1niAB/GTHW+gURn2pKW+djr63fIPdWD5
         RxEm8upNkkx7oldlPwK788cos0dgfZq5C8idLH4sY70NxdFkOMsAYR+HYAkdBlUOLTMw
         z+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bcvphgpWn7tbDDJiZUCc3MKLcIk2OmmEQ53eSSM6u4w=;
        b=gceGhO1YW74uUNKoJhMmam+9I6a9rLAWv4j2aNB+ZpvU2nGpcT2ffy2CQ6kFmvvE49
         bmqcZ4Nf0qfh7Cv8KiYVFznqqbBbCWR8SrNCGIRyoqscw+i6/7HVDLd82f7rAcaX7LG6
         NogAgVCXFtZcaR0BwwEjfkRkGB7syY2O99J7U3myXu/MTi4TxTFqkf+4nTVVDx1LQLA5
         DAxreSf7rcC3TaV5tSuuApnBFrsqQdse/5e5PqmJcUcDpP1izwhWI1Myl/e80lvdFtxi
         NxE6tHzM7P0X8e3CrAJinRcA+fwVys64Pv48oiK60yog7CuqFch/aSIo4DSh306+DTCu
         AqbA==
X-Gm-Message-State: APjAAAXg8zlT7bklbtYAofQeys24Ws3ckxfuHIwQ9VJ0tONPk1BBq/nZ
        D4YVEw88nt94UyGVNvoTq02CsJ0k1oA=
X-Google-Smtp-Source: APXvYqxRXrLMzZIzNt8qZ4xFJrSVL5VeAjzMYAlRa/+lOm18OY5vsAjxtxnph8GHTQK/X7yZQtwGfg==
X-Received: by 2002:a17:90a:8a94:: with SMTP id x20mr3353253pjn.102.1567577597161;
        Tue, 03 Sep 2019 23:13:17 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
        by smtp.gmail.com with ESMTPSA id i9sm42443093pgo.46.2019.09.03.23.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 23:13:16 -0700 (PDT)
From:   Rashmica Gupta <rashmica.g@gmail.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au,
        Rashmica Gupta <rashmica.g@gmail.com>
Subject: [PATCH 1/4] gpio/aspeed: Fix incorrect number of banks
Date:   Wed,  4 Sep 2019 16:12:42 +1000
Message-Id: <20190904061245.30770-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fixes: 361b79119a4b7 ('gpio: Add Aspeed driver')

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 drivers/gpio/gpio-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 9defe25d4721..77752b2624e8 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1165,7 +1165,7 @@ static int __init aspeed_gpio_probe(struct platform_device *pdev)
 	gpio->chip.base = -1;
 
 	/* Allocate a cache of the output registers */
-	banks = gpio->config->nr_gpios >> 5;
+	banks = (gpio->config->nr_gpios >> 5) + 1;
 	gpio->dcache = devm_kcalloc(&pdev->dev,
 				    banks, sizeof(u32), GFP_KERNEL);
 	if (!gpio->dcache)
-- 
2.20.1

