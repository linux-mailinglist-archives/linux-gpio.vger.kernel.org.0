Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 730166036F8
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 02:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiJSAPX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Oct 2022 20:15:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbiJSAPL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Oct 2022 20:15:11 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5AFDD8A2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 17:14:16 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id df9so10387778qvb.9
        for <linux-gpio@vger.kernel.org>; Tue, 18 Oct 2022 17:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qk1Lk7K7X9zbqdIsTyGxp50kAio2yo1LV6scf4TNeLM=;
        b=l9vtW+GMcNZtK6k2yNVypl8dLO3IHkP4YJijha02yjP6OKRBUW0LE8z8EzX3T80pDr
         /2UKaB7RP2Bdkhj9FxVIR/cJHmhtmNZi+zHd0UTy3MfTU1YgtCiRaRh3+IWJi2rKVHv2
         9DhCEtEHLaYTHlwnWKHp5K6cCpMJbc+KnqiVHkKo3VhP9aB8O2+Q8DcWZno5v3uaiDJo
         BIKpTpoNgTO5LdQvyrlCCONNRsCmUT0mS3wkUpCWLug+ToJZ0+IzIon/Ax15N3XbexHH
         3Zl2FqxjQe9KJEtdy29Wh4Mkk0Lv5N2k4wnS9EoVR1lqBTrn+pklm8nXmoZSgArBBVY5
         I2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qk1Lk7K7X9zbqdIsTyGxp50kAio2yo1LV6scf4TNeLM=;
        b=kzg0GRZ4lZuc4ra5WaublFLRnu3XRohb2Sj/ww4SKCA/9Z8TvML48Gnn/hTwOW2D+m
         M83VoC/DXPL1kdF9h01dcE7rv9GLBz7W6B0j0mM+keEyxylNVabO+XrdfwuIPtbkMiy/
         8vYQNAVUx3eGUAUZw0nOnbJAMfJUdcSNJlAicvwTytX5db0f9/JV62PHl7ToXEVabaFa
         uuMQUn6dLq6QYIgcl3j9i5rnUP8TXmGEAyaZmSfd/dsFch8vCk9OSwszllL2dLsCBb6T
         M5WVxzroln/BImKCLq1YAUgcpJgr/6QzI6jcWA/4eSQQEoriDmgJCoxUwWs+TdB8x9t8
         qQdA==
X-Gm-Message-State: ACrzQf3Kq0Sbm7DJ+xD50sPIhed/BuccAfDqWv3eJacCSvEgTAYVVh0h
        xiqs1XK9w0RDLAfEd4zzbUJRWw==
X-Google-Smtp-Source: AMsMyM4CyuLLUb9WmRTKux2ZEH0203deqdUJhdEf+LBXl1nOMuojN7Ja89jOCr60TDNlRCrbUqTJig==
X-Received: by 2002:a05:6214:c67:b0:4b3:fe6c:9042 with SMTP id t7-20020a0562140c6700b004b3fe6c9042mr4616042qvj.76.1666138440851;
        Tue, 18 Oct 2022 17:14:00 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id ay40-20020a05620a17a800b006bb78d095c5sm3381240qkb.79.2022.10.18.17.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 17:14:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/4] arm64/pinctrl: dt-bindings: qcom: sc7180: convert to dtschema
Date:   Tue, 18 Oct 2022 20:13:47 -0400
Message-Id: <20221019001351.1630089-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Hi,

Changes since v2
================
1. New patch: revert of glitch SPI CS workaround
2. dt-bindings: Drop entire drive-strength (not needed, brought by common TLMM
   schema).
3. Add tags.
v2: https://lore.kernel.org/all/20221013184700.87260-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  arm64: dts: qcom: sc7180-trogdor-homestar: fully configure secondary
    I2S pins
  arm64: dts: qcom: sc7180: revert "arm64: dts: qcom: sc7180: Avoid
    glitching SPI CS at bootup on trogdor"
  arm64: dts: qcom: sc7180: align TLMM pin configuration with DT schema
  dt-bindings: pinctrl: qcom,sc7180: convert to dtschema

 .../bindings/pinctrl/qcom,sc7180-pinctrl.txt  | 187 -----
 .../bindings/pinctrl/qcom,sc7180-pinctrl.yaml | 158 +++++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts       | 236 +++----
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  36 +-
 .../dts/qcom/sc7180-trogdor-homestar.dtsi     |  41 +-
 .../dts/qcom/sc7180-trogdor-kingoftown-r0.dts |  16 +-
 .../dts/qcom/sc7180-trogdor-kingoftown.dtsi   |   8 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  16 +-
 .../dts/qcom/sc7180-trogdor-mrbland-rev0.dtsi |  25 +-
 .../boot/dts/qcom/sc7180-trogdor-mrbland.dtsi |  72 +-
 .../qcom/sc7180-trogdor-parade-ps8640.dtsi    |  32 +-
 .../boot/dts/qcom/sc7180-trogdor-pazquel.dtsi |   8 +-
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  14 +-
 .../qcom/sc7180-trogdor-quackingstick.dtsi    |  56 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |   8 +-
 .../dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi |  16 +-
 .../qcom/sc7180-trogdor-wormdingler-rev0.dtsi |  25 +-
 .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  |  72 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 650 +++++++-----------
 arch/arm64/boot/dts/qcom/sc7180.dtsi          | 597 ++++++++--------
 20 files changed, 934 insertions(+), 1339 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc7180-pinctrl.yaml

-- 
2.34.1

