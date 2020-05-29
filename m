Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0320E1E8779
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 21:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgE2TQ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 15:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727938AbgE2TQx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 May 2020 15:16:53 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0BDC03E969;
        Fri, 29 May 2020 12:16:53 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id j21so376902pgb.7;
        Fri, 29 May 2020 12:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vSuzW0Fxrw3Yl1GJT8aprzfotLQBAijlg/osXVZg1ZM=;
        b=tdKG7Fj5mfIquGy1eUqVbKlogVE2r2eE0xHChc6Ukhnqc+QpBMZcy1wWbzEmzEYL2k
         6bi9XgN03X/RK5gtPXa9lTHLT8grv8Z4Bxw9y5Qk0ds+5kqiwaNfqgfpWkB6hHsU0yQz
         m2RKbjU4wr1t0Vc3KBFIsq0ULJUWC/iqGfpf9MqE55b4jxruuOj+3PDzMGfuCoUZqdsk
         5OorKwy8ziH4APZvvjRt+dLhUyx/CL+hqAuoLAO4jZQb1wY37fXUhKQiYyQ72As7Mt8I
         wLc60AIsWRvIZ+Ofn1kYd6YYI5nIpdgNfodqyVHbfjQ4K7T/M1hRX+8B49eOcR1rwqig
         40XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vSuzW0Fxrw3Yl1GJT8aprzfotLQBAijlg/osXVZg1ZM=;
        b=Z9xjDvO/zuw3WzntSlG0+GZrQVwz8aAPbRvd5XOKJFVxY2fXVBx9PYsxoW4IC79w6q
         gX5ijS0pomy+AMPW7IGWR6JPqN+68zTH7MUAKXUZoqcmXyQ6GCau+ppPZF8JU6ZlS6lb
         WJ4o5STnx1clO0tHdp7RYvk06f6ZWRLLtm2GHRSFQJqcE64wpahfw5AG/O4qIH+1vUcH
         e0y26q7NpP3a84u5dPw8sXC7Rb3c5Z+sszYsw/20bxp9RFEzuhcppKH7t+e35OCXHwsL
         0lHRIQoA0ANpfnDSTm/Ba/S9nFUe0RvakkjHWpI0GjSjLhiOYhOLg4kynv63wIAJoYpe
         s+Sg==
X-Gm-Message-State: AOAM530AmkBc6WPj68WX2aX5ayFWCt262AmjmGSc9up6Rem5MUE6wggE
        aBVgLMZjSyDwclQ+g+lTX4V+izT/
X-Google-Smtp-Source: ABdhPJxUBqwsPVzMf/xOoD/c6fqXBbj/6QGB9lXW5L5Z8RrZaLVL+aBLPOwze0zw6HCZngwJRSZ3Lw==
X-Received: by 2002:a63:4b0c:: with SMTP id y12mr9343218pga.56.1590779812662;
        Fri, 29 May 2020 12:16:52 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id g92sm202505pje.13.2020.05.29.12.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 12:16:52 -0700 (PDT)
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
Subject: [PATCH v2 2/4] dt-bindings: pinctrl: Document optional BCM7211 wake-up interrupts
Date:   Fri, 29 May 2020 12:15:20 -0700
Message-Id: <20200529191522.27938-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200529191522.27938-1-f.fainelli@gmail.com>
References: <20200529191522.27938-1-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

BCM7211 supports wake-up interrupts in the form of optional interrupt
lines, one per bank, plus the "all banks" interrupt line.

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

