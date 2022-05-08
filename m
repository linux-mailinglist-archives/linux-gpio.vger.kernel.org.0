Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8F151EDE0
	for <lists+linux-gpio@lfdr.de>; Sun,  8 May 2022 15:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233689AbiEHODc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 May 2022 10:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233601AbiEHODa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 May 2022 10:03:30 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E189DFAD
        for <linux-gpio@vger.kernel.org>; Sun,  8 May 2022 06:59:40 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id bv19so22322249ejb.6
        for <linux-gpio@vger.kernel.org>; Sun, 08 May 2022 06:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sh7T6F8m5om+p6d8xDQ68KLPKaPzB5rPja3dngsuXmo=;
        b=NtKDSzlUP2fvL4JyA23q0b8vi1oDivxvbChK+OsldSbCZz8JePXwaNmjBj4zCnJ+aS
         Fcns5kNZp1u/yIsWy8/8tziBKBjKvCWTRs/l/GcGfhfS9AjOFMpYPhPiEj1vBA9gzKgs
         fgix0vkkGXtrvcyeQj9gAjBS+kRlG4UbyJNUvTjleDoDKlU8sSVa4h72ulk/88TdamvV
         ExWOcAUjERKbhlslI0m5V4quLpEPMaw9D4xAMvuRNLi6i022UGeJX8liLDsqy6/7wLmV
         QlQWgbBPyyqQ6hvnK4Otog0am9qhwq3uNH5FE+PvJ+aK60r+3BOhuUSWmPrG5Vnl82Jg
         YWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sh7T6F8m5om+p6d8xDQ68KLPKaPzB5rPja3dngsuXmo=;
        b=A0oNpD+pTOycBwXgWdFgbq0KQwasNbq3YrzqAqO4pE1qe29p2bI7FbG42xN1iHPfmf
         ADXaoqvbsPnl1Vv8ZGle0zh3An2wpnb4eaNkKP+SLJfmyPZqObi/0xzeLPzbzsaWi8h3
         uODDh84mtQ0ch1ahpkrT9Ax//B8f8bYoqRewkX2Exyfw3Emv6PzOyy9WKLByskf8qXyY
         6TP1Wzh8lLCJjEUFUSSnenTYxPdERW/UMTMNtfi5OGgsiLfUR8mmYby1PQOiIEKp2mag
         9es0C4T8uB/UiAIPjbcTXRZapmuGzCtJMzXeeqRrb36jEMqWSA4gDwsngN2F4zL3Lvi3
         VHjQ==
X-Gm-Message-State: AOAM533tarEKGiMaARji2MwXW/0R/hZXk/hnkLs2RYZ823RF/971R2cR
        qLjX4j9r9Zt4jJtt/Hz0gywAqw==
X-Google-Smtp-Source: ABdhPJziBkI6CEh1DKheB02szTsJ1avc2cVCCYlcGZVNox06EFkjvLBwYKB9i35qQ73eNqjUnkdEFQ==
X-Received: by 2002:a17:907:8a0a:b0:6f4:2467:75ff with SMTP id sc10-20020a1709078a0a00b006f4246775ffmr10720043ejc.356.1652018378980;
        Sun, 08 May 2022 06:59:38 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id qz24-20020a170907681800b006f3ef214dc6sm4075524ejc.44.2022.05.08.06.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 06:59:38 -0700 (PDT)
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
Subject: [PATCH 0/4] dt-bindings/pinctrl/arm: qcom: second round of minor cleanups of QCOM PMIC pinctrl
Date:   Sun,  8 May 2022 15:59:28 +0200
Message-Id: <20220508135932.132378-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
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

Hi,

Dependencies
============
This is on top of:
dt-bindings/pinctrl/arm: qcom: minor cleanups of QCOM PMIC pinctrl
https://lore.kernel.org/linux-arm-msm/20220507194913.261121-1-krzysztof.kozlowski@linaro.org/T/#t

Not really tested on hardware (except SDM845).

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  dt-bindings: pinctrl: qcom,pmic-gpio: add 'gpio-reserved-ranges'
  arm64: dts: qcom: add missing gpio-ranges in PMIC GPIOs
  arm64: dts: qcom: correct interrupt controller on PM8916 and PMS405
  ARM: dts: qcom: add missing gpio-ranges in PMIC GPIOs

 .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 53 +++++++++++++++++++
 arch/arm/boot/dts/qcom-pmx55.dtsi             |  1 +
 arch/arm/boot/dts/qcom-pmx65.dtsi             |  1 +
 arch/arm64/boot/dts/qcom/pm6350.dtsi          |  1 +
 arch/arm64/boot/dts/qcom/pm8009.dtsi          |  1 +
 arch/arm64/boot/dts/qcom/pm8150.dtsi          |  1 +
 arch/arm64/boot/dts/qcom/pm8150b.dtsi         |  1 +
 arch/arm64/boot/dts/qcom/pm8150l.dtsi         |  1 +
 arch/arm64/boot/dts/qcom/pm8350.dtsi          |  1 +
 arch/arm64/boot/dts/qcom/pm8350b.dtsi         |  1 +
 arch/arm64/boot/dts/qcom/pm8916.dtsi          |  7 ++-
 arch/arm64/boot/dts/qcom/pmr735b.dtsi         |  1 +
 arch/arm64/boot/dts/qcom/pms405.dtsi          | 15 ++----
 13 files changed, 69 insertions(+), 16 deletions(-)

-- 
2.32.0

