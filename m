Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA16AF42B1
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Nov 2019 10:00:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730221AbfKHJAl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Nov 2019 04:00:41 -0500
Received: from mail-sz.amlogic.com ([211.162.65.117]:18424 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729873AbfKHJAl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Nov 2019 04:00:41 -0500
Received: from localhost.localdomain (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Fri, 8 Nov 2019
 17:00:58 +0800
From:   Qianggui Song <qianggui.song@amlogic.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
CC:     Qianggui Song <qianggui.song@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Carlo Caione <carlo@caione.org>,
        Rob Herring <robh+dt@kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v5 0/3] pinctrl: meson-a1: add pinctrl driver
Date:   Fri, 8 Nov 2019 17:00:33 +0800
Message-ID: <1573203636-7436-1-git-send-email-qianggui.song@amlogic.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.28.8.19]
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patchset adds Pin controller driver support for Meson-A1 Soc
which shares the same register layout of pinmux with previous
Meson-G12A, however there is difference for gpio and pin config
registers in A1.

Note that since dt-binding patch has been removed from this patch set,
compiling need header file in patch 1 of [3].

Changes since v4 at [3]
 - remove dt-binding patch for it can be merged first according to
 Linus Walleij's suggestion.
 - make SoCs before g12a share the same aobus dt paser function
 - make A1 dt paser function also as common part for later chip will
 re-use this definition.
 - modify meson_map_resource return value

Changes since v3 at [2]
 - separate ao fixup from meson_pinctrl_parse_dt
 - provide ao extra dt parse callback for each SoC

Changes since v2 at [1]:
 - make dt parser callback as a separate patch

Changes since v1 at [0]:
 - collect Reviewed-by
 - modify commit log
 - add an extra dt parser function for a1

[0] https://lore.kernel.org/linux-amlogic/1568700442-18540-1-git-send-email-qianggui.song@amlogic.com/
[1] https://lore.kernel.org/linux-amlogic/1570532999-23302-1-git-send-email-qianggui.song@amlogic.com/
[2] https://lore.kernel.org/linux-amlogic/1571050492-6598-1-git-send-email-qianggui.song@amlogic.com/
[3] https://lore.kernel.org/linux-amlogic/1572004167-24150-1-git-send-email-qianggui.song@amlogic.com/

Qianggui Song (3):
  pinctrl: meson: add a new callback for SoCs fixup
  pinctrl: meson: add pinctrl driver support for Meson-A1 SoC
  arm64: dts: meson: a1: add pinctrl controller support

 arch/arm64/boot/dts/amlogic/meson-a1.dtsi  |  18 +
 drivers/pinctrl/meson/Kconfig              |   6 +
 drivers/pinctrl/meson/Makefile             |   1 +
 drivers/pinctrl/meson/pinctrl-meson-a1.c   | 942 +++++++++++++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-axg.c  |   1 +
 drivers/pinctrl/meson/pinctrl-meson-g12a.c |   9 +
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c |   1 +
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  |   1 +
 drivers/pinctrl/meson/pinctrl-meson.c      |  34 +-
 drivers/pinctrl/meson/pinctrl-meson.h      |   7 +
 drivers/pinctrl/meson/pinctrl-meson8.c     |   1 +
 drivers/pinctrl/meson/pinctrl-meson8b.c    |   1 +
 12 files changed, 1015 insertions(+), 7 deletions(-)
 create mode 100644 drivers/pinctrl/meson/pinctrl-meson-a1.c

-- 
1.9.1

