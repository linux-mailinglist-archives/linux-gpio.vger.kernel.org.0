Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B444139DB92
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 13:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbhFGLmK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 07:42:10 -0400
Received: from mail-pl1-f182.google.com ([209.85.214.182]:36520 "EHLO
        mail-pl1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231460AbhFGLmJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 07:42:09 -0400
Received: by mail-pl1-f182.google.com with SMTP id x10so8492783plg.3
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 04:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z6Ewiz/FJiBEreBJpRrZidhXQHm4TISHkUY9VOlUYRc=;
        b=l49RTEObja/G+frH4vnsjVumtrn+XxXWJXi91FrnyeDTSy73kjtiat9p6kAxrZIeu+
         B+6CRo8GnJEFtFfifrYGaXqGApGhmlA+sWXl1YXWpk8z5EKeMjkSkfF4iBIL28E/wbYa
         XB/GkLtjMMynH7/q8drDo5lsO6PcTmWS47QwELTSmeAVccfKlp4/4bdGmtvICAnGn2Pd
         +k3Sen4Hrytnf03azFiHy5+6qyRacmeBiI5yda7TE3rTblg0xjPzfgn931D5EOEayoO8
         7YMGYlKnNxvAfPDXwqbpWHHPFTjwtxME7pjUi8VHz3YBRGZ4Apfotq15LgJFiAxBZd1s
         niMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z6Ewiz/FJiBEreBJpRrZidhXQHm4TISHkUY9VOlUYRc=;
        b=fCmEzYtURhXuCv1ghKKWVKd3vVFf1bNVhFPVfl1nKVZS+HRNjVR0qnxd2PC0bDEp4Q
         NYcwmTygSOczlA8gBzLnuEMMy4LshPEMbFHwxkQOA03m9UXGFEIkG7CmoBxG1d7aG4y7
         8hAH9biEplIM7tLM3QngjxJ3JqFNMqCiCaaJTdu3uxLxPklT7GQAg4uxZIkR3d2GlRCQ
         MVaWy3qII9jsyXDhAEqNiTPZzzWOAcmmRwkwmVAEdmug3JYKl+ghtkKxfVOe7cGHe0jV
         reOsZ3+OuWnSsfQCHkUpFQYyHE+yYoN5N6ms5x2LDFTPJkv2GvMWb+3PmTRzpeaigxYQ
         zWsg==
X-Gm-Message-State: AOAM533PetcaCF+Ot9qgzj5/QuaA4RYD91ff08Jq2GWRwf7PLwW4UAL6
        5i24VDTLY5Jmvp0wV2jNSKKtuw==
X-Google-Smtp-Source: ABdhPJzUfAcjcqiD6DRmYHASLVohVLn7RbK703ta+Wr36NnZhdAUBzUcZ5DQEuns6LI9KVFJ3jHs0A==
X-Received: by 2002:a17:90b:882:: with SMTP id bj2mr19631112pjb.167.1623065948131;
        Mon, 07 Jun 2021 04:39:08 -0700 (PDT)
Received: from localhost.localdomain.name ([122.177.177.211])
        by smtp.gmail.com with ESMTPSA id j7sm7223939pjf.0.2021.06.07.04.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 04:39:07 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH 0/8] arm64: dts: qcom: Add SA8155p-adp board DTS
Date:   Mon,  7 Jun 2021 17:08:32 +0530
Message-Id: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series adds DTS for SA8155p-adp board which is based on
Qualcomm snapdragon sm8150 SoC. 

This patchset also includes DTS for the two new PMICs PMM8155AU_1
and PMM8155AU_2 found on the adp board.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: bhupesh.linux@gmail.com

Bhupesh Sharma (8):
  dt-bindings: qcom: rpmh-regulator: Add compatible for SA8155p-adp
    board pmics
  dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible for SA8155p-adp
  dt-bindings: arm: qcom: Add compatible for SA8155p-adp board
  regulator: qcom-rpmh: Add new regulator types found on SA8155p adp
    board
  pinctrl: qcom/pinctrl-spmi-gpio: Add compatibles for pmic-gpios on
    SA8155p-adp
  arm64: dts: qcom: pmm8155au_1: Add base dts file
  arm64: dts: qcom: pmm8155au_2: Add base dts file
  arm64: dts: qcom: sa8155p-adp: Add base dts file

 .../devicetree/bindings/arm/qcom.yaml         |   8 +
 .../bindings/pinctrl/qcom,pmic-gpio.txt       |   5 +
 .../regulator/qcom,rpmh-regulator.yaml        |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi     | 134 +++++++
 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi     | 107 +++++
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts      | 375 ++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |   4 +
 drivers/regulator/qcom-rpmh-regulator.c       |  72 ++++
 9 files changed, 708 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8155au_1.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmm8155au_2.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8155p-adp.dts

-- 
2.31.1

