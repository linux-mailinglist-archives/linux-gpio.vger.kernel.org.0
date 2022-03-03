Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C23A84CB9FD
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Mar 2022 10:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbiCCJTc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Mar 2022 04:19:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbiCCJTc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Mar 2022 04:19:32 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B96116A5B3
        for <linux-gpio@vger.kernel.org>; Thu,  3 Mar 2022 01:18:41 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id q7-20020a7bce87000000b00382255f4ca9so4410252wmj.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Mar 2022 01:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ITx9AjfJdEfyLy3hP0YWlDwqOU8D9WDB00iySByBzA0=;
        b=LirG44L3WMdKcGMT+QVHFlOAhIaspCIZ06c2AEt125JoROOOKsu6PUgsHYroV0Pu75
         JKr+FX2JpHu6UuW3tAY+GjWN8bd3CTpC9FaYNWhGgVVSquQ3MOsHTRaD2sUqCW6+aMoP
         /Qtb8Sqv8PcfQ9o0Z3NkJgdmSHYww+un5tMK0fKAMySJgSUEmuaEfPVKiUgBAy/iNlh2
         u6GBxPtat8vR/C+gi3DGZ2effqilBH/Wlwbpeb6CmPVPxfM+9bAiB1iGRbZ8a/qXkxU9
         VlIQc9dPNo0TjSXXqNrwWa8ZKOiXc6cfS2aV5TCsV14Eq8DSMenB0SX1BoZ/m6rz89Ed
         rmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ITx9AjfJdEfyLy3hP0YWlDwqOU8D9WDB00iySByBzA0=;
        b=jOkk1Mt+Ic96Dr/0j3yfnFaYIciCKL4Ero3zG/arXf0/BOsLDlez6ALwVJk7jqIHhb
         rjJUS/qF3lu0zWgnDmHRXf2Gj2zU9sAaIsPVnROQr1FJ5dVpPpUvj/nPYQRMnNrUChCS
         PfObQTsA6qz9xaR+z72E3PT52+LIkN1JwehfCAPKN1GCDH9Z9oITeLlhYMKDwjlH4IuQ
         iLM9wd5CY8pyJAYg5bRnXzO37xMHzPksDrdYNbAW2nmw9zMCMo/Ak/u+5Lapob/y9xtR
         E4T9XRYAdN0QYGD86VZG4qki4leYL4lv3Hvb6mk/NKquGZWlfyXGpXDcJXepEqfNTh/0
         xDMg==
X-Gm-Message-State: AOAM532qJ5zSbsn2EXkkHJHlb8RETDmDjv621n6RhYXPOGluG1NV9mUi
        tu/B8TMBXqPxfGCGei+cazZo6A==
X-Google-Smtp-Source: ABdhPJzCmv6sV2Sp4+CyUzCmQIgfqJWPdG9BmrUMoSx2VGWHTn0GWAfX6kSuJPOvo73oolqaf6Vn3A==
X-Received: by 2002:a05:600c:190d:b0:381:6ea1:8cc with SMTP id j13-20020a05600c190d00b003816ea108ccmr2988534wmq.118.1646299119822;
        Thu, 03 Mar 2022 01:18:39 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id x13-20020adfec0d000000b001e31279cc38sm1527286wrn.11.2022.03.03.01.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 01:18:39 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v3 0/3] libgpiod v2: rewrite tests for the C library
Date:   Thu,  3 Mar 2022 10:18:33 +0100
Message-Id: <20220303091836.168223-1-brgl@bgdev.pl>
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

This series contains a rework of the line_config interface and a bit patch
that replaces the old test suite for libgpiod v1 based on gpio-mockup with
a one covering around 95% of the libgpiod v2 code based on the upcoming
gpio-sim module.

v1 -> v2:
- drop applied patches
- improve documentation
- skip offsets that are overridden in line_config but not actually requested

v2 -> v3:
- add a patch adding an enum for line values
- rework the mechanism for retrieving overrides
- add new "constructors" for line_config
- incorporate part of Kent's points in the documentation
- a bunch of improvements to tests as per Kent's reviews

Bartosz Golaszewski (3):
  API: add an enum for line values
  line-config: expose the override logic to users
  tests: rewrite core C tests using libgpiosim

 configure.ac                 |    8 +-
 include/gpiod.h              |  603 +++++++++++++------
 lib/line-config.c            |  871 ++++++++++++++++++---------
 tests/Makefile.am            |   24 +-
 tests/gpiod-test-helpers.c   |   49 ++
 tests/gpiod-test-helpers.h   |  139 +++++
 tests/gpiod-test-sim.c       |  308 ++++++++++
 tests/gpiod-test-sim.h       |   42 ++
 tests/gpiod-test.c           |  233 +-------
 tests/gpiod-test.h           |   83 +--
 tests/gpiosim/gpiosim.c      |    1 +
 tests/mockup/Makefile.am     |   11 -
 tests/mockup/gpio-mockup.c   |  496 ----------------
 tests/mockup/gpio-mockup.h   |   36 --
 tests/tests-chip.c           |  282 ++++-----
 tests/tests-edge-event.c     |  490 +++++++++++++++
 tests/tests-event.c          |  908 ----------------------------
 tests/tests-info-event.c     |  301 ++++++++++
 tests/tests-line-config.c    |  503 ++++++++++++++++
 tests/tests-line-info.c      |  318 ++++++++++
 tests/tests-line-request.c   |  526 ++++++++++++++++
 tests/tests-line.c           | 1091 ----------------------------------
 tests/tests-misc.c           |   80 ++-
 tests/tests-request-config.c |   90 +++
 tools/gpioget.c              |    6 +-
 tools/gpiomon.c              |    6 +-
 tools/gpioset.c              |    9 +-
 27 files changed, 4017 insertions(+), 3497 deletions(-)
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

