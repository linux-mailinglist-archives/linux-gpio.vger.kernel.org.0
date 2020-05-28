Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4721E6AB9
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 21:24:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406514AbgE1TYi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 15:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406339AbgE1TVX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 15:21:23 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AABBC08C5C7;
        Thu, 28 May 2020 12:21:23 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ci21so19764pjb.3;
        Thu, 28 May 2020 12:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vSuzW0Fxrw3Yl1GJT8aprzfotLQBAijlg/osXVZg1ZM=;
        b=uFjCitPCaxYsDgzV4wY1TYNB22WXNriao+rasyTp6fx8oUZ/jZ7LgLdWFPCix2CDJc
         z4qY3S0mUwvqMnika7IAV6uS4E86uY25zzhpyepLrEp5b1zRPkXDOjoB0+lYgNWDXX6h
         vMWU0khZBLbCGrYW9folMLTTFn1jp6ztO4gRdezIfWp1n+z6E00zo1yw8NO8Qk8SyxHf
         PvNj1FwA6pZJwNXWBRyXVE8yFxdvh9QPUIa08WFfmWY/f/HejHq+ivPHf328ty5i3BtO
         KKMfa0DjB4e6NewHLjKz51JfVMJJsWyyL2Pvfa1/fUosoMEqT7mnwu8znYPWKWxmr+oo
         Qu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vSuzW0Fxrw3Yl1GJT8aprzfotLQBAijlg/osXVZg1ZM=;
        b=W/IaFzveKFBnyBN1gF6ePiqFKmnMY5hCPQ1MCHAVvvFoGWO2sW1EWLx1UprJUL7QJU
         If4ojwuRiZnLBCLZGUsdBuLdCp9CRWvxlv6kOtpgIhEM+uV/RCR5XH967N9+50x12w8z
         x2DKbHxAveDypgnBGwbla3dvhreV7FfQCXLsfjFbiovH2/t66IBF7zMH15bDPy77+UUb
         22/jtyVjLbvr12T3g8Ae6SyjEVh1sRGYkJvkKRT6bUzEEDbtmhUIMH3CR8+fsym0OOMZ
         /v7IA1xCEv2qt9h2nrEfQwxlRjvT0fTBw3clVO/DLQKA2GJe7CSA8amavr+wd2lRT43d
         0tqw==
X-Gm-Message-State: AOAM533e9QJS4pUJaMn7u/4RjzTklefAfPrwfIHjWJA8+Qd8qKfM2GSn
        MqaihCpxtI7dWF74WOsAlq/nvS+m
X-Google-Smtp-Source: ABdhPJxYZhtmszsYJLmUdd8l8q5G5dedGQN9zo/773iAKQPdmlh60srlYF2tMJPwXu8PQYIGNSV0lQ==
X-Received: by 2002:a17:90a:268f:: with SMTP id m15mr5789502pje.190.1590693682172;
        Thu, 28 May 2020 12:21:22 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id h11sm5460561pjk.20.2020.05.28.12.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 12:21:21 -0700 (PDT)
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
Subject: [PATCH 2/4] dt-bindings: pinctrl: Document optional BCM7211 wake-up interrupts
Date:   Thu, 28 May 2020 12:21:10 -0700
Message-Id: <20200528192112.26123-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200528192112.26123-1-f.fainelli@gmail.com>
References: <20200528192112.26123-1-f.fainelli@gmail.com>
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

