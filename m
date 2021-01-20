Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C9E2FD1D2
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jan 2021 14:55:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730829AbhATNaX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 08:30:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:54870 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389682AbhATNVb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Jan 2021 08:21:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F5862336D;
        Wed, 20 Jan 2021 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611148850;
        bh=PR/kVFx/sCLW3origvXu1t632FYIhuBFrmGGZ+ULzk8=;
        h=From:To:Cc:Subject:Date:From;
        b=F6YZTtfUUmHAztlOGPcYKFEY/Ee9qTjY6YExXOLs2vu7HCFU7lMK8Pt7DiZQ9v1jh
         EMNu21/V7uEsCmaVYEkVq5Oa7YyXoW/sVMfRoiuCVFUl8rcjIZXbJ1A6STvoS+STzB
         8Z5JqL0udowVjb4c7zoU3AwSjxEWAD0BOr2bYrRnDWGwiNJzDaZCQlLATUm84lvcrm
         Y+MWPGOyn6SsMP769+HbFfrHdm4N3HNkQ/aUoH851RZYdOV9p5Wn1SicJeGitQwu91
         UCMYP5brEOK+MMXsr7c70qu3jEWN5DcFTZS/3WxfA2IjL8hbdGYvT+fsnEVx1pFjEj
         TYzi/W93xFK7A==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/5] pinctrl/gpio: remove obsolete drivers
Date:   Wed, 20 Jan 2021 14:20:40 +0100
Message-Id: <20210120132045.2127659-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

A few Arm platforms are getting removed in v5.12, this removes
the corresponding gpio and pinctrl drivers.

Link: https://lore.kernel.org/linux-arm-kernel/20210120124812.2800027-1-arnd@kernel.org/T/

Arnd Bergmann (5):
  gpio: remove zte zx driver
  pinctrl: remove zte zx driver
  pinctrl: remove sirf atlas/prima drivers
  pinctrl: remove coh901 driver
  pinctrl: remove ste u300 driver

 .../devicetree/bindings/gpio/gpio-atlas7.txt  |   50 -
 .../bindings/gpio/gpio-stericsson-coh901.txt  |    7 -
 .../bindings/gpio/zx296702-gpio.txt           |   24 -
 .../bindings/pinctrl/pinctrl-atlas7.txt       |  109 -
 .../bindings/pinctrl/pinctrl-zx.txt           |   84 -
 drivers/gpio/Kconfig                          |    7 -
 drivers/gpio/Makefile                         |    1 -
 drivers/gpio/gpio-zx.c                        |  289 -
 drivers/pinctrl/Kconfig                       |   25 -
 drivers/pinctrl/Makefile                      |    4 -
 drivers/pinctrl/pinctrl-coh901.c              |  774 ---
 drivers/pinctrl/pinctrl-coh901.h              |    6 -
 drivers/pinctrl/pinctrl-u300.c                | 1111 ---
 drivers/pinctrl/sirf/Makefile                 |    7 -
 drivers/pinctrl/sirf/pinctrl-atlas6.c         | 1137 ---
 drivers/pinctrl/sirf/pinctrl-atlas7.c         | 6157 -----------------
 drivers/pinctrl/sirf/pinctrl-prima2.c         | 1131 ---
 drivers/pinctrl/sirf/pinctrl-sirf.c           |  894 ---
 drivers/pinctrl/sirf/pinctrl-sirf.h           |  116 -
 drivers/pinctrl/zte/Kconfig                   |   14 -
 drivers/pinctrl/zte/Makefile                  |    3 -
 drivers/pinctrl/zte/pinctrl-zx.c              |  445 --
 drivers/pinctrl/zte/pinctrl-zx.h              |  102 -
 drivers/pinctrl/zte/pinctrl-zx296718.c        | 1024 ---
 24 files changed, 13521 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-atlas7.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-stericsson-coh901.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/zx296702-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-atlas7.txt
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-zx.txt
 delete mode 100644 drivers/gpio/gpio-zx.c
 delete mode 100644 drivers/pinctrl/pinctrl-coh901.c
 delete mode 100644 drivers/pinctrl/pinctrl-coh901.h
 delete mode 100644 drivers/pinctrl/pinctrl-u300.c
 delete mode 100644 drivers/pinctrl/sirf/Makefile
 delete mode 100644 drivers/pinctrl/sirf/pinctrl-atlas6.c
 delete mode 100644 drivers/pinctrl/sirf/pinctrl-atlas7.c
 delete mode 100644 drivers/pinctrl/sirf/pinctrl-prima2.c
 delete mode 100644 drivers/pinctrl/sirf/pinctrl-sirf.c
 delete mode 100644 drivers/pinctrl/sirf/pinctrl-sirf.h
 delete mode 100644 drivers/pinctrl/zte/Kconfig
 delete mode 100644 drivers/pinctrl/zte/Makefile
 delete mode 100644 drivers/pinctrl/zte/pinctrl-zx.c
 delete mode 100644 drivers/pinctrl/zte/pinctrl-zx.h
 delete mode 100644 drivers/pinctrl/zte/pinctrl-zx296718.c

-- 
2.29.2

