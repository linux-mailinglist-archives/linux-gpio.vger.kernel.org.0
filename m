Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D59763D5C9
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 13:42:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235053AbiK3Mmu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 07:42:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234987AbiK3Mml (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 07:42:41 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB21D218A
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:36 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id bx10so14814864wrb.0
        for <linux-gpio@vger.kernel.org>; Wed, 30 Nov 2022 04:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j86gp8Ez4ANVqB1Fk4+veFg8f66aJBx+2weUoP0oGyc=;
        b=NW55VdW6vtdT2iwFdrixeaxDLwAbHwpHVWPxbsIW7WNWJGX+Q9szlKvasvy45zNxSf
         pkiMj8+Vp9EZXZCvXDvD/eBHX2AfSZZFORLilhArtUkddJ66cZnmsGAjOIy6NKjT+WEb
         lggr8Ek5TfLFsVgDQOjEII1PA2PFckhlwdZTxDQL+AwM+dv9N1iRGUPXHKYcmaSV5Swe
         9p1jUl33XqNuqPsHfF0JkOyV0Tucf05IIF0QMtgFUwLv2gO225DXl7UB6vSFTUYrtk18
         fNcIxWpB/ScquywKV8f+/d1CfMrfPh5a8i1iEnjDEcsoQQEWjp6IbHeXU4wPDB16V+4q
         EI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j86gp8Ez4ANVqB1Fk4+veFg8f66aJBx+2weUoP0oGyc=;
        b=0Ib5uHDw+VMRLzM1PMni8ZrHbxTPIf1w/0uwt5eiWFbnhonUDKG47YLcoPrGFCo5w/
         bPACthaubgtyBKQBjh0/AwOj8lkXNtsl9WksVt0NQ7YXNLp+7aclgrW7r1Nr8LUnLjEW
         zwHuADCC6rK7bRHASjqUbbUe4j17H1ULyDulGHBzvmZD66z9nGyOkUX3zPHufsvOiyH0
         yOGVNS2UYTK2G1Gk6WMVWi8ke0LBxQy4f+aYR6JbJtGPMGxOBkSARZA25+aI7EJChoJd
         4FxVfgYtcOE7wCp5F9A6aDKIbmsxpASYSEe4EqUki2KhO4ItKjH42AVvo01LAhsAR74r
         sskA==
X-Gm-Message-State: ANoB5pn+QJTWtHbivpfQCZHmimoN0S0NCA/f5ZfN+M4bgIIvva2BJCn0
        aNVWUbYzHQpwxSKsHHiMRLYeJQ==
X-Google-Smtp-Source: AA0mqf4LXFeu89WlT8+uGRPQflOm/65DjjJRlGZYoWS1cligLymsM9H5n1cb8tUtVvgt1fDqmv18Rg==
X-Received: by 2002:a5d:6582:0:b0:241:792f:b1fb with SMTP id q2-20020a5d6582000000b00241792fb1fbmr27694467wru.436.1669812155175;
        Wed, 30 Nov 2022 04:42:35 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:458c:6db9:e033:a468])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4402000000b00226dba960b4sm1514985wrq.3.2022.11.30.04.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 04:42:34 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 00/11] treewide: an assortment of tweaks and improvements
Date:   Wed, 30 Nov 2022 13:42:20 +0100
Message-Id: <20221130124231.1054001-1-brgl@bgdev.pl>
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

This series contains various changes for libgpiod v2. There's no main theme
to it really, just fixing problems I noticed and introducing some more
changes to the API.

Bartosz Golaszewski (11):
  treewide: use C enum types explicitly
  treewide: apply formatting changes with clang-format
  treewide: use plural 'events' in read_edge_event() functions
  treewide: rename EVENT_CLOCK to CLOCK
  gpiosim: rename HOG_DIR to DIRECTION
  tools: display the correct license with --version
  bindings: rust: make reuse happy
  bindings: rust: include rust sources in the release tarballs
  bindings: python: decouple the version of the bindings from libgpiod
    API version
  bindings: python: fix the GPIOD_WITH_TESTS build flag
  bindings: python: extend setup.py

 LICENSES/Apache-2.0.txt                       | 201 ++++++++++++++++++
 LICENSES/BSD-3-Clause.txt                     |  28 +++
 LICENSES/CC0-1.0.txt                          | 121 +++++++++++
 Makefile.am                                   |   9 +-
 bindings/cxx/edge-event-buffer.cpp            |   2 +-
 bindings/cxx/edge-event.cpp                   |   2 +-
 bindings/cxx/examples/gpiomoncxx.cpp          |   2 +-
 bindings/cxx/gpiodcxx/line-request.hpp        |   6 +-
 bindings/cxx/info-event.cpp                   |   2 +-
 bindings/cxx/internal.hpp                     |   6 +-
 bindings/cxx/line-info.cpp                    |   8 +-
 bindings/cxx/line-request.cpp                 |  24 ++-
 bindings/cxx/line-settings.cpp                |  87 ++++----
 bindings/cxx/tests/gpiosim.cpp                |  24 +--
 bindings/cxx/tests/gpiosim.hpp                |   4 +-
 bindings/cxx/tests/tests-edge-event.cpp       |  56 ++---
 bindings/cxx/tests/tests-line-info.cpp        |   2 +-
 bindings/python/examples/gpiomon.py           |   2 +-
 bindings/python/gpiod/__init__.py             |   3 +-
 bindings/python/gpiod/ext/line-settings.c     |  54 ++---
 bindings/python/gpiod/ext/module.c            |   8 +-
 bindings/python/gpiod/ext/request.c           |  12 +-
 bindings/python/gpiod/line_request.py         |   6 +-
 bindings/python/gpiod/version.py              |   5 +
 bindings/python/setup.py                      |  18 +-
 bindings/python/tests/gpiosim/ext.c           |   6 +-
 bindings/python/tests/tests_edge_event.py     |  38 ++--
 bindings/python/tests/tests_module.py         |  15 +-
 bindings/rust/.gitignore                      |   4 +-
 bindings/rust/Makefile.am                     |   4 +
 bindings/rust/gpiosim-sys/Makefile.am         |   6 +
 bindings/rust/gpiosim-sys/src/Makefile.am     |   5 +
 bindings/rust/gpiosim-sys/src/lib.rs          |  48 +++--
 bindings/rust/gpiosim-sys/src/sim.rs          |   2 +-
 bindings/rust/libgpiod-sys/Makefile.am        |   6 +
 bindings/rust/libgpiod-sys/src/Makefile.am    |   5 +
 bindings/rust/libgpiod/Makefile.am            |   6 +
 bindings/rust/libgpiod/examples/Makefile.am   |  14 ++
 .../rust/libgpiod/examples/gpio_events.rs     |   2 +-
 bindings/rust/libgpiod/examples/gpiomon.rs    |   2 +-
 bindings/rust/libgpiod/src/Makefile.am        |  15 ++
 bindings/rust/libgpiod/src/event_buffer.rs    |   2 +-
 bindings/rust/libgpiod/src/lib.rs             | 169 +++++++++------
 bindings/rust/libgpiod/src/line_info.rs       |  10 +-
 bindings/rust/libgpiod/src/line_request.rs    |   4 +-
 bindings/rust/libgpiod/src/line_settings.rs   |  30 +--
 bindings/rust/libgpiod/tests/Makefile.am      |  15 ++
 .../rust/libgpiod/tests/common/Makefile.am    |   5 +
 bindings/rust/libgpiod/tests/edge_event.rs    |  24 +--
 bindings/rust/libgpiod/tests/line_request.rs  |   2 +-
 configure.ac                                  |   9 +
 include/gpiod.h                               | 106 +++++----
 lib/edge-event.c                              |  13 +-
 lib/info-event.c                              |   5 +-
 lib/internal.c                                |   4 +-
 lib/internal.h                                |   3 +-
 lib/line-config.c                             |  55 ++---
 lib/line-info.c                               |  31 +--
 lib/line-request.c                            |  31 +--
 lib/line-settings.c                           |  50 ++---
 tests/gpiod-test-helpers.h                    |   2 +-
 tests/gpiod-test-sim.c                        |  53 +++--
 tests/gpiod-test-sim.h                        |   8 +-
 tests/gpiosim/gpiosim-selftest.c              |   2 +-
 tests/gpiosim/gpiosim.c                       |  50 +++--
 tests/gpiosim/gpiosim.h                       |  30 +--
 tests/tests-chip-info.c                       |   1 -
 tests/tests-edge-event.c                      |  98 ++++-----
 tests/tests-info-event.c                      |   2 +-
 tests/tests-line-config.c                     |   2 +-
 tests/tests-line-info.c                       |  39 ++--
 tests/tests-line-request.c                    |  58 ++---
 tests/tests-line-settings.c                   |  40 ++--
 tests/tests-request-config.c                  |  12 +-
 tools/gpiodetect.c                            |   3 +-
 tools/gpioget.c                               |   7 +-
 tools/gpioinfo.c                              |  12 +-
 tools/gpiomon.c                               |  31 ++-
 tools/gpionotify.c                            |  10 +-
 tools/gpioset.c                               |  85 ++++----
 tools/tools-common.c                          |  47 ++--
 tools/tools-common.h                          |  11 +-
 82 files changed, 1284 insertions(+), 757 deletions(-)
 create mode 100644 LICENSES/Apache-2.0.txt
 create mode 100644 LICENSES/BSD-3-Clause.txt
 create mode 100644 LICENSES/CC0-1.0.txt
 create mode 100644 bindings/python/gpiod/version.py
 create mode 100644 bindings/rust/gpiosim-sys/Makefile.am
 create mode 100644 bindings/rust/gpiosim-sys/src/Makefile.am
 create mode 100644 bindings/rust/libgpiod-sys/Makefile.am
 create mode 100644 bindings/rust/libgpiod-sys/src/Makefile.am
 create mode 100644 bindings/rust/libgpiod/Makefile.am
 create mode 100644 bindings/rust/libgpiod/examples/Makefile.am
 create mode 100644 bindings/rust/libgpiod/src/Makefile.am
 create mode 100644 bindings/rust/libgpiod/tests/Makefile.am
 create mode 100644 bindings/rust/libgpiod/tests/common/Makefile.am

-- 
2.37.2

