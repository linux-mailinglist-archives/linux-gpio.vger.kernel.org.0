Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E93A4B0FBD
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Feb 2022 15:08:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238327AbiBJOIE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 09:08:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242611AbiBJOH7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 09:07:59 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D44F9
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 06:07:58 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id s18so9794050wrv.7
        for <linux-gpio@vger.kernel.org>; Thu, 10 Feb 2022 06:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zq9siRtDb5B8cQQAy0BH/Mx229PYbUkJaokgjnfUf4g=;
        b=Osi5DI003duahcYRcZJjy7ygChprqNaioZgrM1Pf+0i1evyQOI64zZ2MEyO1IliGqT
         etg0HNWAxkwKdxgr4drBm8nGjeAyK3yHpCflWT9LS07QKx1vGiA/z/Nrd2XtoP1Qj/yE
         98g5MNQnoL99gatqT5MVkT+hATM9FWaemIMVLMyFcoE7DFcPjIF/KGHrdv4R4U0Li9Av
         hiqDKyW110XP+7Ry3MHBKHK0Y1oXzKks42lYTM2Y067NfvszcWDSpsK/lrD4zzHnPBwk
         ubdabk8Th2+g6mKSfauUEu7B22dx9k/uimLWKEdHEVOujRgNXZoncyMTfme+/M9Lp+82
         wNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zq9siRtDb5B8cQQAy0BH/Mx229PYbUkJaokgjnfUf4g=;
        b=EX34Ln4xOxVsoJu7X9EW7IGanKnOQoEIuQEoqFUx0TSDgS/xNfcR7UD128V9Ix8Dqr
         FJny5YwqC+iRyUZUNvExTz1WCkxiDCjQ0o8tQMzRAvQL4CRXKhuLgonYpbTkvDrGv916
         5k22uXnXIbcuguVR7p2VZSCJAUD1CzUFWDJW9l7gQuNEYGs3oqcm6bLFsZcS4psYDZb8
         E9kHtzES/Pmxm4ohu4/hylrpjXIMm9jEQ7VccjKVVQ25VFp2f9M4qCkyypO56hseJCpY
         FTLBj/vDfJyH4YrTB78nePAEdDaV/95+Q9RoFEN4vCDObzuo/SnPucwRtPtqc4D81Dqy
         GAew==
X-Gm-Message-State: AOAM530YXccHDh4DVS9F4fLlPqMQQHftupj0G8wRSIT+3EQfN4uLXFh/
        jigZj2Jh9dI9CgSAA3ugrknGiQ==
X-Google-Smtp-Source: ABdhPJztIlu3MkkA+ka+3SDQLmCCic7UbFrc/1+sxV3yAaVwXxqgFuTp5kdwmeYqcgiu8Z81oEgXuQ==
X-Received: by 2002:a05:6000:c1:: with SMTP id q1mr6348983wrx.479.1644502076545;
        Thu, 10 Feb 2022 06:07:56 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id i3sm18322879wrq.72.2022.02.10.06.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 06:07:56 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH 0/4] libgpiod v2: rewrite tests for the C library
Date:   Thu, 10 Feb 2022 15:07:41 +0100
Message-Id: <20220210140745.1059087-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series contains two patches that continue the work on libgpiod v2 API,
a patch adding a switch to the configure script that allows to compile in
gcov profiling into the test executable and finally a big patch that replaces
the old test suite for libgpiod v1 based on gpio-mockup with a one covering
around 95% of the libgpiod v2 code based on the upcoming gpio-sim module.

Bartosz Golaszewski (4):
  line-request: don't accept NULL line config
  line-config: expose the override logic to users
  build: add a configure option for enabling gcov profiling
  tests: rewrite core C tests using libgpiosim

 .gitignore                   |    4 +
 configure.ac                 |   18 +-
 include/gpiod.h              |  514 ++++++++++------
 lib/Makefile.am              |    1 +
 lib/line-config.c            |  731 ++++++++++++++---------
 tests/Makefile.am            |   21 +-
 tests/gpiod-test-helpers.c   |   49 ++
 tests/gpiod-test-helpers.h   |  131 ++++
 tests/gpiod-test-sim.c       |  303 ++++++++++
 tests/gpiod-test-sim.h       |   42 ++
 tests/gpiod-test.c           |  233 +-------
 tests/gpiod-test.h           |   81 +--
 tests/gpiosim/gpiosim.c      |    1 +
 tests/mockup/Makefile.am     |   11 -
 tests/mockup/gpio-mockup.c   |  496 ----------------
 tests/mockup/gpio-mockup.h   |   36 --
 tests/tests-chip.c           |  282 ++++-----
 tests/tests-edge-event.c     |  420 +++++++++++++
 tests/tests-event.c          |  908 ----------------------------
 tests/tests-info-event.c     |  301 ++++++++++
 tests/tests-line-config.c    |  408 +++++++++++++
 tests/tests-line-info.c      |  316 ++++++++++
 tests/tests-line-request.c   |  421 +++++++++++++
 tests/tests-line.c           | 1091 ----------------------------------
 tests/tests-misc.c           |   86 ++-
 tests/tests-request-config.c |   90 +++
 tools/gpioget.c              |    6 +-
 tools/gpiomon.c              |    6 +-
 tools/gpioset.c              |    9 +-
 29 files changed, 3544 insertions(+), 3472 deletions(-)
 create mode 100644 tests/gpiod-test-helpers.c
 create mode 100644 tests/gpiod-test-helpers.h
 create mode 100644 tests/gpiod-test-sim.c
 create mode 100644 tests/gpiod-test-sim.h
 delete mode 100644 tests/mockup/Makefile.am
 delete mode 100644 tests/mockup/gpio-mockup.c
 delete mode 100644 tests/mockup/gpio-mockup.h
 create mode 100644 tests/tests-edge-event.c
 delete mode 100644 tests/tests-event.c
 create mode 100644 tests/tests-info-event.c
 create mode 100644 tests/tests-line-config.c
 create mode 100644 tests/tests-line-info.c
 create mode 100644 tests/tests-line-request.c
 delete mode 100644 tests/tests-line.c
 create mode 100644 tests/tests-request-config.c

-- 
2.30.1

