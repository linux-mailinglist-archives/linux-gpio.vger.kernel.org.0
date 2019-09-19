Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D83F7B74DE
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2019 10:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730705AbfISIR1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Sep 2019 04:17:27 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:61768 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727273AbfISIR0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 19 Sep 2019 04:17:26 -0400
X-IronPort-AV: E=Sophos;i="5.64,522,1559487600"; 
   d="scan'208";a="26760282"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Sep 2019 17:17:24 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0B0B741F812D;
        Thu, 19 Sep 2019 17:17:20 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/8] Add RZ/G2N SYSC/RST/Clock/PFC support
Date:   Thu, 19 Sep 2019 09:17:08 +0100
Message-Id: <1568881036-4404-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series add SYSC/RST/Clock/PFC driver support for RZ/G2N SoC.

V1-->V2
 * Fixed "r8a774b1_cpg_mssr_init" function
 * cosmetic changes to align RZ/G2N clock driver with other R-Car Gen3/RZ-G2 clock drivers.

Biju Das (8):
  dt-bindings: power: rcar-sysc: Document r8a774b1 sysc
  soc: renesas: rcar-sysc: Add r8a774b1 support
  dt-bindings: reset: rcar-rst: Document r8a774b1 reset module
  soc: renesas: rcar-rst: Add support for RZ/G2N
  dt-bindings: clock: renesas: cpg-mssr: Document r8a774b1 binding
  clk: renesas: cpg-mssr: Add r8a774b1 support
  dt-bindings: pinctrl: sh-pfc: Document r8a774b1 PFC support
  pinctrl: sh-pfc: r8a77965: Add R8A774B1 PFC support

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |  10 +-
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   1 +
 .../bindings/power/renesas,rcar-sysc.txt           |   1 +
 .../devicetree/bindings/reset/renesas,rst.txt      |   1 +
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a774b1-cpg-mssr.c            | 322 ++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 drivers/pinctrl/sh-pfc/Kconfig                     |   4 +
 drivers/pinctrl/sh-pfc/Makefile                    |   1 +
 drivers/pinctrl/sh-pfc/core.c                      |   6 +
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c              | 861 +++++++++++----------
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |   1 +
 drivers/soc/renesas/Kconfig                        |   5 +
 drivers/soc/renesas/Makefile                       |   1 +
 drivers/soc/renesas/r8a774b1-sysc.c                |  35 +
 drivers/soc/renesas/rcar-rst.c                     |   1 +
 drivers/soc/renesas/rcar-sysc.c                    |   3 +
 drivers/soc/renesas/rcar-sysc.h                    |   1 +
 20 files changed, 854 insertions(+), 413 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a774b1-cpg-mssr.c
 create mode 100644 drivers/soc/renesas/r8a774b1-sysc.c

-- 
2.7.4

