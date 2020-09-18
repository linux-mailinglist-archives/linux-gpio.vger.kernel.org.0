Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EABA26FD7F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Sep 2020 14:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgIRMsg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Sep 2020 08:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgIRMsb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Sep 2020 08:48:31 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F31AC061756
        for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2020 05:48:31 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id VQoX230074C55Sk01QoXbm; Fri, 18 Sep 2020 14:48:31 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kJFoV-00025W-4q; Fri, 18 Sep 2020 14:48:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kJFoV-00046R-3N; Fri, 18 Sep 2020 14:48:31 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.10 (take two)
Date:   Fri, 18 Sep 2020 14:48:28 +0200
Message-Id: <20200918124828.15729-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.10-tag1

for you to fetch changes up to 540d9757cea8274a44d69cbadcff5b8c381bae8d:

  pinctrl: renesas: Reintroduce SH_PFC for common sh-pfc code (2020-09-15 10:04:35 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.10

  - Add CAN and USB1 PWEN pin groups on R-Car H2 and RZ/G1,
  - Three more conversion of DT bindings to json-schema,
  - Group all Renesas pinctrl drivers and improve visual Kconfig
    structure,
  - Rename drivers/pinctrl/sh-pfc to drivers/pinctrl/renesas,
  - Minor fixes and improvements.

This pull request supersedes and augments "[GIT PULL] pinctrl: sh-pfc:
Updates for v5.10"[*].

Thanks for pulling!

[*] https://lore.kernel.org/linux-gpio/20200904114849.30413-1-geert+renesas@glider.be/
----------------------------------------------------------------
Geert Uytterhoeven (8):
      dt-bindings: pinctrl: sh-pfc: Convert to json-schema
      pinctrl: rza1: Switch to using "output-enable"
      dt-bindings: pinctrl: renesas,rza2-pinctrl: Fix pin controller node name
      dt-bindings: pinctrl: rza1: Convert to json-schema
      dt-bindings: pinctrl: rzn1: Convert to json-schema
      pinctrl: rzn1: Do not select GENERIC_PIN{CTRL_GROUPS,MUX_FUNCTIONS}
      pinctrl: Rename sh-pfc to renesas
      pinctrl: renesas: Reintroduce SH_PFC for common sh-pfc code

Kuninori Morimoto (4):
      pinctrl: sh-pfc: Tidy up Emma Mobile EV2
      pinctrl: sh-pfc: Collect Renesas related CONFIGs in one place
      pinctrl: sh-pfc: Align driver description title
      pinctrl: sh-pfc: Tidy up driver description title

Lad Prabhakar (2):
      pinctrl: sh-pfc: r8a7790: Add USB1 PWEN pin and group
      pinctrl: sh-pfc: r8a7790: Add CAN pins, groups and functions

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       | 188 ----------------
 .../devicetree/bindings/pinctrl/renesas,pfc.yaml   | 193 +++++++++++++++++
 .../bindings/pinctrl/renesas,rza1-pinctrl.txt      | 223 -------------------
 .../bindings/pinctrl/renesas,rza1-ports.yaml       | 190 ++++++++++++++++
 .../bindings/pinctrl/renesas,rza2-pinctrl.yaml     |   2 +-
 .../bindings/pinctrl/renesas,rzn1-pinctrl.txt      | 153 -------------
 .../bindings/pinctrl/renesas,rzn1-pinctrl.yaml     | 129 +++++++++++
 MAINTAINERS                                        |   5 +-
 drivers/pinctrl/Kconfig                            |  34 +--
 drivers/pinctrl/Makefile                           |   5 +-
 drivers/pinctrl/{sh-pfc => renesas}/Kconfig        | 238 +++++++++++++--------
 drivers/pinctrl/{sh-pfc => renesas}/Makefile       |   8 +-
 drivers/pinctrl/{sh-pfc => renesas}/core.c         |   0
 drivers/pinctrl/{sh-pfc => renesas}/core.h         |   0
 drivers/pinctrl/{sh-pfc => renesas}/gpio.c         |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-emev2.c    |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a73a4.c  |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7740.c  |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77470.c |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7778.c  |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7779.c  |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7790.c  | 121 ++++++++++-
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7791.c  |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7792.c  |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7794.c  |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77950.c |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77951.c |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7796.c  |   2 +-
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77965.c |   2 +-
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77970.c |   2 +-
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77980.c |   2 +-
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77990.c |   2 +-
 drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77995.c |   2 +-
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7203.c   |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7264.c   |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7269.c   |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh73a0.c   |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7720.c   |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7722.c   |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7723.c   |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7724.c   |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7734.c   |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7757.c   |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7785.c   |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7786.c   |   0
 drivers/pinctrl/{sh-pfc => renesas}/pfc-shx3.c     |   0
 drivers/pinctrl/{ => renesas}/pinctrl-rza1.c       |  11 +-
 drivers/pinctrl/{ => renesas}/pinctrl-rza2.c       |   4 +-
 drivers/pinctrl/{ => renesas}/pinctrl-rzn1.c       |   6 +-
 drivers/pinctrl/{sh-pfc => renesas}/pinctrl.c      |   0
 drivers/pinctrl/{sh-pfc => renesas}/sh_pfc.h       |   0
 51 files changed, 811 insertions(+), 711 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.yaml
 rename drivers/pinctrl/{sh-pfc => renesas}/Kconfig (51%)
 rename drivers/pinctrl/{sh-pfc => renesas}/Makefile (92%)
 rename drivers/pinctrl/{sh-pfc => renesas}/core.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/core.h (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/gpio.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-emev2.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a73a4.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7740.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77470.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7778.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7779.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7790.c (98%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7791.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7792.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7794.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77950.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77951.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a7796.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77965.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77970.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77980.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77990.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-r8a77995.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7203.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7264.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7269.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh73a0.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7720.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7722.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7723.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7724.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7734.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7757.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7785.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-sh7786.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pfc-shx3.c (100%)
 rename drivers/pinctrl/{ => renesas}/pinctrl-rza1.c (99%)
 rename drivers/pinctrl/{ => renesas}/pinctrl-rza2.c (99%)
 rename drivers/pinctrl/{ => renesas}/pinctrl-rzn1.c (99%)
 rename drivers/pinctrl/{sh-pfc => renesas}/pinctrl.c (100%)
 rename drivers/pinctrl/{sh-pfc => renesas}/sh_pfc.h (100%)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
