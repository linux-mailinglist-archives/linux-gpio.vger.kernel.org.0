Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 495C1133493
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 22:26:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727367AbgAGV0n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 16:26:43 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36114 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728190AbgAGV0h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 16:26:37 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so1118511ljg.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 13:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x90lifJPc4BGJ9wFpWec3cHzG5bLin4aDvSjmkt9zSM=;
        b=BAEhPDY8si16eL8HF3/1rVLWTNeCbJndLnGusHT6nG/FVftAvGOyuE0DO/RmlDua2F
         pHNYC/tAHTgbf+uKs/FQZHAiIOyxAAI4e1UhFL9clyoZvfJwuq7xfdwYsImIfPB7qKuc
         N2wraSmxdYC8PBdiBL7FkHrJvXvMkwkyCWS7/WFJR/VQ2L8lEttBrURKjFGce2KolkZ5
         v3/MGxy6u1IToVltfR4h13x2q1JO2RAOwwz1+IuQMjTfc8HeTmCrhlt+CbQ6gED+qkw3
         qLZljC96Ya8wH57eS60zwyiWZRupcNU/sAiTK8tgm+mVz69sjIq/EHiyBIbU/iDf3akv
         KoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x90lifJPc4BGJ9wFpWec3cHzG5bLin4aDvSjmkt9zSM=;
        b=mYrTbJ4gpAvzujeV+5LaTJ38I6A+W2Dp8h0v7jb6lxcWDftjnS+t1T4jB81dq/UC/e
         ESP4NEM5BrKsqkJY3mXtSpAnW+vSDEv6suB1xd8fLP9DJ//OXSc0vzl5IWblicq1lhcZ
         0/50unXYORN/W6+8dHwCgPQBnVoDC5e5kf0xi5RGqLMi8D3BAxZ9BFPZmREdVomF/W5+
         StnyNto+kBIEICzZ4AZCqkj9vpChkYAQb1autEpjsEtxCIfPsVR+Ty83w65fTUs5FHhF
         EdffFjs3iIs17rXnr983OkQBMVr1CdCqByhiLabtMFWUmk3I9F6+S6EAQX/uT8qY1mn8
         655A==
X-Gm-Message-State: APjAAAWmuwsgMfxs31B6w8ofVZloHDlxq/MV8NzD3lNzT1Byz13T+M1R
        jKpb90d0hIXe7Vj9h0hu/HxnNK7Cn9011A==
X-Google-Smtp-Source: APXvYqzVu82LJ79QDMTNTmWMBaFA9t+tWmg7AVnqPF+4sR3eEoMcYveSgUVtaNUw2/17R380iRlTfQ==
X-Received: by 2002:a2e:9e4c:: with SMTP id g12mr843721ljk.15.1578432394970;
        Tue, 07 Jan 2020 13:26:34 -0800 (PST)
Received: from localhost.localdomain (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id h24sm317830ljl.80.2020.01.07.13.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 13:26:34 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Update TODO
Date:   Tue,  7 Jan 2020 22:24:32 +0100
Message-Id: <20200107212432.27587-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Drop the completed item: hierarchical irqchip helpers. Add
motivation for gpio descriptor refactoring. Extend the list of
stuff to do. Minor fixups.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/TODO | 46 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 76f8c7ff18ff..342285ecdb08 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -10,6 +10,28 @@ approach. This means that GPIO consumers, drivers and machine descriptions
 ideally have no use or idea of the global GPIO numberspace that has/was
 used in the inception of the GPIO subsystem.
 
+The number space issue is thesame as to why irq is moving away from irq
+numbers to IRQ descriptors.
+
+The underlying motivation for this is that the GPIO number space has become
+unmanageable: machine board files tend to become full of macros trying to
+establish the numberspace at compile-time, making it hard to add any numbers
+in the middle (such as if you missed a pin on a chip) without the numberspace
+breaking.
+
+Machine descriptions such as device tree or ACPI does not have a concept of the
+Linux GPIO number as those descriptions are external to the Linux kernel
+and treat GPIO lines as abstract entities.
+
+The runtime-assigned GPIO number space (what you get if you assign the GPIO
+base as -1 in struct gpio_chip) has also became unpredictable due to factors
+such as probe ordering and the introduction of -EPROBE_DEFER making probe
+ordering of independent GPIO chips essentially upredictable, as their base
+number will be assigned on a first come first serve basis.
+
+The best way to get out of the problem is to make the global GPIO numbers
+unimportant by simply not using them. GPIO descriptors deal with this.
+
 Work items:
 
 - Convert all GPIO device drivers to only #include <linux/gpio/driver.h>
@@ -33,7 +55,7 @@ This header and helpers appeared at one point when there was no proper
 driver infrastructure for doing simpler MMIO GPIO devices and there was
 no core support for parsing device tree GPIOs from the core library with
 the [devm_]gpiod_get() calls we have today that will implicitly go into
-the device tree back-end.
+the device tree back-end. It is legacy and should not be used in new code.
 
 Work items:
 
@@ -59,6 +81,15 @@ Work items:
   uses <linux/gpio/consumer.h> or <linux/gpio/driver.h> instead.
 
 
+Get rid of <linux/gpio.h>
+
+This legacy header is a one stop shop for anything GPIO is closely tied
+to the global GPIO numberspace. The endgame of the above refactorings will
+be the removal of <linux/gpio.h> and from that point only the specialized
+headers under <linux/gpio/*.h> will be used. This requires all the above to
+be completed and is expected to take a long time.
+
+
 Collect drivers
 
 Collect GPIO drivers from arch/* and other places that should be placed
@@ -109,7 +140,7 @@ try to cover any generic kind of irqchip cascaded from a GPIO.
 
   int irq; /* from platform etc */
   struct my_gpio *g;
-  struct gpio_irq_chip *girq
+  struct gpio_irq_chip *girq;
 
   /* Set up the irqchip dynamically */
   g->irq.name = "my_gpio_irq";
@@ -137,9 +168,14 @@ try to cover any generic kind of irqchip cascaded from a GPIO.
 - Look over and identify any remaining easily converted drivers and
   dry-code conversions to gpiolib irqchip for maintainers to test
 
-- Support generic hierarchical GPIO interrupts: these are for the
-  non-cascading case where there is one IRQ per GPIO line, there is
-  currently no common infrastructure for this.
+- Drop gpiochip_set_chained_irqchip() when all the chained irqchips
+  have been converted to the above infrastructure.
+
+- Add more infrastructure to make it possible to also pass a threaded
+  irqchip in struct gpio_irq_chip.
+
+- Drop gpiochip_irqchip_add_nested() when all the chained irqchips
+  have been converted to the above infrastructure.
 
 
 Increase integration with pin control
-- 
2.23.0

