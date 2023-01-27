Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A785E67E53E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 13:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjA0MbY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 07:31:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233215AbjA0MbW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 07:31:22 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954FF7EDA
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 04:31:02 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id m14so4369789wrg.13
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 04:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M8CjuepKqg/M2e9r104+g32dAzdxIZplyTbJV2ebBZo=;
        b=iqxr9FqsaidMPrEaVCVYlkoELWhLll8EXvNyLvLvjamiEVOnwfJ6fUE6RQaNXCIJma
         YkICzzr8KKUs+BiyCxRmNq18mSDpELj5CzoQfyfc0R8RcQuy/zPQ6NjK4FI9zMy6kYyF
         hQ1SsDXTRHdofy1r1ve5SwK58MOULgj/WlR+Re+FxpehxL/l6ZQRXsS4HwvvAsQk8R6R
         liZ98XSjDl8ZslrQQgn25sJqvqpYPRazROQ/S48TjWijA2Xp0aTSurWjercLFyOxOZOg
         V+lOgmUlOzpErrgKX4YPRmk1K3yoMON/AA506gv0wio1ja9GwVJcP+zs/GUWNrFpXbVZ
         fMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8CjuepKqg/M2e9r104+g32dAzdxIZplyTbJV2ebBZo=;
        b=VyTtrrixr4qAOp3n8ViSnQG8k3l5G2kTQtZ5TGbi8TXuyzhZnQfmm3KmHnsO3NIPm6
         4XL4N6jGRulxVznRu53kU45dkBPx1jubwFwIXqe+bIGqQUbncSXS1oL5zek0cMeZV98D
         fd8sn7wKb8F3KYdBnzYUhqBO2FixShlBLw5WBO/DIb7/v6FIw3OvJhj6bJr9xX438Wyn
         HgGhLwC3EJizOARqR+2nj7mBd6S57KmfkePcW/AnOHzAQR7ZMm/EKGzLpZ/pnapnQmew
         zr6xp42etiY0oL6tTDUSclwugUSJq9sV/rYMxYqwuaqFyRNe5ghklnOVDzcBmF2/bapj
         vC7Q==
X-Gm-Message-State: AFqh2krhrHw+TivIIa5c6M+4HFMJ8RRL7nQwpSp1pygADai+QXQHfpzZ
        2dnErUpyOQufFI1wBHnkBsGXXWAvzbrPyZax
X-Google-Smtp-Source: AMrXdXtiHMB2tYFVFGT/0KfCHLVOttqaiXk7SjYZzkljWe1gENLnu9UPl2GGCcbhrs2zWXqVSf2h1g==
X-Received: by 2002:a17:906:4094:b0:854:956:1438 with SMTP id u20-20020a170906409400b0085409561438mr103617805ejj.25.1674822650062;
        Fri, 27 Jan 2023 04:30:50 -0800 (PST)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id va17-20020a17090711d100b00876479361edsm2196078ejb.149.2023.01.27.04.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 04:30:49 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: at91: Tag suspend/resume __maybe_unused
Date:   Fri, 27 Jan 2023 13:30:47 +0100
Message-Id: <20230127123047.933776-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tag the suspend/resume callbacks as __maybe_unused to silence
complaints from the build robots.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-at91.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index cf2423855a80..2b91816ca286 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1649,7 +1649,7 @@ static int gpio_irq_set_wake(struct irq_data *d, unsigned state)
 	return 0;
 }
 
-static int at91_gpio_suspend(struct device *dev)
+static int __maybe_unused at91_gpio_suspend(struct device *dev)
 {
 	struct at91_gpio_chip *at91_chip = dev_get_drvdata(dev);
 	void __iomem *pio = at91_chip->regbase;
@@ -1667,7 +1667,7 @@ static int at91_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int at91_gpio_resume(struct device *dev)
+static int __maybe_unused at91_gpio_resume(struct device *dev)
 {
 	struct at91_gpio_chip *at91_chip = dev_get_drvdata(dev);
 	void __iomem *pio = at91_chip->regbase;
-- 
2.34.1

