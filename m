Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD7B17CE6B
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2020 14:38:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbgCGNiP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 Mar 2020 08:38:15 -0500
Received: from inva020.nxp.com ([92.121.34.13]:37036 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbgCGNiP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 7 Mar 2020 08:38:15 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9E75A1A1037;
        Sat,  7 Mar 2020 14:38:13 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9DF201A104E;
        Sat,  7 Mar 2020 14:38:10 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 9CE4840294;
        Sat,  7 Mar 2020 21:38:06 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] gpio: mxc: Add COMPILE_TEST support for GPIO_MXC
Date:   Sat,  7 Mar 2020 21:31:57 +0800
Message-Id: <1583587917-7032-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add COMPILE_TEST support to GPIO_MXC driver for better compile
testing coverage.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b8013cf..b411226 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -394,7 +394,7 @@ config GPIO_MVEBU
 
 config GPIO_MXC
 	def_bool y
-	depends on ARCH_MXC
+	depends on ARCH_MXC || COMPILE_TEST
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 
-- 
2.7.4

