Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612AF1E6A54
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 21:22:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406342AbgE1TVY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 15:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406317AbgE1TVV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 15:21:21 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B503C08C5C6;
        Thu, 28 May 2020 12:21:21 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 185so41280pgb.10;
        Thu, 28 May 2020 12:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CzfV181nJ0czd6Anf4yOzm4xivtTHh+yTDjv58w4w70=;
        b=SEwS6IkmE/Vm6DfcfMAtkS88bdBGDTwOipqJzGzYUEgqSlmUGL4CsRcYnbhDYsTOc/
         iVXx6qAo+DcuR+V46NVIWhweiXhNraus2SQxu7AwRoJ4pk6mmLSPsf5sopuYqkZkLVJS
         O3XJAR/cdyjuFqgxmiCazRx+p9dZnmviVkapsfPgfrkoaXV4raK3mFMMrkUe5oYbVW3L
         a6s1s3Zz0r/vK6f/u/tgrGhDWGd9ufQo4YdcYZm1jaL2RskV2JzWZmZCVKPfyEF84ax0
         KHCFfNfquzsilCbDgQ8BqlhTLJOPFIBJgYpUZoIu3kqfxXr2SItKP9HU/YNtrnC9EB1b
         100g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CzfV181nJ0czd6Anf4yOzm4xivtTHh+yTDjv58w4w70=;
        b=LK2XYI5bqpEFQW66RjZxqL7gscjBDFUAKFaNxMNxxKJC/AtR0VhPratWvBqlP5PFxa
         Ostgypaac8AigbhUZZra9xJGGxMnlyf0MhpqQqlXq9NHjeV7cXJ0uATYxr3odJYW8wZ0
         l6Mgo+dqK6e3+rxoBxB5rTWitOOKeMaqJLhE0ho0BS9k2nOGyNFTGRGplajEUBwyARlH
         NiDgQ6dSkt90gH7cROlyoqrCtRKN3k1a0YnKxUQA1S3skiiB17jjCujBXYiaqyjY+8Ts
         PUk0kxeynZreSGJlyEn2UxpfbeaI1MOjq8V8rqesskINObvOWFgIyWUhkjrBRGtoNV2K
         kTcw==
X-Gm-Message-State: AOAM530IZzrsIJBGeOXpuMSOdmUs/ItxwtaBCXJW7uv0avv4scaWSCcr
        jNO4Pjl2IanDhJIUZpzvnSaYkjCZ
X-Google-Smtp-Source: ABdhPJwajHR+L1XGUzSZpZbJ6JCmAwM42UTuf8mYpiuyGtE7PLwR/qlqTJZGYpaZv9PvQQpzp7KA2A==
X-Received: by 2002:a62:1845:: with SMTP id 66mr4749410pfy.192.1590693680279;
        Thu, 28 May 2020 12:21:20 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id h11sm5460561pjk.20.2020.05.28.12.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 12:21:19 -0700 (PDT)
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
Subject: [PATCH 1/4] dt-bindings: pinctrl: Document 7211 compatible for brcm,bcm2835-gpio.txt
Date:   Thu, 28 May 2020 12:21:09 -0700
Message-Id: <20200528192112.26123-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200528192112.26123-1-f.fainelli@gmail.com>
References: <20200528192112.26123-1-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the brcm,bcm7211-gpio compatible string in the
brcm,bcm2835-gpio.txt document.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
index 3cab7336a326..dfc67b90591c 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
@@ -9,6 +9,7 @@ Required properties:
   "brcm,bcm2835-gpio" - BCM2835 compatible pinctrl
   "brcm,bcm7211-gpio" - BCM7211 compatible pinctrl
   "brcm,bcm2711-gpio" - BCM2711 compatible pinctrl
+  "brcm,bcm7211-gpio" - BCM7211 compatible pinctrl
 - reg: Should contain the physical address of the GPIO module's registers.
 - gpio-controller: Marks the device node as a GPIO controller.
 - #gpio-cells : Should be two. The first cell is the pin number and the
-- 
2.17.1

