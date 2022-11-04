Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6517A619564
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Nov 2022 12:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiKDLc5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Nov 2022 07:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbiKDLb4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2022 07:31:56 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0EB22CCAA
        for <linux-gpio@vger.kernel.org>; Fri,  4 Nov 2022 04:31:51 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso4355779pjc.2
        for <linux-gpio@vger.kernel.org>; Fri, 04 Nov 2022 04:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0MXoj4rmodRz0GW1tmbXHzjFMjBxECfk4KqzlzUQIkQ=;
        b=JvMxZxwU04oxon6g6ifM7e92a+Tm58XdLRO3RVhmGUIFbJWqRKLvdDkev80Ey/oh1Z
         6IStMKpc2Pj1y2ZmWBdpJGO9L4fhAf3RMJNenqPnPrJbsDq8h4YNB8WwydZgOVlXPXvD
         gtoCdh72Q5Ut1Ae6G3hOKUCELJAMfw6ri6fu68JVW3SnJE7v0E+gX37nGlXk3SZmSpl5
         3EbpxzPu5SHKX7u0+yWnvrR8z7QO9L/tTm1GW1nkLjWmcp1WbrTBop7vZpYn+06IMGni
         9tpfnjrW363mzcvP0EH3Z1xKW+FxFRvAosgWagGhVdhhMIysQrfX/H2X22Y+aqDlFyqD
         8F4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MXoj4rmodRz0GW1tmbXHzjFMjBxECfk4KqzlzUQIkQ=;
        b=mRvJD5mk52DuDU+By8KhJIyRDqYpyI1zxBiYZyFf9lYSLHLpeb56Q86jpYkjt7RKs6
         wbLcU4kgirVdowIPELFd09MiieGEEmICs93zLR7ahi5aWnc8yOXod4ru6OREUmPRiMdi
         zk9W5M6Cu8ceVbjkShcbrHFCGgd1XvLCVyM+HVn01kOUoWpNya7gD6iooWn9lepuJ5bA
         W1cNXO86Oq2qka92KhwYs/wxsOrwidlVBKRYSpWRbuOK9ZB6pnRV9/cK1Z5FxQ4KtUL2
         Fq3kcpgkvjb6KzPTskksFC9CuWv5//m1kXn6IEmb0++bs/qcSJm1KDe1rRBQDJ16K0r3
         T4GA==
X-Gm-Message-State: ACrzQf3KVdwKz7aCplnL9JABTq3Q8MkA75QS0LTwkLD+VvZPfhMAhZoJ
        4iupCAmUUDPzQcmp4NHB//LzIQ==
X-Google-Smtp-Source: AMsMyM7TVbDJMozLIe2SuFFyf467J1zuqe9Mtq2LR7wgOlzGsU6jrljOtjJPl0K5WEj4cOPQuzVSCQ==
X-Received: by 2002:a17:902:e74f:b0:186:a962:8f92 with SMTP id p15-20020a170902e74f00b00186a9628f92mr35660315plf.41.1667561511299;
        Fri, 04 Nov 2022 04:31:51 -0700 (PDT)
Received: from localhost ([122.172.84.80])
        by smtp.gmail.com with ESMTPSA id g7-20020a63dd47000000b0046ff7db0984sm2210093pgj.72.2022.11.04.04.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 04:31:50 -0700 (PDT)
Date:   Fri, 4 Nov 2022 17:01:47 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
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
Subject: Re: [libgpiod v2][PATCH V8 9/9] bindings: rust: Implement iterator
 for edge events
Message-ID: <20221104113147.rm6psaajhj73k45k@vireshk-i7>
References: <cover.1667215380.git.viresh.kumar@linaro.org>
 <4082a496a1da3e3c11b08a360f5ba7f7d70f9719.1667215380.git.viresh.kumar@linaro.org>
 <Y2JtqgmRu9fYXiag@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2JtqgmRu9fYXiag@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02-11-22, 21:16, Kent Gibson wrote:
> It is generally frowned upon to patch your own patch within the same
> series, so drop the Suggested-by and squash this into patch 5.
> In this instance it is very handy for reviewing though, as the other
> patches look pretty clean to me...

I kept it separately for exactly this reason, I was planning to merge it
eventually with the other commits.

> > +pub struct Events<'a> {
> > +    buffer: &'a mut Buffer,
> > +    events: Vec<&'a Event>,
> > +    index: usize,
> > +}
> > +
> 
> Events is pub but not documented.
> 
> The events attribute is expensive - requiring a dynamic allocation for
> each snapshot.  And you create it unsized and push into it, which could
> require resizing and reallocation.
> And it is unnecessary - just have Events iterate over the appropriate
> indicies and get the ref from the buffer.

I had to do it this way as I wasn't able to get around an error I think. I
updated the code now based on suggestions, in my v9 branch, and I get it again:

error: lifetime may not live long enough
  --> libgpiod/src/event_buffer.rs:51:9
   |
45 | impl<'a> Iterator for Events<'a> {
   |      -- lifetime `'a` defined here
...
48 |     fn next(&mut self) -> Option<Self::Item> {
   |             - let's call the lifetime of this reference `'1`
...
51 |         event
   |         ^^^^^ associated function was supposed to return data with lifetime `'a` but it is returning data with lifetime `'1`

error: could not compile `libgpiod` due to previous error

I will try to fix this on Monday now, unless you have an answer for me by then
:)

Thanks.

-- 
viresh
