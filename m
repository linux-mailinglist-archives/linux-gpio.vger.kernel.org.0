Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 960A661D6C
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jul 2019 13:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730122AbfGHLB5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jul 2019 07:01:57 -0400
Received: from onstation.org ([52.200.56.107]:56098 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbfGHLB4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Jul 2019 07:01:56 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 009DE3E912;
        Mon,  8 Jul 2019 11:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1562583716;
        bh=Qm/4+Z0/sz1rCO9MskaUatf9RSxxFsoX4hvz0Scz0wo=;
        h=From:To:Cc:Subject:Date:From;
        b=lWSxrK30kwh+TjTMBFonMQCYwFPlJ0SeNYUzF6nJyzLDvnOf1IbNg+wdOStKLus8S
         ZU5MDFgGkK35t6IhWxM9f7GeBJb9bwT9iW7Ya/+9sollmo91dJ0/x45oD3BKRlhwEW
         q862w4up8QzG6e+7MhBnuFBeHFu5mDPjahF8QmaI=
From:   Brian Masney <masneyb@onstation.org>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        tglx@linutronix.de, marc.zyngier@arm.com, ilina@codeaurora.org,
        jonathanh@nvidia.com, skomatineni@nvidia.com, bbiswas@nvidia.com,
        linux-tegra@vger.kernel.org, david.daney@cavium.com,
        yamada.masahiro@socionext.com, treding@nvidia.com,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] gpio: hierarchical IRQ improvements
Date:   Mon,  8 Jul 2019 07:01:34 -0400
Message-Id: <20190708110138.24657-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This builds on top of Linus Walleij's existing patches that adds
hierarchical IRQ support to the GPIO core [1] so that Qualcomm's
spmi-gpio and ssbi-gpio can be converted to use these new helpers.

Linus: Feel free to squash these into your existing patches if you'd
like to use any of this code. Just give me some kind of mention in the
commit description.

[1] https://lore.kernel.org/linux-gpio/20190624132531.6184-1-linus.walleij@linaro.org/

Brian Masney (4):
  gpio: introduce gpiochip_populate_parent_fwspec_{two,four}cell
    functions
  gpio: allow customizing hierarchical IRQ chips
  gpio: use handler in gpio_irq_chip instead of handle_bad_irq
  qcom: spmi-gpio: convert to hierarchical IRQ helpers in gpio core

 drivers/gpio/gpiolib.c                   | 78 ++++++++++++++++----
 drivers/pinctrl/qcom/Kconfig             |  1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 92 +++++++-----------------
 include/linux/gpio/driver.h              | 65 +++++++++++++++++
 4 files changed, 154 insertions(+), 82 deletions(-)

-- 
2.20.1

