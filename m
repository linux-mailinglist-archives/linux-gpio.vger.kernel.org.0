Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47E295879EF
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Aug 2022 11:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233188AbiHBJhH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Aug 2022 05:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbiHBJhG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Aug 2022 05:37:06 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0ED119C15
        for <linux-gpio@vger.kernel.org>; Tue,  2 Aug 2022 02:37:05 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id h28so6705109pfq.11
        for <linux-gpio@vger.kernel.org>; Tue, 02 Aug 2022 02:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1w2g8x1Wc3Bjh2xEKjuM9r3o0qYaf8+ObaTdeZFvmQE=;
        b=mpA6/SpmI4wpxQVJ1HsG6CgmZ5dQm4z00d0tLyv5yLDWKiMEJ/vB+ssH/JsqWKdTji
         d7dITU/Ow9n+DiSMK7YkX7ocFEhxYz/ZnPcYvRfaBZeokFXG/YsWuxZ2tFj9pXSJbQEA
         gWIQC7VKBOB7WNVrlE/+Mo4rryEYi5vbd7PCWDpvwE3WuOPFxeYQUfE+IU+N6pfD5Hzb
         uXB/MrrMN5wp+Of2mbmHdJ0Ukq/YhvBINKYaMN9qnmtFy+zHu7ooLqB7VT/GwfmXAl5N
         v1hi/0m8dGMXRAzSUsQsX7UEgIiSlsTHkbq+wk9eS7q/hkLU3qg8dAiR+6sA/PrYla4J
         p4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1w2g8x1Wc3Bjh2xEKjuM9r3o0qYaf8+ObaTdeZFvmQE=;
        b=3qYa+PBDE0rxxxjp0WskwDkYiJsWamKuMYsFJp8UuYMdxe7uXAcp/aN3SNkzVFyFYZ
         0rQsOk6RLwqohohrCik5yWBvRkIC6qrwZpPQDZ3dQCrHOmYKlZDCBnqU0LDBz596fMsv
         caELpsSwil7dlpUALZsxGN8ANszrK92WGWxFq/ndL4Rg61ZoguEM3Uxr6gO5tNgUdJYU
         Xc1zB0JC0tugwlFisjCpyuvOBWLFP/4/y3JgdxwgLybXqXtNFmt2oRWUGVrNhU1z0jfS
         TnTnOkspmBQSsDHNqJquL56JyDbSnKLc5A5JFLkIrpi48akxUj4ZTCFwfdsfI4Q0qKJC
         tXeQ==
X-Gm-Message-State: ACgBeo0UeulIi5TTka1rKODlmfdw25bbBbFatHaenrmd7XM8k/mUqOup
        4dQO4+vfN7NhOr1G2HfKUTI=
X-Google-Smtp-Source: AA6agR7QEjKzbclFgcbz66U/WaZdFM6vOd7svi4OnA6vjfG5RAEQo6m/eDYDVWZ8do2gVQ01FdnA9w==
X-Received: by 2002:a65:4c0e:0:b0:41b:c11a:c006 with SMTP id u14-20020a654c0e000000b0041bc11ac006mr12129608pgq.299.1659433024940;
        Tue, 02 Aug 2022 02:37:04 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b0016d3d907146sm6448636pln.191.2022.08.02.02.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 02:37:04 -0700 (PDT)
Date:   Tue, 2 Aug 2022 17:36:58 +0800
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
Subject: Re: [PATCH V4 1/8] libgpiod: Add libgpiod-sys rust crate
Message-ID: <20220802093658.GA28533@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <44ee8c36d58049de2f653494e16cba04b198fb35.1657279685.git.viresh.kumar@linaro.org>
 <20220727025706.GA88787@sol>
 <20220727045158.z72byax7pc7kokca@vireshk-i7>
 <20220727051743.GA108225@sol>
 <20220801121106.hc2mzippvby5ujg4@vireshk-i7>
 <20220801155615.GA84978@sol>
 <20220802085008.evxb3mipx4rply76@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220802085008.evxb3mipx4rply76@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 02, 2022 at 02:20:08PM +0530, Viresh Kumar wrote:
> On 01-08-22, 23:56, Kent Gibson wrote:
> > The Rust bindings themselves should be building against the local build
> > tree, so well known relative paths.
> 
> Right, when we build everything with "make" we better use the already
> built library. I agree.
> 
> > For users, require they have libgpiod installed and use pkg_config to
> > locate it?
> > 
> > Is that what you mean?
> 
> Since we need the latest APIs, we can't trust the packages provided by
> distributions for now. i.e. "apt-get install libgpiod-dev" won't
> install the latest stuff we need.
> 

For user builds with the Rust bindings you always require an appropriate
version of libgpiod to be already installed, or it is the users problem
to arrange that.
For the time being that means it needs to be built and installed from
source.  I don't see an alternative to that, or a problem with it.
In the longer term it will be provided by the packaging system for the
platform.

I may well be missing something, but I don't see the problem, at least
nothing that requires addressing.

Cheers,
Kent.

> The only other option to get it working in environments like
> rust-vmm-containers (which tests the vhost-device crate currently) is
> to build / install libgpiod first. As I have understood, people don't
> really like it there (Maintainers of rust-vmm-containers) as this will
> have further dependencies and require more tools.
> 
> I even tried to generate the libgpiod-sys bindings on the fly first,
> but it required more tooling and there were issues with Musl build
> specifically. They suggested to use prebuild bindings as a solution,
> which I have now.
> 
> What about we have two separate features:
> 
> - "default" one will be used with "make" and will use prebuild library.
> 
> - "generate" one will be used by user crates and we will build the
>   files there like it is done now.
> 
> > Else, how do other Rust crates wrapping dynamic C libraries do it?
> 
> I think for standard libraries that are stable, the -sys crates just
> contain the pre-built bindings and wrappers and expect the library to
> be already installed.
> 
> -- 
> viresh
