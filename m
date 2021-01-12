Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33EAE2F2AAF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jan 2021 10:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392454AbhALJDR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jan 2021 04:03:17 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:18782 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389112AbhALJBu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 Jan 2021 04:01:50 -0500
X-IronPort-AV: E=Sophos;i="5.79,340,1602514800"; 
   d="scan'208";a="68514068"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 12 Jan 2021 18:01:18 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9725C4007554;
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
Subject: [PATCH v9 03/12] mfd: rohm-generic: Add BD9571 and BD9574
Date:   Tue, 12 Jan 2021 18:00:58 +0900
Message-Id: <1610442067-7446-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610442067-7446-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1610442067-7446-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add chip IDs for BD9571MWV and BD9574MWF.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 include/linux/mfd/rohm-generic.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
index 4283b5b..affacf8 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -12,6 +12,8 @@ enum rohm_chip_type {
 	ROHM_CHIP_TYPE_BD71847,
 	ROHM_CHIP_TYPE_BD70528,
 	ROHM_CHIP_TYPE_BD71828,
+	ROHM_CHIP_TYPE_BD9571,
+	ROHM_CHIP_TYPE_BD9574,
 	ROHM_CHIP_TYPE_AMOUNT
 };
 
-- 
2.7.4

