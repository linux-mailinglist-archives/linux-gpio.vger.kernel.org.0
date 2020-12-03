Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C002CDE91
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 20:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgLCTOV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 14:14:21 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:47079 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726629AbgLCTOV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 14:14:21 -0500
Received: from orion.localdomain ([95.118.71.13]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MRSZX-1kYaKc2hyn-00NQ2q; Thu, 03 Dec 2020 20:11:39 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, info@metux.net, mst@redhat.com,
        jasowang@redhat.com, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/2] drivers: gpio: put virtual gpio device into their own submenu
Date:   Thu,  3 Dec 2020 20:11:34 +0100
Message-Id: <20201203191135.21576-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:aD2+iVIcNpdQrY5wIXXIxV+rDmOoUKKtGmWxyejH/O01QJPlfrj
 iIB0sjkq/sX52TijJKkNSNyPwjiEsDN9x2Xct60/y47lyMmIjEcUrejRHgOxS/zACxqwqAW
 87tm74VqQCuPrBriOEfU1hZ+wIB7nd17P9MQkkgHrAcZKsYGTv0t7FCBTN0FvogpzjN58df
 jm7RFZwxj7eyUjZfUuVOw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vFKWEtG98l0=:OBqv3UErgUCfsvx7zfIhCR
 CVtTjpJuaH3WIGsywghkvmCKrvGMX0p7T7ql07bCjayhSKaCXAXLnSV893ijZeXayKxajmrUP
 Jx9yMK6ITOZwNGix9kfyLlrhnJdn/6m/DfJobcJfeSjFKlEvYjV7Zh51jtswjAjvclDpvO7XX
 1wzWrZTARq4n1RX/AC1T0Sz1cCjFXFjpo1wKipjjssUFS0KK5qNYodIwYTx4lGj1rX7FfLQgE
 U8KhlGQCTjvsACSCVhpsXrKy2KHTuVN+/DRUV3IYuX9rkM/h00w1e1C2Kx3XhtEBvT5qswOnv
 Yc1Jp11Ws70SpIA/5SMueO1zK7b/z/01RQXsu/f3MBV6iuF+4ky/w2WbiQMHMrL8b7bJHj8NV
 is9SFUTvq4FiFUmzkZGO4ZNGl5JscX36WH0wLvZ+Omnbtv8Umb0hMl/ZK4iIF
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since we already have a few virtual gpio devices, and more to come,
this category deserves its own submenu.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5d4de5cd6759..01619eb58396 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1590,6 +1590,8 @@ config GPIO_VIPERBOARD
 
 endmenu
 
+menu "Virtual GPIO devices"
+
 config GPIO_AGGREGATOR
 	tristate "GPIO Aggregator"
 	help
@@ -1613,4 +1615,6 @@ config GPIO_MOCKUP
 	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
 	  it.
 
+endmenu
+
 endif
-- 
2.11.0

