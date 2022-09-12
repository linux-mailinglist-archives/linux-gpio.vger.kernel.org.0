Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11F675B544C
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Sep 2022 08:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbiILGUg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Sep 2022 02:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbiILGTk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2022 02:19:40 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E11A2A257
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:45 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a8so13100283lff.13
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zWIyjK4dxfH9A9tyS53A/sJlwsqf8yeDaeYqVdTxLgc=;
        b=hpCVVDO6lm/ERZUqGXJ74SnKDvWrhTMHmEv5Fam/9wconDWlH0JRvADTQgdAPsUJJ9
         IGTP8/gqha1csTIxGRflb8WaBi8mi+jJpu53V8O2LKO4tA6kcjh0a2Z3TKW2ZfywNaIS
         xh483O0miukpvmb+SSWep5RbHM8GSqzAuizfdCbMfT25qX6iLaahoI0qvC6Xi9vg5LAf
         o3IT4r2b8Y74FTGwOWSSJNKjIj2z4g6XAP05NbWYzO5tI9/VFqz0eIVYc/SKzwbEKWUQ
         Uvveo6ZruqyRw7m3J3Zb2IplLch2HrTmjNuXRKF5MGtWSzjTbFjaT7ldeH2QQDyEWlBG
         KZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zWIyjK4dxfH9A9tyS53A/sJlwsqf8yeDaeYqVdTxLgc=;
        b=eCVzPQf5mJnp1cKK/iCwSTWHjA7KqYdwh+s+P7C54NIoOsfoZawDaYQR0m3e9HiJuw
         9jPDFoL4ouvTJ2VCCB7u7YtO7MiE9Hv7NIElBfzmHE3DYo6u49aISgUIg5+CGe1c+qIZ
         EapQHpU1X+MFKxFpfvJ+50KSa+WeXTRwcudNJPdv5dgDJQF/4V10UhK5Wfukz0rJRHpD
         dKu48IuVRCDtULShn89Yp6bF0+Bbec7N7T9oStRZV9AVzRqvzloA851i1UmZ10ZgzFgO
         FSA0sVFAxhcRrb04mXhgAajhEIKnNnPtmiypa/x7An6s9jiZlO/ynw2/hzevai39K6et
         KMfA==
X-Gm-Message-State: ACgBeo0oEVnbxKVz/+KiOXg3mMlI+sE63HrdxHGWPd3wgU3JBopTcc5Q
        YN7ejlkSdqT21iAGg/3CgoyIF/yE28nWbg==
X-Google-Smtp-Source: AA6agR5r3zi0vLyk+9FSxThtVD8PFl2WWjBbHuTJ/T97nO1HfcFmdyhBehkF/qXfvwHnllEZGutEMw==
X-Received: by 2002:a19:5e5e:0:b0:497:a26d:89ef with SMTP id z30-20020a195e5e000000b00497a26d89efmr9255418lfi.555.1662963502031;
        Sun, 11 Sep 2022 23:18:22 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 22/40] dt-bindings: pinctrl: qcom,sm8450-pinctrl: add gpio-line-names
Date:   Mon, 12 Sep 2022 08:17:28 +0200
Message-Id: <20220912061746.6311-23-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add common gpio-line-names property and restrict gpio-reserved-ranges to
fixed size.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
index 296f503c1d97..9cd97a467648 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
@@ -27,7 +27,14 @@ properties:
   interrupt-controller: true
   '#interrupt-cells': true
   gpio-controller: true
-  gpio-reserved-ranges: true
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 105
+
+  gpio-line-names:
+    maxItems: 209
+
   '#gpio-cells': true
   gpio-ranges: true
   wakeup-parent: true
-- 
2.34.1

