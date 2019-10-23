Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70D32E1A26
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 14:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391343AbfJWMaA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 08:30:00 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:46774 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388042AbfJWMaA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 08:30:00 -0400
Received: from ramsan ([84.194.98.4])
        by andre.telenet-ops.be with bizsmtp
        id H0Vy2100b05gfCL010Vyd5; Wed, 23 Oct 2019 14:29:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFm2-0000oy-Hw; Wed, 23 Oct 2019 14:29:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFm2-0003F6-Gb; Wed, 23 Oct 2019 14:29:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/3] pinctrl: sh-pfc: Add r8a77961 support
Date:   Wed, 23 Oct 2019 14:29:52 +0200
Message-Id: <20191023122955.12420-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi all,

This patch series adds support for the Pin Function Controller in the
Renesas R-Car M3-W+ (R8A77961) SoC.  As R-Car M3-W+ is very similar to
R-Car M3-W (R8A77960), the existing driver for R-Car M3-W is updated to
handle both.

To avoid confusion between R-Car M3-W and M3-W+, the existing config
symbol for M3-W is renamed to PINCTRL_PFC_R8A77960 in a dependency-free
way, and references to r8a7796 are updated.

Changes compared to v1[1]:
  - Split in per-subsystem series,
  - Add Reviewed-by, Tested-by,
  - Rename PINCTRL_PFC_R8A7796,
  - Update r8a7796 references,

I intend to queue this series in sh-pfc-for-v5.5.

Thanks for your comments!

[1] "[PATCH/RFC 00/19] arm64: dts: renesas: Initial support for R-Car M3-W+"
    https://lore.kernel.org/linux-renesas-soc/20191007102332.12196-1-geert+renesas@glider.be/

Geert Uytterhoeven (3):
  dt-bindings: pinctrl: sh-pfc: Document r8a77961 support
  pinctrl: sh-pfc: Rename PINCTRL_PFC_R8A7796 to PINCTRL_PFC_R8A77960
  pinctrl: sh-pfc: r8a7796: Add R8A77961 PFC support

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt  |  3 +-
 drivers/pinctrl/sh-pfc/Kconfig                |  8 +++--
 drivers/pinctrl/sh-pfc/Makefile               |  3 +-
 drivers/pinctrl/sh-pfc/core.c                 | 10 ++++--
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c          | 33 +++++++++++++++++--
 drivers/pinctrl/sh-pfc/sh_pfc.h               |  3 +-
 6 files changed, 50 insertions(+), 10 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
