Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E6144CCFC
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 23:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233753AbhKJWtU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 17:49:20 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:61074 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233634AbhKJWtT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Nov 2021 17:49:19 -0500
X-IronPort-AV: E=Sophos;i="5.87,225,1631545200"; 
   d="scan'208";a="100143058"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Nov 2021 07:46:27 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5DF104131624;
        Thu, 11 Nov 2021 07:46:25 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/6] RZ/G2L: pinctrl: Support to get/set drive-strength and output-impedance-ohms
Date:   Wed, 10 Nov 2021 22:46:16 +0000
Message-Id: <20211110224622.16022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

This patch series add support to get/set drive-strength and
output-impedance for RZ/G2L SoC. Along with some macro renames
and code cleanup.

Cheers,
Prabhakar

Changes for v3:
* Fixed review comments pointed by Geert.

Changes for v2:
* Fixed review comments pointed by Geert, split up patch 4 from series [1]

Note: This patch series is dependent on first two patches of series [1]

[1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/
20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Lad Prabhakar (6):
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add output-impedance-ohms
    property
  pinctrl: renesas: pinctrl-rzg2l: Rename RZG2L_SINGLE_PIN_GET_PORT
    macro
  pinctrl: renesas: pinctrl-rzg2l: Add helper functions to read/write
    pin config
  pinctrl: renesas: pinctrl-rzg2l: Add support to get/set pin config for
    GPIO port pins
  pinctrl: renesas: pinctrl-rzg2l: Rename PIN_CFG_* macros to match HW
    manual
  pinctrl: renesas: pinctrl-rzg2l: Add support to get/set drive-strength
    and output-impedance-ohms

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 307 ++++++++++++------
 2 files changed, 209 insertions(+), 100 deletions(-)

-- 
2.17.1

