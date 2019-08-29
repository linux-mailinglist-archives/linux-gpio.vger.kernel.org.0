Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA50CA264D
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 20:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbfH2SoZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 14:44:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55508 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbfH2SoZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 14:44:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 9E68E67F1D; Thu, 29 Aug 2019 18:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567104263;
        bh=4IZPN+QzAX53PADdDIhJMcY3L6unBaIiNa8EHjxShrg=;
        h=From:To:Cc:Subject:Date:From;
        b=ExNN5XrvgXftrPT5i1I8TuVri+rbqNFRol6K90BPPF6G74hQve9EfwObAnC2bu9mU
         jTVzZZga8nFLQgm6DopjUl0gCoaFRVSkuLf6YuqimtcURuwz3khkSGzqqV8VpUKzTD
         IJ8BAx9en3G0KR12EODqFgSXH2C6hINF5GAc2B9U=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5C521687F8;
        Thu, 29 Aug 2019 18:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567102331;
        bh=4IZPN+QzAX53PADdDIhJMcY3L6unBaIiNa8EHjxShrg=;
        h=From:To:Cc:Subject:Date:From;
        b=TE4CYLNyVQXTacu3/ucIyJNTdsPElPW7tiH3GjWyBWcGuuGAWSFyEDyf4SN0Fi17n
         bLfM0eJLI3HCTHknVEN56SqY//nkd4MNp+FWFBr60riwX3va8LjfaQy1+IkpfTUCwe
         ujtE17h//M1nJAvqLezlXzffuLoLv2lA6yJQMTi0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5C521687F8
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC 00/14] qcom: support wakeup capable GPIOs
Date:   Thu, 29 Aug 2019 12:11:49 -0600
Message-Id: <20190829181203.2660-1-ilina@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series is another attempt on adding wakeup capable GPIOs for QCOM
SoC. This patchset is based on Linus's support for hierarchical GPIOs
merged into linux-next [1]. The essense of the idea remains the same as
the previous submission [2]. GPIO irqchip TLMM is setup in hierarchy with
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

Lina Iyer (12):
  irqdomain: add bus token DOMAIN_BUS_WAKEUP
  drivers: irqchip: pdc: Do not toggle IRQ_ENABLE during mask/unmask
  drivers: irqchip: add PDC irqdomain for wakeup capable GPIOs
  of: irq: document properties for wakeup interrupt parent
  dt-bindings/interrupt-controller: pdc: add SPI config register
  drivers: irqchip: pdc: additionally set type in SPI config registers
  drivers: pinctrl: msm: fix use of deprecated gpiolib APIs
  drivers: pinctrl: msm: setup GPIO chip in hierarchy
  drivers: pinctrl: sdm845: add PDC wakeup interrupt map for GPIOs
  arm64: dts: qcom: add PDC interrupt controller for SDM845
  arm64: dts: qcom: setup PDC as the wakeup parent for TLMM on SDM845
  arm64: defconfig: enable PDC interrupt controller for Qualcomm SDM845

Maulik Shah (2):
  genirq: Introduce irq_chip_get/set_parent_state calls
  drivers: irqchip: pdc: Add irqchip set/get state calls

 .../interrupt-controller/interrupts.txt       |  13 +
 .../interrupt-controller/qcom,pdc.txt         |   9 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  11 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/irqchip/qcom-pdc.c                    | 234 +++++++++++++++++-
 drivers/pinctrl/qcom/pinctrl-msm.c            | 142 +++++++++--
 drivers/pinctrl/qcom/pinctrl-msm.h            |  16 ++
 drivers/pinctrl/qcom/pinctrl-sdm845.c         |  83 ++++++-
 include/linux/irq.h                           |   6 +
 include/linux/irqdomain.h                     |   1 +
 include/linux/soc/qcom/irq.h                  |  34 +++
 kernel/irq/chip.c                             |  44 ++++
 12 files changed, 566 insertions(+), 28 deletions(-)
 create mode 100644 include/linux/soc/qcom/irq.h

--
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

