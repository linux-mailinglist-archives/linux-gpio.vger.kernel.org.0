Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30723FE7A8
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 23:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfKOWRo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 17:17:44 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:46954 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfKOWRo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 17:17:44 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0A93A61014; Fri, 15 Nov 2019 22:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856263;
        bh=rmZinge5w6gjaDHKRPidnrksPAgCHn23PPmPFuiXXd4=;
        h=From:To:Cc:Subject:Date:From;
        b=VGmQ1K7FCAASln3tmjDg6eAp5zSzIHt84dpr7NlsZ/0+NP0UKKItp3PqDPAIY8uRR
         nHh7tgdahr5uFubq4UTnJE6X2bIF7VUkHACr6Qx30/fPGdntnBlAz5n+Srrh9QAifQ
         CEL1Zbmxc0Hg/DBtbhhd/LQWuUncsuyl+d9MKvQo=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 11B8660C4B;
        Fri, 15 Nov 2019 22:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856262;
        bh=rmZinge5w6gjaDHKRPidnrksPAgCHn23PPmPFuiXXd4=;
        h=From:To:Cc:Subject:Date:From;
        b=iF5D4BOfd9nPpRTZfwrrhmnjdzUWjPiESY1DfvLrDWukWCyUEr10Se+N9sCAjwKG6
         cj2xE7N6vNQ7f75P5w7yNF2BnnFsgG5WrqS0uHdd8EN/KoLcQm8aJipOj5U86evPB7
         TBO/owBok/W/+g+ogF4VNdqwiy6A2xr/a7sAZTvk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 11B8660C4B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, maz@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v2 00/12] Support wakeup capable GPIOs
Date:   Fri, 15 Nov 2019 15:11:43 -0700
Message-Id: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Here is the spin of the series with the review comments addressed and
Reviewed-by tags added. Thanks all for your reviews.

Andy/Bjorn, would you pull patches 10-12 in your tree? Marc would be
pulling the patches 1-9 into the irqchip tree.

Thanks.

--Lina

---
Changes in v2:
	- Address review comments
	- Added Reviewed-by tags

Changes in v1[7]:
	- Address review comments
	- Add Reviewed-by tags
	- Drop SPI config patches
	- Rebase on top of Rajendra's PDC changes [6]

Changes in RFC v2[5]:
        - Address review comments #3, #4, #6, #7, #8, #9, #10
        - Rebased on top of linux-next GPIO latest patches [1],[3],[4]
        - Increase PDC max irqs in #2 (avoid merge conflicts with
          downstream)
        - Add Reviewed-by #5


[1].
https://lore.kernel.org/linux-gpio/20190808123242.5359-1-linus.walleij@linaro.org/
[2].
https://lkml.org/lkml/2019/5/7/1173
[3].
https://lore.kernel.org/r/20190819084904.30027-1-linus.walleij@linaro.org
[4].
https://lore.kernel.org/r/20190724083828.7496-1-linus.walleij@linaro.org
[5].
https://lore.kernel.org/linux-gpio/5da6b849.1c69fb81.a9b04.1b9f@mx.google.com/t/
[6].
https://lore.kernel.org/linux-arm-msm/d622482d92059533f03b65af26c69b9b@www.loen.fr/
[7].
https://lore.kernel.org/linux-gpio/5dcefdfd.1c69fb81.c5332.fbe0@mx.google.com/T/#t

Lina Iyer (10):
  irqdomain: add bus token DOMAIN_BUS_WAKEUP
  drivers: irqchip: qcom-pdc: update max PDC interrupts
  drivers: irqchip: pdc: Do not toggle IRQ_ENABLE during mask/unmask
  drivers: irqchip: add PDC irqdomain for wakeup capable GPIOs
  of: irq: document properties for wakeup interrupt parent
  drivers: pinctrl: msm: setup GPIO chip in hierarchy
  drivers: pinctrl: sdm845: add PDC wakeup interrupt map for GPIOs
  arm64: dts: qcom: add PDC interrupt controller for SDM845
  arm64: dts: qcom: setup PDC as the wakeup parent for TLMM on SDM845
  arm64: defconfig: enable PDC interrupt controller for Qualcomm SDM845

Maulik Shah (2):
  genirq: Introduce irq_chip_get/set_parent_state calls
  drivers: irqchip: pdc: Add irqchip set/get state calls

 .../bindings/interrupt-controller/interrupts.txt   |  12 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  10 ++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/irqchip/qcom-pdc.c                         | 147 +++++++++++++++++++--
 drivers/pinctrl/qcom/pinctrl-msm.c                 | 112 +++++++++++++++-
 drivers/pinctrl/qcom/pinctrl-msm.h                 |  14 ++
 drivers/pinctrl/qcom/pinctrl-sdm845.c              |  23 +++-
 include/linux/irq.h                                |   6 +
 include/linux/irqdomain.h                          |   1 +
 include/linux/soc/qcom/irq.h                       |  34 +++++
 kernel/irq/chip.c                                  |  44 ++++++
 11 files changed, 388 insertions(+), 16 deletions(-)
 create mode 100644 include/linux/soc/qcom/irq.h

--
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

