Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3F3C179BFB
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2020 23:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388476AbgCDWym (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Mar 2020 17:54:42 -0500
Received: from muru.com ([72.249.23.125]:58856 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388468AbgCDWyl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Mar 2020 17:54:41 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 350F180F5;
        Wed,  4 Mar 2020 22:55:26 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Dave Gerlach <d-gerlach@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Ladislav Michl <ladis@linux-mips.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 0/3] Block idle in gpio-omap with cpu_pm
Date:   Wed,  4 Mar 2020 14:54:29 -0800
Message-Id: <20200304225433.37336-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

As discussed earlier, here's a series to use cpu_pm to block deeper SoC
idle states if a gpio interrupt is pending.

Regards,

Tony


Tony Lindgren (3):
  ARM: OMAP2+: Handle errors for cpu_pm
  gpio: omap: Block idle on pending gpio interrupts
  Revert "gpio: omap: Fix lost edge wake-up interrupts"

 arch/arm/mach-omap2/cpuidle34xx.c |  9 +++++++--
 arch/arm/mach-omap2/cpuidle44xx.c | 26 +++++++++++++++++---------
 arch/arm/mach-omap2/pm34xx.c      |  8 ++++++--
 drivers/gpio/gpio-omap.c          | 29 ++++++++++++++---------------
 4 files changed, 44 insertions(+), 28 deletions(-)

-- 
2.25.1
