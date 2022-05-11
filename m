Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A61EF52401B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 May 2022 00:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343924AbiEKWN5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 May 2022 18:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237482AbiEKWN4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 May 2022 18:13:56 -0400
X-Greylist: delayed 456 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 11 May 2022 15:13:55 PDT
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A7D21B151
        for <linux-gpio@vger.kernel.org>; Wed, 11 May 2022 15:13:55 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0716220865;
        Thu, 12 May 2022 00:06:15 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm6125 compatible
Date:   Thu, 12 May 2022 00:06:08 +0200
Message-Id: <20220511220613.1015472-3-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511220613.1015472-1-marijn.suijten@somainline.org>
References: <20220511220613.1015472-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The pm6125 comes with 9 GPIOs, without holes.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 22dbcba752d0..ef7a4a9450a4 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -20,6 +20,7 @@ properties:
           - qcom,pm2250-gpio
           - qcom,pm660-gpio
           - qcom,pm660l-gpio
+          - qcom,pm6125-gpio
           - qcom,pm6150-gpio
           - qcom,pm6150l-gpio
           - qcom,pm6350-gpio
@@ -107,6 +108,7 @@ $defs:
         description:
           List of gpio pins affected by the properties specified in
           this subnode.  Valid pins are
+                 - gpio1-gpio9 for pm6125
                  - gpio1-gpio10 for pm6150
                  - gpio1-gpio12 for pm6150l
                  - gpio1-gpio9 for pm6350
-- 
2.36.1

