Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1579B75A874
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 09:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbjGTH7Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 03:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjGTH7N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 03:59:13 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680402128
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 00:59:12 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-799a451ca9cso188093241.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 00:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689839951; x=1690444751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJzaZMT/kWQFyyJyf5tbR1SbrmBJGn5JRGIiOEvzcxs=;
        b=zbzLTAB2KaHECHT3cccA931UsJg7yEiThu9uVGX14SeRtNvAOle1em0b7evnREIQQz
         7qsmxzWWqJGdxx28+61D9sws9+yGK6pa3yHnZmn8Wm4DyjVtvIbAMSinFmT379g7C9rs
         ofJhvExvUeuoX5yAwHwgsvnHSqi5n5Es7qZGxoED0TuUV6eWFyeoqCAf2qAvVrpss1cQ
         CvNHlVIOH7G34gjvn8qKd5/OsO1BlpRBJpMwY7ApWRpOSEaR7bSJsuBL9ofFO3u1hD28
         Og0tgxzzjl+LsPZU8/N6lCvRKBcn3iPDTzKH0AO7SFAJjZmABWJqAikCLMmPcdqUlnV7
         +FEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689839951; x=1690444751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJzaZMT/kWQFyyJyf5tbR1SbrmBJGn5JRGIiOEvzcxs=;
        b=fosd/WmTfMiGrAvY7W+8Hf4r8NUi7EZUHBDfErx5955J2qzvw7qc3J2RY3T94udRo4
         uGWdCfaz+wFfg06VzzFN5YUy5GJV8NdL5qynbSx8nEF1veO+ewUyF8X2C/XCqXmTAdxo
         VJsBqaAQZFEBPKeP1HZxg/kgHDRHbLNvzzQBA/4+q2PVUejxrTWtmdqpmf4X9gjaInP2
         jX4Qz2vTrY+zDhNhzayDyU6M0QSaWUmB86Ib8XAi+RD2M3m17ZifbNfwNloDCHg5EUGd
         wy+tpI0IvVHYGrtFenN9S06E6V8rNWWzpInlkCoo7keU4KDY+I15Wg/PZk21r9nvI27Y
         CwPQ==
X-Gm-Message-State: ABy/qLZuLpFnm4OH8h0+CM7eYafub2FYc0sT7teEOoTARBtRBF8+xlfn
        SiUImVUGcSG0CrP3FCxNz0dUhOGYIkA0ioPgNz/T1g==
X-Google-Smtp-Source: APBJJlGRud6ac48IlnxwuRM4e7T55+/+8xn2AR0ZQ4It8K0rv1LdCmpfXUnBII9k3zGqKmLlmVKmbnPqPDvzvgg8vTk=
X-Received: by 2002:a67:f996:0:b0:443:70bd:719f with SMTP id
 b22-20020a67f996000000b0044370bd719fmr1178929vsq.2.1689839951287; Thu, 20 Jul
 2023 00:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230719192057.172560-1-brgl@bgdev.pl> <ZLipqIJE1Mo4oK00@sol>
In-Reply-To: <ZLipqIJE1Mo4oK00@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Jul 2023 09:59:00 +0200
Message-ID: <CAMRc=Mf=Xf7KPP+9GPC6=1Gsp3XTfzrwjOK2jrqeP7QUVxtD+Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/5] core: provide information about the parent
 chip in line requests
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 5:27=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> On Wed, Jul 19, 2023 at 09:20:52PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > While working on the DBus API, it occurred to me that while we can obta=
in
> > the list of requested offsets from a line request, this information lac=
ks
> > context if we cannot get any information about the parent chip on which
> > the request was made.
> >
> > We cannot reference the chip in any way as its lifetime is disconnected
> > from the request but we can at least provide the path to the character
> > device used to open it as a way of providing some context for the offse=
ts.
> >
>
> No problem with this conceptually, the only question I have is which
> one of these should be stored:
>  - requested path e.g. 'a_symlink_to_my_favorite_chip'
>  - canonicalised path e.g. '/dev/gpiochip0'
>  - chip name e.g. 'gpiochip0'
>  - chip number e.g. 0
>
> In this patch we get the requested path, right?
>

Yes, I think we should just use whatever filesystem path was used to
create the chip as it would be the one allowing the caller to reopen
the same chip.

Bart

> Cheers,
> Kent.
>
> > This series adds a new getter for struct gpiod_line_request and wrapper=
s
> > for it for all bindings. This will be used in the upcoming DBus GPIO
> > manager code.
> >
> > Bartosz Golaszewski (5):
> >   core: provide gpiod_line_request_get_chip_path()
> >   tests: add a test-case for gpiod_line_request_get_chip_path()
> >   bindings: cxx: provide line_request::chip_path()
> >   bindings: python: provide the chip_path property in line_request
> >   bindings: rust: provide LineRequest::chip_path()
> >
> >  bindings/cxx/gpiodcxx/line-request.hpp       |  7 +++++++
> >  bindings/cxx/line-request.cpp                | 10 +++++++++-
> >  bindings/cxx/tests/tests-line-request.cpp    |  6 ++++--
> >  bindings/python/gpiod/chip.py                |  1 +
> >  bindings/python/gpiod/line_request.py        | 12 +++++++++--
> >  bindings/python/tests/tests_line_request.py  | 13 +++++++-----
> >  bindings/rust/libgpiod/src/line_request.rs   | 12 +++++++++++
> >  bindings/rust/libgpiod/tests/line_request.rs | 13 ++++++++++++
> >  include/gpiod.h                              |  9 +++++++++
> >  lib/chip.c                                   |  2 +-
> >  lib/internal.h                               |  3 ++-
> >  lib/line-request.c                           | 20 ++++++++++++++++++-
> >  tests/tests-line-request.c                   | 21 ++++++++++++++++++++
> >  13 files changed, 116 insertions(+), 13 deletions(-)
> >
> > --
> > 2.39.2
> >
