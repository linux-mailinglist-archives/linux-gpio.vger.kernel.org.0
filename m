Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69A1763445
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 12:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbfGIK3g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jul 2019 06:29:36 -0400
Received: from mx.socionext.com ([202.248.49.38]:38479 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726418AbfGIK3e (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jul 2019 06:29:34 -0400
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 09 Jul 2019 19:29:33 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id 1191560629;
        Tue,  9 Jul 2019 19:29:33 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 9 Jul 2019 19:29:33 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
        by kinkan.css.socionext.com (Postfix) with ESMTP id A69921A14E3;
        Tue,  9 Jul 2019 19:29:32 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-gpio@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 4/5] pinctrl: uniphier: Add Pro5 PCIe pin-mux settings
Date:   Tue,  9 Jul 2019 19:29:15 +0900
Message-Id: <1562668156-12927-5-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562668156-12927-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1562668156-12927-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pro5 PCIe interface uses the following pins:
    XPERST, XPEWAKE, XPECLKRQ

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
index 1d418e3..577f12e 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
@@ -855,6 +855,8 @@ static const unsigned usb1_pins[] = {126, 127};
 static const int usb1_muxvals[] = {0, 0};
 static const unsigned usb2_pins[] = {128, 129};
 static const int usb2_muxvals[] = {0, 0};
+static const unsigned pcie_pins[] = {109, 110, 111};
+static const int pcie_muxvals[] = {0, 0, 0};
 static const unsigned int gpio_range_pins[] = {
 	89, 90, 91, 92, 93, 94, 95, 96,		/* PORT0x */
 	97, 98, 99, 100, 101, 102, 103, 104,	/* PORT1x */
@@ -925,6 +927,7 @@ static const struct uniphier_pinctrl_group uniphier_pro5_groups[] = {
 	UNIPHIER_PINCTRL_GROUP(usb0),
 	UNIPHIER_PINCTRL_GROUP(usb1),
 	UNIPHIER_PINCTRL_GROUP(usb2),
+	UNIPHIER_PINCTRL_GROUP(pcie),
 	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range),
 };
 
@@ -957,6 +960,7 @@ static const char * const uart3_groups[] = {"uart3"};
 static const char * const usb0_groups[] = {"usb0"};
 static const char * const usb1_groups[] = {"usb1"};
 static const char * const usb2_groups[] = {"usb2"};
+static const char * const pcie_groups[] = {"pcie"};
 
 static const struct uniphier_pinmux_function uniphier_pro5_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(emmc),
@@ -979,6 +983,7 @@ static const struct uniphier_pinmux_function uniphier_pro5_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(usb0),
 	UNIPHIER_PINMUX_FUNCTION(usb1),
 	UNIPHIER_PINMUX_FUNCTION(usb2),
+	UNIPHIER_PINMUX_FUNCTION(pcie),
 };
 
 static int uniphier_pro5_get_gpio_muxval(unsigned int pin,
-- 
2.7.4

