Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D2B21C80F
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jul 2020 10:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbgGLIZl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 12 Jul 2020 04:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgGLIZl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Jul 2020 04:25:41 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCDC5C061794
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2020 01:25:40 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g75so10248518wme.5
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jul 2020 01:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UcUxZUmBfsFjeEl1SwZiuUNXbzI40SK+PUAcakJbZOs=;
        b=yW+5QrueqqjUaS0X9APtQTCpUIuYiolkmlW+LfodUxFDzzi801vGTygikrXIpp7dk1
         d3TbJ9XbugxLGKm4a3r3/bspr3ayZBeyMCudoJpigAotCDwW5lbvsBSbGeBp0dbPKgLz
         ObrVmhCOd3Cgx8ZHGperSbISJw8F3tRHWdsvI/mAq4cWvOrVPXo3/WpMta/NuHNlCGu3
         H8X3C0eqklvzsf+4Xzkw8zx2FUFsQFNhPig06DjwbgYoho5/y3806EpsjQivH7txVfZO
         0euZUgxn/55oEdX30sjddNuU8BokFR/bb0KKLlT2fBWLO9Gjp2FXoHLDV73rcx3soYKd
         63+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UcUxZUmBfsFjeEl1SwZiuUNXbzI40SK+PUAcakJbZOs=;
        b=qOe7iS/ZD1u/NScX6Dhh+aNdYCImcV7CHKzLkVprMTXUxLBgd1HQXz/Q1KED9M/2rb
         z7TcURfCWLkqmvsJiswuV6foUwbAd4ZxDYVyu/Ndfyk65LM8wWJNpIA1n09mtpxH6Jkj
         6EpTbv7djRUP2O/v7RF6fUZp1BkZV9wtQuqyjv5Zjo6tb2Qodywn8Psxcaq8dB7RNLYp
         HGVTC26k9yKCAGt0IXpIj8ZJMP++rCLbWB54duLCuy5WYUmB6GC0oEd3IxZAOdkzS19q
         0BvhxMVBqQ/HPqXtp782TVp5eEzzcpsvJ2+IYbo6aJGmllpvU8Dn9w90G3PU7kRMQom9
         m/Fg==
X-Gm-Message-State: AOAM533wXqp+IpCuIYcP5Fp2AUnUmCIEsGhw2wCWxkA9NTm3UzjEzj7Y
        PfHJxdkIENAKWUVLPOj0Cj9Uy+LdG9M=
X-Google-Smtp-Source: ABdhPJxcD7mJmvp8Yrw/ZQ4E5GJgoD7Oj/730uVsB2VwEJ2Bew2VINxGP1uvthlodCkw4DUGKGWmKg==
X-Received: by 2002:a1c:7311:: with SMTP id d17mr13203574wmb.60.1594542338240;
        Sun, 12 Jul 2020 01:25:38 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id j75sm7123353wrj.22.2020.07.12.01.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2020 01:25:37 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [GIT PULL] gpio: updates for v5.9 - part 2
Date:   Sun, 12 Jul 2020 10:25:29 +0200
Message-Id: <20200712082529.21023-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Linus,

please pull the following set of changes from Kent introducing a lot
of improvements to the character device code. These are non-controversial
changes before the V2 uAPI.

Best regards,
Bartosz

The following changes since commit 4672a4a9fbfe316e1153682b0790af6446255a50:

  Merge branch 'devel' into for-next (2020-07-09 17:06:28 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-updates-for-v5.9-part2

for you to fetch changes up to df51f402e3b15b00284309bd3016bb4536d2260c:

  tools: gpio: fix spurious close warning in gpio-event-mon (2020-07-12 10:22:01 +0200)

----------------------------------------------------------------
gpio updates for v5.9 - part 2

- several improvements and minor tweaks to the GPIO character device code

----------------------------------------------------------------
Kent Gibson (17):
      gpiolib: move gpiolib-sysfs function declarations into their own header
      gpiolib: cdev: sort includes
      gpiolib: cdev: minor indentation fixes
      gpiolib: cdev: refactor gpiohandle_flags_to_desc_flags
      gpiolib: cdev: rename 'filep' and 'filp' to 'file' to be consistent with other use
      gpiolib: cdev: rename numdescs to num_descs
      gpiolib: cdev: remove pointless decrement of i
      gpiolib: cdev: use blocking notifier call chain instead of atomic
      gpiolib: cdev: rename priv to cdev
      gpiolib: cdev: fix minor race in GET_LINEINFO_WATCH
      gpiolib: cdev: remove recalculation of offset
      gpiolib: cdev: refactor linehandle cleanup into linehandle_free
      gpiolib: cdev: refactor lineevent cleanup into lineevent_free
      gpio: uapi: fix misplaced comment line
      tools: gpio: fix spurious close warning in lsgpio
      tools: gpio: fix spurious close warning in gpio-utils
      tools: gpio: fix spurious close warning in gpio-event-mon

 drivers/gpio/gpiolib-cdev.c  | 385 ++++++++++++++++++++-----------------------
 drivers/gpio/gpiolib-sysfs.c |   1 +
 drivers/gpio/gpiolib-sysfs.h |  24 +++
 drivers/gpio/gpiolib.c       |  15 +-
 drivers/gpio/gpiolib.h       |  20 +--
 include/uapi/linux/gpio.h    |   2 +-
 tools/gpio/gpio-event-mon.c  |   3 +-
 tools/gpio/gpio-utils.c      |   4 +-
 tools/gpio/lsgpio.c          |   3 +-
 9 files changed, 217 insertions(+), 240 deletions(-)
 create mode 100644 drivers/gpio/gpiolib-sysfs.h
