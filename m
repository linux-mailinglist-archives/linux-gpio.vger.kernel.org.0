Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92912425EB8
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 23:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241270AbhJGV1T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 17:27:19 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:58906 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232813AbhJGV1S (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Oct 2021 17:27:18 -0400
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 821FCC9157;
        Thu,  7 Oct 2021 21:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633641922; bh=Faeh5nk8P5XYaOaA1YNK6AgiOTer+538GcLB67yJQN0=;
        h=From:To:Cc:Subject:Date;
        b=jNgzxKhnHFJHy+N3kLTSXJio3ojY3W2vpF1zhkDeckeQb+gcabdohOtcK+6ISTrlg
         SS3RqaLPwuSBnHoLwEhyK9QRgnLWxriAX949/yoyhqS6Z+br4xogAHfzL8q+3AM2D7
         f9VOqHJHmsGK7lMlVk2hoWvGF2RLZsjlyZVn+fYc=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, Luca Weiss <luca@z3ntu.xyz>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Collins <collinsd@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hector Martin <marcan@marcan.st>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/11] Initial Fairphone 4 support
Date:   Thu,  7 Oct 2021 23:24:27 +0200
Message-Id: <20211007212444.328034-1-luca@z3ntu.xyz>
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

v2 fixes some stylistic problems in dts and corrects the situation with
pm6350 regulator supplies.

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
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 320 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm7225.dtsi          |  16 +
 drivers/clk/qcom/Kconfig                      |   1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |   1 +
 drivers/regulator/qcom-rpmh-regulator.c       |  32 ++
 12 files changed, 467 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm6350.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7225.dtsi

-- 
2.33.0

