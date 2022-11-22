Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C94DE6334A0
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Nov 2022 06:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiKVFJc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Nov 2022 00:09:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiKVFJa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Nov 2022 00:09:30 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545C62EF68
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 21:09:29 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id 4so12601774pli.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 21:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aow9D61dmc7LMqQeHl3g4V2GYAaE5szz+kTMx8iCHwI=;
        b=UK/JrHRbuV6mnrG1XVdGjtauQDIHhvgNwOb0zSAcm5V4smfrtqlJvOt0zKyA8chC+k
         3akeSCahBgsih2zq7eMqmt7cGSNa5wwF388f1eLvZmpye0rWHXssNU9ffOOLe150HiOB
         trAVex+Any2AabOBXbnaXxiTIYEjcBJwrwFGfOTc9jRXjnk7AbkyQM5DSvZWwa2xM2Jz
         +1Q0+Yt5o6wX5WXMK6F1jig7Q4NzgoV9zCUhPnLZ7kWxO/cZqoSm9SlaNwXaEHGpNO0p
         bORH31hOasnorDpl1sdtkYqNFgAuaqtTeN6Zlzh4Y/v/XHmzrJlAVbnoiohfrimfZ8Po
         auSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aow9D61dmc7LMqQeHl3g4V2GYAaE5szz+kTMx8iCHwI=;
        b=PgC7Kzq+5CyTlnQZHgFpZEbfFUCeUJB6BkhlCvQSgrfZjNUKaZSuxKZWIgvVV1QhQF
         1ZqBQFmpEx2nDkpN60phvPKYu8Vzdct4kQMkV3NZuAJmn0Qw9oq/p8kC6fCvP/MryeY7
         hTgFdtlSUJqWdBvjmPFwLPx64xB7H/QW7APpTvr5Miq8Qhy7XuOHZfanaWLtG0y11mo7
         q07tImBCSm0W/+aTlDSqkmv5tDfmdWjgoXnpDNtmdpA9xux2+iVxq+fIMUyAcgHhXSZt
         BeXn7TyBuxO7/Tqi6hXhSBiCwdhw4UJE3JPmwWUXbQJBcFyA2RgZfqwMCa7kdGGnl23w
         9HlA==
X-Gm-Message-State: ANoB5pkvgyYV0gIst9KSukI2lL3ezea7bLs0GPRR3oMHkgB+GBLRUAcq
        75QHtT9fDB/taO6+3RfE1++xa9Gq4do=
X-Google-Smtp-Source: AA0mqf7L8neNx4HHj3rI6FbZwXqNbewWc6XIi2hyjWySdpEAlgj/qCOZmXVc6t8lqr3s8Ia1cc2K5g==
X-Received: by 2002:a17:902:c7d1:b0:188:5681:4dc8 with SMTP id r17-20020a170902c7d100b0018856814dc8mr2691455pla.23.1669093768717;
        Mon, 21 Nov 2022 21:09:28 -0800 (PST)
Received: from sol (110-174-14-241.tpgi.com.au. [110.174.14.241])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902eccd00b0016d4f05eb95sm10773440plh.272.2022.11.21.21.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 21:09:28 -0800 (PST)
Date:   Tue, 22 Nov 2022 13:09:20 +0800
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
Message-ID: <Y3xZgDch57EyTr9x@sol>
References: <cover.1668768040.git.viresh.kumar@linaro.org>
 <daa3021e4c148d33a8d50c54841719082836c43a.1668768040.git.viresh.kumar@linaro.org>
 <CAMRc=MeXTD10OVZzp2zGTR6Vs2PXemzkrvpBqFE=YojS9mrMPw@mail.gmail.com>
 <20221122043831.hemnrbyily25rhhk@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122043831.hemnrbyily25rhhk@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 22, 2022 at 10:08:31AM +0530, Viresh Kumar wrote:
> On 21-11-22, 15:12, Bartosz Golaszewski wrote:
> > This is not a blocker, I will apply this series to master later and we
> > can add modifications on top of that, but I am now questioning the
> > need for this function here and also the value of __version__ in
> > Python bindings.
> > 
> > Previously the python bindings were built with autotools as part of
> > the whole library. In v2 python now has a proper setup.py script and I
> > intend to publish the bindings on pypi. It can now be built separately
> > from the rest of the libgpiod code as long as the system satisfies the
> > dependency for libgpiod. Example: I will split the yocto recipe for
> > libgpiod into one for the core lib + tools + C++ bindings and another
> > for python that will go to meta-python. The latter will depend on the
> > libgpiod package but will be built in a separate sysroot.
> > 
> > In that case keeping the libgpiod API version as the Python's package
> > __version__ (which made sense before when that code was closely
> > integrated with libgpiod core) is no longer necessary. I'm thinking
> > about setting __version__ to v2.0.0 (because we already had python
> > bindings with v1.x.y versioning out there) but decoupling it from
> > libgpiod's API version.
> > 
> > In your rust code all the crates already have their own versions that
> > don't follow libgpiod's API's version. I think we should drop this
> > function. What do you think?
> 
> whatever you and Kent decide is fine with me :)
> 

As previously mentioned, it makes sense to me for there to be functions
that return both the binding version and the libgpiod version you are
running against.  Separately, as the two are distinct.

So keeping the wrapper around the libgpiod version method for the
latter, and another function that returns the CARGO_PKG_VERSION for the
binding crate.

Then, if the user is interested, they can report them in their help,
version, log, startup banner or whatever works for them.

> > Also: is there a standardized way for crates to inspect their version?
> > As in: println!(crate.version()) or something?
> 
> I think that would be "version!()" [1].
> 

Which is a library that reads the envvars set by Cargo at compile time,
so you could also just

const VERSION: &'static str = env!("CARGO_PKG_VERSION");

and provide a function that returns that.

Cheers,
Kent.
