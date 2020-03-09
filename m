Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7CB117E383
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2020 16:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgCIPY4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Mar 2020 11:24:56 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34373 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbgCIPYz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2020 11:24:55 -0400
Received: by mail-lj1-f194.google.com with SMTP id s13so1165810ljm.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2020 08:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jbDLYusSnM6pIqjjnhoz0pEG1Av/QiUIZjymydPONDM=;
        b=D/SW5tysueaKyWZGSiV2gS+rHzi+MdjpefC0HsRBSZ82fmjSRNcEX8R3ol/PDclgNa
         NaoWVDVdYrrF9T0JWEZvwTKmvdPB1TtYK8i8mpZm4sE51rRyHNLheHZ1kz/SrAFF9BRZ
         Ri5ild8YtgfzAFBZCgXhLfx3Og7Xne4okCG7cy4iFtwGSY3VM1T9vtfcpWzaRY0sRaIr
         pAPKEPZuNV9b1XW9ls42JFqNYUr0kKl97O67bXLyoal38WAgHAiPzn5iq+KhF0lYvGjr
         7ju0k/CfBpnvMi6Ai2zp8y5LHCcKzDsl/B5maqJ0DPNsh/vFlePv8JX1Er4jRZFaGOX9
         izZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jbDLYusSnM6pIqjjnhoz0pEG1Av/QiUIZjymydPONDM=;
        b=nPoMP4SBHGD8FEA9bfWTUyemeLL5y1bmwo+t3X5gTKBl2QfjEvQIF5IWmWChaMdibo
         sQGnTRmW721/FeTLzBz26RpYxgXyXV/BX4RJv1kCY9gS81xqZgKhWiz4HxchjBxIALtz
         wcWEUsw9ad7IRqJYddUL5OePYtfQq1xzeVKHe4cjOHvwAa6KB/IvcyKWnBlTRUs4ql9A
         HloQ6TmMevG7tFaa6QgeYJ4XBq1FVKwuxLpS4iJgUAGlF6UDFNR8VXr+Z14iJmovJr1o
         3o0Tixjc0im8psDluXuDmFIGLc6TfQhvC+mEv3i+GUC8TlBEMSit21K2EKH16GeiBuum
         B9YQ==
X-Gm-Message-State: ANhLgQ3cYLb8vAgU4yu6qbXOQMeYlMMTEm4hnA7q67HyHQP6jApwfIao
        WedkAZPJTulI3ZShqkF3Qi01EICJ1Gg=
X-Google-Smtp-Source: ADFU+vumSmmpcbUV4GBhSbfgzl204I7hwfHYv74YYnfGWpjaCDBPA+udq/cFB7VVqxqeU7/eCHpg9Q==
X-Received: by 2002:a2e:b892:: with SMTP id r18mr10046087ljp.252.1583767493243;
        Mon, 09 Mar 2020 08:24:53 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id c20sm14705688lfb.60.2020.03.09.08.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 08:24:52 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        David Heidelberg <david@ixit.cz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, stable@vger.kernel.org
Subject: [PATCH v3] pinctrl: qcom: Assign irq_disable/eoi conditionally
Date:   Mon,  9 Mar 2020 16:24:46 +0100
Message-Id: <20200309152446.584797-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The hierarchical parts of MSM pinctrl/GPIO is only
used when the device tree has a "wakeup-parent" as
a phandle, but the .irq_eoi is anyway assigned leading
to semantic problems on elder Qualcomm chipsets.

When the drivers/mfd/qcom-pm8xxx.c driver calls
chained_irq_exit() that call will in turn call chip->irq_eoi()
which is set to irq_chip_eoi_parent() by default on a
hierachical IRQ chip, and the parent is pinctrl-msm.c
so that will in turn unconditionally call
irq_chip_eoi_parent() again, but its parent is invalid
so we get the following crash:

 Unnable to handle kernel NULL pointer dereference at
 virtual address 00000010
 pgd = (ptrval)
 [00000010] *pgd=00000000
 Internal error: Oops: 5 [#1] PREEMPT SMP ARM
 (...)
 PC is at irq_chip_eoi_parent+0x4/0x10
 LR is at pm8xxx_irq_handler+0x1b4/0x2d8

If we solve this crash by avoiding to call up to
irq_chip_eoi_parent(), the machine will hang and get
reset by the watchdog, because of semantic issues,
probably inside irq_chip.

As a solution, just assign the .irq_eoi conditionally if
we are actually using a wakeup parent.

Cc: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: stable@vger.kernel.org
Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
Link: https://lore.kernel.org/r/20200306121221.1231296-1-linus.walleij@linaro.org
Link: https://lore.kernel.org/r/20200309125207.571840-1-linus.walleij@linaro.org
Tested-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Keep .irq_disable() around, just make the assignment of
  .irq_eoi() conditional.
ChangeLog v1->v2:
- Noticed that the previous solution doesn't actually work,
  the machine hangs and reboots intead (even if it got rid of
  the most obvious crash). Make a more thorough solution that
  completely avoids using these callbacks if we don't have
  a parent.
- v1 was called "Guard irq_eoi()"
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 9a8daa256a32..1a948c3f54b7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1104,7 +1104,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	pctrl->irq_chip.irq_mask = msm_gpio_irq_mask;
 	pctrl->irq_chip.irq_unmask = msm_gpio_irq_unmask;
 	pctrl->irq_chip.irq_ack = msm_gpio_irq_ack;
-	pctrl->irq_chip.irq_eoi = irq_chip_eoi_parent;
 	pctrl->irq_chip.irq_set_type = msm_gpio_irq_set_type;
 	pctrl->irq_chip.irq_set_wake = msm_gpio_irq_set_wake;
 	pctrl->irq_chip.irq_request_resources = msm_gpio_irq_reqres;
@@ -1118,7 +1117,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 		if (!chip->irq.parent_domain)
 			return -EPROBE_DEFER;
 		chip->irq.child_to_parent_hwirq = msm_gpio_wakeirq;
-
+		pctrl->irq_chip.irq_eoi = irq_chip_eoi_parent;
 		/*
 		 * Let's skip handling the GPIOs, if the parent irqchip
 		 * is handling the direct connect IRQ of the GPIO.
-- 
2.24.1

