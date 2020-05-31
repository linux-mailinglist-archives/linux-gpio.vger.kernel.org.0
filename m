Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7063B1E94A5
	for <lists+linux-gpio@lfdr.de>; Sun, 31 May 2020 02:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729571AbgEaALP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 May 2020 20:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729522AbgEaALP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 May 2020 20:11:15 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B9DC03E969;
        Sat, 30 May 2020 17:11:14 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id c3so7757312wru.12;
        Sat, 30 May 2020 17:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eeOtfUnNMqcaG7SNioiM08zG3B07ZSO5p4wZgemPb6U=;
        b=r8kDQ9TJ/zw/d+P+7AZ8A5uYtTUJYxPwGpcpXIvEhKkzP3sN9gf54eX9zHYYcfV2p/
         7eChzNehPkaG8nsoUdBF27Ahn/JWJPkr6HovLW3KnqhRg3DF0HBROEojt2LZp79L/NGx
         FsZArpt31Z9JNRPbxPbwdCzl8ESFndplykUDPRZca6ojdSice5KfEi36Wd6/BiOXPPL4
         xHtI0DrP9gfRyAI1WT9vmxS2lVAHyLOlUNH3kw2/Pa83NsC1pclE1fkgO1gcsEBW9CvO
         NOo0lqGKCmtVAVvd1qhtzizjKgxQwm7AF7+TD6Mofce6q2+ZshsVb9Llpf8o+Ao8gje2
         qAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eeOtfUnNMqcaG7SNioiM08zG3B07ZSO5p4wZgemPb6U=;
        b=GpfQJUdPilAOPReMF7oBOtbfLba8+pwo92CsGSI0XusnXF6V42Hug6WKWN73Q1tQBJ
         z22zQvwL9sIzbx2mM+kOGlP5P3QaQsKl71JrFZftnPR2/GWVeCxyOHgv7Z3wVy3r7QJB
         0Cp3Bt4m+eQY04sACoUMCrlhq2d1Ac2LTC7lvKcYo9W3H+HRpaG9eEsgu9O3sDZOU6Wd
         ed24MUAm7+bbmiMFgORxDknnhrKYRLoxHvUfQlhLGVXiDFbsJgFhpPGhYhMvdOqkItgG
         +5u6Suy+oDhk8ysCBGFzltH4GCwzO4YsIWTWqfcB0HI4NHpG4pPPEAmmpHr3TIlWitRd
         wxZw==
X-Gm-Message-State: AOAM5337Rn+87lgv5cUB7A0msYH1AXjMruJrrzchzZ8Llua+mFurbK1n
        x5afKW7QftdPNmb2lt73wc428Kw0
X-Google-Smtp-Source: ABdhPJzgqbBmeJjv5bbxJymjCkeb6LrQ6AVgLDZTVItGXROWg1+X/8xllqQJJ84cmk3A7+qnAYJMfQ==
X-Received: by 2002:a5d:490f:: with SMTP id x15mr15033799wrq.259.1590883873134;
        Sat, 30 May 2020 17:11:13 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d17sm15455807wrg.75.2020.05.30.17.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 17:11:12 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dt-bindings: pinctrl: Document 7211 compatible for brcm,bcm2835-gpio.txt
Date:   Sat, 30 May 2020 17:10:58 -0700
Message-Id: <20200531001101.24945-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200531001101.24945-1-f.fainelli@gmail.com>
References: <20200531001101.24945-1-f.fainelli@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the brcm,bcm7211-gpio compatible string in the
brcm,bcm2835-gpio.txt document.

Acked-by: Rob Herring <robh@kernel.org>
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

