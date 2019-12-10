Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5CB118D39
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 17:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbfLJQGc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 11:06:32 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:44926 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbfLJQGa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 11:06:30 -0500
Received: by mail-qv1-f68.google.com with SMTP id n8so4367704qvg.11
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2019 08:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=N1UvQlX+rftmt1IipMuYBFoi1gthaz56Dkcwxg7H398=;
        b=lrIHun1MfLYP1e/tYAfx4eR48Yyo7nJwtayRcxwumnDx7WHI1RtY9vCcysK76vLjPu
         9/I8TZ3LJctKt2Up579QJlC1QJPkKdkGN1sx/ManvPkucdx0FQ364Kau9wrJZgLetS6A
         dIsKWDs4vXvAvSv45BcNeVHnXAqaUrXFigkQpBA92GwS1Lr1xZQjdnmYdI82mnmSPHlK
         zFVoQcYiSbPG1O6IS5oaKZe/pwVs3PjrdEhAZQnSeNEltB/yGf4xzvLzghBibk8VfLau
         ITZACYt1uZVd4cagkbz5/8/oZSrLoaKGXjh366ViiDvcWf2DPb/5rVBBQSgrY+DZVaU3
         PFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=N1UvQlX+rftmt1IipMuYBFoi1gthaz56Dkcwxg7H398=;
        b=qjewKFPup+FJAKFeSpffZKMcJhHdEpp3O6SIfH6GC0q8m5viFdL++qrN+rfVnDnEW7
         jsrUvoHEsaWvpf3GWDRNh3RZgWW44oyN9t9ES9eQ1942YCXJOAzN0ESO2hEc2Bgo9qqn
         144rSF1XWYpIxtikq3PWhwjRd+HJwyeO31b21s2+X/C2TXDBOT4ZoImT4ZFHT/ReEgPH
         yCFu9nnhsnV2ngQcEGgODm1eLWoan6KrCRn2LFv0hqgWszWeq9F9GOpEQ4unGrKcZPU1
         Rj0SQXuL+CXXqeVzQWdzlHBpgl9rpgODWO/vRYgdveA36JUkn9bZRzyjM/0Vh6A1I79H
         H+mQ==
X-Gm-Message-State: APjAAAUJUysiC3zk3aCSx/xZdOoPqed+G+JAFkZELBP/sl0Qdlpe7Mw+
        KsdBTyvy/EhcZYQOyQKuT+7J0v6ZTXA1wXj/GNs2PQ==
X-Google-Smtp-Source: APXvYqyMcyWcTu3UfJI302X2BUf9PBvDMvMfFpLYsYLLBW3NcndyiInAzAdKDp/FPdvTI3rVIv4NZvcF8+OBJgw4NNU=
X-Received: by 2002:a0c:d4aa:: with SMTP id u39mr29122609qvh.76.1575993989367;
 Tue, 10 Dec 2019 08:06:29 -0800 (PST)
MIME-Version: 1.0
References: <20191201032407.23589-1-warthog618@gmail.com>
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 10 Dec 2019 17:06:17 +0100
Message-ID: <CAMpxmJVjNab1OH6mMBxcwoGtzB+KLH=dg9sTE8R708ksc8GiXg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v4 00/20] Add support for bias flags and SET_CONFIG
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

niedz., 1 gru 2019 o 04:24 Kent Gibson <warthog618@gmail.com> napisa=C5=82(=
a):
>
>  Changes v3 -> v4:
>  - tests require kernel v5.5.0
>  - use std::map for bias mappings in cxx bindings
>  - drop gpiod_line_is_requested_values
>  - various formatting and coding style fixes
>  - relocate common tool code into tools-common
>  - tools bail on bad command line parameters
>  - add drive option to gpioset in a separate patch
>  - split out documentation update for gpiod_line_set_value_bulk
>  - split out change to vals variable in gpiod_Line_set_value
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
> The series is based on the current libgpiod master:
>  master@00418df tests: fix a typo in comment
>
> Kent Gibson (20):
>   core: add support for bias flags
>   tests: add tests for bias flags
>   bindings: cxx: add support for bias flags
>   bindings: cxx: tests: add tests for bias flags
>   bindings: python: add support for bias flags
>   bindings: python: tests: add tests for bias flags
>   core: add support for SET_CONFIG
>   tests: add tests for SET_CONFIG
>   bindings: cxx: add support for SET_CONFIG
>   bindings: cxx: tests: add tests for SET_CONFIG methods
>   bindings: python: move tuple to int array conversion into helper
>     function
>   bindings: python: add support for SET_CONFIG
>   bindings: python: tests: add tests for SET_CONFIG methods
>   tools: add support for bias flags
>   tools: add tests for bias flags
>   tools: gpioset: add support for drive flags
>   tools: add tests for drive flags
>   core: document gpiod_line_set_value_bulk NULL values behaviour
>   bindings: cxx: fix indentation of wrapped field descriptions
>   bindings: python: make vals in gpiod_Line_set_value consistent with
>     other functions
>
>  bindings/cxx/gpiod.hpp                 |  85 ++++-
>  bindings/cxx/line.cpp                  |  56 +++
>  bindings/cxx/line_bulk.cpp             |  89 +++++
>  bindings/cxx/tests/gpiod-cxx-test.cpp  |   2 +-
>  bindings/cxx/tests/tests-line.cpp      | 215 +++++++++++
>  bindings/python/gpiodmodule.c          | 485 +++++++++++++++++++++++--
>  bindings/python/tests/gpiod_py_test.py | 256 ++++++++++++-
>  include/gpiod.h                        | 297 +++++++++++++++
>  lib/core.c                             | 214 ++++++++++-
>  lib/ctxless.c                          | 114 +++++-
>  tests/gpiod-test.c                     |   4 +-
>  tests/tests-ctxless.c                  |  64 +++-
>  tests/tests-event.c                    | 120 ++++++
>  tests/tests-line.c                     | 468 +++++++++++++++++++++++-
>  tools/gpio-tools-test                  |   2 +-
>  tools/gpio-tools-test.bats             | 175 +++++++++
>  tools/gpioget.c                        |  17 +-
>  tools/gpiomon.c                        |  21 +-
>  tools/gpioset.c                        |  41 ++-
>  tools/tools-common.c                   |  22 ++
>  tools/tools-common.h                   |   2 +
>  21 files changed, 2679 insertions(+), 70 deletions(-)
>
> --
> 2.24.0
>

I applied the entire series with some very minor tweaks to coding
style and commit messages. Great work! Let's fix any leftover bugs (if
any) during this linux release cycle and release libgpiod v1.5
together with linux v5.5.

Best regards,
Bartosz Golaszewski
