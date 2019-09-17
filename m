Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7D55B4E1B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2019 14:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbfIQMmf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Sep 2019 08:42:35 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:54339 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727308AbfIQMme (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 17 Sep 2019 08:42:34 -0400
X-IronPort-AV: E=Sophos;i="5.64,516,1559487600"; 
   d="scan'208";a="26574450"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Sep 2019 21:42:31 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9B7014235016;
        Tue, 17 Sep 2019 21:42:28 +0900 (JST)
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
Subject: [PATCH 0/8] Add RZ/G2N SYSC/RST/Clock/PFC support
Date:   Tue, 17 Sep 2019 13:35:28 +0100
Message-Id: <1568723736-14714-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch series add SYSC/RST/Clock/PFC driver support for RZ/G2N SoC.

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
 drivers/clk/renesas/r8a774b1-cpg-mssr.c            | 330 ++++++++
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
 20 files changed, 862 insertions(+), 413 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a774b1-cpg-mssr.c
 create mode 100644 drivers/soc/renesas/r8a774b1-sysc.c

-- 
2.7.4

