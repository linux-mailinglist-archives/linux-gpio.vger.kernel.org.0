Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC2D17BF3F4
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Oct 2023 09:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442399AbjJJHTl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 03:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442394AbjJJHTk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 03:19:40 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBA59F
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 00:19:39 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-694ed84c981so3962480b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 00:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696922379; x=1697527179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cNHBNfq3o21Si69DWsWsB2/KfUx6L6L3vxXD0bYQTxk=;
        b=cWuyQ9F9ABSwWmsj55+Qfbza+ax07e3f+xAIR9qUTXlkxL4URtDATak6LFyNQO4RZb
         W30PYqmKSiaAAk1yvv+a4iT/XdbGswSLvqu4ZkYmcfs3QotPlVnedEomuBzN24YYetyD
         tef3zN8SCt+h9Cm5kp1jZUBv0nymXnuzw8cQdD5qaJCyYYIlQh9XRzSLVYxNpoqgJBzm
         hIaHfhxru87rcgvxGe2NpyEsjGU76hFOrsa8q3V/yuV5KKFa+dwi0yhuBmYMnoX49CxI
         /FOSHvebwAjEblFruLPp3hu7XYJSLa3yfWUm9/vwde5xAykwkoihuXf8esxXxwhhS2YR
         xOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696922379; x=1697527179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNHBNfq3o21Si69DWsWsB2/KfUx6L6L3vxXD0bYQTxk=;
        b=Gg1Itl1TmFXgyFQjp982tYCfNh2V51DSP4YFJ5kKc3aYy/rkD0IArwDDVQjfiANZIv
         hYCXhIGMxuzheuqkwsC2dsqfNqIrCcpmQbVJnnTl/4xeIOy26HQd6In0Png10iJ1/CI+
         SR5ULB1U/vcjqjhspDltDAXz9vVadrJ9S82qwloNLu51UWUcbq1pu3zPfI2MFsmkp/rD
         ktxHYio8+2k5nyZBhssOxyHBCshqvhat6RoGlNaP8Y0GmYPg/JWQX+VLHVY8DQenUH5t
         ihNDphfVbEIJr1tbbzubeMg6XSQa0dbI6tNx6a7BRKS339kMOrurpwffzVxZBh4nyJAZ
         8kDg==
X-Gm-Message-State: AOJu0Yw2q4vGfiLjwnCfXYPZgtQ61a+K1pw+terqxXaQCsTm4Y9BM6Ja
        Dvz6nvrbWQKkVuTJczFoVVGL5w==
X-Google-Smtp-Source: AGHT+IHDQXnE00YIOmoxJxjoikvosk5hesOwGiw7Ti+Qf7dphe4m7/ZWlJN76+NRqupB3TygLmEJmA==
X-Received: by 2002:a05:6a21:47c7:b0:171:a8bc:74bc with SMTP id as7-20020a056a2147c700b00171a8bc74bcmr1307231pzc.11.1696922379013;
        Tue, 10 Oct 2023 00:19:39 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id fm22-20020a056a002f9600b0068878437b9dsm7530276pfb.50.2023.10.10.00.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 00:19:38 -0700 (PDT)
Date:   Tue, 10 Oct 2023 12:49:36 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [libgpiod][PATCH] bindings: rust: libgpiod: release 0.2.1
Message-ID: <20231010071936.a3swbv4nbaydqjxb@vireshk-i7>
References: <20231010-b4-libgpiod-0-2-1-v1-1-291cb0cd23d4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010-b4-libgpiod-0-2-1-v1-1-291cb0cd23d4@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10-10-23, 09:13, Erik Schilling wrote:
> While the release technically removes a function, that function was not
> available in any released libgpiod version. Therefore, this only bumps
> the minor.
> 
> This release fixes building with releases from the 2.x series of the C
> lib.
> 
> Changelog:
> =========
> 
> acebcf2 (bindings: rust: feature gate unreleased features, 2023-10-06)
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Same as last release: Once this is merged, I will publish a new release
> of the crate to crates.io.
> ---
>  bindings/rust/libgpiod/Cargo.toml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/bindings/rust/libgpiod/Cargo.toml b/bindings/rust/libgpiod/Cargo.toml
> index 3fd1d74..3ce05df 100644
> --- a/bindings/rust/libgpiod/Cargo.toml
> +++ b/bindings/rust/libgpiod/Cargo.toml
> @@ -4,7 +4,7 @@
>  
>  [package]
>  name = "libgpiod"
> -version = "0.2.0"
> +version = "0.2.1"
>  authors = ["Viresh Kumar <viresh.kumar@linaro.org>"]
>  description = "libgpiod wrappers"
>  repository = "https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git"

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
