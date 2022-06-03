Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1FB653CB7D
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jun 2022 16:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244631AbiFCO2T (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jun 2022 10:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240513AbiFCO2S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jun 2022 10:28:18 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782A122BC1
        for <linux-gpio@vger.kernel.org>; Fri,  3 Jun 2022 07:28:17 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id q15so2580847wrc.11
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jun 2022 07:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xEYT24Mw/3xwhggZ/dpbmQG99woOPJwgkQGW8eylJQs=;
        b=zvsMZh6sLDlicrdTGeylEAw0Q1YIMm9o7fadQF8XPiqdYFOu82UeM3gyvT0tNKQx0V
         QtfnOhpaMS6/olRJQJmIvNAF+XTbT5GKyjnYQmo49/MGEcLXAkdZ/IOPVjfItNW8YvyM
         oSfbsGy//J3DR4BaK449AbnXMGbVdzTaVeuSa7QCrwjt0RD3O3K1WOVnYtu2KNaVJloT
         dxLrm9R8JCzmhSm9XZFWrlTa0lmihGYrNPh6D/N/FZl2FcDcW8YlGafJmEs6WMJ1POVk
         BxqxOxLX16zCsZTbQjPT1K6ehsWp/z4wxwKIWq1X7iozSFWh0+rrQJAD8hIW0QLQRb4p
         XN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xEYT24Mw/3xwhggZ/dpbmQG99woOPJwgkQGW8eylJQs=;
        b=cIRWM0lOQQthKITf+KL6p/7WT2+Mjb6jsdWvZ0ZdOMjfsw1H6j2YYWiIrr/KvP8m7p
         OqyaLazEdMlt6jzXzNPmQJJBoGPAQLVdDvFGEt9CP/RierfJbyRmiou8K4XPlsrVzFdA
         bKMiwf9SVHcGvpnj/x/zqh7Cfwwtk0xr+0gOje6YMqMFFBeGK9U8pqFeSZGSv1kq3QKi
         IQS1mPFCT34F2c/03lsHvwe/v26rdcIsJlxw3vPpEU379w/la34jVZBAkDveTPfvrCZk
         UMN60u/3jT0WB+27s6reRCQEPpV3r8Q9tGhYzTzkp7xFuIrHcKcrQWbEF/f2V/9esK+W
         xyzw==
X-Gm-Message-State: AOAM533w1PGG5v0vMghHbznsI7aK6QNUYtJtO0Sh+N7hnKEiShCID1fw
        9W/jIZde/SRxEnHEXcksEyHeTw==
X-Google-Smtp-Source: ABdhPJyovDLQyMgqK1CVt47Mttdzalhw7oxXByv7wtrOyjSW+woe/77ysnzSCDi+GJOQwyyhg3vJrg==
X-Received: by 2002:a05:6000:1568:b0:20f:d416:e5ac with SMTP id 8-20020a056000156800b0020fd416e5acmr8608338wrz.190.1654266495652;
        Fri, 03 Jun 2022 07:28:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:327a:d111:d547:a6d2])
        by smtp.gmail.com with ESMTPSA id a21-20020a05600c349500b003958af7d0c8sm8616581wmq.45.2022.06.03.07.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 07:28:15 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: updates for v5.19-rc1
Date:   Fri,  3 Jun 2022 16:28:12 +0200
Message-Id: <20220603142812.66869-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Please pull the following set of fixes for the upcoming rc.

Best regards,
Bartosz Golaszewski

The following changes since commit 4b0986a3613c92f4ec1bdc7f60ec66fea135991f:

  Linux 5.18 (2022-05-22 09:52:31 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v5.19-rc1

for you to fetch changes up to 7bb8a0cf49d5fede1104afdcb43bd2f8a1df3253:

  gpio: adp5588: Remove support for platform setup and teardown callbacks (2022-06-02 09:17:38 +0200)

----------------------------------------------------------------
gpio updates for v5.19-rc1

- use the correct register for regcache sync in gpio-pca953x
- remove unused and potentially harmful code from gpio-adp5588
- MAINTAINERS update

----------------------------------------------------------------
Andy Shevchenko (2):
      MAINTAINERS: Update GPIO ACPI library to Supported
      MAINTAINERS: Update Intel GPIO (PMIC and PCH) to Supported

Haibo Chen (1):
      gpio: pca953x: use the correct register address to do regcache sync

Uwe Kleine-König (1):
      gpio: adp5588: Remove support for platform setup and teardown callbacks

 MAINTAINERS                 |  6 +++---
 drivers/gpio/gpio-adp5588.c | 19 -------------------
 drivers/gpio/gpio-pca953x.c | 19 +++++++++++--------
 3 files changed, 14 insertions(+), 30 deletions(-)
