Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04E9F7E353C
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Nov 2023 07:32:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbjKGGcH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Nov 2023 01:32:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbjKGGcG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Nov 2023 01:32:06 -0500
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00E5135
        for <linux-gpio@vger.kernel.org>; Mon,  6 Nov 2023 22:32:01 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7c011e113so64941357b3.1
        for <linux-gpio@vger.kernel.org>; Mon, 06 Nov 2023 22:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699338721; x=1699943521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rom40hLaU2d2VJi0lLjD2JYQH0J9wpAgI6ApPaky+NQ=;
        b=RIumz+ctHO67Bn9IWp4zJ2znBqd02iVJw1wMjWsdmPAsgG+I99C+Bz2kaVgnnLbpyt
         yfUYbVPKbQcnuhMEGSRnE01oNbUzGLe4GHnwIBNvCwi7pNEbNfGbYECvMRFjMv75Vs/1
         wKQrOYrE582UufVOS2obeghb8bMd41efhwsEKI4tqMCEVhI96iZUh3sox5uuWBq11xoe
         zZ5AgzYUBzpGx36tothZfrmRxNCc8Ex30kLOQnO38k2SYapsEZ5xbv3QAZKB+hcdXrh9
         dVfrKfPzsQADGXVshB2MYfgxBnEr9n8xZzOQPHLZ1bldHFj4yPRXLtm9YA74PjlBmBQ4
         srfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699338721; x=1699943521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rom40hLaU2d2VJi0lLjD2JYQH0J9wpAgI6ApPaky+NQ=;
        b=XOi9yHUuw+Rz9AL73WiFJZB4UwQhTh71wKOjWUg0ilgoNTcNK9Gtx1PNV7Ni380CG6
         pBKituIubBXKT8ISJDVWcVoqf6zc/nR65ynWlfIZrgu1CVmh6DGy0LbRczL9mmpJdxCA
         Df/DMAbFILsw3IwMuRtgf8hvDQENRclVbspgm0Bh9ukQnUNCAv9/l4QuaDUPBfhj7x0A
         AJx5AmSRQ4LU/ZPyyDLnkqmR4CgIGoyy8mrnwPks9bLN+R34/IoZr8uMUzpX+tAqyEWN
         +8kqs57XgnONHjyGlxeUVcus3/Wld8LY3Xl+UEXbgemGXg9HIXM28F24Z2lmJHqOlnbg
         f8Xg==
X-Gm-Message-State: AOJu0Yyd5aiRcSoMQCDTBzGiNlx8/bXzrRDFmN/QJBfRvgEWwfCTvQ4y
        Zj9k05aNhH/ur4LR3vyhBkX2Tw==
X-Google-Smtp-Source: AGHT+IH10O4yAySanXwRiaSxrRnswBFHQh3Uw4gE/Hr/Ys2rbiE9tK7L32T762Z6O0WdvtvdzElIhQ==
X-Received: by 2002:a25:ce8c:0:b0:da0:37c8:9f00 with SMTP id x134-20020a25ce8c000000b00da037c89f00mr29999915ybe.36.1699338720920;
        Mon, 06 Nov 2023 22:32:00 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id l5-20020a056a00140500b0068fb783d0c6sm6719244pfu.141.2023.11.06.22.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 22:32:00 -0800 (PST)
Date:   Tue, 7 Nov 2023 12:01:58 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH] bindings: rust: expose v2.1 features as flag
Message-ID: <20231107063158.w4ujcbmw5ok3uax6@vireshk-i7>
References: <20231106-rust-bindings-v2_1-v1-1-d90b785a06c0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106-rust-bindings-v2_1-v1-1-d90b785a06c0@linaro.org>
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06-11-23, 13:53, Erik Schilling wrote:
> v2.1 provided a getter to read the chip name from a request.
> 
> This adds v2_1 as feature in order to raise the minimum requested version
> to v2.1 for exposing the new API.
> 
> This is identical to the concept patch that was posted [1] when this
> feature flag mechanism was proposed. Only the commit message was
> reworded.
> 
> [1] https://lore.kernel.org/all/20231006-b4-bindings-old-version-fix-v1-2-a65f431afb97@linaro.org/
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> ---
> With v2.1 being released, I am updating feature flags as previously
> sketched.
> 
> To: Bartosz Golaszewski <brgl@bgdev.pl>
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Cc: Kent Gibson <warthog618@gmail.com>
> Cc: Erik Schilling <erik.schilling@linaro.org>
> ---
>  bindings/rust/libgpiod-sys/Cargo.toml        | 9 +++++++--
>  bindings/rust/libgpiod/Cargo.toml            | 3 ++-
>  bindings/rust/libgpiod/README.md             | 1 +
>  bindings/rust/libgpiod/src/line_request.rs   | 4 ++--
>  bindings/rust/libgpiod/tests/line_request.rs | 2 +-
>  5 files changed, 13 insertions(+), 6 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
