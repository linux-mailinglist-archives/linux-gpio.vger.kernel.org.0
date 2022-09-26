Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 607B45EB298
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 22:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiIZUrl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 16:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiIZUrk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 16:47:40 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C137A723B;
        Mon, 26 Sep 2022 13:47:39 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id CAB0B84840;
        Mon, 26 Sep 2022 22:47:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1664225258;
        bh=kpYKicGBQnkLSxdmAsMDOMEXCumyXTXdZ4fKWy3HcN8=;
        h=From:To:Cc:Subject:Date:From;
        b=w6f1qd0a3LCIwJ2Ecjh9V/6Vel4R92AJzww7OhtXCiS6XvPKrmNI1Ybi9rIXTLc/j
         Ufn10rPbqw5OQYrrbK8bCY/NN70fPrmUX6Cbo6UHq+rXFLTgmC+8BAGIjG0AyS20SC
         1uAvwNsNNR5g4L9oBX68E7Jt6Q/BEQRV59BLDQH3b7IrXB/O4R8Wc4Ue/lErS5sJQ3
         VOhrJe6CQgOE0NFsn1xdpt4sssvFKCo6N7jk/jPB5/NGVdjEUI8hxBnbW7jxikaaRx
         /FSDw8KpPvqCAQ/ZbUxKzWrgs388xeFQpn/7dbiPxv0b14TDIxzsCYvg/2n1emFxWa
         5navMrrZ9mZfQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] dt-bindings: pinctrl: st,stm32: Document gpio-hog pattern property
Date:   Mon, 26 Sep 2022 22:47:35 +0200
Message-Id: <20220926204735.381779-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document gpio-hog pattern property and its subnodes.
This fixes dtbs_check warnings when building current Linux DTs:

"
arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: pinctrl@50002000: gpio@50003000: 'rs485-rx-en-hog' does not match any of the regexes: 'pinctrl-[0-9]+'
"

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 06229d93c24cf..12598e036287b 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -107,6 +107,12 @@ patternProperties:
         minimum: 0
         maximum: 11
 
+    patternProperties:
+      "^(.+-hog(-[0-9]+)?)$":
+        type: object
+        required:
+          - gpio-hog
+
     required:
       - gpio-controller
       - '#gpio-cells'
-- 
2.35.1

