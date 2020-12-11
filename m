Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 488ED2D7495
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 12:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394453AbgLKL2e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 06:28:34 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:41506 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391604AbgLKL21 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Dec 2020 06:28:27 -0500
X-IronPort-AV: E=Sophos;i="5.78,411,1599490800"; 
   d="scan'208";a="65637569"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 11 Dec 2020 20:27:55 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7EA7942D7EA1;
        Fri, 11 Dec 2020 20:27:55 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 00/10] treewide: bd9571mwv: Add support for BD9574MWF
Date:   Fri, 11 Dec 2020 20:27:30 +0900
Message-Id: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add BD9574MWF support into bd9571mwv gpio, mfd and regulator drivers.
Latest Ebisu-4D boards has this chip instead of BD9571MWV so that
we need this patch series.

Changes from v1:
 - Document BD9574MWF on the dt-binding.
 - Add ROHM_CHIP_TYPE_BD957[14] into rohm-generic.h.
 - To simplify gpio and regulator drivers, using regmap instead of
   using struct bd9571mwv.
 - Remove BD9574MWF definitions to make gpio and regulator driver
   simple to support for BD9574MWF.
 - Add BD9574MWF support for gpio and regulator drivers.
 - Add missing regmap ranges for BD9574MWF.
 - Rename "part_number" with "part_name".
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=398059

Khiem Nguyen (2):
  mfd: bd9571mwv: Make the driver more generic
  mfd: bd9571mwv: Add support for BD9574MWF

Yoshihiro Shimoda (8):
  dt-bindings: mfd: bd9571mwv: Document BD9574MWF
  mfd: rohm-generic: Add BD9571 and BD9574
  regulator: bd9571mwv: rid of using struct bd9571mwv
  regulator: bd9571mwv: Add BD9574MWF support
  gpio: bd9571mwv: Use the SPDX license identifier
  gpio: bd9571mwv: rid of using struct bd9571mwv
  gpio: bd9571mwv: Add BD9574MWF support
  mfd: bd9571mwv: Use the SPDX license identifier

 .../devicetree/bindings/mfd/bd9571mwv.txt          |   4 +-
 drivers/gpio/gpio-bd9571mwv.c                      |  35 ++---
 drivers/mfd/bd9571mwv.c                            | 167 ++++++++++++++++++---
 drivers/regulator/bd9571mwv-regulator.c            |  59 +++++---
 include/linux/mfd/bd9571mwv.h                      |  46 +++---
 include/linux/mfd/rohm-generic.h                   |   2 +
 6 files changed, 215 insertions(+), 98 deletions(-)

-- 
2.7.4

