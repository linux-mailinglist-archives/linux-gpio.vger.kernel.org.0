Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 583E7A67FF
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2019 14:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbfICMCT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Sep 2019 08:02:19 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42827 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbfICMCT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Sep 2019 08:02:19 -0400
Received: by mail-wr1-f66.google.com with SMTP id b16so17162171wrq.9
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2019 05:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vDvNVSEQfxyPsOTRETdn1/7ddH0aEL19s1+a1DtNqk8=;
        b=i/Sun/KHt6IzDh0/nQYAtXEAtwZjEW1h8TY9G+2fABt9EOg0EK2mBmrrU+IByXTUAd
         FQSTnufY8c8Yvh6/1Fg8OZdl5E2XsnHHscgvoTnZfviKc9iSgw1a2rCn85Q3kTSzDyds
         13QSuhsCJHc2xJM8jqrJgt4H+Ho0MXA+zuJQ8k4qBnWwUg6u8MYS4tRmyddf+YUiLbk3
         5ymg17t1w/09NlyxptaaB18Ez3wyoXEM5DnH/OShaaF42HLqiAVdafrGgk66oWdPYI8t
         t1KiYYZ0D9BX3wBKbndF6vEA3NVrm7SIEpkYzs8VW6qdcBZ5UJKSRAZaQI4n80mPgRdc
         7X8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vDvNVSEQfxyPsOTRETdn1/7ddH0aEL19s1+a1DtNqk8=;
        b=TDQ/zA+HDdKrzyTPJq7YQ+eLzNAgdyb7jYF7Ak79f2DsNl8kJV0Ynp4725hhTi6mKe
         v5uZQuXSNjJHAeL315ObwEttaZ4mkTybPwyesni6BovNnYPi95f7Ktrmvev45BYKIV0d
         hre0N+qx4kRulUYrs3ypGeHRL60lt3xdb09yQqd7joFmyX8NPkLPeZKtQAvWPuvteTDJ
         d22x0oyZgFqQja/5N5xHIv2e9zpJr7PyC6LTcm2Vo5GvuNjiQ4wKsve4Ch+InFZN4Apo
         kipyAeZDwp1JM5EKj8u728dlBt1CEjVi7jKp6dw+/K4P1F5L5JtIbANF2AgpJTyqctQS
         bEhQ==
X-Gm-Message-State: APjAAAWVx5V4LJsP3sRz2Nsx/R+s5EbFUyjXZdUrvoVC7U+m7zLqSVL9
        X4R+IlLDVK+MtuaKozXlfysf5MlZoPY=
X-Google-Smtp-Source: APXvYqziPzppD6VL5U2OKJrKgYhTDEJWlIc2LB67FUlc+nCqmjMsAzLeNVzW/uz3DsR6fLnB4LGjnQ==
X-Received: by 2002:a05:6000:49:: with SMTP id k9mr16560701wrx.21.1567512137200;
        Tue, 03 Sep 2019 05:02:17 -0700 (PDT)
Received: from debian-brgl.home (lfbn-1-7087-108.w90-116.abo.wanadoo.fr. [90.116.255.108])
        by smtp.gmail.com with ESMTPSA id u6sm17029173wrr.26.2019.09.03.05.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 05:02:16 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.4
Date:   Tue,  3 Sep 2019 14:02:14 +0200
Message-Id: <20190903120214.16375-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.4-updates-for-linus

for you to fetch changes up to f2ee73147a3f23cc4b032a76b5677b4b8441ba74:

  gpio: lpc32xx: allow building on non-lpc32xx targets (2019-08-12 09:10:00 +0200)

----------------------------------------------------------------
gpio: updates for v5.4

- use a helper variable for &pdev->dev in gpio-em
- tweak the ifdefs in GPIO headers
- fix function links in HTML docs
- remove an unneeded error message from ixp4xx
- use the optional clk_get in gpio-mxc instead of checking the return value
- a couple improvements in pca953x
- allow to build gpio-lpc32xx on non-lpc32xx targets

----------------------------------------------------------------
Andy Shevchenko (4):
      gpio: pca953x: Switch to use device_get_match_data()
      gpio: pca953x: Use GENMASK() consistently
      gpio: pca953x: Remove explicit comparison with 0
      gpio: pca953x: Drop %s for constant string literals

Anson Huang (1):
      gpio: mxc: Use devm_clk_get_optional instead of devm_clk_get

Arnd Bergmann (1):
      gpio: lpc32xx: allow building on non-lpc32xx targets

Bartosz Golaszewski (1):
      gpio: em: use a helper variable for &pdev->dev

Ding Xiang (1):
      gpio: ixp4xx: remove redundant dev_err message

Jeremy Cline (1):
      Documentation: gpio: fix function links in the HTML docs

Masahiro Yamada (1):
      gpio: remove less important #ifdef around declarations

 Documentation/driver-api/gpio/driver.rst |  16 ++---
 arch/arm/configs/lpc32xx_defconfig       |   1 +
 drivers/gpio/Kconfig                     |   7 ++
 drivers/gpio/Makefile                    |   2 +-
 drivers/gpio/gpio-em.c                   |  37 +++++-----
 drivers/gpio/gpio-ixp4xx.c               |   4 +-
 drivers/gpio/gpio-lpc32xx.c              | 118 ++++++++++++++++++-------------
 drivers/gpio/gpio-mxc.c                  |   9 +--
 drivers/gpio/gpio-pca953x.c              |  70 +++++++++---------
 include/linux/gpio/driver.h              |  27 +++----
 10 files changed, 149 insertions(+), 142 deletions(-)
