Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE0A467778
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Dec 2021 13:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234333AbhLCMhL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Dec 2021 07:37:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232206AbhLCMhK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Dec 2021 07:37:10 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90058C06174A
        for <linux-gpio@vger.kernel.org>; Fri,  3 Dec 2021 04:33:46 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:3191:9890:620a:6f4])
        by xavier.telenet-ops.be with bizsmtp
        id RoZk2600B3eLghq01oZkLw; Fri, 03 Dec 2021 13:33:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mt7l1-002KeD-53; Fri, 03 Dec 2021 13:33:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mt7l0-000ig1-OM; Fri, 03 Dec 2021 13:33:42 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v5.17
Date:   Fri,  3 Dec 2021 13:33:40 +0100
Message-Id: <cover.1638534672.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.17-tag1

for you to fetch changes up to 7c50a407b8687ae3589c740d2347d9ae73887889:

  pinctrl: renesas: Remove unneeded locking around sh_pfc_read() calls (2021-11-19 10:55:21 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.17

  - Add generic support for output impedance,
  - Add drive strength and output impedance support for the RZ/G2L SoC,
  - Miscellaneous fixes and improvements.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (2):
      pinctrl: renesas: rza1: Fix kerneldoc function names
      pinctrl: renesas: Remove unneeded locking around sh_pfc_read() calls

Lad Prabhakar (8):
      dt-bindings: pincfg-node: Add "output-impedance-ohms" property
      pinctrl: pinconf-generic: Add support for "output-impedance-ohms" to be extracted from DT files
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add output-impedance-ohms property
      pinctrl: renesas: rzg2l: Rename RZG2L_SINGLE_PIN_GET_PORT macro
      pinctrl: renesas: rzg2l: Add helper functions to read/write pin config
      pinctrl: renesas: rzg2l: Add support to get/set pin config for GPIO port pins
      pinctrl: renesas: rzg2l: Rename PIN_CFG_* macros to match HW manual
      pinctrl: renesas: rzg2l: Add support to get/set drive-strength and output-impedance-ohms

 .../devicetree/bindings/pinctrl/pincfg-node.yaml   |   3 +
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |   2 +
 drivers/pinctrl/pinconf-generic.c                  |   2 +
 drivers/pinctrl/renesas/pinctrl-rza1.c             |   6 +-
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            | 310 ++++++++++++++-------
 drivers/pinctrl/renesas/pinctrl.c                  |   9 +-
 include/linux/pinctrl/pinconf-generic.h            |   3 +
 7 files changed, 224 insertions(+), 111 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
