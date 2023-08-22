Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52E11783B25
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Aug 2023 09:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233548AbjHVHvb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Aug 2023 03:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233534AbjHVHva (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Aug 2023 03:51:30 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 781B7193
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 00:51:28 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fef3c3277bso13199845e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 00:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692690687; x=1693295487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AFj6sGKtm8EW1WwQribx51bsNun9Wg8aa3Yb6vNZvPQ=;
        b=rgpodcbkxCXvXko9npX+V329LhecS/4hp0kjfXrxixWX9XsgJGcc5HCNQY9Ly0nIqW
         LcKvWWE8O4nRm3NCozGdvCGIRGwM8icFozmUG1efKRfddM5q173oLRKW3AuKaxgcRtHM
         B4g1TYZH47n4E6kUPMhnaS1iOozxv9CPZ9bzTQjtfTzcC0s+jM+o8aqRc3iOMbxitUXn
         oolhyuiElERpEe9MpavEAAQsdAtD/2sPsMRv5rRmP1UOlEkOg937kH2m+yYHYwX/CghE
         gVjyjb2IvpktUbhm1Ho/QaSqY29orgmbUZ/Uurhj1/ttMmc4aGovdGU4peWJ2d6mN6hP
         6uMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692690687; x=1693295487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFj6sGKtm8EW1WwQribx51bsNun9Wg8aa3Yb6vNZvPQ=;
        b=d2ACkwesytaxU4Xrwk8EKToU1XfSkR6HT4GVEI06I9IeKPDeW9/69PDjFi0izvYv3D
         WwBENmSmJ13OCmTJObJpZAW5cfMZ+iJBFVe9yUTZMc+3jzmavr5hS+nc0faruoVBXZZA
         tIt8DqM1m0svoXcWMnzWildEQB6c743z8r5lzG7r8Z5EaRnVlwJ81Le+St77iuYPPYwv
         E/nO8qylSpY5E6HPtfNWgqX+epPF6y/8T29AKVrPmL6GSuLIrsgddTYGmgxLlYT1rAnp
         7Vt5EzzPNk18IB7E8u6bleeu2N6/Ay3avgjk3vGDbN/Tk+kkXwVAIGlbKvZXbPiYhanb
         2r+Q==
X-Gm-Message-State: AOJu0YyblOWLNBlpkOFOHzvjEc9tJd+/YJbN1MhJB3a9TI0U4i0Jyy74
        dszHVx+8nsh8C0zSGw+Zb7HAgA==
X-Google-Smtp-Source: AGHT+IF4pmy/7Qwdjn4KZqLvpDf39XWVpd61gSofWAqbnhWky1pEpUdWVdJkrPQG4L2cwuqtJSSszQ==
X-Received: by 2002:a05:600c:215a:b0:3fb:ab56:a66c with SMTP id v26-20020a05600c215a00b003fbab56a66cmr5863572wml.10.1692690686831;
        Tue, 22 Aug 2023 00:51:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6042:edc2:a9e7:ea8b])
        by smtp.gmail.com with ESMTPSA id v25-20020a7bcb59000000b003fe4548188bsm11057739wmj.48.2023.08.22.00.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 00:51:26 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] gpio: sim: dispose of irq mappings before destroying the irq_sim domain
Date:   Tue, 22 Aug 2023 09:51:21 +0200
Message-Id: <20230822075122.6900-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If a GPIO simulator device is unbound with interrupts still requested,
we will hit a use-after-free issue in __irq_domain_deactivate_irq(). The
owner of the irq domain must dispose of all mappings before destroying
the domain object.

Fixes: cb8c474e79be ("gpio: sim: new testing module")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sim.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index f1f6f1c32987..27515384aa10 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -291,6 +291,18 @@ static void gpio_sim_mutex_destroy(void *data)
 	mutex_destroy(lock);
 }
 
+static void gpio_sim_dispose_mappings(void *data)
+{
+	struct gpio_sim_chip *chip = data;
+	unsigned int i, irq;
+
+	for (i = 0; i < chip->gc.ngpio; i++) {
+		irq = irq_find_mapping(chip->irq_sim, i);
+		if (irq)
+			irq_dispose_mapping(irq);
+	}
+}
+
 static void gpio_sim_sysfs_remove(void *data)
 {
 	struct gpio_sim_chip *chip = data;
@@ -406,6 +418,10 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	if (IS_ERR(chip->irq_sim))
 		return PTR_ERR(chip->irq_sim);
 
+	ret = devm_add_action_or_reset(dev, gpio_sim_dispose_mappings, chip);
+	if (ret)
+		return ret;
+
 	mutex_init(&chip->lock);
 	ret = devm_add_action_or_reset(dev, gpio_sim_mutex_destroy,
 				       &chip->lock);
-- 
2.39.2

