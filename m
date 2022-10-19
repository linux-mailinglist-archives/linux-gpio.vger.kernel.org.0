Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48D8A603A89
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Oct 2022 09:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbiJSHVV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Oct 2022 03:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiJSHVV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Oct 2022 03:21:21 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6FD94506B
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 00:21:18 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id k9so15679525pll.11
        for <linux-gpio@vger.kernel.org>; Wed, 19 Oct 2022 00:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s82uINUttqqbj9KWFHKSjIi9wC9z1+Sit6K/2Nc8YY0=;
        b=kb3KXitm2STdeLlRP3c/z+JHctJlWVoimdvZ+EYrB2FhYSI3DZNx+QrCaIQpTimRZL
         yZHzliKSdwgSUiIxBeugnibTl1Vrkw9Edo17IzKOLZ7Tkdesab1tnUCjzDW0Z3Ygj26U
         USLBBUgKhH2bNr/LpeVTpwMiThpiLMT8a73hslpM6miO9d89RqfjN4oaJcjq5XDrFGHc
         OTkxhH+EvusYrqszC8AJH+hPVWvHIdaOv678YAyt/60fjU6h0Ds/BMqwLi9xKBDwddHz
         FRI3I7rFfKgJYqAhM+SZPcwIf5nkyPsVRDXbyAzT/56K0HENshtQ4mn+eI7KYAvCLVvP
         hu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s82uINUttqqbj9KWFHKSjIi9wC9z1+Sit6K/2Nc8YY0=;
        b=UrHanUr5+VbbPNArB0zh93dtTmqQOo4vO3HaxNGR8g9S38JJw7uW9q+5KsKPYzSRFK
         y7ixeYlw/q7XyCIBR0UQvdE+Iee1eqEPK9O+chOBUrXwIEWUezSpAE7yIl1XP83jlQm4
         bEcIxKLjn3yXr9vpvHYw1soe1jE/JwStb07QUZ/0ZV0taRXlwDYq0aQ9cZhO9Hmplcj8
         lboV44TPgWORbJrekf7MHj3yOtxrDCkXngVeiCSd61zP4gX3Nsjpp7PoCPq84faXCMBs
         GPfPQUfGQvoIcPdC8gfZwAtL7ubMH6MPQ34iZtNRQjOlO1RcPKi0TT1Wj1uvUCb4dfGc
         QYvA==
X-Gm-Message-State: ACrzQf06q5soZ6SmWFp/5YaWQCdFxHCG10/uvyoE988DkVJ9Dwl17xbW
        /yBFZFholM98b/t7glBYMFE=
X-Google-Smtp-Source: AMsMyM7MUvU4uED9eqj/63rBlrbHOLnhoVGSWf4KyrR69IwL6UYgtIrNViNdj9TsN5v0ydWeUG0/8g==
X-Received: by 2002:a17:902:be03:b0:17b:80c1:78c2 with SMTP id r3-20020a170902be0300b0017b80c178c2mr7110635pls.34.1666164078169;
        Wed, 19 Oct 2022 00:21:18 -0700 (PDT)
Received: from sol (14-203-42-90.tpgi.com.au. [14.203.42.90])
        by smtp.gmail.com with ESMTPSA id l10-20020a170902f68a00b0017834a6966csm10125516plg.176.2022.10.19.00.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 00:21:17 -0700 (PDT)
Date:   Wed, 19 Oct 2022 15:21:11 +0800
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
Subject: Re: [PATCH V7 1/8] libgpiod: Add libgpiod-sys rust crate
Message-ID: <Y0+lZ9qcNGX1Q/Of@sol>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <c8ef89c343a0c31e4132cc6757fdff8dec0d1669.1665744170.git.viresh.kumar@linaro.org>
 <Y01RqjgZINnkcyIC@sol>
 <20221018112204.l36wnimrqvexnvat@vireshk-i7>
 <Y06S5GCFYeaPEW9E@sol>
 <20221019064612.p4gu33dm65rnjwl6@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221019064612.p4gu33dm65rnjwl6@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 19, 2022 at 12:16:12PM +0530, Viresh Kumar wrote:
> On 18-10-22, 19:49, Kent Gibson wrote:
> > You should add "categories" and "documentation" if you intend to publish
> > to crates.io.
> 
> In order to add documentations, should I commit documentation (created
> with cargo) as well in libgpiod, so I get a link to it ?
> 

That doesn't really work - you get a link to the files in github, not
as a web site.  You need somewhere that will host those generated files
as a web site.  You could do that with github-pages if you don't have other
options.  When I've done that I would commit the docs to a separate
branch, just for the docs, and have github-pages host that branch.

If you eventually publish your crate to crates.io you get documentation on
docs.rs for free - and you can skip the documentation key in that case too
- it defaults to the appropriate page on docs.rs.
I assume that would be the case long term - you just need to find
someway to host them in the meantime.

> > LGPL is probably not appropriate here, as the binding code ends up
> > being part of the binary - unless you plan to package it as a dynamic
> > library?
> > 
> > The licenses of your dependencies are:
> > $ cargo license
> > (MIT OR Apache-2.0) AND Unicode-DFS-2016 (1): unicode-ident
> > Apache-2.0 AND BSD-3-Clause (1): vmm-sys-util
> 
> This is the license used by the user crate for libgpiod, vhost-device,
> I am inclined to use this then, unless someone has an objection to it.
> 

I'm wondering if now the python bindings include actual python code there
may be a similar issue there - not sure how Bart intends to package that,
or what licensing implications that may have.

In both cases Bart has the final call.

Cheers,
Kent.

> > Apache-2.0 OR MIT (8): bitflags, cc, libc, proc-macro2, quote, syn, thiserror, thiserror-impl
> > MIT (1): intmap
> > N/A (3): gpiosim, libgpiod, libgpiod-sys
> > 
> > IANAL, but one or more of those would be more appropriate than either
> > GPL or LGPL.
> > You, Bart and linaro(?) will have to come to some agreement on which
> > license or combination to go with - it depends.
> 
> -- 
> viresh
