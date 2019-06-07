Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFA438787
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2019 11:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbfFGJ7X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 05:59:23 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:39438 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727941AbfFGJ7C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 05:59:02 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id Mlz02000e3XaVaC01lz0Zn; Fri, 07 Jun 2019 11:59:00 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hZBeG-00040w-GC; Fri, 07 Jun 2019 11:59:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hZBeG-0002cX-Er; Fri, 07 Jun 2019 11:59:00 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] irqchip: renesas: Use proper irq_chip name and parent
Date:   Fri,  7 Jun 2019 11:58:54 +0200
Message-Id: <20190607095858.10028-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi all,

Recently, Marc pointed out some common misconceptions w.r.t. the .name
and .parent_device fields in struct irq_chip.  This patch series fixes
them in the Renesas interrupt controller drivers.

The first two patches are destined for the irqchip tree, the last two
for the GPIO tree.

Thanks!

Geert Uytterhoeven (4):
  irqchip/renesas-intc-irqpin: Use proper irq_chip name and parent
  irqchip/renesas-irqc: Use proper irq_chip name and parent
  gpio: em: Use proper irq_chip name
  gpio: rcar: Use proper irq_chip name

 drivers/gpio/gpio-em.c                    | 2 +-
 drivers/gpio/gpio-rcar.c                  | 2 +-
 drivers/irqchip/irq-renesas-intc-irqpin.c | 3 ++-
 drivers/irqchip/irq-renesas-irqc.c        | 3 ++-
 4 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
