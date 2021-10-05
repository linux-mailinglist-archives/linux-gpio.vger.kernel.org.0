Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8E4A421C69
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 04:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbhJECNw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 22:13:52 -0400
Received: from mx.socionext.com ([202.248.49.38]:40147 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230462AbhJECNv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Oct 2021 22:13:51 -0400
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 05 Oct 2021 11:12:01 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 5BE602058B40;
        Tue,  5 Oct 2021 11:12:01 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Tue, 5 Oct 2021 11:12:01 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id A821DB62B7;
        Tue,  5 Oct 2021 11:12:00 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 0/3] pinctrl: uniphier: Introduce some features and NX1 support
Date:   Tue,  5 Oct 2021 11:11:57 +0900
Message-Id: <1633399920-1537-1-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series includes the patches to add audio pinmux settings for LD11/LD20/PXs3
SoCs and basic pinmux settings for new UniPhier NX1 SoC. NX1 SoC also has
the same kinds of pinmux settings as the other UniPhier SoCs.

Kunihiko Hayashi (3):
  pinctrl: uniphier: Add extra audio pinmux settings for LD11, LD20 and
    PXs3 SoCs
  dt-bindings: pinctrl: uniphier: Add NX1 pinctrl binding
  pinctrl: uniphier: Add UniPhier NX1 pinctrl driver

 .../pinctrl/socionext,uniphier-pinctrl.yaml        |   1 +
 drivers/pinctrl/uniphier/Kconfig                   |   4 +
 drivers/pinctrl/uniphier/Makefile                  |   1 +
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c   |  18 +
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c   |  35 ++
 drivers/pinctrl/uniphier/pinctrl-uniphier-nx1.c    | 491 +++++++++++++++++++++
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs3.c   |  40 ++
 7 files changed, 590 insertions(+)
 create mode 100644 drivers/pinctrl/uniphier/pinctrl-uniphier-nx1.c

-- 
2.7.4

