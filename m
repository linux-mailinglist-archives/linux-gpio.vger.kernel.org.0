Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2EEADC37C
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2019 13:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390121AbfJRLBK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Oct 2019 07:01:10 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:60126 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633620AbfJRLBG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Oct 2019 07:01:06 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id Ez142100D05gfCL01z14un; Fri, 18 Oct 2019 13:01:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iLQ0G-0005q3-Gg; Fri, 18 Oct 2019 13:01:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iLPF8-0006tt-VN; Fri, 18 Oct 2019 12:12:22 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.5
Date:   Fri, 18 Oct 2019 12:12:21 +0200
Message-Id: <20191018101221.26483-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.5-tag1

for you to fetch changes up to f846d1e704f2d07a7f359f65eac2c8cac565db35:

  pinctrl: sh-pfc: pfc-r8a77965: Fix typo in pinmux macro for SCL3 (2019-10-14 12:11:12 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v5.5

  - Add support for the new RZ/G2N (r8a774b1) SoC,
  - Small fixes and cleanups.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (2):
      dt-bindings: pinctrl: sh-pfc: Document r8a774b1 PFC support
      pinctrl: sh-pfc: r8a77965: Add R8A774B1 PFC support

Chris Brandt (1):
      pinctrl: rza2: Fix gpio name typos

Colin Ian King (1):
      pinctrl: rzn1: Make array reg_drive static, makes object smaller

Geert Uytterhoeven (2):
      Revert "pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit30 when using SSI_SCK2 and SSI_WS2"
      Revert "pinctrl: sh-pfc: r8a77990: Fix MOD_SEL1 bit31 when using SIM0_D"

Keiya Nobuta (5):
      pinctrl: sh-pfc: Fix PINMUX_IPSR_PHYS() to set GPSR
      pinctrl: sh-pfc: pfc-r8a7795: Fix typo in pinmux macro for SCL3
      pinctrl: sh-pfc: pfc-r8a7795-es1: Fix typo in pinmux macro for SCL3
      pinctrl: sh-pfc: pfc-r8a7796: Fix typo in pinmux macro for SCL3
      pinctrl: sh-pfc: pfc-r8a77965: Fix typo in pinmux macro for SCL3

Takeshi Kihara (1):
      pinctrl: sh-pfc: r8a77990: Rename AVB_AVTP_{MATCH,CAPTURE} pin functions

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   1 +
 drivers/pinctrl/pinctrl-rza2.c                     |   4 +-
 drivers/pinctrl/pinctrl-rzn1.c                     |   2 +-
 drivers/pinctrl/sh-pfc/Kconfig                     |   4 +
 drivers/pinctrl/sh-pfc/Makefile                    |   1 +
 drivers/pinctrl/sh-pfc/core.c                      |   6 +
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c           |   2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c               |   2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |   2 +-
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c              | 863 +++++++++++----------
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c              |  57 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   5 +-
 12 files changed, 504 insertions(+), 445 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
