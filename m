Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 216AA642941
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 14:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232138AbiLENWg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 08:22:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232218AbiLENW3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 08:22:29 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D7A1CB00
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 05:22:23 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 125345C00ED
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 08:22:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 05 Dec 2022 08:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :content-transfer-encoding:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm3; t=1670246540; x=1670332940; bh=FGHVlB0OB+j+Yo2yofzufw9RD
        6WencG832pXztFARds=; b=oM4BXYXyTq+DMAA9JukhtJgv3sl++t+cb8dM9WMQo
        5fvD3PFJ2vPo89hyHwp91il7cZbgC7fphf5GtVvnFGdqBp+AO97ggnUQ81V7CwKh
        WFS5PG+95Y3NThwDNUYWE7lEagdcyNUv4GGDQdHQUgLx9tTUhoL7hLuwKFEFPGQh
        lanTDuznUitedYk1q8eaFeNo0Lg8QlvZzSlR1vcSYrC9Zvlq7wvcEM61ZcMLJ5+O
        ueRKSc3Lvw4LsG5I4YBJb/v998svkyHrZZUp7yBL6wJ0Jke05vM/TpBU04wbmGej
        EA/sh1bW1XaZZnXUaStQgTRxlleObnqIC105HaH7NgbXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1670246540; x=1670332940; bh=FGHVlB0OB+j+Yo2yofzufw9RD6WencG832p
        XztFARds=; b=N7UStguJD8w/lMY5xmuKtBbffAp0JRgAXko7IHwnLpbOc/Jxhba
        OhV0zRJcc9u0EPYD7iXWKDi1q+3V9hKM22YTzP6myEXG+S9jC9dMBhuO2N0gntMO
        zY3pGiuf6qAL8nD/jIgZ42w7sAj/VB+jQS1YRqaph2Wv3ObZ4TCCQryCKEnTxmTa
        2Mk4diAwSWnjJyofl/3IvJ85MAeRqkJANGuEdWKaL54N9TjOCfRwXtRy+u3NwZYc
        oI/premepIeZhfqCNtkGYoL4pp55PFnFDzc65mWYTwUoQvfTwCC/vIV8xn0cRjQi
        myAjuXCHpTdQ9aLwovU0GoPcnFmd+EiGdlQ==
X-ME-Sender: <xms:i_CNY98Ugti6qIuhgd_ugo8vee1xFmsrf5ae5ReLK5M5hLrl2h-yWg>
    <xme:i_CNYxtZrfXC1JiPF_wA5mqju0hujz0fROn5gwLIMcib7U9e1y3tAsSrJ24a-SJ76
    m2ruww6wJEIBwml4A>
X-ME-Received: <xmr:i_CNY7CKId-y1Rj4Bd00IYhApZ0shhP7N7e0stB2r6fjYCrQ_Uvctchwq8Novld83XzEJvHzp20KJV4NSLk9WH9S0qPYCvlIiMBAnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeggdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrdhi
    ugdrrghuqeenucggtffrrghtthgvrhhnpeevuddtieekledttefgvdeutefhtdekgeejff
    ejvddvjeekgeejjeekfedtgfehueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgt
    tggrtghhvgdruggvvhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:i_CNYxeZBeNN2OZZccV_ZbjgQLdjLga7s-goaFxmUK9BVZ09YcZXag>
    <xmx:i_CNYyOdZAB_0oA0-zMYlJBG5EpK0322pqYA_ZYWYQ0ts2clJwRbjA>
    <xmx:i_CNYzn2LkcQiaB6YmDf_N1azKxMR3kqy75C-Gmj2GXEKSkVnTW45w>
    <xmx:jPCNY1Z0W2s-QfPB822h6YQ4Pqaz25bx4gch4tiBW0IB0_QlcQl1vg>
Feedback-ID: idfb84289:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-gpio@vger.kernel.org>; Mon, 5 Dec 2022 08:22:18 -0500 (EST)
From:   Andrew Jeffery <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org
Subject: [libgpiod][WIP PATCH 0/2] Convert the build from autotools to meson
Date:   Mon,  5 Dec 2022 23:52:05 +1030
Message-Id: <20221205132207.94775-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

Based on a recent poke [1] and in-between meetings I've put together a
WIP series that converts libgpiod's build from autotools to meson. As
far as I'm aware the meson build supports all the significant options to
enable or disable features exposed by the autotools build:

* Tests
* Tools
  * Interactive gpioset
* Bindings
  * C++
  * Python
  * Rust
* Documentation
  * Manpages
  * Doxygen

[1] https://lore.kernel.org/all/CAMRc=Mda8UnyH+_GxeX_4MyKd+DPN0BVH5K+J+VWnMJNC1vwTQ@mail.gmail.com/

Meson has pretty good support for handling python and so the patch does
away with setup.py entirely. However, the rust case isn't quite so
simple. In order to handle the dependencies of the rust bindings I've
called out to cargo through a custom target. It's not great, but from
what I could see it seems to be the path of least resistance given
meson's support for rust.

There's no support for installing the rust bindings through meson, but
this is not worse than the support we appeared to have under autotools.

It's worth noting that you'll probably want to disable the rust bindings
if you need to run the install phase for libgpiod under e.g. sudo but
have used rustup to install cargo for your unpriviledged user.

Also, if you've used rustup to install the rust toolchain you may also
need to install clang in order to pick up C toolchain headers for
consumption by bindgen.

Anyway, feedback on the rust part is definitely appreciated. Maybe
there's a better approach?

Moving along, the following tests pass in their entirety in my test VM:

* gpiod-test
* gpiod-cxx-test
* python -m gpiod.test

I've also briefly compared the install trees for the autotools and meson
builds under some configurations. The differences are accounted for by
meson defaulting to multi-arch installation paths for shared objects and
picking the generic rather than interpreter-version-specific python3
dist-packages directory under $PREFIX. Let me know if those seem
problematic.

A complete meson setup invocation looks as follows:

```
$ meson setup -Dbindings=cxx,python,rust -Ddocumentation=man,inline -Dexamples=true -Dtests=true -Dtools=true build
```

Subsequently the build can be performed with:

```
$ meson compile -C build
```

Meson defaults to using ninja as its backend, and automatically exploits
ccache[2] when available to keep repeated builds speedy.

[2] https://ccache.dev/

We end up with a net reduction of 254 LOC for the build system, and,
IMO, a single and fairly readable language to express it. Along with
that comes easy integration as a dependency in other (meson) projects
and a straight-forward path for their cross-compilation.

Let me know what you think.

Andrew

Andrew Jeffery (2):
  Introduce meson as a build system
  Remove autotools in favour of meson

 Doxyfile.in                               |   2 +-
 Makefile.am                               |  43 ----
 autogen.sh                                |  17 --
 bindings/Makefile.am                      |  22 --
 bindings/cxx/Makefile.am                  |  48 ----
 bindings/cxx/examples/Makefile.am         |  26 ---
 bindings/cxx/examples/meson.build         |   9 +
 bindings/cxx/gpiodcxx/Makefile.am         |  20 --
 bindings/cxx/gpiodcxx/meson.build         |  19 ++
 bindings/cxx/meson.build                  |  49 ++++
 bindings/cxx/tests/Makefile.am            |  32 ---
 bindings/cxx/tests/meson.build            |  26 +++
 bindings/meson.build                      |  14 ++
 bindings/python/Makefile.am               |  35 ---
 bindings/python/examples/Makefile.am      |  10 -
 bindings/python/examples/meson.build      |  12 +
 bindings/python/gpiod/Makefile.am         |  17 --
 bindings/python/gpiod/ext/Makefile.am     |  11 -
 bindings/python/gpiod/ext/meson.build     |  14 ++
 bindings/python/gpiod/meson.build         |  17 ++
 bindings/python/meson.build               |  16 ++
 bindings/python/setup.py                  |  47 ----
 bindings/python/tests/Makefile.am         |  17 --
 bindings/python/tests/gpiosim/Makefile.am |   7 -
 bindings/python/tests/gpiosim/meson.build |  12 +
 bindings/python/tests/meson.build         |  17 ++
 bindings/rust/Makefile.am                 |  19 --
 bindings/rust/gpiosim-sys/build.rs        |   9 +-
 bindings/rust/libgpiod-sys/build.rs       |   9 +-
 bindings/rust/meson.build                 |  33 +++
 configure.ac                              | 272 ----------------------
 include/Makefile.am                       |   4 -
 include/meson.build                       |   7 +
 lib/Makefile.am                           |  27 ---
 lib/meson.build                           |  30 +++
 man/Makefile.am                           |  16 --
 man/meson.build                           |  21 ++
 meson.build                               |  91 ++++++++
 meson_options.txt                         |   9 +
 tests/Makefile.am                         |  34 ---
 tests/gpiosim/Makefile.am                 |  16 --
 tests/gpiosim/meson.build                 |  24 ++
 tests/meson.build                         |  30 +++
 tools/Makefile.am                         |  39 ----
 tools/meson.build                         |  69 ++++++
 45 files changed, 532 insertions(+), 786 deletions(-)
 delete mode 100644 Makefile.am
 delete mode 100755 autogen.sh
 delete mode 100644 bindings/Makefile.am
 delete mode 100644 bindings/cxx/Makefile.am
 delete mode 100644 bindings/cxx/examples/Makefile.am
 create mode 100644 bindings/cxx/examples/meson.build
 delete mode 100644 bindings/cxx/gpiodcxx/Makefile.am
 create mode 100644 bindings/cxx/gpiodcxx/meson.build
 create mode 100644 bindings/cxx/meson.build
 delete mode 100644 bindings/cxx/tests/Makefile.am
 create mode 100644 bindings/cxx/tests/meson.build
 create mode 100644 bindings/meson.build
 delete mode 100644 bindings/python/Makefile.am
 delete mode 100644 bindings/python/examples/Makefile.am
 create mode 100644 bindings/python/examples/meson.build
 delete mode 100644 bindings/python/gpiod/Makefile.am
 delete mode 100644 bindings/python/gpiod/ext/Makefile.am
 create mode 100644 bindings/python/gpiod/ext/meson.build
 create mode 100644 bindings/python/gpiod/meson.build
 create mode 100644 bindings/python/meson.build
 delete mode 100644 bindings/python/setup.py
 delete mode 100644 bindings/python/tests/Makefile.am
 delete mode 100644 bindings/python/tests/gpiosim/Makefile.am
 create mode 100644 bindings/python/tests/gpiosim/meson.build
 create mode 100644 bindings/python/tests/meson.build
 delete mode 100644 bindings/rust/Makefile.am
 create mode 100644 bindings/rust/meson.build
 delete mode 100644 configure.ac
 delete mode 100644 include/Makefile.am
 create mode 100644 include/meson.build
 delete mode 100644 lib/Makefile.am
 create mode 100644 lib/meson.build
 delete mode 100644 man/Makefile.am
 create mode 100644 man/meson.build
 create mode 100644 meson.build
 create mode 100644 meson_options.txt
 delete mode 100644 tests/Makefile.am
 delete mode 100644 tests/gpiosim/Makefile.am
 create mode 100644 tests/gpiosim/meson.build
 create mode 100644 tests/meson.build
 delete mode 100644 tools/Makefile.am
 create mode 100644 tools/meson.build

-- 
2.37.2

