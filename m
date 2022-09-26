Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E16E5E9ACB
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 09:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234241AbiIZHpj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 03:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234158AbiIZHom (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 03:44:42 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEEFDD13F
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:44:41 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id k10so9501578lfm.4
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=F5D4sdW4addRDScKR5O0Vv2idDpBx5dj1H6nu25Osyk=;
        b=pLs0iRMBlJbB0w4l8JUSWYJPiU6/mKfZAyblg5MVnv5rearDiYKj5hc5wsen15y5ui
         u9GcZmaTpFvOLDUFIlYvNl0ERanh5CJo/k/N6XyO8ZCx4vr/zeMSzE6Voe82ZS3X3WnI
         s/ycH3B7NwREQm5F5NAMfj0JyRyyfo1jai2UZVQwD/+sf1Pt9BcHdLNzn1LBdwtJR/So
         cZtTC0oXFh7iK8LChmVHd29tp2F36QOPJ7zsXc61eTIBWxqkve5C7xNRy97js43b3hvv
         faNtPco/xiBT1zwmQxmqHbgeUvwCCYXgz6vtveTZXGKSvbMM5vo9QQm2dwbM8pCBjrCM
         RCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=F5D4sdW4addRDScKR5O0Vv2idDpBx5dj1H6nu25Osyk=;
        b=JD+RZ1FTj/1JmAym4aPDYvLgw8eDKbSjBVunC1N44rcZanJg0NTksBuFnKykplzV7r
         rHqFUGlycqvmIAVCffwXfAXfL+N5t/5JQTqBK4amtDCj1g71WTVS7xI8jg/C687PYcZt
         R3qcU9C1FATUCCP52+yuZuPwj+k4kcoQLGq4EpmHhvPQquGbwDf81YJU9n/X/Czh7hCB
         w7AUcxoh60/D2v4jEZFDtBObTdN3OYSk/nAbYSKHZ70eO2mrlwNlEcjCrn+YREh8cKLk
         kFif1c+av5V/n6Wp0Bovs2byF4y5dLoVaEBXV3U7W/1mNKIq5y/wg3R42bQEcsbSJrwG
         K6vQ==
X-Gm-Message-State: ACrzQf2szqzxcWWq6PbhYqs8LR1WF9R+CAu2ps2XY+Unq7f4ecTeqAzZ
        PHdh66TB0Js5j20kTJyMS5yarQ==
X-Google-Smtp-Source: AMsMyM5e5wcTQtJ+G14KvAhXAryg7bsMjZ0miT3lbAE9C/zd4Di6ECQoKhf9FQvf5cCoLxE9ItBsmA==
X-Received: by 2002:a05:6512:3989:b0:49f:480f:c9ae with SMTP id j9-20020a056512398900b0049f480fc9aemr7902043lfu.343.1664178279954;
        Mon, 26 Sep 2022 00:44:39 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:39 -0700 (PDT)
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
Subject: [PATCH v2 08/33] dt-bindings: pinctrl: qcom,ipq6018: add qpic_pad function
Date:   Mon, 26 Sep 2022 09:43:50 +0200
Message-Id: <20220926074415.53100-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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

The IPQ6018 pinctrl driver supports qpic_pad and DTS already uses it:

  'qpic_pad' is not one of ['adsp_ext', 'alsp_int', 'atest_bbrx0', ...

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 9c6e2cb0c6a5..0bd1aded132d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -92,9 +92,9 @@ patternProperties:
                 qdss_ctitrig_in_b0, qdss_ctitrig_in_b1, qdss_ctitrig_out_a0,
                 qdss_ctitrig_out_a1, qdss_ctitrig_out_b0, qdss_ctitrig_out_b1,
                 qdss_traceclk_a, qdss_traceclk_b, qdss_tracectl_a, qdss_tracectl_b,
-                qdss_tracedata_a, qdss_tracedata_b, reset_n, sd_card, sd_write,
-                sec_mi2s, smb_int, ssbi_wtr0, ssbi_wtr1, uim1, uim2, uim3,
-                uim_batt, wcss_bt, wcss_fm, wcss_wlan, webcam1_rst ]
+                qdss_tracedata_a, qdss_tracedata_b, qpic_pad, reset_n, sd_card,
+                sd_write, sec_mi2s, smb_int, ssbi_wtr0, ssbi_wtr1, uim1, uim2,
+                uim3, uim_batt, wcss_bt, wcss_fm, wcss_wlan, webcam1_rst ]
 
       drive-strength:
         enum: [2, 4, 6, 8, 10, 12, 14, 16]
-- 
2.34.1

