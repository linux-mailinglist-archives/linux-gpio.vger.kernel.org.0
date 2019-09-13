Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB76B27A1
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 23:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731451AbfIMV7p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 17:59:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59478 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731231AbfIMV7o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 17:59:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 43050602C3; Fri, 13 Sep 2019 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411984;
        bh=PAPjtJPh3fF6Ya6gSLBnHRAaoo8cNr/+3nSru5obHKI=;
        h=From:To:Cc:Subject:Date:From;
        b=Z9t373gAM3yOrIe3ouuIr75yRfeJ6HgZ63f3Trw6Ivn+mrs7K78QN565lVEO2UWQU
         iib0cJNJrevMeXLpx3WBTAAx3mgbQVPtjfwpjRSa0mWFaRTqAmUPGgxIUos6XGHu77
         7YqlSKqpb0tMeeKecP67zsNv/MdO1yDxQW819NKI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 64D0A60770;
        Fri, 13 Sep 2019 21:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411981;
        bh=PAPjtJPh3fF6Ya6gSLBnHRAaoo8cNr/+3nSru5obHKI=;
        h=From:To:Cc:Subject:Date:From;
        b=gZMjhzCs3AmMLf735IAnQDaSjKSWgDTfzSaK/LpiB9OdO32Lpsnv8UuqyNIn7Vpve
         TI8MbPMaFJXBo8mr9RjsiR8jBJ/4iDsO4jZrORnypTu65yOuDk3XROovd/GRYoec5s
         Hg4xccJk5QxbHsomv0+azf1ahRSA2+OfDVaY9M5w=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 64D0A60770
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, maz@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC v2 00/14] Support wakeup capable GPIOs
Date:   Fri, 13 Sep 2019 15:59:08 -0600
Message-Id: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks for all the helpful reviews. Here is the next revision addressing the
comments.

Changes in RFC v2:
	- Address review comments #3, #4, #6, #7, #8, #9, #10
	- Rebased on top of linux-next GPIO latest patches [1],[3],[4]
	- Increase PDC max irqs in #2 (avoid merge conflicts with downstream)
	- Add Reviewed-by #5

Note: This revision does not update writing the config registers that are
written from the PDC. There needs more discussion in that area. #6, #7

---

This series is another attempt on adding wakeup capable GPIOs for QCOM
SoC. This patchset is based on Linus's support for hierarchical GPIOs
merged into linux-next [1]. The essense of the idea remains the same as
the previous submission [2]. GPIO irqchip TLMM is setup in hierarchy wit
the PDC as the wakeup-parent. PDC's interrupt parent is the GIC. GPIOs
in QCOM SoC that are wakeup capable (when TLMM is powered off) are
routed to the PDC as well and can be detected at the always-on interrupt
controller (PDC). The idea is setup the irqchips in hierarchy and if the
interrupt is handled at the PDC, then TLMM relinquishes control and
configuration of the interrupt to the PDC.

There are few new additions in this submission. The first is the
additional SPI configuration that needs to be done to setup the GPIO
type in a register interface between the PDC and the GIC. This is needed
only for GPIOs. This registers in some QCOM SoCs is access restricted
and has to be written from the TZ. The DT bindings are also updated for
this new requirement. The second change is that with the new
hierarchical support in gpiolib, we could remove the .alloc and
.translate functions from the pinctrl driver. But to distinguish the
case where a wakeup interrupt controller needs the TLMM to configure the
GPIO interrupts (in the case of MPM interrupt controller), irqdomain
flags have been added. The third change is ensure the interrupt
controllers' interrupt pending bits are cleared when the GPIO is enabled
as an interrupt.

Please consider reviewing these patches.

Thanks,
Lina

[1]. https://lore.kernel.org/linux-gpio/20190808123242.5359-1-linus.walleij@linaro.org/
[2]. https://lkml.org/lkml/2019/5/7/1173
[3]. https://lore.kernel.org/r/20190819084904.30027-1-linus.walleij@linaro.org
[4]. https://lore.kernel.org/r/20190724083828.7496-1-linus.walleij@linaro.org


Lina Iyer (12):
  irqdomain: add bus token DOMAIN_BUS_WAKEUP
  drivers: irqchip: qcom-pdc: update max PDC interrupts
  drivers: irqchip: pdc: Do not toggle IRQ_ENABLE during mask/unmask
  drivers: irqchip: add PDC irqdomain for wakeup capable GPIOs
  of: irq: document properties for wakeup interrupt parent
  dt-bindings/interrupt-controller: pdc: add SPI config register
  drivers: irqchip: pdc: additionally set type in SPI config registers
  drivers: pinctrl: msm: setup GPIO chip in hierarchy
  drivers: pinctrl: sdm845: add PDC wakeup interrupt map for GPIOs
  arm64: dts: qcom: add PDC interrupt controller for SDM845
  arm64: dts: qcom: setup PDC as the wakeup parent for TLMM on SDM845
  arm64: defconfig: enable PDC interrupt controller for Qualcomm SDM845

Maulik Shah (2):
  genirq: Introduce irq_chip_get/set_parent_state calls
  drivers: irqchip: pdc: Add irqchip set/get state calls

 .../bindings/interrupt-controller/interrupts.txt   |  13 ++
 .../bindings/interrupt-controller/qcom,pdc.txt     |  13 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  11 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/irqchip/qcom-pdc.c                         | 238 +++++++++++++++++++--
 drivers/pinctrl/qcom/pinctrl-msm.c                 | 119 +++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.h                 |  16 ++
 drivers/pinctrl/qcom/pinctrl-sdm845.c              |  23 +-
 include/linux/irq.h                                |   6 +
 include/linux/irqdomain.h                          |   1 +
 include/linux/soc/qcom/irq.h                       |  32 +++
 kernel/irq/chip.c                                  |  44 ++++
 12 files changed, 502 insertions(+), 15 deletions(-)
 create mode 100644 include/linux/soc/qcom/irq.h

--
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

