Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC2A2E037
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 16:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfE2Oxi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 10:53:38 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40898 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbfE2Oxb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 10:53:31 -0400
Received: by mail-wm1-f65.google.com with SMTP id 15so1822562wmg.5;
        Wed, 29 May 2019 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V8YS4yymyIJQGrMMcy8svUF2AoqiD+RwwGe4T+u/tvI=;
        b=cPwDgmdNH0Kt2d+P5AQL/GVo0J0j2E6mJeWrvlYBknQMzj7KRC3ROjz/Ld4psuTqh9
         7Hd7VNtPd2NRobiXhOX/87F41FHnheQSS/iZT2MIlj1YKF79hdQar+xS4iN+crjJLvJo
         9uXmXKoN8eZLRDvxzMtqTdNywDvJQs1eOQz+p+9JH05szfP+7qIDx1X3gNcj4J9+/LkD
         piuN2PzJsDOhwqtma0aZOFmuZ8TcihxteLJ7QkHSULtNu87W7WFq+rqwSKKj7cuHnTyU
         2mH8r7LQkCnPHKXe7zqOTToljSBTvSjvm2HapNYxad9BGNgp2dVk8nEN9PkHzbicGget
         XYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V8YS4yymyIJQGrMMcy8svUF2AoqiD+RwwGe4T+u/tvI=;
        b=X5tKRhj0WYW3y6kRVqYxw1f7T6hDZt5zyG5K/0u7bBpLbxpVInEz/WA/CfnpIOWmzs
         EuLSr1NuXO4WNOuqlUYBIBsFArmSoECfSEyunOm03QAU3fYVKWhBTS4YlJ8xQaqDSrnv
         iFP4Tdv+3zhAvHAZf/rqsWzkSPHutcNlvMJe9T0LX0sv0Uwr5m/75eeJJWVHzHkBhDWr
         wQtGcRupedLjbvjwLtr0LMkU8S6aI4m4YehSKSLr0M6cledgDE3nucD+qR9kIMCMG2mz
         zn05iMPO6AlksDHDXmUya7qNl+rt4bWVH9ECjAlEfLvifSndlhjBnrASz1Fl8UyHkDc1
         l+PA==
X-Gm-Message-State: APjAAAXECSwbFNlu3zY/oxdDilx+KRwbEeHFPivneTV+pvPTgY3ix1Bk
        Ii+7uBvY3PP9ModYIXjvlOw=
X-Google-Smtp-Source: APXvYqwSeV7F8N0/DKUi/jbr2lZV7RO9hHsArEclGOMv/01BQW2+13qxM+DQSJfOtr07iomxLI0myw==
X-Received: by 2002:a7b:c939:: with SMTP id h25mr7294735wml.7.1559141604564;
        Wed, 29 May 2019 07:53:24 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id y16sm17925234wru.28.2019.05.29.07.53.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 29 May 2019 07:53:23 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Implement wake event support on Tegra186 and later
Date:   Wed, 29 May 2019 16:53:20 +0200
Message-Id: <20190529145322.20630-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi,

The following is a set of patches that allow certain interrupts to be
used as wakeup sources on Tegra186 and later. To implement this, each
of the GPIO controllers' IRQ domain needs to become hierarchical, and
parented to the PMC domain. The PMC domain in turn implements a new
IRQ domain that is a child to the GIC IRQ domain.

The above ensures that the interrupt chip implementation of the PMC is
called at the correct time. The ->irq_set_type() and ->irq_set_wake()
implementations program the PMC wake registers in a way to enable the
given interrupts as wakeup sources.

This is based on a suggestion from Thomas Gleixner that resulted from
the following thread:

        https://lkml.org/lkml/2018/9/13/1042

Changes in v3:
- use irq_create_fwspec_mapping() instead of irq_domain_alloc_irqs()
- drop preparatory patch exporting irq_domain_alloc_irqs()
- properly set GPIO instance on Tegra186

Changes in v2:
- dropped the Tegra PMC specific patches to simplify the series
- drop wakeup-parent usage, lookup up PMC by compatible
- convert Tegra186 GPIO driver to use valid mask
- move hierarchy support code into gpiolib core

Linus, this is a new revision based on our previous discussion. Sorry it
took so long to get back to this. I also verified that with this series
I can make things work with gpio-keys whether I use the "gpios" property
or the "interrupts" property, which was your primary concern.

I'm also adding Lina to the thread since she's been basing her QCOM
series on top of this patch. Lina, it'd be great if you could confirm
that the changes I made in this version continue to work for you.

Thierry

Thierry Reding (2):
  gpio: Add support for hierarchical IRQ domains
  gpio: tegra186: Implement wake event support

 drivers/gpio/Kconfig         |   1 +
 drivers/gpio/gpio-tegra186.c | 120 +++++++++++++++++++++++++++++++----
 drivers/gpio/gpiolib.c       |  33 ++++++++--
 include/linux/gpio/driver.h  |   8 +++
 4 files changed, 144 insertions(+), 18 deletions(-)

-- 
2.21.0

