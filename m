Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3910411E1E6
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 11:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfLMK0G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 05:26:06 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55073 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbfLMK0G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 05:26:06 -0500
Received: by mail-wm1-f65.google.com with SMTP id b19so1544474wmj.4
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 02:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ns3/Pi5XKOh0FdzyR1nuB6fVjBcSrec7EcMe8VGby3k=;
        b=Rt15V07KJmlSHo+5RWDNpaciEkyF/zD3/vFodC8WGn13zr5QgRBvWJ7q/7NbPkoWZu
         wRXY6PZQsHt+u9BC1XlDd8bKJhsorlx9Id0DPWrHGaqbKfncBUBBakD36ZNq/T24A6SV
         Nx+OUYusVLogvBTqbueWw5Ufdyf5cFcs1C0GM8m/id0gJtPCHIQQ0GdlEU6C+xlxEejR
         nlOxz1zqSQEUPO9v1cmOQY1XY3Bt/VAgz59rWAufDB7AsMaQeSqNGt295HyTrSwY1XSP
         xq4GG0qWZdHtJxNjOpHErCYsQ6Rdy/pm7KqoNXnoOrHqaqgjVLzDv4brJttOzXTUZybO
         UqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ns3/Pi5XKOh0FdzyR1nuB6fVjBcSrec7EcMe8VGby3k=;
        b=Wqx8Ai7NN00kSim0hnBiCvBjFUt+5xs2mASbFykDYji8z0oeN05a251FqOBIx7QcX2
         M8D57FzUDkVHeRzMR4baJ6Fsab7KfakxdbZKHMEW3/zJ8BxItSVwkaBtCXMZf1EFirUe
         6aOwdOlOrtxSRk7AsaY7cjtd6zXipjv1gNI7aoMMK57wui/Ui4ML05TpMvp74bQAiuoh
         25rr+8wv7oG+hOZGCXWgJaJvI+AQhSO2d0XQqAVyooHmEkckbBGwYimLosJJbORC72np
         rw0FRjgdSDDGqKcH075DEZebtP6RHPwfUKlYHVf15XdnbfcWVJFc3X2L82/3D5K1MXzQ
         m15Q==
X-Gm-Message-State: APjAAAVp48AjCMG/Ax2CPredOFIGZAXdFyJZrp8hrh0RMYdgwXhys6Si
        DgV3qE1rwbpff1MrIx1mzOQYYQ==
X-Google-Smtp-Source: APXvYqwSjrk8vqUlhmsmfXFfA7fNqcXrC5tu4UvdnO3VIOlFb0eatbV3ExltvUWLx9MuVAuPO6t8/A==
X-Received: by 2002:a7b:c10f:: with SMTP id w15mr3191130wmi.69.1576232764213;
        Fri, 13 Dec 2019 02:26:04 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id x10sm9418033wrv.60.2019.12.13.02.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 02:26:03 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.5-rc2
Date:   Fri, 13 Dec 2019 11:26:00 +0100
Message-Id: <20191213102600.12861-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

please pull the following fixes picked up since the merge window.

Bartosz

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.5-rc2-fixes-for-linus

for you to fetch changes up to 2688302bf1924ebccab2a3b298dd50b4f744d48d:

  gpio: pca953x: Switch to bitops in IRQ callbacks (2019-12-11 10:48:49 +0100)

----------------------------------------------------------------
gpio fixes for v5.5-rc2

- fix gpio-xtensa build failure
- fix a regression in gpio-mockup
- fix a gcc warning in gpio-aspeed
- fix a section mismatch problem in xgs-iproc
- fix a problem with emulated open-drain outputs in gpiolib core
- switch to bitops in gpio-pca953x after converting the driver to
  using bitmap
- add a missed file to MAINTAINERS entry

----------------------------------------------------------------
Andy Shevchenko (2):
      MAINTAINERS: Append missed file to the database
      gpio: pca953x: Switch to bitops in IRQ callbacks

Arnd Bergmann (2):
      gpio: aspeed: avoid return type warning
      gpio: xgs-iproc: remove __exit annotation for iproc_gpio_remove

Kent Gibson (1):
      gpio: mockup: Fix usage of new GPIO_LINE_DIRECTION

Max Filippov (1):
      gpio: xtensa: fix driver build

Russell King (1):
      gpiolib: fix up emulated open drain outputs

 MAINTAINERS                      |  1 +
 drivers/gpio/gpio-aspeed-sgpio.c |  2 +-
 drivers/gpio/gpio-mockup.c       |  7 +++++--
 drivers/gpio/gpio-pca953x.c      | 26 ++++++++++----------------
 drivers/gpio/gpio-xgs-iproc.c    |  2 +-
 drivers/gpio/gpio-xtensa.c       |  7 +++----
 drivers/gpio/gpiolib.c           |  8 ++++++++
 7 files changed, 29 insertions(+), 24 deletions(-)
