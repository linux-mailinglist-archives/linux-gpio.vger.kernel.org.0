Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2532C584B9
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2019 16:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfF0OpH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 10:45:07 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45655 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726498AbfF0OpH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 10:45:07 -0400
Received: by mail-wr1-f68.google.com with SMTP id f9so2866240wre.12
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2019 07:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x8kEpDDiyoQQfqoIfxlk3XDbLqF5zKGQe12tuJLF760=;
        b=yQfgwU4mF8eYDOboPUbWVZUIuNMgNWr5lvj78HmA8NUVqL7x7+rBb06eJf+T5n95nB
         OdSO6yerX93YXlvqa8J3RruX6H0kiEbR/cDsPx5dhLg8usSqZpBxE9U+NfhvEvOQXsq2
         K3sJ7n/owpvEalRriHvSebpDlLImmo1w/1LcLkL4Cd9uYTnElrDIM5ZqPSWp/8P6Q0D9
         yfY/8KZ4qm4q8N88vbMTk91W0EiQVCdikPiJStWWW1Ndc7thlV54YMuYdmvYZbrUxTuz
         mQdHezmk0pHiPct/iHu9gfdOJ4DE1GB1cld3quzegUUKSgTiky6YdbYhJFM6WiHWtJmJ
         BMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x8kEpDDiyoQQfqoIfxlk3XDbLqF5zKGQe12tuJLF760=;
        b=dSQhsJkJUYi5tOdGLAn0lfBJYGwJFcQTxS3D7x5yuj69WyTMSd4g9rjfu8huzc/TaN
         4GHen9+gvXit9KUXz8mRr0tfbGNKYtqcjbn4Ap+Wml/bJELzpz7PgBy26zcey/ruus8b
         eJbSln9aRAs+4b4m3JA/vpYcOrx9TXVy3wp01HtyCUUXO1Lnb3EjS2k+UZvmjSaqArEo
         jKb7ta2qACNULZx1BYvDgAkXm+DZJYGpCtfmVK//QjC6RcinH45za/dwyHUPw4kA6dyD
         86WDlY8QfTWgQ9hKlwA7rcVhfV0kueeTKjCI/VgCa7iM+3/TJw8FwDqUt0UgYl2mYdHW
         GiYg==
X-Gm-Message-State: APjAAAUHEEYVvpgLTyVWQvkv2LS84S62wfdWKCxmO1dyC7WAAErrV+Mi
        /ooIFiPb1HHUQFOV1H/A0eZSuA==
X-Google-Smtp-Source: APXvYqyOUguRse92M16eu+FbLEW4RtzgWGhUV0jLBXtSAoN1d9rL1J8YkcGIkOMBbu2jJ0W9t37L+g==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr3803389wrn.281.1561646705232;
        Thu, 27 Jun 2019 07:45:05 -0700 (PDT)
Received: from debian-brgl.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j7sm3477632wru.54.2019.06.27.07.45.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 07:45:04 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.3
Date:   Thu, 27 Jun 2019 16:45:01 +0200
Message-Id: <20190627144501.11063-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Linus,

please pull the following patches I have in my tree for v5.3.

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.3-updates-for-linus

for you to fetch changes up to f360dcd4ef7fbaec774a64c54b402b4c8a4cffb2:

  gpio: mockup: no need to check return value of debugfs_create functions (2019-06-27 15:54:19 +0200)

----------------------------------------------------------------
gpio: updates for v5.3

- add include/linux/gpio.h to .gitignore in /tools
- improve and simplify code in the em driver
- simplify code in max732x by using devm helpers (including the new
  devm_i2c_new_dummy_device())
- fix SPDX header for madera
- remove checking of return values of debugfs routines in gpio-mockup

----------------------------------------------------------------
Bartosz Golaszewski (3):
      gpio: em: use the managed version of gpiochip_add_data()
      gpio: max732x: use i2c_new_dummy_device()
      gpio: max732x: use devm_gpiochip_add_data()

Charles Keepax (1):
      gpio: madera: Fixup SPDX headers

Geert Uytterhoeven (2):
      gpio: em: Remove error messages on out-of-memory conditions
      gpio: em: Return early on error in em_gio_probe()

Greg Kroah-Hartman (1):
      gpio: mockup: no need to check return value of debugfs_create functions

Kelsey Skunberg (1):
      tools: gpio: Add include/linux/gpio.h to .gitignore

 drivers/gpio/gpio-em.c      | 34 ++++++++++------------------------
 drivers/gpio/gpio-madera.c  |  6 +-----
 drivers/gpio/gpio-max732x.c | 45 ++++++++++++++++-----------------------------
 drivers/gpio/gpio-mockup.c  | 21 +++++----------------
 tools/gpio/.gitignore       |  2 +-
 5 files changed, 33 insertions(+), 75 deletions(-)
