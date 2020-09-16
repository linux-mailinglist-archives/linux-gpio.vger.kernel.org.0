Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75C3926C70D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 20:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbgIPSPt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 14:15:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:53838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727835AbgIPSPa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 14:15:30 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B10D72255F;
        Wed, 16 Sep 2020 16:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600273388;
        bh=GxwrIW7qntGRRCtYs+U7rfFBfVMvupzhpGRssjOqgfc=;
        h=From:To:Cc:Subject:Date:From;
        b=eJdp7dwsABHWLOLo856E9StQJ4p+sYsaIrnv30ga2lxVVy299VKDfRjnxVHVSYRam
         J9iCOvMBMO4TjJt/0dzEmOCErvtBBHeOXw5bZT/JjPVNif1FLVrldgdms7L5Qrlv+O
         +/s866azKmm/LjIY6wDdEtnslIODT1upIviFRBHg=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Anson Huang <Anson.Huang@nxp.com>,
        Sungbo Eo <mans0n@gorani.run>, Stefan Agner <stefan@agner.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yash Shah <yash.shah@sifive.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-unisoc@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-riscv@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 0/8] gpio: add common dtschema
Date:   Wed, 16 Sep 2020 18:22:42 +0200
Message-Id: <20200916162250.16098-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

This is independent work of pca953x bindings:
https://lore.kernel.org/lkml/20200916155715.21009-1-krzk@kernel.org/T/#u

The DTS patches can be also applied independently.

Best regards,
Krzysztof


Krzysztof Kozlowski (8):
  dt-bindings: gpio: add common schema for GPIO controllers
  dt-bindings: gpio: include common schema in GPIO controllers
  dt-bindings: gpio: pl061: add missing properties and include common
    schema
  dt-bindings: gpio: fsl-imx-gpio: add i.MX ARMv6 and ARMv7 compatibles
  dt-bindings: gpio: fsl-imx-gpio: add gpio-line-names
  arm64: dts: imx8mq-librem5: correct GPIO hog property
  arm64: dts: imx8mq-librem5: align GPIO hog names with dtschema
  ARM: dts: imx: align GPIO hog names with dtschema

 .../bindings/gpio/brcm,xgs-iproc-gpio.yaml    |   3 +
 .../bindings/gpio/fsl-imx-gpio.yaml           |  17 ++-
 .../devicetree/bindings/gpio/gpio-common.yaml | 126 ++++++++++++++++++
 .../devicetree/bindings/gpio/gpio-mxs.yaml    |   3 +
 .../bindings/gpio/gpio-pca9570.yaml           |   3 +
 .../devicetree/bindings/gpio/gpio-rda.yaml    |   3 +
 .../devicetree/bindings/gpio/gpio-vf610.yaml  |   3 +
 .../devicetree/bindings/gpio/mrvl-gpio.yaml   |   1 +
 .../devicetree/bindings/gpio/pl061-gpio.yaml  |   6 +
 .../bindings/gpio/qcom,wcd934x-gpio.yaml      |   3 +
 .../bindings/gpio/renesas,em-gio.yaml         |   3 +
 .../bindings/gpio/renesas,rcar-gpio.yaml      |   3 +
 .../devicetree/bindings/gpio/sifive,gpio.yaml |   3 +
 .../gpio/socionext,uniphier-gpio.yaml         |   3 +
 .../bindings/gpio/xylon,logicvc-gpio.yaml     |   3 +
 arch/arm/boot/dts/imx51-zii-rdu1.dts          |   2 +-
 arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi       |   8 +-
 arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts   |   2 +-
 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   4 +-
 19 files changed, 190 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-common.yaml

-- 
2.17.1

