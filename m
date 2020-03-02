Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D477D175541
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 09:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgCBILr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 03:11:47 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43954 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbgCBILr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2020 03:11:47 -0500
Received: by mail-wr1-f66.google.com with SMTP id e10so9830898wrr.10
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2020 00:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UQw86S1tVEkHbbNqhDwMeS+6OdiNe3eQ7X1qtLZeyJY=;
        b=hWp7WIH4DFkyP0pGhwJyJ4FTjSJHmy1PuGQEp29qKht0lz+m/HVl4vBhcAEI0jD+fq
         L+lwHFsrim+iEpBFUtwllE/4BXZg31wGO5bUAZ3wT5A8zLIkq9J8RNGiqCmJxu+nzFwV
         jKwmMT8bboYxDJiiJArxcsU5i9otQQ6E92Lgbon6yVELVgkjRdCQsK1Y8huC0hq9uRye
         VVp1UrJXjQI1gh7IRlyKo8kFarVY2254PlacNqaiaJ/ZmyFyI7NwIQRlIWYgzYZrSqCU
         lBBr0+f5V2rUyJ5GokEbtZS1nqI5cxJonJoumbKFOfnVX2pACh8nEsQ1+Qo4Ccxrs8uG
         2g0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UQw86S1tVEkHbbNqhDwMeS+6OdiNe3eQ7X1qtLZeyJY=;
        b=aPjetvKwJIjVLb1Fn6cC4gX28X2XwkSNaPoSYSeCBcS0/zPbkQhtYd42c4f4eFBeTn
         Fk3GMcyX367+V4huGENZBwGwDYU4QGj5u+2vDSFPg/Nufw39UoEJl7f8oP5x20/cuBNd
         0lDL+uwfD4rOT6vWY8R7ssIoLNAiNTvrSINF9WtASSt9E8hilJvbmAGeU8xtnTvDNbfV
         aal6///noOZekilNcRI9wj4711pDWA+Ivz2tKZWC1GKQ6S3zkMrO7tDirgB7evl+wjAh
         C27ELq/uUpEeDhnufZ5V9E9x1nHoX6LrTs7BXR5CyGFeKfo/ZU3oNKCuKFNsYC+pAWtQ
         HLaw==
X-Gm-Message-State: APjAAAWysHgtsrlHMruwQgoNwf6O/Nqmv6XH7l9iTKWbJh8EjyYkTQPv
        EA5tmZXsmvGhNaOeE5UGlT4Myg==
X-Google-Smtp-Source: APXvYqwFmXFiwWjb+vkBLMxV+wgVJCg7aXj7SnH750dymTOApTIvW/XO2Ry1xLDlMMyVZeGqEEDzhA==
X-Received: by 2002:adf:dc86:: with SMTP id r6mr21129425wrj.68.1583136705518;
        Mon, 02 Mar 2020 00:11:45 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id 12sm14212600wmo.30.2020.03.02.00.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 00:11:44 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.7 part2
Date:   Mon,  2 Mar 2020 09:11:42 +0100
Message-Id: <20200302081142.8599-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

this is the second batch of updates for v5.7. It contains two minor tweaks
to core gpiolib and two fixes for the line watch/unwatch ioctl().

The following changes since commit 869233f81337bfb33c79f1e7539147d52c0ba383:

  gpiolib: Optimize gpiochip_remove() when check for requested line (2020-02-28 23:58:56 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.7-part2

for you to fetch changes up to 1931479788c5e3c0396a0bde3606e517c64b9f95:

  gpiolib: fix bitmap operations related to line event watching (2020-03-02 08:52:55 +0100)

----------------------------------------------------------------
gpio updates for v5.7 part 2

- replace z zero-length array with flexible-array member in gpio-uniphier
- make naming of variables consistent in uapi line event code
- fix the behavior of line watch/unwatch ioctl()

----------------------------------------------------------------
Andy Shevchenko (1):
      gpiolib: Rename 'event' to 'ge' to be consistent with other use

Bartosz Golaszewski (1):
      gpiolib: fix bitmap operations related to line event watching

Gustavo A. R. Silva (1):
      gpio: uniphier: Replace zero-length array with flexible-array member

Kent Gibson (1):
      gpiolib: fix unwatch ioctl()

 drivers/gpio/gpio-uniphier.c |  2 +-
 drivers/gpio/gpiolib.c       | 18 +++++++++---------
 2 files changed, 10 insertions(+), 10 deletions(-)
