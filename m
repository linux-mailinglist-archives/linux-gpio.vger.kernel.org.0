Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FEED17D802
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2020 03:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgCICEB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Mar 2020 22:04:01 -0400
Received: from inva020.nxp.com ([92.121.34.13]:34360 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726346AbgCICEB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 8 Mar 2020 22:04:01 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4079C1A1686;
        Mon,  9 Mar 2020 03:03:59 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 438BB1A16D8;
        Mon,  9 Mar 2020 03:03:56 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 415444024E;
        Mon,  9 Mar 2020 10:03:52 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] gpio: mxs: add COMPILE_TEST support for GPIO_MXS
Date:   Mon,  9 Mar 2020 09:57:38 +0800
Message-Id: <1583719058-23370-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add COMPILE_TEST support to GPIO_MXS driver for better compile
testing coverage.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b411226..3cbf888 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -400,7 +400,7 @@ config GPIO_MXC
 
 config GPIO_MXS
 	def_bool y
-	depends on ARCH_MXS
+	depends on ARCH_MXS || COMPILE_TEST
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 
-- 
2.7.4

