Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E610C581DC9
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 04:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbiG0C5q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jul 2022 22:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240120AbiG0C5p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jul 2022 22:57:45 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2547371B2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 19:57:44 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id b10so15139250pjq.5
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 19:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NMXQ3DrioTJ++kz6BBAIMs5Yr5de4aecTzF0dM1t3Vs=;
        b=WKZTKj5riRSZsc0LPSN4BVNkljan2cJXadHVX6AfC+OLQ1YoZ+3/nf7eIXAMW7itYe
         hvI4sqafroQnm+SaBXLqHYoQOGN0rBfBpCDKjpPKD5qswjc9yOL1QszvGw4tZZ+9aX8r
         naq51AwdCLhGmAeT5MXVd52TW8PQGm8HGkoU7nj02p/1/bf3fIgzQ9gMLnVuUoMmPZNh
         7gpNkbDX5bQtUES65nQQ/rPAnAsHp8tgVZ2F3nkw880KSIdT7mrYIjl332nVPjciekPN
         y+FhfUAD/nuYoNpHCTsPyCOygXOl37Zlf18JQa/yC5VHNRDk5e61IZfyNhZiwqRvlHR7
         DzFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NMXQ3DrioTJ++kz6BBAIMs5Yr5de4aecTzF0dM1t3Vs=;
        b=vorqkkri1KYRIAsTWgATzWLCfEfbfVvcdHkTxFX+LpBDdciH9//jA6hmn78UIIa+Og
         /dV9XubUwQhPIGvkpkDg5Ps7hZMoUo/u/Z3U/rdYcSP3Cik/lUd1OVgHRhYzgPkE2Vwz
         u7+bHsytnGqZkEAExtn9JLo4QHK5ZmgY/CTvMSsb7jCGWrMO20ftqhkSxqvJ6CyRU613
         FwAWtCpdHhf6/nUMTybvk6JeomWxMogPa3ey91sCwd82nbHlyJhy83WunPfg5ZDz4qxy
         2Wesdsb0nHuRWfPVx+Jn0/mTnBiKpQ2l4deRAl2mq0nkQiPciu+Cp+k6o5gVtEvkEym5
         7rkQ==
X-Gm-Message-State: AJIora+y0cQ41wmf4QlRzd9ZlC8j+UlJm7ianM5mptlx1PqAx/GyoE7O
        fRK96IN6EC/wD0O+WqcXKTxBAAo0izk=
X-Google-Smtp-Source: AGRyM1sZzhzsDdTPmWW8pXfTO2Wwgd/CR2NP13SsqncVnFOxFwIuzc96IPHcNJcds3zkaLO7aAXGug==
X-Received: by 2002:a17:903:481:b0:16d:4535:6db7 with SMTP id jj1-20020a170903048100b0016d45356db7mr19399986plb.156.1658890664368;
        Tue, 26 Jul 2022 19:57:44 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id e9-20020a170902ef4900b0016d338160d6sm11962587plx.155.2022.07.26.19.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 19:57:43 -0700 (PDT)
Date:   Wed, 27 Jul 2022 10:57:38 +0800
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
Subject: Re: [PATCH V4 3/8] libgpiod-sys: Add support to generate gpiosim
 bindings
Message-ID: <20220727025738.GC88787@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <9cc6890c1039f75eadb77a1c9c16bf947ec9eb9e.1657279685.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cc6890c1039f75eadb77a1c9c16bf947ec9eb9e.1657279685.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 08, 2022 at 05:04:56PM +0530, Viresh Kumar wrote:
> Add support to generate gpiosim bindings.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  bindings/rust/libgpiod-sys/Cargo.toml        |  1 +
>  bindings/rust/libgpiod-sys/build.rs          | 19 +++++++++++++++++--
>  bindings/rust/libgpiod-sys/gpiosim_wrapper.h |  1 +
>  3 files changed, 19 insertions(+), 2 deletions(-)
>  create mode 100644 bindings/rust/libgpiod-sys/gpiosim_wrapper.h
> 
> diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
> index 77f82719d269..73b6761d16dd 100644
> --- a/bindings/rust/libgpiod-sys/Cargo.toml
> +++ b/bindings/rust/libgpiod-sys/Cargo.toml
> @@ -9,6 +9,7 @@ edition = "2018"
>  
>  [features]
>  generate = [ "bindgen" ]
> +gpiosim = [ "generate", "bindgen" ]
>  

Should gpiosim be a feature or a separate library/crate?
I would expect it to be a separate crate and for libgpiod to have a
dev-dependency on it (it is only required for tests, right?).

>  [build-dependencies]
>  bindgen = { version = "0.59.1", optional = true }
> diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
> index bbcd30f79d23..147daaf6b1da 100644
> --- a/bindings/rust/libgpiod-sys/build.rs
> +++ b/bindings/rust/libgpiod-sys/build.rs
> @@ -14,13 +14,25 @@ fn generate_bindings(files: &Vec<&str>) {
>          println!("cargo:rerun-if-changed={}", file);
>      }
>  
> +    if cfg!(feature = "gpiosim") {
> +        println!("cargo:rerun-if-changed=gpiosim_wrapper.h");
> +    }
> +
>      // The bindgen::Builder is the main entry point
>      // to bindgen, and lets you build up options for
>      // the resulting bindings.
> -    let bindings = bindgen::Builder::default()
> +    let mut builder = bindgen::Builder::default()
>          // The input header we would like to generate
>          // bindings for.
> -        .header("wrapper.h")
> +        .header("wrapper.h");
> +
> +    if cfg!(feature = "gpiosim") {
> +        builder = builder.header("gpiosim_wrapper.h");
> +        println!("cargo:rustc-link-lib=kmod");
> +        println!("cargo:rustc-link-lib=mount");
> +    }
> +
> +    let bindings = builder
>          // Tell cargo to invalidate the built crate whenever any of the
>          // included header files changed.
>          .parse_callbacks(Box::new(bindgen::CargoCallbacks))
> @@ -46,6 +58,7 @@ fn build_gpiod(files: Vec<&str>) {
>          .define("_GNU_SOURCE", None)
>          .define("GPIOD_VERSION_STR", "\"libgpio-sys\"")
>          .include("../../../include")
> +        .include("/usr/include/libmount")
>          .compile("gpiod");
>  }
>  
> @@ -61,6 +74,8 @@ fn main() {
>          "../../../lib/line-request.c",
>          "../../../lib/misc.c",
>          "../../../lib/request-config.c",
> +        #[cfg(feature = "gpiosim")]
> +        "../../../tests/gpiosim/gpiosim.c",
>      ];
>  
>      #[cfg(feature = "generate")]
> diff --git a/bindings/rust/libgpiod-sys/gpiosim_wrapper.h b/bindings/rust/libgpiod-sys/gpiosim_wrapper.h
> new file mode 100644
> index 000000000000..47dc12a87917
> --- /dev/null
> +++ b/bindings/rust/libgpiod-sys/gpiosim_wrapper.h
> @@ -0,0 +1 @@
> +#include "../../../tests/gpiosim/gpiosim.h"
> -- 

Why bother with this wrapper - just bindgen that header directly?

Cheers,
Kent.

