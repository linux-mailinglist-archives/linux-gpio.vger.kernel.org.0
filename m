Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83D429D9F3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 00:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgJ1XHD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 19:07:03 -0400
Received: from leibniz.telenet-ops.be ([195.130.137.77]:34556 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731457AbgJ1XG6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 19:06:58 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4CLs2z07R5zMs9Zl
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:51:23 +0100 (CET)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id lSrN2300Q4C55Sk01SrNpH; Wed, 28 Oct 2020 15:51:22 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXmnK-000oxl-8Y; Wed, 28 Oct 2020 15:51:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kXmnJ-007GYF-Je; Wed, 28 Oct 2020 15:51:21 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: Remove hole in pinctrl_gpio_range
Date:   Wed, 28 Oct 2020 15:51:17 +0100
Message-Id: <20201028145117.1731876-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 64-bit platforms, pointer size and alignment are 64-bit, hence two
4-byte holes are present before the pins and gc members of the
pinctrl_gpio_range structure.  Get rid of these holes by moving the
pins pointer.

This reduces kernel size of an arm64 Rockchip kernel by ca. 512 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only (arm/multi_v7_defconfig and arm64/defconfig).
---
 include/linux/pinctrl/pinctrl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 2aef59df93d70550..70b45d28e7a9293b 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -51,8 +51,8 @@ struct pinctrl_pin_desc {
  * @id: an ID number for the chip in this range
  * @base: base offset of the GPIO range
  * @pin_base: base pin number of the GPIO range if pins == NULL
- * @pins: enumeration of pins in GPIO range or NULL
  * @npins: number of pins in the GPIO range, including the base number
+ * @pins: enumeration of pins in GPIO range or NULL
  * @gc: an optional pointer to a gpio_chip
  */
 struct pinctrl_gpio_range {
@@ -61,8 +61,8 @@ struct pinctrl_gpio_range {
 	unsigned int id;
 	unsigned int base;
 	unsigned int pin_base;
-	unsigned const *pins;
 	unsigned int npins;
+	unsigned const *pins;
 	struct gpio_chip *gc;
 };
 
-- 
2.25.1

