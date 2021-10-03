Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7F14200B8
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Oct 2021 10:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhJCIds (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Oct 2021 04:33:48 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:37898 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229809AbhJCIdr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 3 Oct 2021 04:33:47 -0400
Received: from g550jk.portal.nstrein.ns.nl (unknown [145.15.244.215])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 9454DC9072;
        Sun,  3 Oct 2021 08:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633249919; bh=7A3bctolnPomul0Ceu+ocAChJSDa+GUUAFf4Ke825mc=;
        h=From:To:Cc:Subject:Date;
        b=cDaZGW7vadCXMfDCOVNdSTrGqr8VU8gvccrlL6DA1N3p0m4gWG3xSpyGfWRWSOkeA
         6T08FT3SNi7oCdB+eDSRqrxuWt5oqkx8wGGXDsZ4Xiimpvhun0npLRveeKJ5xyke49
         8xlc+MAD5wDb4JEJyFLCQ8ThU0kMbgSZF7+0Vy3c=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Collins <collinsd@codeaurora.org>,
        Hector Martin <marcan@marcan.st>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] Initial Fairphone 4 support
Date:   Sun,  3 Oct 2021 10:31:23 +0200
Message-Id: <20211003083141.613509-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series adds basic support for the recently announced Fairphone 4
smartphone, based on the Snapdragon 750G (sm7225).

This adds support for UART, power & volume buttons, screen based on
simple-framebuffer, regulators and USB.

Luca Weiss (11):
  clk: qcom: add select QCOM_GDSC for SM6350
  dt-bindings: regulator: qcom,rpmh: Add compatible for PM6350
  regulator: qcom-rpmh: Add PM6350 regulators
  dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible for PM6350
  pinctrl: qcom: spmi-gpio: Add compatible for PM6350
  arm64: dts: qcom: Add PM6350 PMIC
  arm64: dts: qcom: sm6350: add debug uart
  dt-bindings: arm: cpus: Add Kryo 570 CPUs
  dt-bindings: arm: qcom: Document sm7225 and fairphone,fp4 board
  arm64: dts: qcom: Add SM7225 device tree
  arm64: dts: qcom: sm7225: Add device tree for Fairphone 4

 .../devicetree/bindings/arm/cpus.yaml         |   1 +
 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 .../bindings/pinctrl/qcom,pmic-gpio.yaml      |   2 +
 .../regulator/qcom,rpmh-regulator.yaml        |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/pm6350.dtsi          |  54 +++
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |  31 ++
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 322 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm7225.dtsi          |  16 +
 drivers/clk/qcom/Kconfig                      |   1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |   1 +
 drivers/regulator/qcom-rpmh-regulator.c       |  32 ++
 12 files changed, 469 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm6350.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7225.dtsi

-- 
2.33.0

