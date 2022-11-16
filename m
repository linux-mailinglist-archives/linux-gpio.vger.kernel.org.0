Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 411D462B754
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 11:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232974AbiKPKLz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 05:11:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233007AbiKPKLt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 05:11:49 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A5A729C94
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 02:11:48 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id d9so24363070wrm.13
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 02:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Qej+X9L0LDwif2YwJHaq/jZ9PPv+8zS7y3TDz6dHpM=;
        b=Uq+R2iDQp5PciR2jHtrmk8i/Dq01exWTwx0SqNq1Pj2UXSc7qi2MzrUgUrJt+hnZ26
         QkoA/WztanSIUaPFvF70pF5U5CACe+zQmdSRTmGTQpo1gvEbO/n4kuEzR9CxCRcEgJ7C
         3lOJww7/8vzAnvGGt64kw4lLJg6w6Sep4a9c7UmHJO+4Qil38XLPjl+0u+Ni4BYnEYSe
         DaXFXy1wB63NAxbWepNwSvOyJKQReL0r2px/9QrbdcTGVAmKOOGMJ7lVewCRPjEQCx4s
         LMhH2lodhkK3MeRS5Jj53gyf/CBDaxgzNEM6h1QOinhgJLdv41SDZZXwrS7RhuGsRr4N
         YZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Qej+X9L0LDwif2YwJHaq/jZ9PPv+8zS7y3TDz6dHpM=;
        b=zPaDIPc7EGX/pIp2tLFtD71blYMs6HHiOTKBIWXFXAyoVf44MJysk/qIH874Tmimwg
         W+L0meG7qXnNjvvIpAnbaptdCVvrj8V6dC8/bwcv/WEcKYMjvIQhLV3QkYO7Y20JFNZf
         PeFhEaOh0dB81+KDO0ugnvbJ2e1FDvxbh6FeFRXOLo9rkCuEsrgq5dSCe98SPAcDDUdX
         6rEbvlRhmaqrUteNujNIEyH1A2MYjEWalI+2ssnN4/J3Rp62AVUXuIYBOb1yT45wB51v
         C+WYH0iN+P5SnTPwGZUaE4JYho8VXqCjJj1c3m7TYHuYxQLom5TcfLcBN1cxuE+s6+jk
         XAdA==
X-Gm-Message-State: ANoB5pm7jRJKhtf4MIdg26cH2yM6Mp0PjTqZel3VPV6hSF8kNSubYc8J
        jDZ96CxvhZsWOTqV5sI4Ddj/yg==
X-Google-Smtp-Source: AA0mqf5bwdV7+IAFS9abch8kfaDbStiEwno2CxvELKhTbNGkd+vZAnf3MUiuVS80w5aq4WzSiYqkRA==
X-Received: by 2002:adf:df92:0:b0:241:8e98:42f with SMTP id z18-20020adfdf92000000b002418e98042fmr7871862wrl.206.1668593507111;
        Wed, 16 Nov 2022 02:11:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id h12-20020a05600c350c00b003c6bd91caa5sm1741752wmq.17.2022.11.16.02.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:11:46 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:11:34 +0100
Subject: [PATCH 5/7] dt-bindings: pinctrl: qcom,pmic-gpio: document pmr735d
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-spmi-v1-5-6338a2b4b241@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-spmi-v1-0-6338a2b4b241@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-gpio@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document compatible, pin count & pin names for pmr735d.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index a32e4b4566bb..db505fdeac86 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -61,6 +61,7 @@ properties:
           - qcom,pmp8074-gpio
           - qcom,pmr735a-gpio
           - qcom,pmr735b-gpio
+          - qcom,pmr735d-gpio
           - qcom,pms405-gpio
           - qcom,pmx55-gpio
           - qcom,pmx65-gpio
@@ -116,6 +117,7 @@ allOf:
             enum:
               - qcom,pm8008-gpio
               - qcom,pmi8950-gpio
+              - qcom,pmr735d-gpio
     then:
       properties:
         gpio-line-names:
@@ -440,6 +442,7 @@ $defs:
                  - gpio1-gpio12 for pmp8074 (holes on gpio1 and gpio12)
                  - gpio1-gpio4 for pmr735a
                  - gpio1-gpio4 for pmr735b
+                 - gpio1-gpio2 for pmr735d
                  - gpio1-gpio12 for pms405 (holes on gpio1, gpio9
                                             and gpio10)
                  - gpio1-gpio11 for pmx55 (holes on gpio3, gpio7, gpio10

-- 
b4 0.10.1
