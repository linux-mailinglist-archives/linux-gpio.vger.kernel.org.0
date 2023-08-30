Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05F4778DD29
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Aug 2023 20:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243401AbjH3SsI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Aug 2023 14:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242945AbjH3J64 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Aug 2023 05:58:56 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3862D1B7
        for <linux-gpio@vger.kernel.org>; Wed, 30 Aug 2023 02:58:51 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52683b68c2fso7037665a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Aug 2023 02:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693389529; x=1693994329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMuJsymgFdsKAjrQm0VavHQLfVQtcng3/FrcyEkfn3s=;
        b=E9KAugekmsfrO9WLBe3T4gGJeEPAMlwjS7sUMSiq+jRcLCkdaxU0N7KKILdF3nCO/N
         saNuH6ylHpVjjbe8auwQpqMC5RwLB1ePIENd0C2Vwevl+5tjf42EffvmnBAQ6s6jqGk1
         vl8zIPW/9wx/tCSrjKiq5lOTM5kGCXBpAMIZ9RtsWrmXYZq8WmR4Bl1ObZ6XDPs9pvIt
         8euWTgSX2yKXV7FXefCaw2RedaIq8VC0NUhF2d8mRInp3CaCI6GeiEP/xUCBvmlLd2Ki
         YbTsz20Jo6q5z1/gDLXYAAqXj/Y+RV9qDGBezKxXmiATTS6wY0ojl0COMJcvDk1LPghy
         sNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693389529; x=1693994329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMuJsymgFdsKAjrQm0VavHQLfVQtcng3/FrcyEkfn3s=;
        b=A2BT40JiN6A6dV548ldDqFfE6EkdnHfcO293UvB2ms/l2G4QG0ZIZbLDY3R/PBSn/C
         kijcTB5/ojU7ULKUJfWKGjqpI54g5I6kX/LvXQEgpunlBk3+xpUHEgWR9uQvKMZJQZQk
         hLxzPPNQfFZNMS4tXnflYz8jPELlv6j7SY/dnMiTmOCd1yQXovrN340Vv4O+5aq/lKKM
         6erR1ijax0c5FJZwvXSstVD+8EFWP+YKNeg3OtpRLzrevJYkFMLTrtCGvRzNzvUO6Mp3
         iE4Oc5A3TJWSdhg9kyO+GYiWxqP1piFnQmPTRfIRNfv2bp8Vb/1+z0SKXlX1YiVKd3tV
         JkTg==
X-Gm-Message-State: AOJu0YxPAOAIy50tt9pc4hC/lxMd3u39wer/JB/6OOdwNtsBKbviIHxW
        SqsRUBr0NHULZRacyuTh1ECSHQ==
X-Google-Smtp-Source: AGHT+IEf8KL+ACn7JaRgtK1OVzWD45Pz7Q/Rp6ixSdbBEUiDBLjrnNxNNLgw3xdnQkN85h/UEJPDEg==
X-Received: by 2002:a17:906:208:b0:9a4:dd49:da3e with SMTP id 8-20020a170906020800b009a4dd49da3emr1337672ejd.68.1693389529786;
        Wed, 30 Aug 2023 02:58:49 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (5073ED84.static.ziggozakelijk.nl. [80.115.237.132])
        by smtp.gmail.com with ESMTPSA id i15-20020a1709064ecf00b009a2202bfce5sm6957130ejv.118.2023.08.30.02.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 02:58:48 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Wed, 30 Aug 2023 11:58:30 +0200
Subject: [PATCH 05/11] arm64: dts: qcom: pm8350c: Add flash led node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230830-fp5-initial-v1-5-5a954519bbad@fairphone.com>
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
In-Reply-To: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
To:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a node for the led controller found on PM8350C, used for flash and
torch purposes.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index f28e71487d5c..aa74e21fe0dc 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -30,6 +30,12 @@ pm8350c_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 
+		pm8350c_flash: led-controller@ee00 {
+			compatible = "qcom,pm8350c-flash-led", "qcom,spmi-flash-led";
+			reg = <0xee00>;
+			status = "disabled";
+		};
+
 		pm8350c_pwm: pwm {
 			compatible = "qcom,pm8350c-pwm";
 			#pwm-cells = <2>;

-- 
2.42.0

