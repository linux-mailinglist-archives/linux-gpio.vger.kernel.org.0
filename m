Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8223C2F75F4
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 10:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730285AbhAOJyB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 04:54:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbhAOJyA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 04:54:00 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C182C0613D3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Jan 2021 01:53:21 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id GxtK2400Q4C55Sk01xtKPt; Fri, 15 Jan 2021 10:53:19 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l0LnD-003j2D-4Q; Fri, 15 Jan 2021 10:53:19 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l0LnC-009nN7-K5; Fri, 15 Jan 2021 10:53:18 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: sh-pfc: Updates for v5.12
Date:   Fri, 15 Jan 2021 10:53:13 +0100
Message-Id: <20210115095313.2334693-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.12-tag1

for you to fetch changes up to a5cda861ed57710837bc560a3c715160da710555:

  pinctrl: renesas: r8a779a0: Add TPU pins, groups and functions (2021-01-14 12:06:16 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.12

  - Restrict debug runtime-checks to Renesas platforms,
  - Initial support for the R-Car V3U SoC.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (1):
      pinctrl: renesas: checker: Restrict checks to Renesas platforms

Ulrich Hecht (18):
      dt-bindings: pinctrl: renesas,pfc: Document r8a779a0 PFC support
      pinctrl: renesas: Implement unlock register masks
      pinctrl: renesas: Add I/O voltage level flag
      pinctrl: renesas: Add PORT_GP_CFG_{2,31} macros
      pinctrl: renesas: Initial R8A779A0 (V3U) PFC support
      pinctrl: renesas: r8a779a0: Add SCIF pins, groups and functions
      pinctrl: renesas: r8a779a0: Add I2C pins, groups and functions
      pinctrl: renesas: r8a779a0: Add EtherAVB pins, groups and functions
      pinctrl: renesas: r8a779a0: Add CANFD pins, groups and functions
      pinctrl: renesas: r8a779a0: Add DU pins, groups and function
      pinctrl: renesas: r8a779a0: Add HSCIF pins, groups and functions
      pinctrl: renesas: r8a779a0: Add INTC-EX pins, groups and function
      pinctrl: renesas: r8a779a0: Add MMC pins, groups and functions
      pinctrl: renesas: r8a779a0: Add MSIOF pins, groups and functions
      pinctrl: renesas: r8a779a0: Add PWM pins, groups and functions
      pinctrl: renesas: r8a779a0: Add QSPI pins, groups, and functions
      pinctrl: renesas: r8a779a0: Add TMU pins, groups and functions
      pinctrl: renesas: r8a779a0: Add TPU pins, groups and functions

 .../devicetree/bindings/pinctrl/renesas,pfc.yaml   |    3 +-
 drivers/pinctrl/renesas/Kconfig                    |    5 +
 drivers/pinctrl/renesas/Makefile                   |    1 +
 drivers/pinctrl/renesas/core.c                     |   38 +-
 drivers/pinctrl/renesas/pfc-r8a779a0.c             | 4460 ++++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl.c                  |   16 +-
 drivers/pinctrl/renesas/sh_pfc.h                   |   28 +-
 7 files changed, 4533 insertions(+), 18 deletions(-)
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779a0.c
