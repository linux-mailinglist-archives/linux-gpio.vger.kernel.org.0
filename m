Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 977795B78C4
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Sep 2022 19:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232535AbiIMRtQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Sep 2022 13:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232321AbiIMRse (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2022 13:48:34 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2419B7DF5F
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 09:46:44 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id e18so3709943wmq.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 09:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7Q+oEd3CcXUfLGwhDa7au2VJtPR9Y4MGaMQ3lEkLNYc=;
        b=Q6p1a7kT3EqyERnG2Fur3D1UL0dn9H4wlfV/0Bp9UEPpiuSC2VWu4zNSKG2W7dpd2P
         2vkRMnPZ4Ixj53j5HebtwuqmT/r3YLOBf+nbkuPIwHCWiVogyg9mcfONDWO48S0Gc4XA
         6c+erdV6iir7eTJKrffTE55oK7uJy9kl/VzHnfb6gXCl29CA1NbEMU+WcgykkaD68Spw
         KGpOiwuA06fJMV9KBP0ybTnaO+kwcVKzhuQIPZGgJjXjcSHg9lwU/1uF5khikLA6EE+E
         i9Kv5JFTrZoeCUheuqz+RuL4E0azjsrzDvwzmRaQXu+Jy56XTSQWA1TpQTQrL+XomAfW
         oy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7Q+oEd3CcXUfLGwhDa7au2VJtPR9Y4MGaMQ3lEkLNYc=;
        b=QGK0WwNJenoS9xsxi7vv5BXlgXE7iTaPViNaJVWBxKCyzfwjCRq50HODB6BILihlr9
         +2W5NhZtAtr/i3wtbaJosCPePG35b/gqS/rwPY6uwYbQXUamnR95B6A0p2odYzQXduXp
         uEpKW6SA5d5Erapz5S6Gp7nZ6Irb2WCwUxKVR1XDrArHRLtPnDJXoHcZkpGuIRZbUZNF
         oSWxBfJn4aQq+8tDbu6kPS0rsbJnpAq4Mw3HkOojN4ScCdlUreVvGyv7pC3OD5ky3JPW
         l3kVLk2uaxsLGkxOJrgUmPiXhY6ePsy34QgqebBpNKttORhkFd8fEBqPO20uHx2L+cv+
         6ZGg==
X-Gm-Message-State: ACgBeo0lNeC906LL/ThhJfDIzQ6rCEvzCobPr8FPPhDsv7Ukd+pl4ZpA
        BcBeeFhCcw5IJWf302WPGfG8SQPmOyiHhQ==
X-Google-Smtp-Source: AA6agR4SAQAtUlHQLKZypvl3IBPPR9jnqyK1Um742Dda+nlXsWSx2IwPqBIMddJkz0rREWRhnp7WLg==
X-Received: by 2002:a05:600c:a49:b0:3a6:673a:2a9b with SMTP id c9-20020a05600c0a4900b003a6673a2a9bmr153022wmq.3.1663087602458;
        Tue, 13 Sep 2022 09:46:42 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id o17-20020a05600c511100b003b49bd61b19sm461356wms.15.2022.09.13.09.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 09:46:42 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, arinc.unal@arinc9.com,
        matthias.bgg@gmail.com, neil@brown.name
Subject: [PATCH v2] gpio: mt7621: Switch to use platform_get_irq() function
Date:   Tue, 13 Sep 2022 18:46:39 +0200
Message-Id: <20220913164639.403025-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913164639.403025-1-sergio.paracuellos@gmail.com>
References: <20220913164639.403025-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Mt7621 SoC GPIO driver is a platform driver so we can directly use
'platform_get_irq' instead of 'irq_of_parse_and_map'.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
Change in v2:
- Make independent PATCH since this must go to next branch.

 drivers/gpio/gpio-mt7621.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index f163f5ca857b..93facbebb80e 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -9,7 +9,6 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 
@@ -299,7 +298,6 @@ static int
 mediatek_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
 	struct mtk *mtk;
 	int i;
 	int ret;
@@ -312,7 +310,10 @@ mediatek_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(mtk->base))
 		return PTR_ERR(mtk->base);
 
-	mtk->gpio_irq = irq_of_parse_and_map(np, 0);
+	mtk->gpio_irq = platform_get_irq(pdev, 0);
+	if (mtk->gpio_irq < 0)
+		return mtk->gpio_irq;
+
 	mtk->dev = dev;
 	platform_set_drvdata(pdev, mtk);
 
-- 
2.25.1

