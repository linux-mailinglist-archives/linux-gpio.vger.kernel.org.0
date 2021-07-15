Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B38633CAC47
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jul 2021 21:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243755AbhGOTcI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 15:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345000AbhGOTaj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jul 2021 15:30:39 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D070C08EC75
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 12:08:10 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id q16so11750520lfa.5
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 12:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lKQRAlePlTMlxkEvsDgVWIhm5eYPypHEzL5OrGHVjJI=;
        b=gU5afgnHt6RHmCo+fr9n2ut1P1aFxcoE+WoQB1vwKsMcnGhR73sfI6/YfpJBIJnpqh
         CGHyDzjNSYRsvrQ9sB+7b3CTTTiX8K405mqs0xPkpBhodaUdMcetjAcIeOjaWqFGrpPc
         Gn5/F1eE4K7Tfd7GhDOm0yKCzplxDwwhdLyX4ijdZ/fS1NbKB3yDU5mB1anfTv0iAsHc
         RxEBEzqb0PNIjn409FJjKyKoaaq+c7L4BbhGqsttdY+v4urd79w4o36lzTqve54Vv+zH
         94F/Wf0z63OlfAAM2CZoRGydfZHlXat6rLzUes8MY5631HQbcAI/4TtijzM8zU8SJRoh
         pciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lKQRAlePlTMlxkEvsDgVWIhm5eYPypHEzL5OrGHVjJI=;
        b=qhxYQmUIsXcOq6ZOcbtMblzBFhf7ReV0AzJFSriCa6sd2LwFk2czTKLV5DcYdJTTxL
         tE6wpcxXlFoOdTB0FKo9f1/tc8cae+F4qvYd1rEANOaE2dd8lLHg5a9IF1+xZ5SiMzh4
         bpWKGVhEuA8Lt8MYq2nTqCSPV3BIQqOFih54JKx22vG5o6FGsQRm2kFHoS3cZzA7lX6L
         jran6OBndGwnFzMvy+O6NAbJW+i0q8QkaYK9nfWQ+Gk9n+QyrYOXhDscJtDMSacCAHXc
         6dL8wr22LL60em2nUScy/72iqZghCkk3Ur68TaSWLQGFrDVMOX5mRQzChLWRphXXEcul
         A0sA==
X-Gm-Message-State: AOAM530B2NoY4XFzynoJmxBHaktB64J5jzmXuXS+0LVV+9tzghi7zVO2
        IqzM1zw4I/DpTma7m1ASegG7Pw==
X-Google-Smtp-Source: ABdhPJxAlbu5YugiR3VVgcx8jzlq4Lf7DJUoJ/mXxwjj5EjvRt5VMzewDCJYH37BtZZlf9eulah+cw==
X-Received: by 2002:a05:6512:b96:: with SMTP id b22mr4789014lfv.155.1626376088904;
        Thu, 15 Jul 2021 12:08:08 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id c6sm469646lfp.196.2021.07.15.12.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:08:08 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] extcon: usb-gpio: Use the right includes
Date:   Thu, 15 Jul 2021 21:06:06 +0200
Message-Id: <20210715190606.429251-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The USB GPIO extcon driver does not use any of the legacy
includes <linux/gpio.h> or <linux/of_gpio.h> but
exploits the fact that this brings in <linux/mod_device_table.h>.
Fix this up by using the right includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/extcon/extcon-usb-gpio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-usb-gpio.c
index f06be6d4e2a9..0cb440bdd5cb 100644
--- a/drivers/extcon/extcon-usb-gpio.c
+++ b/drivers/extcon/extcon-usb-gpio.c
@@ -7,18 +7,17 @@
  */
 
 #include <linux/extcon-provider.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/mod_devicetable.h>
 
 #define USB_GPIO_DEBOUNCE_MS	20	/* ms */
 
-- 
2.31.1

