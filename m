Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 371151064A6
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 07:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729621AbfKVGTB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 01:19:01 -0500
Received: from inva021.nxp.com ([92.121.34.21]:57604 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729691AbfKVGTA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Nov 2019 01:19:00 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6BD8D2006C5;
        Fri, 22 Nov 2019 07:18:58 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3B0FF200AEA;
        Fri, 22 Nov 2019 07:18:53 +0100 (CET)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id ECA14402B3;
        Fri, 22 Nov 2019 14:18:46 +0800 (SGT)
From:   Hui Song <hui.song_1@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Song Hui <hui.song_1@nxp.com>
Subject: [PATCH v1] gpio : mpc8xxx :  ls1088a/ls1028a edge detection mode bug fixs.
Date:   Fri, 22 Nov 2019 14:18:39 +0800
Message-Id: <20191122061839.24904-1-hui.song_1@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Song Hui <hui.song_1@nxp.com>

On these boards, the irq_set_type must point one valid function pointer
that can correctly set both edge and falling edge.

Signed-off-by: Song Hui <hui.song_1@nxp.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 81f0f31..8ddb23b 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -296,6 +296,7 @@ static const struct mpc8xxx_gpio_devtype mpc512x_gpio_devtype = {
 
 static const struct mpc8xxx_gpio_devtype ls1028a_gpio_devtype = {
 	.gpio_dir_in_init = ls1028a_gpio_dir_in_init,
+	.irq_set_type = mpc8xxx_irq_set_type,
 };
 
 static const struct mpc8xxx_gpio_devtype mpc5125_gpio_devtype = {
-- 
2.9.5

