Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9873D16E5
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 21:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbhGUSfe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 14:35:34 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:11112 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231633AbhGUSfe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Jul 2021 14:35:34 -0400
X-IronPort-AV: E=Sophos;i="5.84,258,1620658800"; 
   d="scan'208";a="88348859"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Jul 2021 04:16:09 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 17339400854C;
        Thu, 22 Jul 2021 04:16:06 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/4] pin and gpio controller driver for Renesas RZ/G2L
Date:   Wed, 21 Jul 2021 20:15:54 +0100
Message-Id: <20210721191558.22484-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

This patch series adds pin and gpio controller driver for Renesas RZ/G2L
SoC. RZ/G2L has a simple pin and GPIO controller combined similar to RZ/A2.

This patch series applies on top of Linux 5.14-rc2

Cheers,
Prabhakar

Changes for v3:
* Dropped clock patch from the series (its queued up already in
  renesas-clk-for-v5.15)
* Included ACK form Geert for binding patch
* Fixed review comments pointed by Geert
* Fixed s/property/properties for patch 4/4 pointed by Sergei

Changes for v2:
* Added support for per pin pinmux support
* Added support for pins to set configs
* Dropped pfc-r9a07g044.c/h
* Fixed review comments pointed by Geert
* Included clock/reset changes
* Included DTS/I changes

Lad Prabhakar (4):
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add DT bindings for
    RZ/G2L pinctrl
  pinctrl: renesas: Add RZ/G2L pin and gpio controller driver
  arm64: dts: renesas: r9a07g044: Add pinctrl node
  arm64: dts: renesas: rzg2l-smarc: Add scif0 pins

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  155 +++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |   13 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |   10 +
 drivers/pinctrl/renesas/Kconfig               |   11 +
 drivers/pinctrl/renesas/Makefile              |    1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 1163 +++++++++++++++++
 include/dt-bindings/pinctrl/rzg2l-pinctrl.h   |   23 +
 7 files changed, 1376 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
 create mode 100644 drivers/pinctrl/renesas/pinctrl-rzg2l.c
 create mode 100644 include/dt-bindings/pinctrl/rzg2l-pinctrl.h


base-commit: 2734d6c1b1a089fb593ef6a23d4b70903526fe0c
-- 
2.17.1

