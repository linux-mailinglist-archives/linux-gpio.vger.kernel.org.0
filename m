Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C283136DA9
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2020 14:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbgAJNTa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jan 2020 08:19:30 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:51716 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbgAJNTa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jan 2020 08:19:30 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id odKU210085USYZQ01dKUuP; Fri, 10 Jan 2020 14:19:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0007Wm-93; Fri, 10 Jan 2020 14:19:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0000Hi-7A; Fri, 10 Jan 2020 14:19:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/13] pinctrl: sh-pfc: checker: Various improvements
Date:   Fri, 10 Jan 2020 14:19:14 +0100
Message-Id: <20200110131927.1029-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi all,

This patch series contains various improvements for the builtin pin
control table runtime checks of the Renesas Pin Function Controller
driver.  These checks are enabled with CONFIG_DEBUG_PINCTRL=y, which can
be combined with CONFIG_COMPILE_TEST=y to increase coverage to all
Renesas ARM and SuperH SoCs..

Note that all issues detected by this have already been fixed in "[PATCH
0/6] pinctrl: sh-pfc: More miscellenaous fixes"[1], and are now part of
linux-next.

I plan to queue this in sh-pfc-for-v5.7.

Thanks for your comments!

[1] https://lore.kernel.org/linux-renesas-soc/20191218194812.12741-1-geert+renesas@glider.be/

Geert Uytterhoeven (13):
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

 drivers/pinctrl/sh-pfc/core.c | 312 +++++++++++++++++++++++++++-------
 1 file changed, 250 insertions(+), 62 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
