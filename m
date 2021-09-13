Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67DB40A109
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 00:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350043AbhIMWxh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Sep 2021 18:53:37 -0400
Received: from gloria.sntech.de ([185.11.138.130]:51184 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349678AbhIMWvB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Sep 2021 18:51:01 -0400
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146] helo=localhost.localdomain)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1mPulV-0003SX-PC; Tue, 14 Sep 2021 00:49:29 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     heiko@sntech.de, jay.xu@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] gpio/pinctrl-rockchip: Fixes for the recently separated gpio/pinctrl driver
Date:   Tue, 14 Sep 2021 00:49:22 +0200
Message-Id: <20210913224926.1260726-1-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It looks like rk3288-veyron(-pinky) was the one device in my boardfarm
I didn't test the pinctrl/gpio patches on and it seems this one uses
some specific parts none of the other do. So when I did my v5.15-rc1
testrun I got a surprise.

Not only did the pinctrl-hogs cause a null-pointer exception but the
device also entered a reset loop a bit later in the boot.

This series addresses the issues in hopefully a nice way and should
ideally become part of 5.15 before other people run into issues.

* Patch 1 addresses the reset-loop, which is caused by a not-ideal
  check vor v1 vs. v2 controller in the debounce code
* Patch 2 is just a find when looking through the code
* Patches 3+4 address the pinctrl-hogs issue by creating a deferred
  queue where the pinctrl can temporarily store these hog settings
  if needed and the pinctrl driver can retrieve them during probe.


Heiko Stuebner (4):
  gpio/rockchip: extended debounce support is only available on v2
  gpio/rockchip: fix get_direction value handling
  pinctrl/rockchip: add a queue for deferred pin output settings on
    probe
  gpio/rockchip: fetch deferred output settings on probe

 drivers/gpio/gpio-rockchip.c       | 26 +++++++++++-
 drivers/pinctrl/pinctrl-rockchip.c | 67 ++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h | 10 +++++
 3 files changed, 101 insertions(+), 2 deletions(-)

-- 
2.29.2

