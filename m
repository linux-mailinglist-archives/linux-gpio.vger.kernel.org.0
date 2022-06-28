Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF1D55C47B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 14:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238572AbiF1Iro (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 04:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243055AbiF1Irn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 04:47:43 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1CD92E9C6
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 01:47:42 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id g26so24264552ejb.5
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OfSJauzY4Qsf9NGgrzwL7bM0CuJF/fuTqwiw9O5wis4=;
        b=g+EYjp2ZGt4uyT4eDCNYSefmknuwl+TY9PLU2sNshggZ7Po3+XMKog32K2FjCvNaL9
         CYWW9PXFmRQ8DDQPgsTHP+iWEsyEbWjaNLxlDAQiCrl2L+SKtM8awWz3O3+ZLb4HIhnK
         Mct7GomjbKTtSVHaIWyb1bR6rOnx5I0C7uBK/6bnUM+AAEe3v14SOvFTuaN9lS7OBS8l
         TCHvnooSQ/Jly1TWyvnj4WaIxl11UUY2Rj24odfExokiE9Ewl+Q8elJUZ7C94eKKeO0F
         3QPaU8BtfCkN7VOu2ePsGgyej2aTTVqTQvaVWlIsr9MgExJ8auNCCr9Hw3tuZNKwdOQb
         0xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OfSJauzY4Qsf9NGgrzwL7bM0CuJF/fuTqwiw9O5wis4=;
        b=f5JlNN526CzIwV539IKW+YHOIqw7og+TO4EEqVhDbV2PGLhCKXtTJ4t+Sxz96Oq9NC
         ivIw6IhzVV7v5DXM/iZOgOsbeqLtNaZEY9IY8jSfjdBvO+ocfF/pNPz58fwO6/zoaT7O
         mta6Honez+Wonk/tido7rWM9c6ml58EGzWdmlbfe9E3y2i9/kAEhMO8WlXlRpHCh/FHO
         UB/kU9Nmmfn4O5HVD/afGvDTIjQsczHqjQ5xSI2YM6icea1VCxIBLABFcUeCwKld29Pa
         otv5z8T86JeK++krbkdr6Yp8VuQegi8xcTabO/IOhu+/EUyn5JDTC2lWiG1h5p/Rqm6T
         7k1w==
X-Gm-Message-State: AJIora9SOcRIM+njcvpCEv7JVoWnC7kI0j9a9aTRw3TYNOTAfNSG8/hj
        S8/nbEWIZUwIS5dr4PIc2IX34EOD0Y776kY4AXKwUQ==
X-Google-Smtp-Source: AGRyM1vbQODJxKVpvDyw8A9xeMfTpU8jMfDHpncJ1AgtBXczGaBzm2ogMT76QEyPBkYk1HMf6KO6BIjUmXAzyXP9Vbc=
X-Received: by 2002:a17:906:434f:b0:711:eb76:c320 with SMTP id
 z15-20020a170906434f00b00711eb76c320mr17103044ejm.636.1656406061261; Tue, 28
 Jun 2022 01:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220628084226.472035-1-brgl@bgdev.pl>
In-Reply-To: <20220628084226.472035-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 28 Jun 2022 10:47:30 +0200
Message-ID: <CAMRc=Me9a0rgCRoxr1JviPdqHZA6Lf2_S98j3RuRy-z81YmP6A@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v2 0/5] bindings: implement python bindings
 for libgpiod v2
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2022 at 10:42 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This series adds python bindings for libgpiod v2. The series is split
> into several patches for easier review.
>
> In general the python bindings follow what we did for C++ in terms of class
> layout except that we leverage python's flexibility to reduce the number of
> method variants by allowing different types of arguments.
>
> Because python doesn't have RAII, unlike C++, we provide a module-level
> request_lines() helper as gpiod.Chip(path).request_lines(...) one-liner
> could lead to the chip left dangling even after the last reference is
> dropped.
>
> Because python forces us to dynamically allocate objects all the time even
> for fundamental types (which are also immutable) there's no point in trying
> to make the EdgeEventBuffer avoid copying the events like we did in C++
> for better performance. Python simply isn't designed around speed.
>
> v1 -> v2:
> - all methods now accept keyword arguments even for mandatory positional ones
> - added a global request_lines() function that enables easy one-liner liner
>   requests
> - improve and unify the pydoc format
> - many smaller tweaks and fixes

One more thing I forgot: one can now read edge-events without the need
to instantiate the buffer first - it will be created automatically and
returned from gpiod.LineRequest.read_edge_event().

That allows users to do:

for event in req.read_edge_event():
  do_something(event)

Bart

>
> Bartosz Golaszewski (5):
>   bindings: python: remove old version
>   bindings: python: enum: add a piece of common code for using python's
>     enums from C
>   bindings: python: add examples for v2 API
>   bindings: python: add tests for v2 API
>   bindings: python: add the implementation for v2 API
>
>  bindings/python/.gitignore                    |    1 +
>  bindings/python/Makefile.am                   |   19 +-
>  bindings/python/chip-info.c                   |  126 +
>  bindings/python/chip.c                        |  606 ++++
>  bindings/python/edge-event-buffer.c           |  330 ++
>  bindings/python/edge-event.c                  |  191 ++
>  bindings/python/enum/Makefile.am              |    9 +
>  bindings/python/enum/enum.c                   |  208 ++
>  bindings/python/enum/enum.h                   |   24 +
>  bindings/python/examples/gpiodetect.py        |   13 +-
>  bindings/python/examples/gpiofind.py          |   12 +-
>  bindings/python/examples/gpioget.py           |   28 +-
>  bindings/python/examples/gpioinfo.py          |   39 +-
>  bindings/python/examples/gpiomon.py           |   53 +-
>  bindings/python/examples/gpioset.py           |   36 +-
>  bindings/python/exception.c                   |  182 ++
>  bindings/python/gpiodmodule.c                 | 2662 -----------------
>  bindings/python/info-event.c                  |  175 ++
>  bindings/python/line-config.c                 | 1373 +++++++++
>  bindings/python/line-info.c                   |  286 ++
>  bindings/python/line-request.c                |  803 +++++
>  bindings/python/line.c                        |  239 ++
>  bindings/python/module.c                      |  557 ++++
>  bindings/python/module.h                      |   58 +
>  bindings/python/request-config.c              |  320 ++
>  bindings/python/tests/Makefile.am             |   15 +-
>  bindings/python/tests/cases/__init__.py       |   12 +
>  bindings/python/tests/cases/tests_chip.py     |  157 +
>  .../python/tests/cases/tests_chip_info.py     |   59 +
>  .../python/tests/cases/tests_edge_event.py    |  279 ++
>  .../python/tests/cases/tests_info_event.py    |  135 +
>  .../python/tests/cases/tests_line_config.py   |  254 ++
>  .../python/tests/cases/tests_line_info.py     |   90 +
>  .../python/tests/cases/tests_line_request.py  |  345 +++
>  bindings/python/tests/cases/tests_misc.py     |   53 +
>  .../tests/cases/tests_request_config.py       |   77 +
>  bindings/python/tests/gpiod_py_test.py        |  827 +----
>  bindings/python/tests/gpiomockupmodule.c      |  309 --
>  bindings/python/tests/gpiosimmodule.c         |  434 +++
>  configure.ac                                  |    3 +-
>  40 files changed, 7517 insertions(+), 3882 deletions(-)
>  create mode 100644 bindings/python/.gitignore
>  create mode 100644 bindings/python/chip-info.c
>  create mode 100644 bindings/python/chip.c
>  create mode 100644 bindings/python/edge-event-buffer.c
>  create mode 100644 bindings/python/edge-event.c
>  create mode 100644 bindings/python/enum/Makefile.am
>  create mode 100644 bindings/python/enum/enum.c
>  create mode 100644 bindings/python/enum/enum.h
>  create mode 100644 bindings/python/exception.c
>  delete mode 100644 bindings/python/gpiodmodule.c
>  create mode 100644 bindings/python/info-event.c
>  create mode 100644 bindings/python/line-config.c
>  create mode 100644 bindings/python/line-info.c
>  create mode 100644 bindings/python/line-request.c
>  create mode 100644 bindings/python/line.c
>  create mode 100644 bindings/python/module.c
>  create mode 100644 bindings/python/module.h
>  create mode 100644 bindings/python/request-config.c
>  create mode 100644 bindings/python/tests/cases/__init__.py
>  create mode 100644 bindings/python/tests/cases/tests_chip.py
>  create mode 100644 bindings/python/tests/cases/tests_chip_info.py
>  create mode 100644 bindings/python/tests/cases/tests_edge_event.py
>  create mode 100644 bindings/python/tests/cases/tests_info_event.py
>  create mode 100644 bindings/python/tests/cases/tests_line_config.py
>  create mode 100644 bindings/python/tests/cases/tests_line_info.py
>  create mode 100644 bindings/python/tests/cases/tests_line_request.py
>  create mode 100644 bindings/python/tests/cases/tests_misc.py
>  create mode 100644 bindings/python/tests/cases/tests_request_config.py
>  delete mode 100644 bindings/python/tests/gpiomockupmodule.c
>  create mode 100644 bindings/python/tests/gpiosimmodule.c
>
> --
> 2.34.1
>
