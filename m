Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C40D4687AB9
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Feb 2023 11:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232883AbjBBKra (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Feb 2023 05:47:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232884AbjBBKrF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2023 05:47:05 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D1B4A1C4
        for <linux-gpio@vger.kernel.org>; Thu,  2 Feb 2023 02:46:39 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so1049352wmq.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Feb 2023 02:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cks4wMbjCBltllrGzoNqni74MNTNZ82VfFRgVWAqZms=;
        b=m6Bv62Sj9LcnhgEhvF2/694t1wIhXiS0fu2XF83yjDzkAS8Hdd65QJNAztYkFQYdkm
         guWfg9QsDwTBE2KvOjRXsnHIZXxKqIkp72qWVrYzDD4khi0lDjmoDLcn8Rr+vjTlk+sZ
         z3bytpSQrYH38bn/LOxeSV6crI8mI4Bom+HrBs0qaj2nS1mTbLahosKnviH6KOO7vHVa
         3yJpQLSfH+PcGCDlrloHz+sUQD2zuxjHVqsQYDX1e+cvk5TTtOB5F2uPZg3xvdh2P2Ft
         BME9ejLhhyK6ZUnSYil7RN2gmSnSAOJLnq62yB49mZbc0qnn5b47AIG9Py0ezqiU/Hyy
         /DSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cks4wMbjCBltllrGzoNqni74MNTNZ82VfFRgVWAqZms=;
        b=WqLsm4x/lMs7PBDGKXfUEEnWw/b3xZSt/ZeQ+ZHnVF5epR0of0piDSFQpwSjZdIpVP
         q4jNqDpn5fXr0F4m8OuCYSU7flJPZP75Qex61pd+QgD40H6OLCUefygkWN5JF1gzWNym
         7XoWfYgdOiPSYS3UP16aVqHUecCaOxMZzEyu1ODkZ+xhYXsD9qyByzZzhjjg+fVfvFPs
         q8lesRTFmJRHSbrdOWuv8wZu8dacDvUO6FlDXZvG+l+4aM2Vuosa5jaw8uHKf/o+tiR5
         u2WD5c5bQQ5EI33lyB1NxXnlCU0LfG+Ace+ohwzykPHJY5gHTnRa3z5liNdO6S2Ynmgg
         t35g==
X-Gm-Message-State: AO0yUKXrw5lml/FJ+dA/K1DMpTuAMwKAkpZCyhhevO+hwALUF0rA1YJC
        4NtHwmrbEo2BDJiusldziUI1PQ==
X-Google-Smtp-Source: AK7set+2hRR/JENpAHUQhEtStNt9fX4aZKYHWFvQyRdH2VWveS+UuUkSXsL9zfF59RYt91DQr6INtA==
X-Received: by 2002:a7b:cd17:0:b0:3dc:5ab8:7d74 with SMTP id f23-20020a7bcd17000000b003dc5ab87d74mr5559637wmj.3.1675334763074;
        Thu, 02 Feb 2023 02:46:03 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n24-20020a05600c181800b003dc3f195abesm4307329wmp.39.2023.02.02.02.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 02:46:02 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>, Iskren Chernev <me@iskren.info>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 07/10] dt-bindings: pinctrl: qcom: correct gpio-ranges in examples
Date:   Thu,  2 Feb 2023 11:44:49 +0100
Message-Id: <20230202104452.299048-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org>
References: <20230202104452.299048-1-krzysztof.kozlowski@linaro.org>
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

Correct the number of GPIOs in gpio-ranges to match reality.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml        | 2 +-
 Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
index 56e058c315f7..cf561dff8893 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-pinctrl.yaml
@@ -131,6 +131,6 @@ examples:
         #gpio-cells = <2>;
         interrupt-controller;
         #interrupt-cells = <2>;
-        gpio-ranges = <&tlmm 0 0 180>;
+        gpio-ranges = <&tlmm 0 0 181>; /* GPIOs + ufs_reset */
         wakeup-parent = <&pdc>;
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
index e13d50d6d388..797242f68b1c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-tlmm.yaml
@@ -130,7 +130,7 @@ examples:
         #gpio-cells = <2>;
         interrupt-controller;
         #interrupt-cells = <2>;
-        gpio-ranges = <&tlmm 0 0 203>;
+        gpio-ranges = <&tlmm 0 0 204>; /* GPIOs + ufs_reset */
 
         gpio-wo-subnode-state {
             pins = "gpio1";
-- 
2.34.1

