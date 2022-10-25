Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF08760C3EC
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Oct 2022 08:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiJYGmp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Oct 2022 02:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbiJYGmp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2022 02:42:45 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D8A12B372
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 23:42:43 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id e4so7058465pfl.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2022 23:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9aGMzGKPqBEVfIrLOGqtLUQbc8wTlRZwKKRv3h/uh1Y=;
        b=ipEm13RKu+FU/EZ9zy/204g6kwYWZqCP+48bQzuo+m6iaFz38Jj9pnTLuf+UpD2auX
         LvuloFnQB+utXMBDD4/Pmbeli11nmOyIfqA3BHzGPBmwV8LrmrMHLuTXnU3WKeMLWiuZ
         M93kzoCUVM+1KmJlJHcyqOqJq7L732N7Trkmf30YrjH0VbI6WzeBPK/0kifMNvjfgOZV
         wqIvqlIFqBARzi6djwf66XppkYOsfR9U+kghXq0zFlTxaTPI1vMAA1o/aKxx/uccEXlA
         YBbaxpUixOJ9o3oH0elh5FfZKrXwBZ3qeK+ADoTtCrFxg9zhuh0lbHoG5n3FZZbALSwi
         LLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9aGMzGKPqBEVfIrLOGqtLUQbc8wTlRZwKKRv3h/uh1Y=;
        b=WUH8tZQijLZPQDEPAkBN9ULeyD16rjXcR5jqz8Y7QZfinLHH2uD6e+Qru6xNmXgT/J
         CfFWLH+fIlmxtetCqeY3FUQ+njTuO2m+5h2UFlqh0ZU632cEUjihTfjku9KU4wsLrDrI
         WWu4RyPD+mMhIjI4NvLN0935xOrkup5MmSBwZNVZhMv6g3JDSykqQRKk63fhLjcrBCAv
         FoXLhDY0hWea/JYQBhZ7Y6QSbREX6MnIiNw6PBuudfyR+L1HqBfLf8Bo/rH2YmjIrlhl
         bvwxWudFayVnMF0GoF0QO0BthTZdTvSd5Jj54GU7bZoldS1eiZDnnz4lMsSCNPIouRpY
         SYvw==
X-Gm-Message-State: ACrzQf1u21B2pREnrRnlTwCqXAInY7jtZtzL+rXXIaaGPCCph0c8WU9i
        ixoXmj9HD357sBo2fENskbcizg==
X-Google-Smtp-Source: AMsMyM7XKTnPZLk1ltK1txuOieZm4DyuzW13v8kEpz0kVAZOF3xAM8cofabFFIkokDYzjl/1V8L0+g==
X-Received: by 2002:a63:1748:0:b0:46f:18be:4880 with SMTP id 8-20020a631748000000b0046f18be4880mr5444319pgx.128.1666680162496;
        Mon, 24 Oct 2022 23:42:42 -0700 (PDT)
Received: from localhost ([122.172.87.26])
        by smtp.gmail.com with ESMTPSA id p6-20020a17090a748600b002130c269b6fsm799623pjk.1.2022.10.24.23.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 23:42:41 -0700 (PDT)
Date:   Tue, 25 Oct 2022 12:12:39 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [PATCH V7 0/8] libgpiod: Add Rust bindings
Message-ID: <20221025064239.6dazljljxlprhqus@vireshk-i7>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <CANiq72m_9RK7viLpaREMGiMLuWs9m1oy9N78ok1d7uzC+18zNg@mail.gmail.com>
 <F4hN01T_BkoMFY7LNhQlmQPrXGv3a2byhEuDLleJfpWlfF98Dopa2FPrl4JDEoER8y7bN41KMkmWqM50YAIBK0BowT_9skmLKY8gsqYEJBc=@protonmail.com>
 <20221021093911.vj5todjdfqptdy7d@vireshk-i7>
 <YsZTLXUUjsBT-SzPWsI4ppoDBT_lGn0yfhF2r-5wfqcYxxeWWcdL2yIUcMMBmMTB-TjVUZkSqpMsvWNKTcSwoun5wzT4bbPi-ijZXUt8HWM=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsZTLXUUjsBT-SzPWsI4ppoDBT_lGn0yfhF2r-5wfqcYxxeWWcdL2yIUcMMBmMTB-TjVUZkSqpMsvWNKTcSwoun5wzT4bbPi-ijZXUt8HWM=@protonmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21-10-22, 14:34, Björn Roy Baron wrote:
> > impl<'b> Event<'b> {
> > 
> > /// Get an event stored in the buffer.
> > - pub(crate) fn new(buffer: &'b Buffer, index: usize) -> Result<Self> {
> > 
> > + pub(crate) fn new(buffer: &'b Buffer, index: usize) -> Result<Event<'b>> {
> 
> This looks good to me.
 
> > +impl<'e, 'b> Event<'e> {
> > 
> > + pub fn event_clone(event: &Event<'b>) -> Result<Event<'e>>
> > 
> > + where
> > + 'e: 'b,
> 
> Using `Event<'b>` on both sides should work fine. `Event` is
> covariant in it's lifetime parameter, so `Event<'b>` can be turned
> into `Event<'e>` with `'e` being a shorter lifetime than `'b`. What
> you wrote here is not incorrect, so if you prefer keeping it this
> way that is fine with me.

That doesn't let the cloned event to live past read_edge_events().

error[E0502]: cannot borrow `buffer` as mutable because it is also borrowed as immutable
  --> libgpiod/examples/gpio_events.rs:70:50
   |
64 |             let event = buffer.event(0)?;
   |                         --------------- immutable borrow occurs here
...
70 |             let count = request.read_edge_events(&mut buffer)?;
   |                                                  ^^^^^^^^^^^ mutable borrow occurs here
...
86 |         }
   |         - immutable borrow might be used here, when `cloned_event` is dropped and runs the `Drop` code for type `libgpiod::request::Event`

-- 
viresh
