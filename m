Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 033E43A9BEC
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 15:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbhFPN31 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 09:29:27 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:2586 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230455AbhFPN31 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Jun 2021 09:29:27 -0400
X-IronPort-AV: E=Sophos;i="5.83,278,1616425200"; 
   d="scan'208";a="84546634"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Jun 2021 22:27:19 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8B520423A74E;
        Wed, 16 Jun 2021 22:27:17 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] pinctrl: Add RZ/G2L pin and gpio driver
Date:   Wed, 16 Jun 2021 14:26:38 +0100
Message-Id: <20210616132641.29087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

RZ/G2L has a simple pin and GPIO controller combined similar to RZ/A2.

Second patch adds the core wrapper for RZ/G2L family and third patch
defines pins/groups/functions for i2c/scif/usb supported by RZ/G2L Soc.

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add DT bindings for
    RZ/G2L pinctrl
  pinctrl: renesas: Add RZ/G2L pin and gpio controller core wrapper
  pinctrl: renesas: Add pins/groups/functions for I2C, SCIF and USB
    supported by RZ/G2L SoC

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 121 ++++
 drivers/pinctrl/renesas/Kconfig               |  16 +
 drivers/pinctrl/renesas/Makefile              |   2 +
 drivers/pinctrl/renesas/pfc-r9a07g044.c       | 362 ++++++++++++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 536 ++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl-rzg2l.h       |  96 ++++
 include/dt-bindings/pinctrl/pinctrl-rzg2l.h   |  16 +
 7 files changed, 1149 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
 create mode 100644 drivers/pinctrl/renesas/pfc-r9a07g044.c
 create mode 100644 drivers/pinctrl/renesas/pinctrl-rzg2l.c
 create mode 100644 drivers/pinctrl/renesas/pinctrl-rzg2l.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-rzg2l.h

-- 
2.17.1

