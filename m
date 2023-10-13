Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFB77C8615
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Oct 2023 14:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbjJMMsh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Oct 2023 08:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbjJMMsh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Oct 2023 08:48:37 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9003DA
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 05:48:34 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
        by xavier.telenet-ops.be with bizsmtp
        id xQoZ2A00L56FAx301QoZRz; Fri, 13 Oct 2023 14:48:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qrHaf-006Gh5-PA;
        Fri, 13 Oct 2023 14:48:33 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qrHaj-002Jup-5v;
        Fri, 13 Oct 2023 14:48:33 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.7 (take two)
Date:   Fri, 13 Oct 2023 14:48:32 +0200
Message-Id: <cover.1697200929.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

The following changes since commit c385256611b1af79d180e35c07992b43e1be5067:

  pinctrl: renesas: rzg2l: Rename rzg2l_gpio_configs[] (2023-09-26 09:44:51 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.7-tag2

for you to fetch changes up to 583d8073205566468abf3a34000fccdd1d19c9cc:

  pinctrl: renesas: rzn1: Convert to platform remove callback returning void (2023-10-13 09:38:05 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.7 (take two)

  - Add pin groups for the Local Bus State Controller (LBSC) on R-Car
    M1A,
  - Add support for the RZ/G3S (R9A08G045) SoC,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (7):
      pinctrl: renesas: rzg2l: Index all registers based on port offset
      pinctrl: renesas: rzg2l: Adapt for different SD/PWPR register offsets
      pinctrl: renesas: rzg2l: Adapt function number for RZ/G3S
      pinctrl: renesas: rzg2l: Move DS and OI to SoC-specific configuration
      pinctrl: renesas: rzg2l: Add support for different DS values on different groups
      dt-bindings: pinctrl: renesas: Document RZ/G3S SoC
      pinctrl: renesas: rzg2l: Add RZ/G3S support

Geert Uytterhoeven (1):
      pinctrl: renesas: r8a7778: Add LBSC pins, groups, and functions

Lad Prabhakar (1):
      pinctrl: renesas: rzg2l: Add validation of GPIO pin in rzg2l_gpio_request()

Uwe Kleine-König (1):
      pinctrl: renesas: rzn1: Convert to platform remove callback returning void

 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |  20 +
 drivers/pinctrl/renesas/pfc-r8a7778.c              |  38 ++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c            | 700 ++++++++++++++++-----
 drivers/pinctrl/renesas/pinctrl-rzn1.c             |   6 +-
 4 files changed, 613 insertions(+), 151 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
