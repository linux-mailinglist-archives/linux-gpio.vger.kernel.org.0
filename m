Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94CFB6475C8
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Dec 2022 19:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbiLHSsf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Dec 2022 13:48:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbiLHSse (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Dec 2022 13:48:34 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE1F78B8C
        for <linux-gpio@vger.kernel.org>; Thu,  8 Dec 2022 10:48:33 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id m4so2298772vsc.6
        for <linux-gpio@vger.kernel.org>; Thu, 08 Dec 2022 10:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u565gLaSSozkJPoxCcR7o8bGxVY7hZFnpPnRMFpB42A=;
        b=03tythiw0CqcvDx/9TTludLlm+I3xb0sj0B+CnFDRwyPH+kxFyxgr2sYmZQfg2uJw1
         1/xK6LIiUDXRv95JGPsYaXcGVl7PGpRw8A1kZg62r+hWDEFtOhUCcN4DehDinggA/3z1
         +7QsfEMnrZSpGybqR97Z9LLbshux+9fX5VqsvHnM1QLOY939AaYH7p/QCFTCz0jCSBIA
         ZvXkpD3xe7q1b1kdpb5PjMEVVvhNjGRo6dTqyXeXU5b6e0vWajhCXutKedhORpmrDI4b
         nuPoUT3dN2Iz/m8ubP0Ur1/r9yBWkjdo1PSJK40EbRDYBm1yAUShklc3FCwdVunIt/FQ
         7bOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u565gLaSSozkJPoxCcR7o8bGxVY7hZFnpPnRMFpB42A=;
        b=B2GorjV+unoUjdjGiHrWz86ZLUfOVvzA3tujz9LAwIZJhQ3RBZnLoNa+UzmF6LLhZs
         M/6pXgLhi1iZKTGDiDpuqrie+2CpKmyUItF1fSldPQEzN3GZV+dsGPDeHZFtmrnIMWvn
         9iuXlWUN+vS4yVAW+Eu3Vl95vKZ+shOsnrxcZRFFc5/mksebsBick1JlJioxek8XTMug
         +8pIbHqCJcfTPMMYzK9I+t8KISqrBTvCck0stvXsZA2iCh6laPn2jRthl+AE0PgibmFa
         7C6P/V2jCh9N1N9gwm4DNuqVYkge/DQNyrGJUZl+X8+481dkXGVTTFT0xLgj7uOHjK8k
         s7tQ==
X-Gm-Message-State: ANoB5pmVfkY25nT8gHZZ4Wd0tmTidGfYJWuMCmSmeISRNCjfYAcNJdMF
        NnaT+I4ch0EUGo0EPBePUUZwMUkgeRK+0A4eH+VQKg==
X-Google-Smtp-Source: AA0mqf5RS7v6+ICwi3/U6+StklBNEhTafnv4k6CYwCon+752KJoX74RoPkYEw6jZf8w0nX4wGFKlIyt8x3brU2RJDyE=
X-Received: by 2002:a67:1c85:0:b0:3b0:92e2:37b0 with SMTP id
 c127-20020a671c85000000b003b092e237b0mr28626265vsc.9.1670525312116; Thu, 08
 Dec 2022 10:48:32 -0800 (PST)
MIME-Version: 1.0
References: <20221205132207.94775-1-andrew@aj.id.au> <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
 <01a47fff-c21d-4309-a7a2-fa7a87f4e024@app.fastmail.com> <CAMRc=MchiuLWy1yrO-HNVtUFyJjFK2Jdp_aBjomL9n5JAgv_Vw@mail.gmail.com>
 <387f1d7d-8122-4533-8385-3e37dbd7ca7d@app.fastmail.com>
In-Reply-To: <387f1d7d-8122-4533-8385-3e37dbd7ca7d@app.fastmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 8 Dec 2022 19:48:20 +0100
Message-ID: <CAMRc=MfzNG-WzEox6Rb7QpFVP4mF_pkw2earWbjuKjCHu9eBuQ@mail.gmail.com>
Subject: Re: [libgpiod][WIP PATCH 0/2] Convert the build from autotools to meson
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 8, 2022 at 12:11 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 8 Dec 2022, at 19:57, Bartosz Golaszewski wrote:
> > On Thu, Dec 8, 2022 at 5:23 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> >>
> >>
> >>
> >> On Tue, 6 Dec 2022, at 05:25, Bartosz Golaszewski wrote:
> >> > On Mon, Dec 5, 2022 at 2:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> >> >>
> >> >> Hello,
> >> >>
> >> >> Based on a recent poke [1] and in-between meetings I've put together a
> >> >> WIP series that converts libgpiod's build from autotools to meson. As
> >> >> far as I'm aware the meson build supports all the significant options to
> >> >> enable or disable features exposed by the autotools build:
> >> >>
> >> >> * Tests
> >> >> * Tools
> >> >>   * Interactive gpioset
> >> >> * Bindings
> >> >>   * C++
> >> >>   * Python
> >> >>   * Rust
> >> >> * Documentation
> >> >>   * Manpages
> >> >>   * Doxygen
> >> >>
> >> >> [1] https://lore.kernel.org/all/CAMRc=Mda8UnyH+_GxeX_4MyKd+DPN0BVH5K+J+VWnMJNC1vwTQ@mail.gmail.com/
> >> >>
> >> >> Meson has pretty good support for handling python and so the patch does
> >> >> away with setup.py entirely.
> >> >
> >> > Eek! No, please do keep setup.py. Autotools too is capable of building
> >> > python C extensions on its own and it's what we use in v1 but I want
> >> > the python code to be built the standard python way. I actually plan
> >> > to post libgpiod v2 on pypi and split out building python bindings
> >> > into a separate bitbake recipe in meta-openembedded using the
> >> > setuptools3 class.
> >> >
> >> > So let's keep setup.py and just call it from meson.
> >>
> >> I've poked at this for a little while and it's not a great experience.
> >> Meson's design pushes back against calling out in this way, and I don't
> >> really have the motivation to carry on fighting it to make it do what
> >> you request. Unless someone else has that motivation, I think there are
> >> two options if meson is still desired:
> >>
> >> 1. Use the meson python support as posted in this series
> >> 2. Split out the python (and probably rust) bindings, keeping the
> >>    dependency relationships pointing in one direction and using the
> >>    language's own package management tooling.
> >>
> >> Given there's nothing to do in the install phase for rust we don't have
> >> as big of an issue there, but it is problematic for python.
> >>
> >> Let me know which way you want to go, including if you want to abandon
> >> meson :)
> >>
> >
> > No, I don't want to abandon it. What is the problem exactly? Is meson
> > unable to simply add external commands to its ninja output?
>
> Not as far as I'm aware. I think it's best covered by this policy
> description:
>
> https://mesonbuild.com/Mixing-build-systems.html
>
> There are some things that might make it sound feasible but aren't
> actually appropriate:
>
> 1. run_command(): https://mesonbuild.com/Reference-manual_functions.html#run_command
> 2. run_target(): https://mesonbuild.com/Reference-manual_functions.html#run_target
> 3. custom_target(): https://mesonbuild.com/Reference-manual_functions.html#custom_target
>
> run_command() isn't appropriate as it executes in the `meson setup`
> phase. run_target() isn't appropriate as it disregards any output
> artifacts and so has no impact in the `meson install` phase.
>
> custom_target() is probably closest to what is required, but there's a
> lot of pain in trying to get the artifacts to line up for correct
> deployment in the `meson install` phase. This is exacerbated by the
> requirement that setup.py be run from its containing directory in the
> source tree. Further, I couldn't get all the options to line up such
> that setuptools would relocate its output into meson's own build tree
> (and out of the source tree). Here's a not entirely working attempt at
> abusing custom_target() to that end:
>
> ```
> diff --git a/bindings/python/meson.build b/bindings/python/meson.build
> index 26f7ff13e0dd..136d10824345 100644
> --- a/bindings/python/meson.build
> +++ b/bindings/python/meson.build
> @@ -3,14 +3,31 @@
>
>  python = import('python')
>  python3 = python.find_installation('python3')
> -python3_dep = python3.dependency()
>
> -subdir('gpiod')
> +python_build_dir = 'python-build'
> +python_install_dir = 'python-install'
> +python_include_dirs = '../../include:../../tests/gpiosim'
> +python_lib_dirs = '@0@/lib:@0@/tests/gpiosim'.format(meson.project_build_root())
> +python_install_cmd = [ python3.full_path(), '@INPUT@', '--no-user-cfg',
> +                      'build_ext', '--include-dirs', python_include_dirs, '--library-dirs', python_lib_dirs,
> +                      'install', '--root', python_build_dir, '--prefix', get_option('prefix')]
>
> -if get_option('examples')
> -    subdir('examples')
> -endif
> +python_env = environment()
> +python_env.set('GPIOD_WITH_TESTS', get_option('tests').to_string())
>
> -if get_option('tests')
> -    subdir('tests')
> -endif
> +python_setuptools = custom_target('python-setuptools',
> +                                 input: 'setup.py',
> +                                 output: python_build_dir,
> +                                 depends: [gpiod, gpiosim],
> +                                 env: python_env,
> +                                 command: python_install_cmd)
> +
> +cp = find_program('cp')
> +
> +custom_target('python-install',
> +             input: 'setup.py',
> +             output: python_install_dir,
> +             depends: python_setuptools,
> +             command: [ cp, '-r', meson.current_source_dir() / python_build_dir, meson.current_build_dir() / python_install_dir ],
> +             install: true,
> +             install_dir: get_option('prefix'))
> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
> index ec8f99d4013d..9eddae7466a1 100644
> --- a/bindings/python/setup.py
> +++ b/bindings/python/setup.py
> @@ -1,9 +1,14 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
>
> -from os import environ
> +import os
> +import sys
> +
> +from os import environ, path
>  from setuptools import setup, Extension, find_packages
>
> +os.chdir(path.dirname(sys.argv[0]) or '.')
> +
>  gpiod_ext = Extension(
>      "gpiod._ext",
>      sources=[
> ```
>
> This commits a bunch of crimes:
>
> 1. Assumes the structure of the meson build directory via the paths in
>    python_lib_dirs
> 2. Adds a chdir() in setup.py to relocate the process out of the meson
>    build directory back into the source tree
> 3. Assumes the chdir() operation in the setup of python_include_dirs
>    rather than relying on meson's built-in dependency tracking as the
>    inc objects are opaque[1]
> 4. Hacks the setuptools output back into the meson build directory using
>    a crufty target invoking `cp` so meson can locate the artifacts in the
>    `meson install` phase
> 5. Still doesn't correctly install the artifacts in the end due to
>    restrictions on path mangling (can't strip off the parent directory)
>    and the fact that we're trying to install an entire tree rather than
>    specific files.
>
> [1] https://mesonbuild.com/Reference-manual_returned_inc.html
>
> It might feel like install_data() or install_subdir() could be used
> here, but from experiment their behaviour also seems unfit to be used
> in this context.
>
> At least, that's what I've experimented with. Maybe others can see the
> way through here, but it really is fighting against the policy linked
> earlier.
>
> Andrew

I see. I understand that meson doesn't like dealing with other build-systems.

The thing I like about the current autotools setup is that with the
following one-liner:

./autogen.sh --prefix=/tmp/gpio/inst --enable-bindings-cxx
--enable-examples --enable-tests --enable-tools
--enable-gpioset-interactive --enable-bindings-python
--enable-bindings-rust && make -j16 && sudo ./tests/gpiod-test && sudo
./bindings/cxx/tests/gpiod-cxx-test && sudo
PYTHONPATH=./bindings/python
LD_LIBRARY_PATH=./lib/.libs/:./tests/gpiosim/.libs/:bindings/python/
python -B -m tests && cd bindings/rust/; sudo
CARGO_TARGET_DIR=/tmp/libgpiod-rust PATH=/home/brgl/.cargo/bin/:$PATH
/home/brgl/.cargo/bin/cargo test; cd ../.. && sudo
./tools/gpio-tools-test

I can configure, build and test the entire code base while also using
the language specific build tools for python and rust.

I will try to play with your patches and maybe figure it out or even a
close approximation of the current functionality but then again: I'm
not well versed with meson yet. Between it and rust and dayjob my cup
runneth over...

Bartosz
