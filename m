Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3713662B6B1
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 10:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbiKPJjp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 04:39:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233411AbiKPJjo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 04:39:44 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D05F25282
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 01:39:43 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id j16so28558780lfe.12
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 01:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j+gl7l2sUM+JuRSjFTkzINmsvGZarBZozPSoW/pkC8U=;
        b=nabZ7U2yFQENwR0B6rx2HYg/E2viR3SDwxtWZnvqTTcgpiKsO/7THHEB0/1bWDQZas
         /9LJ2x5bQ+FKQpsuQPEma6+eJbo6EmC7g/3RZaRAS20WLqDj03LolJ/lBCtLeBH/cZn0
         g4qxE6F2YmmvkV5dO7SRs3EnnDvffOAM0JE3FTPz5tMe5ymLKVwA+HcntK4sFKsPF9/i
         +PcyUwaVWV72eEYFmrZVmcQMyncNjHvdbICJ9q8h2NJLwgatMVH7JA77qqRmKYeRCFix
         3IrAnSfLYo0MRStXuBTRyRaHVIiI4GfjLCCEm++UXHATgL2WFkefy60VCmsIgzkc8ImQ
         54pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+gl7l2sUM+JuRSjFTkzINmsvGZarBZozPSoW/pkC8U=;
        b=6ViTnPrwYlOs/9ounPTrqdISlSWG7uwGyUl5L7gQeJAnkfFVmDET6J+DH5ieoWG8kT
         ZwtqUHz0Fy7MhcR/z+WSBHqAZEeGvpnpxQB21lGBOLC9Ealp3i1gjoMgG/NgNRFF/TG3
         MqnloU+haUuPJL0W/zvX8vTqHisLv92cuxQm8Lkt47zoRYKSmjYvCjmWN56+wOqnGHeE
         e9YU0Xey4oSFRiIAhVW8m24JUEWji6meqhWY61f1STGnNm0/gYMiYPQRmiAipxnYXBU5
         MKqxmSC3c9fToTQNgSWuWTB1iJYovqFKLue5JHbK9+CiIclvg6Yqq9kZmcFpLajQIJA9
         ym2A==
X-Gm-Message-State: ANoB5pmiH2NwQC8/BEn9VuyCWfhvSmTCMiagy18qceJHHY8kxlUXVse9
        MeKZ+Y/idGz9j+Tc9vxBvNxSAt5Aor5YXoWd
X-Google-Smtp-Source: AA0mqf4mB5/tmsVdj0UfaSGVIV3XOkNlkt4gjuroY+HB7oemrLuFblk2sOHVkDC2mg0gfIwsEcqaEg==
X-Received: by 2002:a05:6512:1597:b0:4a2:676e:cf68 with SMTP id bp23-20020a056512159700b004a2676ecf68mr6846656lfb.546.1668591581632;
        Wed, 16 Nov 2022 01:39:41 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c8-20020ac24148000000b00492c663bba2sm2511151lfi.124.2022.11.16.01.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 01:39:41 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: dt-bindings: qcom: Second convertions for v6.2
Date:   Wed, 16 Nov 2022 10:39:39 +0100
Message-Id: <20221116093939.20111-1-krzysztof.kozlowski@linaro.org>
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

Continuation of my cleanups - second, last round based on previous pull request.

Best regards,
Krzysztof


The following changes since commit 1b6b54ef7c4a1f482a2a6d33a769e89877beba4e:

  dt-bindings: pinctrl: qcom,sc7180: convert to dtschema (2022-10-19 11:55:58 -0400)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/qcom-pinctrl-6.2-2

for you to fetch changes up to 86bfee318b546c03d954e863fc1af43960cb06e2:

  dt-bindings: pinctrl: qcom,msm8976: convert to dtschema (2022-11-16 08:56:02 +0100)

----------------------------------------------------------------
Qualcomm pinctrl Devicetree bindings changes for v6.2, part two

Continuation of refactoring and improving Qualcomm pin controller bindings:
1. Narrow compatible combinations in PMIC MPP.
2. Convert several bindings from TXT to DT schema format: QCS404,
   IPQ8074, MSM8660, MSM8916, MSM8960 and MSM8976.

----------------------------------------------------------------
Krzysztof Kozlowski (7):
      dt-bindings: pinctrl: qcom,pmic-mpp: make compatible fallbacks specific
      dt-bindings: pinctrl: qcom,msm8916: convert to dtschema
      dt-bindings: pinctrl: qcom,qcs404: convert to dtschema
      dt-bindings: pinctrl: qcom,msm8660: convert to dtschema
      dt-bindings: pinctrl: qcom,ipq8074: convert to dtschema
      dt-bindings: pinctrl: qcom,msm8960: convert to dtschema
      dt-bindings: pinctrl: qcom,msm8976: convert to dtschema

 .../bindings/pinctrl/qcom,ipq8074-pinctrl.txt      | 181 -------------------
 .../bindings/pinctrl/qcom,ipq8074-pinctrl.yaml     | 135 ++++++++++++++
 .../bindings/pinctrl/qcom,msm8660-pinctrl.txt      |  96 ----------
 .../bindings/pinctrl/qcom,msm8660-pinctrl.yaml     | 125 +++++++++++++
 .../bindings/pinctrl/qcom,msm8916-pinctrl.txt      | 195 --------------------
 .../bindings/pinctrl/qcom,msm8916-pinctrl.yaml     | 166 +++++++++++++++++
 .../bindings/pinctrl/qcom,msm8960-pinctrl.txt      | 190 --------------------
 .../bindings/pinctrl/qcom,msm8960-pinctrl.yaml     | 164 +++++++++++++++++
 .../bindings/pinctrl/qcom,msm8976-pinctrl.txt      | 183 -------------------
 .../bindings/pinctrl/qcom,msm8976-pinctrl.yaml     | 136 ++++++++++++++
 .../devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml |  45 ++---
 .../bindings/pinctrl/qcom,qcs404-pinctrl.txt       | 199 ---------------------
 .../bindings/pinctrl/qcom,qcs404-pinctrl.yaml      | 176 ++++++++++++++++++
 13 files changed, 925 insertions(+), 1066 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq8074-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq8074-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8660-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8916-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8916-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8976-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,qcs404-pinctrl.yaml
