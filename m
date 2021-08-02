Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14C663DD235
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 10:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbhHBIoF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 04:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232433AbhHBIoF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 04:44:05 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E89C06175F
        for <linux-gpio@vger.kernel.org>; Mon,  2 Aug 2021 01:43:55 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id k65so5492960yba.13
        for <linux-gpio@vger.kernel.org>; Mon, 02 Aug 2021 01:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mFmvk8TebGShCTrQBKpRkbFcYKVOOJV5TrTcdCo9MiQ=;
        b=n64NzB9HjTV9VuD03fWGODYfaTheyHM82/TbUD8NbyOeQ78vyj0PMT7H2lCIJseslA
         83xeUsQfkejT3vk4J6H8B7L+1CMYrOu4+6fieAhvRuC4sHhlSp9qHsUiKsDBuDalRCUD
         EqIjrL8uoHcay32Jqju1KxkzP674e9VOEO5bQNBKDwuRVM64sdSc/34EgsU7T/tuVrIF
         n5G2DNljB1mnFIiKGgRj1oaJvaXVhOdhQ2An3/72deFIJbF/tXOvtQvA6iFOwhOtd/Uo
         yXf/Qa6pBf8v5HsEZepda4Mmn7qs+FBQJdQVtcBbNCnZP2zo3e9+k0e8l9I6YxdmUL9w
         y8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mFmvk8TebGShCTrQBKpRkbFcYKVOOJV5TrTcdCo9MiQ=;
        b=XxiH8xIq+B0+N4N4ghSeTt6RePDn27Lcy7Q5t2y8jGGlhRN/hsZxwleInnyKZsIp4T
         MpHtpn3lJPzFDGX9VS7VK3eFyDYlGLDaFLMA4f14MUNCGDolNlYKtEpfpCTURlFIw5lN
         psU5A5Ys3iw8R5Gbk40B+nAy5EeM7eLYgxt4ZfuXk9z9lJGtAIh4DzLhMTPqvUIdQ3mk
         hrfK2NV6cjJ6EnyTvuWKPQwYtVwEDX9nvU84o1nc/1EGPsh3R0WxTrqvbr/Kx60eJ7XL
         EhcrlC77zNMZaDZKBBWKeV+hBJ4Eno2AgTyZURNYCFYbj06EmN4WijSZ/V6XYFDiIVJn
         UrCA==
X-Gm-Message-State: AOAM533yzYq6GZiFsYL/yqZkvFJvpX9aWU1cdCZQkYYPEHz0gtjVI9qL
        906J6AJnXw3s3zPOcIX4el0+n4J/Nlyr2VI68Xg=
X-Google-Smtp-Source: ABdhPJz9ndflg7eyOnHvNU2z6cXIwAtNxfjQ/zEfdKwgvTB7tvdUkGova3/SbRqXFp1WF1VqQsuOiEb/gC3nDZcwwOc=
X-Received: by 2002:a25:7a03:: with SMTP id v3mr19838398ybc.202.1627893834963;
 Mon, 02 Aug 2021 01:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210727143400.32543-1-brgl@bgdev.pl>
In-Reply-To: <20210727143400.32543-1-brgl@bgdev.pl>
From:   Jack Winch <sunt.un.morcov@gmail.com>
Date:   Mon, 2 Aug 2021 09:43:44 +0100
Message-ID: <CAFhCfDZ1gHj2W0uDe1MZK71N87eH1pPBdEP32kcZys=pYEwSdA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3 0/3] libgpiod v2: C++ bindings
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Bartosz,

I am most certainly being *dense* here, but which libgpiod branch
should I be applying this patch series to?  Also, what other patch
series is this particular set of patches dependent on?  I tried to
apply against master and next/libgpiod-2.0 without much success this
weekend.  Also, just for clarity, how is the next/libgpiod-2.0 branch
being used at current?  Which and at what point are you applying
patches to this particular branch?

Once I've got over this basic hurdle, I'd like to do a 'holistic'
review of this patch series.  As I've not been following changes to
either the kernel subsystem or user library as of late, I feel this
approach to be more appropriate and thorough.

Finally, what is the target deadline for completion of the v2 API?

Best,
Jack

On Tue, Jul 27, 2021 at 3:34 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This series contains the implementation of the C++ bindings for libgpiod v2.
> In general the C++ library follows the data structure model as defined by
> the C library with one notable exception: objects that represent immutable
> snapshots of kernel data (line_info and edge & info events) are copyable
> (or rather shared behind the scenes using ::std::shared_ptr). The rest of
> the classes delete their copy constructors and assignment operators and
> are only move constructible and move assignable.
>
> All classes follow the pimpl idiom - using either shared_ptr or unique_ptr -
> and all implementations are hidden from the user for easier maintenance and
> less ABI breakage in the future.
>
> The edge_event class is a bit of a special case. While it looks the same
> as other copyable objects to the user, the implementation uses a tiny bit of
> polymorphism (although it never crosses the ABI boundary). This is done
> to make it possible to use the edge_event_buffer without any memory
> allocations like what the C API enables. The edge_event objects stored
> in the buffer only contain a raw pointer to the C object stored in the
> underlying C edge_event_buffer. The event is copied into a fully managed
> object once the copy assignment operator is called.
>
> I'm Cc'ing people who showed interest and helped me with C++ bindings
> before for review.
>
> v1 -> v2:
> Kent: I addressed most points from your review. Some are unaddressed due to
> personal preference (for instance: I still allow creating of empty line-request
> objects as they may be reused in subsequent requests). I also kept the 'watch'
> argument in get_line_info() as well as the boolean operators for chip and
> request - although with (hopefully) better documentation.
>
> v2 -> v3:
> - use scoped class enums instead of regular integer ones
> - rename getters to get_<property>() in order to avoid name conflicts with
>   the new enum types
>
> The first two patches extend the core C API of libgpiod as discussed.
>
> Bartosz Golaszewski (3):
>   API: add a function for retrieving the capacity of edge event buffers
>   API: extend the line request functionality
>   bindings: cxx: implement C++ bindings for libgpiod v2.0
>
>  Doxyfile.in                                 |   4 +-
>  bindings/cxx/Makefile.am                    |  16 +-
>  bindings/cxx/chip.cpp                       | 214 +++--
>  bindings/cxx/edge-event-buffer.cpp          | 103 +++
>  bindings/cxx/edge-event.cpp                 | 123 +++
>  bindings/cxx/examples/Makefile.am           |  12 +-
>  bindings/cxx/examples/gpiodetectcxx.cpp     |   9 +-
>  bindings/cxx/examples/gpiofindcxx.cpp       |   2 +-
>  bindings/cxx/examples/gpiogetcxx.cpp        |  12 +-
>  bindings/cxx/examples/gpioinfocxx.cpp       |  63 +-
>  bindings/cxx/examples/gpiomoncxx.cpp        |  39 +-
>  bindings/cxx/examples/gpiosetcxx.cpp        |  19 +-
>  bindings/cxx/gpiod.hpp                      | 938 +-------------------
>  bindings/cxx/gpiodcxx/Makefile.am           |  14 +
>  bindings/cxx/gpiodcxx/chip.hpp              | 180 ++++
>  bindings/cxx/gpiodcxx/edge-event-buffer.hpp | 115 +++
>  bindings/cxx/gpiodcxx/edge-event.hpp        | 125 +++
>  bindings/cxx/gpiodcxx/info-event.hpp        | 108 +++
>  bindings/cxx/gpiodcxx/line-config.hpp       | 250 ++++++
>  bindings/cxx/gpiodcxx/line-info.hpp         | 209 +++++
>  bindings/cxx/gpiodcxx/line-request.hpp      | 207 +++++
>  bindings/cxx/gpiodcxx/misc.hpp              |  49 +
>  bindings/cxx/gpiodcxx/request-config.hpp    |  97 ++
>  bindings/cxx/info-event.cpp                 |  89 ++
>  bindings/cxx/internal.hpp                   | 168 +++-
>  bindings/cxx/iter.cpp                       |  60 --
>  bindings/cxx/line-config.cpp                | 226 +++++
>  bindings/cxx/line-info.cpp                  | 150 ++++
>  bindings/cxx/line-request.cpp               | 194 ++++
>  bindings/cxx/line.cpp                       | 321 -------
>  bindings/cxx/line_bulk.cpp                  | 366 --------
>  bindings/cxx/misc.cpp                       |  18 +
>  bindings/cxx/request-config.cpp             |  80 ++
>  configure.ac                                |   1 +
>  include/gpiod.h                             |  63 +-
>  lib/edge-event.c                            |   6 +
>  lib/line-request.c                          |  50 +-
>  tools/gpioget.c                             |   3 +-
>  38 files changed, 2854 insertions(+), 1849 deletions(-)
>  create mode 100644 bindings/cxx/edge-event-buffer.cpp
>  create mode 100644 bindings/cxx/edge-event.cpp
>  create mode 100644 bindings/cxx/gpiodcxx/Makefile.am
>  create mode 100644 bindings/cxx/gpiodcxx/chip.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/edge-event-buffer.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/edge-event.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/info-event.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/line-config.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/line-info.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/line-request.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/misc.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/request-config.hpp
>  create mode 100644 bindings/cxx/info-event.cpp
>  delete mode 100644 bindings/cxx/iter.cpp
>  create mode 100644 bindings/cxx/line-config.cpp
>  create mode 100644 bindings/cxx/line-info.cpp
>  create mode 100644 bindings/cxx/line-request.cpp
>  delete mode 100644 bindings/cxx/line.cpp
>  delete mode 100644 bindings/cxx/line_bulk.cpp
>  create mode 100644 bindings/cxx/misc.cpp
>  create mode 100644 bindings/cxx/request-config.cpp
>
> --
> 2.30.1
>
