Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40EF750FD95
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Apr 2022 14:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346874AbiDZMyI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Apr 2022 08:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350240AbiDZMyB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2022 08:54:01 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299D03B2A2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 05:50:51 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id bg25so10426019wmb.4
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 05:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nnmV+R1l0GIMLieHRY7oVZefAhwEGyEspq0jj8ShUq0=;
        b=kb2xpVxFGEJAZhAbzhSEgpBRmxB9EpamxCxarrsXE4bow17hiE7yUk2B/MPr3TPOkC
         0ew93cbiHYAfpo0i/2EYzJkEa/LBvakEIdK7wGQUHwJ7lb60O99+0WEGDxNq9kb+9aHP
         MZP0Qr223GOrZGv9DzKeDX8vi3FWGgV3cCSPh3lVVuyvxuQYSbWYLHT0Hon7f7J55HSI
         VZ1J/IQYp1SNEFQ+uAIYXsRLQvLHqwkgpmirpwSQS7rFo76buazHOLmwuEY9lXdXbqxy
         w1vgwv4zIOzZ4wl4Rb+N9vP0uKgKf4qtft4OABiP4jfDAIkl8xzG+lyIrWvEj8MK40yn
         cETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nnmV+R1l0GIMLieHRY7oVZefAhwEGyEspq0jj8ShUq0=;
        b=ApV5Ths5TiX4nN8gpMxbxvfAcwLjRyKdebLgzgUmKnd84o8HKRu/gB+6KlQ3ru5Nvb
         KsXOI6TegGcpNC0rWry0PLt2Bv8Gu0N1a+pHavYBhesbSDitaxPIVxm3MHU5DeRtXZ6k
         hspv6LgzIUJK1QzuflkLuBFSKY9n1m067blbtYDkQ8GO2aTpNtCBCy+Fbo/yCJVbKQOc
         0dYtbyjtMHgQLAfFQPGUiQHdg6S//VA939o9sWmG5x4EmcVvCsYlEOTJFNyitOfcD8Ls
         GYGunCe9GLuh70aA7dGt0PygxfHWbQaBeo0kXvtGofwf+KfL0UmHcYNdEHtpC18TfJ78
         eR0A==
X-Gm-Message-State: AOAM530CWQBQkUEsbpMUDoSyL4td/8a7Hde9h7sIwigJBbecDPQl0b7W
        0Zw4HheFMyakoj2rxoiAbkRMgA==
X-Google-Smtp-Source: ABdhPJy13jLf97kcFFhHm+AmJNnVeIxfoSfJeB312YL6Fl+MO6cNjlRuJt6gIkGjOnIXO35sLtib+A==
X-Received: by 2002:a7b:c5cd:0:b0:38c:8b1b:d220 with SMTP id n13-20020a7bc5cd000000b0038c8b1bd220mr20912971wmk.118.1650977449674;
        Tue, 26 Apr 2022 05:50:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:faf0:6ae0:9a53:ee37])
        by smtp.gmail.com with ESMTPSA id n20-20020a05600c3b9400b00393ea849663sm6128600wms.30.2022.04.26.05.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 05:50:49 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexander Stein <alexander.stein@mailbox.org>,
        David Kozub <zub@linux.fjfi.cvut.cz>,
        =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
        Michael Beach <michaelb@ieee.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v6 0/5] bindings: cxx: implement C++ bindings for libgpiod v2.0
Date:   Tue, 26 Apr 2022 14:50:18 +0200
Message-Id: <20220426125023.2664623-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.32.0
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

This rewrites the C++ bindings for libgpiod in order to work with v2.0
version of the C API. The C++ standard use is C++17 which is well
supported in GCC. The documentation covers the entire API so for details
please refer to it, the tests and example programs.

I suggested by Kent, I've also split the big patch into several subpatches
which are not bisectable but make the review easier.

I'm Cc'ing people who've worked on the C++ bindings over time too in
this iteration.

I didn't address all the issues Kent raised in his las review. For the
gpiomon example it's because I sent a separate patch fixing the non-blocking
behavior of the request file descriptor first.

For the potential edge_event iterator - I simply don't understand how it
would work or if it would be needed at all since the code using the buffer
and iterating over it is already quite brief.

We can sort that out once we have most of the code in master.

Bartosz Golaszewski (5):
  bindings: cxx: remove old code
  bindings: cxx: add v2 headers
  bindings: cxx: add v2 tests
  bindings: cxx: add examples
  bindings: cxx: add implementation

 Doxyfile.in                                 |   4 +-
 bindings/cxx/Makefile.am                    |  23 +-
 bindings/cxx/chip-info.cpp                  |  74 ++
 bindings/cxx/chip.cpp                       | 213 +++--
 bindings/cxx/edge-event-buffer.cpp          | 115 +++
 bindings/cxx/edge-event.cpp                 | 135 +++
 bindings/cxx/examples/Makefile.am           |  16 +-
 bindings/cxx/examples/gpiodetectcxx.cpp     |  10 +-
 bindings/cxx/examples/gpiofindcxx.cpp       |   4 +-
 bindings/cxx/examples/gpiogetcxx.cpp        |  19 +-
 bindings/cxx/examples/gpioinfocxx.cpp       |  64 +-
 bindings/cxx/examples/gpiomoncxx.cpp        |  53 +-
 bindings/cxx/examples/gpiosetcxx.cpp        |  33 +-
 bindings/cxx/exception.cpp                  | 119 +++
 bindings/cxx/gpiod.hpp                      | 944 +-------------------
 bindings/cxx/gpiodcxx/Makefile.am           |  18 +
 bindings/cxx/gpiodcxx/chip-info.hpp         | 105 +++
 bindings/cxx/gpiodcxx/chip.hpp              | 179 ++++
 bindings/cxx/gpiodcxx/edge-event-buffer.hpp | 129 +++
 bindings/cxx/gpiodcxx/edge-event.hpp        | 137 +++
 bindings/cxx/gpiodcxx/exception.hpp         | 158 ++++
 bindings/cxx/gpiodcxx/info-event.hpp        | 123 +++
 bindings/cxx/gpiodcxx/line-config.hpp       | 564 ++++++++++++
 bindings/cxx/gpiodcxx/line-info.hpp         | 176 ++++
 bindings/cxx/gpiodcxx/line-request.hpp      | 221 +++++
 bindings/cxx/gpiodcxx/line.hpp              | 274 ++++++
 bindings/cxx/gpiodcxx/misc.hpp              |  44 +
 bindings/cxx/gpiodcxx/request-config.hpp    | 163 ++++
 bindings/cxx/gpiodcxx/timestamp.hpp         | 122 +++
 bindings/cxx/info-event.cpp                 | 102 +++
 bindings/cxx/internal.cpp                   |  28 +
 bindings/cxx/internal.hpp                   | 208 ++++-
 bindings/cxx/iter.cpp                       |  60 --
 bindings/cxx/line-config.cpp                | 685 ++++++++++++++
 bindings/cxx/line-info.cpp                  | 189 ++++
 bindings/cxx/line-request.cpp               | 225 +++++
 bindings/cxx/line.cpp                       | 331 ++-----
 bindings/cxx/line_bulk.cpp                  | 366 --------
 bindings/cxx/misc.cpp                       |  20 +
 bindings/cxx/request-config.cpp             | 174 ++++
 bindings/cxx/tests/Makefile.am              |  28 +-
 bindings/cxx/tests/check-kernel.cpp         |  48 +
 bindings/cxx/tests/gpio-mockup.cpp          | 153 ----
 bindings/cxx/tests/gpio-mockup.hpp          |  94 --
 bindings/cxx/tests/gpiod-cxx-test.cpp       |  55 --
 bindings/cxx/tests/gpiosim.cpp              | 258 ++++++
 bindings/cxx/tests/gpiosim.hpp              |  69 ++
 bindings/cxx/tests/helpers.cpp              |  37 +
 bindings/cxx/tests/helpers.hpp              |  62 ++
 bindings/cxx/tests/tests-chip-info.cpp      | 109 +++
 bindings/cxx/tests/tests-chip.cpp           | 218 +++--
 bindings/cxx/tests/tests-edge-event.cpp     | 417 +++++++++
 bindings/cxx/tests/tests-event.cpp          | 280 ------
 bindings/cxx/tests/tests-info-event.cpp     | 198 ++++
 bindings/cxx/tests/tests-iter.cpp           |  21 -
 bindings/cxx/tests/tests-line-config.cpp    | 270 ++++++
 bindings/cxx/tests/tests-line-info.cpp      | 156 ++++
 bindings/cxx/tests/tests-line-request.cpp   | 490 ++++++++++
 bindings/cxx/tests/tests-line.cpp           | 494 ++--------
 bindings/cxx/tests/tests-misc.cpp           |  78 ++
 bindings/cxx/tests/tests-request-config.cpp | 155 ++++
 configure.ac                                |   1 +
 62 files changed, 7406 insertions(+), 2912 deletions(-)
 create mode 100644 bindings/cxx/chip-info.cpp
 create mode 100644 bindings/cxx/edge-event-buffer.cpp
 create mode 100644 bindings/cxx/edge-event.cpp
 create mode 100644 bindings/cxx/exception.cpp
 create mode 100644 bindings/cxx/gpiodcxx/Makefile.am
 create mode 100644 bindings/cxx/gpiodcxx/chip-info.hpp
 create mode 100644 bindings/cxx/gpiodcxx/chip.hpp
 create mode 100644 bindings/cxx/gpiodcxx/edge-event-buffer.hpp
 create mode 100644 bindings/cxx/gpiodcxx/edge-event.hpp
 create mode 100644 bindings/cxx/gpiodcxx/exception.hpp
 create mode 100644 bindings/cxx/gpiodcxx/info-event.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line-config.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line-info.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line-request.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line.hpp
 create mode 100644 bindings/cxx/gpiodcxx/misc.hpp
 create mode 100644 bindings/cxx/gpiodcxx/request-config.hpp
 create mode 100644 bindings/cxx/gpiodcxx/timestamp.hpp
 create mode 100644 bindings/cxx/info-event.cpp
 create mode 100644 bindings/cxx/internal.cpp
 delete mode 100644 bindings/cxx/iter.cpp
 create mode 100644 bindings/cxx/line-config.cpp
 create mode 100644 bindings/cxx/line-info.cpp
 create mode 100644 bindings/cxx/line-request.cpp
 delete mode 100644 bindings/cxx/line_bulk.cpp
 create mode 100644 bindings/cxx/misc.cpp
 create mode 100644 bindings/cxx/request-config.cpp
 create mode 100644 bindings/cxx/tests/check-kernel.cpp
 delete mode 100644 bindings/cxx/tests/gpio-mockup.cpp
 delete mode 100644 bindings/cxx/tests/gpio-mockup.hpp
 delete mode 100644 bindings/cxx/tests/gpiod-cxx-test.cpp
 create mode 100644 bindings/cxx/tests/gpiosim.cpp
 create mode 100644 bindings/cxx/tests/gpiosim.hpp
 create mode 100644 bindings/cxx/tests/helpers.cpp
 create mode 100644 bindings/cxx/tests/helpers.hpp
 create mode 100644 bindings/cxx/tests/tests-chip-info.cpp
 create mode 100644 bindings/cxx/tests/tests-edge-event.cpp
 delete mode 100644 bindings/cxx/tests/tests-event.cpp
 create mode 100644 bindings/cxx/tests/tests-info-event.cpp
 delete mode 100644 bindings/cxx/tests/tests-iter.cpp
 create mode 100644 bindings/cxx/tests/tests-line-config.cpp
 create mode 100644 bindings/cxx/tests/tests-line-info.cpp
 create mode 100644 bindings/cxx/tests/tests-line-request.cpp
 create mode 100644 bindings/cxx/tests/tests-misc.cpp
 create mode 100644 bindings/cxx/tests/tests-request-config.cpp

-- 
2.32.0

