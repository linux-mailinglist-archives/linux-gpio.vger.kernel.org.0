Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA4B67B1311
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 08:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbjI1GdF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 02:33:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjI1GdB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 02:33:01 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BFE6198C
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 23:32:38 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c451541f23so101087275ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 23:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695882752; x=1696487552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lvM2BGnYB39M0eC5S5N7rZJlaqjpGhG4wUum+54+Ygk=;
        b=jF5aY7mjSmKkaE+GAWtsoNAxG4T1PzS9p6PtD/WITBN+VWFilkYDAhUd5n7Iz4jqsI
         8Fw3/0T7ih7KC4jv1mD/uMx08QfHgulJ0c6CDonL4zWk2Upab4trAfY4z8PiTDEni5zv
         3n+JhY9XsOoTVFD/Z7DJXpzNiW+cAYgwlH8ma11z1q0IdF0ULrVemmIQgLmt/M7aK1hg
         1mQC6VTKvbjhc8EqRFHHsuJDRLLyZBamxx8e64fgoFC+18dmT9RaUIXwZPMKAkOkAr1n
         HrAekbaFVdVYk+hYSXyGAJBMFs0dTJ5/nTHf5QjBqJOMuM3ctABKris6Y0zR5HYCNLX/
         277w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695882752; x=1696487552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvM2BGnYB39M0eC5S5N7rZJlaqjpGhG4wUum+54+Ygk=;
        b=F0bcxdkeEiAmQBPKD2sTz0m3TZ4JoXW4e1I8NmaIgsYomDna5WpGVY8Vd6WQSmIDnU
         y8NJkqdBGEp4kfvC7l7xx4gCHHcip47BBPI3Vb6aovZr2OXPG/tdkzvgeMKqVbYKGlRp
         5uW4qs6N/yLv//QxS65utCEhBtyTtE0tH/DIyClTAqB5ZnwUA4wd5Faus8c7QayU/ocC
         q4QY7t1q7987KTxa0Fb4F9rzPmQ3CcSV1NyCqqgxxY58nJXbXAoKkKH+bLN/Npc0j95d
         OuIUjzS1q2vf4DZ81A8w9Lx7sC/39HR4izM6FfiA5tR9PhGKLfvgDXv+6ppQ4Cb+aVGa
         XK6w==
X-Gm-Message-State: AOJu0YwnL5AEd9jBFN5XiPxIvtjwcBIx5jFWu3OMCkvd/HTVp+aKem0u
        q6zSMDdUjffWLcW27crfZ5zyS1cYQLMJrltV3D8=
X-Google-Smtp-Source: AGHT+IGfIejFyWVnvn3K7PiqI9s+7wSLqfmPNKJ0Y/ZuVGWZlBQhBJSt+wgrBwk5rrfJmEx01RxDHA==
X-Received: by 2002:a17:903:22c7:b0:1bf:3c10:1d70 with SMTP id y7-20020a17090322c700b001bf3c101d70mr342538plg.6.1695882752403;
        Wed, 27 Sep 2023 23:32:32 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id p7-20020a170902e74700b001bf6ea340b3sm14259251plf.116.2023.09.27.23.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 23:32:31 -0700 (PDT)
Date:   Thu, 28 Sep 2023 12:02:29 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH] bindings: rust: remove useless clone
Message-ID: <20230928063229.brukjawyq5vqobnv@vireshk-i7>
References: <20230928-useless-clone-v1-1-c512c3c6bf2f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928-useless-clone-v1-1-c512c3c6bf2f@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28-09-23, 08:23, Erik Schilling wrote:
> Reported by 1.74.0-nightly:
> 
>   warning: call to `.clone()` on a reference in this situation does nothing
>     --> libgpiod/tests/line_request.rs:71:44
>      |
>   71 |             let chip_name = sim.chip_name().clone();
>      |                                            ^^^^^^^^ help: remove this redundant call
>      |
>      = note: the type `str` does not implement `Clone`, so calling `clone` on `&str` copies the reference, which does not do anything and can be removed
>      = note: `#[warn(noop_method_call)]` on by default
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> Found while running nightly toolchains in order to run tests under the
> AddressSanitizers.
> 
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  bindings/rust/libgpiod/tests/line_request.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
> index 9af5226..da22bea 100644
> --- a/bindings/rust/libgpiod/tests/line_request.rs
> +++ b/bindings/rust/libgpiod/tests/line_request.rs
> @@ -68,7 +68,7 @@ mod line_request {
>  
>              let arc = config.sim();
>              let sim = arc.lock().unwrap();
> -            let chip_name = sim.chip_name().clone();
> +            let chip_name = sim.chip_name();
>  
>              assert_eq!(config.request().chip_name().unwrap(), chip_name);
>          }

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
