Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 301CB17AD9
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2019 15:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727224AbfEHNkS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 May 2019 09:40:18 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:60620 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727628AbfEHNkR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 May 2019 09:40:17 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id 9pgE2000j3XaVaC01pgE2g; Wed, 08 May 2019 15:40:15 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hOMnu-0005Ve-Da; Wed, 08 May 2019 15:40:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hOMnu-0004B1-Bp; Wed, 08 May 2019 15:40:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Cao Van Dong <cv-dong@jinso.co.jp>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/4] sh-pfc: r8a7795/6/65: Add TPU pins, groups and functions
Date:   Wed,  8 May 2019 15:40:08 +0200
Message-Id: <20190508134012.16002-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

This patch series adds pins, groups and functions for the 16-Bit Timer
Pulse Unit (TPU) outputs on the R-Car H3/M3-W/M3-N and RZ/G2M SoCs.

This has been tested on the Salvator-XS development board with R-Car
M3-N.  As the TPU parts of the R-Car H3/M3-W and RZ/G2M SoCs are very
similar, I expect this to work on those SoCs, too.

Changes compared to v1:
  - Update .common[] array sizes in pfc-r8a7796.c.

I intend to queue this in sh-pfc-for-v5.3.

Test procedure:
  - Apply Cao Van Dong's series "[PATCH v2 0/5] Add TPU support for R-Car
    H3/M3-W/M3-N"
    (https://lore.kernel.org/linux-renesas-soc/1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp/),
  - Make sure switches SW31-[1-4] are switched off,
  - Enable TPU and pin control in DTS:

	--- a/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
	+++ b/arch/arm64/boot/dts/renesas/salvator-xs.dtsi
	@@ -27,3 +27,18 @@
			clock-names = "xin";
		};
	 };
	+
	+&tpu {
	+       // SW31-[1-4] OFF
	+       pinctrl-0 = <&tpu_pins>;
	+       pinctrl-names = "default";
	+
	+       status = "okay";
	+};
	+
	+&pfc {
	+       tpu_pins: tpu {
	+               groups = "tpu_to2", "tpu_to3";
	+               function = "tpu";
	+       };
	+};

  - Exercise userspace PWM control for pwm[23] of
    /sys/class/pwm/pwmchip1/,
  - Inspect PWM signals on the input side of SW31-[12] using an
    oscilloscope,
  - Disable TPU and pin control in DTS, and restore SW31 switch
    settings.

Thanks!

Geert Uytterhoeven (4):
  pinctrl: sh-pfc: r8a7795-es1: Add TPU pins, groups and functions
  pinctrl: sh-pfc: r8a7795: Add TPU pins, groups and functions
  pinctrl: sh-pfc: r8a7796: Add TPU pins, groups and functions
  pinctrl: sh-pfc: r8a77965: Add TPU pins, groups and functions

 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 42 ++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 42 ++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 46 ++++++++++++++++++++++--
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    | 42 ++++++++++++++++++++++
 4 files changed, 170 insertions(+), 2 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
