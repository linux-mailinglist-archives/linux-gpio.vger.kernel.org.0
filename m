Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97896600FA0
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 14:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbiJQM7p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 08:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbiJQM7l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 08:59:41 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8546A2DCE
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 05:59:30 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id f23so10686374plr.6
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 05:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xlta7sJlnDqsevTtvx8gjdcxKxEATI5K8JaCCSdSPZU=;
        b=DDLYkzuZ7JDAMKTLOrAZ2on1+1bc6GyeOR5EKmTc1pveWeXoHZag22lkG00OgL+XbJ
         W6gLDQ8ylOFSbTrRjXrSNfiEKnvdFuVAXOzOxAk2YaV57Ablnk2VrmyAYIRNIqSTxoOc
         QXJFRBrSGi+NVWpV5Bb4BNNuNvcfPDoGJYkQR3TzxMh11xkfzrYHxfYLPYNBLmuindMv
         FDSAhQjcrS19Udc8DgpEtbtEXRU/jMt5XHdDK5ZW6Nk9DA0xRH+VCOxTmbn0cmI+whyH
         Mvcf/msAXYnNgsdRFCtfUBpG3N2EK+cDKg4bgwF23BB8Sfnx+EDqMzkXHSJl95n65kS/
         GlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xlta7sJlnDqsevTtvx8gjdcxKxEATI5K8JaCCSdSPZU=;
        b=KtoAC26bSs6di2V4kc3UhzjgL4nqms1dRAqEPsApUlcEtKITJ2GwvYqcPVRUgUI3Q8
         nGZmr0QlHu7vX24OxsB0S/NaPKm2PnnffVG0uEAWCjVn28GlEhPeLzEPxc++CCiSF+34
         nEYYgppZdN1/gPGAdzz1lcwFvGdNylKHyQZ/1XY2sXu2ODHZuGcW0ngdL3JEOcI/p3sR
         YbUzkzamW/+++VQU9fMNh2/qW43HR/mXqmi76mtgyl/vE66iqxWH8KxWclzuA33IxBum
         GwAKHjVN5uaaJ0GeWYalC9bvto5f/OKO8n9btewiFVjGgLoxuTy2dLouVRmKjjq2hTnQ
         lCoA==
X-Gm-Message-State: ACrzQf3VgaoZPzqT8dkZ3PZfd53S0Gw4RsiLnoBlsZ1m/QFoO3zIUZpX
        g34Y++qb5CTWApoONDic84s=
X-Google-Smtp-Source: AMsMyM7YQI+gazB9qt8nU8ZA2c5F7KhjNU+jModB+PsSWTSAeelUEIkjakfSbSM3WeynSEEXp+fBUA==
X-Received: by 2002:a17:902:cec6:b0:185:4f82:922e with SMTP id d6-20020a170902cec600b001854f82922emr7054201plg.152.1666011569291;
        Mon, 17 Oct 2022 05:59:29 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id e15-20020a170902784f00b0017a09ebd1e2sm6525156pln.237.2022.10.17.05.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 05:59:28 -0700 (PDT)
Date:   Mon, 17 Oct 2022 20:59:22 +0800
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
Subject: Re: [PATCH V7 1/8] libgpiod: Add libgpiod-sys rust crate
Message-ID: <Y01RqjgZINnkcyIC@sol>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <c8ef89c343a0c31e4132cc6757fdff8dec0d1669.1665744170.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8ef89c343a0c31e4132cc6757fdff8dec0d1669.1665744170.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 14, 2022 at 04:17:18PM +0530, Viresh Kumar wrote:
> This adds libgpiod-sys rust crate, which provides FFI (foreign function
> interface) bindings for libgpiod APIs.
> 

For the whole series: 

Mail subject should start with [libgpiod v2]

Commits should begin with "bindings: rust: ", rather than "libgpiod:" as
the latter is self-evident.

> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  .gitignore                            |  5 ++++
>  bindings/rust/Cargo.toml              |  5 ++++
>  bindings/rust/libgpiod-sys/Cargo.toml | 15 ++++++++++
>  bindings/rust/libgpiod-sys/build.rs   | 41 +++++++++++++++++++++++++++
>  bindings/rust/libgpiod-sys/src/lib.rs | 13 +++++++++
>  5 files changed, 79 insertions(+)
>  create mode 100644 bindings/rust/Cargo.toml
>  create mode 100644 bindings/rust/libgpiod-sys/Cargo.toml
>  create mode 100644 bindings/rust/libgpiod-sys/build.rs
>  create mode 100644 bindings/rust/libgpiod-sys/src/lib.rs
> 
> diff --git a/.gitignore b/.gitignore
> index 6c08415b390d..9f2fcf440c5d 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -35,3 +35,8 @@ stamp-h1
>  # profiling
>  *.gcda
>  *.gcno
> +
> +# Added by cargo
> +
> +target
> +Cargo.lock
> diff --git a/bindings/rust/Cargo.toml b/bindings/rust/Cargo.toml
> new file mode 100644
> index 000000000000..d0b3a3c88ff1
> --- /dev/null
> +++ b/bindings/rust/Cargo.toml
> @@ -0,0 +1,5 @@
> +[workspace]
> +
> +members = [
> +    "libgpiod-sys",
> +]
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

Add license and other relevant keys as per the link you helpfully include...

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
> index 000000000000..98863686c7af
> --- /dev/null
> +++ b/bindings/rust/libgpiod-sys/build.rs
> @@ -0,0 +1,41 @@
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
> +    println!("cargo:rerun-if-changed=../../../include/gpiod.h");
> +
> +    // The bindgen::Builder is the main entry point
> +    // to bindgen, and lets you build up options for
> +    // the resulting bindings.
> +    let bindings = bindgen::Builder::default()
> +        // The input header we would like to generate
> +        // bindings for.
> +        .header("../../../include/gpiod.h")
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
> +    println!("cargo:rustc-link-search=./../../lib/.libs/");
> +    println!("cargo:rustc-link-lib=static=gpiod");
> +}
> diff --git a/bindings/rust/libgpiod-sys/src/lib.rs b/bindings/rust/libgpiod-sys/src/lib.rs
> new file mode 100644
> index 000000000000..1ca355b5f5ac
> --- /dev/null
> +++ b/bindings/rust/libgpiod-sys/src/lib.rs
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +

GPL-2.0?

Elsewhere you use Apache 2.0 AND BSD-3-Clause for rust code.

Cheers,
Kent.

> +#[allow(non_camel_case_types, non_upper_case_globals)]
> +#[cfg_attr(test, allow(deref_nullptr, non_snake_case))]
> +
> +mod bindings_raw {
> +    #[cfg(feature = "generate")]
> +    include!(concat!(env!("OUT_DIR"), "/bindings.rs"));
> +
> +    #[cfg(not(feature = "generate"))]
> +    include!("bindings.rs");
> +}
> +pub use bindings_raw::*;
> -- 
> 2.31.1.272.g89b43f80a514
> 
