Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC8A6633480
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Nov 2022 05:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbiKVEih (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 23:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiKVEif (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 23:38:35 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E4D1262A
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 20:38:34 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id v3so13066728pgh.4
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 20:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aoGuonu3cc7/axg5LLUcxMp5sIpIox+T02FpdarZAbA=;
        b=J06QTidBL3aFWtJrSYvImkqFn4stFYUrZRjfWjEFJClve2nqBh5bpLPfBq/UDhR0uh
         naY5K6RGMPvJ4DbMUgFvUvk95Oew0SJdoSzAZ2BiyLBrN1fMlAQPoGHO+zml9mAl/AET
         zOvbqgTZhuvHBe6gZ4ttaBaPMS3ggHsag1YLUez4sdLUjhFZw2CmTYqtcTEyZuuXa4lh
         XUO7LXmvAw54w0KClzEgreOxAR2+BUAVf3cmnSZVg2DC0TorapPuxtEJFks+oUsAq1/g
         2LfQ31NUaoFrHPXYoL7TYzAZGq3NUG7foOztFYWuCRtGO3kwoKfXL4INwF6EZ8EcZPeH
         t6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoGuonu3cc7/axg5LLUcxMp5sIpIox+T02FpdarZAbA=;
        b=MDyBc4Jx7ENRwpAiW5sVKiBoS+QL62dyNWrifVkMIDovhoP8bUgzczi0kAEPv3oilH
         3buRmPP8DUP5clXA80gbXTjj/kndr6/N/8JN4I6WD80bZU8TizXDoR8WeAZFjzHw1sHD
         vaGGK+H7ZZEMZMxZKtlVjhjyOEZe4LrO9sGj8I3gQJbHf+PibvSHrh82bu+k1mg9lhzC
         DxSKyuBasuov1S+CkZPG2LpU/jlZVQ5M4DdX2teG0+twX9fA93GPO/25KViIUoMUjcZv
         wE8iU2Fvni5a5xYtU3Cl0aFQcA0eqrwUprgh+FxTUn8iQhCA8eH/v2ToWZjVaq1qwBUm
         nqYA==
X-Gm-Message-State: ANoB5pl3RLxXghZLil+ZOUAgEzYiyhYqTr7kIx6qosybI9a7LAomjfK+
        JT/KHA52+dzS/e+/JjUHh7CmcA==
X-Google-Smtp-Source: AA0mqf4WI60F+SrUFL/Pf3WnjinqzTfkNtS1BwvskGWc5Vz3y2AGmX2ilN/lAuPaIhV9sl0Eef5OjQ==
X-Received: by 2002:a62:fb11:0:b0:56b:dbab:5362 with SMTP id x17-20020a62fb11000000b0056bdbab5362mr23525536pfm.47.1669091913626;
        Mon, 21 Nov 2022 20:38:33 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id b127-20020a636785000000b004468cb97c01sm8374919pgc.56.2022.11.21.20.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 20:38:32 -0800 (PST)
Date:   Tue, 22 Nov 2022 10:08:31 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
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
Message-ID: <20221122043831.hemnrbyily25rhhk@vireshk-i7>
References: <cover.1668768040.git.viresh.kumar@linaro.org>
 <daa3021e4c148d33a8d50c54841719082836c43a.1668768040.git.viresh.kumar@linaro.org>
 <CAMRc=MeXTD10OVZzp2zGTR6Vs2PXemzkrvpBqFE=YojS9mrMPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeXTD10OVZzp2zGTR6Vs2PXemzkrvpBqFE=YojS9mrMPw@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21-11-22, 15:12, Bartosz Golaszewski wrote:
> This is not a blocker, I will apply this series to master later and we
> can add modifications on top of that, but I am now questioning the
> need for this function here and also the value of __version__ in
> Python bindings.
> 
> Previously the python bindings were built with autotools as part of
> the whole library. In v2 python now has a proper setup.py script and I
> intend to publish the bindings on pypi. It can now be built separately
> from the rest of the libgpiod code as long as the system satisfies the
> dependency for libgpiod. Example: I will split the yocto recipe for
> libgpiod into one for the core lib + tools + C++ bindings and another
> for python that will go to meta-python. The latter will depend on the
> libgpiod package but will be built in a separate sysroot.
> 
> In that case keeping the libgpiod API version as the Python's package
> __version__ (which made sense before when that code was closely
> integrated with libgpiod core) is no longer necessary. I'm thinking
> about setting __version__ to v2.0.0 (because we already had python
> bindings with v1.x.y versioning out there) but decoupling it from
> libgpiod's API version.
> 
> In your rust code all the crates already have their own versions that
> don't follow libgpiod's API's version. I think we should drop this
> function. What do you think?

whatever you and Kent decide is fine with me :)

> Also: is there a standardized way for crates to inspect their version?
> As in: println!(crate.version()) or something?

I think that would be "version!()" [1].

-- 
viresh

[1] https://crates.io/crates/version
