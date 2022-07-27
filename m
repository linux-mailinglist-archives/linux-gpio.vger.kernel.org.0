Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9BF0581FFD
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 08:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbiG0GS3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 02:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiG0GS3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 02:18:29 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE41402D0
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 23:18:28 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id t2-20020a17090a4e4200b001f21572f3a4so1206657pjl.0
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 23:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z1ju9hkv6KliBdMMf78zfJE2ka4ceX95a34zeGO4f3U=;
        b=ooVQj6Oqy+gBO064fl+LSN0pb5mQ8WM9xs/vMKfOVMvHIFxCEzhRW/s0XKhqgqjoQ3
         GzMZ7xQbsvtmH1kotlxIaYMBDO8hqtLkW7B7sSSK9plcV3l2anbodheOrfonVQdHpngy
         01Yt5cH2Qe9Snf9FO+OxB1K1JAp+A1wqWQoxFVnpW7CPB1rJEoFGEt719QEN1hQ7HPYh
         A2RFN/YAJ6IrJ4vjH4fHaO4xsZg/M9dURqdncdOFbpZVouHi2qkrGYe8uFdiomjS7gcQ
         H70CXUNIAIcrMGJcIqp0W+4lTmXteEIK5q/oKQSszkRf5G4bPKgUImaDVJerIZTMbFjh
         zNxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z1ju9hkv6KliBdMMf78zfJE2ka4ceX95a34zeGO4f3U=;
        b=Y/bF99JDI4ZAhv9EVMbSA9+ttD+BWspR/L9+ZQHgTFIWRYVvbA5xcSCLE8oo4yZp5J
         XMfrRKVPUoxlX//y9ix61St+DCHuAZ4+OuUmwU/AwLORImVlOf4p9g2ZGe55Lj75ql9I
         rKzy0aRE9Erx3b6rWiBirTVPbj0qmVQn6qqK1MfMxa7IMrQLkxJOxAcl2wj7aHGeINBQ
         2H6vcUbOwx14BTX2KMlOuHmhjfsyPEVvDKfyCQc4Ax2MF2Na5n6WyRk66XdJgsu5Qsw2
         btMRZOhZfHuaX7A58zV9ZRIVhf3z4Ace9TDXplAWXeU/ATO7ST5BGO8ZG+xN6Iu8GlIR
         xPaA==
X-Gm-Message-State: AJIora8CON1nwEE30TKPYp57B6PSiLucLndZIp9mEgCx2kIas8hqH3SD
        Fatux5M7IaDC3/nu0/XX4BuViA==
X-Google-Smtp-Source: AGRyM1s3OhBxgoiYKLQMjnVFMoJ+l/IQmrbEIpoyrO4H+S6DurOK8yck35a9D0JfFQrP5f3m6+Ov/Q==
X-Received: by 2002:a17:90b:b03:b0:1f3:6fb:bd20 with SMTP id bf3-20020a17090b0b0300b001f306fbbd20mr2496197pjb.38.1658902707982;
        Tue, 26 Jul 2022 23:18:27 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id s188-20020a625ec5000000b0050dc7628148sm12736177pfb.34.2022.07.26.23.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 23:18:27 -0700 (PDT)
Date:   Wed, 27 Jul 2022 11:48:24 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 8/8] libgpiod: Integrate building of rust bindings
 with make
Message-ID: <20220727061824.lune6xhtv2hpgidv@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <584910baf342bee3511361c3e486ad4f3e5437f2.1657279685.git.viresh.kumar@linaro.org>
 <20220727025903.GH88787@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727025903.GH88787@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 10:59, Kent Gibson wrote:
> Wouldn't build for me on a Debian bullseye VM.
> Apparently bindgen requires clang to find the system headers [1][2],

Right.

> and
> there is no dep check or warning about that.

Ahh, I need to add that somewhere then.

> Also not sure why the build wanted bindgen, as by default it uses the
> pre-generated bindings?

Did you enable tests as well ? That enables "gpiosim", which enables "generate"
and bindgen will be required.

I thought it will be better to build bindings everytime for tests.

> Anyway, for reference this was the build error without clang installed:

Did it work for you after clang was installed ?

> 
> ...
>    Compiling thiserror v1.0.31
>    Compiling libgpiod-sys v0.1.0 (/home/dev/libgpiod/bindings/rust/libgpiod-sys)
> error: failed to run custom build command for `libgpiod-sys v0.1.0 (/home/dev/libgpiod/bindings/rust/libgpiod-sys)`
> 
> Caused by:
>   process didn't exit successfully: `/home/dev/libgpiod/bindings/rust/target/release/build/libgpiod-sys-0fb8ce8170c88d8f/build-script-build` (exit status: 101)
>   --- stdout
>   cargo:rerun-if-changed=wrapper.h
>   cargo:rerun-if-changed=../../../lib/chip.c
>   cargo:rerun-if-changed=../../../lib/chip-info.c
>   cargo:rerun-if-changed=../../../lib/edge-event.c
>   cargo:rerun-if-changed=../../../lib/info-event.c
>   cargo:rerun-if-changed=../../../lib/internal.c
>   cargo:rerun-if-changed=../../../lib/line-config.c
>   cargo:rerun-if-changed=../../../lib/line-info.c
>   cargo:rerun-if-changed=../../../lib/line-request.c
>   cargo:rerun-if-changed=../../../lib/misc.c
>   cargo:rerun-if-changed=../../../lib/request-config.c
>   cargo:rerun-if-changed=../../../tests/gpiosim/gpiosim.c
>   cargo:rerun-if-changed=gpiosim_wrapper.h
>   cargo:rustc-link-lib=kmod
>   cargo:rustc-link-lib=mount
> 
>   --- stderr
>   /usr/include/string.h:33:10: fatal error: 'stddef.h' file not found
>   /usr/include/string.h:33:10: fatal error: 'stddef.h' file not found, err: true
>   thread 'main' panicked at 'Unable to generate bindings: ()', libgpiod-sys/build.rs:42:10

-- 
viresh
