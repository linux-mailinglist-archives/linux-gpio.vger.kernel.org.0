Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 708145FC568
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Oct 2022 14:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbiJLMfK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Oct 2022 08:35:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbiJLMfC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2022 08:35:02 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83695E033
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 05:34:56 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id h29so6912348vsq.9
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 05:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OO5B3E7maxkKEnMpSmPpoxBqPK6HqmapZtcuXCMTYCw=;
        b=VO4LpWVVByHStOKcV3H5Y6S3ugPJIZG5KDeQ38nMOKJxxdYmCTPi+VI2o3grEMUHyd
         yVMDa1CmkAEmUY1mc+FrXoGiwEJ4N4O0Wf5zQ2Xy7xrYAKVrM3kL4GFxxnyQSNQmJqnJ
         HfxqbSfaJfUQ6ILe4l9eAfMLQKZ/mYROg6UZgJlIC3RWJKWdNTWhihxTl/JVpuoz15Cb
         lNMxcL3PhhqcOLRsJOwjUaAoeI7rVmCACVPnVweUO1IZQlNoyeAj7yJPUpmydcESNajp
         QpTr4SOgW5YE3EQSHfEEGaLN2CmfmslDlz5GeChJlgQ/imNskIWxqA9lGfwLGA9oKS2o
         /Lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OO5B3E7maxkKEnMpSmPpoxBqPK6HqmapZtcuXCMTYCw=;
        b=Ux7seb0w41fmBnHZCDskAbVp8Dvu2XSEDmK0AZB4A6NifYX7lNAm14IG3Me8zF8624
         tqnjxp0oWKyFRlT50/plgfp32uEAZFImoYAKRz1jNuWfzpQDvG6efPHhv9k81pIgN1yH
         JtrbrLBuyS/q2pgpBrUfwI3fy2S6cY14cl/AW/CKB3vYQ9xCRuX45rJ+JzccMeR+iBFj
         ggd/bPuyLDufOFoJxdzUL8I0YQO4+20x29CjJfrNzAxbi7E6xDgu5WAVTW3ltgrEqF40
         7ZcgUJyO7iENwraIwoCNvSiz/UduZwzeCU706TLjMxs7HMKK+ag+h2EktPExjy3EVLdZ
         WCqQ==
X-Gm-Message-State: ACrzQf0PRls8NUxCtScV7NVbIug1rQBi1e26KPI2liqh73uACGOC9KUw
        WHcRw2f7rI06c8BwLyUGw3xwadHdhhQCzrCDH/2+bA==
X-Google-Smtp-Source: AMsMyM4Oe5n5VIwqazRp9wNpv7rh5s+pMDL+91Lsu3HKWZHQkXt+cnkSlQZQNRrGesqc/5jQbPuiieoTXrFP5h0u7SI=
X-Received: by 2002:a67:cb07:0:b0:3a6:f64f:4627 with SMTP id
 b7-20020a67cb07000000b003a6f64f4627mr15056020vsl.47.1665578095263; Wed, 12
 Oct 2022 05:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221007145521.329614-1-brgl@bgdev.pl>
In-Reply-To: <20221007145521.329614-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 12 Oct 2022 14:34:44 +0200
Message-ID: <CAMRc=Md_5cThJwu7iLW14XP=8hADBmOk2DYt2axuG=jWa-jkcA@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v3 0/4] bindings: implement python bindings
 for libgpiod v2
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 7, 2022 at 4:55 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This is the third iteration of python bindings for libgpiod but it really has
> very little in common with the previous version.
>
> This time the code has been split into high-level python and low-level
> C layers with the latter only doing the bare minimum.
>
> The data model is mostly based on the C++ one with the main difference
> being utilizing dynamic typing and keyword arguments in place of the
> builder pattern. That allows us to reduce the number of methods and
> objects.
>
> Because python doesn't have RAII, unlike C++, we provide a module-level
> request_lines() helper as gpiod.Chip(path).request_lines(...) one-liner
> could lead to the chip left dangling even after the last reference is
> dropped.
>
> Because python forces us to dynamically allocate objects all the time even
> for fundamental types (which are also immutable) there's no point in trying
> to replicate the edge-event buffer. Instead LineRequest.read_edge_event()
> just returns a list of events.
>
> Bartosz Golaszewski (4):
>   bindings: python: remove old version
>   bindings: python: add examples
>   bindings: python: add tests
>   bindings: python: implement python bindings for libgpiod v2
>
>  bindings/python/.gitignore                   |    8 +
>  bindings/python/Makefile.am                  |   26 +-
>  bindings/python/examples/Makefile.am         |   16 +-
>  bindings/python/examples/gpiodetect.py       |   15 +-
>  bindings/python/examples/gpiofind.py         |   14 +-
>  bindings/python/examples/gpioget.py          |   34 +-
>  bindings/python/examples/gpioinfo.py         |   41 +-
>  bindings/python/examples/gpiomon.py          |   52 +-
>  bindings/python/examples/gpioset.py          |   46 +-
>  bindings/python/gpiod/Makefile.am            |   17 +
>  bindings/python/gpiod/__init__.py            |   53 +
>  bindings/python/gpiod/chip.py                |  308 ++
>  bindings/python/gpiod/chip_info.py           |   21 +
>  bindings/python/gpiod/edge_event.py          |   46 +
>  bindings/python/gpiod/exception.py           |   20 +
>  bindings/python/gpiod/ext/Makefile.am        |   11 +
>  bindings/python/gpiod/ext/chip.c             |  335 +++
>  bindings/python/gpiod/ext/common.c           |   92 +
>  bindings/python/gpiod/ext/internal.h         |   20 +
>  bindings/python/gpiod/ext/line-config.c      |  133 +
>  bindings/python/gpiod/ext/line-settings.c    |  130 +
>  bindings/python/gpiod/ext/module.c           |  193 ++
>  bindings/python/gpiod/ext/request.c          |  402 +++
>  bindings/python/gpiod/info_event.py          |   33 +
>  bindings/python/gpiod/internal.py            |   19 +
>  bindings/python/gpiod/line.py                |   56 +
>  bindings/python/gpiod/line_info.py           |   73 +
>  bindings/python/gpiod/line_request.py        |  258 ++
>  bindings/python/gpiod/line_settings.py       |   62 +
>  bindings/python/gpiodmodule.c                | 2662 ------------------
>  bindings/python/setup.py                     |   47 +
>  bindings/python/tests/Makefile.am            |   26 +-
>  bindings/python/tests/__init__.py            |   17 +
>  bindings/python/tests/__main__.py            |   16 +
>  bindings/python/tests/gpiod_py_test.py       |  832 ------
>  bindings/python/tests/gpiomockupmodule.c     |  309 --
>  bindings/python/tests/gpiosim/Makefile.am    |    7 +
>  bindings/python/tests/gpiosim/__init__.py    |    4 +
>  bindings/python/tests/gpiosim/chip.py        |   66 +
>  bindings/python/tests/gpiosim/ext.c          |  345 +++
>  bindings/python/tests/helpers.py             |   16 +
>  bindings/python/tests/tests_chip.py          |  231 ++
>  bindings/python/tests/tests_chip_info.py     |   52 +
>  bindings/python/tests/tests_edge_event.py    |  219 ++
>  bindings/python/tests/tests_info_event.py    |  189 ++
>  bindings/python/tests/tests_line_info.py     |  101 +
>  bindings/python/tests/tests_line_request.py  |  449 +++
>  bindings/python/tests/tests_line_settings.py |   79 +
>  bindings/python/tests/tests_module.py        |   59 +
>  configure.ac                                 |    3 +
>  50 files changed, 4338 insertions(+), 3925 deletions(-)
>  create mode 100644 bindings/python/.gitignore
>  create mode 100644 bindings/python/gpiod/Makefile.am
>  create mode 100644 bindings/python/gpiod/__init__.py
>  create mode 100644 bindings/python/gpiod/chip.py
>  create mode 100644 bindings/python/gpiod/chip_info.py
>  create mode 100644 bindings/python/gpiod/edge_event.py
>  create mode 100644 bindings/python/gpiod/exception.py
>  create mode 100644 bindings/python/gpiod/ext/Makefile.am
>  create mode 100644 bindings/python/gpiod/ext/chip.c
>  create mode 100644 bindings/python/gpiod/ext/common.c
>  create mode 100644 bindings/python/gpiod/ext/internal.h
>  create mode 100644 bindings/python/gpiod/ext/line-config.c
>  create mode 100644 bindings/python/gpiod/ext/line-settings.c
>  create mode 100644 bindings/python/gpiod/ext/module.c
>  create mode 100644 bindings/python/gpiod/ext/request.c
>  create mode 100644 bindings/python/gpiod/info_event.py
>  create mode 100644 bindings/python/gpiod/internal.py
>  create mode 100644 bindings/python/gpiod/line.py
>  create mode 100644 bindings/python/gpiod/line_info.py
>  create mode 100644 bindings/python/gpiod/line_request.py
>  create mode 100644 bindings/python/gpiod/line_settings.py
>  delete mode 100644 bindings/python/gpiodmodule.c
>  create mode 100644 bindings/python/setup.py
>  create mode 100644 bindings/python/tests/__init__.py
>  create mode 100644 bindings/python/tests/__main__.py
>  delete mode 100755 bindings/python/tests/gpiod_py_test.py
>  delete mode 100644 bindings/python/tests/gpiomockupmodule.c
>  create mode 100644 bindings/python/tests/gpiosim/Makefile.am
>  create mode 100644 bindings/python/tests/gpiosim/__init__.py
>  create mode 100644 bindings/python/tests/gpiosim/chip.py
>  create mode 100644 bindings/python/tests/gpiosim/ext.c
>  create mode 100644 bindings/python/tests/helpers.py
>  create mode 100644 bindings/python/tests/tests_chip.py
>  create mode 100644 bindings/python/tests/tests_chip_info.py
>  create mode 100644 bindings/python/tests/tests_edge_event.py
>  create mode 100644 bindings/python/tests/tests_info_event.py
>  create mode 100644 bindings/python/tests/tests_line_info.py
>  create mode 100644 bindings/python/tests/tests_line_request.py
>  create mode 100644 bindings/python/tests/tests_line_settings.py
>  create mode 100644 bindings/python/tests/tests_module.py
>
> --
> 2.34.1
>

I fixed the one nit from Andy. If there are no objections I'd like to
apply this and squash the entire v2 patch series into one big commit
and apply it to the master branch. This way we can stop keeping this
temporary branch and continue the development (tools, rust, possible
further tweaks to the API) on master.

Bart
