Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5D5217369
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 18:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgGGQNQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 12:13:16 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:30692 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727789AbgGGQNQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2020 12:13:16 -0400
X-IronPort-AV: E=Sophos;i="5.75,324,1589209200"; 
   d="scan'208";a="51539948"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jul 2020 01:13:14 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 00C6640062C8;
        Wed,  8 Jul 2020 01:13:11 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 00/14] Add core support for Renesas RZ/G2H SoC
Date:   Tue,  7 Jul 2020 17:12:34 +0100
Message-Id: <1594138368-16449-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

This patch series adds initial core support for Renesas RZ/G2H
(R8A774E1) SoC, enabling the CPG, RST and PFC support.

Cheers,
Prabhakar

Lad Prabhakar (1):
  pinctrl: sh-pfc: pfc-r8a77951: Add R8A774E1 PFC support

Marian-Cristian Rotariu (13):
  dt-bindings: arm: renesas: Document RZ/G2H SoC DT bindings
  dt-bindings: arm: renesas: Add HopeRun RZ/G2H boards
  soc: renesas: Identify RZ/G2H
  soc: renesas: Add Renesas R8A774E1 config option
  dt-bindings: power: renesas,rcar-sysc: Document r8a774e1 SYSC binding
  dt-bindings: power: Add r8a774e1 SYSC power domain definitions
  soc: renesas: rcar-sysc: Add r8a774e1 support
  dt-bindings: reset: renesas,rst: Document r8a774e1 reset module
  soc: renesas: rcar-rst: Add support for RZ/G2H
  dt-bindings: clock: renesas,cpg-mssr: Document r8a774e1
  clk: renesas: Add r8a774e1 CPG Core Clock Definitions
  clk: renesas: cpg-mssr: Add r8a774e1 support
  dt-bindings: pinctrl: renesas,pfc-pinctrl: Document r8a774e1 PFC
    support

 .../devicetree/bindings/arm/renesas.yaml      |  12 +
 .../bindings/clock/renesas,cpg-mssr.yaml      |   1 +
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt  |   1 +
 .../bindings/power/renesas,rcar-sysc.yaml     |   1 +
 .../bindings/reset/renesas,rst.yaml           |   1 +
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r8a774e1-cpg-mssr.c       | 348 +++++++
 drivers/clk/renesas/renesas-cpg-mssr.c        |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h        |   1 +
 drivers/pinctrl/sh-pfc/Kconfig                |   4 +
 drivers/pinctrl/sh-pfc/Makefile               |   1 +
 drivers/pinctrl/sh-pfc/core.c                 |   6 +
 drivers/pinctrl/sh-pfc/pfc-r8a77951.c         | 877 +++++++++---------
 drivers/pinctrl/sh-pfc/sh_pfc.h               |   1 +
 drivers/soc/renesas/Kconfig                   |  11 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/r8a774e1-sysc.c           |  43 +
 drivers/soc/renesas/rcar-rst.c                |   1 +
 drivers/soc/renesas/rcar-sysc.c               |   3 +
 drivers/soc/renesas/rcar-sysc.h               |   1 +
 drivers/soc/renesas/renesas-soc.c             |   8 +
 include/dt-bindings/clock/r8a774e1-cpg-mssr.h |  59 ++
 include/dt-bindings/power/r8a774e1-sysc.h     |  36 +
 24 files changed, 1014 insertions(+), 415 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a774e1-cpg-mssr.c
 create mode 100644 drivers/soc/renesas/r8a774e1-sysc.c
 create mode 100644 include/dt-bindings/clock/r8a774e1-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a774e1-sysc.h

-- 
2.17.1

