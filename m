Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 112FE60AF25
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Oct 2022 17:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbiJXPhF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 11:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbiJXPgt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 11:36:49 -0400
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3BD201A0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 07:24:40 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id v27so9601927eda.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 07:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2dftzokVagW1NbsihVeFfV7KhU75z+A9+bOluSjCvY=;
        b=DBx9J7RTxs4jDAz7lRIoDNqosSvctOg1QPzn7FV2aLWeproz1aCaQMKhCB0IC3hflk
         NkBK2x75an1lKBdpdpEXOFGo1nSZZ8ixYHtLX5Y97Ka4rNU5VVoNmNJCNO5cJqjJFigh
         a3kVBbm7RGEg8m4dSmaDxAxR5jvwzF0I4+5gRZ/hDu9LEYi1WEteZ+1mSTgB9JxaMrEj
         y0tUaV5eSigbbQmN1B5fNYYjAgZ+57/ayq/i825n21I9+nNQHL5QjY45JssqSXvH//0a
         zPX6svt7+vfiE3kC+ETFbQb5Z+KonMp6d1BSctq0aPQux6wvxK8sgqGuTmNjCR+eHyca
         xwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2dftzokVagW1NbsihVeFfV7KhU75z+A9+bOluSjCvY=;
        b=VvwE/sJkeV5wsVyk+PGT4VcDjpHBIEBDTK8T++QaLVDzns1t0PGWtKp/wssl2EP2xj
         1sRJU0gdpjyqzpF8BxIVEW6FO9HH1jUXg/wET1B21ao72yKCmu5vFI13caHqO4Z+4xsQ
         Kql0Ss5t5Tk6s1S481gcgGr4pIGAVh/xNGIl6IGpn0t16ulAM0k4iokH62JQ540Vwb2s
         tRVK4MtA8yd2GGlinMwMkjw3qF1cOD020VWW5kRDRunGYcGav7Q2omKGfztE7fLyfyjD
         mYEH96v7p4Dh4cqjZUJ866qTSydspQT5zdWSMaOg3MXgCZ6ysD68zPeKGLMvDXkoETbD
         aJkA==
X-Gm-Message-State: ACrzQf0IwyS2lFyylfsT7yloWPUNMkfS5+PMy0tSHFRiDT5L9vaiZXi1
        Gj8hGdlNyYpxjTzHAlE/cHMifJ2pXuQe/A==
X-Google-Smtp-Source: AMsMyM41L8nLr9Hx51j7f3hQp+pQCT+pio/X+snwW/xqXDxG7Hix8S7fRMaXs9FJJRTFfMPF0garoQ==
X-Received: by 2002:a05:651c:1590:b0:26c:4311:9b84 with SMTP id h16-20020a05651c159000b0026c43119b84mr12835020ljq.152.1666614166054;
        Mon, 24 Oct 2022 05:22:46 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id 6-20020ac24846000000b0048a9b197863sm1858671lfy.235.2022.10.24.05.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 05:22:45 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Cc:     linuxppc-dev@lists.ozlabs.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: [PATCH] soc: fsl: qe: Avoid using gpio_to_desc()
Date:   Mon, 24 Oct 2022 14:22:41 +0200
Message-Id: <20221024122241.9463-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We want to get rid of the old GPIO numberspace, so instead of
calling gpio_to_desc() we get the gpio descriptor for the requested
line from the device tree directly without passing through the
GPIO numberspace, and then we get the gpiochip from the descriptor.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/soc/fsl/qe/gpio.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 99f7de43c3c6..cc5602b679fe 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -13,10 +13,8 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
-/* FIXME: needed for gpio_to_chip() get rid of this */
-#include <linux/gpio.h>
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <soc/fsl/qe/qe.h>
@@ -161,6 +159,7 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 	struct qe_pin *qe_pin;
 	struct gpio_chip *gc;
 	struct qe_gpio_chip *qe_gc;
+	struct gpio_desc *gpiod;
 	int err;
 	unsigned long flags;
 
@@ -170,14 +169,21 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 		return ERR_PTR(-ENOMEM);
 	}
 
-	err = of_get_gpio(np, index);
-	if (err < 0)
+	gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), NULL, index, GPIOD_ASIS, "qe");
+	if (IS_ERR(gpiod)) {
+		err = PTR_ERR(gpiod);
 		goto err0;
-	gc = gpio_to_chip(err);
+	}
+	if (!gpiod) {
+		err = -EINVAL;
+		goto err0;
+	}
+	gc = gpiod_to_chip(gpiod);
 	if (WARN_ON(!gc)) {
 		err = -ENODEV;
 		goto err0;
 	}
+	gpiod_put(gpiod);
 
 	if (!of_device_is_compatible(gc->of_node, "fsl,mpc8323-qe-pario-bank")) {
 		pr_debug("%s: tried to get a non-qe pin\n", __func__);
-- 
2.34.1

