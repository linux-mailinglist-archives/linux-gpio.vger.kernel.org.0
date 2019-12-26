Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 554FF12A9D9
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Dec 2019 03:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfLZChm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Dec 2019 21:37:42 -0500
Received: from mail-sz.amlogic.com ([211.162.65.117]:49768 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbfLZChm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Dec 2019 21:37:42 -0500
Received: from localhost.localdomain (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Thu, 26 Dec 2019
 10:37:57 +0800
From:   Qianggui Song <qianggui.song@amlogic.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Qianggui Song <qianggui.song@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Guillaume La Roque <glaroque@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] pinctrl: meson: Fix wrong shift value when get drive-strength
Date:   Thu, 26 Dec 2019 10:37:34 +0800
Message-ID: <20191226023734.9631-1-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.28.8.19]
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In meson_pinconf_get_drive_strength, variable bit is calculated by
meson_calc_reg_and_bit, this value is the offset from the first pin of a
certain bank to current pin, while Meson SoCs use two bits for each pin
to depict drive-strength. So a left shift by 1 should be done or node
pinconf-pins shows wrong message.

Fixes: 6ea3e3bbef37 ("pinctrl: meson: add support of drive-strength-microamp")

Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 3c80828a5e50..bbc919bef2bf 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -441,6 +441,7 @@ static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
 		return ret;
 
 	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
+	bit = bit << 1;
 
 	ret = regmap_read(pc->reg_ds, reg, &val);
 	if (ret)
-- 
2.24.0

