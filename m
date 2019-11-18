Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 557A51006CB
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 14:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfKRNvJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 08:51:09 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36618 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbfKRNvJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 08:51:09 -0500
Received: by mail-ot1-f66.google.com with SMTP id f10so14545038oto.3
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2019 05:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PFPRT7MSDE0P2d8ls8rchG3ENvhMAnAbhV18oXsh1U0=;
        b=ROYnVstW1AG6qBm0WiwYM0yYvxA0aYCPhm+7esf9l/YwGrEIbFgu54BJ3N69XPsYpS
         2oIKX8QrTsx+9qRqluqI6a1v3T7jZSdWGgGtIH8ST6V6VcG9AopPb4aa9r+gKRBw04Ze
         bsLu7NjBzdXbQhLtM08IYK1LSWQv2cvYMAAUWJ230glJa+aN8FPSkGena9LmFyoFUGD2
         MH6auYfFL1RDScWG5y+txS4InKamSqD0cyLCs1IQAWG1JnghQPjUxphLvt/yh5UR8qgh
         9lEwL96N1ydKNihPNDwgUIIcnYFQH1D/2Xn01fvXBLaG4IdqB8ZciYK50280JwjWDcCm
         oHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PFPRT7MSDE0P2d8ls8rchG3ENvhMAnAbhV18oXsh1U0=;
        b=QHds4GD7bM4QhbPiWfTAq0DixknNLL82skOAlf7vMkNWLK/06KRYiPGBVvUEDsEWef
         L6kjpItzQdmHP3MpFnVX5/ztVC8i/PKewaRzc5UzV7/fgd1hXs44eVIWrC3dG3j+iRKD
         AGPE72Tkj0/rL9bLlY74g5LfH1InGh0xJdvbZGfP7mb5Vco12sZjyGTkR0it1/eGxPnD
         x+6xoSXzqZgBOaxmyS+SKH39/XoD7rntYo+M3/cBnjOqDmgEDFN4yrT1tpaBZDSb4H5d
         Ka8vNfESLUCOK976NjhYBmKtRTeqc2wkX2C0xu3HsyeG0KhxtfFsQQdGXCC47oE6R44e
         q7Cg==
X-Gm-Message-State: APjAAAWUhvr/Bx+zcLy1OeObE0K+HEtUKbDjDV/kHhSxSd3JoWB34SZa
        n+hyCOxfgR1eLKxLw6PAzdmrXonugbD1EqN3gBkk6zCa0Hc=
X-Google-Smtp-Source: APXvYqw6XphQ4FzxPARmDF1zBFxA19Zqc/Ofwl+fxqh6ZbC4DuDOtWN8zevBVzFLoCw5ZBm3+HpuTVJDuzoL7S0GgVg=
X-Received: by 2002:a9d:17ca:: with SMTP id j68mr21972142otj.250.1574085068413;
 Mon, 18 Nov 2019 05:51:08 -0800 (PST)
MIME-Version: 1.0
References: <20191115144355.975-1-warthog618@gmail.com>
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 18 Nov 2019 14:50:57 +0100
Message-ID: <CAMpxmJXVhUGGdD9jmUXqzQ7KW+6K9WYfHHRs7VhpJkxbCQNRSQ@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 00/19] Add support for bias flags and SET_CONFIG
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 15 lis 2019 o 15:44 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> This patch series adds support for changes to the GPIO uAPI that are on
> track to be included in the v5.5 kernel.  There are two components to the
> uAPI changes - the addition of bias flags and a new SET_CONFIG ioctl.  Th=
is
> series adds support to the libgpiod API, and to both C++ and Python
> bindings, for both of those components.
>
> The libgpiod tools are also updated, where appropriate, to support the bi=
as
> flags.
>
> There are a few additional patches that serve to restructure the code to
> simplify subsequent patches, or to fix minor problems discovered during
> development. These patches are generally adjacent to the main patch most
> relevant to that patch.
>
> The series is based on the current libgpiod master@9ed02fc.
>
> Kent Gibson (19):
>   core: move request flag to handle flag conversion into a separate
>     function
>   API: add support for bias flags
>   core: fix misspelling of parameter
>   tests: add tests for bias flags
>   bindings: cxx: drop noexcept from direction and active_state
>   bindings: cxx: initialise bitset with integer instead of string
>   bindings: cxx: add support for bias flags
>   bindings: cxx: tests: add tests for bias flags
>   bindings: python: add support for bias flags
>   bindings: python: tests: add tests for bias flags
>   API: add support for SET_CONFIG
>   tests: add tests for SET_CONFIG
>   core: allow gpiod_line_set_value_bulk to accept null values
>   bindings: cxx: add support for SET_CONFIG
>   bindings: cxx: tests: add tests for SET_CONFIG methods
>   bindings: python: add support for SET_CONFIG
>   bindings: python: tests: add tests for SET_CONFIG methods
>   tools: add support for bias flags
>   treewide: change "correspond with" to "correspond to"
>
>  bindings/cxx/gpiod.hpp                 |  85 +++-
>  bindings/cxx/line.cpp                  |  60 ++-
>  bindings/cxx/line_bulk.cpp             |  95 ++++-
>  bindings/cxx/tests/tests-line.cpp      | 215 ++++++++++
>  bindings/python/gpiodmodule.c          | 469 +++++++++++++++++++++-
>  bindings/python/tests/gpiod_py_test.py | 254 ++++++++++++
>  include/gpiod.h                        | 303 +++++++++++++-
>  lib/core.c                             | 250 ++++++++++--
>  lib/ctxless.c                          | 115 +++++-
>  tests/mockup/gpio-mockup.c             |   2 +-
>  tests/tests-ctxless.c                  |  64 ++-
>  tests/tests-event.c                    | 120 ++++++
>  tests/tests-line.c                     | 522 ++++++++++++++++++++++++-
>  tools/gpioget.c                        |  24 +-
>  tools/gpiomon.c                        |  28 +-
>  tools/gpioset.c                        |  26 +-
>  16 files changed, 2561 insertions(+), 71 deletions(-)
>
> --
> 2.24.0
>

Hi Kent,

the series looks quite good. I addressed some obvious things. I'll
review v2 more in detail, but honestly, I don't think there'll be a
lot of issues.

Would you mind if I applied patches 1, 3, 5, 6, 13 & 19 right away?
They fix existing problems, so there's no need to carry them over to
subsequent iterations of the series.

Bart
