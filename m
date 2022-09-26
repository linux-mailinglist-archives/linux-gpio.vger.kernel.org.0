Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D38F5EB29B
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 22:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbiIZUr7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 16:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbiIZUr6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 16:47:58 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5448CA6C6A;
        Mon, 26 Sep 2022 13:47:57 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 9F07184840;
        Mon, 26 Sep 2022 22:47:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1664225275;
        bh=YgGGygxLOX6AtyqmthuByHY55YHOMLRCHmVk7kCsuP8=;
        h=From:To:Cc:Subject:Date:From;
        b=CCMKYKcopesFvZ9SleifdFZKYE0S+xSQp1oj8eYIDObbPcUZ/Giu12EGK5b3AbYjU
         UECNLex6juq5+QYH4qJJs8XLRXIzJ85z6r1xN808Bh2TwNB5jDULB6hP87TO1dVIoT
         FnRZr+AIRNCjnvFyhiFFIx3mkm6Yl9cviqjVAANLAD0EB/6BH0lm6TeIi2Vqf3cVlS
         4+Ttxea8yoHQ5LuJYICGTQ+s6yGPSMmhBGzFpzcTW8WDBelHb5lgzfSA67P1gog2rL
         UYFPKPU5J46BxfAFgEeoRYcnw5kqhLfoomRAH1ElI6pwRyuoWEEcoC7GpwzggxKUtE
         gHHsrzhprq+YA==
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] dt-bindings: pinctrl: st,stm32: Document interrupt-controller property
Date:   Mon, 26 Sep 2022 22:47:52 +0200
Message-Id: <20220926204752.381798-1-marex@denx.de>
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

Document interrupt-controller property and its interrupt-cells.
This fixes dtbs_check warnings when building current Linux DTs:

"
arch/arm/boot/dts/stm32mp153c-dhcom-drc02.dtb: pinctrl@50002000: gpio@5000a000: '#interrupt-cells', 'interrupt-controller' do not match any of the regexes: 'pinctrl-[0-9]+'
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
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 12598e036287b..9d59208d83c18 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -64,6 +64,9 @@ patternProperties:
       gpio-controller: true
       '#gpio-cells':
         const: 2
+      interrupt-controller: true
+      '#interrupt-cells':
+        const: 2
 
       reg:
         maxItems: 1
-- 
2.35.1

