Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3CA55FC81C
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Oct 2022 17:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbiJLPQi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Oct 2022 11:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbiJLPQb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2022 11:16:31 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC8DB165AF
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 08:16:30 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id f22so6388639qto.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 08:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=izSN7xRQqssnM767hbIgGLtwY0E8L+UfBxDaexTRlTs=;
        b=M6wQigtVJrVPC9MwqwM9yRS8mMnzbDo6SepkFNF7b3AsYFewTcyUeL3vcV4h+D+WpM
         pLguOZaXQsbK6Z3z1g4PoKakPvUekqRZW/Aed7X2BddyI3OnNFQC2C4jZTtrduwAxRL8
         18lYklKksityuqtq3tayqZoN3deGG/Rs5lARuQ8wLNpqi1rKhqU+NFCYmj6xRSAhbGA7
         JU1234EIygn3hHBiz1aZw69wp93zU3ad5rt4WsxUyDy7os+Arjh8HdsqSldJEJ5whTfJ
         v08dZ1v2nL2WCJ99Ml6LTrOVVZqiZDUxkbQrcwidd79EGs+XjVJsioSDEP6tnmggJvqY
         ZozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izSN7xRQqssnM767hbIgGLtwY0E8L+UfBxDaexTRlTs=;
        b=SwnY89hw+Vjz6aYgkepgvD0ubIj2rTlrPCMHVOOHEdn4Xfp3I0IOa+QZgMHEW3o7Am
         h6W0P5FXU6kM7hZx612F13Kbx0m9r1tX0gQBIDA3Y/z38/+4T8HM+yoJLtxIemI4Fjbm
         1Wbb901JyAwbdZTaLB4Vc7nq3fp0tq5VjS9GzT2zVhnrRuHE4LhYXAlxH5VeXHOAdhmC
         yx+a8OXJmwx+/7zZJmQCsEEgo+laOc2QS4v7oDnpqh3rmPXF1y2doj9oMakaLtCFe7MS
         2QoZUOcg4m0bsDCa2bW2w+VwNbQz62XIAZ4O19x7zdCb6YZgYnfxtX99k8RGgAprV4pW
         yONA==
X-Gm-Message-State: ACrzQf0LJOox4qp0tD7VJ6HRzmndbc3PlPjb8BDD3CefssdUHPAGv6yx
        kfJa5JK+5E9p9Vbf8Pyaz02c/xZ2BIEuuA==
X-Google-Smtp-Source: AMsMyM7jBS8OcjxwxEwcD4uNNieiG8sP6kVEP5POfNJ+BoROi19TVVYwpicNF8ld4KbkfuPlccRzOw==
X-Received: by 2002:a05:622a:1788:b0:35c:bf57:caa7 with SMTP id s8-20020a05622a178800b0035cbf57caa7mr23920283qtk.470.1665587779925;
        Wed, 12 Oct 2022 08:16:19 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id u2-20020a05620a454200b006af0ce13499sm16671612qkp.115.2022.10.12.08.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 08:16:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/4] arm64: dts: qcom: msm8998: add gpio-ranges to TLMM
Date:   Wed, 12 Oct 2022 11:14:13 -0400
Message-Id: <20221012151416.38645-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Qualcomm pinctrl bindings and drivers expect gpio-ranges property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index f05f16ac5cc1..2c4acf227253 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1056,6 +1056,7 @@ tlmm: pinctrl@3400000 {
 			compatible = "qcom,msm8998-pinctrl";
 			reg = <0x03400000 0xc00000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&tlmm 0 0 150>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
-- 
2.34.1

