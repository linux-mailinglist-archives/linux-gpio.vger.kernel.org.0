Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3393E7AC48C
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Sep 2023 20:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjIWSwy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Sep 2023 14:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231315AbjIWSwx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Sep 2023 14:52:53 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5728D1B0
        for <linux-gpio@vger.kernel.org>; Sat, 23 Sep 2023 11:52:45 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4053c6f0e50so30382205e9.1
        for <linux-gpio@vger.kernel.org>; Sat, 23 Sep 2023 11:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695495163; x=1696099963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5RpfFOKVRvmroFeRuU22rnYot+cdeh26PIOBJvY9txk=;
        b=JKtLDaWZW+hmfHRdQ9VP6tVL84qWWqXpArzzLCfjoR85NG/yaqf525kJ6pbkkJD6OB
         dbW1XJSDdxGdcJO+zteBldNniO8kj5OC/W0L//tidK/rS5zu3uOSbf6gEwULqvjR49+8
         aIyWesBm6IZ4/wbfO83XKLpZLOGPo+/P3zjVrodcUnmaAmIvtJHZ9FiDcylI/6n7vFZ1
         xLrAH7THrOHMKYKbYuY9jUGZ1uVuNtkYBT6+KWWMtxZ3enTqthhiDoqSBigeKRLxpRtW
         EW0YnHxb3iH4prMXB4frMVAV/K8BRXNHSd7EviExxOueBnqa1fSBFLHJTNeFEpigBHJW
         VFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695495163; x=1696099963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RpfFOKVRvmroFeRuU22rnYot+cdeh26PIOBJvY9txk=;
        b=CptTAQNO+snhx4U5PDiLX38Fnu3nI7VH+XFjcWc/PDgtxjaaMZnCNodTRtza2FVpYJ
         k76vU2DYa8JwciaJP0F8RPJ1qMFG6DIDDC+PZCqiWFPqq5euUxgLtJ93JejKjhm2n0jF
         Ra5lhApWPPyfyFobq+izZvt8K3XcHV6E1cmdmgs8f1hKAzAS9GDtWapDPIdhyAC79/Mv
         wehpaQRd3kBoyYlV+q5eRcIIClEueuc5eOpV7U2T1Cq+OtAAiTSuK71e9R4skZvwh01d
         o+1q+FYASOh6s/tmS0KXxl2BNKIufsbRz19EEGeFvicEBI5DxU1f9CXLT4VBjCfQmW1r
         KQYA==
X-Gm-Message-State: AOJu0YzdL+5rwmGiPTPbt949Btb02LQ1huCsjTeLi4PFbKmCj+l5+/1N
        hsP1ETgb3It7sewjXIF9ifKcrQ==
X-Google-Smtp-Source: AGHT+IG2s/Vd56Fk0FRwkxymsgLP8f3+ugEs5scVaUMsZb6dbcfAX96kxzqtw/Au+8022b2dWY6sTQ==
X-Received: by 2002:a7b:cc85:0:b0:401:a0b1:aef6 with SMTP id p5-20020a7bcc85000000b00401a0b1aef6mr2458596wma.2.1695495163481;
        Sat, 23 Sep 2023 11:52:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:3935:d9a:a2fe:db4d])
        by smtp.gmail.com with ESMTPSA id z12-20020a5d654c000000b0032148618cc4sm7522623wrv.29.2023.09.23.11.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 11:52:43 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Alexey Dobriyan <adobriyan@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.6-rc3
Date:   Sat, 23 Sep 2023 20:52:26 +0200
Message-Id: <20230923185226.6218-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
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

Please consider pulling the following set of fixes for the next RC. The
biggest change is the patch addressing the __free() issue in gpio-sim we
discussed on the list. The other changes are a simple resource leak fix and
MAINTAINERS update.

Thanks,
Bartosz

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.6-rc3

for you to fetch changes up to 5cb9606a901a41f2ffe37fb8528bb6fbfb5d90e2:

  gpio: sim: fix an invalid __free() usage (2023-09-22 10:51:56 +0200)

----------------------------------------------------------------
gpio fixes for v6.6-rc3

- fix an invalid usage of __free(kfree) leading to kfreeing an ERR_PTR()
- fix an irq domain leak in gpio-tb10x
- MAINTAINERS update

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: sim: fix an invalid __free() usage

Christophe JAILLET (1):
      gpio: tb10x: Fix an error handling path in tb10x_gpio_probe()

Michael Walle (1):
      MAINTAINERS: gpio-regmap: make myself a maintainer of it

 MAINTAINERS               |  2 +-
 drivers/gpio/gpio-sim.c   | 60 ++++++++++++++++++-----------------------------
 drivers/gpio/gpio-tb10x.c |  6 ++++-
 3 files changed, 29 insertions(+), 39 deletions(-)
