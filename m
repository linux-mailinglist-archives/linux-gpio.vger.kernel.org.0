Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6276A6334B8
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Nov 2022 06:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbiKVFfr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Nov 2022 00:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiKVFfq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2022 00:35:46 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2890E1D65D
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 21:35:45 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id a1-20020a17090abe0100b00218a7df7789so5249133pjs.5
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 21:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=348ouHLj47BMFULbcABIuOYNiiaGeZXqC5ngIBnXQ2Q=;
        b=q3wTLVzmz9hxj7LZ4vtOmLGwZpPAA7OEf6MG6E3V6qVhMPR52bUVXrYXFs2ru+sTRd
         hfE8kDEUBOWkw5Sa6Dvp5gQ1M0okUm2pgOUqp9jXkgKcyBFcjx/RB8nJbvPR1Th/cSy8
         Gw3EJTgOI+FLp2qP+60q5zqoe1TWPTESjpR8Sh3MXppJMxE5aF/dECgZuOsfvC1mhVps
         kboPIf+Npw0kVNW/ScUY3JuA5pSmOMRGcn4cMF5Apy+NaAVSdQDCVpMozjfNBz3HfTiK
         uxh7W+bCFMbCfoDK96idZTdCVSFAqLGv3s2vYerVST4WMMzhLUUrsKh4nI8IYHE+ZW5n
         WPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=348ouHLj47BMFULbcABIuOYNiiaGeZXqC5ngIBnXQ2Q=;
        b=pVlw/j7Z47HOYGRGa/7qcQ7wFeMW7oot22IE0egF1deMiFj4aWrANHtKq+h6qxEJq3
         CL3ONRHBLAZhKkzrHNGAxIavHYnpKv5fKIhwJc0VbJN6bimBYrEltJ/iVizD/CNcISfp
         muvISsBPa+B1x4WQpyFxinVNgLlEztesDHtCGMLJnN8QDsxWURu+CWKBdKZshKELzOPK
         DkHlXxIRoxGbLj6GUbaQOluO7GJLRJTkNLyrnC1TPcbT/0+N1dbwRw1TX8xkqr9qYotc
         blXWnn37VEUZjCWQjyGQQmZQYi5c3tMWBjXurRzU2br9WaIiyLMDpUUIFXHZHLwl76aY
         OW2g==
X-Gm-Message-State: ANoB5plMClwouiekbbF1cO/hVc6v87uceOHQdyAFT3vtCnmZz/nPcG4E
        uNIXp0cJDB/bvZdzK2u6A7leYXFUPYgLUQ==
X-Google-Smtp-Source: AA0mqf5GPKMitIX0oNqF0VA3NCGAB4yv+YMADPOR4Ullvgv7qTRdMthm54RozbcZxyGpQU/1sGaO0w==
X-Received: by 2002:a17:90a:eac9:b0:218:b997:c412 with SMTP id ev9-20020a17090aeac900b00218b997c412mr7049353pjb.124.1669095344664;
        Mon, 21 Nov 2022 21:35:44 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id u9-20020a170902714900b00186f608c543sm10626579plm.304.2022.11.21.21.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 21:35:42 -0800 (PST)
Date:   Tue, 22 Nov 2022 11:05:40 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V10 2/6] bindings: rust: Add libgpiod crate
Message-ID: <20221122053540.lny5ogvxtfvky4do@vireshk-i7>
References: <cover.1668768040.git.viresh.kumar@linaro.org>
 <daa3021e4c148d33a8d50c54841719082836c43a.1668768040.git.viresh.kumar@linaro.org>
 <CAMRc=MeXTD10OVZzp2zGTR6Vs2PXemzkrvpBqFE=YojS9mrMPw@mail.gmail.com>
 <20221122043831.hemnrbyily25rhhk@vireshk-i7>
 <Y3xZgDch57EyTr9x@sol>
 <20221122051541.j54z6ix6ojhzilut@vireshk-i7>
 <Y3xebr68RT7JvLDJ@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3xebr68RT7JvLDJ@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 22-11-22, 13:30, Kent Gibson wrote:
> It is safe to assume the libgpiod-sys version is tied to the libgpiod
> crate version?

I think so.

-- 
viresh
