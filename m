Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 012816403D1
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Dec 2022 10:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233156AbiLBJzF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Dec 2022 04:55:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233128AbiLBJzC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Dec 2022 04:55:02 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4502CB22D
        for <linux-gpio@vger.kernel.org>; Fri,  2 Dec 2022 01:55:00 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id z4so7017788wrr.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Dec 2022 01:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3XXGGy2Cr+s5WVEmSutsjX6ZwfS6xUvfx5zJegufWfU=;
        b=cskof/OK0kcidfcxoHHwUAuutIkHWGAS+bL7a2E6XnPyj2luXi0rN7mj2CJSmp4P92
         GJNseJ8wUcgcgDRbXWgU+luPNwQYP8LKL2sL1NstwRDtSiZ2oJUh8pQ1RoeCTruXk9v2
         3oDyMCovKBBqnmtkVwDlh4fvfbScTi/vZgJ8SjMup6NnvRzQFPosYeGNK1eiBSMLENqb
         so9EL2QdkHJ9nS622Ca3OshiAcFNQF1NsjzHqlVeB2A/BXQFm2xO9jE1h4FMc7IlC9Vt
         3w9XNZWdJ4w8TijovJS17fVP/xfD64a4L+5hGe1Y+ddS4LJfpZcKPJDvasPpFxNqkuGj
         c5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3XXGGy2Cr+s5WVEmSutsjX6ZwfS6xUvfx5zJegufWfU=;
        b=Bk4frM8A0VCamTxIA98bYmzArrjGdh2C3uYAA7PFMtPPFZeBIflYpwguvsR3N6hFCD
         m05yJT9sRh80hSX06AY7ELyWUGhakl+ZIrbuV6to+bcb6ossijslqF8vvHNHVapZtdOj
         o61tuIsrDSBFvyoKT+Ipx7oKNCgtFQa0Sqz5a1DueQJWrpbKTCfDqAe9BRqsehwy5fjk
         ii9CdD/HnxKMLW0xpQLPH6RR8CLXan2O3Dt3h5H8pvblhL4ECzW3O/Lvh3Zw+2kTOzfn
         /xhHU+uNKOm0uVErCy8q0rggDZZRya66hfvYXdNOSGIzhRTK9PUBwRTLM9xXWcSOlA//
         Eh4g==
X-Gm-Message-State: ANoB5plu45HJYX6A46rQ3H1eDLDnmoip/RIQXnmWEBZw5+9STDENrKP7
        1tdCv+QliChf28pw74rrGN0v9Q==
X-Google-Smtp-Source: AA0mqf4qcpIXcD++6X/tPUUgP9cNl56tZ6bFXsKiGMf3AjHue06X2msD8bKE7Kwxwbx7pRBEi1OQ8Q==
X-Received: by 2002:a5d:4dc5:0:b0:242:1d11:f990 with SMTP id f5-20020a5d4dc5000000b002421d11f990mr12798679wru.686.1669974899427;
        Fri, 02 Dec 2022 01:54:59 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:29a4:6f04:ddb1:1ed7])
        by smtp.gmail.com with ESMTPSA id l2-20020a5d6742000000b0024216d2e386sm6479215wrw.16.2022.12.02.01.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 01:54:58 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.1-rc8
Date:   Fri,  2 Dec 2022 10:54:55 +0100
Message-Id: <20221202095455.83356-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Here's the last round of fixes for the upcoming release. The two resource leak
fixes are self-explanatory. The two character device commits need some more
backstory:

I recently listened to Laurent Pinchart's talk from this year's LPC[1] where he
discussed an issue with many subsystems that export device nodes to user-space
where one can open the device file, unbind the underlying device from the
driver, then call any of the relevant system calls and observe the kernel crash
with a NULL-pointer derefence. 

I verified that the problem exists with the GPIO subsystem as well. The reason
for that is: when a GPIO chip is removed, we drop the chip's data from the
GPIO device and set the relevant pointer to NULL but don't check it in syscall
callbacks in the character device's code. That's fixed by the first patch.

However that fix alone leaves the character device vulnerable to a race
condition in which the GPIO chip is removed when a syscall is in progress.
To avoid that, we have a second fix that uses a lock to protect the device's
structure from being disabled before all syscall callbacks returned.

Laurent blamed the issue on devres but I believe the problem comes from the
fact that many driver developers are simply unaware that resources exported
to user-space need to survive the driver unbind and only be released when the
device's reference count goes down to 0. Devres' docs are pretty clear on that:
the resources get freed on driver unbind. Resources that should survive it,
must not be managed. This is however a topic for a separate discussion which
I intend to start soon.

Please pull,
Bartosz Golaszewski

[1] https://www.youtube.com/watch?v=kW8LHWlJPTU

The following changes since commit b7b275e60bcd5f89771e865a8239325f86d9927d:

  Linux 6.1-rc7 (2022-11-27 13:31:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.1-rc8

for you to fetch changes up to 98d8b93c617139aeaf745c1573c02d86830f25d1:

  gpiolib: protect the GPIO device against being dropped while in use by user-space (2022-12-01 19:17:47 +0100)

----------------------------------------------------------------
gpio fixes for v6.1-rc8

- fix a memory leak in gpiochip_setup_dev() in core gpiolib
- fix a reference leak in gpio-amd8111
- fix a problem with user-space being able to trigger a NULL-pointer
  dereference ovet the GPIO character device

----------------------------------------------------------------
Bartosz Golaszewski (2):
      gpiolib: cdev: fix NULL-pointer dereferences
      gpiolib: protect the GPIO device against being dropped while in use by user-space

Xiongfeng Wang (1):
      gpio: amd8111: Fix PCI device reference count leak

Zeng Heng (1):
      gpiolib: fix memory leak in gpiochip_setup_dev()

 drivers/gpio/gpio-amd8111.c |   4 +
 drivers/gpio/gpiolib-cdev.c | 193 +++++++++++++++++++++++++++++++++++++++-----
 drivers/gpio/gpiolib.c      |  46 +++++++----
 drivers/gpio/gpiolib.h      |   5 ++
 4 files changed, 210 insertions(+), 38 deletions(-)
