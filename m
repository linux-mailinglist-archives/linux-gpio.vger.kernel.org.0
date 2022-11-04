Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF3561963E
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Nov 2022 13:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbiKDMdO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Nov 2022 08:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbiKDMdN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2022 08:33:13 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363B82D75C
        for <linux-gpio@vger.kernel.org>; Fri,  4 Nov 2022 05:33:12 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id r18so4232396pgr.12
        for <linux-gpio@vger.kernel.org>; Fri, 04 Nov 2022 05:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U7fU/VKzcvy/KHYqcL+noffgaFe5zWIGYwpxdwunhP4=;
        b=bDJGBlApd5cFDrEB1Tra/2VNpeNMHEK7Fcn9kIr+sGVK8tmivaFLKztHCUHCNpC50R
         xYrHtAvgwicx/p1KpkUq6Tci7H8Mm8s70GYGEwFvYodwS+XTfPTtRD0BFWDfOK6gghQ/
         OtGeHE5DZYdhhJSf876yVF8pBQsGA15c+rKW+9uG6Id5rHsTmAqTXA69FNk6jaNwpIcl
         WN9TVu8/DH0HyROZ23uk07k/7nwM4NvqVUGotsT8nb468Sqr2KQXwo34kB5R+JvSEjNH
         AsONsR85K79DC2d841RirYignzPI21iI44FVfH7ce1F8giixlTs3Fkbv2hvJ0KJMUSt9
         MWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7fU/VKzcvy/KHYqcL+noffgaFe5zWIGYwpxdwunhP4=;
        b=Q1V2mfxuZ0vHhuyTZS43wpash1/eh3E6uu251EARokmfxcuBp6ixo3P/xolE8Uz0/k
         MruDahzZ5C2HBaDg9g2po5aRZfM9n1LxCiz/7sJ1qIOsWuh5x3sUPEKxeP/3mkQj0nu+
         hqjexruPRmKAxFFABhtFBND9BPiR16PgCrVyBLuRnrbful92vUbyrZklPEUsQRTndqoG
         N3qeg6xY6uT9gpIMTh8nx8a2XkhqBYs757CQIk2rJgCO18NSaU5c795hnzWvPM4fruWV
         9XlfcCfQ4LzdhPj9MvUB/i7jAnnBL9HXcIWfEeyERXhoAZbU4TvzKZADNnMptLhF8qgP
         v0kw==
X-Gm-Message-State: ACrzQf2DjodXI6yOxORXAn4vOEQtcr9O+gJUM2TwS4GPACeu7hMk7mGZ
        Fsv4DTKpLVODViIT4L9MDdU=
X-Google-Smtp-Source: AMsMyM6qLFAj+lLiVgYCfTXNIQTffZ+Dx1DC3+fmgsCXYhZ0/TwT4DU31Yg407Rj95UDSOTkkopASA==
X-Received: by 2002:a63:1cb:0:b0:46f:a202:fa36 with SMTP id 194-20020a6301cb000000b0046fa202fa36mr25904839pgb.276.1667565191664;
        Fri, 04 Nov 2022 05:33:11 -0700 (PDT)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id z11-20020a1709027e8b00b00186e2d57f79sm2438223pla.288.2022.11.04.05.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 05:33:11 -0700 (PDT)
Date:   Fri, 4 Nov 2022 20:33:03 +0800
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
Message-ID: <Y2UGf7UkNuCtjpBN@sol>
References: <cover.1667215380.git.viresh.kumar@linaro.org>
 <4082a496a1da3e3c11b08a360f5ba7f7d70f9719.1667215380.git.viresh.kumar@linaro.org>
 <Y2JtqgmRu9fYXiag@sol>
 <20221104113147.rm6psaajhj73k45k@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104113147.rm6psaajhj73k45k@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 04, 2022 at 05:01:47PM +0530, Viresh Kumar wrote:
> On 02-11-22, 21:16, Kent Gibson wrote:
> > It is generally frowned upon to patch your own patch within the same
> > series, so drop the Suggested-by and squash this into patch 5.
> > In this instance it is very handy for reviewing though, as the other
> > patches look pretty clean to me...
> 
> I kept it separately for exactly this reason, I was planning to merge it
> eventually with the other commits.
> 
> > > +pub struct Events<'a> {
> > > +    buffer: &'a mut Buffer,
> > > +    events: Vec<&'a Event>,
> > > +    index: usize,
> > > +}
> > > +
> > 
> > Events is pub but not documented.
> > 
> > The events attribute is expensive - requiring a dynamic allocation for
> > each snapshot.  And you create it unsized and push into it, which could
> > require resizing and reallocation.
> > And it is unnecessary - just have Events iterate over the appropriate
> > indicies and get the ref from the buffer.
> 
> I had to do it this way as I wasn't able to get around an error I think. I
> updated the code now based on suggestions, in my v9 branch, and I get it again:
> 
> error: lifetime may not live long enough
>   --> libgpiod/src/event_buffer.rs:51:9
>    |
> 45 | impl<'a> Iterator for Events<'a> {
>    |      -- lifetime `'a` defined here
> ...
> 48 |     fn next(&mut self) -> Option<Self::Item> {
>    |             - let's call the lifetime of this reference `'1`
> ...
> 51 |         event
>    |         ^^^^^ associated function was supposed to return data with lifetime `'a` but it is returning data with lifetime `'1`
> 
> error: could not compile `libgpiod` due to previous error
> 
> I will try to fix this on Monday now, unless you have an answer for me by then
> :)


     /// Read an event stored in the buffer.
-    fn event(&mut self, index: usize) -> Result<&Event> {
+    fn event<'a>(&mut self, index: usize) -> Result<&'a Event> {
         if self.events[index].is_null() {
             // SAFETY: The `gpiod_edge_event` returned by libgpiod is guaranteed to live as long
             // as the `struct Event`.

There are still other things that need to be fixed after that, but that
fixes that particular problem.

Cheers,
Kent.
