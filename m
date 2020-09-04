Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B04225D7EB
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Sep 2020 13:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728588AbgIDLyE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Sep 2020 07:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729741AbgIDLyA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Sep 2020 07:54:00 -0400
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 04 Sep 2020 04:53:59 PDT
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9BBBC061244
        for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2020 04:53:59 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id Pnot2300y4C55Sk01notpp; Fri, 04 Sep 2020 13:48:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kEAD7-0004ex-Me; Fri, 04 Sep 2020 13:48:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kEAD7-0007vK-Lb; Fri, 04 Sep 2020 13:48:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.10
Date:   Fri,  4 Sep 2020 13:48:49 +0200
Message-Id: <20200904114849.30413-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.10-tag1

for you to fetch changes up to b9d7f1448846a98d49a5567536febbef297b20b2:

  pinctrl: rza1: Switch to using "output-enable" (2020-09-04 09:45:32 +0200)

----------------------------------------------------------------
pinctrl: sh-pfc: Updates for v5.10

  - Add CAN and USB1 PWEN pin groups on R-Car H2 and RZ/G1,
  - One more conversion of DT bindings to json-schema,
  - Group all Renesas pinctrl drivers and mprove visual Kconfig
    structure,
  - Minor fixes and improvements.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (2):
      dt-bindings: pinctrl: sh-pfc: Convert to json-schema
      pinctrl: rza1: Switch to using "output-enable"

Kuninori Morimoto (4):
      pinctrl: sh-pfc: Tidy up Emma Mobile EV2
      pinctrl: sh-pfc: Collect Renesas related CONFIGs in one place
      pinctrl: sh-pfc: Align driver description title
      pinctrl: sh-pfc: Tidy up driver description title

Lad Prabhakar (2):
      pinctrl: sh-pfc: r8a7790: Add USB1 PWEN pin and group
      pinctrl: sh-pfc: r8a7790: Add CAN pins, groups and functions

 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       | 188 --------------------
 .../devicetree/bindings/pinctrl/renesas,pfc.yaml   | 193 +++++++++++++++++++++
 .../bindings/pinctrl/renesas,rza1-pinctrl.txt      |   5 +-
 MAINTAINERS                                        |   1 -
 drivers/pinctrl/Kconfig                            |  32 ----
 drivers/pinctrl/Makefile                           |   3 -
 drivers/pinctrl/sh-pfc/Kconfig                     | 178 +++++++++++--------
 drivers/pinctrl/sh-pfc/Makefile                    |   4 +
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c               | 121 ++++++++++++-
 drivers/pinctrl/{ => sh-pfc}/pinctrl-rza1.c        |  11 +-
 drivers/pinctrl/{ => sh-pfc}/pinctrl-rza2.c        |   4 +-
 drivers/pinctrl/{ => sh-pfc}/pinctrl-rzn1.c        |   6 +-
 12 files changed, 436 insertions(+), 310 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
 rename drivers/pinctrl/{ => sh-pfc}/pinctrl-rza1.c (99%)
 rename drivers/pinctrl/{ => sh-pfc}/pinctrl-rza2.c (99%)
 rename drivers/pinctrl/{ => sh-pfc}/pinctrl-rzn1.c (99%)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
