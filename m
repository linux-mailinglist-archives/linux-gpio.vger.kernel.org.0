Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D82963441
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2019 12:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbfGIK33 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jul 2019 06:29:29 -0400
Received: from mx.socionext.com ([202.248.49.38]:38475 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726018AbfGIK33 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jul 2019 06:29:29 -0400
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 09 Jul 2019 19:29:28 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by kinkan-ex.css.socionext.com (Postfix) with ESMTP id 4BFEF18022B;
        Tue,  9 Jul 2019 19:29:28 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 9 Jul 2019 19:29:28 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
        by kinkan.css.socionext.com (Postfix) with ESMTP id 9C1331A14E3;
        Tue,  9 Jul 2019 19:29:27 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-gpio@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 0/5] pinctrl: uniphier: Add some improvements and new settings
Date:   Tue,  9 Jul 2019 19:29:11 +0900
Message-Id: <1562668156-12927-1-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series adds some improvements and new settings for pin-mux.

Kunihiko Hayashi (5):
  pinctrl: uniphier: Separate modem group from UART ctsrts group
  pinctrl: uniphier: Add another audio I/O pin-mux settings for LD20
  pinctrl: uniphier: Add 4th LD20 MPEG2-TS input pin-mux setting
  pinctrl: uniphier: Add Pro5 PCIe pin-mux settings
  pinctrl: uniphier: Fix Pro5 SD pin-mux setting

 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c | 10 +++++++---
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c | 20 +++++++++++++++++---
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c  | 10 +++++++---
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c | 10 +++++++---
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c | 10 +++++++---
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c | 17 +++++++++++++----
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c | 10 +++++++---
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs3.c | 10 +++++++---
 drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c | 10 +++++++---
 9 files changed, 79 insertions(+), 28 deletions(-)

-- 
2.7.4

