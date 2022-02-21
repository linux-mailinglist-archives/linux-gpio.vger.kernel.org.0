Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7D164BE74D
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Feb 2022 19:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359191AbiBUPpF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Feb 2022 10:45:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379438AbiBUPoz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Feb 2022 10:44:55 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEABE22B28
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 07:43:53 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:49dc:a1b5:3fe0:3d2b])
        by laurent.telenet-ops.be with bizsmtp
        id xrjr2600P3YJRAw01rjrfY; Mon, 21 Feb 2022 16:43:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAqt-001TTn-7I; Mon, 21 Feb 2022 16:43:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMAqs-006EhO-9q; Mon, 21 Feb 2022 16:43:50 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 00/12] pinctrl: renesas: Add R-Car S4-8 support
Date:   Mon, 21 Feb 2022 16:43:35 +0100
Message-Id: <cover.1645457792.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

	Hi all,

This patch series adds pin control support for the Renesas R-Car S4-8
Soc.  It is based on patches in the BSP by LUU HOAI, with many changes
on top (see the individual patches).

Changes compared to v1[1]:
  - Add Reviewed-by,
  - Fix whitespace in Makefile,
  - Remove GPIO and No-GPIO pins, pin function definitions, and
    registers that can only be accessed from the Control Domain,
  - Spin off clock and DTS patches into separate series,
  - Drop RFC state and widen audience.

Serial console and I2C have been tested on the Renesas Spider
development board.

Thanks for your comments!

[1] "[PATCH/RFC 00/15] arm64: renesas: Add-R-Car S4-8 Pin control support"
    https://lore.kernel.org/r/cover.1642599415.git.geert+renesas@glider.be

Geert Uytterhoeven (11):
  pinctrl: renesas: Add PORT_GP_CFG_19 macros
  pinctrl: renesas: Initial R8A779F0 PFC support
  pinctrl: renesas: r8a779f0: Add SCIF pins, groups, and functions
  pinctrl: renesas: r8a779f0: Add I2C pins, groups, and functions
  pinctrl: renesas: r8a779f0: Add HSCIF pins, groups, and functions
  pinctrl: renesas: r8a779f0: Add INTC-EX pins, groups, and function
  pinctrl: renesas: r8a779f0: Add MMC pins, groups, and function
  pinctrl: renesas: r8a779f0: Add MSIOF pins, groups, and functions
  pinctrl: renesas: r8a779f0: Add PCIe pins, groups, and function
  pinctrl: renesas: r8a779f0: Add QSPI pins, groups, and functions
  pinctrl: renesas: r8a779f0: Add Ethernet pins, groups, and functions

LUU HOAI (1):
  dt-bindings: pinctrl: renesas,pfc: Document r8a779f0 support

 .../bindings/pinctrl/renesas,pfc.yaml         |    1 +
 drivers/pinctrl/renesas/Kconfig               |    5 +
 drivers/pinctrl/renesas/Makefile              |    1 +
 drivers/pinctrl/renesas/core.c                |    6 +
 drivers/pinctrl/renesas/pfc-r8a779f0.c        | 2126 +++++++++++++++++
 drivers/pinctrl/renesas/sh_pfc.h              |    9 +-
 6 files changed, 2146 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/renesas/pfc-r8a779f0.c

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
