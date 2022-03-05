Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B89134CE330
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Mar 2022 06:51:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbiCEFwq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Mar 2022 00:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiCEFwq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Mar 2022 00:52:46 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB7221D3AC8
        for <linux-gpio@vger.kernel.org>; Fri,  4 Mar 2022 21:51:52 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id ge19-20020a17090b0e1300b001bcca16e2e7so12264724pjb.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Mar 2022 21:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lwFUCmxr45AlP/MMvHupa4L4dH0aMrldTy77PptQnGA=;
        b=E8QAcODhR4R3X+WUJZxA0fBWaSc2AmKM04x1DXPAoi9O4q91V/E9IKKY8o9aFikoRR
         qQY5wUBQm5562TyPm8LhEMptjIrBZBbABwx5Q/mx5lDF9n9+pBu2VdgwTej36btqrVME
         Lxacr4G1mFRkAh+2gytxLfNMkCtivh+VIblXwporFcYUR+WqzPt4mr6stKtGYT58VaJM
         kBTe/dTdvhZio8kYFomfMCOMDY+I0BZM4gRLDvLR/27cqJX2aTpZYH36d+y1/CRS+hYJ
         C1rxYFt1aNmlqUE2bGdIb221rZMns2I2D5+aN/BhNrvjB/6zMA3XQqaSGP3nineVRUJ1
         Cw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lwFUCmxr45AlP/MMvHupa4L4dH0aMrldTy77PptQnGA=;
        b=xepe7/nz+VIAz+SImd2VMHp4GE0tJs4+IaY2Y7eNKCMDVOzKJFna47ivflr3blCA/5
         23HL5IyZ8ehSbG0UI/yEsHU0ZxwTHxhivrHZu1qGTz2gdJ4+IiDwEi53XQhKVNvBFEJ4
         YBX8hAn6fQF5jht7z4oVPnvPRshZNZe/7wq5TGt9fxI8WcjsgO/QtZRfFcTMvNsAC0JN
         BNUmf/3n4/PxesG6+61y3LbQyshQOvU1SZUiXGGqOfjpkybCynK8S7/xKBVdW8xIDJBO
         w4T0rE4S3deiwrcwHxFDsfAwZOHyYV5CsHz6YDUnlhlfbtgJgEhQktIqDhYZt+aICSS1
         aBug==
X-Gm-Message-State: AOAM532HfEmIKd5nbsx5VgK7s3VfevfxPAMM/y/0QPT5mIgnzY5BsdoT
        Lh3EvJcmX6v5zqzUqbqmVsRhI5XOXWxFtw==
X-Google-Smtp-Source: ABdhPJzO74XzzHBOwcEIAoGickwrmcbdwp2PkxiHte2vW1Ni+zLRL1pRiWLeBxls5PF0xSKZdGWokg==
X-Received: by 2002:a17:90a:528b:b0:1bc:c5f9:82a with SMTP id w11-20020a17090a528b00b001bcc5f9082amr14361527pjh.210.1646459512261;
        Fri, 04 Mar 2022 21:51:52 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id n22-20020a056a0007d600b004f3ba7c23e2sm7813789pfu.37.2022.03.04.21.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 21:51:51 -0800 (PST)
Date:   Sat, 5 Mar 2022 13:51:47 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 3/3] tests: rewrite core C tests using
 libgpiosim
Message-ID: <20220305055147.GC9638@sol>
References: <20220303091836.168223-1-brgl@bgdev.pl>
 <20220303091836.168223-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303091836.168223-4-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 03, 2022 at 10:18:36AM +0100, Bartosz Golaszewski wrote:
> This replaces the old tests for the C API v1 based on gpio-mockup with
> a test suite based on gpio-sim that covers around 95% of the libgpiod v2
> codebase.
> 
> The test harness has been rebuilt and shrank significantly as well. The
> libgpiosim API has been wrapped in a gobject interface.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  configure.ac                 |    8 +-
>  tests/Makefile.am            |   24 +-
>  tests/gpiod-test-helpers.c   |   49 ++
>  tests/gpiod-test-helpers.h   |  139 +++++
>  tests/gpiod-test-sim.c       |  308 ++++++++++
>  tests/gpiod-test-sim.h       |   42 ++
>  tests/gpiod-test.c           |  233 +-------
>  tests/gpiod-test.h           |   83 +--
>  tests/gpiosim/gpiosim.c      |    1 +
>  tests/mockup/Makefile.am     |   11 -
>  tests/mockup/gpio-mockup.c   |  496 ----------------
>  tests/mockup/gpio-mockup.h   |   36 --
>  tests/tests-chip.c           |  282 ++++-----
>  tests/tests-edge-event.c     |  490 +++++++++++++++
>  tests/tests-event.c          |  908 ----------------------------
>  tests/tests-info-event.c     |  301 ++++++++++
>  tests/tests-line-config.c    |  503 ++++++++++++++++
>  tests/tests-line-info.c      |  318 ++++++++++
>  tests/tests-line-request.c   |  526 ++++++++++++++++
>  tests/tests-line.c           | 1091 ----------------------------------
>  tests/tests-misc.c           |   80 ++-
>  tests/tests-request-config.c |   90 +++
>  22 files changed, 2995 insertions(+), 3024 deletions(-)
>  create mode 100644 tests/gpiod-test-helpers.c
>  create mode 100644 tests/gpiod-test-helpers.h
>  create mode 100644 tests/gpiod-test-sim.c
>  create mode 100644 tests/gpiod-test-sim.h
>  delete mode 100644 tests/mockup/Makefile.am
>  delete mode 100644 tests/mockup/gpio-mockup.c
>  delete mode 100644 tests/mockup/gpio-mockup.h
>  create mode 100644 tests/tests-edge-event.c
>  delete mode 100644 tests/tests-event.c
>  create mode 100644 tests/tests-info-event.c
>  create mode 100644 tests/tests-line-config.c
>  create mode 100644 tests/tests-line-info.c
>  create mode 100644 tests/tests-line-request.c
>  delete mode 100644 tests/tests-line.c
>  create mode 100644 tests/tests-request-config.c
> 
> diff --git a/configure.ac b/configure.ac
> index cb4c1fd..f8d34ed 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -28,9 +28,8 @@ AC_SUBST(VERSION_STR, [$PACKAGE_VERSION$EXTRA_VERSION])
>  AC_SUBST(ABI_VERSION, [4.1.2])
>  # Have a separate ABI version for C++ bindings:
>  AC_SUBST(ABI_CXX_VERSION, [2.1.1])
> -# ABI version for libgpiomockup (we need this since it can be installed if we
> +# ABI version for libgpiosim (we need this since it can be installed if we
>  # enable install-tests).
> -AC_SUBST(ABI_MOCKUP_VERSION, [0.1.0])
>  AC_SUBST(ABI_GPIOSIM_VERSION, [0.1.0])
>  
>  AC_CONFIG_AUX_DIR([autostuff])
> @@ -138,14 +137,14 @@ AC_DEFUN([FUNC_NOT_FOUND_TESTS],
>  
>  if test "x$with_tests" = xtrue
>  then
> -	# For libgpiomockup & libgpiosim
> +	# For libgpiosim
>  	AC_CHECK_FUNC([qsort], [], [FUNC_NOT_FOUND_TESTS([qsort])])
>  	PKG_CHECK_MODULES([KMOD], [libkmod >= 18])
> -	PKG_CHECK_MODULES([UDEV], [libudev >= 215])
>  	PKG_CHECK_MODULES([MOUNT], [mount >= 2.33.1])
>  
>  	# For core library tests
>  	PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.50])
> +	PKG_CHECK_MODULES([GOBJECT], [gobject-2.0 >= 2.50])
>  
>  	if test "x$with_tools" = xtrue
>  	then
> @@ -236,7 +235,6 @@ AC_CONFIG_FILES([Makefile
>  		 lib/libgpiod.pc
>  		 tools/Makefile
>  		 tests/Makefile
> -		 tests/mockup/Makefile
>  		 tests/gpiosim/Makefile
>  		 bindings/cxx/libgpiodcxx.pc
>  		 bindings/Makefile
> diff --git a/tests/Makefile.am b/tests/Makefile.am
> index 2b1e082..dce9a5a 100644
> --- a/tests/Makefile.am
> +++ b/tests/Makefile.am
> @@ -1,24 +1,32 @@
>  # SPDX-License-Identifier: GPL-2.0-or-later
>  # SPDX-FileCopyrightText: 2017-2022 Bartosz Golaszewski <brgl@bgdev.pl>
>  
> -SUBDIRS = mockup gpiosim
> -
> +SUBDIRS = gpiosim
> + 

Whitespace error.

Other than that all good.

Good to see the randomness removed from the gpio-sim naming.
I would like to see the option removed from libgpiosim as well, but that
is outside the scope of this patch series.

Cheers,
Kent.
