Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA1BB2DBC02
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 08:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725885AbgLPHiv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 02:38:51 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:37257 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725846AbgLPHiv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Dec 2020 02:38:51 -0500
X-IronPort-AV: E=Sophos;i="5.78,423,1599490800"; 
   d="scan'208";a="66149391"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Dec 2020 16:38:19 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A18E141F1D7E;
        Wed, 16 Dec 2020 16:38:19 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 00/12] treewide: bd9571mwv: Add support for BD9574MWF
Date:   Wed, 16 Dec 2020 16:37:43 +0900
Message-Id: <1608104275-13174-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add BD9574MWF support into bd9571mwv gpio, mfd and regulator drivers.
Latest Ebisu-4D boards has this chip instead of BD9571MWV so that
we need this patch series to detect this chip at runtime.

Note that the patch [1/12] is a bug-fix patch for mfd driver.

Changes from v2:
 - Use devm_mfd_add_devices() to remove the mfd device in unload.
 - Update commit descriptions in patch 4 and 8.
 - Use regmap_get_device() to simplify in patch 4.
 - Remove "struct bd9571mwv" and bd9571mwv_remove().
 - Add Reviewed-by in patch 3 to 9.
 - Use devm_regmap_add_irq_chip() to simplify in patch 10.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=400477

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

Yoshihiro Shimoda (10):
  mfd: bd9571mwv: Use devm_mfd_add_devices()
  dt-bindings: mfd: bd9571mwv: Document BD9574MWF
  mfd: rohm-generic: Add BD9571 and BD9574
  regulator: bd9571mwv: rid of using struct bd9571mwv
  regulator: bd9571mwv: Add BD9574MWF support
  gpio: bd9571mwv: Use the SPDX license identifier
  gpio: bd9571mwv: rid of using struct bd9571mwv
  gpio: bd9571mwv: Add BD9574MWF support
  mfd: bd9571mwv: Use the SPDX license identifier
  mfd: bd9571mwv: Use devm_regmap_add_irq_chip()

 .../devicetree/bindings/mfd/bd9571mwv.txt          |   4 +-
 drivers/gpio/gpio-bd9571mwv.c                      |  35 ++--
 drivers/mfd/bd9571mwv.c                            | 206 +++++++++++++++------
 drivers/regulator/bd9571mwv-regulator.c            |  59 +++---
 include/linux/mfd/bd9571mwv.h                      |  46 ++---
 include/linux/mfd/rohm-generic.h                   |   2 +
 6 files changed, 216 insertions(+), 136 deletions(-)

-- 
2.7.4

