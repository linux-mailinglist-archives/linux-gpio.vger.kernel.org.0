Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC9CC689F9A
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Feb 2023 17:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233488AbjBCQtQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Feb 2023 11:49:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233410AbjBCQtH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Feb 2023 11:49:07 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 112529F9D5
        for <linux-gpio@vger.kernel.org>; Fri,  3 Feb 2023 08:49:06 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so4343291wms.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Feb 2023 08:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tePUYI71y0gOvdhCBLpAKPjJwja2/LsMGPyFMOwlZro=;
        b=gcKN8lAMKy0pHaE72s90j36GnpHcJa86A7lSY1413YLj5TnLSd0z4k0vI/HxMKVVfI
         F0Q4WcgV+In/Pb148iY7ngAB8R053MWgfPcEIcRtAiTIWBwhJqzhuM2N+Oio3ouIjKI+
         etQp217l5SZJy4N2ylm81uouS5MrOD/bkQBmrK1FMjdwXi3lZPI4DRO3kpKg16jart3R
         RM4++0bs0VDZQwggssh1njanfx+7aNPRb5PvdfdtvdRrGJB9FXG+0VdvcW9b2WhGSd5E
         ehju2r6Hu+WmmMMun4R9rnfaZQSlFEX1umUrSLha2ZsR8bhGwmjbpYXpUro5/Ye+RK5E
         r5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tePUYI71y0gOvdhCBLpAKPjJwja2/LsMGPyFMOwlZro=;
        b=l7ntmY2WVyUuH9dTuqR+i00ybUAxZzsOflkeYU9VcZIINq6aqLRcCZjoEW0UgCpW+H
         veGNlquLvNF5AMwJq5Ga2CrxO/7qCa8JACteSAeiHdS2AQWYU5HoXP8Si/S3S8+grlvW
         fknQ37+vP4nQqCdRTv8Hy3FjceSlbN1C4upDwYIFI11uWgxT0BeGoYsbj+fE0WZ0a8/s
         Bhr8HB/hwghaCTGs0RIQgNrldIuODZ1kRN03GNH3HGAEx2are4SSCb6GukFPZHnflr4l
         sWk3yLCYBeyNHvZBPELgtFrMvWVPQ9MXgipR96s3Mx37kTzuoWBQfV6RZV96VRiolj38
         RSBA==
X-Gm-Message-State: AO0yUKUQ8uyk+rCCGpMEk6IcqpRF7UXbinYAG7r6NiiQFugCvWR6ZDUm
        cs1tLhOb7ovybB41usxcT8yPn9vxt5fzl5Pq
X-Google-Smtp-Source: AK7set8a26yEaDF6IuLWTow8YjMebknfe3l+D3az4yN2FllHg53SciCFCAMpWR87/9Z+6QHLgrj/5A==
X-Received: by 2002:a05:600c:3489:b0:3dc:de85:5007 with SMTP id a9-20020a05600c348900b003dcde855007mr10544101wmq.21.1675442944612;
        Fri, 03 Feb 2023 08:49:04 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i21-20020a05600c355500b003dc4b4dea31sm3503247wmq.27.2023.02.03.08.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 08:49:04 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/5] dt-bindings: pinctrl: qcom,sc8280xp-lpass-lpi: correct gpio-ranges
Date:   Fri,  3 Feb 2023 17:48:53 +0100
Message-Id: <20230203164854.390080-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203164854.390080-1-krzysztof.kozlowski@linaro.org>
References: <20230203164854.390080-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The SC8280XP LPASS pin controller has GPIOs 0-18, so correct the number
of GPIOs in gpio-ranges.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
index 9a3f1fb8c2f7..200b3b6ccd87 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
@@ -134,7 +134,7 @@ examples:
         clock-names = "core", "audio";
         gpio-controller;
         #gpio-cells = <2>;
-        gpio-ranges = <&lpi_tlmm 0 0 18>;
+        gpio-ranges = <&lpi_tlmm 0 0 19>;
 
         dmic01-state {
             dmic01-clk-pins {
-- 
2.34.1

