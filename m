Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5107472FF68
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jun 2023 15:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235509AbjFNNEL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Jun 2023 09:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244078AbjFNNEI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Jun 2023 09:04:08 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9851FEB
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 06:04:05 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b1b084620dso9558011fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686747843; x=1689339843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sBSu4VtP6f42X4ReWiWcwzyYLFHIh9mwYoXW3S676c=;
        b=gNiIKFXHV/4dThXZ0HCrlnLCN/wivkwA9Z9tT80cGSAg1kJcdntHKT9XCcZytG037o
         jahwuCXZ+hi8D0uqtsb0/BIY6J/4xsLNRXTPM43x+/MO+q7awW67LeeG7bii/rBqeWLA
         VlFOgeXzDJnUQb3VQkuN6r2IFmSk/Ybykd3VNEyXpqiMrev/hNU7FTqOEuT62DbCfyVv
         ZGiVYsgXbCk73j0ozaJyCj+Gq9BWwdO/y4TrwU/10vzUfsorrKOgs7NnpodD9dwXFPqB
         J+806VOvb2oHccQgNQpepVkiO2qHXLo0354CHxUs/yg3rbxm+JernbJ7v0mGXkwM3EkM
         4vuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686747843; x=1689339843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sBSu4VtP6f42X4ReWiWcwzyYLFHIh9mwYoXW3S676c=;
        b=KU5wXPecZ0WRmmmfi9ec4N2auTO6zW0hY3EFYfrV13+y/x+yNwTz8i04ermiv8gbhJ
         t+BYIQ1LVz3OIhnHpxHcifUOvjF08sSQOjpoAFNtc4Hnv56wRPvO9gf7qN8l+NxJatOj
         mrHsQAZc1eUtOAVrEPHVvSYjcZJkmRYHXh9/c/JmwYpo+FOfxpts9q3qffHPohdUIzqX
         Ba8SSI94sf1Q2RUmjcaXZXfzjHVMrjgZ4uF/ef7e6pnIQ0oKWmfZu2bLqX9l3Rr8HkRS
         A4NnH+1ENNmTFyxxNGngJ6Cj8/WBVSY3/E03gxBRfNmep8F33//e4+DmYabkYH04Ienn
         6P3w==
X-Gm-Message-State: AC+VfDzXosPesQXKFTuiqNzmMqVS1J2kQzM59b+cGqllo3blW2v7XhCB
        N/Gg0z0bh5ihmAXLjZWQPyVh5mrZptpBzFEJ1JbGlzSr9jZAPnSP
X-Google-Smtp-Source: ACHHUZ7SLxEjEhHw1t0IRvpO0kdbUtyXAxs7ktDVuIFiDNpY9ZwhtEGvYGsx+XNIqx4Lo5uHw0mdRunr+tMOQVmswMk=
X-Received: by 2002:a05:651c:120a:b0:2b1:e900:3ca5 with SMTP id
 i10-20020a05651c120a00b002b1e9003ca5mr6331960lja.29.1686747843318; Wed, 14
 Jun 2023 06:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230614035426.15097-1-warthog618@gmail.com>
In-Reply-To: <20230614035426.15097-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 14 Jun 2023 15:03:51 +0200
Message-ID: <CAMRc=Mf3vtfUyprLcJ7g8Y_Jt0k4=FoKMjjxqRA__YNmqeCDLQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/4] dedicated examples
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

On Wed, Jun 14, 2023 at 5:54=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> This series forms the basis of a proposal to rework the libgpiod
> examples.
>
> IMHO, the examples have a number of issues including:
>  - no C examples other than the tools - which have become too complicated
>    to be fit for that purpose.
>  - bindings examples focus on simplifications of the tools rather than
>    demonstrating typical use cases.
>  - being more complex than necessary to demonstrate a particular use case=
.
>  - naming that does not help new users identify the example that
>    demonstrates a particular use case.
>
> To address these issues I propose adding a set of dedicated examples,
> each of which demonstrates one primary use case with as little
> additional fat as possible.  Each example should be named after the use
> case it demonstrates.  Each examples should be implemented for all
> supported languages, to provide examples for users considering
> language choice and for developers to compare the APIs and identify
> areas for improvement.
>
> The examples are explicitly intended to answer "how do I use libgpiod to
> do xxx" questions, with as few distractions as possible.
>
> The examples may demonstrate ancillary features, as long as that is
> relevant to the primary use case. e.g. the watch_line_value examples
> set the line bias and debounce.
>
> The examples should hard code input parameters, not pull them from the
> command line or environment, as that is distracting and frequently more
> complicated than the example itself.
>
> The examples should be standalone - they should not share code.  Large
> chunks of shared code are an indicator that libgpiod probably needs to
> provide additional functionality to simplify use cases.
>
> The examples are not intended to be distributed in binary form, but
> could be incorporated into the documentation.
>
> The set of examples provided is a starter set that answer the following
> questions:
>  - how do you get the value of a line?
>  - how do you set the value of a line?
>  - how do you watch for edge events on a line?
>  - how do you watch for edge events asynchronously (e.g. using poll())?
>
> I didn't add the latter in Rust as that should be done using one of the
> many available async reactors and I didn't want to pick one or pull in
> any dependencies.
>
> I expect that this proposal may be contraversial, and that is one of the
> reasons I've kept the starter set small.
>
> Cheers,
> Kent.
>
> Kent Gibson (4):
>   core: examples: add dedicated examples
>   bindings: cxx: examples: add dedicated examples
>   bindings: python: examples: add dedicated examples
>   bindings: rust: examples: add dedicated examples
>
>  Makefile.am                                   |   6 +
>  bindings/cxx/examples/.gitignore              |   4 +
>  bindings/cxx/examples/Makefile.am             |  14 +-
>  .../cxx/examples/async_watch_line_value.cpp   |  78 ++++++++++
>  bindings/cxx/examples/get_line_value.cpp      |  29 ++++
>  bindings/cxx/examples/toggle_line_value.cpp   |  45 ++++++
>  bindings/cxx/examples/watch_line_value.cpp    |  62 ++++++++
>  .../python/examples/async_watch_line_value.py |  47 ++++++
>  bindings/python/examples/get_line_value.py    |  26 ++++
>  bindings/python/examples/toggle_line_value.py |  47 ++++++
>  bindings/python/examples/watch_line_value.py  |  42 ++++++
>  .../rust/libgpiod/examples/get_line_value.rs  |  28 ++++
>  .../libgpiod/examples/toggle_line_value.rs    |  43 ++++++
>  .../libgpiod/examples/watch_line_value.rs     |  50 +++++++
>  configure.ac                                  |   1 +
>  examples/.gitignore                           |   7 +
>  examples/Makefile.am                          |  17 +++
>  examples/async_watch_line_value.c             | 136 ++++++++++++++++++
>  examples/get_line_value.c                     |  97 +++++++++++++
>  examples/toggle_line_value.c                  | 106 ++++++++++++++
>  examples/watch_line_value.c                   | 127 ++++++++++++++++
>  21 files changed, 1011 insertions(+), 1 deletion(-)
>  create mode 100644 bindings/cxx/examples/async_watch_line_value.cpp
>  create mode 100644 bindings/cxx/examples/get_line_value.cpp
>  create mode 100644 bindings/cxx/examples/toggle_line_value.cpp
>  create mode 100644 bindings/cxx/examples/watch_line_value.cpp
>  create mode 100755 bindings/python/examples/async_watch_line_value.py
>  create mode 100755 bindings/python/examples/get_line_value.py
>  create mode 100755 bindings/python/examples/toggle_line_value.py
>  create mode 100755 bindings/python/examples/watch_line_value.py
>  create mode 100644 bindings/rust/libgpiod/examples/get_line_value.rs
>  create mode 100644 bindings/rust/libgpiod/examples/toggle_line_value.rs
>  create mode 100644 bindings/rust/libgpiod/examples/watch_line_value.rs
>  create mode 100644 examples/.gitignore
>  create mode 100644 examples/Makefile.am
>  create mode 100644 examples/async_watch_line_value.c
>  create mode 100644 examples/get_line_value.c
>  create mode 100644 examples/toggle_line_value.c
>  create mode 100644 examples/watch_line_value.c
>
> --
> 2.40.1
>

Great idea! I applied patches 1-3 with some tweaks (coding style, C++
comments, statify functions, put local functions into anonymous
namespaces for C++, apply black to python code etc. etc.).

You can respin the rust patch separately.

Thanks
Bart
