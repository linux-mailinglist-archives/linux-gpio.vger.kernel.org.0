Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C92527A6CC
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 07:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgI1FRQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 01:17:16 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:34831 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726421AbgI1FRP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 01:17:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601270234; h=Message-Id: Date: Subject: To: From: Sender;
 bh=zZ5/K8uHd9ukJvMNytG2zuKfN0yCGEzv9199tzeDX6A=; b=ibujDV5IfeEFPsAwXSt17YR5SGY6UXGMDECoyMS6NKDkTSc8kjNwMPWF5SjEph8fWXGfzFkn
 sGO2+gv3BzY3beXaphDb8Si5uapxtq+b9DbBQsUmjGT3192O26NOhmLHe3UYyCmYhwr2mkP8
 s0OLHwkgQ811sfJl3FWw4tmh2Rk=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f7171b599ecd993e12a575e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 05:16:37
 GMT
Sender: varada=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AF590C433FE; Mon, 28 Sep 2020 05:16:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from varda-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: varada)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 57D5EC433CB;
        Mon, 28 Sep 2020 05:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 57D5EC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=varada@codeaurora.org
From:   Varadarajan Narayanan <varada@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, varada@codeaurora.org,
        nsekar@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, sricharan@codeaurora.org
Subject: [PATCH 0/7] Add minimal boot support for IPQ5018
Date:   Mon, 28 Sep 2020 10:45:33 +0530
Message-Id: <1601270140-4306-1-git-send-email-varada@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The IPQ5018 is Qualcomm's 802.11ax SoC for Routers,
Gateways and Access Points.

This series adds minimal board boot support for ipq5018-mp03.1-c2 board.

Varadarajan Narayanan (7):
  clk: qcom: clk-alpha-pll: Add support for Stromer PLLs
  dt-bindings: arm64: ipq5018: Add binding descriptions for clock and
    reset
  clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018
  dt-bindings: pinctrl: qcom: Add ipq5018 pinctrl bindings
  pinctrl: qcom: Add IPQ5018 pinctrl driver
  arm64: dts: Add ipq5018 SoC and MP03 board support
  arm64: defconfig: Enable IPQ5018 SoC base configs

 Documentation/devicetree/bindings/arm/qcom.yaml    |    7 +
 .../devicetree/bindings/clock/qcom,gcc.yaml        |    3 +
 .../bindings/pinctrl/qcom,ipq5018-pinctrl.yaml     |  143 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq5018-mp03.1-c2.dts     |   30 +
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  201 +
 arch/arm64/configs/defconfig                       |    3 +
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  156 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    5 +
 drivers/clk/qcom/gcc-ipq5018.c                     | 3833 ++++++++++++++++++++
 drivers/pinctrl/qcom/Kconfig                       |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq5018.c             |  903 +++++
 include/dt-bindings/clock/qcom,gcc-ipq5018.h       |  183 +
 include/dt-bindings/reset/qcom,gcc-ipq5018.h       |  119 +
 include/linux/clk-provider.h                       |    4 +-
 18 files changed, 5608 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq5018-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-mp03.1-c2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018.dtsi
 create mode 100644 drivers/clk/qcom/gcc-ipq5018.c
 create mode 100644 drivers/pinctrl/qcom/pinctrl-ipq5018.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq5018.h
 create mode 100644 include/dt-bindings/reset/qcom,gcc-ipq5018.h

-- 
2.7.4

