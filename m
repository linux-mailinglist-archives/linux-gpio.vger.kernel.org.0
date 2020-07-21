Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB8C82282C2
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 16:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729972AbgGUOvE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 10:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729935AbgGUOvD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 10:51:03 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6457CC061794;
        Tue, 21 Jul 2020 07:51:03 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f18so21544118wrs.0;
        Tue, 21 Jul 2020 07:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xp7MrF4XqRYCtNzDak/eijis8OGr4rRuAPPHAibygjQ=;
        b=UD4D1oaRx/25yMpQFK+/vkWVLLKJohJZ4HfD2g58+rlXPzEb5nHZ/s2b6/nJkR2GIR
         cRiop0oCYXEN4SlfyAkJ2MbERLGWDk5jdmEVQy9Gv1kR+lE77KJizGQz4A/FGtt2I/is
         9jejKGI8CD51XfL4aoKzY4RYHv95zrTJI93CElt47uri6IGQxcLlNdUwG4V6YCXlU0nP
         T1lvJOuNIrHht4yxGb4LYNs5TAcZxp1LP2yWGDcfPjNCEekDvHdvinXhqSLD2Jrd5xKr
         cLgQSy48up21KXbS8PhhFgzt04CLTsiq52bwo5s/2CtlhNLx6JtRRWHfjMXUcl3EVG1g
         /ikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xp7MrF4XqRYCtNzDak/eijis8OGr4rRuAPPHAibygjQ=;
        b=MDRIZMgfHrALottVKsQ+Q89fjR25uFVUoLoK2y+F8n97301iUKzBdMSSZApVdp+oRH
         eMnyL+WlUYN83ShYNAZx2IqS/BCPPkgalINarRhmG5S1fGJIKWEhk5t6RhK7K0bSASzh
         bgf8jZ9L29q/QyFTcFQgpgMAQ0In0dZIqdrc7u0s+tperVoGR0gUToifVWG3FcBHfAqT
         jwKpLsuMBWqB9ww5l/K19pkHsM/pT0Wp6cx7a3g2oKxYaZSvGJE6qsWwK1KCUK52slIH
         4dqfn5prUsPe5rkBlvXb2vFGCR2XL7yIMqCfzDwfJKQQhLC8UGYSl0dhJuQqC+D3sX4r
         WrYA==
X-Gm-Message-State: AOAM530P0bLwo8kuK1gq5+nYzVj8EknZg3GvNnsi2BDS/ZRBtqkVUHLX
        yzZDkJGEQ7hq0oHuNlFm8YI=
X-Google-Smtp-Source: ABdhPJxzXXZaZL5Ak3oeQNLU/j3g/Nx4RgEbCoQpozUqfCZddWdsaVM6AAGoh34rxjwp6i5Sb9Bn8Q==
X-Received: by 2002:a5d:55c9:: with SMTP id i9mr13260309wrw.31.1595343062141;
        Tue, 21 Jul 2020 07:51:02 -0700 (PDT)
Received: from localhost ([156.204.74.63])
        by smtp.gmail.com with ESMTPSA id 22sm4037781wmb.11.2020.07.21.07.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:51:01 -0700 (PDT)
From:   Abanoub Sameh <abanoubsameh8@gmail.com>
X-Google-Original-From: Abanoub Sameh <abanoubsameh@protonmail.com>
To:     andy.shevchenko@gmail.com
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>
Subject: [PATCH 2/2] gpio: gpio-pch.c: fixed coding style issue
Date:   Tue, 21 Jul 2020 16:50:46 +0200
Message-Id: <20200721145046.773419-2-abanoubsameh@protonmail.com>
X-Mailer: git-send-email 2.28.0.rc0
In-Reply-To: <20200721145046.773419-1-abanoubsameh@protonmail.com>
References: <20200721145046.773419-1-abanoubsameh@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Added a lined between a declaration and other statements according to the
kenel coding style.

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/gpio/gpio-pch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 71dde7ceb7af..039822978eaf 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -199,6 +199,7 @@ static void __maybe_unused pch_gpio_restore_reg_conf(struct pch_gpio *chip)
 static int pch_gpio_to_irq(struct gpio_chip *gpio, unsigned int offset)
 {
 	struct pch_gpio *chip = gpiochip_get_data(gpio);
+
 	return chip->irq_base + offset;
 }
 
-- 
2.28.0.rc0

