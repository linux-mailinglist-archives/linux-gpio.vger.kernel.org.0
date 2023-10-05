Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC417B9F9D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 16:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjJEOZz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 10:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232450AbjJEOXy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 10:23:54 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D851F7DA4
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 00:43:31 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c3bd829b86so5236265ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 00:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696491811; x=1697096611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2/YrcVNlUeeSIktLiIog7VdN95a8P8wpCwbQTnGb3mE=;
        b=xkbKMc4pIgm93SX3HWfWjv2Iorq/0bJiAkPXWH0bN8UXvRcRJPaVWO4tcZDdpmqkhZ
         34k2MouKPGMiM6tqDNaARFdIalHPRk6044dE/g/Dw4OeJnaIBG033dzc0HQ0dJU61rS4
         ZbXqjIIg7Cv/kbfZCeaV6gDIXRAauqIHCdpOrKTk7oHLD+roPP+RR8hOC9Ce5ZMp36Ln
         mQxnkSsezhpSsc2CCPXmqO2sSl5xB2HcHXyaN0gCrgwdHlXKEqcYRU8G+HkRhNRIcRP+
         RbkGDYpRlC3//IZeCMyG3ew/i9Abf3nKC1/9EPl+vCX83qxUWWdZKeZUPV+SeeK0NNhK
         PaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696491811; x=1697096611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/YrcVNlUeeSIktLiIog7VdN95a8P8wpCwbQTnGb3mE=;
        b=q3bxDjXsJJ63mA6Fl8wht/DOpAXlaR1nFZIi+FN6i5nWP4XoPDPVeJSI5onnw8HVif
         ZHlm3IzcpxcmSQdFUESb+7Mu7kfk59tRKB4zTNuzxp7ko7eyIbCDCODwY6bcLY7J8Gw0
         1WKNa24ATLhm2G0+50Cih15+uPFE0mTPb2eqdGtikkyVZFj7U6kBFJHAXrx4VtdeuejI
         QZMCKNovWttq4aTh8UsGIefmjAsdvU+lqDGLaFlGS9gu3lXNrqYGxh4nhpOhyViKDPeB
         WycgvkURL7FewPtgVel70kY5qBL6THTSPd5u04geI7Fu9H8dF9mnqDg+4GlJVHzplfrt
         xoIA==
X-Gm-Message-State: AOJu0Yys4BhbuonnfKfV4U3MO+242AekCVDIFHinw6Z1oxYAxVfR4Kqk
        CMkUC6y+qAJWjdFSXH1LyfDIsw==
X-Google-Smtp-Source: AGHT+IFz/JNIDfhhKk3WsXwEyYeKJinK757kLBRUNavSk7EVqdX5Y95w4TMa3OO4vEPYM561sMXV3w==
X-Received: by 2002:a17:902:e743:b0:1c3:2ee6:380d with SMTP id p3-20020a170902e74300b001c32ee6380dmr5723049plf.48.1696491811317;
        Thu, 05 Oct 2023 00:43:31 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id be8-20020a170902aa0800b001b9e9edbf43sm898830plb.171.2023.10.05.00.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 00:43:30 -0700 (PDT)
Date:   Thu, 5 Oct 2023 13:13:28 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>, brgl@bgdev.pl,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: rust: libgpiod: release 0.2.0
Message-ID: <20231005074328.4o75qfscxaawrxey@vireshk-i7>
References: <20231005-b4-rust-release-0_2_0-v1-1-0fab05c09962@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005-b4-rust-release-0_2_0-v1-1-0fab05c09962@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05-10-23, 09:42, Erik Schilling wrote:
> Since we had some (potentially-)breaking changes, we bump the major for
> the next release of the crate.
> 
> Note:
> I am using the term "major" as defined in the Rust SemVer compatibility
> guide [1], where the first non-zero digit is considered as "major".
> 
> [1] https://doc.rust-lang.org/cargo/reference/semver.html
> 
> Changelog:
> =========
> 
> (potentially-)breaking changes:
>   a29f3e6 (bindings: rust: rename {event,settings}_clone to try_clone, 2023-10-04)
>   b290348 (bindings: rust: fix soundness of line_info modeling, 2023-10-03)
>   d04639d (bindings: rust: bump MSRV to 1.60, 2023-06-16)
> 
> new functionality:
>   808d15e (bindings: rust: allow cloning line::InfoRef -> line::Info, 2023-10-03)
>   64aac85 (bindings: rust: mark all owning types as `Send`, 2023-09-28)
>   d12ce74 (bindings: rust: provide LineRequest::chip_name(), 2023-07-20)
>   53226d5 (bindings: rust: examples: add dedicated examples, 2023-06-14)
> 
> other changes:
>   0a570b6 (bindings: rust: drop unneeded Arc within Chip, 2023-09-27)
>   a97fe96 (bindings: rust: construct chip infos by reference, 2023-09-27)
>   27afa47 (bindings: rust: remove useless clone, 2023-09-28)
>   3f6e0bf (bindings: rust: add README.md for libgpiod crate, 2023-07-03)
>   4b8357b (bindings: rust: clippy: silence false-positive on iterator, 2023-06-30)
>   39189f0 (bindings: rust: clippy: drop unneeded conversions, 2023-06-30)
>   46115fd (bindings: rust: clippy: silence false-positives on casts, 2023-06-30)
>   901104e (bindings: rust: clippy: drop unnecessary casts, 2023-06-30)
>   46ecbe0 (rust: examples: file comment consistency, 2023-06-24)
>   aaed0f2 (bindings: rust: examples: replace tools examples with use case examples, 2023-06-23)
>   b37bd9e (bindings: rust: examples: consistency cleanup, 2023-06-23)
>   06c8ad9 (bindings: rust: package new examples in the distro tarball, 2023-06-15)
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> After merging a couple of important soundness fixes and threading API
> adjustments, I suggest doing a new release for the Rust bindings.
> 
> Once this is merged, I will publish the tree of this commit to
> https://crates.io/crates/libgpiod/.
> ---
>  bindings/rust/libgpiod/Cargo.toml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
> index 518e5e5..3be4aa0 100644
> --- a/bindings/rust/libgpiod/Cargo.toml
> +++ b/bindings/rust/libgpiod/Cargo.toml
> @@ -4,7 +4,7 @@
>  
>  [package]
>  name = "libgpiod"
> -version = "0.1.0"
> +version = "0.2.0"
>  authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
>  description = "libgpiod wrappers"
>  repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
