Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 468E36408E7
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Dec 2022 16:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232038AbiLBPEv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Dec 2022 10:04:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiLBPEv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Dec 2022 10:04:51 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1FECD9BD
        for <linux-gpio@vger.kernel.org>; Fri,  2 Dec 2022 07:04:50 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id h11so8161304wrw.13
        for <linux-gpio@vger.kernel.org>; Fri, 02 Dec 2022 07:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sWntLOso8o9063LNWZJJYme5vULdsehktJiTEafe5Yc=;
        b=MmZs8WNLZzH3Ve3COf6jKgg0XAxCoWHQv2IqCRK21J8mLyeCIdMPubL2Fk2aaQ4ZTP
         M3AKunN+njwVmA50iIJuPBcJAEdb/gegAESDznvqboZoz/rxyjxqO2mq6l+bT1GBAXj+
         DVuewhC3diXchlw5TYaX5ZbqiYWB8q69xChbZrDfZzwUDLPGMzxZ+kY+4Uk+SshOhhP8
         /0uThk/DhMR9Yw1Y4IzSPYmQKoopKiXJOnsbmODzZ/ukv59T+RMLVqSZzzRSJY/nXSuj
         kouoaMwT0HnxVnPDd5mdqLrB0ZY3ifFV5WDozB1MeaMHaw1acaxrqQp/ZLugB+r0EmFP
         IomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWntLOso8o9063LNWZJJYme5vULdsehktJiTEafe5Yc=;
        b=K94KgcW4IVa79gUtLpimSXAeW2tipGHeejvmpaVc/9pqxQXEKXvHlxVBgEiJzsUWkb
         Zv6PlrOejHBl+ZQCIDXyHF7T0MD+JN7psTqsPWJWmgymv1rEfXhZexH68HbPCfRgNVE0
         JtFczfAdKbOO2rR7tyEX+wilowAEIPcaAL7kqmOTd84leHY0eopeutn5lDrsD/8qP6iG
         qoOXwsSWO+8Uyr1q9OCrdAF8zrDy3GHu6GKjzM2ti75oF+PzoRYLAp1ipaba6G20/289
         EwyJjFjSbJ8+2A4RODLzsxnBg1ziJWZDSYiCsXBKehnXZOVLNqMJ8AakHmz1odCCi4Rk
         t1iQ==
X-Gm-Message-State: ANoB5pkWQ0xGR5776ryp7CTuPJdKtsMnjOno6yb3dX6eVRqdcPc2LMaO
        gFbPGfgiwYmAPYbo3yAvtjJ8wtmYSy640Gs9
X-Google-Smtp-Source: AA0mqf5hO0RpjKqzK0vhPgDx3wdWpQKvjtLG+kMNnN+zODPNKQTp6qFMFXmdD/G9WL6LfhBHImiGWA==
X-Received: by 2002:adf:ea0a:0:b0:241:fcd5:6b94 with SMTP id q10-20020adfea0a000000b00241fcd56b94mr25889868wrm.592.1669993488778;
        Fri, 02 Dec 2022 07:04:48 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:29a4:6f04:ddb1:1ed7])
        by smtp.gmail.com with ESMTPSA id v6-20020adfe286000000b00241f467f888sm7218237wri.74.2022.12.02.07.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 07:04:48 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Nick Hainke <vincent@systemli.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v7 0/2] gpiolib: don't allow user-space to crash the kernel with hot-unplugs
Date:   Fri,  2 Dec 2022 16:04:42 +0100
Message-Id: <20221202150444.244313-1-brgl@bgdev.pl>
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

I need to respin this series after Nick Hainke reported a build failure when
the v1 uAPI for character device is disabled. I also noticed that we need to
lower the semaphore when opening the character device file as well.

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

 drivers/gpio/gpiolib-cdev.c | 207 +++++++++++++++++++++++++++++++-----
 drivers/gpio/gpiolib.c      |   4 +
 drivers/gpio/gpiolib.h      |   5 +
 3 files changed, 191 insertions(+), 25 deletions(-)

-- 
2.37.2

