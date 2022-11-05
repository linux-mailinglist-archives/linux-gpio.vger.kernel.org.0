Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B81C061A694
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Nov 2022 02:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiKEBUT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Nov 2022 21:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiKEBUS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2022 21:20:18 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32772FC2D
        for <linux-gpio@vger.kernel.org>; Fri,  4 Nov 2022 18:20:16 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id l2so6354286pld.13
        for <linux-gpio@vger.kernel.org>; Fri, 04 Nov 2022 18:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sIQ6ZAD5DdxL4N7F/ZeN7UVJ7FaF/l2wPlbScebnqiA=;
        b=B2+xol/sGD/r75dfjdkYL5axCeLOiuUpnMZdSdAFL9Gq/bUd04aeRWUKoDtqwOotpo
         qywqaQab34AeCuC7J/kqy9E+8HlLdTNZOO5s5h1TmJQOZNH9r4vn+WGhJcqVaJOMrFOV
         9DgrffL8JWirSigg0i3zR7uQzF0o8PUlo2EJ9uBX8p8PtSzCzWY9ZzwTZXV14VvRmfAv
         zD2OBFIXd8L1A3OA0go+COlcyGVbroiQ0T6PhJha5T6QGj1Erw2wXIu17kzWFBoWHSW8
         pF6c2A+QqHRGQ2O2rZsdMqwTH1kAarYv5mLHqWVzNLOG2Gw7u3G24zshh0ZqVPBnTA/n
         0EeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIQ6ZAD5DdxL4N7F/ZeN7UVJ7FaF/l2wPlbScebnqiA=;
        b=Tv5p4meHoN8i+W+VcXv/41Nw5QRlzDDszvt8cCEaPm707Lj6f7WeRC8LNv1HcRcLUo
         71KcBBrzeiVlcNOpJbVBsirhf5t/yulcLB/i4iv6NWc/1X6kJJ38SXPNwdY9LTgRfi4H
         1oDqRC/20vmJDfkIEOIJ1tB94DLGCyVwCuy5+zHbZ8qfNyyNy9DRydDzFOmg+RHSHn5w
         D8uh+zlH89ZYohrI1Pj92xAMg0HZgTyQJ3ZDegjrkXhgxDjIyQGTvYS7FTr1n0xaU2Wa
         RILD94OCRD/gBE0Ko0TsnkPqytUnVw90J5TA/0c3j28MuAt0wNgtxK7HsrPFVfsipgg3
         SjpA==
X-Gm-Message-State: ACrzQf1ghlAPQ6cnbydvqZc7TOZcipb674blynui6TQ20GhWF+dpgCeA
        OSPxtNtnczkccoq/qthWYSo=
X-Google-Smtp-Source: AMsMyM4x4yoAuTdtxggNJGcvVGAfBxs4LvTzbGykz9YK+Nhl6fq2+FTjrja6waXTI5kuZ0xm49r9Kg==
X-Received: by 2002:a17:90a:b011:b0:213:473e:6fe1 with SMTP id x17-20020a17090ab01100b00213473e6fe1mr39506079pjq.229.1667611216139;
        Fri, 04 Nov 2022 18:20:16 -0700 (PDT)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id q23-20020a170902bd9700b001784a45511asm367268pls.79.2022.11.04.18.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 18:20:15 -0700 (PDT)
Date:   Sat, 5 Nov 2022 09:20:08 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
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
Subject: Re: [libgpiod v2][PATCH V8 9/9] bindings: rust: Implement iterator
 for edge events
Message-ID: <Y2W6SKeYNBq7nOTD@sol>
References: <cover.1667215380.git.viresh.kumar@linaro.org>
 <4082a496a1da3e3c11b08a360f5ba7f7d70f9719.1667215380.git.viresh.kumar@linaro.org>
 <Y2JtqgmRu9fYXiag@sol>
 <20221104113147.rm6psaajhj73k45k@vireshk-i7>
 <Y2UGf7UkNuCtjpBN@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2UGf7UkNuCtjpBN@sol>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 04, 2022 at 08:33:03PM +0800, Kent Gibson wrote:
> On Fri, Nov 04, 2022 at 05:01:47PM +0530, Viresh Kumar wrote:
> > On 02-11-22, 21:16, Kent Gibson wrote:
> > > It is generally frowned upon to patch your own patch within the same
> > > series, so drop the Suggested-by and squash this into patch 5.
> > > In this instance it is very handy for reviewing though, as the other
> > > patches look pretty clean to me...
> > 
> > I kept it separately for exactly this reason, I was planning to merge it
> > eventually with the other commits.
> > 
> > > > +pub struct Events<'a> {
> > > > +    buffer: &'a mut Buffer,
> > > > +    events: Vec<&'a Event>,
> > > > +    index: usize,
> > > > +}
> > > > +
> > > 
> > > Events is pub but not documented.
> > > 
> > > The events attribute is expensive - requiring a dynamic allocation for
> > > each snapshot.  And you create it unsized and push into it, which could
> > > require resizing and reallocation.
> > > And it is unnecessary - just have Events iterate over the appropriate
> > > indicies and get the ref from the buffer.
> > 
> > I had to do it this way as I wasn't able to get around an error I think. I
> > updated the code now based on suggestions, in my v9 branch, and I get it again:
> > 
> > error: lifetime may not live long enough
> >   --> libgpiod/src/event_buffer.rs:51:9
> >    |
> > 45 | impl<'a> Iterator for Events<'a> {
> >    |      -- lifetime `'a` defined here
> > ...
> > 48 |     fn next(&mut self) -> Option<Self::Item> {
> >    |             - let's call the lifetime of this reference `'1`
> > ...
> > 51 |         event
> >    |         ^^^^^ associated function was supposed to return data with lifetime `'a` but it is returning data with lifetime `'1`
> > 
> > error: could not compile `libgpiod` due to previous error
> > 
> > I will try to fix this on Monday now, unless you have an answer for me by then
> > :)
> 
> 
>      /// Read an event stored in the buffer.
> -    fn event(&mut self, index: usize) -> Result<&Event> {
> +    fn event<'a>(&mut self, index: usize) -> Result<&'a Event> {
>          if self.events[index].is_null() {
>              // SAFETY: The `gpiod_edge_event` returned by libgpiod is guaranteed to live as long
>              // as the `struct Event`.
> 
> There are still other things that need to be fixed after that, but that
> fixes that particular problem.
> 

I fixed up the other things (handling the iterator returning a Result,
by either unwrapping or flattening as appropriate) in my rust_v9
branch[1].  Also changed Event to a newtype, to remove any possibility
that the struct form could have different memory layout or alignment than
the underlying raw pointer.

That works for me.  Note that the flatten will skip over errors, so
might not be what you want in practice, but my primary interest was to
get everything compiling and the tests passing.

Cheers,
Kent.


[1]https://github.com/warthog618/libgpiod/tree/rust_v9
