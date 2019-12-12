Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4FD911CE63
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 14:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729468AbfLLNdj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 08:33:39 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:58871 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729392AbfLLNdh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 08:33:37 -0500
Received: from orion.localdomain ([77.9.34.244]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MNssA-1iLYQh28cK-00OGBN; Thu, 12 Dec 2019 14:33:35 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH] drivers: gpio: remove unneeded MODULE_VERSION() usage
Date:   Thu, 12 Dec 2019 14:33:06 +0100
Message-Id: <20191212133306.24663-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:nGScxsI31qjcFratt33awZfiv+S6hopX8qziDv7bYFGHmgATF4u
 eBNSVnxWJa1MrB6bRN9e4C++w3HWI1U25+D1ZB0fkGXaLCwJZibr/OTF3pVHI5fhriNPbGT
 9arMHUBNyes+l1evqc/XlLwBCyrksfX7tNxNpLD3BEvivSjyXXSNXE9ADp3DLzrrN08NyWK
 ieKdZ/M3DJXCHN2j4IY/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:w/gr4XqYkPg=:I2rUN0t5cf6127LfNeTd5T
 IFeZ5H+xKT6rLv5lcgK7CMmzzlr/omHuc9GH/rBANg0mY6gbm9lQEIrrgMI8OuDYlDe1IhH8a
 HqIVTZCLL8ouKazF7S5lmpanh9NDT2I8rOULQEVLuR5/raKN5v+xfas96CToque/P5hxbrR03
 X8HMeU2ClaTr2Gh0cfte8eOTMnO8C5PMQfq4CDL+NLH8XcSlLM/II2e/6spdTzgf8kjPZ/akH
 ABIu1b0Fcf4u+g00WJTZchCEAIgaeHOZhxosWabGozXwVSMRyaRHydGqHUZI0eRLgnOpti0Gu
 V7wvxLk5Iy4WScg+orLjz1dpHzJuRA85CYZprzGhQ0Hmk406BiimPCIbDUgR+wpVvW+pj9dWI
 3RWu70CSIdhp/UmcOMelPsW7xeXJkRuIK/ML5Cb0wilLiG9Z2ung+VGcV+PDhhecLA0tMxEKW
 lz5VDE3WSqrz0L9Ik9r+71/GcMgY38ADQCoskQf2BL04QKwtFMbZ1ZyyBgny+B6l9FNUOyVkI
 U66RT+sIKtlo2egkQRH7uofxG0TLwYXgHKH+ulzrag2tMce2bWLlzPQrD1PlTNyinAhr1Qrok
 wlyTWDD+0ajdKmAsOzXVx/8O314NnO7n635Hpe9NlUJvHYzf+LFPxEZLGumat9ZSKu8UfLJ+N
 HqG+fcWzp9iNDbM8RF2v/p5Flbzca9ZXTZyZhwXWnWjvN+v//IZmGPM5CXfpOrHRhmwWofa9B
 afKbBdFeodfS/yfeVuy9UzU52qmqBm5GwLVCpO1ePLcg4QDcc8Uwlgo4MEzConnFKmBdSIVtK
 bqex9jxLAhMfFuBOSzUtuRNdUSBwCtbkEo0qe9WXHuXz/3ess4enFmOlOp1qa7QtN3+VltBrm
 uK5j2pSTsXAIQuLGz1Qg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove MODULE_VERSION(), as it isn't needed at all: the only version
making sense is the kernel version.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/gpio-sama5d2-piobu.c | 1 -
 drivers/gpio/gpio-tb10x.c         | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-sama5d2-piobu.c b/drivers/gpio/gpio-sama5d2-piobu.c
index b04c561f3280..4d47b2c41186 100644
--- a/drivers/gpio/gpio-sama5d2-piobu.c
+++ b/drivers/gpio/gpio-sama5d2-piobu.c
@@ -244,7 +244,6 @@ static struct platform_driver sama5d2_piobu_driver = {
 
 module_platform_driver(sama5d2_piobu_driver);
 
-MODULE_VERSION("1.0");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("SAMA5D2 PIOBU controller driver");
 MODULE_AUTHOR("Andrei Stefanescu <andrei.stefanescu@microchip.com>");
diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 5e375186f90e..866201cf5f65 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -243,4 +243,3 @@ static struct platform_driver tb10x_gpio_driver = {
 module_platform_driver(tb10x_gpio_driver);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("tb10x gpio.");
-MODULE_VERSION("0.0.1");
-- 
2.11.0

