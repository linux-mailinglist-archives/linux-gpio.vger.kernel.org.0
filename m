Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2353A49FAD6
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jan 2022 14:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348955AbiA1NfJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jan 2022 08:35:09 -0500
Received: from mx.socionext.com ([202.248.49.38]:5514 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348945AbiA1NfI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 Jan 2022 08:35:08 -0500
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 28 Jan 2022 22:35:06 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 7A10A2006E83;
        Fri, 28 Jan 2022 22:35:06 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Fri, 28 Jan 2022 22:35:06 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id BE95BC1E22;
        Fri, 28 Jan 2022 22:35:05 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v2 0/3] pinctrl: uniphier: Add some more pinmux settings
Date:   Fri, 28 Jan 2022 22:35:00 +0900
Message-Id: <1643376903-18623-1-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series includes changes to audio I/O pinmux settings and addition
to USB device pinmux settings.

- Divide audio I/O pinmux groups so that 1/2/4ch can be specified.
  The audio I/O function is available for LD11, LD20, PXs2 and PXs3 SoCs.
  In addition, add the missing pinmux settings for PXs2.

- Add USB device pinmux settings. The USB device function is available
  for PXs2 and PXs3 SoCs.

---
Changes since v1:
- Remove the line of the nonexistent function

Kunihiko Hayashi (3):
  pinctrl: uniphier: Add missing audio pinmux settings for PXs2 SoC
  pinctrl: uniphier: Divide pinmux group to support 1ch and 2ch I2S
  pinctrl: uniphier: Add USB device pinmux settings

 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c | 26 +++++++---
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c | 64 ++++++++++++++++++------
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c | 62 +++++++++++++++++++----
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs3.c | 62 +++++++++++++++++------
 4 files changed, 171 insertions(+), 43 deletions(-)

-- 
2.7.4

