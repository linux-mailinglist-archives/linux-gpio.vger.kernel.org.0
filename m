Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B47D35ECB12
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 19:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232838AbiI0Riq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 13:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232851AbiI0RiJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 13:38:09 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FA91E3F46
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 10:38:07 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i26so16758314lfp.11
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 10:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZxNHa3NmbypE7KiSYNFouVgBSkT6lX8rb1wW96dFOkA=;
        b=AK+HmeIXCt/5GpbOH3C59+xDwTETSWd8lQKz3fvhOoQ5UPOEgpz7lb0NTDU9mo/nya
         KfdYDyrumsOaSxN86vM3R4rhgfm8DJzWP20X8S8FVVd3wF0CQg5QPOrQrEK099Gj++di
         DYeTFTQzS2COmnXIXsh/nHEJNb6T6CGQrDG14ctUjVTg0hhtSlSCJy6vjL1EkeXUfR6V
         xZNgJQjnEiRjp52FliBNsq5S6XwvgkkH1oRvXsbznhiNLuTCwxx+cMYTC9MN2T5GC7IZ
         GZ9cim9247JZYebg/PnmCuDdD0CcC9oAMRM6/00uL9XJspn3yUGzL1AsuRKXNUObBNys
         VSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZxNHa3NmbypE7KiSYNFouVgBSkT6lX8rb1wW96dFOkA=;
        b=J/emVE7lXaGhZRRVRjy/lmxknxotXRnDm71rGDf2LquVOqcoi5FY8yPFk8x9AyGyMF
         Xmxyrjd5b3MXASPpQCTFixsaWPahl7eFyIYwQNyW9NMkeuPwWhHZ/WiPMJhELfWgwnJ1
         ssVGOPKilko/f1jJZpYpbwzOlYf5yYPvy8tdDREisTAPXPY1hoDlYU4/FPvMk3cxg/Iy
         wNImkHca7KStf1FPrntoy/9mveBTQInQRC6bo68CQYas2e3jSCjUdyXKsmZaTh8pmKTX
         9xlqIKoMBQI9qloCilxJSDlZwLPTDk/xa2CqXNGHLu/zn27v0+L8UewBRZbMB8Idb3kU
         XRlg==
X-Gm-Message-State: ACrzQf1hyD3QmkYT3qMLluQCUOCO8j/wFWmEIWooCQ4hwYlMbO5vXVk8
        K/b0eyc8nTKegH8hprT77sJtbA==
X-Google-Smtp-Source: AMsMyM5W9ix5a2wH13d17zz8oTmvuoHeqfyRNXVsb11TNdURJd2vb6M8bAKqBnlk9MzTBj2QkRSQ9A==
X-Received: by 2002:a05:6512:c20:b0:499:18:c967 with SMTP id z32-20020a0565120c2000b004990018c967mr10899398lfu.18.1664300286590;
        Tue, 27 Sep 2022 10:38:06 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:38:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 10/34] dt-bindings: pinctrl: qcom,ipq6018: increase number of pins in pinmux
Date:   Tue, 27 Sep 2022 19:36:38 +0200
Message-Id: <20220927173702.5200-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

One pinxmux node can have more than 4 pins to configure:

  ['gpio1', 'gpio3', 'gpio4', 'gpio5', 'gpio6', 'gpio7', 'gpio8', 'gpio10', 'gpio11', 'gpio12', 'gpio13', 'gpio14', 'gpio15', 'gpio17'] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 76698cd97e8c..7202e2af200b 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -63,7 +63,7 @@ patternProperties:
                       sdc2_data, qdsd_cmd, qdsd_data0, qdsd_data1, qdsd_data2,
                       qdsd_data3 ]
         minItems: 1
-        maxItems: 4
+        maxItems: 16
 
       function:
         description:
-- 
2.34.1

