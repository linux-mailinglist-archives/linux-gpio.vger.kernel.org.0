Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAEF6997FE
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Feb 2023 15:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjBPOzq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Feb 2023 09:55:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbjBPOzp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Feb 2023 09:55:45 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90124521F2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 06:55:43 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id y1so2134323wru.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Feb 2023 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GYcBJmwo22zXAEb41ec+7a2ghO3grcXFIW0zx/RN0Ao=;
        b=D6b8rwoeHE66moNlWxbd4At4ZlqXKYb+X+3F72Gt1qSuaRvXn1bkFru8o/ffp5idRb
         qniUVuR/SW6eowoiS9OXOsDIdAr5Xz4Tfix9o4makmnFFR2VSIfNc8PG5iccWLINT2q9
         gzWOMoWqMlFeCQEBgI0Q5aQcHocqdWEsMHAJeg7fQEQNwMZz8cMSqZfIPXFZB/j4IE9m
         Rnxb7b//1+sAeFIFLqXWq8sLw8EOlM2QEDMaa4r9EFlXhG8YPfzIw0T2c3rOHJYtVES2
         0OsoTZRYfViTjkS0wnFauGUeGzkVNnJSdb50jw3+jYP89CpcqD3PuWmxWiASLD2sBu+M
         sIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYcBJmwo22zXAEb41ec+7a2ghO3grcXFIW0zx/RN0Ao=;
        b=h5EWYCLGfzi0AyswiCDijZ/M5gycQ9FQ5pp9YMBp941Tw0ZRnfY9Wjl2D1SHoAdCff
         V6e/dKhAs/p9CXJ+HU+I4WUI+t/ijUeiIBVDNP680bDZm+c7oi2x3E6kwgbjDF7+xhkd
         jTOzjRjtFlcPBqacguGoGf5rs/QLlxznJlEihXnc+/vzhCCvyfXaNGImFBgqMw3SMU87
         pDsgw5zIlVXpwBRe+6u2IDQZe+Tlw8ea1Ht5E6o9hhMDNlhJ5aozetw/607QAN/gJ29L
         GBXTEhu+gnwk1+kKSbPaA9fIMfa5EaaJhgh0buRi1B3KR0gRMzini0Kz3g4BzJhqodWs
         yP3Q==
X-Gm-Message-State: AO0yUKVrJ9rqc1VtiMxMb+6FjdsaRD4DyoqNU/HgfNOESLPoi/hP02Km
        qISZ0E6L+sZwezPPo5liYZu6bg==
X-Google-Smtp-Source: AK7set/gY8GYbV4sja3UZJe1bVwJ2rkyt+w0wuJeP9rAJ+KPlitdNZJkQiTO8K1DHIyF2Ft4tfPzhg==
X-Received: by 2002:a5d:6691:0:b0:2c5:7c26:c2cc with SMTP id l17-20020a5d6691000000b002c57c26c2ccmr2398908wru.29.1676559342079;
        Thu, 16 Feb 2023 06:55:42 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7c5b:1160:db5d:72da])
        by smtp.gmail.com with ESMTPSA id p9-20020adfce09000000b002c5493a17efsm1730012wrn.25.2023.02.16.06.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:55:41 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.2
Date:   Thu, 16 Feb 2023 15:55:36 +0100
Message-Id: <20230216145536.121063-1-brgl@bgdev.pl>
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

Please pull the following set of late fixes for v6.2. Details are in the
signed tag as usual.

Bartosz

The following changes since commit ceaa837f96adb69c0df0397937cd74991d5d821a:

  Linux 6.2-rc8 (2023-02-12 14:10:17 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.2

for you to fetch changes up to b8b3b0bfb742f0cbb006c66b10216b724ce42e25:

  Merge tag 'intel-gpio-v6.2-2' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-current (2023-02-16 13:31:42 +0100)

----------------------------------------------------------------
gpio fixes for v6.2

- fix a potential Kconfig issue with gpio-mlxbf2 not selecting
  GPIOLIB_IRQCHIP
- another immutable irqchip conversion, this time for gpio-vf610
- fix a wakeup issue on Clevo NH5xAx

----------------------------------------------------------------
Alexander Stein (1):
      gpio: vf610: make irq_chip immutable

Bartosz Golaszewski (1):
      Merge tag 'intel-gpio-v6.2-2' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-current

Linus Walleij (1):
      gpio: mlxbf2: select GPIOLIB_IRQCHIP

Raag Jadav (1):
      gpiolib: acpi: remove redundant declaration

Werner Sembach (1):
      gpiolib: acpi: Add a ignore wakeup quirk for Clevo NH5xAx

 drivers/gpio/Kconfig        |  1 +
 drivers/gpio/gpio-vf610.c   | 41 +++++++++++++++++++++++------------------
 drivers/gpio/gpiolib-acpi.c | 12 ++++++++++++
 drivers/gpio/gpiolib-acpi.h |  1 -
 4 files changed, 36 insertions(+), 19 deletions(-)
