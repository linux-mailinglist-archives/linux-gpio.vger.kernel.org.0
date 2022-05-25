Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4700533ECD
	for <lists+linux-gpio@lfdr.de>; Wed, 25 May 2022 16:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244709AbiEYOHz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 May 2022 10:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244741AbiEYOHf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 May 2022 10:07:35 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798569D042
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 07:07:26 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id k30so30287319wrd.5
        for <linux-gpio@vger.kernel.org>; Wed, 25 May 2022 07:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7e9qj7DkMHIefIo+uvr6OPTfr/9Wx1BBky3N/P6pQI0=;
        b=iT6JNURZSMUec8YQwNJ/CL8xAqlMHUw1PaKiBpO8glZaFZ1dfpWVO2jvwlkmdcJvX6
         JHELgDxNj7bYdOz5nFV4SqUbXBUiNx9UhAUYRtRq4Xg5oFY8aABPquSTGAMGrNN1WzAY
         vWhF8aKJKbyEILqNRGlXmC1+H8Ta9n56YMrVjk7BIOkI92pJwr17RaVLETw5Msvp1e09
         c8VcP5/7X3lceLmdionPR6gk1Lwzr6DVNE1w3/4x3lwn+kqnQs63zc9wDExT1PmImULR
         oa+oa7oxMrix7NM2PCGE6d9TgNSZBrVfSBXiKcvyP431ENAypYl7PWRt+2MEn9VPLAz8
         iiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7e9qj7DkMHIefIo+uvr6OPTfr/9Wx1BBky3N/P6pQI0=;
        b=otajVwIGfRz83BSq8Ppv4LqUzkiYs7a15IevERbWXxWvYcorIYPzYpttuNH2UuEKJE
         viXcQ3OekOra57RrCiGKoKj9Q+cspJ/rMjxnwYt2TnkWgRyYx1uNXJ/dWTJt4ffHG4rQ
         ZZCXdhom3aZN5i/FPQgTdkJvy0jcXPQTkiQ8ypESM1TvbDJE4zucsEfAfp0gxm9D32Wa
         6WIBOZatTEnmOV7ElznJdMz+eEJ58Qe9dUbJxhPZnuTO5aplZNDfpUCHW5UdT4cJ1RKI
         dCat3g+PK7sgCCQb8OBWFJmqmyE7WCusslUYKtAipD5F6VqfQ59TrinHwce69eTBdHtT
         44nQ==
X-Gm-Message-State: AOAM530+I/iLxNmbo/bmwRnkcrGPQFydlkel+KbBtbKRGZXsnTQe7l9A
        XVlm14eL9IOyqH8B4iRszJVVXA==
X-Google-Smtp-Source: ABdhPJyDtuuibx5Z52LjEykIgYkFQbp4pLb5uOBkV2tYaQfiGzGB4bny5Gj+eoPZ0leNt4nDx9F51A==
X-Received: by 2002:a5d:52ce:0:b0:20c:e030:b05a with SMTP id r14-20020a5d52ce000000b0020ce030b05amr26720732wrv.174.1653487645001;
        Wed, 25 May 2022 07:07:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fb4f:2824:ee44:5505])
        by smtp.gmail.com with ESMTPSA id k42-20020a05600c1caa00b003973435c517sm2859570wms.0.2022.05.25.07.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:07:24 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH 0/5] bindings: implement python bindings for libgpiod v2
Date:   Wed, 25 May 2022 16:06:59 +0200
Message-Id: <20220525140704.94983-1-brgl@bgdev.pl>
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
 bindings/python/chip.c                        |  552 ++++
 bindings/python/edge-event-buffer.c           |  301 ++
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
 bindings/python/line-config.c                 | 1338 +++++++++
 bindings/python/line-info.c                   |  286 ++
 bindings/python/line-request.c                |  713 +++++
 bindings/python/line.c                        |  239 ++
 bindings/python/module.c                      |  281 ++
 bindings/python/module.h                      |   57 +
 bindings/python/request-config.c              |  320 ++
 bindings/python/tests/Makefile.am             |   15 +-
 bindings/python/tests/cases/__init__.py       |   12 +
 bindings/python/tests/cases/tests_chip.py     |  157 +
 .../python/tests/cases/tests_chip_info.py     |   59 +
 .../python/tests/cases/tests_edge_event.py    |  274 ++
 .../python/tests/cases/tests_info_event.py    |  135 +
 .../python/tests/cases/tests_line_config.py   |  250 ++
 .../python/tests/cases/tests_line_info.py     |   90 +
 .../python/tests/cases/tests_line_request.py  |  295 ++
 bindings/python/tests/cases/tests_misc.py     |   53 +
 .../tests/cases/tests_request_config.py       |   77 +
 bindings/python/tests/gpiod_py_test.py        |  827 +----
 bindings/python/tests/gpiomockupmodule.c      |  309 --
 bindings/python/tests/gpiosimmodule.c         |  434 +++
 configure.ac                                  |    3 +-
 40 files changed, 6973 insertions(+), 3882 deletions(-)
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

