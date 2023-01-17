Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D05AF66D948
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jan 2023 10:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236139AbjAQJGV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Jan 2023 04:06:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235965AbjAQJF7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2023 04:05:59 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F1C2CFDE
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 01:01:23 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id g25so3064619uaw.8
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 01:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EgJAU2p69hFdi2aSLM24lFxG1fJ0dKwLoujmt0WwAGo=;
        b=GDQfsEKA5OTNfNmhNqxNKPQ+d8aqz0575cabszkUd6mjXj3ywUJqodPiqfz1t91GI0
         JpkXz4LmQvWkdn13suj3JeZJLtJqRh00NFGdqeMXUc/82/1MUD49WKyaDJtg43f/iHBt
         qqiy0ffR98muaxhDdw6KH20FWgDv3qwsPpbav/dTZmp1c+2yvzkUWT9ZPTV1pW3n/U2W
         gaO9qenW1XK7TT6bHR1l4X46vTwYBWUkyC+LUA+TdTsaMMcbf5+pKfBSjd1GeRPTxACE
         MuM7qu/2OZ7zylsNrhzlX/Ytkz5lUybq01QBFQMKVwy3F25LHJ3Xa+vjOQXOcVk+oNzr
         FYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgJAU2p69hFdi2aSLM24lFxG1fJ0dKwLoujmt0WwAGo=;
        b=s3vQE459o+2xrktybAQVxL/LFlxJ9x34UB2NonYWExecBJoGDUcmTRuaccswbArjaz
         9xVcpMbzJ4xe3TGVZEuGsxU4vFShic3e4gvlkuuov9ajkEfQUA9KFs7SZP6RlOefkAY1
         8TF4GSdOwVFlGxgdglvIdZJkwgV53VVg3830KeGfdlrdQhulUjYR5PtabnNnS9gH7Ydb
         HfIurdf/mPBTFv3junv4Wq9Kg5eLzlK4bu5gbsoSCTc6HlQcUU6Djrgay/rgGZy1yhwj
         7jvYtNCKW3hTBxz2GhAN6qiJrRph+8bsNseTUId5WtqQ3XayANAKbEOFqZ/dGq4vEB+a
         W4NA==
X-Gm-Message-State: AFqh2kqesXLJoWOGbn+tKtI3tnA75tG8+7JSBinKyqBgtJtZnQM2Hz2j
        XCzfO/1tVt9VA0a/EOi8ihqlZ123fVC/0f+DxxbpFg==
X-Google-Smtp-Source: AMrXdXtoD0tP5zLfm4qLr6BfWlLzhj40auF+wioh8ZLZcmCpFkdSiwgamZja0fARXPeYOxIen1iC/lQ4kW5F3novvXQ=
X-Received: by 2002:ab0:6c54:0:b0:424:e8b8:7bcb with SMTP id
 q20-20020ab06c54000000b00424e8b87bcbmr236478uas.123.1673946082208; Tue, 17
 Jan 2023 01:01:22 -0800 (PST)
MIME-Version: 1.0
References: <20230116181439.171563-1-jf@faschingbauer.co.at> <CACMJSevv8wi+VR-+BqQdL5uGoMCEnegJ0ZiDJmdXMk59Z-jFMQ@mail.gmail.com>
In-Reply-To: <CACMJSevv8wi+VR-+BqQdL5uGoMCEnegJ0ZiDJmdXMk59Z-jFMQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 17 Jan 2023 10:01:11 +0100
Message-ID: <CAMRc=McUFEoz3wHoX1VwPZMiTLpdSL5Rz7m6nFO=mp9LB0_XNA@mail.gmail.com>
Subject: Re: [PATCH] bindings: python: fix out-of-source build
To:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     jf@faschingbauer.co.at, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 16, 2023 at 10:07 PM Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
>
> On Mon, 16 Jan 2023 at 19:15, <jf@faschingbauer.co.at> wrote:
> >
> > From: Joerg Faschingbauer <jf@faschingbauer.co.at>
> >
> > Makefile.am delegates the build of the python extension to its
> > setup.py file, which references the extension .c files relative to the
> > source dir. This makes it impossible to build in a directory that is
> > different from the source directory (for example, for PC and ARM but
> > from the same source).
> >
>
> Thanks for sparing me the surprise of finding that out when writing
> the bitbake recipe. Great catch!
>
> A couple nits below:
>
> > * Modify Makefile.am to pass automake's $(srcdir) into setup.py via
> >   GPIOD_SRCDIR environment variable.
> > * Modify setup.py to pick up .c files relative from that directory.
>
> Can you leave your Sign-off here?
>
> > ---
> >  bindings/python/Makefile.am |  6 ++++--
> >  bindings/python/setup.py    | 23 ++++++++++++++---------
> >  2 files changed, 18 insertions(+), 11 deletions(-)
> >
> > diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
> > index 3212a8f..6c2f99b 100644
> > --- a/bindings/python/Makefile.am
> > +++ b/bindings/python/Makefile.am
> > @@ -12,13 +12,15 @@ endif
> >  all-local:
> >         GPIOD_VERSION_STRING=$(VERSION_STR) \
> >         GPIOD_WITH_TESTS=$(BUILD_TESTS) \
> > -       $(PYTHON) setup.py build_ext --inplace \
> > +       GPIOD_SRCDIR=$(srcdir) \
> > +       $(PYTHON) $(srcdir)/setup.py build_ext --inplace \
> >                 --include-dirs=$(top_srcdir)/include/:$(top_srcdir)/tests/gpiosim/ \
> >                 --library-dirs=$(top_builddir)/lib/.libs/:$(top_srcdir)/tests/gpiosim/.libs/
> >
> >  install-exec-local:
> >         GPIOD_WITH_TESTS= \
> > -       $(PYTHON) setup.py install --prefix=$(prefix)
> > +       GPIOD_SRCDIR=$(srcdir) \
> > +       $(PYTHON) $(srcdir)/setup.py install --prefix=$(prefix)
> >
> >  SUBDIRS = gpiod
> >
> > diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> > index a951069..3ab01e1 100644
> > --- a/bindings/python/setup.py
> > +++ b/bindings/python/setup.py
> > @@ -2,17 +2,22 @@
> >  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
> >
> >  from os import environ
> > +import os.path
>
> Maybe `from os import environ, path`?
>
> >  from setuptools import setup, Extension, find_packages
> >
> > +srcdir = environ.get('GPIOD_SRCDIR', '.')
> > +def src(path):
> > +    return os.path.join(srcdir, path)
> > +
> >  gpiod_ext = Extension(
> >      "gpiod._ext",
> >      sources=[
> > -        "gpiod/ext/chip.c",
> > -        "gpiod/ext/common.c",
> > -        "gpiod/ext/line-config.c",
> > -        "gpiod/ext/line-settings.c",
> > -        "gpiod/ext/module.c",
> > -        "gpiod/ext/request.c",
> > +        src("gpiod/ext/chip.c"),
> > +        src("gpiod/ext/common.c"),
> > +        src("gpiod/ext/line-config.c"),
> > +        src("gpiod/ext/line-settings.c"),
> > +        src("gpiod/ext/module.c"),
> > +        src("gpiod/ext/request.c"),
> >      ],
> >      define_macros=[("_GNU_SOURCE", "1")],
> >      libraries=["gpiod"],
> > @@ -21,7 +26,7 @@ gpiod_ext = Extension(
> >
> >  gpiosim_ext = Extension(
> >      "tests.gpiosim._ext",
> > -    sources=["tests/gpiosim/ext.c"],
> > +    sources=[src("tests/gpiosim/ext.c")],
> >      define_macros=[("_GNU_SOURCE", "1")],
> >      libraries=["gpiosim"],
> >      extra_compile_args=["-Wall", "-Wextra"],
> > @@ -29,7 +34,7 @@ gpiosim_ext = Extension(
> >
> >  procname_ext = Extension(
> >      "tests.procname._ext",
> > -    sources=["tests/procname/ext.c"],
> > +    sources=[src("tests/procname/ext.c")],
> >      define_macros=[("_GNU_SOURCE", "1")],
> >      extra_compile_args=["-Wall", "-Wextra"],
> >  )
> > @@ -39,7 +44,7 @@ if "GPIOD_WITH_TESTS" in environ and environ["GPIOD_WITH_TESTS"] == "1":
> >      extensions.append(gpiosim_ext)
> >      extensions.append(procname_ext)
> >
> > -with open("gpiod/version.py", "r") as fd:
> > +with open(src("gpiod/version.py"), "r") as fd:
> >      exec(fd.read())
> >
> >  setup(
> > --
> > 2.38.1
> >
>
> Looks good otherwise!
>
> Bart

Now when I'm thinking about it: why not simply use the __file__
variable, run it through dirname() and derive the right directory like
that?

Bart
