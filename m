Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFE9970EC94
	for <lists+linux-gpio@lfdr.de>; Wed, 24 May 2023 06:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237857AbjEXEgr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 May 2023 00:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238372AbjEXEgo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2023 00:36:44 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28FD1130
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 21:36:43 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-25374c9be49so499437a91.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 21:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684903002; x=1687495002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ge1jPcOgTyRe+BsoaCWAT/mhE3zDQKgD9WDmhGHJio=;
        b=Ai4KQ0fLozWKu0bXNq9WMiNSEYRr8mlud86c/AE7RigSac69HbSnf6Ut6nIwGVxQwQ
         CyDaIyz9Z7gavdmtflmUcD4Hz2qlP1C6gSUfVr3fS3A3gq3gc6EcBToYL2WjIZ3aOfyC
         bFtP37PrB378ZvPVsz0M5vYMMAOTfN7axKtx3+zov4d+Re/J6GzK1PQgIG2nUwtsLy3S
         XhDrzK3pV6clY53PIo90gktK+EFKq9JgI06lQuyROO/H+mLVWkXqJEg576KXmeFwGSPc
         E9AWhcV9sFLfnb0XZLGppTPlKdJFcKAdmQZjnR3muVKX4s0r6mveR0zD7uSZr7/AJ7Nt
         61DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684903002; x=1687495002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ge1jPcOgTyRe+BsoaCWAT/mhE3zDQKgD9WDmhGHJio=;
        b=Jcu6Ekb2LuaBscKy2tCOz0KQvbLSgcxHdKYVJ6JFIwXO4zvh05BIGOOBgoKYezpvEs
         dX+8fb9Al7MUjndPQZLON+/wJZa49tScrE9mNPxHUD/eO+YwHm256SCdwkt5RuNMNoAa
         JwXnYCQ66C7X5/k86D/3ZE8A9BbwpOUctTi1sdjb1RYgN67WxyvDZ9VY72cM/vxXkTAJ
         Ik9pJoceMTNPjWkCFMAJVqh/vjJjj5QBW8OQsnFuhpJ8l2qdniIASGkCaZRV6juEnCej
         dr1s41PV/lHyWtoQEyX9nYhgKoHyw1hCXxQ4y14ZMdrC+T+m1wuvsOR/O19ics7mUqM0
         5UlQ==
X-Gm-Message-State: AC+VfDzlcPfywkDTR/7M8FJBQJsZeGEcE9+mlnYxbWmivjKhaV0189dN
        MY+vYMfKtYHnvhdQDuw39s3x9g==
X-Google-Smtp-Source: ACHHUZ5R5dQB44gJCVXbh+I4Dcd7Sdmlfql42PPQw3lFQlQSq81x9+yTDPC+2zwn5yABZIKOrE2MmA==
X-Received: by 2002:a17:90a:71c2:b0:255:70e1:e41 with SMTP id m2-20020a17090a71c200b0025570e10e41mr7832295pjs.19.1684903002566;
        Tue, 23 May 2023 21:36:42 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00250cf4e7d25sm368698pjx.41.2023.05.23.21.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 21:36:42 -0700 (PDT)
Date:   Wed, 24 May 2023 10:06:39 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH libgpiod RFC 1/3] bindings: rust: drop legacy extern
 crate syntax
Message-ID: <20230524043639.5vaaqtutl4hniosf@vireshk-i7>
References: <20230522-crates-io-v1-0-42eeee775eb6@linaro.org>
 <20230522-crates-io-v1-1-42eeee775eb6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522-crates-io-v1-1-42eeee775eb6@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23-05-23, 13:25, Erik Schilling wrote:
> This is a relict from old Rust standards and no longer requires [1].
> 
> [1] https://doc.rust-lang.org/edition-guide/rust-2018/path-changes.html#no-more-extern-crate
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
>  bindings/rust/libgpiod-sys/build.rs | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/bindings/rust/libgpiod-sys/build.rs b/bindings/rust/libgpiod-sys/build.rs
> index e3ed04a..b1333f1 100644
> --- a/bindings/rust/libgpiod-sys/build.rs
> +++ b/bindings/rust/libgpiod-sys/build.rs
> @@ -2,8 +2,6 @@
>  // SPDX-FileCopyrightText: 2022 Linaro Ltd.
>  // SPDX-FileCopyrightTest: 2022 Viresh Kumar <viresh.kumar@linaro.org>
>  
> -extern crate bindgen;
> -
>  use std::env;
>  use std::path::PathBuf;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
