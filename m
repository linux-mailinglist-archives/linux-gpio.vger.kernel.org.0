Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 928146CA4A3
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Mar 2023 14:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbjC0Mxd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Mar 2023 08:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbjC0MxX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2023 08:53:23 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1E31731
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 05:53:21 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so1865749wms.5
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 05:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679921600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=37FpTbJ+p7al0O18ZyBtxicxMZqjHJxOYjRMTMvw+q8=;
        b=nhPSOmDfzAecbkr3paJAPzUdgz1XNBvuOjoEV2DguxIZ0YSZ888H30COiZXAw8uVjq
         n+Lj6/NvFO3nDf7YKxDAkziXQ/dWOT+BWYAcUsxXaAva7PmFXns0sMaEoj+6GQsRahEd
         dXnVGdQCKLU9yvt59jjtZx1B2nK+V15OJl0Yu27bwl6i4Sk7IG2E8+1m32/qPo8zR6Wr
         axD36jG+N3jpr4wgVxRu7+yblTkNvz7WCnT37RLjI2QJv1uVE0619Vvqj/lbt3ZAOHHE
         O21tGggGIFLTtqwKlDm+rj5WOQPPmFnyye8Lbh8sFeULJDyLTr6qotH6blWZx9G5X/OK
         tfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37FpTbJ+p7al0O18ZyBtxicxMZqjHJxOYjRMTMvw+q8=;
        b=2lWNG36zeufws7vfuVkyAk4npKy9xOKUT7+4dBPeZ9fNY8kX2jSFDHO2duUKGzOL9/
         zX0ZjvoWPd7dlXMiCUEj+ASg9Aaowf0Q1gxhjZgnrtwqcKHRjK6P2NbcdnvvlqTsbufV
         vcwC8GQMeuXG2sj0mV3P1GDVwM8v/zt2TAn13IAGnoUYuFSFBlbC3h0/nIH/7po295i5
         x2cYHJdRgxMPk6qg9SWeDhK0XbaFgboVdM/3eb1xPRjOP2NDuYFZwAdJmLsoNJqDo9qN
         qSuPt1bhKLN5f0tPl1sCMwo87OT5/8A1Nd+6zVOC9y2jJgix1+vlh+XukPRDSQyVAwSj
         lACQ==
X-Gm-Message-State: AO0yUKUPz2Qmz7rAO6ulfWMl1EWGJSe8JhaPXxuXHYFD58SziLj2gkp1
        GVNbZ+y/i6zoqWaWAHEiIJy1/w==
X-Google-Smtp-Source: AK7set9fg69jRpZK00jq+nIGBu3vJ7Fes2R2mZZh5IPLtSMPN/+1fP9in+puSVD3SCGRsbIUiwv4KQ==
X-Received: by 2002:a05:600c:548d:b0:3ee:c06:e942 with SMTP id iv13-20020a05600c548d00b003ee0c06e942mr8843546wmb.25.1679921599861;
        Mon, 27 Mar 2023 05:53:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:313d:a304:2790:a949])
        by smtp.gmail.com with ESMTPSA id q25-20020a1ce919000000b003ee58e8c971sm13572220wmc.14.2023.03.27.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:53:19 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 00/18] arm64: dts: qcom: sa8775p: add basic PMIC support
Date:   Mon, 27 Mar 2023 14:52:58 +0200
Message-Id: <20230327125316.210812-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This adds support for a number of PMIC functionalities on sa8775p. The PMIC
used on the reference board is pm8654au which is another variant of the SPMI
PMIC from Qualcomm with an automotive twist.

v2 -> v3:
- add GPIO line names for the PMIC GPIOs on sa8775p-ride
- add missing GPIO chips to the PMIC .dtsi
- add missing thermal zones and alerts
- add regulators (driver support and regulator settings for sa8775p-ride)
- add missing PDC mappings
- squash patches 7 and 8 to avoid adding code without users
- dropped Krzysztof's Ack from patch 3 as it now extends the max number of
  mappings so most likely needs a second look

v1 -> v2:
- improve DT coding style where needed
- don't disable the power button in PMIC's .dtsi
- add debounce time for pwrkey and resin inputs
- use the official PMIC's name in DT labels
- add reg-names property for the PON node
- add patches that tidy up the dtsi before the PMIC stuff

Bartosz Golaszewski (18):
  arm64: dts: qcom: sa8775p: pad reg properties to 8 digits
  arm64: dts: qcom: sa8775p: sort soc nodes by reg property
  dt-bindings: interrupt-controller: qcom-pdc: add compatible for
    sa8775p
  arm64: dts: qcom: sa8775p: add the pdc node
  arm64: dts: qcom: sa8775p: add the spmi node
  dt-bindings: mfd: qcom,spmi-pmic: add compatible for pmm8654au
  arm64: dts: qcom: sa8775p: add support for the on-board PMICs
  arm64: dts: qcom: sa8775p: add the Power On device node
  arm64: dts: qcom: sa8775p: pmic: add the power key
  arm64: dts: qcom: sa8775p: pmic: add support for the pmm8654 RESIN
    input
  arm64: dts: qcom: sa8775p: pmic: add thermal zones
  dt-bindings: pinctrl: qcom,pmic-gpio: add compatible for
    pmm8654au-gpio
  pinctrl: qcom: spmi-gpio: add support for pmm8654au-gpio
  arm64: dts: qcom: sa8775p: add PMIC GPIO controller nodes
  arm64: dts: qcom: sa8775p-ride: set gpio-line-names for PMIC GPIOs
  dt-bindings: regulator: qcom,rpmh: add compatible for pmm8654au RPMH
  regulator: qcom-rpmh: add support for pmm8654au regulators
  arm64: dts: qcom: sa8775p-ride: add PMIC regulators

 .../interrupt-controller/qcom,pdc.yaml        |   3 +-
 .../bindings/mfd/qcom,spmi-pmic.yaml          |   1 +
 .../bindings/pinctrl/qcom,pmic-gpio.yaml      |   2 +
 .../regulator/qcom,rpmh-regulator.yaml        |  14 +
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi   | 211 ++++++++
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     | 285 +++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 465 ++++++++++--------
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |   1 +
 drivers/regulator/qcom-rpmh-regulator.c       |  55 +++
 9 files changed, 838 insertions(+), 199 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi

-- 
2.37.2

