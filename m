Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD8226DA45
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 13:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgIQLco (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 07:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgIQLce (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Sep 2020 07:32:34 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E92C06174A
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 04:32:33 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id q9so1626256wmj.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2020 04:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OyjgDHFd6GeqkM02shT+PuujeVklIoYwB8IoJwNfdvI=;
        b=glIcVDbJf7tN51x+R+c8XyEWe7FdSfYYkfwFDSYJvrJiDwJ1SNfI7XWhHKwlDKwSu/
         ppnuwDzoePZYieV0LrIVubvP7hehXgiQJjmmRVbw8sBv2vifW/qKHYqvr9wPor1RSoFb
         5BH0RhAZLaBilX0iC51jqvygwe6PGWTtZpwdL7DmHpGvvNyTIf1etoScdlM7bK19V62t
         FTb2Vweg7NU8HD0wnSCYTMi87+qC4oxf3NCV4y3FtQVd4if0pQE4mS7IMbeyf/6PELCN
         T26T8KXcTw2F8uj1ZWZ30Ow0crJrljlyoWh3JC7yEndtZAPkauoMfmWrsvkKkeU77P0/
         nWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OyjgDHFd6GeqkM02shT+PuujeVklIoYwB8IoJwNfdvI=;
        b=aYQJpTb2twhiKqAjCpNpPyDPFzpsuAzjMoG20APfEjnMnHGL3PJpNcGiSy7LGuWxyA
         U8pwQ3UjoPyoem8AvyAlC82Zg+1gUkVViUloZ6vuItW+5e5iS4C4lcHNW2OHCWlAmo6n
         dF4/VuFjkIekOaeNxDqUbWSd6esUSMUnMVNwjrgukESX9ADmzdSxoYvYINTB1coHalkk
         8C+7zep4vzVC0vCXK7ZrNWn0wFrMBlAuqgxovdCAx3P6gcMB7YlYX2zNqOJAcuRfFitA
         aLVbh0uAHyn123nPMkQgXkGmRPLWAGKOUSaZrUYM+xPpFBDdxYuUi/lQIrnDhnx25p1L
         XBlA==
X-Gm-Message-State: AOAM531Z8b+1g3BlPrARAfbd2KHjXUPflUPy3Tc4eNqacT+auDdkklwc
        IR837ZzOK77acZlVGcFSI8Rieg==
X-Google-Smtp-Source: ABdhPJzU/gJ+R3Pr/XQFj0V18De4bPv+Qfv7M6nO5wJfBwfYTaN/BCt1u9JXK9KR7gZUThVB2eOlYQ==
X-Received: by 2002:a1c:b703:: with SMTP id h3mr9205853wmf.131.1600342352360;
        Thu, 17 Sep 2020 04:32:32 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id o4sm38386570wrv.86.2020.09.17.04.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 04:32:31 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: fixes for v5.9-rc6
Date:   Thu, 17 Sep 2020 13:32:27 +0200
Message-Id: <20200917113227.20704-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Linus,

please pull the following batch of fixes for the v5.9 release cycle.

Bartosz

The following changes since commit 5fcface659aab7eac4bd65dd116d98b8f7bb88d5:

  gpio: sprd: Clear interrupt when setting the type as edge (2020-08-31 18:06:28 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.9-rc6

for you to fetch changes up to 5ad284ab3a01e2d6a89be2a8663ae76f4e617549:

  gpiolib: Fix line event handling in syscall compatible mode (2020-09-17 12:03:37 +0200)

----------------------------------------------------------------
gpio fixes for v5.9-rc6

- fix the interrupt configuration in gpio-tc35894
- explicitly support only threaded irqs in gpio-siox
- fix a resource leak in error path in gpio-mockup
- fix line event handling in syscall compatible mode in GPIO chardev

----------------------------------------------------------------
Ahmad Fatoum (1):
      gpio: siox: explicitly support only threaded irqs

Andy Shevchenko (1):
      gpiolib: Fix line event handling in syscall compatible mode

Bartosz Golaszewski (1):
      gpio: mockup: fix resource leak in error path

dillon min (1):
      gpio: tc35894: fix up tc35894 interrupt configuration

 drivers/gpio/gpio-mockup.c  |  2 ++
 drivers/gpio/gpio-siox.c    |  1 +
 drivers/gpio/gpio-tc3589x.c |  2 +-
 drivers/gpio/gpiolib-cdev.c | 34 ++++++++++++++++++++++++++++++----
 4 files changed, 34 insertions(+), 5 deletions(-)
