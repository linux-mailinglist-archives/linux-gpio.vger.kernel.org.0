Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DEF332719
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 14:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbhCIN0q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 08:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbhCIN0n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 08:26:43 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C503BC06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 05:26:42 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id l12so15543241wry.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 05:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HqdEDbe6myn7ByW6S0V10cNli3IRr+YQl2PTF8ONqhU=;
        b=LG/xqZpKyZnVW/tMHmbP7q8wa1oa3okSJO5A4Y/C0R5LpcW0NoCulie4v6JQ8+zje8
         aJ4Hj1xoSt2IyyNnw5Rk4jvapsOiSjhL7fcljw9nLDWb9rdvYv/c17FZoIH0ubNSB/aI
         v/r2JAMtmAcLj8quhn9xkk+QfVw7WvLAQRSxlbRaFD15XxZCQFxK4QY9J6ThfEoWHYA9
         eUfoQP/YHL/72SYeEX6f6ybfz1kPTXxCDRBigsuYJGyDpC6kBRM1oLXw+HfyjSExu4tG
         tXz49iL6FXVDcVbfeCTBb2b4d8XHuxQyi/ibNBW5Jq4sufOV1RqhscuhZwL/JJR+6eoB
         eGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HqdEDbe6myn7ByW6S0V10cNli3IRr+YQl2PTF8ONqhU=;
        b=EL0OPhFs9Q0ORRJaUSKvpSla7Qrky+hLJl9OPQu7xQIlSuHbyXPyJp2i5SUKNlLni1
         hisySC9RLVukExi0WozCQ0qcL+TUrObyuoy1UXWc4J2hYyjBuQWxXgkMJ9aSGKr8T6s/
         emRoy6Rx67pvHDDL3sAGs5mmzKHGgPQ7qLFiq8lKboEhWVj5iA3xSeGVu7YoDsCDQGRl
         m3wpLZhtxHfHX9u8zsq6s7Cdkej5rXUfJ8jpqDMBN3WZ/AwGgf94K2Qf6quxZ5LarFjJ
         aKAslJUoMLRVzjr+62lUXtaqpdRhIEuj/O7lfkY22YlCRmxBgo4Rw7n/RR/VWY+EollI
         Abpg==
X-Gm-Message-State: AOAM530qa3zwCTQw8XZR3QUJlLCk/qKYBWkwzxaQUXmaXCSNyPnssu2d
        1ykhtPjvqB6uBDYRhASeaDzS/K1VmApxDA==
X-Google-Smtp-Source: ABdhPJwWz+sgpuwJzYqwqs+UZ37A26iq31mErucBQZzdsCSCR1IkHyk8Jt4iZhN3tRjhYpuY6oJGUg==
X-Received: by 2002:a05:6000:10c3:: with SMTP id b3mr27730784wrx.96.1615296401585;
        Tue, 09 Mar 2021 05:26:41 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id u23sm4123366wmn.26.2021.03.09.05.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 05:26:41 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 0/6] treewide: another bunch of cleanups for v2.0
Date:   Tue,  9 Mar 2021 14:26:33 +0100
Message-Id: <20210309132639.29069-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Kent suggested I send the patches for v2.0 API in smaller batches for earlier
review instead of dropping a huge patch bomb that will require more work from
my side and may later be negatively reviewed so here's a hopefully the last
part of cleanups that can go into master already before first patches with the
new C API will drop.

The idea for the new C API is this: all objects are opaque and refcounted. This
is why the chip was converted to reference counting. Lines were removed and
their functionality split into line_info and line_request, this is why I'm
reworking line lookup to return the HW offset within a chip and not the line
object. Other patches are mostly cleanups and cruft shave-off.

Bartosz Golaszewski (6):
  treewide: simplify line lookup
  tests: remove line bulk test cases
  core: switch to reference counting for gpio chip objects
  treewide: remove is_requested() and is_free()
  treewide: kill line updating
  core: hide the GPIOD_API symbol

 bindings/cxx/Makefile.am               |   2 +-
 bindings/cxx/chip.cpp                  |  54 +++---
 bindings/cxx/examples/gpiofindcxx.cpp  |   7 +-
 bindings/cxx/gpiod.hpp                 | 249 ++++++++++++-------------
 bindings/cxx/internal.hpp              |   9 +
 bindings/cxx/iter.cpp                  |  18 +-
 bindings/cxx/line.cpp                  |  86 ++++-----
 bindings/cxx/line_bulk.cpp             |  78 ++++----
 bindings/cxx/tests/tests-chip.cpp      |   6 +-
 bindings/cxx/tests/tests-line.cpp      |  57 ------
 bindings/python/examples/gpiofind.py   |   7 +-
 bindings/python/gpiodmodule.c          | 101 ++--------
 bindings/python/tests/gpiod_py_test.py |  49 +----
 include/gpiod.h                        | 229 +++++++++--------------
 lib/Makefile.am                        |   2 +-
 lib/core.c                             | 195 ++++++++++---------
 lib/helpers.c                          | 155 ++++++---------
 lib/internal.h                         |  11 ++
 lib/misc.c                             |   4 +-
 tests/Makefile.am                      |   1 -
 tests/gpiod-test.h                     |   2 +-
 tests/tests-bulk.c                     | 145 --------------
 tests/tests-chip.c                     |  17 +-
 tools/gpiodetect.c                     |   2 +-
 tools/gpiofind.c                       |  11 +-
 tools/gpioget.c                        |   2 +-
 tools/gpioinfo.c                       |   4 +-
 tools/gpiomon.c                        |   2 +-
 tools/gpioset.c                        |   2 +-
 29 files changed, 547 insertions(+), 960 deletions(-)
 create mode 100644 bindings/cxx/internal.hpp
 create mode 100644 lib/internal.h
 delete mode 100644 tests/tests-bulk.c

-- 
2.30.1

