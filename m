Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1EE92F2AA3
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jan 2021 10:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbhALJCc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jan 2021 04:02:32 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:61665 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2405680AbhALJBx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Jan 2021 04:01:53 -0500
X-IronPort-AV: E=Sophos;i="5.79,340,1602514800"; 
   d="scan'208";a="68731775"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 12 Jan 2021 18:01:19 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EAD9C40061BC;
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
Subject: [PATCH v9 06/12] gpio: bd9571mwv: Use the SPDX license identifier
Date:   Tue, 12 Jan 2021 18:01:01 +0900
Message-Id: <1610442067-7446-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610442067-7446-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1610442067-7446-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the SPDX license identifier instead of a local description.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-bd9571mwv.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.c
index c0abc9c..abb622c 100644
--- a/drivers/gpio/gpio-bd9571mwv.c
+++ b/drivers/gpio/gpio-bd9571mwv.c
@@ -1,17 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * ROHM BD9571MWV-M GPIO driver
  *
  * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
  *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether expressed or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License version 2 for more details.
- *
  * Based on the TPS65086 driver
  *
  * NOTE: Interrupts are not supported yet.
-- 
2.7.4

