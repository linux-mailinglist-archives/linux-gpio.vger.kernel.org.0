Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 503BF600FA9
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 15:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbiJQNAs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 09:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbiJQNAp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 09:00:45 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F22CE4F640
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 06:00:40 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id x66so2676340vsb.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8CpkhNwTgycoZ0BLJxY+fA4gLdy203ay/i1pwhAWZ0=;
        b=kv3pS/T3xXEX1KfCLQJucWlX1gau/VgAdXUnjF4NU90wvy/hVaLJjaPvd/4VGawXmv
         8h3ncxnJTbmldxMRi3CAKaMenEgyMTtivhrHHiM87ghZrE3lSU3sI+drSQyIBuieS16r
         y2IkFDLi87xRHyl6JE5p8TeyMV2PQQN7SdGnKA2cPHAgrC0C1yXHBNnDQKvlYvcqOb0q
         Qy3tFkF7Ua75HboD8m4o77CppG7kJSsxrK/S8LDoMPNnh+GLlgF2L7RtVX/J3ya49yoI
         NTNDRU79CFYkl+4PQ2GWbVX3zNCebahhbinPKmS5/bdelU/G0xdSD1g2GWJoTbsaHV+l
         DwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8CpkhNwTgycoZ0BLJxY+fA4gLdy203ay/i1pwhAWZ0=;
        b=MeN99xe5nB+AXoaH5yKAyWtN9M1gu7JhBotAmkKNPuVxju3t1Tyn7SBNMx6E2jEls9
         BG4Za7H2dOoR7jML9GjgRu2+gdi1GeGPwB2+Md+YhGk3T6HK+omD0zHlkjvTTnGjIKcO
         SuRmrpqg+CIazAxfWoWMuQbQXXNVZeZ5XAiSOhFKGuvk4TIo68Y/X+4uSTZXUr4ot8j3
         geiL9/HmojzNQkSZh15FeBfMzL4YH1WNmSTLD5A/P22zPv8HHS4rw45PVQNwnAn3Ocl9
         n8y1a/3M/pwo+mKF92n7iDrQtbdsPKpqlgfdpinglS+kvrmYLaVZWgConrQe+jcF3LB0
         Rb4w==
X-Gm-Message-State: ACrzQf2WnlT30S29B8liWvJkp4cdveDYzP3qTNVLYg9tpyKO/bVuIqYw
        1o6bnhFufVnblruCeT8hPQkFEL32slA=
X-Google-Smtp-Source: AMsMyM7gffCeYp7acJdbLhJ2i25VAvb/jqUwrqM4Cx8Jw/trWleWyrm6xRTf+4fft0l2GYAA1NQF1w==
X-Received: by 2002:a05:6a00:b85:b0:563:4623:ec40 with SMTP id g5-20020a056a000b8500b005634623ec40mr12168266pfj.56.1666011627192;
        Mon, 17 Oct 2022 06:00:27 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id f7-20020a631007000000b0045935b12e97sm6158717pgl.36.2022.10.17.06.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 06:00:26 -0700 (PDT)
Date:   Mon, 17 Oct 2022 21:00:20 +0800
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
Subject: Re: [PATCH V7 5/8] libgpiod: Add gpiosim rust crate
Message-ID: <Y01R5NC9IRCb8VSj@sol>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <4484ba30efe5dbf09e9a200ec17185479282d1f2.1665744170.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4484ba30efe5dbf09e9a200ec17185479282d1f2.1665744170.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 14, 2022 at 04:17:22PM +0530, Viresh Kumar wrote:
> This adds gpiosim rust crate, which provides helpers to emulate GPIO
> chips.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  bindings/rust/Cargo.toml         |   3 +-
>  bindings/rust/gpiosim/Cargo.toml |  18 ++
>  bindings/rust/gpiosim/build.rs   |  43 ++++
>  bindings/rust/gpiosim/src/lib.rs |  25 +++
>  bindings/rust/gpiosim/src/sim.rs | 323 +++++++++++++++++++++++++++++++
>  5 files changed, 411 insertions(+), 1 deletion(-)
>  create mode 100644 bindings/rust/gpiosim/Cargo.toml
>  create mode 100644 bindings/rust/gpiosim/build.rs
>  create mode 100644 bindings/rust/gpiosim/src/lib.rs
>  create mode 100644 bindings/rust/gpiosim/src/sim.rs
> 
> diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
> index 1e57ef2c0002..8721bc610b86 100644
> --- a/bindings/rust/Cargo.toml
> +++ b/bindings/rust/Cargo.toml
> @@ -2,5 +2,6 @@
>  
>  members = [
>      "libgpiod-sys",
> -    "libgpiod"
> +    "libgpiod",
> +    "gpiosim"
>  ]
> diff --git a/bindings/rust/gpiosim/Cargo.toml b/bindings/rust/gpiosim/Cargo.toml
> new file mode 100644
> index 000000000000..d6b4cc34339b
> --- /dev/null
> +++ b/bindings/rust/gpiosim/Cargo.toml
> @@ -0,0 +1,18 @@
> +[package]
> +name = "gpiosim"
> +version = "0.1.0"
> +edition = "2018"
> +

license and other keys...

> +# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html
> +
> +[dependencies]
> +libc = ">=0.2.39"
> +libgpiod = { path = "../libgpiod" }
> +vmm-sys-util = "=0.10.0"
> +
> +[features]
> +generate = [ "bindgen" ]
> +
> +[build-dependencies]
> +bindgen = { version = "0.59.1", optional = true }
> +cc = "1.0.46"
> diff --git a/bindings/rust/gpiosim/build.rs b/bindings/rust/gpiosim/build.rs
> new file mode 100644
> index 000000000000..460fb8c092c3
> --- /dev/null
> +++ b/bindings/rust/gpiosim/build.rs
> @@ -0,0 +1,43 @@
> +#[cfg(feature = "generate")]
> +extern crate bindgen;
> +#[cfg(feature = "generate")]
> +use std::env;
> +#[cfg(feature = "generate")]
> +use std::path::PathBuf;
> +
> +#[cfg(feature = "generate")]
> +fn generate_bindings() {
> +    // Tell cargo to invalidate the built crate whenever following files change
> +    println!("cargo:rerun-if-changed=../../../tests/gpiosim/gpiosim.h");
> +
> +    // The bindgen::Builder is the main entry point
> +    // to bindgen, and lets you build up options for
> +    // the resulting bindings.
> +    let bindings = bindgen::Builder::default()
> +        // The input header we would like to generate
> +        // bindings for.
> +        .header("../../../tests/gpiosim/gpiosim.h")
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
> +fn main() {
> +    #[cfg(feature = "generate")]
> +    generate_bindings();
> +
> +    println!("cargo:rustc-link-lib=kmod");
> +    println!("cargo:rustc-link-lib=mount");
> +    println!("cargo:rustc-link-search=./../../tests/gpiosim/.libs/");
> +    println!("cargo:rustc-link-lib=static=gpiosim");
> +}
> diff --git a/bindings/rust/gpiosim/src/lib.rs b/bindings/rust/gpiosim/src/lib.rs
> new file mode 100644
> index 000000000000..94d0ddb38e0f
> --- /dev/null
> +++ b/bindings/rust/gpiosim/src/lib.rs
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0
> +

GPL-2.0.  Not so critical for the gpiosim, but still...

> +#[allow(non_camel_case_types, non_upper_case_globals)]
> +#[cfg_attr(test, allow(deref_nullptr, non_snake_case))]
> +#[allow(dead_code)]
> +mod bindings_raw {
> +    #[cfg(feature = "generate")]
> +    include!(concat!(env!("OUT_DIR"), "/bindings.rs"));
> +
> +    #[cfg(not(feature = "generate"))]
> +    include!("bindings.rs");
> +}
> +
> +use bindings_raw::*;
> +
> +pub use bindings_raw::{
> +    GPIOSIM_HOG_DIR_INPUT, GPIOSIM_HOG_DIR_OUTPUT_HIGH, GPIOSIM_HOG_DIR_OUTPUT_LOW,
> +    GPIOSIM_PULL_DOWN, GPIOSIM_PULL_UP, GPIOSIM_VALUE_ACTIVE, GPIOSIM_VALUE_INACTIVE,
> +};

Create enums for pull, direction, and value and accept/return those rather
than passing around these consts as i32.

> +
> +#[allow(dead_code)]
> +mod sim;
> +

Handle the warning inside the module rather than the blanket allow.

Rename Sim.ctx to _ctx to clear the warning.

> +#[allow(unused_imports)]
> +pub use sim::*;

Which imports are unused and why?
I don't see any warnings after removing this allow.

> diff --git a/bindings/rust/gpiosim/src/sim.rs b/bindings/rust/gpiosim/src/sim.rs
> new file mode 100644
> index 000000000000..50977ea54ebb
> --- /dev/null
> +++ b/bindings/rust/gpiosim/src/sim.rs
> @@ -0,0 +1,323 @@
> +// SPDX-License-Identifier: Apache-2.0 AND BSD-3-Clause
> +//
> +// Copyright 2022 Linaro Ltd. All Rights Reserved.
> +//     Viresh Kumar <viresh.kumar@linaro.org>
> +
> +use libc::strlen;
> +use std::os::raw::c_char;
> +use std::path::PathBuf;
> +use std::{slice, str};
> +
> +use vmm_sys_util::errno::Error as Errno;
> +
> +use libgpiod::{Error, Offset, OperationType, Result};
> +
> +use crate::*;
> +
> +/// Sim Ctx
> +#[derive(Debug)]
> +struct SimCtx {
> +    ctx: *mut gpiosim_ctx,
> +}
> +
> +unsafe impl Send for SimCtx {}
> +unsafe impl Sync for SimCtx {}
> +

Is gpiosim thread safe?

> +impl SimCtx {
> +    fn new() -> Result<Self> {
> +        let ctx = unsafe { gpiosim_ctx_new() };

SAFETY comments for all unsafe.

Cheers,
Kent.
