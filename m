Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F82B73BEEB
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jun 2023 21:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231720AbjFWTgF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jun 2023 15:36:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjFWTgE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jun 2023 15:36:04 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C312703
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 12:36:00 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-78cbc37c5b1so410890241.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jun 2023 12:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687548959; x=1690140959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUQBV6q424UBV5yPp8637bIZu+a2ut9Isq45bIjjzl8=;
        b=AEMH+FYkvm9Z99DZkgwZvqQE7K66R1cVh74vmHaMHTACHlNRgeFW7WNOl4UgJERfhE
         8iXzI1p5k02WNMsMNQmY8mddIeLCdIleRV47hS7EvQPIxCFpk3m4sHqoJ0Mn1JokhbVl
         iE1Nbsme0xFe4JO4udxnk0yBvlMG7gYax8Ma7/ykwGlwSa9HXUK9Su6CFSdlXuPy6kQH
         sYYBU9xtOs4GUVVTxtPApcXlk+PEXZ7BdJruExa00lVeqTcxl0YoMeVoSnaEQYNgH6bg
         VqX/zvAzT9WVB8TgB1g/kqA5x3cN6pf1Ee5B2ZO9qrf6obKuFibzlZckr0kEfn3bY06w
         dECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687548959; x=1690140959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUQBV6q424UBV5yPp8637bIZu+a2ut9Isq45bIjjzl8=;
        b=fOJSu+uEw55Kj0yXVk0FGInquUkmdmrXXPSICZvEfvaG4ccvaBsRwYXjfCqrUBdYSJ
         QYWp6pXM/ykfCFf65PwIASyezTzESuGIKTgZezVkGMxFYjBEteUC9+h5S3zQAJbBjmWB
         9saNDj23CnD5IhaTRaizYExsHcbImACytORBkLGofh5rjjZtGBvBFZl79u4UZ5f011m1
         W8m8JoCHnyclPVjHhcmqCrLvAJw/3yaCeKpqdeZyPPpXoU8Wvfq6IMmDl0z/LM3Mvx0D
         A3ZtmDYsyjcdpRkZGZYiF34R2w7J5n5K4c6sTUY0ZLhcmCtszRq9zPh+cnn3gDIP9MtC
         fDQg==
X-Gm-Message-State: AC+VfDzjCYnmwILCP24ctSIrOjNdCjIJzL1VEyUjUSB0D67f4zimwUnQ
        v2tDWfUfY2EYoceEK5qhT2LJQrVR+AMAblFdbjhYuPSidhqVQfn5
X-Google-Smtp-Source: ACHHUZ7QrVH1SYkHF/egChxA65Sp9uPJF+wUmrYGWlznOtUMaqbpNDfTBqfVW5BG1Zng8Ht/gcgSlvLRpjAtxfLShDc=
X-Received: by 2002:a05:6102:242:b0:43c:8dc1:9df3 with SMTP id
 a2-20020a056102024200b0043c8dc19df3mr12144966vsq.7.1687548958910; Fri, 23 Jun
 2023 12:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230623043901.16764-1-warthog618@gmail.com>
In-Reply-To: <20230623043901.16764-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 23 Jun 2023 21:35:48 +0200
Message-ID: <CAMRc=McxvQDgDpYm+JKAYs7Uwuqv_EOhSAy-L_9memjgTmhaSw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/8] replace tool examples with use case examples
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 23, 2023 at 6:39=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> This series is the continuation of providing a set of use case based exam=
ples
> for libgpiod. The focus of this series is replacement of the examples
> replicating the the tools with examples that minimally cover the use case=
 that
> each tool addresses.
>
> The mapping from tool to use case is:
>   gpiodetect  ->  get_chip_info
>   gpiofind    ->  find_line_by_name
>   gpioget     ->  get_multiple_line_values
>   gpioinfo    ->  get_line_info
>   gpiomon     ->  watch_multiple_line_values
>   gpionotify  ->  watch_line_info
>   gpioset     ->  toggle_multiple_line_values
>
> Also added a watch_line_rising example to demonstrate getting events from=
 only
> one edge rather than both, so another gpiomon sub-case.
>
> The rust bindings had a couple of additional examples, gpio_events and
> gpio_threaded_info_events.
>
> gpio_threaded_info_events is an example of using one thread to generate i=
nfo
> change events that are observed by another thread.  This is borrowed from=
 test
> cases and has no other practical application, but the reconfiguring compo=
nent
> inspired the reconfigure_input_to_output example.  That provides an examp=
le of
> reconfiguring a requested line, and is provided for all languages, not ju=
st
> rust.
>
> gpio_events is an example of how borrowed buffered events must be cloned =
before
> the event buffer can be reused.  This was simplified and renamed
> buffered_event_lifetimes.  As I write this I realise it may also be appli=
cable
> to other languages - as an example of using gpiod_edge_event_copy().
> Maybe provide those in v2, or a subsequent series?
>
> The series is split into 8 parts.  For each language there is a patch tha=
t
> provides some consistency cleanups to make the existing examples more con=
sistent
> with each other, with the examples in other languages, and with the examp=
les to
> follow. There are also a few minor bug fixes that didn't seem sufficientl=
y
> serious to warrant a separate patch.
>
> The second patch for each language replaces the old tool examples with th=
e new
> use case based examples.
>
> Cheers,
> Kent.
>
> Kent Gibson (8):
>   core: examples: consistency cleanups
>   core: examples: add more use case examples
>   bindings: cxx: examples: consistency cleanup
>   bindings: cxx: examples: replace tools examples with use case examples
>   bindings: python: examples: consistency cleanup
>   bindings: python: examples: replace tools examples with use case
>     examples
>   bindings: rust: examples: consistency cleanup
>   bindings: rust: examples: replace tools examples with use case
>     examples
>
>  bindings/cxx/examples/.gitignore              |  16 +-
>  bindings/cxx/examples/Makefile.am             |  42 ++---
>  .../cxx/examples/async_watch_line_value.cpp   |   8 +-
>  bindings/cxx/examples/find_line_by_name.cpp   |  42 +++++
>  bindings/cxx/examples/get_chip_info.cpp       |  27 ++++
>  bindings/cxx/examples/get_line_info.cpp       |  39 +++++
>  bindings/cxx/examples/get_line_value.cpp      |  28 ++--
>  .../cxx/examples/get_multiple_line_values.cpp |  40 +++++
>  bindings/cxx/examples/gpiodetectcxx.cpp       |  30 ----
>  bindings/cxx/examples/gpiofindcxx.cpp         |  32 ----
>  bindings/cxx/examples/gpiogetcxx.cpp          |  40 -----
>  bindings/cxx/examples/gpioinfocxx.cpp         |  61 -------
>  bindings/cxx/examples/gpiomoncxx.cpp          |  65 --------
>  bindings/cxx/examples/gpionotifycxx.cpp       |  55 -------
>  bindings/cxx/examples/gpiosetcxx.cpp          |  53 ------
>  .../examples/reconfigure_input_to_output.cpp  |  56 +++++++
>  bindings/cxx/examples/toggle_line_value.cpp   |  16 +-
>  .../examples/toggle_multiple_line_values.cpp  |  63 ++++++++
>  bindings/cxx/examples/watch_line_info.cpp     |  49 ++++++
>  bindings/cxx/examples/watch_line_rising.cpp   |  64 ++++++++
>  bindings/cxx/examples/watch_line_value.cpp    |  12 +-
>  .../examples/watch_multiple_line_values.cpp   |  60 +++++++
>  bindings/python/examples/Makefile.am          |  18 ++-
>  .../python/examples/async_watch_line_value.py |  15 +-
>  bindings/python/examples/find_line_by_name.py |  37 +++++
>  bindings/python/examples/get_chip_info.py     |  20 +++
>  bindings/python/examples/get_line_info.py     |  29 ++++
>  bindings/python/examples/get_line_value.py    |  13 +-
>  .../examples/get_multiple_line_values.py      |  29 ++++
>  bindings/python/examples/gpiodetect.py        |  15 --
>  bindings/python/examples/gpiofind.py          |  20 ---
>  bindings/python/examples/gpioget.py           |  29 ----
>  bindings/python/examples/gpioinfo.py          |  28 ----
>  bindings/python/examples/gpiomon.py           |  26 ---
>  bindings/python/examples/gpionotify.py        |  21 ---
>  bindings/python/examples/gpioset.py           |  36 -----
>  bindings/python/examples/helpers.py           |  15 --
>  .../examples/reconfigure_input_to_output.py   |  39 +++++
>  bindings/python/examples/toggle_line_value.py |  34 ++--
>  .../examples/toggle_multiple_line_values.py   |  47 ++++++
>  bindings/python/examples/watch_line_info.py   |  23 +++
>  bindings/python/examples/watch_line_rising.py |  31 ++++
>  bindings/python/examples/watch_line_value.py  |  19 ++-
>  .../examples/watch_multiple_line_values.py    |  43 +++++
>  bindings/rust/libgpiod/examples/Makefile.am   |  21 +--
>  .../examples/buffered_event_lifetimes.rs      |  58 +++++++
>  .../libgpiod/examples/find_line_by_name.rs    |  29 ++++
>  .../rust/libgpiod/examples/get_chip_info.rs   |  22 +++
>  .../rust/libgpiod/examples/get_line_info.rs   |  37 +++++
>  .../rust/libgpiod/examples/get_line_value.rs  |   4 +-
>  .../examples/get_multiple_line_values.rs      |  29 ++++
>  .../rust/libgpiod/examples/gpio_events.rs     |  88 ----------
>  .../examples/gpio_threaded_info_events.rs     | 132 ---------------
>  bindings/rust/libgpiod/examples/gpiodetect.rs |  30 ----
>  bindings/rust/libgpiod/examples/gpiofind.rs   |  36 -----
>  bindings/rust/libgpiod/examples/gpioget.rs    |  45 ------
>  bindings/rust/libgpiod/examples/gpioinfo.rs   |  97 -----------
>  bindings/rust/libgpiod/examples/gpiomon.rs    |  74 ---------
>  bindings/rust/libgpiod/examples/gpionotify.rs |  53 ------
>  bindings/rust/libgpiod/examples/gpioset.rs    |  63 --------
>  bindings/rust/libgpiod/examples/gpiowatch.rs  |  53 ------
>  .../examples/reconfigure_input_to_output.rs   |  42 +++++
>  .../libgpiod/examples/toggle_line_value.rs    |  17 +-
>  .../examples/toggle_multiple_line_values.rs   |  55 +++++++
>  .../rust/libgpiod/examples/watch_line_info.rs |  32 ++++
>  .../libgpiod/examples/watch_line_rising.rs    |  44 +++++
>  .../libgpiod/examples/watch_line_value.rs     |  10 +-
>  .../examples/watch_multiple_line_values.rs    |  46 ++++++
>  examples/.gitignore                           |   9 ++
>  examples/Makefile.am                          |  35 +++-
>  examples/async_watch_line_value.c             |   6 +-
>  examples/find_line_by_name.c                  | 111 +++++++++++++
>  examples/get_chip_info.c                      |  40 +++++
>  examples/get_line_info.c                      |  56 +++++++
>  examples/get_line_value.c                     |  11 +-
>  examples/get_multiple_line_values.c           | 119 ++++++++++++++
>  examples/reconfigure_input_to_output.c        | 152 ++++++++++++++++++
>  examples/toggle_line_value.c                  |  17 +-
>  examples/toggle_multiple_line_values.c        | 136 ++++++++++++++++
>  examples/watch_line_info.c                    |  72 +++++++++
>  examples/watch_line_rising.c                  | 129 +++++++++++++++
>  examples/watch_line_value.c                   |   6 +-
>  examples/watch_multiple_line_values.c         | 140 ++++++++++++++++
>  83 files changed, 2289 insertions(+), 1352 deletions(-)
>  create mode 100644 bindings/cxx/examples/find_line_by_name.cpp
>  create mode 100644 bindings/cxx/examples/get_chip_info.cpp
>  create mode 100644 bindings/cxx/examples/get_line_info.cpp
>  create mode 100644 bindings/cxx/examples/get_multiple_line_values.cpp
>  delete mode 100644 bindings/cxx/examples/gpiodetectcxx.cpp
>  delete mode 100644 bindings/cxx/examples/gpiofindcxx.cpp
>  delete mode 100644 bindings/cxx/examples/gpiogetcxx.cpp
>  delete mode 100644 bindings/cxx/examples/gpioinfocxx.cpp
>  delete mode 100644 bindings/cxx/examples/gpiomoncxx.cpp
>  delete mode 100644 bindings/cxx/examples/gpionotifycxx.cpp
>  delete mode 100644 bindings/cxx/examples/gpiosetcxx.cpp
>  create mode 100644 bindings/cxx/examples/reconfigure_input_to_output.cpp
>  create mode 100644 bindings/cxx/examples/toggle_multiple_line_values.cpp
>  create mode 100644 bindings/cxx/examples/watch_line_info.cpp
>  create mode 100644 bindings/cxx/examples/watch_line_rising.cpp
>  create mode 100644 bindings/cxx/examples/watch_multiple_line_values.cpp
>  create mode 100755 bindings/python/examples/find_line_by_name.py
>  create mode 100755 bindings/python/examples/get_chip_info.py
>  create mode 100755 bindings/python/examples/get_line_info.py
>  create mode 100755 bindings/python/examples/get_multiple_line_values.py
>  delete mode 100755 bindings/python/examples/gpiodetect.py
>  delete mode 100755 bindings/python/examples/gpiofind.py
>  delete mode 100755 bindings/python/examples/gpioget.py
>  delete mode 100755 bindings/python/examples/gpioinfo.py
>  delete mode 100755 bindings/python/examples/gpiomon.py
>  delete mode 100755 bindings/python/examples/gpionotify.py
>  delete mode 100755 bindings/python/examples/gpioset.py
>  delete mode 100644 bindings/python/examples/helpers.py
>  create mode 100755 bindings/python/examples/reconfigure_input_to_output.=
py
>  create mode 100755 bindings/python/examples/toggle_multiple_line_values.=
py
>  create mode 100755 bindings/python/examples/watch_line_info.py
>  create mode 100755 bindings/python/examples/watch_line_rising.py
>  create mode 100755 bindings/python/examples/watch_multiple_line_values.p=
y
>  create mode 100644 bindings/rust/libgpiod/examples/buffered_event_lifeti=
mes.rs
>  create mode 100644 bindings/rust/libgpiod/examples/find_line_by_name.rs
>  create mode 100644 bindings/rust/libgpiod/examples/get_chip_info.rs
>  create mode 100644 bindings/rust/libgpiod/examples/get_line_info.rs
>  create mode 100644 bindings/rust/libgpiod/examples/get_multiple_line_val=
ues.rs
>  delete mode 100644 bindings/rust/libgpiod/examples/gpio_events.rs
>  delete mode 100644 bindings/rust/libgpiod/examples/gpio_threaded_info_ev=
ents.rs
>  delete mode 100644 bindings/rust/libgpiod/examples/gpiodetect.rs
>  delete mode 100644 bindings/rust/libgpiod/examples/gpiofind.rs
>  delete mode 100644 bindings/rust/libgpiod/examples/gpioget.rs
>  delete mode 100644 bindings/rust/libgpiod/examples/gpioinfo.rs
>  delete mode 100644 bindings/rust/libgpiod/examples/gpiomon.rs
>  delete mode 100644 bindings/rust/libgpiod/examples/gpionotify.rs
>  delete mode 100644 bindings/rust/libgpiod/examples/gpioset.rs
>  delete mode 100644 bindings/rust/libgpiod/examples/gpiowatch.rs
>  create mode 100644 bindings/rust/libgpiod/examples/reconfigure_input_to_=
output.rs
>  create mode 100644 bindings/rust/libgpiod/examples/toggle_multiple_line_=
values.rs
>  create mode 100644 bindings/rust/libgpiod/examples/watch_line_info.rs
>  create mode 100644 bindings/rust/libgpiod/examples/watch_line_rising.rs
>  create mode 100644 bindings/rust/libgpiod/examples/watch_multiple_line_v=
alues.rs
>  create mode 100644 examples/find_line_by_name.c
>  create mode 100644 examples/get_chip_info.c
>  create mode 100644 examples/get_line_info.c
>  create mode 100644 examples/get_multiple_line_values.c
>  create mode 100644 examples/reconfigure_input_to_output.c
>  create mode 100644 examples/toggle_multiple_line_values.c
>  create mode 100644 examples/watch_line_info.c
>  create mode 100644 examples/watch_line_rising.c
>  create mode 100644 examples/watch_multiple_line_values.c
>
> --
> 2.41.0
>

Thanks! I applied patches 1-5 and 7-8. I had some comments on patch 6,
you don't have to resend the others.

Bart
