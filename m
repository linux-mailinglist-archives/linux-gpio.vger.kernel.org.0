Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C17571E8786
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2020 21:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbgE2TRO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 May 2020 15:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726751AbgE2TQw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 May 2020 15:16:52 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E51D4C08C5C8;
        Fri, 29 May 2020 12:16:51 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id q24so1872302pjd.1;
        Fri, 29 May 2020 12:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CzfV181nJ0czd6Anf4yOzm4xivtTHh+yTDjv58w4w70=;
        b=S/6dcjQIEbJ25Pf3UZKFQPrGqREnkm5v3P/61f8HL1vF049E4Ijm+vZd2V+XHyET2r
         qqJfPzV/JwoVkb10XAOeC296dqcoonvcPt3fSm2T5mG52Hkg996Bf4DQsUvKAJbil+kZ
         3MM1BrmrmQ2XTdkmxsekAzVI2xRpAcpLHhGZLOEM1gVwU3mABllAxZsCWB/JsKKOGkV6
         mT+pS+GeInuKWUKpcKV6K8muEZvUMzs1SFT1S1uKAHGPLsTiCUSuc7GazcKYNwhv3FRY
         ud8VFRAwfuFapAGoALsnL6EQMfB2PoreyoCwx0vFYOR4riF7xw7h0uEKoI8SmX5/lfRt
         OfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CzfV181nJ0czd6Anf4yOzm4xivtTHh+yTDjv58w4w70=;
        b=U23pu5qpzIRnetDmrj7546RTMGJRgW6uVa7Wh9cZh8w4eMJnNHGsrZF7T/f4psBZYM
         YQP8mf76FpMg0o7QZ9h58w01F5/jnyOwXVUkZi86ja8ivEarbo37fx2HbG+yDDZAcPRI
         PQaIbajmMVChdez+7u5OX4Jl9n+FTyrznRmfjcfdsu8eKtSBiv3bQ+uqvCTlBrxeRZwp
         39hE2yZfYNngyYSIMXcAWDW8+R9D1wW0EhKMTs0T9NHXQVsLOoUV+JPcOip0xo25nPgK
         hphQBz0K+8KSgqv6tqLI+CMFSK9eDar4XjvNxhTSOEgtLhgI2pQ+f1rtiE7/IODG2IaI
         vsrw==
X-Gm-Message-State: AOAM531OJ97gGjt9ibjlp56bZWqPx/Pa50c1SigBpUGacl29h/gDqTK5
        Gbo3PQh1P2n1GgxOHtae3NXooMw/
X-Google-Smtp-Source: ABdhPJwiE7JqqB91i+tb2nNu5olc+hQhWoqv8JEsbpHU4cdrfZPZbm+aoD5VorW+QLpxDMUBSjxQBg==
X-Received: by 2002:a17:902:a989:: with SMTP id bh9mr10196254plb.44.1590779811075;
        Fri, 29 May 2020 12:16:51 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id g92sm202505pje.13.2020.05.29.12.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 12:16:50 -0700 (PDT)
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
Subject: [PATCH v2 1/4] dt-bindings: pinctrl: Document 7211 compatible for brcm,bcm2835-gpio.txt
Date:   Fri, 29 May 2020 12:15:19 -0700
Message-Id: <20200529191522.27938-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200529191522.27938-1-f.fainelli@gmail.com>
References: <20200529191522.27938-1-f.fainelli@gmail.com>
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

