Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFE2686C0
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2019 12:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729677AbfGOJ7O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jul 2019 05:59:14 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53739 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729530AbfGOJ7O (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jul 2019 05:59:14 -0400
Received: by mail-wm1-f65.google.com with SMTP id x15so14501238wmj.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jul 2019 02:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2e/wLwq5Lk0kf2kEMFI361/fKhEpLKFsN/rps+EgQI8=;
        b=jxfuL39xYH4sg/nV7kzOHK0UHef733JBFRh1yL+vADGbdA5wXr8ht/gYvQsFesXM6y
         j/PX+emqZzzFgnwfUFoGyGZ7WRi7gomPeX3jW3ZaYCjLCFBHD3YEgHt85TOh19s8Ccnx
         4qExG1U+yMn9hkzy4j7oHMo/VfJsUNa/4QznzZMl47RNVIvqx6N0xvOoeb5qEfHZ+kPp
         08Fwl4Pbg8H3lqUNOWVUYps5GwJpgi8RNp37nC7I0H3RHzdK0k5sWa4Js5YVovJfvqLj
         jLk4QsBYUMlDEN9A2VcVIHctjA+lqmwjyBLFOlkIaXzQ7OCRqhuRN5tHJwQIAQiZmEIz
         OQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2e/wLwq5Lk0kf2kEMFI361/fKhEpLKFsN/rps+EgQI8=;
        b=mmyGJZ9w3KNvQxdTx0gfJKGSM6b8ReQ1ZoI5L66ZgTO0tkxGLoY8FQmhaqQCcwS5KK
         GkGseo6bttBT/PoTAvgoS51lwOBgZ6J4sGCDypxwqW0/mdCpwdvd/dKcEU1k+IqgoxKU
         zH6h/2XXBwhnYKDjzv+C36kfJCmed1SkLLnEd8T5vNjTvYOPgdM4nY86kcNIAhaDW8OO
         uh5Il6OD/IO5q/UaVntvKx1AdtcHIchFXVYidfwRzkCE2f1qebblSv61bJ9mGs/oowyl
         0Emn62FhZpkfI1LIxvx7NZjdMZP2mZGsAfP/eD3mpLUzHn8daGuIJp9IGg4/mXSovTIb
         p+sw==
X-Gm-Message-State: APjAAAUhvQhYTfCshJhlYBMxeltc12ZMeKqKAGq9W0MuJdtXB17C7Lfk
        rRSYcOe78BOZVV6Nz6tTC4o=
X-Google-Smtp-Source: APXvYqy4rFu76AlCvFE/RfiLZp6TTrOjzIA9sSiKL2GPumAuNoJmXNBJF+7toGnsu7oKO7UecdPEgw==
X-Received: by 2002:a05:600c:22ce:: with SMTP id 14mr24319237wmg.27.1563184752151;
        Mon, 15 Jul 2019 02:59:12 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id j9sm14737110wrn.81.2019.07.15.02.59.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 02:59:11 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio fixes for v5.3-rc1
Date:   Mon, 15 Jul 2019 11:59:03 +0200
Message-Id: <20190715095903.18307-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Linus,

please pull the following fixes applied to my tree during this merge window.

The following changes since commit fec88ab0af9706b2201e5daf377c5031c62d11f7:

  Merge tag 'for-linus-hmm' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma (2019-07-14 19:42:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.3-rc1-fixes-for-linus

for you to fetch changes up to 19ec11a2233d24a7811836fa735203aaccf95a23:

  gpio: em: remove the gpiochip before removing the irq domain (2019-07-15 11:52:42 +0200)

----------------------------------------------------------------
GPIO fixes for v5.3-rc1

- silence error messages on probe deferral in gpio-davinci
- fix a memory leak in gpiolib-of
- fix a potential use-after-free error in gpio-em

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: em: remove the gpiochip before removing the irq domain

Keerthy (1):
      gpio: davinci: silence error prints in case of EPROBE_DEFER

Nishka Dasgupta (1):
      gpiolib: of: fix a memory leak in of_gpio_flags_quirks()

 drivers/gpio/gpio-davinci.c |  5 +++--
 drivers/gpio/gpio-em.c      | 33 +++++++++++++++------------------
 drivers/gpio/gpiolib-of.c   |  1 +
 3 files changed, 19 insertions(+), 20 deletions(-)
