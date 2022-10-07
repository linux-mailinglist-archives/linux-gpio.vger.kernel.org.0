Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B34415F7A09
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Oct 2022 16:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiJGOzk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Oct 2022 10:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbiJGOzg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Oct 2022 10:55:36 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 604008D0E2
        for <linux-gpio@vger.kernel.org>; Fri,  7 Oct 2022 07:55:27 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so2764308wmb.0
        for <linux-gpio@vger.kernel.org>; Fri, 07 Oct 2022 07:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tk5q01wByhmGfx3y9W8hkeUtKKL431A8mMZaov4wr6I=;
        b=Hh5HRHghsrpWBWKKAa4VgSUU2oxmPVgYHgt27EKeX6mjD5lt4m9sF78FaReEaZsBHo
         6GX0S3E8BYAWpPK8x2iTa/mxIWREdbgkD+/RLVz+e+BD/akbyqW61ef6fRFsutStYKlQ
         LrUe8p4jhh7diVIFxLp0XKe/D+9yFzj6DgkUKeY75JAhfSu5DleNxXyd5i3ebDJNqiBs
         hXeyQMW9xmT+FyC7ONC6mlPUli3+lpzGmSgT9jnIfwoLw0pvZVBlSaDxX9tJvUASptj8
         thKz29odoe5GhzjARvgGodEAisFrPP9YvVweXNbyVCmk/uiCM66FrH04X/M7XbcnmCMm
         TmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tk5q01wByhmGfx3y9W8hkeUtKKL431A8mMZaov4wr6I=;
        b=WqaqEoaOko/WJNXjg4dI/3REz5z3htEBqRPtIPJ5dd43ckHAAzEzs6lGFIb3yb5Ne4
         vKkHrnmKmALiC/P7Mw4aLvf1mwjkxO15FdGMt4K6c0QUZfTYH+Po0wVtchv8HLHAZb4A
         gTy4X1o90nHgx0OByjjUyxpzUOK1ZhRWT3C+jZ0WwbRwd9WwkM+XKCZ+jhEN/VQaz1lC
         BbbAgOG900yfpFZYfHeorHgIDEXrTogmyfFCAoi1kK3S3nZOO0Tp8cdNVsq1YUu7DJaD
         L07P7qnHkiiWF9ABaClDhH6XJnFgfJWcnAk9d6siLEKcjLwLthqyT/Qp3JPibkL0uiJA
         RogA==
X-Gm-Message-State: ACrzQf3OF4x4LyEloKg8GnpBayCIiqOO5U+YxQnqS/G/2MqN+hyNanQ2
        v05uOJr1N/tU5s+YEWOfiNU19A==
X-Google-Smtp-Source: AMsMyM794FKVPiG5doST1Ny4T3hzwQp+EydqJ7XOsQlSZo7ltguttyQl3AdE7EE14OlYKKoj26vUCQ==
X-Received: by 2002:a05:600c:474a:b0:3b4:cb93:7d57 with SMTP id w10-20020a05600c474a00b003b4cb937d57mr10844949wmo.41.1665154525658;
        Fri, 07 Oct 2022 07:55:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:5a9e:bab6:45e8:abe8])
        by smtp.gmail.com with ESMTPSA id f8-20020a5d50c8000000b0022e36c1113fsm2294707wrt.13.2022.10.07.07.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 07:55:24 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v3 0/4] bindings: implement python bindings for libgpiod v2
Date:   Fri,  7 Oct 2022 16:55:17 +0200
Message-Id: <20221007145521.329614-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
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

This is the third iteration of python bindings for libgpiod but it really has
very little in common with the previous version.

This time the code has been split into high-level python and low-level
C layers with the latter only doing the bare minimum.

The data model is mostly based on the C++ one with the main difference
being utilizing dynamic typing and keyword arguments in place of the
builder pattern. That allows us to reduce the number of methods and
objects.

Because python doesn't have RAII, unlike C++, we provide a module-level
request_lines() helper as gpiod.Chip(path).request_lines(...) one-liner
could lead to the chip left dangling even after the last reference is
dropped.

Because python forces us to dynamically allocate objects all the time even
for fundamental types (which are also immutable) there's no point in trying
to replicate the edge-event buffer. Instead LineRequest.read_edge_event()
just returns a list of events.

Bartosz Golaszewski (4):
  bindings: python: remove old version
  bindings: python: add examples
  bindings: python: add tests
  bindings: python: implement python bindings for libgpiod v2

 bindings/python/.gitignore                   |    8 +
 bindings/python/Makefile.am                  |   26 +-
 bindings/python/examples/Makefile.am         |   16 +-
 bindings/python/examples/gpiodetect.py       |   15 +-
 bindings/python/examples/gpiofind.py         |   14 +-
 bindings/python/examples/gpioget.py          |   34 +-
 bindings/python/examples/gpioinfo.py         |   41 +-
 bindings/python/examples/gpiomon.py          |   52 +-
 bindings/python/examples/gpioset.py          |   46 +-
 bindings/python/gpiod/Makefile.am            |   17 +
 bindings/python/gpiod/__init__.py            |   53 +
 bindings/python/gpiod/chip.py                |  308 ++
 bindings/python/gpiod/chip_info.py           |   21 +
 bindings/python/gpiod/edge_event.py          |   46 +
 bindings/python/gpiod/exception.py           |   20 +
 bindings/python/gpiod/ext/Makefile.am        |   11 +
 bindings/python/gpiod/ext/chip.c             |  335 +++
 bindings/python/gpiod/ext/common.c           |   92 +
 bindings/python/gpiod/ext/internal.h         |   20 +
 bindings/python/gpiod/ext/line-config.c      |  133 +
 bindings/python/gpiod/ext/line-settings.c    |  130 +
 bindings/python/gpiod/ext/module.c           |  193 ++
 bindings/python/gpiod/ext/request.c          |  402 +++
 bindings/python/gpiod/info_event.py          |   33 +
 bindings/python/gpiod/internal.py            |   19 +
 bindings/python/gpiod/line.py                |   56 +
 bindings/python/gpiod/line_info.py           |   73 +
 bindings/python/gpiod/line_request.py        |  258 ++
 bindings/python/gpiod/line_settings.py       |   62 +
 bindings/python/gpiodmodule.c                | 2662 ------------------
 bindings/python/setup.py                     |   47 +
 bindings/python/tests/Makefile.am            |   26 +-
 bindings/python/tests/__init__.py            |   17 +
 bindings/python/tests/__main__.py            |   16 +
 bindings/python/tests/gpiod_py_test.py       |  832 ------
 bindings/python/tests/gpiomockupmodule.c     |  309 --
 bindings/python/tests/gpiosim/Makefile.am    |    7 +
 bindings/python/tests/gpiosim/__init__.py    |    4 +
 bindings/python/tests/gpiosim/chip.py        |   66 +
 bindings/python/tests/gpiosim/ext.c          |  345 +++
 bindings/python/tests/helpers.py             |   16 +
 bindings/python/tests/tests_chip.py          |  231 ++
 bindings/python/tests/tests_chip_info.py     |   52 +
 bindings/python/tests/tests_edge_event.py    |  219 ++
 bindings/python/tests/tests_info_event.py    |  189 ++
 bindings/python/tests/tests_line_info.py     |  101 +
 bindings/python/tests/tests_line_request.py  |  449 +++
 bindings/python/tests/tests_line_settings.py |   79 +
 bindings/python/tests/tests_module.py        |   59 +
 configure.ac                                 |    3 +
 50 files changed, 4338 insertions(+), 3925 deletions(-)
 create mode 100644 bindings/python/.gitignore
 create mode 100644 bindings/python/gpiod/Makefile.am
 create mode 100644 bindings/python/gpiod/__init__.py
 create mode 100644 bindings/python/gpiod/chip.py
 create mode 100644 bindings/python/gpiod/chip_info.py
 create mode 100644 bindings/python/gpiod/edge_event.py
 create mode 100644 bindings/python/gpiod/exception.py
 create mode 100644 bindings/python/gpiod/ext/Makefile.am
 create mode 100644 bindings/python/gpiod/ext/chip.c
 create mode 100644 bindings/python/gpiod/ext/common.c
 create mode 100644 bindings/python/gpiod/ext/internal.h
 create mode 100644 bindings/python/gpiod/ext/line-config.c
 create mode 100644 bindings/python/gpiod/ext/line-settings.c
 create mode 100644 bindings/python/gpiod/ext/module.c
 create mode 100644 bindings/python/gpiod/ext/request.c
 create mode 100644 bindings/python/gpiod/info_event.py
 create mode 100644 bindings/python/gpiod/internal.py
 create mode 100644 bindings/python/gpiod/line.py
 create mode 100644 bindings/python/gpiod/line_info.py
 create mode 100644 bindings/python/gpiod/line_request.py
 create mode 100644 bindings/python/gpiod/line_settings.py
 delete mode 100644 bindings/python/gpiodmodule.c
 create mode 100644 bindings/python/setup.py
 create mode 100644 bindings/python/tests/__init__.py
 create mode 100644 bindings/python/tests/__main__.py
 delete mode 100755 bindings/python/tests/gpiod_py_test.py
 delete mode 100644 bindings/python/tests/gpiomockupmodule.c
 create mode 100644 bindings/python/tests/gpiosim/Makefile.am
 create mode 100644 bindings/python/tests/gpiosim/__init__.py
 create mode 100644 bindings/python/tests/gpiosim/chip.py
 create mode 100644 bindings/python/tests/gpiosim/ext.c
 create mode 100644 bindings/python/tests/helpers.py
 create mode 100644 bindings/python/tests/tests_chip.py
 create mode 100644 bindings/python/tests/tests_chip_info.py
 create mode 100644 bindings/python/tests/tests_edge_event.py
 create mode 100644 bindings/python/tests/tests_info_event.py
 create mode 100644 bindings/python/tests/tests_line_info.py
 create mode 100644 bindings/python/tests/tests_line_request.py
 create mode 100644 bindings/python/tests/tests_line_settings.py
 create mode 100644 bindings/python/tests/tests_module.py

-- 
2.34.1

