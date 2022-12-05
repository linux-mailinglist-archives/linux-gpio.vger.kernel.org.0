Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2F206430DE
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 19:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231924AbiLES4i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 13:56:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233299AbiLES4K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 13:56:10 -0500
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767F81FF81
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 10:55:41 -0800 (PST)
Received: by mail-vk1-xa31.google.com with SMTP id 6so3681244vkz.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Dec 2022 10:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kqXyG56vZw638sptnvBKf435AngiZcHLmHAhTx7KT1I=;
        b=AmiqqYUDOw+4Wb3wAZZfObYO5ri3jKpa6RuvqHJAsCqHlmCB6si4pdOJqzVkSKN8NL
         BjlFtFVfgXjQCCpVk1ViNzNtPcKzJxSP1YMVHGVtgF09DbPBHQPS0QvB6I6zXTBJex4Q
         DiPiUQBe4nse6EedkEVrtRvOMRDmb+EHqeSFJpBuMxzUOthBcNaY0ic4QYc9E/feEHg2
         U8uF7Ph3Fa6SikV1BUtXSRMNO5Zv+qg0mqFhZBb3gOka6mOXbQqzcPb7SPYVfy2ZZBvM
         QYHPuC7bt2pK4bXQfpShT7N5S321VFYLWaQFFPrVRhJVITNrqBpEQ2EoDmQ714eU/qHE
         ojdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqXyG56vZw638sptnvBKf435AngiZcHLmHAhTx7KT1I=;
        b=2BmsP2YEx0HBr8bgdRE36zP5Cj30ECd9L+vHdmpSV7SZqjHa4PgzNCfxnJzIHKvWUR
         YK85KNrn2OKmkadpFFay/QBUSTcRhE328c0suAhJefbG+3wzzn7n2n2wCrd8qpfAcA8A
         NJjZBE0cc0ZOmxl8N78y7XQWMzq/W33vqWu0R/emWyBPmUjGmkQ4iwDgRAuQkAyE+cC6
         pxmFIPyg6hHFbbHA4BuVqsgVCEJTbShceVFQqEeKyL0ixc/d4CcHR2KaAdp3fcs9SOnH
         uUTGAwEr0p55YdMkPYUVKc56Kg8BBg2PewdxykTVrYB0K4YAkqd4pyupyZxP89iPDuRf
         2NXA==
X-Gm-Message-State: ANoB5pkqNpfaB5b66BtD5pwP2QlZnzrZO2HSPzRZ4wVFQ8yjl8s7r5Q5
        VVu1IutATPOxDMhsluN4FYioza+ihOkRywLaD04+DQ==
X-Google-Smtp-Source: AA0mqf7N3FGcbaz3lxEgd6tfgFzsay2dqcKF4pOIl9bpWlTJi2dC5UqmVp9LMV9Ouf6QTr60dcYAIc+tTVTxPNjysKU=
X-Received: by 2002:ac5:c915:0:b0:3b8:7fbd:9554 with SMTP id
 t21-20020ac5c915000000b003b87fbd9554mr36935156vkl.27.1670266540449; Mon, 05
 Dec 2022 10:55:40 -0800 (PST)
MIME-Version: 1.0
References: <20221205132207.94775-1-andrew@aj.id.au>
In-Reply-To: <20221205132207.94775-1-andrew@aj.id.au>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 5 Dec 2022 19:55:29 +0100
Message-ID: <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
Subject: Re: [libgpiod][WIP PATCH 0/2] Convert the build from autotools to meson
To:     Andrew Jeffery <andrew@aj.id.au>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
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

On Mon, Dec 5, 2022 at 2:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> Based on a recent poke [1] and in-between meetings I've put together a
> WIP series that converts libgpiod's build from autotools to meson. As
> far as I'm aware the meson build supports all the significant options to
> enable or disable features exposed by the autotools build:
>
> * Tests
> * Tools
>   * Interactive gpioset
> * Bindings
>   * C++
>   * Python
>   * Rust
> * Documentation
>   * Manpages
>   * Doxygen
>
> [1] https://lore.kernel.org/all/CAMRc=Mda8UnyH+_GxeX_4MyKd+DPN0BVH5K+J+VWnMJNC1vwTQ@mail.gmail.com/
>
> Meson has pretty good support for handling python and so the patch does
> away with setup.py entirely.

Eek! No, please do keep setup.py. Autotools too is capable of building
python C extensions on its own and it's what we use in v1 but I want
the python code to be built the standard python way. I actually plan
to post libgpiod v2 on pypi and split out building python bindings
into a separate bitbake recipe in meta-openembedded using the
setuptools3 class.

So let's keep setup.py and just call it from meson.

> However, the rust case isn't quite so
> simple. In order to handle the dependencies of the rust bindings I've
> called out to cargo through a custom target. It's not great, but from
> what I could see it seems to be the path of least resistance given
> meson's support for rust.
>
> There's no support for installing the rust bindings through meson, but
> this is not worse than the support we appeared to have under autotools.
>

I think Viresh too wants to keep cargo as the building agent for the rust code.

> It's worth noting that you'll probably want to disable the rust bindings
> if you need to run the install phase for libgpiod under e.g. sudo but
> have used rustup to install cargo for your unpriviledged user.
>

Current autotools setup doesn't install rust bindings at all, can we
keep it this way?

> Also, if you've used rustup to install the rust toolchain you may also
> need to install clang in order to pick up C toolchain headers for
> consumption by bindgen.
>
> Anyway, feedback on the rust part is definitely appreciated. Maybe
> there's a better approach?
>

Cc'ed Viresh and Kent.

> Moving along, the following tests pass in their entirety in my test VM:
>
> * gpiod-test
> * gpiod-cxx-test
> * python -m gpiod.test
>
> I've also briefly compared the install trees for the autotools and meson
> builds under some configurations. The differences are accounted for by
> meson defaulting to multi-arch installation paths for shared objects and
> picking the generic rather than interpreter-version-specific python3
> dist-packages directory under $PREFIX. Let me know if those seem
> problematic.
>
> A complete meson setup invocation looks as follows:
>
> ```
> $ meson setup -Dbindings=cxx,python,rust -Ddocumentation=man,inline -Dexamples=true -Dtests=true -Dtools=true build
> ```
>
> Subsequently the build can be performed with:
>
> ```
> $ meson compile -C build
> ```
>
> Meson defaults to using ninja as its backend, and automatically exploits
> ccache[2] when available to keep repeated builds speedy.
>

It does show! Full rebuild with autotools:

real 0m43,902s
user 2m40,010s
sys 0m20,172s

Full rebuild with meson:

real 0m10,001s
user 1m1,334s
sys 0m12,205s

More than 4x faster now.

> [2] https://ccache.dev/
>
> We end up with a net reduction of 254 LOC for the build system, and,
> IMO, a single and fairly readable language to express it. Along with
> that comes easy integration as a dependency in other (meson) projects
> and a straight-forward path for their cross-compilation.
>
> Let me know what you think.

Meson has a steep learning curve but I really want to move over to it
now and will put in the time to learn it. Thanks for doing it. The
patches are functional from what I tested so far.

One thing I'd love to see changed is: put all API and ABI version
number next to each other in a single place so that there's less risk
of forgetting to update one of them when making a release. Is that
possible?

Bart

>
> Andrew
>
> Andrew Jeffery (2):
>   Introduce meson as a build system
>   Remove autotools in favour of meson
>
>  Doxyfile.in                               |   2 +-
>  Makefile.am                               |  43 ----
>  autogen.sh                                |  17 --
>  bindings/Makefile.am                      |  22 --
>  bindings/cxx/Makefile.am                  |  48 ----
>  bindings/cxx/examples/Makefile.am         |  26 ---
>  bindings/cxx/examples/meson.build         |   9 +
>  bindings/cxx/gpiodcxx/Makefile.am         |  20 --
>  bindings/cxx/gpiodcxx/meson.build         |  19 ++
>  bindings/cxx/meson.build                  |  49 ++++
>  bindings/cxx/tests/Makefile.am            |  32 ---
>  bindings/cxx/tests/meson.build            |  26 +++
>  bindings/meson.build                      |  14 ++
>  bindings/python/Makefile.am               |  35 ---
>  bindings/python/examples/Makefile.am      |  10 -
>  bindings/python/examples/meson.build      |  12 +
>  bindings/python/gpiod/Makefile.am         |  17 --
>  bindings/python/gpiod/ext/Makefile.am     |  11 -
>  bindings/python/gpiod/ext/meson.build     |  14 ++
>  bindings/python/gpiod/meson.build         |  17 ++
>  bindings/python/meson.build               |  16 ++
>  bindings/python/setup.py                  |  47 ----
>  bindings/python/tests/Makefile.am         |  17 --
>  bindings/python/tests/gpiosim/Makefile.am |   7 -
>  bindings/python/tests/gpiosim/meson.build |  12 +
>  bindings/python/tests/meson.build         |  17 ++
>  bindings/rust/Makefile.am                 |  19 --
>  bindings/rust/gpiosim-sys/build.rs        |   9 +-
>  bindings/rust/libgpiod-sys/build.rs       |   9 +-
>  bindings/rust/meson.build                 |  33 +++
>  configure.ac                              | 272 ----------------------
>  include/Makefile.am                       |   4 -
>  include/meson.build                       |   7 +
>  lib/Makefile.am                           |  27 ---
>  lib/meson.build                           |  30 +++
>  man/Makefile.am                           |  16 --
>  man/meson.build                           |  21 ++
>  meson.build                               |  91 ++++++++
>  meson_options.txt                         |   9 +
>  tests/Makefile.am                         |  34 ---
>  tests/gpiosim/Makefile.am                 |  16 --
>  tests/gpiosim/meson.build                 |  24 ++
>  tests/meson.build                         |  30 +++
>  tools/Makefile.am                         |  39 ----
>  tools/meson.build                         |  69 ++++++
>  45 files changed, 532 insertions(+), 786 deletions(-)
>  delete mode 100644 Makefile.am
>  delete mode 100755 autogen.sh
>  delete mode 100644 bindings/Makefile.am
>  delete mode 100644 bindings/cxx/Makefile.am
>  delete mode 100644 bindings/cxx/examples/Makefile.am
>  create mode 100644 bindings/cxx/examples/meson.build
>  delete mode 100644 bindings/cxx/gpiodcxx/Makefile.am
>  create mode 100644 bindings/cxx/gpiodcxx/meson.build
>  create mode 100644 bindings/cxx/meson.build
>  delete mode 100644 bindings/cxx/tests/Makefile.am
>  create mode 100644 bindings/cxx/tests/meson.build
>  create mode 100644 bindings/meson.build
>  delete mode 100644 bindings/python/Makefile.am
>  delete mode 100644 bindings/python/examples/Makefile.am
>  create mode 100644 bindings/python/examples/meson.build
>  delete mode 100644 bindings/python/gpiod/Makefile.am
>  delete mode 100644 bindings/python/gpiod/ext/Makefile.am
>  create mode 100644 bindings/python/gpiod/ext/meson.build
>  create mode 100644 bindings/python/gpiod/meson.build
>  create mode 100644 bindings/python/meson.build
>  delete mode 100644 bindings/python/setup.py
>  delete mode 100644 bindings/python/tests/Makefile.am
>  delete mode 100644 bindings/python/tests/gpiosim/Makefile.am
>  create mode 100644 bindings/python/tests/gpiosim/meson.build
>  create mode 100644 bindings/python/tests/meson.build
>  delete mode 100644 bindings/rust/Makefile.am
>  create mode 100644 bindings/rust/meson.build
>  delete mode 100644 configure.ac
>  delete mode 100644 include/Makefile.am
>  create mode 100644 include/meson.build
>  delete mode 100644 lib/Makefile.am
>  create mode 100644 lib/meson.build
>  delete mode 100644 man/Makefile.am
>  create mode 100644 man/meson.build
>  create mode 100644 meson.build
>  create mode 100644 meson_options.txt
>  delete mode 100644 tests/Makefile.am
>  delete mode 100644 tests/gpiosim/Makefile.am
>  create mode 100644 tests/gpiosim/meson.build
>  create mode 100644 tests/meson.build
>  delete mode 100644 tools/Makefile.am
>  create mode 100644 tools/meson.build
>
> --
> 2.37.2
>
