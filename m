Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B62EE7BB426
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 11:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbjJFJ0A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 05:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbjJFJZ6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 05:25:58 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD9295
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 02:25:57 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-69101d33315so1649064b3a.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 02:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696584357; x=1697189157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rnbDxSizoKEmB+u9ZYYFCwCCdB+OuSQcG9GC/oqdNyI=;
        b=nt3Drt5A1xHUP/EQkRUbcNSNQEvS/YFE2NiDE/M8vzFhJtmNjZak0z6G+OaVwUBmfE
         3/eKVf1rPibi7WbEu0oJrHwLPKv/an+iazWRI2wIvqTMhT+LyR+3hq1QrCwnDCEynBdS
         St0G+yEpeTUQDuLEXRqgP/39UiJ/diNKac+TEH0RdYui7Hz2b2On2d63qIlwu00MoZyI
         feRxjTTtzXxlSiJIQaoi7dU+hVPgZwbRiDdAzSuNGmCuxzwlh9FhjOA2MrhjsCLbLeBX
         gr2atw/Hsfxix/uCaMjqd94IOXfvTdJ4nPQtvittOmLHHmvhGSA/TFaeFwveTT2p3yvW
         sy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696584357; x=1697189157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnbDxSizoKEmB+u9ZYYFCwCCdB+OuSQcG9GC/oqdNyI=;
        b=WNgwl8IVPwyptNLVYGucyHC1WSoJLE3Te0EpApQNIPGyAAloV12TjgtbgQSd87rGsa
         05SoHW+yNBXXWoCLDyvoH3j2lFYBH1sFlbgCCrzBfbs35nubz9Oua69yWZAAPWw3HfWn
         AL3RHTP1z9ypR0XSrNIoZU5OO0V9fifMGBEPBXSidEebjS7UQ3IgriCboEUVKZPIBaxN
         IQ4mSYWGmXx+ceS2vwmfvZRKrPxlB5F4pAPh6QuEGNsof7Mxlq8wPyVBz9Uf/R638cM2
         +oKSm//eyHUWxcsPDtmANic0BE39v+iCdZkBaFlRvCTRSOumaRZzgHxfMP7xeUUrXzXs
         SKDg==
X-Gm-Message-State: AOJu0YzCDBMx7uiFkYuHmmtPs5pM6rrOQ0z49g3n01Q8EfxgrN4k0tKU
        FFYUutEx2lmWXxddJHpWbFC0tA==
X-Google-Smtp-Source: AGHT+IHGyydmc31NlWcvqmTfKZWxPGu9RxZhO2gghpF4mjtL3jwtJ7smA0HWOOujsAxBD0DFPIQ87g==
X-Received: by 2002:a05:6a00:2489:b0:690:1720:aa92 with SMTP id c9-20020a056a00248900b006901720aa92mr7992480pfv.10.1696584356667;
        Fri, 06 Oct 2023 02:25:56 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id e19-20020aa78c53000000b00666e649ca46sm994270pfd.101.2023.10.06.02.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 02:25:55 -0700 (PDT)
Date:   Fri, 6 Oct 2023 14:55:53 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux-GPIO <linux-gpio@vger.kernel.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [libgpiod][PATCH 1/2] bindings: rust: feature gate unreleased
 features
Message-ID: <20231006092553.cgfcziugrngvibud@vireshk-i7>
References: <20231006-b4-bindings-old-version-fix-v1-0-a65f431afb97@linaro.org>
 <20231006-b4-bindings-old-version-fix-v1-1-a65f431afb97@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006-b4-bindings-old-version-fix-v1-1-a65f431afb97@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06-10-23, 09:24, Erik Schilling wrote:
> `gpiod_line_request_get_chip_name()` is not released yet. Still, libgpiod-sys
> will just happily generate bindings for it if it sees the definition in the
> header file.
> 
> This guards the unreleased features behind an optional feature `vnext`.
> 
> To sketch the process of what happens once these features get into an
> assumed "2.1" release:
> 
> libgpiod-sys will get updated with a `v2_1` feature. That feature would
> then raise the minimum version that is attempted to query from pkg-
> config. An identical feature will then be introduced on the `libgpiod`
> crate and `vnext` guards will be changed to `v2_1` guards. The `vnext`
> feature will then be updated to require the new `v2_1` feature.
> 
> Eventually, we will probably raise the minimum supported version for the
> rust bindings and drop all the version gates before that.
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
>  bindings/rust/libgpiod/Cargo.toml            |  3 +++
>  bindings/rust/libgpiod/Makefile.am           |  2 +-
>  bindings/rust/libgpiod/README.md             | 13 +++++++++++++
>  bindings/rust/libgpiod/src/line_request.rs   |  2 ++
>  bindings/rust/libgpiod/tests/line_request.rs |  1 +
>  5 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
> index 3be4aa0..3fd1d74 100644
> --- a/bindings/rust/libgpiod/Cargo.toml
> +++ b/bindings/rust/libgpiod/Cargo.toml
> @@ -18,6 +18,9 @@ exclude = [
>      "Makefile.am",
>  ]
>  
> +[features]
> +vnext = []
> +
>  [dependencies]
>  errno = "0.2.8"
>  intmap = "2.0.0"
> diff --git a/bindings/rust/libgpiod/Makefile.am b/bindings/rust/libgpiod/Makefile.am
> index 92edbfc..619e36c 100644
> --- a/bindings/rust/libgpiod/Makefile.am
> +++ b/bindings/rust/libgpiod/Makefile.am
> @@ -8,7 +8,7 @@ command = SYSTEM_DEPS_LIBGPIOD_NO_PKG_CONFIG=1 \
>  		SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE="${PWD}/../../../lib/.libs/" \
>  		SYSTEM_DEPS_LIBGPIOD_LIB=gpiod \
>  		SYSTEM_DEPS_LIBGPIOD_INCLUDE="${PWD}/../../../include/"  \
> -		cargo build --release --lib
> +		cargo build --features=vnext --release --lib
>  
>  if WITH_TESTS
>  command += --tests
> diff --git a/bindings/rust/libgpiod/README.md b/bindings/rust/libgpiod/README.md
> index 8d514e7..c86b06e 100644
> --- a/bindings/rust/libgpiod/README.md
> +++ b/bindings/rust/libgpiod/README.md
> @@ -17,6 +17,19 @@ By default, `libgpiod-sys` builds against the libgpiod version identified via
>  `pkg-config`. See the `README.md` of `libgpiod-sys` for options to override
>  that.
>  
> +Currently at least libgpiod 2.0 is required with the default feature set.
> +
> +## Features
> +
> +The Rust bindings will usually be built against whatever libgpiod version a
> +system provides. Hence, only the functionality of the oldest supported libgpiod
> +C library will be exposed by default.
> +
> +Setting flags allows to increase the base version and export features of newer
> +versions:
> +
> +- `vnext`: The upcoming, still unreleased version of the C lib
> +
>  ## License
>  
>  This project is licensed under either of
> diff --git a/bindings/rust/libgpiod/src/line_request.rs b/bindings/rust/libgpiod/src/line_request.rs
> index 64ef05d..a7fe6d0 100644
> --- a/bindings/rust/libgpiod/src/line_request.rs
> +++ b/bindings/rust/libgpiod/src/line_request.rs
> @@ -2,6 +2,7 @@
>  // SPDX-FileCopyrightText: 2022 Linaro Ltd.
>  // SPDX-FileCopyrightText: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>  
> +#[cfg(feature = "vnext")]
>  use std::ffi::CStr;
>  use std::os::unix::prelude::AsRawFd;
>  use std::time::Duration;
> @@ -31,6 +32,7 @@ impl Request {
>      }
>  
>      /// Get the name of the chip this request was made on.
> +    #[cfg(feature = "vnext")]
>      pub fn chip_name(&self) -> Result<&str> {
>          // SAFETY: The `gpiod_line_request` is guaranteed to be live as long
>          // as `&self`
> diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
> index e0ae200..a936a1b 100644
> --- a/bindings/rust/libgpiod/tests/line_request.rs
> +++ b/bindings/rust/libgpiod/tests/line_request.rs
> @@ -60,6 +60,7 @@ mod line_request {
>          use super::*;
>  
>          #[test]
> +        #[cfg(feature = "vnext")]
>          fn chip_name() {
>              const GPIO: Offset = 2;
>              let mut config = TestConfig::new(NGPIO).unwrap();

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
