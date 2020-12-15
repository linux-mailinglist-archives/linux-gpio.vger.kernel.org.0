Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6022DAB7B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 11:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgLOKyM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Dec 2020 05:54:12 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:58500 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727761AbgLOKyM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2020 05:54:12 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1kp7xR-0006d9-MH; Tue, 15 Dec 2020 10:53:29 +0000
From:   Colin King <colin.king@canonical.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: fix spelling mistake in Kconfig "supprot" -> "support"
Date:   Tue, 15 Dec 2020 10:53:29 +0000
Message-Id: <20201215105329.138193-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig help text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index c70f46e80a3b..f58e46ec1c96 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -666,7 +666,7 @@ config GPIO_WCD934X
 	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 gpio controller driver"
 	depends on MFD_WCD934X && OF_GPIO
 	help
-         This driver is to supprot GPIO block found on the Qualcomm Technologies
+         This driver is to support GPIO block found on the Qualcomm Technologies
 	 Inc WCD9340/WCD9341 Audio Codec.
 
 config GPIO_XGENE
-- 
2.29.2

