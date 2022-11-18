Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4844262FB8A
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 18:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235165AbiKRRY6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 12:24:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235247AbiKRRY5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 12:24:57 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239EC903AC
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 09:24:57 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id v3so5561662pgh.4
        for <linux-gpio@vger.kernel.org>; Fri, 18 Nov 2022 09:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8fTcvNhJFCbivRT8C0GYumCaNGirrA6OTdw+wltjA+c=;
        b=G1jG7QpRQqzWFHR7OWjgFB2SN8AvN6aJpXLFy1+OWnUNTRicU5SrC7AjzbpijmyEVE
         HqTGPyAWvC+bk8e0mNOpiI5tND+YT8VMxrbnGhMwxC3xLrSk03gF3IQOokaKs7/Ucr7p
         RuExK2/8Sm9a1P7OsKXrYyOHoWk3AjdjgBSCLGQzazfooHhsYQLPKbO/28FGCnTXeYV3
         Rn5YtN13ubqwN7GBhUmXa0WgUbBEjlcuqn/M7roWGfZyo5M47Hcc51XEeOVWbEkOHO2j
         Rm/hG24+wynG3im3Yg+iEciCMf9j8qo1xiCgs4V/aXflaIAnl6aExGqpp9yJY3+jNXT0
         A+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fTcvNhJFCbivRT8C0GYumCaNGirrA6OTdw+wltjA+c=;
        b=gQP0Qp1CnawF6xPkh0yt0Z/8egBSkwv+8IZHpmnoSVzmyl1cQ6BnqU3BN77Up/y/Ni
         70DUxIDgjgCnYtMU6+c6BITkskh/iZ+lxIDqRQCIBCazlX6qyaBKt+fvPjyyOr9tVMCX
         Vu7YVfFY8877/xcZCwnrSncEaW+RqgjEcL7j0HqMAhn6y5rDCdjaXqFKYNoGso2XDYID
         +HjTIKVJvyGG/mQVg1fEtBplh3GsHSCYgy9KMagzz9dSHDpQFO444xK0BPUodzTq5uu/
         Htmq8UGn3qX4sDUNTaruAFOpN71p80Cwaq2423XQbOZaO79jspkEtIy2AOI0lXf3+rzA
         4ftw==
X-Gm-Message-State: ANoB5pn0nvIclhIUrEkLHhY0lRZUChNhqv5BfshI1Rjh98pUSUJrtnJs
        hJEtpMUCrlF7WSy7sy/W948=
X-Google-Smtp-Source: AA0mqf4JfBvL4w0A6FF+OV0YP9xCh4m0HLMbeYTkzG0FuFwmyRuYngww2LZinvJFXNSM2HIJiKCeiw==
X-Received: by 2002:a05:6a00:3029:b0:572:8c05:6e2c with SMTP id ay41-20020a056a00302900b005728c056e2cmr8742837pfb.85.1668792296518;
        Fri, 18 Nov 2022 09:24:56 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id iw20-20020a170903045400b00179f370dbe7sm3832938plb.287.2022.11.18.09.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 09:24:56 -0800 (PST)
Date:   Sat, 19 Nov 2022 01:24:48 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Gary Guo <gary@garyguo.net>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
Message-ID: <Y3e/4Fu4kN1ved/C@sol>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=Mc=NVzo-R8Yg8SSos6rSaru_i4+m3qpXeZcKsHH6hcOAg@mail.gmail.com>
 <Y3Q44X7+DxoVefD5@sol>
 <20221118164456.44f448e8@GaryWorkstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118164456.44f448e8@GaryWorkstation>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 18, 2022 at 04:44:56PM +0000, Gary Guo wrote:
> On Wed, 16 Nov 2022 09:12:01 +0800
> Kent Gibson <warthog618@gmail.com> wrote:
> 
> > On Mon, Nov 14, 2022 at 10:49:36PM +0100, Bartosz Golaszewski wrote:
> > > On Mon, Nov 7, 2022 at 10:57 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:  
> > > >
> > > > Hello,
> > > >
> > > > Here is another version of the rust bindings, based of the master branch.
> > > >
> > > > Pushed here:
> > > >
> > > > https://github.com/vireshk/libgpiod v9
> > > >
> > > > V8->V9:
> > > > - Merged the last patch (supporting Events) with the other patches.
> > > > - Events implementation is simplified and made efficient. nth() is also
> > > >   implemented for the iterator.
> > > > - Unnecessary comment removed from Cargo.toml files.
> > > > - Updated categories in libgpiod's Cargo.toml.
> > > > - Updated gpio_events example to show cloned events live past another
> > > >   read_edge_events().
> > > > - Implement AsRawFd for Chip.
> > > > - Other minor changes.
> > > >  
> > > 
> > > Kent, Miguel: if you are ok with this version - can you add your review tags?
> > > 
> > > Bart  
> > 
> > As mentioned elsewhere, I'm a bit iffy about the handling of non-UTF-8
> > names, which are treated as errors, but are valid in the C API.
> > But that is an extreme corner case that can be addressed later, so I have
> > no objection to this version being merged.
> > 
> > Reviewed-by: Kent Gibson <warthog618@gmail.com>
> > 
> > Cheers,
> > Kent.
> 
> I have glanced through the code and I find no reason that the `str` used
> couldn't be replaced with `[u8]` or `OsStr`. The former might be a
> little bit difficult to use, but `OsStr` could be easily converted into
> `str` by just `.to_str().expect("name should be utf-8")` if the user
> don't care about non-UTF-8 or is certain that names are indeed UTF-8.
> 

Or you can use `OsStr::to_string_lossy()` though that requires allocation.

str is preferable as it is easer to use, and 99.99% of the time will be
fine.  I have toyed with using OsStr, but having to do the conversion
becomes really tedious really fast.

> I am not sure about whether this would be worthwhile though, because I
> doubt if anyone is actually using non-UTF-8 strings in those places.
> Non-ASCII usages should already be rare?
> 

That is what I meant by "an extreme corner case".

The problem with the GPIO uAPI is that it limits names to 32 bytes,
and valid UTF-8 passed in may get truncated mid-codepoint, resulting in
invalid UTF-8 when read back.
Handling that case by truncating the string before the split codepoint
would at least ensure that the Rust API would round-trip.

Cheers,
Kent.
