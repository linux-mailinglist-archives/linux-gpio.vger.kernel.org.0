Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D12A15BA78F
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Sep 2022 09:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiIPHnB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Sep 2022 03:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiIPHnA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Sep 2022 03:43:00 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB7EA2239
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 00:42:56 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id y8so23344225edc.10
        for <linux-gpio@vger.kernel.org>; Fri, 16 Sep 2022 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=A8Z01QhbKZ0z8K5FgWd9QQsS45HGVz5cml0Py1L/ST8=;
        b=ETPWKLzY+nyDXFQS4WaUm0MxVKNNhcdeD7rkXiL1xGCVDfKIGNb+XYTRtwB15VEWh8
         1Sy0z6V+mUsCEjF8a7VtRzVwsGS0XQfNC+CfXz0WgX7Chu3C4HfNHriKwFNroEZv6mGL
         v+XdO7GGuYPHgP+EQmxyRSqijUEdk7Tmd3/eBlBKGsTKHBCFIV7JqX4Bx10m5dpZsw1p
         OScmgNIsks4PGfw6Ek9kLumHuI0Cf7+pOB0SaSs+DH5LLzoskwEP4zGNmygnGbLvgvfl
         G26VMALJFNDS8Yf3dj0cTZvxGKeupoGAhntEIxBW6S87LHhRcs4BcfkBaD722iCX9y2a
         cqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=A8Z01QhbKZ0z8K5FgWd9QQsS45HGVz5cml0Py1L/ST8=;
        b=w8uILzc+bGSHOLwu2OyjrpF1+vXfi5RoD78+yPbwS3XRJ5Ll5kT77PJtq8uZpJvVuR
         QLMHye2O0GyHftV+YnnodY3ecqjsUFJJflzxh+rrUuAmmXU42mXkxhMJI3A5TETnkPlb
         9NZiGF9vGzI+VndJu9XK//HSTWwQZ8AIOwpOYi66Uv3veAIfZdblofV0azIOHss0ruq+
         TQ8qlIFeWAddg6DdKZ+t5QvG3E+66MuGhscMLCdOXViXnKH8rQxMQ4Mth1UHMTAejU0P
         h+VEBoGI8/oFSXlPMCmxfpPxBuiTWoY3U2W6CwjM4FO9WZxj1SSXrpRP1Cqs4H1/JQfb
         CDRw==
X-Gm-Message-State: ACrzQf1cB4O6F/Zjb2pMbKDV5JhGRpfblkeU2G4ry/4mdGFF1FUi6Hg/
        C8D5SIrn9K25QE5NRk36m2bjRw==
X-Google-Smtp-Source: AMsMyM7fvrBA0JmC+/5wGfHmx7KUzQPZyJUxF4IWqDVlKH/EpFhsaSLc27pQ8SkA/Gnq+qJ9pYjCbg==
X-Received: by 2002:a05:6402:280a:b0:451:5aad:8968 with SMTP id h10-20020a056402280a00b004515aad8968mr2968092ede.55.1663314175369;
        Fri, 16 Sep 2022 00:42:55 -0700 (PDT)
Received: from brgl-uxlite.. ([77.241.232.28])
        by smtp.gmail.com with ESMTPSA id kw22-20020a170907771600b0077b2b0563f4sm9470724ejc.173.2022.09.16.00.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 00:42:54 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [GIT PULL] gpio: fixes for v6.0-rc6
Date:   Fri, 16 Sep 2022 09:42:53 +0200
Message-Id: <20220916074253.781428-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Linus,

Please pull the following set of fixes for the next rc.

Bartosz

The following changes since commit 7e18e42e4b280c85b76967a9106a13ca61c16179:

  Linux 6.0-rc4 (2022-09-04 13:10:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.0-rc6

for you to fetch changes up to 09eed5a1ed3c752892663976837eb4244c2f1984:

  gpio: mt7621: Make the irqchip immutable (2022-09-14 14:18:08 +0200)

----------------------------------------------------------------
gpio fixes for v6.0-rc6

- fix the level-low interrupt type support in gpio-mpc8xxx
- convert another two drivers to using immputable irq chips
- MAINTAINERS update

----------------------------------------------------------------
Jay Fang (1):
      MAINTAINERS: Update HiSilicon GPIO Driver maintainer

Linus Walleij (1):
      gpio: ixp4xx: Make irqchip immutable

Pali Rohár (1):
      gpio: mpc8xxx: Fix support for IRQ_TYPE_LEVEL_LOW flow_type in mpc85xx

Sergio Paracuellos (1):
      gpio: mt7621: Make the irqchip immutable

 MAINTAINERS                 |  2 +-
 drivers/gpio/gpio-ixp4xx.c  | 17 ++++++++++++++---
 drivers/gpio/gpio-mpc8xxx.c |  1 +
 drivers/gpio/gpio-mt7621.c  | 21 +++++++++++++++------
 4 files changed, 31 insertions(+), 10 deletions(-)
