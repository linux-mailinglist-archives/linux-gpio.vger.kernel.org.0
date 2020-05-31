Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53F9D1E94A7
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2020 02:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729587AbgEaALU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 May 2020 20:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729522AbgEaALT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 May 2020 20:11:19 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04404C03E969;
        Sat, 30 May 2020 17:11:18 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id y17so7779352wrn.11;
        Sat, 30 May 2020 17:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vX2j+ZqsOynp+SkPgzqmgQI0qHfSmxvzrYIfKti767U=;
        b=cy1f+p4dDAWjMTLoinEhGQay6sqfyhmfWAy2m/5zqhP8Zv2jj1rifHH2ZepjX+OU6f
         mcuxW9yKPbz6l8RrL9oI7pJsKdFS8sdWXlI9mbyBgQLLOoJQWc/itzxxwXBd0bCrYuBP
         2Vax7Sxw5XUq0STfJiY2eEVMoB6VP8CP+HdnCFSul20CYrKj30DpVWYGiQAl0irSZcF1
         21OISGHPNSrvXf7w5S2/QHBzm/0YwRWlG1ZNQzOXl35spVVu6NkOEuANQ8yvcaSM0Hjc
         tf9o6EyL7lNmR21NOcBpIyhRwpb8DEK1iJja9+y0FaSvtfbUd1lz3shmOappEFNA6ssm
         DiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vX2j+ZqsOynp+SkPgzqmgQI0qHfSmxvzrYIfKti767U=;
        b=V3KZCH7WM5OTomOY6xbhuBSgVAA22i47vcQ1FOo7J7cxr9Mamorp7eNj7EEqnIx8sM
         BFyse4xV1Z6nwWcptFzhdf/uINeHDKi2+/j0r4oXNXJLLDPc/QJ10kcguPKQ9RkpWNYh
         PJ5uOaN8r2gwSFFnjqJmszoleVqTwHrTMrMYvC62rmvAodav9rHtRpTjlSPrEIxL9Dmq
         5GFNUbhswXnoyUsLImUlHpWGOERdBJqcOSULNRgowTJN9QO5ybm2cExEnsL0PR+di6bB
         JXSz/Dq/6wcGt7L13Dku+MNznPCxL86hQGmhCcDPrwmeKR3LjFiNCS27cPchKlmNh9Sl
         mdZA==
X-Gm-Message-State: AOAM533qFCrmT69xtdrYREEnRjq04z9cb2Vd2PAV6mOdd62/k0ZLa9SB
        cVe852pHz4QxMe3u1nHK5Mh0Jp7y
X-Google-Smtp-Source: ABdhPJzmvV0vOAPA3dfn1ipknELjJg2/sLbGGdqcF12/Qa5dIVvV0XqsPfu44CCicBEqCvBSQ2Vi2A==
X-Received: by 2002:adf:e749:: with SMTP id c9mr16433368wrn.25.1590883876451;
        Sat, 30 May 2020 17:11:16 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d17sm15455807wrg.75.2020.05.30.17.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 17:11:15 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM
        BCM2711/BCM2835 ARM ARCHITECTURE),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM
        BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH v3 2/4] dt-bindings: pinctrl: Document optional BCM7211 wake-up interrupts
Date:   Sat, 30 May 2020 17:10:59 -0700
Message-Id: <20200531001101.24945-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200531001101.24945-1-f.fainelli@gmail.com>
References: <20200531001101.24945-1-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

BCM7211 supports wake-up interrupts in the form of optional interrupt
lines, one per bank, plus the "all banks" interrupt line.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
index dfc67b90591c..5682b2010e50 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
@@ -16,7 +16,9 @@ Required properties:
   second cell is used to specify optional parameters:
   - bit 0 specifies polarity (0 for normal, 1 for inverted)
 - interrupts : The interrupt outputs from the controller. One interrupt per
-  individual bank followed by the "all banks" interrupt.
+  individual bank followed by the "all banks" interrupt. For BCM7211, an
+  additional set of per-bank interrupt line and an "all banks" wake-up
+  interrupt may be specified.
 - interrupt-controller: Marks the device node as an interrupt controller.
 - #interrupt-cells : Should be 2.
   The first cell is the GPIO number.
-- 
2.17.1

