Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 651FA642899
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 13:39:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231834AbiLEMjL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 07:39:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231826AbiLEMjK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 07:39:10 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B4811829
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 04:39:07 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id n7so8611141wms.3
        for <linux-gpio@vger.kernel.org>; Mon, 05 Dec 2022 04:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5fFt2e263Kn4Dz8SXbznC3t+FU8IUWkyVmFjizzIjuU=;
        b=uaJgNHk6fHAIVN5ztIuFRCMCN+QNnrIKZ5oGAK8z3b0wUSOA0Hg3vJ477oHnWkTRtp
         FSKTL7zFLVRa6jDNklT2wBmrhR7+lP21a7HbooDWBf4A2RtRjCrPQBhJZ1a/zJhFMAgA
         M1wggNPqJQHYzIeOZ8PfTULTuxPGuSQIVAGrG+61JV5BBq2CzHmXKOO3CdKOdG31j4gx
         2nUGAZ1tt0vg7YMI4LrWhPV/FeHzGNFx3M1Y1ikuoUr+FuLBKOohU5vYdUNDO0hu9FZP
         FifqmUEry3zID6bvrcQfB4uAfmS8CSvzmZkpmXH/pReCTfx0AHEXObfDsjmrw5FW50TS
         Pw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5fFt2e263Kn4Dz8SXbznC3t+FU8IUWkyVmFjizzIjuU=;
        b=y1PYxxBIAMvcPt4CWJHgpDccqoi/7jOyVGwoJ8tolj7a9PtA3lKxjePGGgZ5g35iKr
         D1GMJ0xfzDdQUTyGlLpQIc6qukInYofbs11A+/pNY0Ag6dT2FaEwWxzFYSku9xG1bUzZ
         hbmrnokFSIbKaDic4NiOWu9KxmO3Srzu0YH+M6zRMzQHLtfq6oGClaEdnFL1Am5eKCOV
         xQR9daJpoQn2NNN6nRfIQQ758q1P9phPAHn30bW2q5LYC6ytMvvXQdcyr6iMH0Ltt/7c
         LYmBnEBOzo45tX2wGJWxk+XaMM+Mq3x/WyUBeklGTKnpIqPxLhfs1eHATTba9w0breeF
         qrZg==
X-Gm-Message-State: ANoB5plOtHMABcN+yrLXpZ7wnWgBAwGtl6buZ7U9N4SlG27WIHbI+voa
        0XUgN9VLVFIOIJdBzD69p6X6JA==
X-Google-Smtp-Source: AA0mqf6e1jvfhhWsdrwZhgn6s5ZYhMwDPWM4qZYRfvGtq7vcxeVOx5TgDXVh9+CNAv3b3NdK8mSXJA==
X-Received: by 2002:a7b:cb97:0:b0:3cf:ac0d:3f80 with SMTP id m23-20020a7bcb97000000b003cfac0d3f80mr45679451wmi.185.1670243946324;
        Mon, 05 Dec 2022 04:39:06 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1845:911d:bbf3:b5df])
        by smtp.gmail.com with ESMTPSA id w6-20020adfec46000000b0022efc4322a9sm14452947wrn.10.2022.12.05.04.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 04:39:05 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Nick Hainke <vincent@systemli.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v8 0/2] gpiolib: don't allow user-space to crash the kernel with hot-unplugs
Date:   Mon,  5 Dec 2022 13:39:01 +0100
Message-Id: <20221205123903.159838-1-brgl@bgdev.pl>
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

Linus Torvalds pointed out that using trylock here is wrong. This iteration
drops it in favor of unconditional locks but keeps all the fixes that came
later.

I will also not send it for this release but make it part of the updates PR
for v6.2 to give it some time in next.

v7 -> v8:
- don't use down_read_trylock(), just go straight for a full lock

v6 -> v7:
- fix a build issue with CDEV_V1 code disabled (giving credit to Nick Hainke)
- protect the gdev->chip also in gpio_chrdev_open()

v5 -> v6:
- signal an error in poll callbacks instead of returning 0 which would make
  the user-space assume a timeout occurred (which could lead to user-space
  spinning a timeout loop forever)

v4 -> v5:
- try to acquire the semaphore for reading and bail out of syscall callbacks
  immediately in case of lock contention

v3 -> v4:
- use function typedefs to make code cleaner
- add a blank line after down_write()

v2 -> v3:
- drop the helper variable in patch 1/2 as we won't be using it in 2/2
- refactor patch 2/2 to use locking wrappers around the syscall callbacks

v1 -> v2:
- add missing gdev->chip checks in patch 1/2
- add a second patch that protects the structures that can be accessed
  by user-space calls against concurrent removal

Bartosz Golaszewski (2):
  gpiolib: cdev: fix NULL-pointer dereferences
  gpiolib: protect the GPIO device against being dropped while in use by
    user-space

 drivers/gpio/gpiolib-cdev.c | 204 +++++++++++++++++++++++++++++++-----
 drivers/gpio/gpiolib.c      |   4 +
 drivers/gpio/gpiolib.h      |   5 +
 3 files changed, 188 insertions(+), 25 deletions(-)

-- 
2.37.2

