Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 111BC4265EE
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 10:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbhJHIbt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 04:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233993AbhJHIbr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 04:31:47 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D38EC061570;
        Fri,  8 Oct 2021 01:29:52 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id y26so36453277lfa.11;
        Fri, 08 Oct 2021 01:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lkb1rpTxp3ezL8W0CzTqYzbSnbCPEH62gOKXD45LUwI=;
        b=poefWLp6aXgSyy/BL1sqVpqpaxXamaYwTrj//ErZkBKT0FfIZbNtXk6TE2JTxjdDWX
         oFSG6sDm9E3UC88GSSOrDAtlNtR69B3+clLsRDOl3WdwlLnkTOi7aom+yxW+wq4oZEvC
         EtXsMpWkNyPM9qeAF0hxd+NHKEPf8fHn5ZrTvtLIZnuJjyZzxWwCY9D74GzaA+3iYTXN
         HPwHCcJyZlARKh3rz+x7/CjbeCmCda+9MJcmax3CyMxR99k/Q1CiWQjhpx3lBS6TDnCa
         k+WuPTrxIb35PpKVexDVTb4c6/FbyQwLAVH11xLDuBTyy0fZvJtqycbTFOzWeTwS7KQk
         6Kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lkb1rpTxp3ezL8W0CzTqYzbSnbCPEH62gOKXD45LUwI=;
        b=C0d5oKB4NlejclmJJfRieEiHSvEqJQHDwb1KDV0EIak2R4UKPUna+Ef/UDNkq+t9PB
         aZujSYRgFGl9sRyNeCxSzJuAPcc7kF4jd5Ib6yCGEQZ8GDs1rRsjm22XHODMyWy0XuIj
         BqN+2XiQXV6JGkxpPZpR87nw5fShQpkgqcKknIHCDUrPw3vcazEP5O96Zh36tIRlWxpZ
         y+Mbq9i3pLsmOnybPnT/fAEzWvw+7W8z0+7XBCcgjyzKhxLNWqgItwC+1I+g/4f+lpe6
         M85kN0pH/qMMaHz3UBsU2NJU6huHQbqqjfa8LtrPuQKUd+zZ5s5ZZdEGJA02MICvReao
         drgA==
X-Gm-Message-State: AOAM533+X+uRWixBBG1A52nPlmCdd5H6R16DHoYHO8Ec3dw2aMvTbzEV
        nBYc1HNQzzITYRIbtY5Ju1c=
X-Google-Smtp-Source: ABdhPJxjxeS3yG78Os9mx5PkCqbTxZpo+GPucqTwrhLqIHq+ADlBhrV3ZS0jYcpvZ5VLecVPl6BoOw==
X-Received: by 2002:ac2:509a:: with SMTP id f26mr2838559lfm.563.1633681790434;
        Fri, 08 Oct 2021 01:29:50 -0700 (PDT)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id z24sm219930ljz.93.2021.10.08.01.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 01:29:49 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH linux-pinctrl 1/2] Revert "dt-bindings: pinctrl: bcm4708-pinmux: rework binding to use syscon"
Date:   Fri,  8 Oct 2021 10:29:31 +0200
Message-Id: <20211008082932.1370-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This reverts commit 2ae80900f239484069569380e1fc4340fd6e0089.

My rework was unneeded & wrong. It replaced a clear & correct "reg"
property usage with a custom "offset" one.

Back then I didn't understand how to properly handle CRU block binding.
I heard / read about syscon and tried to use it in a totally invalid
way. That change also missed Rob's review (obviously).

Northstar's pin controller is a simple consistent hardware block that
can be cleanly mapped using a 0x24 long reg space.

Since the rework commit there wasn't any follow up modifying in-kernel
DTS files to use the new binding. Broadcom also isn't known to use that
bugged binding. There is close to zero chance this revert may actually
cause problems / regressions.

This commit is a simple revert. Example binding may (should) be updated
/ cleaned up but that can be handled separately.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
index 470aff599c27..78600a8fe403 100644
--- a/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
@@ -17,9 +17,6 @@ description:
 
   A list of pins varies across chipsets so few bindings are available.
 
-  Node of the pinmux must be nested in the CRU (Central Resource Unit) "syscon"
-  node.
-
 properties:
   compatible:
     enum:
@@ -27,10 +24,11 @@ properties:
       - brcm,bcm4709-pinmux
       - brcm,bcm53012-pinmux
 
-  offset:
-    description: offset of pin registers in the CRU block
+  reg:
     maxItems: 1
-    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  reg-names:
+    const: cru_gpio_control
 
 patternProperties:
   '-pins$':
@@ -72,19 +70,24 @@ allOf:
                         uart1_grp ]
 
 required:
-  - offset
+  - reg
+  - reg-names
 
 additionalProperties: false
 
 examples:
   - |
     cru@1800c100 {
-        compatible = "syscon", "simple-mfd";
+        compatible = "simple-bus";
         reg = <0x1800c100 0x1a4>;
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
 
-        pinctrl {
+        pin-controller@1c0 {
             compatible = "brcm,bcm4708-pinmux";
-            offset = <0xc0>;
+            reg = <0x1c0 0x24>;
+            reg-names = "cru_gpio_control";
 
             spi-pins {
                 function = "spi";
-- 
2.26.2

