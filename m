Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7864E4FFC96
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Apr 2022 19:24:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237287AbiDMR1E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Apr 2022 13:27:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237282AbiDMR0n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 13:26:43 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31B3E04
        for <linux-gpio@vger.kernel.org>; Wed, 13 Apr 2022 10:24:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9b8:20d3:ee2b:1cda])
        by baptiste.telenet-ops.be with bizsmtp
        id JHQE2700Q2t8Arn01HQEWt; Wed, 13 Apr 2022 19:24:15 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negj0-000Tq4-B3; Wed, 13 Apr 2022 19:24:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1negiz-00DfRd-UL; Wed, 13 Apr 2022 19:24:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/50] pinctrl: renesas: Reserved field optimizations
Date:   Wed, 13 Apr 2022 19:23:22 +0200
Message-Id: <cover.1649865241.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi Linus,

Lots of register in pin control subdrivers for Renesas SoCs contain
reserved or unused fields.  As the macros for describing these registers
(PINMUX_CFG_REG() and PINMUX_CFG_REG_VAR() for registers with
fixed-width resp. variable-width fields) require describing all fields,
the resulting data structures contain lots of dummy (zero) values: 2^N
values for a field of N-bits wide.  To reduce data size, reserved bit
fields wider than 3 bits were typically split in multiple 2-bit fields.
This patch series aims to improve this by introducing a shorthand for
describing reserved variable-width register fields without dummy values.

  - Patch 1 converts a few register definitions for registers with
    fixed-width fields that accidentally used the equivalent but larger
    description format intended for registers with variable-width
    fields,
  - Patch 2 introduces a shorthand for describing reserved register
    fields,
  - Patches 3-22 convert reserved field descriptions in the various
    SoC-specific pin control subdrivers to the new shorthands,
  - Patches 23-49 convert register definitions for registers with
    reserved fixed-width fields to the equivalent definitions with
    variable-width fields where it makes sense,
  - Patch 50 updates the checker to flag possible conversions to
    variable-width reserved fields.

The total kernel size reduction due to patches 3-49 is:
  - 12685 bytes on ARM32 SoCs (multi-platform),
  - 5416 bytes on ARM64 SoCs (multi-platform),
  - 2575 bytes on SH SoCs (sum of mutually-exclusive single platforms).

I've been running with these changes on R-Mobile APE6 and A1, R-Car
M2-W, H3 ES1.x, H3 ES2.0, M3-W, M3-N, V3M, E3, D3, V3U, and S4, and
SH-Mobile AG5 during the past six weeks, without any issues.

I plan to queue these in renesas-pinctrl-for-v5.19.

Thanks for your comments!

Geert Uytterhoeven (50):
  pinctrl: renesas: r8a77470: Use fixed-width description for IPSR regs
  pinctrl: renesas: Add shorthand for reserved register fields
  pinctrl: renesas: rmobile: Mark unused PORTCR bits reserved
  pinctrl: renesas: emev2: Use shorthands for reserved fields
  pinctrl: renesas: r8a77470: Use shorthands for reserved fields
  pinctrl: renesas: r8a7778: Use shorthands for reserved fields
  pinctrl: renesas: r8a7779: Use shorthands for reserved fields
  pinctrl: renesas: r8a7790: Use shorthands for reserved fields
  pinctrl: renesas: r8a7791: Use shorthands for reserved fields
  pinctrl: renesas: r8a7792: Use shorthands for reserved fields
  pinctrl: renesas: r8a7794: Use shorthands for reserved fields
  pinctrl: renesas: r8a77950: Use shorthands for reserved fields
  pinctrl: renesas: r8a77951: Use shorthands for reserved fields
  pinctrl: renesas: r8a7796: Use shorthands for reserved fields
  pinctrl: renesas: r8a77965: Use shorthands for reserved fields
  pinctrl: renesas: r8a77970: Use shorthands for reserved fields
  pinctrl: renesas: r8a77980: Use shorthands for reserved fields
  pinctrl: renesas: r8a77990: Use shorthands for reserved fields
  pinctrl: renesas: r8a77995: Use shorthands for reserved fields
  pinctrl: renesas: r8a779a0: Use shorthands for reserved fields
  pinctrl: renesas: r8a779f0: Use shorthands for reserved fields
  pinctrl: renesas: sh7734: Use shorthands for reserved fields
  pinctrl: renesas: r8a73a4: Optimize fixed-width reserved fields
  pinctrl: renesas: r8a7740: Optimize fixed-width reserved fields
  pinctrl: renesas: r8a77470: Optimize fixed-width reserved fields
  pinctrl: renesas: r8a7779: Optimize fixed-width reserved fields
  pinctrl: renesas: r8a7792: Optimize fixed-width reserved fields
  pinctrl: renesas: r8a77950: Optimize fixed-width reserved fields
  pinctrl: renesas: r8a77951: Optimize fixed-width reserved fields
  pinctrl: renesas: r8a77965: Optimize fixed-width reserved fields
  pinctrl: renesas: r8a7796: Optimize fixed-width reserved fields
  pinctrl: renesas: r8a77970: Optimize fixed-width reserved fields
  pinctrl: renesas: r8a77980: Optimize fixed-width reserved fields
  pinctrl: renesas: r8a77990: Optimize fixed-width reserved fields
  pinctrl: renesas: r8a77995: Optimize fixed-width reserved fields
  pinctrl: renesas: r8a779a0: Optimize fixed-width reserved fields
  pinctrl: renesas: r8a779f0: Optimize fixed-width reserved fields
  pinctrl: renesas: sh7203: Optimize fixed-width reserved fields
  pinctrl: renesas: sh7264: Optimize fixed-width reserved fields
  pinctrl: renesas: sh7269: Optimize fixed-width reserved fields
  pinctrl: renesas: sh73a0: Optimize fixed-width reserved fields
  pinctrl: renesas: sh7720: Optimize fixed-width reserved fields
  pinctrl: renesas: sh7722: Optimize fixed-width reserved fields
  pinctrl: renesas: sh7723: Optimize fixed-width reserved fields
  pinctrl: renesas: sh7724: Optimize fixed-width reserved fields
  pinctrl: renesas: sh7734: Optimize fixed-width reserved fields
  pinctrl: renesas: sh7757: Optimize fixed-width reserved fields
  pinctrl: renesas: sh7785: Optimize fixed-width reserved fields
  pinctrl: renesas: sh7786: Optimize fixed-width reserved fields
  pinctrl: renesas: checker: Add reserved field checks

 drivers/pinctrl/renesas/core.c         |  43 +++--
 drivers/pinctrl/renesas/pfc-emev2.c    |  59 ++-----
 drivers/pinctrl/renesas/pfc-r8a73a4.c  |  58 ++-----
 drivers/pinctrl/renesas/pfc-r8a7740.c  |  74 ++++----
 drivers/pinctrl/renesas/pfc-r8a77470.c | 176 +++++--------------
 drivers/pinctrl/renesas/pfc-r8a7778.c  |  98 +++--------
 drivers/pinctrl/renesas/pfc-r8a7779.c  |  82 +++------
 drivers/pinctrl/renesas/pfc-r8a7790.c  | 110 ++++--------
 drivers/pinctrl/renesas/pfc-r8a7791.c  | 111 ++++--------
 drivers/pinctrl/renesas/pfc-r8a7792.c  | 231 ++++++-------------------
 drivers/pinctrl/renesas/pfc-r8a7794.c  |  97 +++--------
 drivers/pinctrl/renesas/pfc-r8a77950.c | 170 ++++--------------
 drivers/pinctrl/renesas/pfc-r8a77951.c | 169 +++++-------------
 drivers/pinctrl/renesas/pfc-r8a7796.c  | 166 +++++-------------
 drivers/pinctrl/renesas/pfc-r8a77965.c | 166 +++++-------------
 drivers/pinctrl/renesas/pfc-r8a77970.c | 136 ++++-----------
 drivers/pinctrl/renesas/pfc-r8a77980.c | 107 ++++--------
 drivers/pinctrl/renesas/pfc-r8a77990.c | 132 ++++----------
 drivers/pinctrl/renesas/pfc-r8a77995.c | 131 +++-----------
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 217 ++++++++---------------
 drivers/pinctrl/renesas/pfc-r8a779f0.c | 100 ++++-------
 drivers/pinctrl/renesas/pfc-sh7203.c   |  53 +++---
 drivers/pinctrl/renesas/pfc-sh7264.c   | 104 +++++------
 drivers/pinctrl/renesas/pfc-sh7269.c   |  82 ++++-----
 drivers/pinctrl/renesas/pfc-sh73a0.c   |  87 ++++------
 drivers/pinctrl/renesas/pfc-sh7720.c   |  57 +++---
 drivers/pinctrl/renesas/pfc-sh7722.c   | 202 +++++++++------------
 drivers/pinctrl/renesas/pfc-sh7723.c   |  70 ++++----
 drivers/pinctrl/renesas/pfc-sh7724.c   |   7 +-
 drivers/pinctrl/renesas/pfc-sh7734.c   | 115 ++++--------
 drivers/pinctrl/renesas/pfc-sh7757.c   |  95 ++++------
 drivers/pinctrl/renesas/pfc-sh7785.c   |  60 +++----
 drivers/pinctrl/renesas/pfc-sh7786.c   |  21 +--
 drivers/pinctrl/renesas/sh_pfc.h       |  17 +-
 34 files changed, 1116 insertions(+), 2487 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
