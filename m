Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21A0360DD18
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 10:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232865AbiJZIeQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 04:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233126AbiJZIeQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 04:34:16 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F16C50A5
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 01:34:14 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id r12so10917066lfp.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2022 01:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bNn3eWuA3AWM0RIAow9RlqRwoa5twz63NOiZnmeo3eQ=;
        b=RF5f23X39jnoHypbuiZJzhbtfAW6XZL6cbsFW1s8Uv7PWpmGdMp/INQMRrzfSmRQ4A
         fSSt7Eu89X1jYp+RZ45VumtDisnkVcHqQQO74X/hVeLbgXhVtSQXiPd6GQd51xBoOy+O
         FlmXkZ10naRWifVjfeulWz8ap+47VkkYoSZfbus9ie8WmyyHojDBhHsv6xVqrrBubnKy
         2zgj70y0L+BazIVI8I3gV4F9HUzGDFtUxu5fM2png+4wPhH/R81/QqU//X2D0C+9maSj
         fbJ55tgRMf4ncBD0oMJ/BlJrRJ4RAqWorPQv6rDJEDhB3cVfU6vBMiqes+UmbI41fD1l
         lyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNn3eWuA3AWM0RIAow9RlqRwoa5twz63NOiZnmeo3eQ=;
        b=qsqP91uNB6DTDpxhOD4jzs7AEOG/UbLAAAb9bgf0EPfN/Gpf18OQQrbQ52B/17qIRT
         tkEE22LO0DkgG1FJq+DsyE2/jGjAtvHD99pfyEGPZDWoVqY9bkym1G0inMgd/C150TUd
         wa0XfAsW1P4umodQh0kWh5XHyDF1nfuZtehALIlNufwJwRxQSZ5MbuprQiCmLRiWMpe/
         ZJndx10l2BvA13Vor0K4MzUBFYgcr8oeKlF48yJDTQT8VHQLcXJJZVNPTspqhf3wTofK
         htWXdHNX0DxaRA4IHrAU7Bt+MB49avqydS2RB0cGeyJC7UmpkHgFUGOfC+obqYfKPIrM
         CHvw==
X-Gm-Message-State: ACrzQf2qq6BAD5zGMq1VzhJ3NsF3VkXjrF8xZma/Se+72I2wR4Tdka3r
        A1bhmbuIHHB6mlAqbFAhqoaqbQ==
X-Google-Smtp-Source: AMsMyM7BSY2ZR8CJPxdKa0hNALY8JKlCUFoXG3mwzoQaU+1XeZe6e+usB7xjmYEWbXbXpTlsXWBvlg==
X-Received: by 2002:a05:6512:1289:b0:4a2:61ca:319a with SMTP id u9-20020a056512128900b004a261ca319amr14584527lfs.428.1666773252759;
        Wed, 26 Oct 2022 01:34:12 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id u5-20020a05651220c500b004a65780e4cfsm761516lfr.106.2022.10.26.01.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 01:34:12 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Cc:     linuxppc-dev@lists.ozlabs.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: [PATCH v2] soc: fsl: qe: Avoid using gpio_to_desc()
Date:   Wed, 26 Oct 2022 10:33:48 +0200
Message-Id: <20221026083348.107431-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
ChangeLog v1->v2:
- Add back the <linux/of_gpio.h> include: we are using the
  mm_of_gpio_chip, which should be fixed, but not now.
---
 drivers/soc/fsl/qe/gpio.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 99f7de43c3c6..68d48430ab33 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -14,9 +14,8 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
-/* FIXME: needed for gpio_to_chip() get rid of this */
-#include <linux/gpio.h>
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <soc/fsl/qe/qe.h>
@@ -161,6 +160,7 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 	struct qe_pin *qe_pin;
 	struct gpio_chip *gc;
 	struct qe_gpio_chip *qe_gc;
+	struct gpio_desc *gpiod;
 	int err;
 	unsigned long flags;
 
@@ -170,14 +170,21 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
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

