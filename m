Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4533EB405
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 12:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239951AbhHMK3Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 06:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240111AbhHMK25 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Aug 2021 06:28:57 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D60C0617AE
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 03:28:26 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b151:f011:b544:c545])
        by laurent.telenet-ops.be with bizsmtp
        id gyUQ250051MlFFN01yUQRh; Fri, 13 Aug 2021 12:28:24 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mEUQJ-002WuJ-Vw; Fri, 13 Aug 2021 12:28:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mEUQJ-007SfU-BQ; Fri, 13 Aug 2021 12:28:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v5.15 (take two)
Date:   Fri, 13 Aug 2021 12:28:22 +0200
Message-Id: <cover.1628850411.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit 91d1be9fb7d667ae136f05cc645276eb2c9fa40e:

  pinctrl: renesas: Fix pin control matching on R-Car H3e-2G (2021-07-27 09:29:02 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v5.15-tag2

for you to fetch changes up to c4c4637eb57f2a25c445421aadeb689a2538b20b:

  pinctrl: renesas: Add RZ/G2L pin and gpio controller driver (2021-08-13 12:09:04 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v5.15 (take two)

  - Add pin control and GPIO support for the new RZ/G2L SoC.

Thanks for pulling!

----------------------------------------------------------------
Lad Prabhakar (2):
      dt-bindings: pinctrl: renesas: Add DT bindings for RZ/G2L pinctrl
      pinctrl: renesas: Add RZ/G2L pin and gpio controller driver

 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |  155 +++
 drivers/pinctrl/renesas/Kconfig                    |   11 +
 drivers/pinctrl/renesas/Makefile                   |    1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            | 1175 ++++++++++++++++++++
 include/dt-bindings/pinctrl/rzg2l-pinctrl.h        |   23 +
 5 files changed, 1365 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
 create mode 100644 drivers/pinctrl/renesas/pinctrl-rzg2l.c
 create mode 100644 include/dt-bindings/pinctrl/rzg2l-pinctrl.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
