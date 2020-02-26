Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7708216FC76
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2020 11:45:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbgBZKpf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Feb 2020 05:45:35 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:58002 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727520AbgBZKpf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Feb 2020 05:45:35 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id 7NlX2200A5USYZQ01NlXYi; Wed, 26 Feb 2020 11:45:33 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6uC3-0002Ii-Dp; Wed, 26 Feb 2020 11:45:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6uC3-0004cw-CN; Wed, 26 Feb 2020 11:45:31 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.7
Date:   Wed, 26 Feb 2020 11:45:29 +0100
Message-Id: <20200226104529.17745-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.7-tag1

for you to fetch changes up to ffe9f9b0515600fc5ccf121315939c2ab2cd1486:

  pinctrl: sh-pfc: Remove use of ARCH_R8A7795 (2020-02-21 13:57:44 +0100)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v5.7

  - Improve checks for pinctrl table validation,
  - Miscellaneous cleanups.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (15):
      pinctrl: sh-pfc: checker: Move data before code
      pinctrl: sh-pfc: checker: Add helpers for reporting
      pinctrl: sh-pfc: checker: Add helper for safe name comparison
      pinctrl: sh-pfc: checker: Add check for config register conflicts
      pinctrl: sh-pfc: checker: Add check for enum ID conflicts
      pinctrl: sh-pfc: checker: Improve pin checks
      pinctrl: sh-pfc: checker: Improve pin function checks
      pinctrl: sh-pfc: checker: Improve pin group checks
      pinctrl: sh-pfc: checker: Add drive strength register checks
      pinctrl: sh-pfc: checker: Add bias register checks
      pinctrl: sh-pfc: checker: Add ioctrl register checks
      pinctrl: sh-pfc: checker: Add data register checks
      pinctrl: sh-pfc: checker: Add function GPIO checks
      pinctrl: sh-pfc: gpio: Return early in gpio_pin_to_irq()
      pinctrl: sh-pfc: Remove use of ARCH_R8A7795

 drivers/pinctrl/sh-pfc/Kconfig |   4 +-
 drivers/pinctrl/sh-pfc/core.c  | 307 ++++++++++++++++++++++++++++++++---------
 drivers/pinctrl/sh-pfc/gpio.c  |   5 +-
 3 files changed, 248 insertions(+), 68 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
