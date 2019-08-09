Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E945F87355
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2019 09:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfHIHoe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Aug 2019 03:44:34 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:40494 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405582AbfHIHoe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Aug 2019 03:44:34 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id mvkW2000m05gfCL01vkXLC; Fri, 09 Aug 2019 09:44:31 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hvzZe-00064h-T4; Fri, 09 Aug 2019 09:44:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hvzZe-00072P-Qv; Fri, 09 Aug 2019 09:44:30 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] pinctrl: sh-pfc: Updates for v5.4
Date:   Fri,  9 Aug 2019 09:44:20 +0200
Message-Id: <20190809074420.27006-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.4-tag1

for you to fetch changes up to 625efea83a7c37d281c6a90526813a1366929d24:

  pinctrl: rza1: Use devm_platform_ioremap_resource() helper (2019-08-09 09:34:45 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v5.4

  - Add missing of_node_put() calls on RZ/N1,
  - Small cleanups.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (2):
      pinctrl: sh-pfc: Use dev_notice_once() instead of open-coding
      pinctrl: rza1: Use devm_platform_ioremap_resource() helper

Nishka Dasgupta (1):
      pinctrl: rzn1: Add of_node_put() before return

 drivers/pinctrl/pinctrl-rza1.c |  4 +---
 drivers/pinctrl/pinctrl-rzn1.c | 12 +++++++++---
 drivers/pinctrl/sh-pfc/gpio.c  |  9 ++-------
 3 files changed, 12 insertions(+), 13 deletions(-)
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
