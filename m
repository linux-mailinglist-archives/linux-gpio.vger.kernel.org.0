Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4B551FA8A5
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 08:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgFPGNo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 02:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbgFPGNn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 02:13:43 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC9DDC03E96A
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 23:13:42 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id n9so7930263plk.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 23:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=WpLd8LRsJ/8biRJMZx0Bnx3mOD9worHTt50kQ8XWP7E=;
        b=RxSooEOC/+yMUfI3gtNEWymtFFdmRe4Tkk2rBTpKJA3oVwp3ItlbonH5UnISC/UFSw
         xg7h20PlIep3H7ldLpXzMVsTTCtf/6qdsD2rtzER8gSccQuO5izUvI4/DVOJyuBr0uup
         P8aGCybW+GqHvl6l/YXJECQASVAnBVyQ/gMEygwAhcntyylCrDU5piUvOROASQrJULJ3
         xo1aXzo0HfZYEWVbNFb3YdWACmXm/8ZRtF59TQz1J9nEEG1zyL1wVX2++p/L/AMY9SsH
         hIm8Cg3VHPQyhCvqGwz5j4gSPvFKc8dSujV/RvR9zDWeHStJ0IPk46rRwp3VvwGDargX
         TGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WpLd8LRsJ/8biRJMZx0Bnx3mOD9worHTt50kQ8XWP7E=;
        b=dpe8l5iKljWvCzq2R4fPgNM3ir0bXH2+CYjgh7N9DeknLPJc7U+VAF+AKIt9snT7IX
         oUbLAYAJ5JyQiqSapS3K6KgsE++/HIeKjptO1++tgUyrDayoz4su6SWLW+fgKK5Plb0F
         ypTLbIqen/VEK8sNHqifNzIhpTRrXHKdxiAMcnr8RtCI2I5RApIsUKe6f9ws74PjpOCU
         3bOZ3INSeW5Myy5eod6nRS6HFH5dJhP4NIFOYr/9EfMGhdL79dRADm3GbL+5qLnuwfXT
         FXlwQG/48AyIN3TOiBpuCXMcRyXhqBVeiJHxFdrKxBXu481qtxSK8CQ4R7KdYnDl0YGU
         SyQw==
X-Gm-Message-State: AOAM531drng1PCAzBAy4lk0twkxxR9kQzQdg7VkMjbGV4u5aHy2cSiRF
        x9EqUsE5nOhVJQWT86RWkPgiVw==
X-Google-Smtp-Source: ABdhPJxJYRDBUdC2n/hzHBEEXJUuOgq+LjZinVw+29cwU9skb8cP3yPF9qx0n2GXzlPlzYv9r0itoQ==
X-Received: by 2002:a17:90b:28d:: with SMTP id az13mr1345731pjb.67.1592288022378;
        Mon, 15 Jun 2020 23:13:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id i26sm15642032pfo.0.2020.06.15.23.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 23:13:41 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Saravana Kannan <saravanak@google.com>,
        Todd Kjos <tkjos@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: [RFC][PATCH 0/5] Allow for qcom-pdc, pinctrl-msm and qcom-scm drivers to be loadable as modules
Date:   Tue, 16 Jun 2020 06:13:33 +0000
Message-Id: <20200616061338.109499-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series provides exports and config tweaks to allow
the qcom-pdc, pinctrl-msm and qcom-scm drivers to be able to be
configured as permement modules (particularlly useful for the
Android Generic Kernel Image efforts).

Feedback would be appreciated!

thanks
-john

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-gpio@vger.kernel.org

John Stultz (5):
  irq: irqdomain: Export irq_domain_update_bus_token
  irq: irqchip: Export irq_chip_retrigger_hierarchy and
    irq_chip_set_vcpu_affinity_parent
  irqchip: Allow QCOM_PDC to be loadable as a perment module
  pinctrl: qcom: Allow pinctrl-msm code to be loadable as a module
  firmware: QCOM_SCM: Allow qcom_scm driver to be loadable as a
    permenent module

 drivers/firmware/Kconfig           |  2 +-
 drivers/firmware/Makefile          |  3 ++-
 drivers/firmware/qcom_scm.c        |  4 ++++
 drivers/iommu/Kconfig              |  2 ++
 drivers/irqchip/Kconfig            |  2 +-
 drivers/irqchip/qcom-pdc.c         | 30 ++++++++++++++++++++++++++++++
 drivers/pinctrl/qcom/Kconfig       |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c |  3 +++
 kernel/irq/chip.c                  |  3 ++-
 kernel/irq/irqdomain.c             |  1 +
 10 files changed, 47 insertions(+), 5 deletions(-)

-- 
2.17.1

