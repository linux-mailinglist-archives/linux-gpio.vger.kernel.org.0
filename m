Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7308A24054F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Aug 2020 13:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgHJLYr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Aug 2020 07:24:47 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:44847 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726546AbgHJLVl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Aug 2020 07:21:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597058501; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=wCH2n0Q7ydePXVwUlLWJAGuuKVfyJIQu6/ufchdgTHs=; b=BKII8mKWyDhHaFXhE/kCsEgwlMHO+EZEsujz6Euy5H5QpjCoZhj4DK2IezW4CmCiTphjISIf
 ttgQNpmVTfbSrfgJSGGjkvBF99Lp9q0z1CS/RZUs4qTZsxcItQtTTsgs33hnlV0pc+FimkwW
 MKujo3frpOoxJrHhqOPwlMyiVtM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-east-1.postgun.com with SMTP id
 5f312daed78a2e58335e0986 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 10 Aug 2020 11:21:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A7A78C43395; Mon, 10 Aug 2020 11:21:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3FCB3C433C6;
        Mon, 10 Aug 2020 11:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3FCB3C433C6
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
Subject: [PATCH v4 0/7] irqchip: qcom: pdc: Introduce irq_set_wake call
Date:   Mon, 10 Aug 2020 16:50:53 +0530
Message-Id: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changes in v4:
- Drop "Remove irq_disable callback from msmgpio irqchip" patch from v3
- Introduce irq_suspend_one() and irq_resume_one() callbacks
- Use the new callbacks to unmask wake interrupts during suspend
- Reset only pdc interrupts that are mapped in DTSI

Changes in v3:
- Drop gpiolib change (v2 patch 1) since its already in linux-next
- Add Acked-by Linus Walleij for v2 patch 2 and v2 patch 3.
- Address Stephen's comment to on v2 patch 3
- Address Stephen's comment to change variable to static on v2 patch 4.
- Add a new change to use return value from .irq_set_wake callback
- Add a new change to reset PDC irq enable bank during init time

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

Douglas Anderson (4):
  genirq: Introduce irq_suspend_one() and irq_resume_one() callbacks
  genirq: introduce irq_suspend_parent() and irq_resume_parent()
  pinctrl: qcom: Call our parent for irq_suspend_one / irq_resume_one
  irqchip: qcom-pdc: Unmask wake up irqs during suspend

Maulik Shah (3):
  pinctrl: qcom: Add msmgpio irqchip flags
  pinctrl: qcom: Use return value from irq_set_wake call
  irqchip: qcom-pdc: Reset all pdc interrupts during init

 drivers/irqchip/qcom-pdc.c         | 63 ++++++++++++++++++++++++++++++++++++--
 drivers/pinctrl/qcom/pinctrl-msm.c | 12 +++++---
 include/linux/irq.h                | 15 +++++++--
 kernel/irq/chip.c                  | 44 ++++++++++++++++++++++++++
 kernel/irq/internals.h             |  2 ++
 kernel/irq/pm.c                    | 15 +++++++--
 6 files changed, 138 insertions(+), 13 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

