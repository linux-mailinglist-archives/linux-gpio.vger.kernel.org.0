Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8AB1BA04
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2019 17:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731335AbfEMP3H (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 May 2019 11:29:07 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:55922 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731343AbfEMP3G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 May 2019 11:29:06 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id BrV32000E3XaVaC01rV3xx; Mon, 13 May 2019 17:29:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0001d9-4N; Mon, 13 May 2019 17:29:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hQCsx-0003Qc-1O; Mon, 13 May 2019 17:29:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Chris Paterson <chris.paterson2@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/11] pinctrl: sh-pfc: Convert to new non-GPIO helper macros
Date:   Mon, 13 May 2019 17:28:46 +0200
Message-Id: <20190513152857.13122-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi all,

On many Renesas ARM SoCs, there exist pins that are not associated with
a GPIO port, but still need configuration (e.g. drive strength or
pull-up).  While pins with GPIO functionality are indexed by their
GPIO number, no such number exists for non-GPIO pins.  Hence for the
latter, the pin control driver uses numbers outside the GPIO number
space, derived from the row and column numbers of the physical pins.

For R-Car H3 (and later M3-W and M3-N), the choice was made to use the
SiP (System-in-Package, i.e. SoC + RAM + HyperFlash in a BGA package)
physical pin numbers, as the SiP was what was mounted on the
Salvator-X(S) and ULCB development boards available at that time.

In hindsight, it would have been better to settle on the SoC physical
pin numbers, though: the pin control driver for R-Car M3-W was reused
for the RZ/G2M SoC, which is only available as an SoC, not SiP, thus
making it hard to match the driver with the documentation.

But even for SoCs there can be confusion: several SoCs are available in
multiple packages, with the same or different number of pins, leading to
different pin numberings.

As this numbering is used only internal to the driver, and pin control
configuration from DT refers to these pins by signal name, not pin
number (usually, see exceptions below[*]), I started wondering if we
could get rid of the SoC/SiP pin numbers instead.  As the actual numbers
don't matter, all that is needed for the driver is a unique number for
each pin.

Hence this patch series converts the affected drivers to use new macros
that allow to describe pins without GPIO functionality, and refer to
them by auto-generated symbolic enum values, similar in spirit to the
existing scheme for handling pins with GPIO functionality.

This series consists of three parts:
  - Patch 1 introduces new macros to describe and handle pins without
    GPIO functionality,
  - Patches 2-10 convert the pin control drivers for the individual SoCs
    to use the new macros,
  - Patch 11 removes the now unused old macros.

There should be no functional changes induced by this patch series,
which has been tested on Salvator-X(S) (with R-Car H3 ES1.0 and ES2.0,
M3-W, and M3-N), Ebisu (R-Car E3), and KZM-A9-GT (SH-Mobile AG5).

[*] The user-visible names of pins without GPIO functionality are based
    on pin numbers (e.g. "B25") instead of signal names ("CLKOUT") on
    EMMA Mobile EV2, R-Car M1A, R-Car H2, and SH-Mobile AG5.
    I didn't change these to preserve DT backwards compatibility.

The "name" parameters of the PIN_NOGP_CFG() and PIN_NOGP() macros could
be removed, if these macros would generate the names from the "pin"
parameters.  However, that would:
  1. Require replacing the "#" suffices in pin names for active-low
     signals by "_N",
     R-Car H3/M3-W/M3-N use a "#" suffix, R-Car E3 use a "_N" suffix.
  2. Replace the names based on pin numbers on older SoCs by signal
     names.
Both changes could affect DT backwards compatibility.  None of these are
currently used in (upstream) DTS files, though.
Do you think it would be worthwhile to make this consistent?

Thanks for your comments!

Geert Uytterhoeven (11):
  pinctrl: sh-pfc: Add new non-GPIO helper macros
  pinctrl: sh-pfc: emev2: Use new macros for non-GPIO pins
  pinctrl: sh-pfc: r8a7778: Use new macros for non-GPIO pins
  pinctrl: sh-pfc: r8a7790: Use new macros for non-GPIO pins
  pinctrl: sh-pfc: r8a7795-es1: Use new macros for non-GPIO pins
  pinctrl: sh-pfc: r8a7795: Use new macros for non-GPIO pins
  pinctrl: sh-pfc: r8a7796: Use new macros for non-GPIO pins
  pinctrl: sh-pfc: r8a77965: Use new macros for non-GPIO pins
  pinctrl: sh-pfc: r8a77990: Use new macros for non-GPIO pins
  pinctrl: sh-pfc: sh73a0: Use new macros for non-GPIO pins
  pinctrl: sh-pfc: Remove obsolete SH_PFC_PIN_NAMED*() macros

 drivers/pinctrl/sh-pfc/pfc-emev2.c       |  70 +++--
 drivers/pinctrl/sh-pfc/pfc-r8a7778.c     |  29 +-
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c     |  34 ++-
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 333 +++++++++++------------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 313 +++++++++++----------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 307 ++++++++++-----------
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 307 ++++++++++-----------
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c    |  87 +++---
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c      |  19 +-
 drivers/pinctrl/sh-pfc/sh_pfc.h          |  72 +++--
 10 files changed, 797 insertions(+), 774 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
