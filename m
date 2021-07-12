Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5CB3C63DA
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jul 2021 21:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235784AbhGLTrY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jul 2021 15:47:24 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:61964 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230199AbhGLTrX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 12 Jul 2021 15:47:23 -0400
X-IronPort-AV: E=Sophos;i="5.84,234,1620658800"; 
   d="scan'208";a="87354838"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jul 2021 04:44:33 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5FE5840E011B;
        Tue, 13 Jul 2021 04:44:30 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] pin and gpio controller driver for Renesas RZ/G2L
Date:   Mon, 12 Jul 2021 20:44:17 +0100
Message-Id: <20210712194422.12405-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

This patch series adds pin and gpio controller driver for Renesas RZ/G2L
SoC. RZ/G2L has a simple pin and GPIO controller combined similar to RZ/A2.

This patch series applies on top of https://git.kernel.org/pub/scm/linux/
kernel/git/geert/renesas-drivers.git/log/?h=topic/rzg2l-update-clock-defs-v4

Cheers,
Prabhakar

Changes for v2:
* Added support for per pin pinmux support
* Added support for pins to set configs
* Dropped pfc-r9a07g044.c/h
* Fixed review comments pointed by Geert
* Included clock/reset changes
* Included DTS/I changes

Lad Prabhakar (5):
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add DT bindings for
    RZ/G2L pinctrl
  pinctrl: renesas: Add RZ/G2L pin and gpio controller driver
  drivers: clk: renesas: r9a07g044-cpg: Add GPIO clock and reset entries
  arm64: dts: renesas: r9a07g044: Add pinctrl node
  arm64: dts: renesas: rzg2l-smarc: Add scif0 pins

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  155 +++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |   13 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |   10 +
 drivers/clk/renesas/r9a07g044-cpg.c           |    5 +
 drivers/pinctrl/renesas/Kconfig               |   11 +
 drivers/pinctrl/renesas/Makefile              |    1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 1196 +++++++++++++++++
 include/dt-bindings/pinctrl/rzg2l-pinctrl.h   |   23 +
 8 files changed, 1414 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
 create mode 100644 drivers/pinctrl/renesas/pinctrl-rzg2l.c
 create mode 100644 include/dt-bindings/pinctrl/rzg2l-pinctrl.h


base-commit: 06c1e6911a7a76b446e4b00fc8bad5d8465932f8
-- 
2.17.1

