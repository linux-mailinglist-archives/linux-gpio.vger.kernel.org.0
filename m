Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC6A2F2A79
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jan 2021 10:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389031AbhALJBu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jan 2021 04:01:50 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:61665 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388357AbhALJBu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Jan 2021 04:01:50 -0500
X-IronPort-AV: E=Sophos;i="5.79,340,1602514800"; 
   d="scan'208";a="68731765"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 12 Jan 2021 18:01:18 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 39A9340062D6;
        Tue, 12 Jan 2021 18:01:18 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v9 00/12] treewide: bd9571mwv: Add support for BD9574MWF
Date:   Tue, 12 Jan 2021 18:00:55 +0900
Message-Id: <1610442067-7446-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add BD9574MWF support into bd9571mwv gpio, mfd and regulator drivers.
Latest Ebisu-4D boards has this chip instead of BD9571MWV so that
we need this patch series to detect this chip at runtime.

Note that the patch [1/12] is a bug-fix patch for mfd driver.

Hello Lee,

Now I got Acked-by from maintainers of gpio and regulator. So,
would you apply this series to your repo?

Changes from v8:
 - Add Acked-by from maintainers of regulator and gpio in patch 4 to 8.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=406323

Changes from v7:
 - Fix typo in the patch 10.
 - Add "Acked-for-MFD-by" in patch 2 and 11.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=406091

Changes from v6:
 - Remove "struct bd957x_ddata" because this is not used after probed.
 - Add "Acked-for-MFD-by" in patch 12.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=405725

Changes from v5:
 - Fix typo in the patch 5 and 8.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=405263

Changes from v4:
 - Add Reviwed-by in patch 1, 10, 11 and 12.
 - Keep bd9571mwv_id_table[] as-is because unused in patch 12.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=404657

Changes from v3:
 - Add "Acked-for-MFD-by" in patch 1, 3, 9 and 10.
 - Use "Co-developed-by" instead in patch 11.
 - In patch 11:
 -- Remove abusing kernel-doc formatting in patch.
 -- Rename bd957x_data with bd957x_ddata in patch.
 -- Remove product name printk.
 -- Rename bd9571mwv_identify() with bd957x_identify().
 -- Remove argument "part_name" from bd957x_identify().
 -- Modify dev_err() string.
 -- Rename BD9571MWV_PRODUCT_CODE_VAL with BD9571MWV_PRODUCT_CODE_BD9571MWV.
 -- Fix errno from -ENOENT to -ENODEV.
 - In patch 12:
 -- Rename "MFD driver" to "core driver".
 -- Remove unnecessary comments.
 -- Rename BD9574MWF_PRODUCT_CODE_VAL with BD9571MWV_PRODUCT_CODE_BD9574MWF.
 https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=402719

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
 drivers/mfd/bd9571mwv.c                            | 178 ++++++++++++++-------
 drivers/regulator/bd9571mwv-regulator.c            |  59 ++++---
 include/linux/mfd/bd9571mwv.h                      |  45 ++----
 include/linux/mfd/rohm-generic.h                   |   2 +
 6 files changed, 186 insertions(+), 137 deletions(-)

-- 
2.7.4

