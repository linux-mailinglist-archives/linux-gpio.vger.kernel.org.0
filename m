Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6877C3AF5E7
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jun 2021 21:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhFUTUu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Jun 2021 15:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhFUTUu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Jun 2021 15:20:50 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F614C061574
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jun 2021 12:18:35 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id i94so20880994wri.4
        for <linux-gpio@vger.kernel.org>; Mon, 21 Jun 2021 12:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hGh+FNwz/HfHEFJcA5VOdUgVO6ib5/6hyLsex2WdJZo=;
        b=KUFWAhYeGaSf32D9Yj5CbypCQ8s1la0Rxmyad4W7fzFT0D1zbaFl2e6jhqc7nQaweQ
         7UxcdpT4WqG6H8vtjP3052aildeUlSE8dZvNipvf3Xz1tAUeZrBZAYBPSE+s99oI709f
         HYrnJrBelGndlmHBJpEVwe7IfM7zd5HJ7Xv1mJf0JOsPVqqBrjQt59d2Whner+xb+ht7
         cOk8uDcH85hW0gE1j8LT8aOEa0jkCMyLE2OQexDjbKBJP+PBFKwQ/JX++2OgTqpnVR0w
         odjyWth+3yIgJFTOClKMqV7nqKSzLTEYXWfpGdyML4mfilIctzzpYoDJeoibF3fMcsve
         HvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hGh+FNwz/HfHEFJcA5VOdUgVO6ib5/6hyLsex2WdJZo=;
        b=p1ZRmJ2gFKGTV6GO7vvrQC93VrGv1lXJg8m4sp8bwaLfo/19RaLKQOUguDEc+gew5A
         95NC76WCi4LZC7TSTbrkcGSPPiUyceHEG14hZOPrHit2XgIN0tTyZd9BGq9drsV8YQ4C
         ubwP0br+1lqa3FvNZOJ1Y/lSKMbJlTapHzHQNIa88Syn2NVCCngiNlN0WKAecBlqTeXU
         Qy+CToFdLuA4DQACRQT7zZ/olQu2MKjvqR7Xw+b+lH6BghdUoMsHCgEkoJ6OH1amHAtb
         dw0MdnwTwmCb85uBaElFNyNSCNvrrfU3lm7IeiO6nV/AsXJ0PXwwUYkm0Qobq4bzTvBv
         F4Fg==
X-Gm-Message-State: AOAM530sZzrGqYIFPlSZ7OXShBJXx/dWtk0sEYQkBl9odinQ5swi6F0h
        oqEWSMOMAzmYWQJ2HeTilz844A==
X-Google-Smtp-Source: ABdhPJzut1JI9WbHR0tbppwP7Xxz7N5yW1fQn5xQ/+n2msgCdwI/Wk0HaFamL0eBdq0v9MbGoD0XvQ==
X-Received: by 2002:a05:6000:154c:: with SMTP id 12mr3699521wry.97.1624303114069;
        Mon, 21 Jun 2021 12:18:34 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-146-78.w2-15.abo.wanadoo.fr. [2.15.229.78])
        by smtp.gmail.com with ESMTPSA id j34sm19438243wms.19.2021.06.21.12.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 12:18:33 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH 0/4] libgpiod v2: C++ bindings
Date:   Mon, 21 Jun 2021 21:18:26 +0200
Message-Id: <20210621191830.10628-1-brgl@bgdev.pl>
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

Bartosz Golaszewski (4):
  events: hide the *_read_fd() symbols from the API header
  API: drop "peek" functions
  API: add an AS_IS value for bias setting
  bindings: cxx: implement C++ bindings for libgpiod v2.0

 Doxyfile.in                                 |   4 +-
 bindings/cxx/Makefile.am                    |  16 +-
 bindings/cxx/chip.cpp                       | 213 +++--
 bindings/cxx/edge-event-buffer.cpp          | 103 +++
 bindings/cxx/edge-event.cpp                 | 123 +++
 bindings/cxx/examples/Makefile.am           |  12 +-
 bindings/cxx/examples/gpiodetectcxx.cpp     |   3 +-
 bindings/cxx/examples/gpiogetcxx.cpp        |  12 +-
 bindings/cxx/examples/gpioinfocxx.cpp       |  63 +-
 bindings/cxx/examples/gpiomoncxx.cpp        |  38 +-
 bindings/cxx/examples/gpiosetcxx.cpp        |  19 +-
 bindings/cxx/gpiod.hpp                      | 938 +-------------------
 bindings/cxx/gpiodcxx/Makefile.am           |  14 +
 bindings/cxx/gpiodcxx/chip.hpp              | 172 ++++
 bindings/cxx/gpiodcxx/edge-event-buffer.hpp | 115 +++
 bindings/cxx/gpiodcxx/edge-event.hpp        | 124 +++
 bindings/cxx/gpiodcxx/info-event.hpp        | 107 +++
 bindings/cxx/gpiodcxx/line-config.hpp       | 242 +++++
 bindings/cxx/gpiodcxx/line-info.hpp         | 205 +++++
 bindings/cxx/gpiodcxx/line-request.hpp      | 170 ++++
 bindings/cxx/gpiodcxx/misc.hpp              |  49 +
 bindings/cxx/gpiodcxx/request-config.hpp    |  95 ++
 bindings/cxx/info-event.cpp                 |  89 ++
 bindings/cxx/internal.hpp                   | 168 +++-
 bindings/cxx/iter.cpp                       |  60 --
 bindings/cxx/line-config.cpp                | 222 +++++
 bindings/cxx/line-info.cpp                  | 150 ++++
 bindings/cxx/line-request.cpp               | 161 ++++
 bindings/cxx/line.cpp                       | 321 -------
 bindings/cxx/line_bulk.cpp                  | 366 --------
 bindings/cxx/misc.cpp                       |  18 +
 bindings/cxx/request-config.cpp             |  80 ++
 configure.ac                                |   1 +
 include/gpiod.h                             |  79 +-
 lib/edge-event.c                            |  39 +-
 lib/info-event.c                            |  10 +-
 lib/internal.h                              |   4 +-
 lib/line-config.c                           |   1 +
 lib/line-info.c                             |  24 +-
 tools/gpiomon.c                             |   4 +-
 40 files changed, 2701 insertions(+), 1933 deletions(-)
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

