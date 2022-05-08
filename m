Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E713151EDEB
	for <lists+linux-gpio@lfdr.de>; Sun,  8 May 2022 15:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbiEHODj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 May 2022 10:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233715AbiEHODg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 May 2022 10:03:36 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8330DFB9
        for <linux-gpio@vger.kernel.org>; Sun,  8 May 2022 06:59:45 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id k27so13516585edk.4
        for <linux-gpio@vger.kernel.org>; Sun, 08 May 2022 06:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xCzqSaVgkigfovczvrR26PQosAlqdYSj2cgF8HeNqSw=;
        b=w6Arzao2UqIYuh3UFze5/E62F9WJsxirQ0QNVWDAi6xLONvtHzbQJvn2drnPVJj6W6
         UuGm+Y/XAlU7VXOhJRH2G0uCr4oUrGqI5wZccuvW7Tirj5FX7u1wu1R3QTOlyrfLxPJt
         rxIeUSm48KEwLX4njqIEe8jjBVOX2FeajRhjIV1XcdAModpmmE1UtskKq7smBX66gBg/
         XpGC921JykCasRWQSkGZYPBLf+sMg5zP+Lne9v1ZkT7FhIxWv6A8NPTvn9C6kpGLfmyn
         j1kHeG4MdpMmxLJvSo9MW+Px6Y/t5FRujVD8Y6jycxf+g+a3vj0O8kcsnfAfGRsZDYnw
         lGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xCzqSaVgkigfovczvrR26PQosAlqdYSj2cgF8HeNqSw=;
        b=gE3vgElgMbVEY/Oc627AoSvKjGc209DKkdD9CDlKQwaQJQBMfp4r+gYdV1tOAKKW0I
         IIRocCDPXVnh7EJflg1lNtROcSYccvAQE6JmyTOUUeO9n9PoSgMQk6hma1sxwEwL7nio
         2/WRJT8Gf+/vqIKmnfWYFDvBt5s596g5+Vy7Ysz05QvYvY8zIwgS5Fy6MnFZsqJXbF82
         C1eajpFCecZmMWi4a4PY3x7KELUNxk8pvb1Zp3PtU0mOef722Wa3lpUGgscWJanU2EQH
         uizmV6nmIzJRE2g4rhEERtzT8t2eQZJaHb0JVc1l3tRgpVCQwWYtBhxPMEkwBNpB8apd
         P1kQ==
X-Gm-Message-State: AOAM531gk7hUc7G477ehtNwuBnhHDd9Hw+OdfVD9U0+zv5386xZ5R1xQ
        ncnzl/Nc2E+3thekDhZTxtST4Q==
X-Google-Smtp-Source: ABdhPJxmiYnecxtNEGNXUDweujoI2ZZSy2gRZeRG/yN39SLC53d4+BLrPYYQj3i4leRZPXvd1pc6JQ==
X-Received: by 2002:a05:6402:2214:b0:425:d6ed:de5d with SMTP id cq20-20020a056402221400b00425d6edde5dmr12614920edb.383.1652018384303;
        Sun, 08 May 2022 06:59:44 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id qz24-20020a170907681800b006f3ef214dc6sm4075524ejc.44.2022.05.08.06.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 06:59:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Luca Weiss <luca@z3ntu.xyz>, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] ARM: dts: qcom: add missing gpio-ranges in PMIC GPIOs
Date:   Sun,  8 May 2022 15:59:32 +0200
Message-Id: <20220508135932.132378-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220508135932.132378-1-krzysztof.kozlowski@linaro.org>
References: <20220508135932.132378-1-krzysztof.kozlowski@linaro.org>
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

The new Qualcomm PMIC GPIO bindings require gpio-ranges property:

  qcom-sdx55-telit-fn980-tlb.dtb: gpio@c000: 'gpio-ranges' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-pmx55.dtsi | 1 +
 arch/arm/boot/dts/qcom-pmx65.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-pmx55.dtsi b/arch/arm/boot/dts/qcom-pmx55.dtsi
index 6571b88d018a..9de7578a4c5f 100644
--- a/arch/arm/boot/dts/qcom-pmx55.dtsi
+++ b/arch/arm/boot/dts/qcom-pmx55.dtsi
@@ -69,6 +69,7 @@ pmx55_gpios: gpio@c000 {
 			compatible = "qcom,pmx55-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
+			gpio-ranges = <&pmx55_gpios 0 0 11>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm/boot/dts/qcom-pmx65.dtsi b/arch/arm/boot/dts/qcom-pmx65.dtsi
index 8701396fe1f2..abf229a8b75a 100644
--- a/arch/arm/boot/dts/qcom-pmx65.dtsi
+++ b/arch/arm/boot/dts/qcom-pmx65.dtsi
@@ -24,6 +24,7 @@ pmx65_gpios: pinctrl@8800 {
 			compatible = "qcom,pmx65-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
 			gpio-controller;
+			gpio-ranges = <&pmx65_gpios 0 0 16>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-- 
2.32.0

