Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35E47581DD6
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 04:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240193AbiG0C7R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 22:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240168AbiG0C7Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 22:59:16 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FE8371B3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 19:59:10 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id 70so14967252pfx.1
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 19:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OZi4c9wI8Wx3WKRLxE5DGAiHRs1pJAWSNEd2Tgsa7U8=;
        b=cc4GO2giuJfzbv6nuIGVTs/5rOaRGNYTWvjV8rb8p1ehGhnHdFnCvFglGVjqopT5H2
         jY+19UWyoABy2Mm54JTOKsUmLtcqKFceBptF784jgN78ROxHlIwmBJXFPx7SPpeEKkJE
         ucXJQQSK6xtHtXcdZWIM9iJujkOm1KsNZ78PZYAr+ncEmV/xWtM1WaSApPPF946bHJ96
         88ne/4w0RMbUwfDr03VfW7KEIX1EJxgVy8DzRFfsVYioXoOWvLHKlIw6XQ2m/AWi/m7N
         cNFdChAG2OvBEqwI5oneFMDYOH9DtqvbtBRQVlVT73mwoewi6Zju1QMip/MzmoHpcRSj
         GzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OZi4c9wI8Wx3WKRLxE5DGAiHRs1pJAWSNEd2Tgsa7U8=;
        b=smnJE/gWig8cbxLb0hjMldCmfQEoBJGWDUNNkWsG53+F/0rHgCLZ1ZudJ9SXofhIsP
         B2yAFK+zkUzjiCuxlFq5+qRWhrIIFZfzsZvWDBJ2/7FUC2B4FGyKjaNfpLV9Sl0yCPB0
         o3ZCIc7AV3mgZ1gFtgUfMC/Uv0bSJ5AXqCgBilxUn27QrHfdwbgXzVdCDsWDmF9c+pn8
         H8NHA0YpfUkk2cBgXZST1UL/ZxPSNLkwRmOMpXkB0jQr76PsbIZjm3fRJNzYjBmdc0U2
         ckDsYkpy6iD4if38XxFUDVlCbiWShGjy1h6ij04kURTSGYHeqC/HljSxqQkubO5U6N0x
         Y5Ww==
X-Gm-Message-State: AJIora8IGcC5PxK6T+/3jkP5mL+Ma0SIewhiWq2tuA0/nuLyTBD1lfPC
        FHAsFQPgcaETMjgo+c0cZ2A=
X-Google-Smtp-Source: AGRyM1v9zQRiHBvceHCwWIuay3gjqtCcNwxAL4LLhqhj6tqkwLcvm/WfjBR1FmKqskPpcLkvMXYung==
X-Received: by 2002:a62:1a08:0:b0:52c:147:c517 with SMTP id a8-20020a621a08000000b0052c0147c517mr8964651pfa.85.1658890750031;
        Tue, 26 Jul 2022 19:59:10 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902e75000b0016b81679c1fsm12510149plf.216.2022.07.26.19.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 19:59:09 -0700 (PDT)
Date:   Wed, 27 Jul 2022 10:59:03 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 8/8] libgpiod: Integrate building of rust bindings
 with make
Message-ID: <20220727025903.GH88787@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <584910baf342bee3511361c3e486ad4f3e5437f2.1657279685.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <584910baf342bee3511361c3e486ad4f3e5437f2.1657279685.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 08, 2022 at 05:05:01PM +0530, Viresh Kumar wrote:
> Lets make build rust bindings as well.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  README                    |  8 +++++---
>  TODO                      |  8 --------
>  bindings/Makefile.am      |  6 ++++++
>  bindings/rust/Makefile.am | 18 ++++++++++++++++++
>  configure.ac              | 16 ++++++++++++++++
>  5 files changed, 45 insertions(+), 11 deletions(-)
>  create mode 100644 bindings/rust/Makefile.am
> 
> diff --git a/README b/README
> index 814a0f161fd2..68b5d69f9b66 100644
> --- a/README
> +++ b/README
> @@ -119,9 +119,9 @@ TOOLS
>  BINDINGS
>  --------
>  
> -High-level, object-oriented bindings for C++ and python3 are provided. They
> -can be enabled by passing --enable-bindings-cxx and --enable-bindings-python
> -arguments respectively to configure.
> +High-level, object-oriented bindings for C++, python3 and Rust are provided.
> +They can be enabled by passing --enable-bindings-cxx, --enable-bindings-python
> +and --enable-bindings-rust arguments respectively to configure.
>  
>  C++ bindings require C++11 support and autoconf-archive collection if building
>  from git.
> @@ -132,6 +132,8 @@ the PYTHON_CPPFLAGS and PYTHON_LIBS variables in order to point the build
>  system to the correct locations. During native builds, the configure script
>  can auto-detect the location of the development files.
>  
> +Rust bindings require cargo support.
> +
>  TESTING
>  -------
>  
> diff --git a/TODO b/TODO
> index 8bb4d8f3ad56..cf4fd7b4a962 100644
> --- a/TODO
> +++ b/TODO
> @@ -28,14 +28,6 @@ and is partially functional.
>  
>  ----------
>  
> -* implement rust bindings
> -
> -With Rust gaining popularity as a low-level system's language and the
> -possibility of it making its way into the linux kernel, it's probably time to
> -provide Rust bindings to libgpiod as part of the project.
> -
> -----------
> -
>  * implement a simple daemon for controlling GPIOs in C together with a client
>    program
>  
> diff --git a/bindings/Makefile.am b/bindings/Makefile.am
> index 8f8c762f254f..004ae23dbc58 100644
> --- a/bindings/Makefile.am
> +++ b/bindings/Makefile.am
> @@ -14,3 +14,9 @@ if WITH_BINDINGS_PYTHON
>  SUBDIRS += python
>  
>  endif
> +
> +if WITH_BINDINGS_RUST
> +
> +SUBDIRS += rust
> +
> +endif
> diff --git a/bindings/rust/Makefile.am b/bindings/rust/Makefile.am
> new file mode 100644
> index 000000000000..79a52bc691ae
> --- /dev/null
> +++ b/bindings/rust/Makefile.am
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
> +
> +command = cargo build --release --lib
> +
> +if WITH_TESTS
> +command += --tests
> +endif
> +
> +if WITH_EXAMPLES
> +command += --examples
> +endif
> +
> +all:
> +	$(command)
> +
> +clean:
> +	cargo clean
> diff --git a/configure.ac b/configure.ac
> index ab03673589e9..8458f734a606 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -211,6 +211,21 @@ then
>  		[AC_SUBST(PYTHON_LIBS, [`$PYTHON-config --libs`])])
>  fi
>  
> +AC_ARG_ENABLE([bindings-rust],
> +	[AS_HELP_STRING([--enable-bindings-rust],[enable rust bindings [default=no]])],
> +	[if test "x$enableval" = xyes; then with_bindings_rust=true; fi],
> +	[with_bindings_rust=false])
> +AM_CONDITIONAL([WITH_BINDINGS_RUST], [test "x$with_bindings_rust" = xtrue])
> +
> +if test "x$with_bindings_rust" = xtrue
> +then
> +	AC_CHECK_PROG([has_cargo], [cargo], [true], [false])
> +	if test "x$has_cargo" = xfalse
> +	then
> +		AC_MSG_ERROR([cargo not found - needed for rust bindings])
> +	fi
> +fi
> +
>  AC_CHECK_PROG([has_doxygen], [doxygen], [true], [false])
>  AM_CONDITIONAL([HAS_DOXYGEN], [test "x$has_doxygen" = xtrue])
>  if test "x$has_doxygen" = xfalse
> @@ -245,6 +260,7 @@ AC_CONFIG_FILES([Makefile
>  		 bindings/python/Makefile
>  		 bindings/python/examples/Makefile
>  		 bindings/python/tests/Makefile
> +		 bindings/rust/Makefile
>  		 man/Makefile])
>  
>  AC_OUTPUT
> -- 
> 2.31.1.272.g89b43f80a514
> 

Wouldn't build for me on a Debian bullseye VM.
Apparently bindgen requires clang to find the system headers [1][2], and
there is no dep check or warning about that.

Also not sure why the build wanted bindgen, as by default it uses the
pre-generated bindings?

Anyway, for reference this was the build error without clang installed:

...
   Compiling thiserror v1.0.31
   Compiling libgpiod-sys v0.1.0 (/home/dev/libgpiod/bindings/rust/libgpiod-sys)
error: failed to run custom build command for `libgpiod-sys v0.1.0 (/home/dev/libgpiod/bindings/rust/libgpiod-sys)`

Caused by:
  process didn't exit successfully: `/home/dev/libgpiod/bindings/rust/target/release/build/libgpiod-sys-0fb8ce8170c88d8f/build-script-build` (exit status: 101)
  --- stdout
  cargo:rerun-if-changed=wrapper.h
  cargo:rerun-if-changed=../../../lib/chip.c
  cargo:rerun-if-changed=../../../lib/chip-info.c
  cargo:rerun-if-changed=../../../lib/edge-event.c
  cargo:rerun-if-changed=../../../lib/info-event.c
  cargo:rerun-if-changed=../../../lib/internal.c
  cargo:rerun-if-changed=../../../lib/line-config.c
  cargo:rerun-if-changed=../../../lib/line-info.c
  cargo:rerun-if-changed=../../../lib/line-request.c
  cargo:rerun-if-changed=../../../lib/misc.c
  cargo:rerun-if-changed=../../../lib/request-config.c
  cargo:rerun-if-changed=../../../tests/gpiosim/gpiosim.c
  cargo:rerun-if-changed=gpiosim_wrapper.h
  cargo:rustc-link-lib=kmod
  cargo:rustc-link-lib=mount

  --- stderr
  /usr/include/string.h:33:10: fatal error: 'stddef.h' file not found
  /usr/include/string.h:33:10: fatal error: 'stddef.h' file not found, err: true
  thread 'main' panicked at 'Unable to generate bindings: ()', libgpiod-sys/build.rs:42:10

Cheers,
Kent.

[1] https://rust-lang.github.io/rust-bindgen/requirements.html
[2] https://github.com/rust-lang/rust-bindgen/issues/242
