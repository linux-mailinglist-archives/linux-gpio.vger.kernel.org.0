Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEC1064783C
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Dec 2022 22:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbiLHVv5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Dec 2022 16:51:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiLHVv5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Dec 2022 16:51:57 -0500
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1290982F8C
        for <linux-gpio@vger.kernel.org>; Thu,  8 Dec 2022 13:51:55 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id E87845C00C3;
        Thu,  8 Dec 2022 16:51:51 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Thu, 08 Dec 2022 16:51:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1670536311; x=1670622711; bh=zFT8umyj3+
        +ylhpmWt+ry+bwvBN+c0NK96M9SqzQwcw=; b=DZJqvQjInScJ6rjOk8ldrOLZd7
        oUhFautvcdPkkeZSk3YQ2Q7hgfPoxXMvgM1vI1Cs3uAyl+A1NhETsJpPUzLaaLLL
        EseYXazac3NJ/Y50fadCn3zBN9Vek5QFaReKOJPIvADuCIMOMqRjBOAkJG5PWNfA
        h+w7CtrsOJWM7sMvfpMBbsbO5Svf4A4ngTgN25ToIJTUiT6l3MxJLoyTmMhvoMqg
        C0kR+7NI+Nq2AAosqf/xVde5YUns6nFERH2y2RV2b/jZO3ydlM2MLabbceIl23zd
        alsJhss5XcdlZ4XK+yHNCkdzlNO2PQ+FtwPz33brstlLmhnSzBlefdzm7a9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1670536311; x=1670622711; bh=zFT8umyj3++ylhpmWt+ry+bwvBN+
        c0NK96M9SqzQwcw=; b=VKngvvdgf5NpCN9sx3r6XHPBJzZcz0orTBL3e9ebc0Bx
        obRI+137FpXA35Ncl7bkbi7zhLvvldovfTYqDQ8TRxb+gibhC/LgmQLf3QQwgeEY
        ilsFu5dF0iUltlbE1wXPiuY/9AHPPoPLf2iZZeNZycJ94KAFEkzLNny5/h0SmBzE
        bUe4FUQzp7awAOe+My1Duhl60Y8z5HPA0jbJ4dR6dDigeGoMMshTGaE/TmTeVEba
        XByyqpUwEdxb3BlHIxgasW7XxkBo/AndHmRdtK59lLclQlEreAo79UQS8qzZVxp4
        bXavO5K7qfwj9qOOM5Tf2CsWgUgnj03czPLX0Pqbgg==
X-ME-Sender: <xms:d1ySY9eKNYG0tCWmHGx0EZRj4cFJzjkUiX-gylbL1ec4IbqjVok81A>
    <xme:d1ySY7Njs9YrRsV3AakFi0ZRtX7-Utz219KbR3XCt6jGaWmYg-GL00KISBJPMWJw4
    Nsb9bw8XHz1KntJjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtgdduheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpefhheeuffehudefveduueelueeufeeikeffvdekgeeuudffgeehvddv
    tdejuddtheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhmvghsohhnsghuihhlug
    drtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:d1ySY2idWLAn3cbk5GpM0gO8ij8t8nIxDuBGc1DNWRjhU9YyIEOyYQ>
    <xmx:d1ySY2_h6UMGSEMq8kI9JOHn-PW-WIo1g7-spsqggtpw4saCeGhcxw>
    <xmx:d1ySY5t6tls_l-Yf2nt7i3iynbhoVhHPNNAqzqs8bjbonWHvPywUrA>
    <xmx:d1ySYxIR5MYFNxB7K2DthyLkbsCI_gcGJyaD3ReJdBSRpCT-F2pS0Q>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 1B0C61700089; Thu,  8 Dec 2022 16:51:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <38927236-d8b5-42fb-b867-5d761dc8afb6@app.fastmail.com>
In-Reply-To: <CAMRc=MfzNG-WzEox6Rb7QpFVP4mF_pkw2earWbjuKjCHu9eBuQ@mail.gmail.com>
References: <20221205132207.94775-1-andrew@aj.id.au>
 <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
 <01a47fff-c21d-4309-a7a2-fa7a87f4e024@app.fastmail.com>
 <CAMRc=MchiuLWy1yrO-HNVtUFyJjFK2Jdp_aBjomL9n5JAgv_Vw@mail.gmail.com>
 <387f1d7d-8122-4533-8385-3e37dbd7ca7d@app.fastmail.com>
 <CAMRc=MfzNG-WzEox6Rb7QpFVP4mF_pkw2earWbjuKjCHu9eBuQ@mail.gmail.com>
Date:   Fri, 09 Dec 2022 08:21:00 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc:     "Viresh Kumar" <viresh.kumar@linaro.org>,
        "Kent Gibson" <warthog618@gmail.com>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][WIP PATCH 0/2] Convert the build from autotools to meson
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Fri, 9 Dec 2022, at 05:18, Bartosz Golaszewski wrote:
> On Thu, Dec 8, 2022 at 12:11 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>>
>>
>> On Thu, 8 Dec 2022, at 19:57, Bartosz Golaszewski wrote:
>> > On Thu, Dec 8, 2022 at 5:23 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>> >>
>> >>
>> >>
>> >> On Tue, 6 Dec 2022, at 05:25, Bartosz Golaszewski wrote:
>> >> > On Mon, Dec 5, 2022 at 2:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>> >> >>
>> >> >> Hello,
>> >> >>
>> >> >> Based on a recent poke [1] and in-between meetings I've put together a
>> >> >> WIP series that converts libgpiod's build from autotools to meson. As
>> >> >> far as I'm aware the meson build supports all the significant options to
>> >> >> enable or disable features exposed by the autotools build:
>> >> >>
>> >> >> * Tests
>> >> >> * Tools
>> >> >>   * Interactive gpioset
>> >> >> * Bindings
>> >> >>   * C++
>> >> >>   * Python
>> >> >>   * Rust
>> >> >> * Documentation
>> >> >>   * Manpages
>> >> >>   * Doxygen
>> >> >>
>> >> >> [1] https://lore.kernel.org/all/CAMRc=Mda8UnyH+_GxeX_4MyKd+DPN0BVH5K+J+VWnMJNC1vwTQ@mail.gmail.com/
>> >> >>
>> >> >> Meson has pretty good support for handling python and so the patch does
>> >> >> away with setup.py entirely.
>> >> >
>> >> > Eek! No, please do keep setup.py. Autotools too is capable of building
>> >> > python C extensions on its own and it's what we use in v1 but I want
>> >> > the python code to be built the standard python way. I actually plan
>> >> > to post libgpiod v2 on pypi and split out building python bindings
>> >> > into a separate bitbake recipe in meta-openembedded using the
>> >> > setuptools3 class.
>> >> >
>> >> > So let's keep setup.py and just call it from meson.
>> >>
>> >> I've poked at this for a little while and it's not a great experience.
>> >> Meson's design pushes back against calling out in this way, and I don't
>> >> really have the motivation to carry on fighting it to make it do what
>> >> you request. Unless someone else has that motivation, I think there are
>> >> two options if meson is still desired:
>> >>
>> >> 1. Use the meson python support as posted in this series
>> >> 2. Split out the python (and probably rust) bindings, keeping the
>> >>    dependency relationships pointing in one direction and using the
>> >>    language's own package management tooling.
>> >>
>> >> Given there's nothing to do in the install phase for rust we don't have
>> >> as big of an issue there, but it is problematic for python.
>> >>
>> >> Let me know which way you want to go, including if you want to abandon
>> >> meson :)
>> >>
>> >
>> > No, I don't want to abandon it. What is the problem exactly? Is meson
>> > unable to simply add external commands to its ninja output?
>>
>> Not as far as I'm aware. I think it's best covered by this policy
>> description:
>>
>> https://mesonbuild.com/Mixing-build-systems.html
>>
>> There are some things that might make it sound feasible but aren't
>> actually appropriate:
>>
>> 1. run_command(): https://mesonbuild.com/Reference-manual_functions.html#run_command
>> 2. run_target(): https://mesonbuild.com/Reference-manual_functions.html#run_target
>> 3. custom_target(): https://mesonbuild.com/Reference-manual_functions.html#custom_target
>>
>> run_command() isn't appropriate as it executes in the `meson setup`
>> phase. run_target() isn't appropriate as it disregards any output
>> artifacts and so has no impact in the `meson install` phase.
>>
>> custom_target() is probably closest to what is required, but there's a
>> lot of pain in trying to get the artifacts to line up for correct
>> deployment in the `meson install` phase. This is exacerbated by the
>> requirement that setup.py be run from its containing directory in the
>> source tree. Further, I couldn't get all the options to line up such
>> that setuptools would relocate its output into meson's own build tree
>> (and out of the source tree). Here's a not entirely working attempt at
>> abusing custom_target() to that end:
>>
>> ```
>> diff --git a/bindings/python/meson.build b/bindings/python/meson.build
>> index 26f7ff13e0dd..136d10824345 100644
>> --- a/bindings/python/meson.build
>> +++ b/bindings/python/meson.build
>> @@ -3,14 +3,31 @@
>>
>>  python = import('python')
>>  python3 = python.find_installation('python3')
>> -python3_dep = python3.dependency()
>>
>> -subdir('gpiod')
>> +python_build_dir = 'python-build'
>> +python_install_dir = 'python-install'
>> +python_include_dirs = '../../include:../../tests/gpiosim'
>> +python_lib_dirs = '@0@/lib:@0@/tests/gpiosim'.format(meson.project_build_root())
>> +python_install_cmd = [ python3.full_path(), '@INPUT@', '--no-user-cfg',
>> +                      'build_ext', '--include-dirs', python_include_dirs, '--library-dirs', python_lib_dirs,
>> +                      'install', '--root', python_build_dir, '--prefix', get_option('prefix')]
>>
>> -if get_option('examples')
>> -    subdir('examples')
>> -endif
>> +python_env = environment()
>> +python_env.set('GPIOD_WITH_TESTS', get_option('tests').to_string())
>>
>> -if get_option('tests')
>> -    subdir('tests')
>> -endif
>> +python_setuptools = custom_target('python-setuptools',
>> +                                 input: 'setup.py',
>> +                                 output: python_build_dir,
>> +                                 depends: [gpiod, gpiosim],
>> +                                 env: python_env,
>> +                                 command: python_install_cmd)
>> +
>> +cp = find_program('cp')
>> +
>> +custom_target('python-install',
>> +             input: 'setup.py',
>> +             output: python_install_dir,
>> +             depends: python_setuptools,
>> +             command: [ cp, '-r', meson.current_source_dir() / python_build_dir, meson.current_build_dir() / python_install_dir ],
>> +             install: true,
>> +             install_dir: get_option('prefix'))
>> diff --git a/bindings/python/setup.py b/bindings/python/setup.py
>> index ec8f99d4013d..9eddae7466a1 100644
>> --- a/bindings/python/setup.py
>> +++ b/bindings/python/setup.py
>> @@ -1,9 +1,14 @@
>>  # SPDX-License-Identifier: GPL-2.0-or-later
>>  # SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl>
>>
>> -from os import environ
>> +import os
>> +import sys
>> +
>> +from os import environ, path
>>  from setuptools import setup, Extension, find_packages
>>
>> +os.chdir(path.dirname(sys.argv[0]) or '.')
>> +
>>  gpiod_ext = Extension(
>>      "gpiod._ext",
>>      sources=[
>> ```
>>
>> This commits a bunch of crimes:
>>
>> 1. Assumes the structure of the meson build directory via the paths in
>>    python_lib_dirs
>> 2. Adds a chdir() in setup.py to relocate the process out of the meson
>>    build directory back into the source tree
>> 3. Assumes the chdir() operation in the setup of python_include_dirs
>>    rather than relying on meson's built-in dependency tracking as the
>>    inc objects are opaque[1]
>> 4. Hacks the setuptools output back into the meson build directory using
>>    a crufty target invoking `cp` so meson can locate the artifacts in the
>>    `meson install` phase
>> 5. Still doesn't correctly install the artifacts in the end due to
>>    restrictions on path mangling (can't strip off the parent directory)
>>    and the fact that we're trying to install an entire tree rather than
>>    specific files.
>>
>> [1] https://mesonbuild.com/Reference-manual_returned_inc.html
>>
>> It might feel like install_data() or install_subdir() could be used
>> here, but from experiment their behaviour also seems unfit to be used
>> in this context.
>>
>> At least, that's what I've experimented with. Maybe others can see the
>> way through here, but it really is fighting against the policy linked
>> earlier.
>>
>> Andrew
>
> I see. I understand that meson doesn't like dealing with other build-systems.
>
> The thing I like about the current autotools setup is that with the
> following one-liner:
>
> ./autogen.sh --prefix=/tmp/gpio/inst --enable-bindings-cxx
> --enable-examples --enable-tests --enable-tools
> --enable-gpioset-interactive --enable-bindings-python
> --enable-bindings-rust && make -j16 && sudo ./tests/gpiod-test && sudo
> ./bindings/cxx/tests/gpiod-cxx-test && sudo
> PYTHONPATH=./bindings/python
> LD_LIBRARY_PATH=./lib/.libs/:./tests/gpiosim/.libs/:bindings/python/
> python -B -m tests && cd bindings/rust/; sudo
> CARGO_TARGET_DIR=/tmp/libgpiod-rust PATH=/home/brgl/.cargo/bin/:$PATH
> /home/brgl/.cargo/bin/cargo test; cd ../.. && sudo
> ./tools/gpio-tools-test
>
> I can configure, build and test the entire code base while also using
> the language specific build tools for python and rust.

Right; I agree it's desirable to retain that capability.

>
> I will try to play with your patches and maybe figure it out or even a
> close approximation of the current functionality but then again: I'm
> not well versed with meson yet. Between it and rust and dayjob my cup
> runneth over...

I recognise that feeling :)

Happy to bounce ideas around if you experiment with it.

Andrew
