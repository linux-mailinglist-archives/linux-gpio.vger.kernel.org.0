Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEF4581DC6
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 04:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbiG0C5Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 22:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240080AbiG0C5Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 22:57:16 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC63737197
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 19:57:13 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id t2so1010192ply.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 19:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iQPANlB5mIoowXu8LNtNpsFgPuknJTLP6MpR6ikyKgY=;
        b=HIlOWQU9z0r0CIsz2foU51yd/gE3ThgAZV+9pSdtlgQUpEztMbVUANxvoTh1iVBR45
         0FY8jmgBJqq/bW5qxc1ef8prXfNoVRuJOeeTIWw/mv9DJPKIaQH+iaDCLegnge1aw4Ds
         zuAQrXP1SFR/Mn76F535MqzE5ou/vJ926+3azbtphOBLYhvyx/IPhCRKxR1WrjmepBGW
         bSENykLJ0Ow8AKFTBUpls+fXFOPtkRjz8vphIGHoO2xgqDf50s7i1F56+yxKanBnR4ko
         s/NI5jN/XMeN1WqEven6TMOvTnl04rAPCP9G2AMUMdiP5EEkLDlM4n09Erb/fkXi6asu
         yXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iQPANlB5mIoowXu8LNtNpsFgPuknJTLP6MpR6ikyKgY=;
        b=oMGt2ogUX/dtkf1YRdUFUsaSnWcmaqQK/+oloCmuoiZslA2Ji7k8siZbJqk8/rnLTm
         9m7VyEmLS2tI9SSPt6+1wThyvw3QGPoXe8QRgOGcWnEG6CmgWovB0hcytGlghqFk8I1a
         nWvVDGEDLcABR/0T5QBzXZ22b5+OtPy7zLIgkZI0Sm6VbE87iqEXGAvPeViF1uGJTfRN
         L2BuztSKCSCWPIqOQhA7rmMaFN0BxydOrslTVR2fyvmAB614AyhI2LrcE2BLhZq2SNo4
         rQHxZvAnB2iyXTkX3quyNmU/nf9H1P22JKs0XkMiH/AgU28+cz/dn4MGVVuTtIT8LN/z
         IgFg==
X-Gm-Message-State: AJIora/BrvjIOLPw6yCpFmAq+awfRyFRWAiLJGFIN9ZbF2gqSyvzRHKC
        HgJsoclNX1onRfcGGM66hdQ=
X-Google-Smtp-Source: AGRyM1uSL669qTaTgunDdKiqtrqfqHMOZwfwqY7n6AyEpd9c4o3IXxsUPtLrfij/qRAE/9EzqT5/zA==
X-Received: by 2002:a17:902:e5c5:b0:16d:82dd:8c41 with SMTP id u5-20020a170902e5c500b0016d82dd8c41mr10026455plf.133.1658890633194;
        Tue, 26 Jul 2022 19:57:13 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id n8-20020aa79848000000b005289627ae6asm12392584pfq.187.2022.07.26.19.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 19:57:12 -0700 (PDT)
Date:   Wed, 27 Jul 2022 10:57:06 +0800
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
Subject: Re: [PATCH V4 1/8] libgpiod: Add libgpiod-sys rust crate
Message-ID: <20220727025706.GA88787@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <44ee8c36d58049de2f653494e16cba04b198fb35.1657279685.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44ee8c36d58049de2f653494e16cba04b198fb35.1657279685.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 08, 2022 at 05:04:54PM +0530, Viresh Kumar wrote:
> This adds libgpiod-sys rust crate, which provides FFI (foreign function
> interface) bindings for libgpiod APIs.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Just a quick qualifier before we get started - I'm relatively new to Rust
and this the first Rust code I've reviewed, so my opinions may not reflect
current idiomatic Rust or may even be complete rubbish.

> ---
>  .gitignore                            |  5 ++
>  bindings/rust/libgpiod-sys/Cargo.toml | 15 ++++++
>  bindings/rust/libgpiod-sys/build.rs   | 69 +++++++++++++++++++++++++++
>  bindings/rust/libgpiod-sys/src/lib.rs | 20 ++++++++
>  bindings/rust/libgpiod-sys/wrapper.h  |  2 +
>  5 files changed, 111 insertions(+)
>  create mode 100644 bindings/rust/libgpiod-sys/Cargo.toml
>  create mode 100644 bindings/rust/libgpiod-sys/build.rs
>  create mode 100644 bindings/rust/libgpiod-sys/src/lib.rs
>  create mode 100644 bindings/rust/libgpiod-sys/wrapper.h
> 
> diff --git a/.gitignore b/.gitignore
> index 58e1c5fc7e00..9541482d5efb 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -33,3 +33,8 @@ stamp-h1
>  # profiling
>  *.gcda
>  *.gcno
> +
> +# Added by cargo
> +
> +target
> +Cargo.lock
> diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
> new file mode 100644
> index 000000000000..77f82719d269
> --- /dev/null
> +++ b/bindings/rust/libgpiod-sys/Cargo.toml
> @@ -0,0 +1,15 @@
> +[package]
> +name = "libgpiod-sys"
> +version = "0.1.0"
> +edition = "2018"
> +
> +# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html
> +
> +[dependencies]
> +
> +[features]
> +generate = [ "bindgen" ]
> +
> +[build-dependencies]
> +bindgen = { version = "0.59.1", optional = true }
> +cc = "1.0.46"
> diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
> new file mode 100644
> index 000000000000..bbcd30f79d23
> --- /dev/null
> +++ b/bindings/rust/libgpiod-sys/build.rs
> @@ -0,0 +1,69 @@
> +#[cfg(feature = "generate")]
> +extern crate bindgen;
> +#[cfg(feature = "generate")]
> +use std::env;
> +#[cfg(feature = "generate")]
> +use std::path::PathBuf;
> +
> +#[cfg(feature = "generate")]
> +fn generate_bindings(files: &Vec<&str>) {
> +    // Tell cargo to invalidate the built crate whenever following files change
> +    println!("cargo:rerun-if-changed=wrapper.h");
> +
> +    for file in files {
> +        println!("cargo:rerun-if-changed={}", file);
> +    }
> +
> +    // The bindgen::Builder is the main entry point
> +    // to bindgen, and lets you build up options for
> +    // the resulting bindings.
> +    let bindings = bindgen::Builder::default()
> +        // The input header we would like to generate
> +        // bindings for.
> +        .header("wrapper.h")
> +        // Tell cargo to invalidate the built crate whenever any of the
> +        // included header files changed.
> +        .parse_callbacks(Box::new(bindgen::CargoCallbacks))
> +        // Finish the builder and generate the bindings.
> +        .generate()
> +        // Unwrap the Result and panic on failure.
> +        .expect("Unable to generate bindings");
> +
> +    // Write the bindings to the $OUT_DIR/bindings.rs file.
> +    let out_path = PathBuf::from(env::var("OUT_DIR").unwrap());
> +    bindings
> +        .write_to_file(out_path.join("bindings.rs"))
> +        .expect("Couldn't write bindings!");
> +}
> +
> +fn build_gpiod(files: Vec<&str>) {
> +    // Tell Cargo that if the given file changes, to rerun this build script.
> +    println!("cargo:rerun-if-changed=../../../lib/");
> +
> +    // Use the `cc` crate to build a C file and statically link it.
> +    cc::Build::new()
> +        .files(files)
> +        .define("_GNU_SOURCE", None)
> +        .define("GPIOD_VERSION_STR", "\"libgpio-sys\"")
> +        .include("../../../include")
> +        .compile("gpiod");
> +}
> +
> +fn main() {
> +    let files = vec![
> +        "../../../lib/chip.c",
> +        "../../../lib/chip-info.c",
> +        "../../../lib/edge-event.c",
> +        "../../../lib/info-event.c",
> +        "../../../lib/internal.c",
> +        "../../../lib/line-config.c",
> +        "../../../lib/line-info.c",
> +        "../../../lib/line-request.c",
> +        "../../../lib/misc.c",
> +        "../../../lib/request-config.c",
> +    ];
> +
> +    #[cfg(feature = "generate")]
> +    generate_bindings(&files);
> +    build_gpiod(files);
> +}

Shouldn't bindings wrap libgpiod and dynamically link against it rather
than building and linking statically?

> diff --git a/bindings/rust/libgpiod-sys/src/lib.rs b/bindings/rust/libgpiod-sys/src/lib.rs
> new file mode 100644
> index 000000000000..3384863a567c
> --- /dev/null
> +++ b/bindings/rust/libgpiod-sys/src/lib.rs
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#[allow(
> +    clippy::all,
> +    deref_nullptr,
> +    dead_code,
> +    non_camel_case_types,
> +    non_upper_case_globals,
> +    non_snake_case,
> +    improper_ctypes
> +)]
> +

Are all these really necessary?
Builds mostly clean for me with just:

 +    non_camel_case_types,
 +    non_upper_case_globals,

Both non_snake_case and deref_nullptr are only required for tests.

The deref_nullptr masks several warnings like this:

warning: dereferencing a null pointer
   --> src/bindings.rs:121:14
    |
121 |             &(*(::std::ptr::null::<max_align_t>())).__clang_max_align_nonce1 as *const _ as usize
    |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ this code causes undefined behavior when executed
    |
    = note: `#[warn(deref_nullptr)]` on by default

which is code generated by bindgen, which is a bit of a worry.
It is only used for alignment tests, but you'd think they would disable
the warning just around that code themselves.

Disabling deref_nullptr globally for all builds is at best poor form.
Perhaps only disable it for test builds, i.e.

#[cfg_attr(test, allow(deref_nullptr, non_snake_case))]

> +mod bindings_raw {
> +    #[cfg(feature = "generate")]
> +    include!(concat!(env!("OUT_DIR"), "/bindings.rs"));
> +
> +    #[cfg(not(feature = "generate"))]
> +    include!("bindings.rs");
> +}
> +pub use bindings_raw::*;
> diff --git a/bindings/rust/libgpiod-sys/wrapper.h b/bindings/rust/libgpiod-sys/wrapper.h
> new file mode 100644
> index 000000000000..7bc1158b7d90
> --- /dev/null
> +++ b/bindings/rust/libgpiod-sys/wrapper.h
> @@ -0,0 +1,2 @@
> +#include <string.h>
> +#include "../../../include/gpiod.h"

The string.h is just to provide strlen() for the wrapper crate??
(but also pulls in the other string functions)
The wrapper crate already depends on libc - why not use libc::strlen()
there and drop this include here?

And then wrapper.h becomes redundant - call bindgen on gpiod.h directly.

Cheers,
Kent.
