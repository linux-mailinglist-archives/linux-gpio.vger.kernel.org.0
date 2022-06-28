Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B476D55DC4C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 15:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343987AbiF1Imp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 04:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245476AbiF1Imm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 04:42:42 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D9EE2D1D5
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 01:42:32 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id b26so4184237wrc.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 01:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yI2wfuwspnhWpw1SugA9ZEjFhAI72lbLjLh5RrmzB3E=;
        b=aE6oc5MldI+d9WkKqbWXBjioXInsN6Fko14OlIGdwkE0BiFUx0b7KQHiZgmlNdHzje
         gxxLc32Ni595iD6mbau/z8EsP4TculOQYfrGvPHFVonv8elHiHdndBmIbcauwUulVGIf
         5IVsv9yG/taoaA72zHSgCy9ewvpGNJN+E+Gjx5JVOqgCZJaa5fB0LFyP29jp1r6PliCW
         AK3yqFHkRbcJqObZFcS9nHdogSqILP0keLT1/GxCsjCBfn48fMcaga+Z8M95eon0SfsF
         y5FFTuXVMB5jYM6mb6itUqBhLAqGcfwcol9QlPs2IYI4YEymRoYVTkCUVfky+2WhZMyu
         RusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yI2wfuwspnhWpw1SugA9ZEjFhAI72lbLjLh5RrmzB3E=;
        b=ovg7qxCx5KPIPCGPhr5or7OdJnkKGTeSYN1GjlszqsXEOc4bxWiZF0Nfxx1fzzHtWe
         Eqe5zP1fsx8RPaNSlDBHqs4wb51Rm/arEAt8/UeA029j+blnnBfpZe5pQ7zl1S8WChS7
         QOP5BHxGbCtqXyIILbA18p54RyEJBi3HQJyB+GLfdZPofIbIX7kdtyhGeWstDshmU76R
         FBCSePIjq/56HRyDZ+8Sp9uNdsPKWw8rh9RS9O5ATu4hp0dEPXUKo6iiztPwnLBvCeOw
         DSlM81ppxrxabQbvxyUc9eWlVgxjXJsYC/lDouM0qIKnFxxfd3nMlsSKedD7lfmHec0k
         Qo7g==
X-Gm-Message-State: AJIora9mNHnKjIRRfNZapCN5Ir4ZeKAExURQgmpDau2pBllh9ygzE9ee
        eMGdup5Q7toIFq/JaZD/D94tXQ==
X-Google-Smtp-Source: AGRyM1v4x5xmi65iEXWM0+R4La3+B3Zh5ss9JNkD9KRphp+aVcdWe/AvThsuLpkWpmC4+t76AfF5wQ==
X-Received: by 2002:a5d:5601:0:b0:21b:8f5f:9712 with SMTP id l1-20020a5d5601000000b0021b8f5f9712mr15764753wrv.548.1656405750538;
        Tue, 28 Jun 2022 01:42:30 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:51e:c065:fa3f:a137])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d43cf000000b0021badf3cb26sm15596062wrr.63.2022.06.28.01.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 01:42:30 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v2 0/5] bindings: implement python bindings for libgpiod v2
Date:   Tue, 28 Jun 2022 10:42:21 +0200
Message-Id: <20220628084226.472035-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
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

This series adds python bindings for libgpiod v2. The series is split
into several patches for easier review.

In general the python bindings follow what we did for C++ in terms of class
layout except that we leverage python's flexibility to reduce the number of
method variants by allowing different types of arguments.

Because python doesn't have RAII, unlike C++, we provide a module-level
request_lines() helper as gpiod.Chip(path).request_lines(...) one-liner
could lead to the chip left dangling even after the last reference is
dropped.

Because python forces us to dynamically allocate objects all the time even
for fundamental types (which are also immutable) there's no point in trying
to make the EdgeEventBuffer avoid copying the events like we did in C++
for better performance. Python simply isn't designed around speed.

v1 -> v2:
- all methods now accept keyword arguments even for mandatory positional ones
- added a global request_lines() function that enables easy one-liner liner
  requests
- improve and unify the pydoc format
- many smaller tweaks and fixes

Bartosz Golaszewski (5):
  bindings: python: remove old version
  bindings: python: enum: add a piece of common code for using python's
    enums from C
  bindings: python: add examples for v2 API
  bindings: python: add tests for v2 API
  bindings: python: add the implementation for v2 API

 bindings/python/.gitignore                    |    1 +
 bindings/python/Makefile.am                   |   19 +-
 bindings/python/chip-info.c                   |  126 +
 bindings/python/chip.c                        |  606 ++++
 bindings/python/edge-event-buffer.c           |  330 ++
 bindings/python/edge-event.c                  |  191 ++
 bindings/python/enum/Makefile.am              |    9 +
 bindings/python/enum/enum.c                   |  208 ++
 bindings/python/enum/enum.h                   |   24 +
 bindings/python/examples/gpiodetect.py        |   13 +-
 bindings/python/examples/gpiofind.py          |   12 +-
 bindings/python/examples/gpioget.py           |   28 +-
 bindings/python/examples/gpioinfo.py          |   39 +-
 bindings/python/examples/gpiomon.py           |   53 +-
 bindings/python/examples/gpioset.py           |   36 +-
 bindings/python/exception.c                   |  182 ++
 bindings/python/gpiodmodule.c                 | 2662 -----------------
 bindings/python/info-event.c                  |  175 ++
 bindings/python/line-config.c                 | 1373 +++++++++
 bindings/python/line-info.c                   |  286 ++
 bindings/python/line-request.c                |  803 +++++
 bindings/python/line.c                        |  239 ++
 bindings/python/module.c                      |  557 ++++
 bindings/python/module.h                      |   58 +
 bindings/python/request-config.c              |  320 ++
 bindings/python/tests/Makefile.am             |   15 +-
 bindings/python/tests/cases/__init__.py       |   12 +
 bindings/python/tests/cases/tests_chip.py     |  157 +
 .../python/tests/cases/tests_chip_info.py     |   59 +
 .../python/tests/cases/tests_edge_event.py    |  279 ++
 .../python/tests/cases/tests_info_event.py    |  135 +
 .../python/tests/cases/tests_line_config.py   |  254 ++
 .../python/tests/cases/tests_line_info.py     |   90 +
 .../python/tests/cases/tests_line_request.py  |  345 +++
 bindings/python/tests/cases/tests_misc.py     |   53 +
 .../tests/cases/tests_request_config.py       |   77 +
 bindings/python/tests/gpiod_py_test.py        |  827 +----
 bindings/python/tests/gpiomockupmodule.c      |  309 --
 bindings/python/tests/gpiosimmodule.c         |  434 +++
 configure.ac                                  |    3 +-
 40 files changed, 7517 insertions(+), 3882 deletions(-)
 create mode 100644 bindings/python/.gitignore
 create mode 100644 bindings/python/chip-info.c
 create mode 100644 bindings/python/chip.c
 create mode 100644 bindings/python/edge-event-buffer.c
 create mode 100644 bindings/python/edge-event.c
 create mode 100644 bindings/python/enum/Makefile.am
 create mode 100644 bindings/python/enum/enum.c
 create mode 100644 bindings/python/enum/enum.h
 create mode 100644 bindings/python/exception.c
 delete mode 100644 bindings/python/gpiodmodule.c
 create mode 100644 bindings/python/info-event.c
 create mode 100644 bindings/python/line-config.c
 create mode 100644 bindings/python/line-info.c
 create mode 100644 bindings/python/line-request.c
 create mode 100644 bindings/python/line.c
 create mode 100644 bindings/python/module.c
 create mode 100644 bindings/python/module.h
 create mode 100644 bindings/python/request-config.c
 create mode 100644 bindings/python/tests/cases/__init__.py
 create mode 100644 bindings/python/tests/cases/tests_chip.py
 create mode 100644 bindings/python/tests/cases/tests_chip_info.py
 create mode 100644 bindings/python/tests/cases/tests_edge_event.py
 create mode 100644 bindings/python/tests/cases/tests_info_event.py
 create mode 100644 bindings/python/tests/cases/tests_line_config.py
 create mode 100644 bindings/python/tests/cases/tests_line_info.py
 create mode 100644 bindings/python/tests/cases/tests_line_request.py
 create mode 100644 bindings/python/tests/cases/tests_misc.py
 create mode 100644 bindings/python/tests/cases/tests_request_config.py
 delete mode 100644 bindings/python/tests/gpiomockupmodule.c
 create mode 100644 bindings/python/tests/gpiosimmodule.c

-- 
2.34.1

