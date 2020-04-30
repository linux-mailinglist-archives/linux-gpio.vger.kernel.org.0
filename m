Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C5C1BF376
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2020 10:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgD3ItM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Apr 2020 04:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726547AbgD3ItL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 30 Apr 2020 04:49:11 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 775B8C035495
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2020 01:49:11 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:182a:142e:a95f:66c2])
        by laurent.telenet-ops.be with bizsmtp
        id YwpB220050w8ZL601wpBMe; Thu, 30 Apr 2020 10:49:11 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4sZ-0002lv-1k; Thu, 30 Apr 2020 10:49:11 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4sZ-0000QZ-0C; Thu, 30 Apr 2020 10:49:11 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.8
Date:   Thu, 30 Apr 2020 10:49:09 +0200
Message-Id: <20200430084909.1599-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.8-tag1

for you to fetch changes up to 41fe32ecc7aff4527a4ee477870d9b1164be95a4:

  MAINTAINERS: Add DT Bindings for Renesas Pin Function Controllers (2020-04-20 13:14:05 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v5.8

  - Fix SWIO pins on RZ/A1L,
  - Add missing bindings to MAINTAINERS.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (1):
      MAINTAINERS: Add DT Bindings for Renesas Pin Function Controllers

Jason Yan (1):
      pinctrl: rza1: Fix wrong array assignment of rza1l_swio_entries

 MAINTAINERS                    | 1 +
 drivers/pinctrl/pinctrl-rza1.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
