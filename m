Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A83B73CAD9D
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jul 2021 22:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344594AbhGOUNh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 16:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343790AbhGOUNA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jul 2021 16:13:00 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46D5C061762
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 13:10:04 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id f9so9315297wrq.11
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 13:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qWWlyzoi+LtKiOl1UjLpyBrn4i31LGLB1Up1HMOFCQg=;
        b=H/OMeehNaQeXtnQmvvE1za+7kzLIQPc6KtFbjCFbZGJZ+MwpKVgc19GTQ+faO5VT7V
         xO2pL22vJkQCfk0ihhbtaTxnO0PiOwOLpC1VzP3LSoKPCmE30C7VadQUkrNitE4ewCfD
         wMjnGjY4M34BmSRhC6L5yJGYVRDONrsPkqlHoew0b2chNypOdy4OyBEqqcJcchdX3NlC
         KMylkWYQ5zc4Oet4Ks2P68VkAjICyLNZO/OQQZWEArw0qNi4LlXPR05EI6kjnJOP7c6v
         M9xjRXUrYJBGgtAH/kGUlmXVIs9ivgueGfzsrug6Ri1GF/kDVt3VD1xSxK5aaxaUDt+e
         d5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qWWlyzoi+LtKiOl1UjLpyBrn4i31LGLB1Up1HMOFCQg=;
        b=kKoONe0NfZ/XSPVNcSL7OKmsnS/75vMGhUINRABmoyUWGI4oKwYJsBUttmHMyZgX6v
         uG3aI+BJ2EiY9fLAOdX+hQctyTf72IVJJ/of1sfGLTeIaZnvB2to9wk8mAYPnTDj4n5S
         ruCN+K28ayXDEZjCTxysF6ca6/b32r+tAEHm1iJNXe1FGL58XpFC1FzvFa6Gn5/9sr+6
         h7MAuGtslbMvtyKO1oV28NYlkrFxPBndZwdpL1ngIJflONpPP8kfzYwTecTdl63Qwrt+
         nFY4fKf/qV03hIoUqZ8STRmk10E8HvUppnuBJ2beKI8PRD3FzpKW4IjAltMkJwGUSIsR
         yqPg==
X-Gm-Message-State: AOAM532KmsMJgNNJr7KfAucKzesihr+Ru9nA3WrlPxUfyS6eC8qq7Div
        AZKVTxZwzbWuk8ePvc+AREcV2Q==
X-Google-Smtp-Source: ABdhPJwMxjzTLB6a9XC+gdEny3F6ZIkd5ZIvBHOOTSVu0yMvnDKjBciD3TpJ7y3qA1f/GeU1jGzzIw==
X-Received: by 2002:adf:ed46:: with SMTP id u6mr7798281wro.252.1626379803475;
        Thu, 15 Jul 2021 13:10:03 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id m32sm8860986wms.23.2021.07.15.13.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 13:10:03 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod][PATCH v2 0/3] libgpiod v2: C++ bindings
Date:   Thu, 15 Jul 2021 22:09:58 +0200
Message-Id: <20210715201001.23726-1-brgl@bgdev.pl>
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
 bindings/cxx/examples/gpiodetectcxx.cpp     |   3 +-
 bindings/cxx/examples/gpiogetcxx.cpp        |  12 +-
 bindings/cxx/examples/gpioinfocxx.cpp       |  63 +-
 bindings/cxx/examples/gpiomoncxx.cpp        |  39 +-
 bindings/cxx/examples/gpiosetcxx.cpp        |  19 +-
 bindings/cxx/gpiod.hpp                      | 938 +-------------------
 bindings/cxx/gpiodcxx/Makefile.am           |  14 +
 bindings/cxx/gpiodcxx/chip.hpp              | 180 ++++
 bindings/cxx/gpiodcxx/edge-event-buffer.hpp | 115 +++
 bindings/cxx/gpiodcxx/edge-event.hpp        | 124 +++
 bindings/cxx/gpiodcxx/info-event.hpp        | 107 +++
 bindings/cxx/gpiodcxx/line-config.hpp       | 244 +++++
 bindings/cxx/gpiodcxx/line-info.hpp         | 205 +++++
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
 37 files changed, 2838 insertions(+), 1845 deletions(-)
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

