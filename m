Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED1143FC7C
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 14:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbhJ2MrO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Oct 2021 08:47:14 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:57973 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231607AbhJ2MrO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 29 Oct 2021 08:47:14 -0400
X-IronPort-AV: E=Sophos;i="5.87,192,1631545200"; 
   d="scan'208";a="98635616"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 29 Oct 2021 21:44:44 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2A8DE438EE78;
        Fri, 29 Oct 2021 21:44:41 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] RZ/G2L: pinctrl: Support to get/set drive-strength and output-impedance-ohms
Date:   Fri, 29 Oct 2021 13:44:32 +0100
Message-Id: <20211029124437.20721-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Changes for v2:
* Fixed review comments pointed by Geert, split up patch 4 from series [1]

Note: This patch series is dependent on first two patches of series [1]

[1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/
20211027134509.5036-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Lad Prabhakar (5):
  dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add output-impedance-ohms
    property
  pinctrl: renesas: pinctrl-rzg2l: Add helper functions to read/write
    pin config
  pinctrl: renesas: pinctrl-rzg2l: Add support to get/set pin config for
    GPIO port pins
  pinctrl: renesas: pinctrl-rzg2l: Rename PIN_CFG_* macros to match HW
    manual
  pinctrl: renesas: pinctrl-rzg2l: Add support to get/set drive-strength
    and output-impedance-ohms

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 316 ++++++++++++------
 2 files changed, 222 insertions(+), 96 deletions(-)

-- 
2.17.1

