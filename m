Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A15085E6C48
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Sep 2022 21:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbiIVT5A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Sep 2022 15:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbiIVT5A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Sep 2022 15:57:00 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06327DCCF2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 12:56:58 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id z25so16485401lfr.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Sep 2022 12:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=fU7aBgbNyNLK4wEELvIvKb9NKSAL12dAtC5uKY+2RK8=;
        b=e+164a1tcJKv/LFCGbEZc4CxkM3g65yzCqrU3YXmMnXbvXIm3KsgsBthIJ7tpsrHaQ
         YkY3UWjOu6SwusuJr2eL38kaLmbBnjesYwJTFsRlgtKSn1XaeVaPugGDe+EwmllingBo
         C+Rl/xb8iS5RutJ346WSm3F+a3Na3u51IEUym/ar4toPLRKvukY5iU71DOnlCQTxV0b4
         SZCCHZl7d3AfY8JJChVoauQAn7i9XWJ+jEi15nRYSgsM84DWa6LMHwg7x9dmoj+/9erv
         o87hqe6N05br+iDB3IfXFRLfXV+M6IgCyxWoLPAX2gmuMI1I5n9shU+RyGdqJl0ie+83
         2V6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=fU7aBgbNyNLK4wEELvIvKb9NKSAL12dAtC5uKY+2RK8=;
        b=ij0KMiKLB7VvkAV20peKipsgH1+/C7nJgiUEke11ow/cAy/271IMFlYduFvsYjCNdR
         HXxSk5MAUPxgjfrMxly/Df9BN42f6ryXB7E4iWFReJMRAjKvPa4MICW9UN0uV/VjmN9r
         BvbJY+e2b6nh+WXhe5UOE014HGOApq3wJFE6RiSZg7soLubZTrqn6Z3eaH5QaQnWhE1h
         KdTyvjTWonFAB1jYej5MlxxTESgZeTV+GdAYd/db3AmP89uLQV2pQYIYasUcdwBlPdWo
         iZIopnSgH+z6BdcgR9QB2U28GqQF2xwTc5i2cEf+/DwTbh/qjFzUd7b3M7THwBFdB75D
         7hFw==
X-Gm-Message-State: ACrzQf1L2M7L0mm1oStSYC0lcuTWf660BcNgf2AYGw/VwfsYHHkQSPqp
        1pWjlFI+m3Ot7erqQe5NUmWDkA==
X-Google-Smtp-Source: AMsMyM4GoDXnUR1lV3LkbkrO3xMdxw9zaXYH2OwtKxAKiiW+/iAdZWizWIhEL/bqgKyb3uRgiSlHkQ==
X-Received: by 2002:a05:6512:3da2:b0:499:d70a:e6bc with SMTP id k34-20020a0565123da200b00499d70ae6bcmr2011507lfv.191.1663876616363;
        Thu, 22 Sep 2022 12:56:56 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x15-20020a19e00f000000b00498fc3d4d15sm1079375lfg.190.2022.09.22.12.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 12:56:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/12] pinctrl/arm64: qcom: continued - fix Qualcomm LPASS pinctrl schema warnings
Date:   Thu, 22 Sep 2022 21:56:39 +0200
Message-Id: <20220922195651.345369-1-krzysztof.kozlowski@linaro.org>
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

Hi,

Set of fixes for LPASS (audio) pin controller bindings and DTS.

Dependencies
============
1. dt-bindings are independent of DTS patches.

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  dt-bindings: pinctrl: qcom,sc8280xp-lpass-lpi: fix gpio pattern
  dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: fix gpio pattern
  dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: fix matching pin config
  dt-bindings: pinctrl: qcom,sc8280xp-lpass-lpi: fix matching pin config
  dt-bindings: pinctrl: qcom,sm8250-lpass-lpi: fix matching pin config
  dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: fix matching pin config
  dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add bias-bus-hold
  dt-bindings: pinctrl: qcom,sm8250-lpass-lpi: add bias-bus-hold and
    input-enable
  arm64: dts: qcom: sc7280: drop clock-cells from LPASS TLMM
  arm64: dts: qcom: sc7280: align LPASS pin configuration with DT schema
  arm64: dts: qcom: sm8250: correct LPASS pin pull down
  arm64: dts: qcom: sm8250: align LPASS pin configuration with DT schema

 .../qcom,sc7280-lpass-lpi-pinctrl.yaml        | 34 +++++++++++---
 .../qcom,sc8280xp-lpass-lpi-pinctrl.yaml      | 31 +++++++++++--
 .../qcom,sm8250-lpass-lpi-pinctrl.yaml        | 42 ++++++++++++++---
 .../qcom,sm8450-lpass-lpi-pinctrl.yaml        | 38 +++++++++++++--
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 34 +++++++-------
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 46 +++++++++----------
 6 files changed, 166 insertions(+), 59 deletions(-)

-- 
2.34.1

