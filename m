Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1999266A55B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 22:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjAMVwU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 16:52:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjAMVwT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 16:52:19 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B1AB892FF
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:17 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so1517642wml.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 13:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WZmLWdjsOcUmsmEKebc1i6LYOU6908iF0g9l/LhUZAg=;
        b=pdCv+na2vFijLqi6IhM/E14KJTvKoJZQRYS50dyLNuAacRi2Sgknov7hMI7BkWdTD1
         eyss1EfcObxz4UFpEFgouFoN9pWitOymcT1H4ZUsEX742zTYzuL/hUTFriEZ4styAnYR
         /52gVRvZk1wEfQpSA+1PLB1X9UIXoX8P7SHoKLMnYX4M9UW4IGtjcwyBwnFE15fKVdpj
         48Dlu777bNnptFtrskFsYo740VqaoZMN/c6P1OBNziRySF53Oe5Td2f6YD1odkAWtqIs
         Z5ABRwFrqOg+D9ROmPrSOqJ0lQlDaRTSdLTqF0GFoAzs2PBwQ/qnUdK+JxYJLRr5p2OC
         uZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZmLWdjsOcUmsmEKebc1i6LYOU6908iF0g9l/LhUZAg=;
        b=OlwmcfXpCoQLxYDbUvZwdCzO/7BJ+ePKpqBVmSPLI2/wJlBdiFoHrZduCUFeoOv5Me
         jqLIm7xIJ3JBA74wZINRyNb7i4vZUapuBlBrpJWL2XP7/0xc1KAB+mD4tzZvkJWObMcJ
         YuKcgAkFO+rxXAUDez8zYAQQ6W+EkCNpbq8Da17d8RNzpSRGDBaJzmwNbaYGXQ+c/qVr
         jObI+/2Orul5baNJJM+8IrFsWtgJQ/Fc+e7iNOdX67N6PRrOIcSDxE6b5qyqqi0HUN1e
         DlohMDVV2V33BX8v+ni5jV1zSZKrmFYlorkPmf1EXCmSlziEnKlug0ke/ZSXp/kaV+Kt
         JuNw==
X-Gm-Message-State: AFqh2kouLNjWdznuIHLWotB2OmKLMOH/Ff9l1UvjY8YaBb7KyfNgXsXy
        bpLIcA75NaWToZK7eUHQI+DS+A==
X-Google-Smtp-Source: AMrXdXu9/4vc+DxsrX/h3N+nkH6Ngdo0sto6KhyucbjfwfKIsivlkrr8TmDnpneSqBW1yM1h/JpENg==
X-Received: by 2002:a05:600c:3844:b0:3d2:191d:2420 with SMTP id s4-20020a05600c384400b003d2191d2420mr60572750wmr.7.1673646735821;
        Fri, 13 Jan 2023 13:52:15 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ba79:38ad:100f:e9ee])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm33179234wmo.39.2023.01.13.13.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:52:15 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 00/16] treewide: continue beating libgpiod v2 into shape for an upcoming release
Date:   Fri, 13 Jan 2023 22:51:54 +0100
Message-Id: <20230113215210.616812-1-brgl@bgdev.pl>
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

This series contains an assortment of smaller and bigger changes. Some are
just simple updates to docs, some fix bugs and we have two more changes to
the API: unifying the get_offsets functions for line config and line request
as well as providing an interface for setting multiple output values at once
in line_config before requesting lines.

Rust bindings have also been updated slightly so Viresh please make sure to
take a look and review.

I really hope this is the last set of bigger changes and that I'll be able
to tag an RC and release v2 in the next couple of weeks.

Bartosz Golaszewski (16):
  README: update for libgpiod v2
  tests: avoid shadowing local variables with common names in macros
  build: unify the coding style of source files lists in Makefiles
  treewide: unify gpiod_line_config/request_get_offsets() functions
  doc: update docs for libgpiod v2
  bindings: cxx: prepend all C symbols with the scope resolution
    operator
  bindings: cxx: allow to copy line_settings
  tests: fix the line config reset test case
  tests: add a helper for reading back line settings from line config
  core: provide gpiod_line_config_set_output_values()
  gpioset: use gpiod_line_config_set_output_values()
  bindings: cxx: add line_config.set_output_values()
  bindings: python: provide line_config.set_output_values()
  bindings: rust: make request_config optional in Chip.request_lines()
  bindings: rust: make mutators return &mut self
  bindings: rust: provide line_config.set_output_values()

 README                                        |  32 ++---
 bindings/cxx/Makefile.am                      |  32 ++---
 bindings/cxx/examples/Makefile.am             |  12 +-
 bindings/cxx/gpiodcxx/line-config.hpp         |   7 ++
 bindings/cxx/gpiodcxx/line-settings.hpp       |  13 +-
 bindings/cxx/internal.hpp                     |   3 +-
 bindings/cxx/line-config.cpp                  |  33 +++--
 bindings/cxx/line-request.cpp                 |  10 +-
 bindings/cxx/line-settings.cpp                |  85 +++++++++----
 bindings/cxx/tests/Makefile.am                |  36 +++---
 bindings/cxx/tests/tests-line-config.cpp      |  51 ++++++++
 bindings/cxx/tests/tests-line-settings.cpp    |  43 +++++++
 bindings/python/gpiod/chip.py                 |   6 +
 bindings/python/gpiod/ext/line-config.c       |  64 ++++++++++
 bindings/python/gpiod/ext/request.c           |   8 +-
 bindings/python/tests/tests_line_request.py   |  14 +++
 .../rust/libgpiod/examples/gpio_events.rs     |   4 +-
 .../examples/gpio_threaded_info_events.rs     |   8 +-
 bindings/rust/libgpiod/examples/gpioget.rs    |   6 +-
 bindings/rust/libgpiod/examples/gpiomon.rs    |   4 +-
 bindings/rust/libgpiod/examples/gpioset.rs    |   6 +-
 bindings/rust/libgpiod/src/chip.rs            |  10 +-
 bindings/rust/libgpiod/src/lib.rs             |   1 +
 bindings/rust/libgpiod/src/line_config.rs     |  83 +++++++------
 bindings/rust/libgpiod/src/line_request.rs    |  22 ++--
 bindings/rust/libgpiod/src/request_config.rs  |   8 +-
 bindings/rust/libgpiod/tests/common/config.rs |  10 +-
 bindings/rust/libgpiod/tests/info_event.rs    |   8 +-
 bindings/rust/libgpiod/tests/line_config.rs   |  76 +++++++++---
 bindings/rust/libgpiod/tests/line_request.rs  |  99 +++++++--------
 .../rust/libgpiod/tests/request_config.rs     |   2 +-
 configure.ac                                  |   1 +
 include/gpiod.h                               | 104 ++++++++++++----
 lib/Makefile.am                               |  27 ++--
 lib/line-config.c                             |  98 +++++++++++----
 lib/line-request.c                            |  23 ++--
 man/Makefile.am                               |   8 +-
 tests/Makefile.am                             |  34 ++---
 tests/gpiod-test-helpers.h                    |  36 ++++--
 tests/tests-line-config.c                     | 116 +++++++++++++-----
 tests/tests-line-request.c                    |  10 +-
 tools/gpioset.c                               |  21 ++--
 42 files changed, 879 insertions(+), 395 deletions(-)

-- 
2.37.2

