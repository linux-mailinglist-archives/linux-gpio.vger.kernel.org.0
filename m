Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 943256439C8
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 01:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbiLFAGx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Dec 2022 19:06:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbiLFAGw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Dec 2022 19:06:52 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 996A71CB2F
        for <linux-gpio@vger.kernel.org>; Mon,  5 Dec 2022 16:06:51 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id g10so12351062plo.11
        for <linux-gpio@vger.kernel.org>; Mon, 05 Dec 2022 16:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X2MMDhUizP3WBWRG5ccW0F16JbQiIETWC1OhNXHCNV8=;
        b=cjdVQ3Lzh1KfISl2amub6olcNSSOdvDag9t+l71lCfV1/d4+p/6jMRl/1a9XHqnDuQ
         NAs95aDRu/4+GTd1nEDuZ2/8hx9x/8AAhchIoizwjgNnvjwZv0+BSI0nu77NacQn8HYH
         zxbRVwwPgMf/7UMqmH+QYvjcKrzxyYRQo/C7NgDTduOg1ZnAispRJAZm2/5OK/N+MvwD
         OUpS6WAX0E+LLBr64rkIQigAtvZMeJTjOiIldECS5M+jN8zb1picy4DvMGNkegTjxPkS
         3G5GQRGmN2N+THbEGsCMpEAXfe7VV/K/K8kSZ2d5IJCp1uoooGpjttfZrHZAiF2ZMFNX
         +jcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2MMDhUizP3WBWRG5ccW0F16JbQiIETWC1OhNXHCNV8=;
        b=y/HfP8dH1xUdgK9WaUAZbD+wF6/9wrGjo02Gffgi3ukNnNfFdFpSxxRFh1Q3JT9cBs
         d6rzgv90pj6yE5mafNU2i1fXN0Q+96fgKQxAsk4LYeqOTiLaB2S5BvHN7ZIldeuJncKw
         mQP1ZTiXT1huB6RvW9UMipIXvkRQBS532X8ZFfBDqZYxbetD2Tf0E0dOoWfdc0whxKws
         9jvubsFqUu1RqcSZG7bkbHGz6N1zlxOdLsPttlwj0hhPiH/vhNBdVeH6cPAKROyowSbP
         7aEURB1Ds6lZRP2S60gKFKBvLOnfVno8Bdhp516IcmHUaXETmgDhbsqJBSJvWGpSFLm2
         NbvA==
X-Gm-Message-State: ANoB5pnfoq3Ziju9Du6WyemQSCiQuJ11LFOf8blKYll9s+cv+oo+9SN7
        /p+g5tVs4zEPK73L/6FIyoZQXFF0xtlhr5vR
X-Google-Smtp-Source: AA0mqf4QQycaZIkBej6HkvSeJO7Sq+SCa/nnbKIIc+wT/W1wwQTzCsmY9e844VldLlQML3qKQXLgJw==
X-Received: by 2002:a17:90b:2705:b0:218:78ae:bdaa with SMTP id px5-20020a17090b270500b0021878aebdaamr91620261pjb.162.1670285211042;
        Mon, 05 Dec 2022 16:06:51 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id x1-20020aa79561000000b005763f7606a2sm7420698pfq.200.2022.12.05.16.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 16:06:50 -0800 (PST)
Date:   Tue, 6 Dec 2022 05:36:48 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>
Subject: Re: [libgpiod][WIP PATCH 0/2] Convert the build from autotools to
 meson
Message-ID: <20221206000648.tyc57i4b6jwyb4y2@vireshk-i7>
References: <20221205132207.94775-1-andrew@aj.id.au>
 <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Md9hpypoB_CYrGecp5ZkkmMJFWuZXo4LzbAkZdiv5oOag@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+ Miguel/Bjorn.

On 05-12-22, 19:55, Bartosz Golaszewski wrote:
> On Mon, Dec 5, 2022 at 2:22 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > Hello,
> >
> > Based on a recent poke [1] and in-between meetings I've put together a
> > WIP series that converts libgpiod's build from autotools to meson. As
> > far as I'm aware the meson build supports all the significant options to
> > enable or disable features exposed by the autotools build:
> >
> > * Tests
> > * Tools
> >   * Interactive gpioset
> > * Bindings
> >   * C++
> >   * Python
> >   * Rust
> > * Documentation
> >   * Manpages
> >   * Doxygen
> >
> > [1] https://lore.kernel.org/all/CAMRc=Mda8UnyH+_GxeX_4MyKd+DPN0BVH5K+J+VWnMJNC1vwTQ@mail.gmail.com/
> >
> > Meson has pretty good support for handling python and so the patch does
> > away with setup.py entirely.
> 
> Eek! No, please do keep setup.py. Autotools too is capable of building
> python C extensions on its own and it's what we use in v1 but I want
> the python code to be built the standard python way. I actually plan
> to post libgpiod v2 on pypi and split out building python bindings
> into a separate bitbake recipe in meta-openembedded using the
> setuptools3 class.
> 
> So let's keep setup.py and just call it from meson.
> 
> > However, the rust case isn't quite so
> > simple. In order to handle the dependencies of the rust bindings I've
> > called out to cargo through a custom target. It's not great, but from
> > what I could see it seems to be the path of least resistance given
> > meson's support for rust.
> >
> > There's no support for installing the rust bindings through meson, but
> > this is not worse than the support we appeared to have under autotools.
> >
> 
> I think Viresh too wants to keep cargo as the building agent for the rust code.

I am not the best guy to ask around Rust tooling in general and
probably Kent / Miguel can help here.

Sorry for the stupid question, but what does "installing the rust
bindings" mean here ? FWIW, for me the only thing that matters is that
we are able to build the rust bindings, along with Make, and run tests
somehow to make sure nothing broke. Since this is a library crate, the
user crate will mark its dependency and do the build itself too.

> > It's worth noting that you'll probably want to disable the rust bindings
> > if you need to run the install phase for libgpiod under e.g. sudo but
> > have used rustup to install cargo for your unpriviledged user.
> >
> 
> Current autotools setup doesn't install rust bindings at all, can we
> keep it this way?
> 
> > Also, if you've used rustup to install the rust toolchain you may also
> > need to install clang in order to pick up C toolchain headers for
> > consumption by bindgen.

Yeah, from what I remember, we do need clang support for bindgen.

> > Anyway, feedback on the rust part is definitely appreciated. Maybe
> > there's a better approach?

-- 
viresh
