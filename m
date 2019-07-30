Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58C167A06E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 07:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729397AbfG3Fnr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 01:43:47 -0400
Received: from mx.socionext.com ([202.248.49.38]:57337 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725209AbfG3Fnp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Jul 2019 01:43:45 -0400
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 30 Jul 2019 14:43:44 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by kinkan-ex.css.socionext.com (Postfix) with ESMTP id 23ADC180B6E;
        Tue, 30 Jul 2019 14:43:44 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 30 Jul 2019 14:43:44 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
        by kinkan.css.socionext.com (Postfix) with ESMTP id 7D4801A04FC;
        Tue, 30 Jul 2019 14:43:43 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-gpio@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v2 2/5] pinctrl: uniphier: Add another audio I/O pin-mux settings for LD20
Date:   Tue, 30 Jul 2019 14:43:27 +0900
Message-Id: <1564465410-9165-3-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564465410-9165-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1564465410-9165-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds support for pinmux settings of aout1b group. This group includes
audio I/O signals derived from xirq pins, and it is equivalent to "aout1"
in functionality.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
index 28e54b3..8d4fb65 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
@@ -544,6 +544,8 @@ static const struct pinctrl_pin_desc uniphier_ld20_pins[] = {
 
 static const unsigned aout1_pins[] = {137, 138, 139, 140, 141, 142};
 static const int aout1_muxvals[] = {0, 0, 0, 0, 0, 0};
+static const unsigned aout1b_pins[] = {150, 151, 152, 153, 154, 155, 156};
+static const int aout1b_muxvals[] = {1, 1, 1, 1, 1, 1, 1};
 static const unsigned aoutiec1_pins[] = {135, 136};
 static const int aoutiec1_muxvals[] = {0, 0};
 static const unsigned int emmc_pins[] = {19, 20, 21, 22, 23, 24, 25};
@@ -664,6 +666,7 @@ static const unsigned int gpio_range2_pins[] = {
 
 static const struct uniphier_pinctrl_group uniphier_ld20_groups[] = {
 	UNIPHIER_PINCTRL_GROUP(aout1),
+	UNIPHIER_PINCTRL_GROUP(aout1b),
 	UNIPHIER_PINCTRL_GROUP(aoutiec1),
 	UNIPHIER_PINCTRL_GROUP(emmc),
 	UNIPHIER_PINCTRL_GROUP(emmc_dat8),
@@ -707,7 +710,7 @@ static const struct uniphier_pinctrl_group uniphier_ld20_groups[] = {
 	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range2),
 };
 
-static const char * const aout1_groups[] = {"aout1"};
+static const char * const aout1_groups[] = {"aout1", "aout1b"};
 static const char * const aoutiec1_groups[] = {"aoutiec1"};
 static const char * const emmc_groups[] = {"emmc", "emmc_dat8"};
 static const char * const ether_rgmii_groups[] = {"ether_rgmii"};
-- 
2.7.4

