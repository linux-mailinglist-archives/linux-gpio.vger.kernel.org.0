Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6242664176F
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Dec 2022 16:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiLCPFq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Dec 2022 10:05:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiLCPFp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Dec 2022 10:05:45 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C62C2180D
        for <linux-gpio@vger.kernel.org>; Sat,  3 Dec 2022 07:05:44 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id h11so12141669wrw.13
        for <linux-gpio@vger.kernel.org>; Sat, 03 Dec 2022 07:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z5m1n5zwZkdaEw92jbiAEE+AtzglWpi155V/SqU625A=;
        b=79UI45HwVX+xpL7pA/erF8ClVSl6Fzkmfn8ZdtGP4sC7E83KTU6sgdSwvlLGa8bSMw
         Srxnln2mtZfXc00pgCjg6nHRJgASYUzgp/GlRXjGHSXe8UB1hKjTOV6sN6RCfBflLy0k
         bAEdi5aAmTVAVMDCLVsSryO8f1S6uMKqcZNeV9KoviHXj0eyQA5AhdS9YtHaWfz5Bzrh
         nsGxd+2GxqjPojjs1zaftz9h8g4zVc+aYw5nUYSk8lrkET4cT/cCcf6+Ca819ImGAi4w
         93koZb9nVvXAC5ochVLwoMwn0fd3LyxtILulrsREdtweGBJegb1y/SiBWPBo2E8coB3I
         DGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5m1n5zwZkdaEw92jbiAEE+AtzglWpi155V/SqU625A=;
        b=4r5JG01s3VlBHms1LDk5RHdsZg7TzWzvD1/64gXINd0vLYgibxezr5fYTb+L2SIe/Y
         pGFdmm7aDAW6YaCXGN64m6f5+0sIQMFZemV68GnGFYZpuGCs+NmOrvMzwtrYCscXKeSL
         s+Nrlw/wm9OzwfnG3v7wB7lx4r/24yt7ZlUDzrxtWS4mVo2w/6zRsMVamtB7fHoPxTPH
         Lc8SKRlvQ/cxaZALOR3xmv/0ZwmBDnHJecjymhqin6/j8e/Vq0WYN0pEEf7ldOCqsm2M
         ddx9vn624ReL7im2RRuuRD/qchEyv3WLdEz+nIbkCdHaPz1NEV1ZzdBbX75cko6U6X98
         P2FA==
X-Gm-Message-State: ANoB5pk+6N3uEGT9Zau0l3geOAUwsGV1O1N48QT38FX9LKgmHAUtoN7l
        FwEGZU+NH2/Ez4HY0ICyK+jjuw==
X-Google-Smtp-Source: AA0mqf4bNG6vDEh7ajaRWblI01NTtxxaWoAjYKj8S+rKzMXiM5v2oj1GXew0HqFkHgdIlV+e4nyqzw==
X-Received: by 2002:adf:d847:0:b0:242:e13:44c2 with SMTP id k7-20020adfd847000000b002420e1344c2mr20222540wrl.529.1670079942459;
        Sat, 03 Dec 2022 07:05:42 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:873f:3a1a:a321:43a])
        by smtp.gmail.com with ESMTPSA id w6-20020adfec46000000b0022efc4322a9sm10047581wrn.10.2022.12.03.07.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 07:05:42 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.1-rc8 - take 2
Date:   Sat,  3 Dec 2022 16:05:39 +0100
Message-Id: <20221203150539.11483-1-brgl@bgdev.pl>
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

Here's a fixed PR from the GPIO subsystem for the next rc.

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

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.1-rc8-take-2

for you to fetch changes up to 450571883735e9a7c3b38691225531d54773e9a2:

  gpiolib: protect the GPIO device against being dropped while in use by user-space (2022-12-02 17:01:37 +0100)

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
 drivers/gpio/gpiolib-cdev.c | 207 ++++++++++++++++++++++++++++++++++++++------
 drivers/gpio/gpiolib.c      |  46 ++++++----
 drivers/gpio/gpiolib.h      |   5 ++
 4 files changed, 221 insertions(+), 41 deletions(-)
