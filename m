Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04CDD6334B2
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Nov 2022 06:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbiKVFag (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Nov 2022 00:30:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiKVFae (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2022 00:30:34 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16C62ED68
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 21:30:32 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id t17so11649449pjo.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 21:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPzxAjYEiI7hhzaW0Ox+0T39GOnV3tSyiaCgFEJREWA=;
        b=EnbEhUrhGgw3yh9MmFzwT5AyA4w28pgAc+BNXj0N3N4q864nUapI2r1P9AWKZw5Cxk
         2TRkQxyFE8wAkIcUrsWZhU3uEAmEIyQrJmjUKVU7WPDAJOqPlrLk/R+FU1UTCknGde99
         FxkQF/UAzYj4bJrMj4/hIuC5c69eTN7DlpOUOHKSGXoC0wHXeLvVIcN2P1B2U32+ocG0
         2IONHyNszcaiw+oZgzUIZOzRyjfp2iJML5X0a/qd9/TYSt59zoDIclBOoyVpaE627Wyd
         M+stTzD3NCSqvus0zactGmAsJ8C1rEmu35H2lLcGxSps6J/mtch1cbcpfo6IYvampoYo
         /IzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPzxAjYEiI7hhzaW0Ox+0T39GOnV3tSyiaCgFEJREWA=;
        b=uieSAetTBP2Ik1Jbk4OxMsV8so+KPPE1xfaolGzU42Xhr0Ngju+Pzw6YQj5q3TIIA/
         xlguHnGFUGuyLWwLE2rs9MfGVIESxNttlxFOVvy5xzFoA6Piwx32LxMmCniAmt7Pk1qH
         HHklPhxWD5uAAMffKbgsvJgppA4ZXKg+5ledBpeu7LfWoXzov2/dBrjAuTLQIPeMhZBW
         EMQLJrkSNcAKFf8D3XAJBH6TTS6BsiXoih5udb4ZTSxREtyy0NF+RDQ5k+3qWm/zFWkO
         1iHX2SZm/292KNdRW3ynqN30+9Ln1G5BGp7I432zZHlRVlliZweJ6gJwQ6kLWZTigFmR
         +TIQ==
X-Gm-Message-State: ANoB5pkujf+apMeJhViaFdpmnaybhvZD/h/TbUBuH7mJQV6zwamw+5n8
        T3RwQCU3RYOptv+dGQa+rGM=
X-Google-Smtp-Source: AA0mqf72td0s9t+NVHQ/RSvvBQLFaDJTszMv8LU0a4yj4AzyFCxewpM3lNYZDW6CfYXEgc3M6JlL2g==
X-Received: by 2002:a17:90a:ce96:b0:218:c5fb:7890 with SMTP id g22-20020a17090ace9600b00218c5fb7890mr4370190pju.186.1669095031494;
        Mon, 21 Nov 2022 21:30:31 -0800 (PST)
Received: from sol (110-174-14-241.tpgi.com.au. [110.174.14.241])
        by smtp.gmail.com with ESMTPSA id j7-20020a17090a7e8700b0020dc318a43esm8766940pjl.25.2022.11.21.21.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 21:30:30 -0800 (PST)
Date:   Tue, 22 Nov 2022 13:30:22 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V10 2/6] bindings: rust: Add libgpiod crate
Message-ID: <Y3xebr68RT7JvLDJ@sol>
References: <cover.1668768040.git.viresh.kumar@linaro.org>
 <daa3021e4c148d33a8d50c54841719082836c43a.1668768040.git.viresh.kumar@linaro.org>
 <CAMRc=MeXTD10OVZzp2zGTR6Vs2PXemzkrvpBqFE=YojS9mrMPw@mail.gmail.com>
 <20221122043831.hemnrbyily25rhhk@vireshk-i7>
 <Y3xZgDch57EyTr9x@sol>
 <20221122051541.j54z6ix6ojhzilut@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122051541.j54z6ix6ojhzilut@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 22, 2022 at 10:45:41AM +0530, Viresh Kumar wrote:
> On 22-11-22, 13:09, Kent Gibson wrote:
> > Which is a library that reads the envvars set by Cargo at compile time,
> > so you could also just
> > 
> > const VERSION: &'static str = env!("CARGO_PKG_VERSION");
> > 
> > and provide a function that returns that.
> 
> Right, this is what we are doing currently:
> 
> /// Get the API version of the libgpiod crate as a human-readable string.
> pub fn crate_version() -> &'static str {
>     env!("CARGO_PKG_VERSION")
> }
> 

Which is already the standard way, so not sure how the discussion took
the path it did, but anyway...

It is safe to assume the libgpiod-sys version is tied to the libgpiod
crate version?

Cheers,
Kent.



