Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1156A277D6
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2019 10:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbfEWISc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 May 2019 04:18:32 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38931 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbfEWISc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 May 2019 04:18:32 -0400
Received: by mail-lf1-f68.google.com with SMTP id f1so3715406lfl.6
        for <linux-gpio@vger.kernel.org>; Thu, 23 May 2019 01:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8lxtoBV7Uhaew9yFht1H71ENLQY5q/PoDYeFMqW8W+Q=;
        b=hF3aCvu4M875mw8lgS96MBKEMIvD++n/1SRyS6HW6/NApxo6zdLZeH8kJh+ZXrFfoO
         2ZTJkCky6lPyOot8wUGDPm45FAuglXr7WQ0WJSSIJQJEpfrwVG/OIDd6mOibwlUQFpe2
         nMeCo9CiQZHuyoFYr7kgWb/t6JgLhVJfDWfqBO3Nf903rVqFSgfrQr38hIAX8wgjp0Ib
         xTwfZZ9qIUATYvWJQcBVEmOzx3DWrX+kjWEmKiYwVlT8TRncB8dAgTOZEL6ff2m3ey+1
         kyuWaJV3MXvMZPbclxc3Ku4C3icHWZKfBIqRw8DIBit1nsUshhsKEUExMNIPoOClzbYR
         2Lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8lxtoBV7Uhaew9yFht1H71ENLQY5q/PoDYeFMqW8W+Q=;
        b=sf8IEAQqaXsMUj0usWVKbycJxcmfZ/FVyGn9mn116Aug43cULtjy5canyueagnBZFq
         vg/Ppv6pFZGMV58wnbciMyfMgPT2RYShlnuceXZz4E2pHId5PNPjTMtgFxE2EksBZcqx
         9MxcSQdzMoIdt4cgBLhaYSUsk2RjALqoR8nqbbeCZpLO1DYnW8iL05kJS7kJDpDemGO9
         LYg3q/snmuNUV5Hlu1S7c04w9mObAT3XfD/nc5WMcsOYn/4VZwtNu27k5xR86I8B9FtN
         98moQJJBlTtd6uN6chY3T40UpdNSF2iKwuTOANipikMzlBVRPE7/nubHOgNlyYR2W9Sh
         rbBw==
X-Gm-Message-State: APjAAAWSgXnTEzajzUYE7wkkQvztnRaewHRbgTkuLxcdBySNbFpKvC3P
        /xsRUmLW1eN6uM/wPNzYwwqdQLuPNMM=
X-Google-Smtp-Source: APXvYqyM8LOwVv2eoXAG4VuSdtXmE6zs/n3wmGv58MOGbalbqdnHpNxJjCCK+KMQ5AXcAnrHAM+tvQ==
X-Received: by 2002:ac2:5a1b:: with SMTP id q27mr41628400lfn.63.1558599510470;
        Thu, 23 May 2019 01:18:30 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id x23sm5847316ljb.29.2019.05.23.01.18.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 01:18:29 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Fix minor grammar errors in documentation
Date:   Thu, 23 May 2019 10:18:27 +0200
Message-Id: <20190523081827.21030-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This fixes up some of my own mistakes when I stressed to refresh
the documentation.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/driver-api/gpio/driver.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index 1ce7fcd0f989..58036c2d84d2 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -235,7 +235,7 @@ means that a pull up or pull-down resistor is available on the output of the
 GPIO line, and this resistor is software controlled.
 
 In discrete designs, a pull-up or pull-down resistor is simply soldered on
-the circuit board. This is not something we deal or model in software. The
+the circuit board. This is not something we deal with or model in software. The
 most you will think about these lines is that they will very likely be
 configured as open drain or open source (see the section above).
 
@@ -292,18 +292,18 @@ We can divide GPIO irqchips in two broad categories:
 
 - HIERARCHICAL INTERRUPT CHIPS: this means that each GPIO line has a dedicated
   irq line to a parent interrupt controller one level up. There is no need
-  to inquire the GPIO hardware to figure out which line has figured, but it
-  may still be necessary to acknowledge the interrupt and set up the
-  configuration such as edge sensitivity.
+  to inquire the GPIO hardware to figure out which line has fired, but it
+  may still be necessary to acknowledge the interrupt and set up configuration
+  such as edge sensitivity.
 
 Realtime considerations: a realtime compliant GPIO driver should not use
 spinlock_t or any sleepable APIs (like PM runtime) as part of its irqchip
 implementation.
 
-- spinlock_t should be replaced with raw_spinlock_t [1].
+- spinlock_t should be replaced with raw_spinlock_t.[1]
 - If sleepable APIs have to be used, these can be done from the .irq_bus_lock()
   and .irq_bus_unlock() callbacks, as these are the only slowpath callbacks
-  on an irqchip. Create the callbacks if needed [2].
+  on an irqchip. Create the callbacks if needed.[2]
 
 
 Cascaded GPIO irqchips
@@ -361,7 +361,7 @@ Cascaded GPIO irqchips usually fall in one of three categories:
 
   Realtime considerations: this kind of handlers will be forced threaded on -RT,
   and as result the IRQ core will complain that generic_handle_irq() is called
-  with IRQ enabled and the same work around as for "CHAINED GPIO irqchips" can
+  with IRQ enabled and the same work-around as for "CHAINED GPIO irqchips" can
   be applied.
 
 - NESTED THREADED GPIO IRQCHIPS: these are off-chip GPIO expanders and any
-- 
2.20.1

