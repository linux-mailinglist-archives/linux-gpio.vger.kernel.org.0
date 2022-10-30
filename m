Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFF176128E8
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Oct 2022 09:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiJ3IFZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 30 Oct 2022 04:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiJ3IFY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Oct 2022 04:05:24 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642A26409
        for <linux-gpio@vger.kernel.org>; Sun, 30 Oct 2022 01:05:23 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id j15so11922659wrq.3
        for <linux-gpio@vger.kernel.org>; Sun, 30 Oct 2022 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ARXWl72zE64W9sxl9KtUP1FXDgSDHyODIedksNa9+0=;
        b=vrQx0dFI0q1qIYGQiNNtUT2dcuIUQT85jSTM8mpp81vgE6+RoxJs012tJCPK2ocSBQ
         FCOSgeb2tHVkq90yNV86O8VUZlyimoQ4nEkjQQ+md6G8FXyqmq9wzGkA4Ap4RxcFil13
         6o5wMzPC05XPmDaKOBv7QqQKZDKvQs3onq9v8Q6jXdaiL9jOvPZnQyoMwGo85V8dWg/T
         5p6dwikOwNlSYnqQT7BinSFD/DlH9MVs+uuSPyydTiU1aHWzqw9OROoSBS3PrtyQDOhW
         qciMWhvbMOpqVHPTy9hyDfzITWdrJvJ1EZQqwX1VwhfAxmJ5uMVJdSp/S9D2LmkO4arC
         rIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ARXWl72zE64W9sxl9KtUP1FXDgSDHyODIedksNa9+0=;
        b=pXPZtg5VGy654whzPRsxsnXLRDZknZ+KMDjvtOjlE7+U9/Z3S2cOpbsVmAqwG8M3m9
         A16N7Y6uzgLw8vh2eYnnMXFsQ+HUn6xTRSWT0VM5GMt0XQ1wPcrA8JWI+BTnGsxLsN5b
         5o9xiCkgpxHx8e7yicm67c0QIG8HZ/yWdY5SVzCrCtWqSGBjg2cv5VKovuzdyKV/ijiD
         zBIjTO8yM6y4F2ZGd0hl+7xxkKw1XpS2KQ68QKQmx+fkZgAFjhRJYa+II3L/d/sLaXcP
         Dd95+/39R7r46CvJdH5ODSZiP4HH4jXtO12yqhZBqwSX5wdnzFcNHyl6EVUxneFmug9q
         rtSg==
X-Gm-Message-State: ACrzQf39SF1X0PSnmIb6+5DGLYrrznmquHhuhA2tZjN681LD06rkuFmD
        IJULnoHenevKWTUeCWJzN92Pcg==
X-Google-Smtp-Source: AMsMyM59bXcF2Xy5aurBDcM2CEEgt1J7miWZNJa2HwaL3mprd3DJF8kVBnw4FO1JmE/PYwlCvH11Vw==
X-Received: by 2002:a05:6000:18a5:b0:231:e0c5:1322 with SMTP id b5-20020a05600018a500b00231e0c51322mr4467314wri.376.1667117121790;
        Sun, 30 Oct 2022 01:05:21 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:41be:1aed:e53f:b9aa])
        by smtp.gmail.com with ESMTPSA id w4-20020a05600c098400b003cf6a55d8e8sm2191995wmp.7.2022.10.30.01.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 01:05:21 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.1-rc3
Date:   Sun, 30 Oct 2022 09:05:19 +0100
Message-Id: <20221030080519.5467-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
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

Please pull the following fixes for the next rc. There's an update to the
MAINTAINERS file and another immutable irqchip conversion.

Bartosz

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.1-rc3

for you to fetch changes up to 9ed88fcfb1b08c41bde0381dece84d152d53774c:

  MAINTAINERS: Change myself to a maintainer (2022-10-28 16:50:14 +0200)

----------------------------------------------------------------
gpio: fixes for v6.1-rc3

- convert gpio-tegra to using an immutable irqchip
- MAINTAINERS update

----------------------------------------------------------------
Matti Vaittinen (1):
      MAINTAINERS: Change myself to a maintainer

Svyatoslav Ryhel (1):
      gpio: tegra: Convert to immutable irq chip

 MAINTAINERS               |  4 ++--
 drivers/gpio/gpio-tegra.c | 60 ++++++++++++++++++++++++++++++++++-------------
 2 files changed, 46 insertions(+), 18 deletions(-)
