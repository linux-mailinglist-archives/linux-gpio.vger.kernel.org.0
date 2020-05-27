Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D0E1E3DC7
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2020 11:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbgE0JnI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 05:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgE0JnH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2020 05:43:07 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DDFC061A0F
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 02:43:07 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id r15so2358540wmh.5
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2020 02:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9hMMpVF8hfH5g++2ej/MQ5G8qsXItcOYI6IEQOshvSU=;
        b=15caA7a/J1BKvQm0jV6wSj4kgrsaDTaZbgNg/P7qFypGE/KETNKDna0/J+jxTjIaKX
         /nBhcKnnwuxZaqFoq5vTrgj/1YFQXTv8vKQs4+LNKaslR0FNoc+NLsK0UZzAaozpKnW8
         4DBEDadbiAYUBAUjrk+fY/GoDtf5ump869CaSpv+jy8oEuRaHQL0H86i0KqYGv6bz9OF
         DnkCMdaXeUCxTHCvYL5KhKTe8MZaZVzEH94ch9g/0k1mI72NBOx/rTn5ibyTPbL1yc9I
         4lDVyxxTppQk9LBSsvdFkJYBAtIIffFIUptDyOdQ9uPG1vSSgVdmr7ws9CZ8VGRxXehw
         A0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9hMMpVF8hfH5g++2ej/MQ5G8qsXItcOYI6IEQOshvSU=;
        b=AT951NGXRNhbyY6lm5R8sHLhkakbL71azY9F/sKFdqen2VeM6NlQFeJvzqVT7cmaXl
         LmJCvNRQphDu/BHG5qxRsohJyZCAidruvSERVzYv6c5o1LOVQEb0e3neGasXSaXnbSZV
         g1GfhYQ7jI5y+KI1SFdAxoqFvrbzBtKjeS0ajT+JUFO6gRWCHWyGlKJBCMjoUFXWm35l
         OCZBVtHHnjbYRG93JZ4cKjm6K6Ikcb82aWJVX3bm/6U/2eiFdVIluPcuLcqeR9RTHuQ9
         t+C199yO9UOyoMLRScuoRnEfpCwQB1juhR0Jjb1xeymPSipTydGunkvV4nMEgKHAwg4I
         807A==
X-Gm-Message-State: AOAM530vYZv18CYBayjZjG+Jrj5DOfUi4VuBbZGEiYc8YeaDjCUrYd7r
        Lux7eExIyfcAIPaMGUO7SIZ4PA==
X-Google-Smtp-Source: ABdhPJzcaysFT7VvjHLUmv/qgkbHgT75ezn13cAoQE5YDYwhU0x0i9JEX0EvP3hLuM0xwN9yYGIUNA==
X-Received: by 2002:a1c:5541:: with SMTP id j62mr3281787wmb.64.1590572586062;
        Wed, 27 May 2020 02:43:06 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id 1sm2390343wmz.13.2020.05.27.02.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 02:43:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.8 - part 2
Date:   Wed, 27 May 2020 11:43:02 +0200
Message-Id: <20200527094302.6235-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Linus,

Here are the remaining patches I picked up for v5.8. Please pull.

Bartosz

The following changes since commit 3831c051dfbf58595085e432acc00ad4efcf54cc:

  tools: gpio: add bias flags to lsgpio (2020-05-05 18:27:09 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v5.8-part2

for you to fetch changes up to e33a58a29c6ad6f844cdc184210aa1feb5e2fbe0:

  gpio: pca935x: Allow IRQ support for driver built as a module (2020-05-25 11:37:56 +0200)

----------------------------------------------------------------
gpio: updates for v5.8 - part 2

- fix the initialization ordering in gpio-max730x
- make gpio-pxa buildable for compile testing
- make gpio-pca953x buildable as a module

----------------------------------------------------------------
Andy Shevchenko (1):
      gpio: pca935x: Allow IRQ support for driver built as a module

Rodrigo Alencar (1):
      gpio: max730x: bring gpiochip_add_data after port config

Tiezhu Yang (1):
      gpio: pxa: Add COMPILE_TEST support

 drivers/gpio/Kconfig        |  4 ++--
 drivers/gpio/gpio-max730x.c | 12 +++++-------
 2 files changed, 7 insertions(+), 9 deletions(-)
