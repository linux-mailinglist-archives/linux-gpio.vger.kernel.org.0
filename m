Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD350E322A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2019 14:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfJXMW2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Oct 2019 08:22:28 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:59150 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbfJXMW2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Oct 2019 08:22:28 -0400
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id HQNS2100T5USYZQ01QNSWa; Thu, 24 Oct 2019 14:22:27 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNc8I-0005pR-En; Thu, 24 Oct 2019 14:22:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNc8I-00034o-CQ; Thu, 24 Oct 2019 14:22:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Marc Zyngier <marc.zyngier@arm.com>, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/2] gpio: renesas: Use proper irq_chip name
Date:   Thu, 24 Oct 2019 14:22:22 +0200
Message-Id: <20191024122224.11776-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus, Bartosz,

Recently, Marc pointed out some common misconceptions w.r.t. the .name
and .parent_device fields in struct irq_chip.  This patch series fixes
the names in the Renesas GPIO controller drivers.

Changes compared to v1[*]:
  - Drop irqchip patches applied to the irqchip tree.

Thanks for applying!

[*] https://lore.kernel.org/linux-renesas-soc/20190607095858.10028-1-geert+renesas@glider.be/

Geert Uytterhoeven (2):
  gpio: em: Use proper irq_chip name
  gpio: rcar: Use proper irq_chip name

 drivers/gpio/gpio-em.c   | 2 +-
 drivers/gpio/gpio-rcar.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
