Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90BD17A072
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 07:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729418AbfG3Fnr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 01:43:47 -0400
Received: from mx.socionext.com ([202.248.49.38]:57333 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729383AbfG3Fnr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Jul 2019 01:43:47 -0400
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 30 Jul 2019 14:43:44 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id E5C3260629;
        Tue, 30 Jul 2019 14:43:44 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 30 Jul 2019 14:43:44 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
        by kinkan.css.socionext.com (Postfix) with ESMTP id 8AEA41A04FC;
        Tue, 30 Jul 2019 14:43:44 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-gpio@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v2 3/5] pinctrl: uniphier: Add 5th LD20 MPEG2-TS input pin-mux setting
Date:   Tue, 30 Jul 2019 14:43:28 +0900
Message-Id: <1564465410-9165-4-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564465410-9165-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1564465410-9165-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The 5th serial TS interface uses the following pins:
  hscin4_s: PCA[11-14]

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
index 8d4fb65..0a8b186 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
@@ -576,6 +576,8 @@ static const unsigned hscin2_s_pins[] = {124, 125, 126, 127};
 static const int hscin2_s_muxvals[] = {3, 3, 3, 3};
 static const unsigned hscin3_s_pins[] = {129, 130, 131, 132};
 static const int hscin3_s_muxvals[] = {3, 3, 3, 3};
+static const unsigned hscin4_s_pins[] = {80, 81, 82, 83};
+static const int hscin4_s_muxvals[] = {3, 3, 3, 3};
 static const unsigned hscout0_ci_pins[] = {113, 114, 115, 116, 117, 118, 119,
 					   120, 121, 122, 123};
 static const int hscout0_ci_muxvals[] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
@@ -679,6 +681,7 @@ static const struct uniphier_pinctrl_group uniphier_ld20_groups[] = {
 	UNIPHIER_PINCTRL_GROUP(hscin1_s),
 	UNIPHIER_PINCTRL_GROUP(hscin2_s),
 	UNIPHIER_PINCTRL_GROUP(hscin3_s),
+	UNIPHIER_PINCTRL_GROUP(hscin4_s),
 	UNIPHIER_PINCTRL_GROUP(hscout0_ci),
 	UNIPHIER_PINCTRL_GROUP(hscout0_p),
 	UNIPHIER_PINCTRL_GROUP(hscout0_s),
@@ -721,6 +724,7 @@ static const char * const hscin0_groups[] = {"hscin0_ci",
 static const char * const hscin1_groups[] = {"hscin1_p", "hscin1_s"};
 static const char * const hscin2_groups[] = {"hscin2_s"};
 static const char * const hscin3_groups[] = {"hscin3_s"};
+static const char * const hscin4_groups[] = {"hscin4_s"};
 static const char * const hscout0_groups[] = {"hscout0_ci",
 					      "hscout0_p",
 					      "hscout0_s"};
@@ -757,6 +761,7 @@ static const struct uniphier_pinmux_function uniphier_ld20_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(hscin1),
 	UNIPHIER_PINMUX_FUNCTION(hscin2),
 	UNIPHIER_PINMUX_FUNCTION(hscin3),
+	UNIPHIER_PINMUX_FUNCTION(hscin4),
 	UNIPHIER_PINMUX_FUNCTION(hscout0),
 	UNIPHIER_PINMUX_FUNCTION(hscout1),
 	UNIPHIER_PINMUX_FUNCTION(i2c0),
-- 
2.7.4

