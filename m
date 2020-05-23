Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886DF1DF885
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2020 19:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbgEWRLj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 May 2020 13:11:39 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:48975 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728169AbgEWRLj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 23 May 2020 13:11:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590253899; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=qvi0VRqlKEMVA/6GmY+485IFJ3sXKzvdCZwty6wFVGo=; b=WpzksIlVNGDw+LxVrpemOe4cweaglY+Tg2/j04S3WGl4i1mHSsV5s/CSZLSuhshgHlxos94e
 SNAlU80zcEwMMDQ6Snv7g4Drxm/7goBTVuw7stiKKNhmafaeyqH1iDXw5CvLapASfcRKBP1q
 41Ios7mlSmcoUitX7isWASPamCw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec9593c.7fc0b43cc1b8-smtp-out-n03;
 Sat, 23 May 2020 17:11:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 56EF7C433A1; Sat, 23 May 2020 17:11:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9BE3CC433C6;
        Sat, 23 May 2020 17:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9BE3CC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     bjorn.andersson@linaro.org, maz@kernel.org,
        linus.walleij@linaro.org, swboyd@chromium.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v2 0/4] irqchip: qcom: pdc: Introduce irq_set_wake call
Date:   Sat, 23 May 2020 22:41:09 +0530
Message-Id: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changes in v2:
- Fix compiler error on gpiolib patch

This series adds support to lazy disable pdc interrupt.

Some drivers using gpio interrupts want to configure gpio for wakeup using
enable_irq_wake() but during suspend entry disables irq and expects system
to resume when interrupt occurs. In the driver resume call interrupt is
re-enabled and removes wakeup capability using disable_irq_wake() one such
example is cros ec driver.

With [1] in documentation saying "An irq can be disabled with disable_irq()
and still wake the system as long as the irq has wake enabled".

The PDC IRQs are currently "unlazy disabled" (disable here means that it
will be masked in PDC & GIC HW GICD_ISENABLER, the moment driver invokes
disable_irq()) such IRQs can not wakeup from low power modes like suspend
to RAM since the driver chosen to disable this.

During suspend entry, no one re-enable/unmask in HW, even if its marked for
wakeup.

One solutions thought to address this problem was...During suspend entry at
last point, irq chip driver re-enable/unmask IRQs in HW that are marked for
wakeup. This was attemped in [2].

This series adds alternate solution to [2] by "lazy disable" IRQs in HW.
The genirq takes care of lazy disable in case if irqchip did not implement
irq_disable callback. Below is high level steps on how this works out..

a. During driver's disable_irq() call, IRQ will be marked disabled in SW
b. IRQ will still be enabled(read unmasked in HW)
c. The device then enters low power mode like suspend to RAM
d. The HW detects unmasked IRQs and wakesup the CPU
e. During resume after local_irq_enable() CPU goes to handle the wake IRQ
f. Generic handler comes to know that IRQ is disabled in SW
g. Generic handler marks IRQ as pending and now invokes mask callback
h. IRQ gets disabled/masked in HW now
i. When driver invokes enable_irq() the SW pending IRQ leads IRQ's handler
j. enable_irq() will again enable/unmask in HW

[1] https://www.spinics.net/lists/kernel/msg3398294.html
[2] https://patchwork.kernel.org/patch/11466021/

Maulik Shah (4):
  gpio: gpiolib: Allow GPIO IRQs to lazy disable
  pinctrl: qcom: Remove irq_disable callback from msmgpio irqchip
  pinctrl: qcom: Add msmgpio irqchip flags
  irqchip: qcom-pdc: Introduce irq_set_wake call

 drivers/gpio/gpiolib.c             | 55 +++++++++++++++++++++++++-------------
 drivers/irqchip/qcom-pdc.c         | 33 ++++++++++++-----------
 drivers/pinctrl/qcom/pinctrl-msm.c | 15 ++---------
 include/linux/gpio/driver.h        | 13 +++++++++
 4 files changed, 68 insertions(+), 48 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
