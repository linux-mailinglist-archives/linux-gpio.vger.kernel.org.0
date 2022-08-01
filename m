Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABCCE586BD1
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Aug 2022 15:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbiHANU1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Aug 2022 09:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbiHANU0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Aug 2022 09:20:26 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2CAF1E
        for <linux-gpio@vger.kernel.org>; Mon,  1 Aug 2022 06:20:25 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id r186so9663042pgr.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Aug 2022 06:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zr/RftuxYY/kRlRnov6dnxuIygy/zCcsWl9vhTLfntY=;
        b=IEqOGhP7NeoPXa4lwvBO/so19DHkBmw/HQf3w3UiP2TVPCdAchxTy8VYKBfj2PPoNC
         OmfshLnsBXw2WYlETUE8FfSzyhKG34Pzd6oTRMct47Savt1Z0gIX2ss28jVVRItTU+e0
         7x0TCRgJMhDJP7WcHTVkZJsSlrZX/u5aPIosO5jx2OfD5idi/qdrdK9wHDxyOn1Edt6z
         XcWf3wagQ5heNfn7Z7OR7W+Jgmpqxt/g0EykyW0/rlq4ZOVPjwI3etMrFjNo3mlUThmL
         xOYsZvmyxQ//0DP35U90KdwrnO4UCr0Cbr87D9bgxWy4UqSpmDxQO3xTniZuczqdxjET
         JqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zr/RftuxYY/kRlRnov6dnxuIygy/zCcsWl9vhTLfntY=;
        b=aKV932lev6/5HpHW7gTPYChGgYejhBP5flsJLQJhJ4FIqw1Pp6ncRgW12Qq2g3CLY7
         kGjeG/9WNgW9w0qjkZxiHlDihrw+MhA8nL/qCtCSzGEyP5JK+8e+R7e8eqmIIhvC0brD
         pKfigZDn/qRbL/htmMog5euH9zXxPOneBfdL1v4bsSSs70/bcgOLioaC20yN5vguxP2o
         n+v8+CA3G2PdIt4kiEttezVsBS4zg5RjH1fsuovnLtf4i9RN9Uort3LOc/Ch9mWo7BRu
         l6/IhF0Yk+yJJoWy3qOlGx6tkfNLyupe16Y/6JukmnRQaTQpDI1kjnBu8c7KldqpgXcy
         ICCQ==
X-Gm-Message-State: AJIora9hulPmKy0EN7D9fzL+69WMLZhxPh2Byjb9ilp/N95pWUoL+KsY
        I5kRB+kd3tDkzNZpSleun56Y96WAUT4=
X-Google-Smtp-Source: AGRyM1v6afhbb1EcW9fmXd1cAeg3UctjbYTYBwdM+qwoUAYKE9veMxuY09rLtdSbkTMpirIt8Px+OA==
X-Received: by 2002:a63:fa0d:0:b0:41a:716c:6ac6 with SMTP id y13-20020a63fa0d000000b0041a716c6ac6mr13078769pgh.41.1659360024953;
        Mon, 01 Aug 2022 06:20:24 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id t1-20020a170902e84100b0016d1b708729sm9718323plg.132.2022.08.01.06.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 06:20:24 -0700 (PDT)
Date:   Mon, 1 Aug 2022 21:20:17 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 4/8] libgpiod: Add rust wrapper crate
Message-ID: <20220801132017.GA46663@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <c3bdcaa85e1ee4a227d11a9e113f40d0c92b0542.1657279685.git.viresh.kumar@linaro.org>
 <20220727025754.GD88787@sol>
 <20220727090701.hfgv2thsd2w36wyg@vireshk-i7>
 <20220727100809.GB117252@sol>
 <20220801120506.46emxdk7qk2g2gmf@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801120506.46emxdk7qk2g2gmf@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 01, 2022 at 05:35:06PM +0530, Viresh Kumar wrote:
> On 27-07-22, 18:08, Kent Gibson wrote:
> > On Wed, Jul 27, 2022 at 02:37:01PM +0530, Viresh Kumar wrote:
> > > On 27-07-22, 10:57, Kent Gibson wrote:
> > > > On Fri, Jul 08, 2022 at 05:04:57PM +0530, Viresh Kumar wrote:
> > > > Consider modules and namespaces rather than lumping everything in
> > > > the gpiod space.
> > > > 
> > > > e.g. gpiod::ChipInfo -> gpiod::chip::Info
> > > 
> > > The modules are already there, as file names. So what we really have is
> > > gpiod::chip_info::ChipInfo (yeah it isn't great for sure). But then it looked
> > > tougher/complex/unnecessary for end users to know the internals of a dependency
> > > and so I did this:
> > > 
> > > pub use crate::chip::*;
> > > pub use crate::edge_event::*;
> > > pub use crate::event_buffer::*;
> > > pub use crate::info_event::*;
> > > pub use crate::line_config::*;
> > > pub use crate::line_info::*;
> > > pub use crate::line_request::*;
> > > pub use crate::request_config::*;
> > > 
> > > which puts everything under gpiod::*. I think it is easier for users that way.
> > > The modules are fine for in-crate management, but for end user they shouldn't be
> > > visible.
> > > 
> > 
> > The main problem I have with putting everything in the top level is the
> > generated docs.  You get everything dumped on you, so all structs, enums
> > and functions, and it isn't clear to the user what the logical starting
> > point is.
> > If things are tiered then you can introduce them more gradually, or keep
> > them out of their way if they are unlikely to use them (e.g. ChipInfo,
> > InfoEvent).
> 
> I am not sure what to do about this. I was suggested earlier to dump it all at
> the top level namespace so it is easier/shorter for users, which also won't need
> to know the internal namespaces/modules of libgpiod.
> 

libgpiod has no namespaces/modules - cos it is C.
The users do need to understand how things fit together, and the flat
namespace doesn't help there - everything is equal.

True, "_" is shorter than "::".  Can't argue with that ;-).

In Rust the user can rename the import whatever they want, so I'm not sure
the "easier/shorter" argument holds much water.

> Looking at structures, there are just 8 of them which are exposed in docs now,
> which isn't a lot really. And then we have 12 enums now.
> 

This isn't a question of numbers, it is a question of whether to
indicate structure, or to flatten everything.

I find the structured approach both clearer and more idiomatic in Rust,
so that gets my vote.

Cheers,
Kent.
