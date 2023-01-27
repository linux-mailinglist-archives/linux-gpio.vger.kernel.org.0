Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 481AA67EEC8
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 20:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbjA0TvW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 14:51:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232910AbjA0TvA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 14:51:00 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8472A8BB92
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 11:48:28 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id j17so4203883wms.0
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 11:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YTYaopmSCoO7wkFabU0XoJnQL72EQS08UD4h8OBJEFs=;
        b=mwXBj290UpZmfFedVVSw/EL8M1kwVsEYqBlkiGu2RyrW2g3fjb7qloK6iRjrS9mXL6
         txT1Wx/z0bO4w2CHl112vOvMjXUKNgrSNMCDolfNnM0P6N9mG9oPTy3fjgF7Sue81q8H
         Nq1vfT9hqHOkBj4zkGccnFP3oAljrN4/GGa5087i4mlHBE3O1CSHIbkKSPNzd5wcHZTs
         +wyq1Nt7CLlwTJhXWYYJnBYuOn4dVU4O0ABheBMzp+r0zqOgHK2fqcBTK0185epoRqzI
         ynmJb46K3D63IO9g0wGh29tti+Ej67TIwAkgUWvbYLDi17c4hJQshlHIs1gNWQUx5aZ1
         USzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTYaopmSCoO7wkFabU0XoJnQL72EQS08UD4h8OBJEFs=;
        b=r9A65cYUBTzUA59cB1Nq8oyLAXbcwpNMktyGXcK9d3o/9dc0MCJtZyHkzlrWJMtHYD
         EuPscujzXv9UTO7vGjymn8aJLa0ZeyPIzxW66kDEMi9dMj8kvALy4n0GJC2gcc9HxsFg
         mX+hfWvUTw7/EUG5rPgRoVj66TaeplonR9wrlmnspaTa8uMaQYM0nSVPVj5cv/RFRH29
         R0Ezhm1DGe5xkCkqmTDhjZa3TQY+RCse01WjngQcb+igPCtiihd1+X5f/SGES+6ce0pz
         sF+whDNvtDy758aJTK2sUEucKWltgS1uKQuW3cujaGn+YTHyJvXVmgw+7SvKL6y1WXmO
         AzUg==
X-Gm-Message-State: AFqh2kr1OzHdf1yjF9dweWocNWVyMdjWm3D+CzU84KN6cUYgn7AuGmAY
        IlyxwzFknXGkhyPpd+unTqV1/pIEhp7a4KDN
X-Google-Smtp-Source: AMrXdXs0btc20so7Ur4cWanYz56d0n77oqnKmBtU20pjhSB9RjJgFo8WuZfPtKl1LKQOjD+hNy3FqA==
X-Received: by 2002:a05:600c:5116:b0:3db:1a8:c041 with SMTP id o22-20020a05600c511600b003db01a8c041mr40789885wms.17.1674848830637;
        Fri, 27 Jan 2023 11:47:10 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:624:f1a4:edb9:78d5])
        by smtp.gmail.com with ESMTPSA id j38-20020a05600c1c2600b003daff80f16esm12127922wms.27.2023.01.27.11.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 11:47:10 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.2-rc6
Date:   Fri, 27 Jan 2023 20:47:07 +0100
Message-Id: <20230127194707.311571-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following set of fixes from the GPIO subsystem for the next
release candidate. Details are in the signed tag.

Best Regards,
Bartosz Golaszewski

The following changes since commit 2241ab53cbb5cdb08a6b2d4688feb13971058f65:

  Linux 6.2-rc5 (2023-01-21 16:27:01 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.2-rc6

for you to fetch changes up to 677d85e1a1ee69fa05ccea83847309484be3781c:

  tools: gpio: fix -c option of gpio-event-mon (2023-01-27 14:05:46 +0100)

----------------------------------------------------------------
gpio fixes for v6.2-rc6

- fix the -c option in the gpio-event-mode user-space example program
- fix the irq number translation in gpio-ep93xx and make its irqchip immutable
- add a missing spin_unlock in error path in gpio-mxc
- fix a suspend breakage on System76 and Lenovo Gen2a introduced in GPIO ACPI

----------------------------------------------------------------
Arnd Bergmann (1):
      gpio: ep93xx: remove unused variable

Dan Carpenter (1):
      gpio: mxc: Unlock on error path in mxc_flip_edge()

Ivo Borisov Shopov (1):
      tools: gpio: fix -c option of gpio-event-mon

Mario Limonciello (1):
      gpiolib-acpi: Don't set GPIOs for wakeup in S3 mode

Nikita Shubin (2):
      gpio: ep93xx: Fix port F hwirq numbers in handler
      gpio: ep93xx: Make irqchip immutable

 drivers/gpio/gpio-ep93xx.c  | 38 ++++++++++++++++++++++----------------
 drivers/gpio/gpio-mxc.c     |  3 ++-
 drivers/gpio/gpiolib-acpi.c |  3 ++-
 tools/gpio/gpio-event-mon.c |  1 +
 4 files changed, 27 insertions(+), 18 deletions(-)
