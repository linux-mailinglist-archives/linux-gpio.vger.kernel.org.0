Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3068E3D7890
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 16:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbhG0OeD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 10:34:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbhG0OeD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 10:34:03 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F20C061757
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jul 2021 07:34:03 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id p5so10362861wro.7
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jul 2021 07:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S7sV2YRESDddKNibgx0NlIR1CvNs2QHunQ6p4DiJw0E=;
        b=mkNDrM43Dd2b3NdF+9kuUOXQ7HJmMBQ+q8ZU5uRDtH18b26uX09ExSI4YCnS6+hjVu
         uZ68smJv91VQTtkhRDyi59jDRRQgCX43rR1QlmRV6V+thixg2bFz75IZa7ZnliGZ7Xme
         iZBh+W57eDWYCspjk7OZCL4AAZctsYjWZZRNyiWgBAeSXMbCeDfnZsfJP8kgbPwThYFA
         jQl3c+68IjHdIg/siAM1onk2FVciz+8nw/gX97anmr850neMzhHXgOdU5WYfGQ6QrooY
         vhd9H9vqLoirmp11By7+lxAYWviy6rUzafFT+pHhIyGc88tIFn5mIEjvQy9dJo0Cmnrp
         OlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S7sV2YRESDddKNibgx0NlIR1CvNs2QHunQ6p4DiJw0E=;
        b=cS/N0Dqt4pKEK5XZJPpKTFaP8Mhth83r2TxtP/sLJiC/oMd0x6lqIkJlO9N7fLu1pM
         S3Z2L5RcEsxs/GnWMvHdfENmYRc1qEiKrl0k6Wmz+jbZzMxzYFuJ7S3RW9jDZbcJIdY+
         ZdnqAggx0Z/pMao0VffrL/ag6UQYp+bVfZgXJ+2y4EkmChkyyOnsoEvErkDdn+3z7GrT
         ryKDKbEhj1NSOsa4xKZLwKfKjNMqC5QA4BKWeqBxvOuxzexWMd0KORTwR7fk33A8+chJ
         51S8gFGaGcu/qlSFwGoJsBZnnyDHX9Ufd1xFvfogbow1e35UJsDNS7oByqsGmOcm+NA4
         zvrA==
X-Gm-Message-State: AOAM531/EXovGStNSMbkTrmsHpo0g7qaW+bMcsVXsCPPfuvo6Ptwsv0a
        x6ziLe9wZj03+5nrn7cGjQTpQw==
X-Google-Smtp-Source: ABdhPJyKq3IVWFhCL5gW3wqVEu7FtUR8sKUM2Ioy7knbUUnasWel6ea6BFoDV29Rl38kS6f2CNUeig==
X-Received: by 2002:a5d:64cc:: with SMTP id f12mr24813837wri.201.1627396441641;
        Tue, 27 Jul 2021 07:34:01 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id j1sm3782729wrm.86.2021.07.27.07.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 07:34:01 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH v3 0/3] libgpiod v2: C++ bindings
Date:   Tue, 27 Jul 2021 16:33:57 +0200
Message-Id: <20210727143400.32543-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This series contains the implementation of the C++ bindings for libgpiod v2.
In general the C++ library follows the data structure model as defined by
the C library with one notable exception: objects that represent immutable
snapshots of kernel data (line_info and edge & info events) are copyable
(or rather shared behind the scenes using ::std::shared_ptr). The rest of
the classes delete their copy constructors and assignment operators and
are only move constructible and move assignable.

All classes follow the pimpl idiom - using either shared_ptr or unique_ptr -
and all implementations are hidden from the user for easier maintenance and
less ABI breakage in the future.

The edge_event class is a bit of a special case. While it looks the same
as other copyable objects to the user, the implementation uses a tiny bit of
polymorphism (although it never crosses the ABI boundary). This is done
to make it possible to use the edge_event_buffer without any memory
allocations like what the C API enables. The edge_event objects stored
in the buffer only contain a raw pointer to the C object stored in the
underlying C edge_event_buffer. The event is copied into a fully managed
object once the copy assignment operator is called.

I'm Cc'ing people who showed interest and helped me with C++ bindings
before for review.

v1 -> v2:
Kent: I addressed most points from your review. Some are unaddressed due to
personal preference (for instance: I still allow creating of empty line-request
objects as they may be reused in subsequent requests). I also kept the 'watch'
argument in get_line_info() as well as the boolean operators for chip and
request - although with (hopefully) better documentation.

v2 -> v3:
- use scoped class enums instead of regular integer ones
- rename getters to get_<property>() in order to avoid name conflicts with
  the new enum types

The first two patches extend the core C API of libgpiod as discussed.

Bartosz Golaszewski (3):
  API: add a function for retrieving the capacity of edge event buffers
  API: extend the line request functionality
  bindings: cxx: implement C++ bindings for libgpiod v2.0

 Doxyfile.in                                 |   4 +-
 bindings/cxx/Makefile.am                    |  16 +-
 bindings/cxx/chip.cpp                       | 214 +++--
 bindings/cxx/edge-event-buffer.cpp          | 103 +++
 bindings/cxx/edge-event.cpp                 | 123 +++
 bindings/cxx/examples/Makefile.am           |  12 +-
 bindings/cxx/examples/gpiodetectcxx.cpp     |   9 +-
 bindings/cxx/examples/gpiofindcxx.cpp       |   2 +-
 bindings/cxx/examples/gpiogetcxx.cpp        |  12 +-
 bindings/cxx/examples/gpioinfocxx.cpp       |  63 +-
 bindings/cxx/examples/gpiomoncxx.cpp        |  39 +-
 bindings/cxx/examples/gpiosetcxx.cpp        |  19 +-
 bindings/cxx/gpiod.hpp                      | 938 +-------------------
 bindings/cxx/gpiodcxx/Makefile.am           |  14 +
 bindings/cxx/gpiodcxx/chip.hpp              | 180 ++++
 bindings/cxx/gpiodcxx/edge-event-buffer.hpp | 115 +++
 bindings/cxx/gpiodcxx/edge-event.hpp        | 125 +++
 bindings/cxx/gpiodcxx/info-event.hpp        | 108 +++
 bindings/cxx/gpiodcxx/line-config.hpp       | 250 ++++++
 bindings/cxx/gpiodcxx/line-info.hpp         | 209 +++++
 bindings/cxx/gpiodcxx/line-request.hpp      | 207 +++++
 bindings/cxx/gpiodcxx/misc.hpp              |  49 +
 bindings/cxx/gpiodcxx/request-config.hpp    |  97 ++
 bindings/cxx/info-event.cpp                 |  89 ++
 bindings/cxx/internal.hpp                   | 168 +++-
 bindings/cxx/iter.cpp                       |  60 --
 bindings/cxx/line-config.cpp                | 226 +++++
 bindings/cxx/line-info.cpp                  | 150 ++++
 bindings/cxx/line-request.cpp               | 194 ++++
 bindings/cxx/line.cpp                       | 321 -------
 bindings/cxx/line_bulk.cpp                  | 366 --------
 bindings/cxx/misc.cpp                       |  18 +
 bindings/cxx/request-config.cpp             |  80 ++
 configure.ac                                |   1 +
 include/gpiod.h                             |  63 +-
 lib/edge-event.c                            |   6 +
 lib/line-request.c                          |  50 +-
 tools/gpioget.c                             |   3 +-
 38 files changed, 2854 insertions(+), 1849 deletions(-)
 create mode 100644 bindings/cxx/edge-event-buffer.cpp
 create mode 100644 bindings/cxx/edge-event.cpp
 create mode 100644 bindings/cxx/gpiodcxx/Makefile.am
 create mode 100644 bindings/cxx/gpiodcxx/chip.hpp
 create mode 100644 bindings/cxx/gpiodcxx/edge-event-buffer.hpp
 create mode 100644 bindings/cxx/gpiodcxx/edge-event.hpp
 create mode 100644 bindings/cxx/gpiodcxx/info-event.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line-config.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line-info.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line-request.hpp
 create mode 100644 bindings/cxx/gpiodcxx/misc.hpp
 create mode 100644 bindings/cxx/gpiodcxx/request-config.hpp
 create mode 100644 bindings/cxx/info-event.cpp
 delete mode 100644 bindings/cxx/iter.cpp
 create mode 100644 bindings/cxx/line-config.cpp
 create mode 100644 bindings/cxx/line-info.cpp
 create mode 100644 bindings/cxx/line-request.cpp
 delete mode 100644 bindings/cxx/line.cpp
 delete mode 100644 bindings/cxx/line_bulk.cpp
 create mode 100644 bindings/cxx/misc.cpp
 create mode 100644 bindings/cxx/request-config.cpp

-- 
2.30.1

