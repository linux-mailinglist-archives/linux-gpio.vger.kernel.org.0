Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E408734B1A
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jun 2023 06:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjFSE2R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jun 2023 00:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjFSE2R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 00:28:17 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8905DE49
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jun 2023 21:28:15 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-54faf8db79fso1106022a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jun 2023 21:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687148895; x=1689740895;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LtW6HM3Kh2G3hLxzUlPsCNCurUDMSWWTPHG5UGrkJTQ=;
        b=nqDkMPuz6ac7amTOHsp5++5I32bIGv6Ek32DOhhXTrqbhlHECx3InqeNQkjSy+Gdux
         3g1gpnXz5lrQ+WaDx0GBRvTiV/bUojcXM/5MJbroDkR1IW4aD0V6JQm5mnIPLTLeVvq8
         GwLyBXpEuDJmGF8THUo5XKRa3R+WTjrXw5i/Xr2ltJ3TgGU7Thd9WHfNDQszIwy7qY2s
         UCU3qKaTK3Z2sN8/W/RfMlOxcAkVSfYmsg0gs4vxIvV1slZ9nSWBv5bxMP5U5/68ehUD
         I6bjmuirjoyvrTaZCMQ6v8EnH3v6I/sQrU69jz4SxBinbHnJtWdnseDda26Ti9Ng0t6g
         PsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687148895; x=1689740895;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LtW6HM3Kh2G3hLxzUlPsCNCurUDMSWWTPHG5UGrkJTQ=;
        b=f0GYpdj6GNF6b0YbRmtKbs18woNv11y0StQa48TFwDCN0APwkhvbF2kjlEP6G/uWB0
         51u7sFO+2uhOnkLpWKE04qWXLqHT4bVga/H6QBOXmG5OZXtMKEjDS2sSrVHS9kmkb57G
         mtW33zcodg9ADXLlcZJUjl+WYYYFLT5Dxy/8m2zYrVb9Tnqnzlbsm3JXYxirJR5KVA8v
         sqOraZWmswk0SP20P12M9RpCe8hDMLmgQlAUxxJPmiryFzPfdogPJeCv6F5Ey/W6fulo
         bZQPwyXx4cwVocfu+6guMmfXYJk3pqlDtRiSlTwcujbUV4gNsxIqfmQLhu9JrGMqhLIy
         5Z2Q==
X-Gm-Message-State: AC+VfDxe0dKv02JQQA9A4naoIf6P1qLncPSCxV9Mll3kAqTQVNwJB732
        NO3ceXRgIXi9gaIhK/NYbyPmEQ==
X-Google-Smtp-Source: ACHHUZ60DjiCC3mfSKrfqXhKnK21qUGW0AVA6QlWDrGkX3qwOCUcS7GVjyohqMCH6asW+GB+EraMdA==
X-Received: by 2002:a05:6a20:842a:b0:114:6390:db06 with SMTP id c42-20020a056a20842a00b001146390db06mr9201129pzd.32.1687148895005;
        Sun, 18 Jun 2023 21:28:15 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id y20-20020a170902b49400b001a980a23804sm19445713plr.4.2023.06.18.21.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 21:28:14 -0700 (PDT)
Date:   Mon, 19 Jun 2023 09:58:11 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH RESEND libgpiod] bindings: rust: bump MSRV to 1.60
Message-ID: <20230619042811.yzlgewttv5sqwlsn@vireshk-i7>
References: <20230616-msrv-v1-1-1f0ca25b8222@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230616-msrv-v1-1-1f0ca25b8222@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16-06-23, 10:37, Erik Schilling wrote:
> Specifying MSRV (minimum supported rust version) was introduced with
> Rust 1.56. So old versions of libraries do not have this restriction
> spelled out in their Cargo.toml.
> 
> This means that even if we claimed a MSRV of 1.56 until now, that did
> not mean that things were actually buildable with 1.56 practically
> (without manually researching compatible versions and pinning them
> down).
> 
> `bindgen` started listing a MSRV from v0.61 (requiring Rust 1.57) [1].
> So that may seem like an obvious choice. But if one attempts to build
> it with such an old version one will realize that `log` only started
> requesting a MSRV with 0.4.19 (requesting Rust 1.60) [2]. Hence, we
> would either need to manually restrict log to an old, but compatible
> release (which would unnecessarily restrict everyone on newer Rust
> versions) or just also bump our MSRV to 1.60.
> 
> Rust 1.60 was released on 2022-04-07 [3] and seems like an acceptable
> choice if core components such as `log` started their MSRV tracking with
> that version. If someone is determined wanting to use this with an older
> version of Rust, thats still possible. If one has done the necessary
> manual research and pinned their versions down, one can use
> --ignore-rust-version (or a < 1.56 version of Rust that does not check
> the MSRV yet).
> 
> Thanks to Manos Pitsidianakis <manos.pitsidianakis@linaro.org> for
> helping me out when I successfully confused myself somewhere.
> 
> [1] https://github.com/rust-lang/rust-bindgen/blob/v0.61.0/bindgen/Cargo.toml
> [2] https://github.com/rust-lang/log/blob/0.4.19/Cargo.toml
> [3] https://blog.rust-lang.org/2022/04/07/Rust-1.60.0.html
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> While looking at the clippy fixes [1], I realized that things do not
> actually build with the minimum supported Rust version that we claim.
> The simplest way forward seems to be just bumping that version.
> 
> [1] https://lore.kernel.org/r/20230612154055.56556-1-warthog618@gmail.com/
> 
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Kent Gibson <warthog618@gmail.com>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Cc: Alex Bennée <alex.bennee@linaro.org>
> ---
>  bindings/rust/gpiosim-sys/Cargo.toml  | 2 +-
>  bindings/rust/libgpiod-sys/Cargo.toml | 2 +-
>  bindings/rust/libgpiod/Cargo.toml     | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/bindings/rust/gpiosim-sys/Cargo.toml b/bindings/rust/gpiosim-sys/Cargo.toml
> index af30748..1f44a31 100644
> --- a/bindings/rust/gpiosim-sys/Cargo.toml
> +++ b/bindings/rust/gpiosim-sys/Cargo.toml
> @@ -9,7 +9,7 @@ authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
>  description = "gpiosim header bindings"
>  repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
>  categories = ["external-ffi-bindings", "os::linux-apis"]
> -rust-version = "1.56"
> +rust-version = "1.60"
>  keywords = ["libgpiod", "gpio", "gpiosim"]
>  license = "Apache-2.0 OR BSD-3-Clause"
>  edition = "2021"
> diff --git a/bindings/rust/libgpiod-sys/Cargo.toml b/bindings/rust/libgpiod-sys/Cargo.toml
> index 0c814ee..b4d26e9 100644
> --- a/bindings/rust/libgpiod-sys/Cargo.toml
> +++ b/bindings/rust/libgpiod-sys/Cargo.toml
> @@ -9,7 +9,7 @@ authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
>  description = "libgpiod public header bindings"
>  repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
>  categories = ["external-ffi-bindings", "os::linux-apis"]
> -rust-version = "1.56"
> +rust-version = "1.60"
>  keywords = ["libgpiod", "gpio"]
>  license = "Apache-2.0 OR BSD-3-Clause"
>  edition = "2021"
> diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
> index d6758be..518e5e5 100644
> --- a/bindings/rust/libgpiod/Cargo.toml
> +++ b/bindings/rust/libgpiod/Cargo.toml
> @@ -9,7 +9,7 @@ authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
>  description = "libgpiod wrappers"
>  repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"
>  categories = ["api-bindings", "hardware-support", "embedded", "os::linux-apis"]
> -rust-version = "1.56"
> +rust-version = "1.60"
>  keywords = ["libgpiod", "gpio"]
>  license = "Apache-2.0 OR BSD-3-Clause"
>  edition = "2021"

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
