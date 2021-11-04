Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9E32445A85
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Nov 2021 20:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbhKDTZg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Nov 2021 15:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbhKDTZf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Nov 2021 15:25:35 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DC2C061714
        for <linux-gpio@vger.kernel.org>; Thu,  4 Nov 2021 12:22:57 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 133so5387457wme.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Nov 2021 12:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d585Se0HJg6ed8xW9VDwAvAC5egpJlXYCMNCDcAdEoo=;
        b=PnyutyywTyxgc/u6Amcy6gLy6W66h2rKt+eh/9ofMmTqzryI/oVqqfwLKPKnz9ESh3
         XEXT2ph1Wd8f7tGqVR2NUp4ckkknInr0Xr6hnXypM4ZGq1g/Cob3vO3kEvN7qvgrAl6W
         DUDAzQLWSqt9Su20aGEzPw5qZGjFnvPHs49Vd8hts0f3OmwKeXm/toYdICnxKH4mAfFi
         AzY+cJvGhLmIJuzfqEoxj/1lIsJ0SdGt4hy6w9WlD4v/0YmPfKOIbnd8GP6sT/ZeftCS
         2j2cdPmVdY+RXsxTobYstWftJosd4Tvc/w1X46It7De7tOe7rT5MIksknzZq5+VSoDQs
         fs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d585Se0HJg6ed8xW9VDwAvAC5egpJlXYCMNCDcAdEoo=;
        b=uHoEysxuL36yq1apNY+dR+wB1K3JEVjQGbR5HE4DHWbcsKkNGYsRLgKURDyo5pBUEU
         UXkRYfIpDMv2GjPkfqPtzlK0kuKWnM6OcqP11Jv+g4tS0yVr0+7m6hhWizIhPm9O6JRH
         GooqBrNunEP4CtbXcxAgtt8M7oD++OMC54OddZWeUVw9L7/WFPdvP7yoFzUWKTWFx+uD
         oVlUluC3TN0AZvzovuVt9MyCIV4zKwsAzLVYlRcGuWNcd18fcVF2cu4a/WfKYJZTVDXP
         fzbQldz7aNVuHNoUHxnYC/hlEoe23EEGKAzq9Fu7PlMtWkH0Bjw2U0rNgDQMRjt+TVjy
         RUTA==
X-Gm-Message-State: AOAM533DJPHUkhTMhxDod7EwmMaJulbvnMvfOqPP+tNGH+FetLTTfYpa
        R760JUBCqsDeNuhCmB1aHhJUgTEZyQ8V5A==
X-Google-Smtp-Source: ABdhPJxHoQjUtofeKQ5D7WsRegOvOFJnlQ0mbt12Xe8OMo0agcHEOrL01nqbuPoTkiblz4//eJkrDQ==
X-Received: by 2002:a1c:208b:: with SMTP id g133mr25785085wmg.128.1636053775649;
        Thu, 04 Nov 2021 12:22:55 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id f3sm9290784wmb.12.2021.11.04.12.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 12:22:55 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v4 0/2] libgpiod v2: C++ bindings
Date:   Thu,  4 Nov 2021 20:22:50 +0100
Message-Id: <20211104192252.21883-1-brgl@bgdev.pl>
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

v3 -> v4:
The bindings have been significantly rebuilt and the list of changes
is mostly likely too long put all here but in short:
- renamed and reworked the accessors
- added custom stream insertion operators and exceptions
- used scoped C++ enum and unifying their definitions across classes
- deconstified all mutators for logical consistency
- modified the implementation to work with the reworked C API
- many more small tweaks all over the place

Bartosz Golaszewski (2):
  line-config: rework the interface some more
  bindings: cxx: implement C++ bindings for libgpiod v2.0

 Doxyfile.in                                 |   4 +-
 bindings/cxx/Makefile.am                    |  18 +-
 bindings/cxx/chip.cpp                       | 214 +++--
 bindings/cxx/edge-event-buffer.cpp          | 118 +++
 bindings/cxx/edge-event.cpp                 | 135 +++
 bindings/cxx/examples/Makefile.am           |  12 +-
 bindings/cxx/examples/gpiodetectcxx.cpp     |   9 +-
 bindings/cxx/examples/gpiogetcxx.cpp        |  12 +-
 bindings/cxx/examples/gpioinfocxx.cpp       |  62 +-
 bindings/cxx/examples/gpiomoncxx.cpp        |  39 +-
 bindings/cxx/examples/gpiosetcxx.cpp        |  19 +-
 bindings/cxx/exception.cpp                  | 107 +++
 bindings/cxx/gpiod.hpp                      | 946 +-------------------
 bindings/cxx/gpiodcxx/Makefile.am           |  16 +
 bindings/cxx/gpiodcxx/chip.hpp              | 197 ++++
 bindings/cxx/gpiodcxx/edge-event-buffer.hpp | 122 +++
 bindings/cxx/gpiodcxx/edge-event.hpp        | 135 +++
 bindings/cxx/gpiodcxx/exception.hpp         | 149 +++
 bindings/cxx/gpiodcxx/info-event.hpp        | 115 +++
 bindings/cxx/gpiodcxx/line-config.hpp       | 445 +++++++++
 bindings/cxx/gpiodcxx/line-info.hpp         | 169 ++++
 bindings/cxx/gpiodcxx/line-request.hpp      | 214 +++++
 bindings/cxx/gpiodcxx/line.hpp              | 123 +++
 bindings/cxx/gpiodcxx/misc.hpp              |  44 +
 bindings/cxx/gpiodcxx/request-config.hpp    | 128 +++
 bindings/cxx/info-event.cpp                 | 102 +++
 bindings/cxx/internal.cpp                   |  91 ++
 bindings/cxx/internal.hpp                   | 188 +++-
 bindings/cxx/iter.cpp                       |  60 --
 bindings/cxx/line-config.cpp                | 589 ++++++++++++
 bindings/cxx/line-info.cpp                  | 199 ++++
 bindings/cxx/line-request.cpp               | 200 +++++
 bindings/cxx/line.cpp                       | 321 -------
 bindings/cxx/line_bulk.cpp                  | 366 --------
 bindings/cxx/misc.cpp                       |  20 +
 bindings/cxx/request-config.cpp             | 117 +++
 configure.ac                                |   1 +
 include/gpiod.h                             | 255 ++++--
 lib/line-config.c                           | 295 ++++--
 tools/gpioget.c                             |   6 +-
 tools/gpiomon.c                             |   6 +-
 tools/gpioset.c                             |   9 +-
 42 files changed, 4380 insertions(+), 1997 deletions(-)
 create mode 100644 bindings/cxx/edge-event-buffer.cpp
 create mode 100644 bindings/cxx/edge-event.cpp
 create mode 100644 bindings/cxx/exception.cpp
 create mode 100644 bindings/cxx/gpiodcxx/Makefile.am
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
 create mode 100644 bindings/cxx/info-event.cpp
 create mode 100644 bindings/cxx/internal.cpp
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

