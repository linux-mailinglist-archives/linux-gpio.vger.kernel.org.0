Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE6A586AD3
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Aug 2022 14:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbiHAMbr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Aug 2022 08:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231269AbiHAMbe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Aug 2022 08:31:34 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8243447BB4
        for <linux-gpio@vger.kernel.org>; Mon,  1 Aug 2022 05:11:09 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id x2-20020a17090ab00200b001f4da5cdc9cso4924549pjq.0
        for <linux-gpio@vger.kernel.org>; Mon, 01 Aug 2022 05:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UHXhZNpLmLtNpSwoZGGtwJOtRIwZwbjH+3kGSGBWzAA=;
        b=YCeEUdDfgOp9mcc5JnnEHhCW0bLp+KzUqbL+z9BAH0C7bTlhcyfaOPIXP77Ml7mZXG
         /XlVzAIl2+pOZ6BF2uRimpgw7xGDiOckxJZ3aDW10dEXV8yJw4Gwme/RLpZMrzN4fKLg
         7xMCbSNqMjH9SJPsi8Bo/60qLfsbfZsHVWxQiMBlqQHTwnArrdlR+0OLBzIRWMTsyv+/
         S4j0zcQTW4o1Bwc9Srqw0mknZSf9M0zLuXIVxWQ25v9uc/T03kMNQoY58sHE5WG9NYPY
         5wsQk05xfqYl+hWOoWtvpkrDqUMg/dPs1aDFTcVxV0o3DU5rqUL7E0gDU0d8ckS09jWI
         eWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UHXhZNpLmLtNpSwoZGGtwJOtRIwZwbjH+3kGSGBWzAA=;
        b=5D/9YNgW6TGpwbcExlY7uOvrE6GgAaKgcHcRndmidozjsYXSJbuicVDNR6NmKgsczy
         kwbTaJP/85Q7yUlMPRz2nkBQLIv5BtcgsFz8m9Poq3ASgzZ7G3arCzIqVvfVbVWb3a18
         0Ve7lpFl/gTZSU22tFPrVCe005aa4fNatjDldOsCtoPBzRRgXbn1vfMmCBksDSoHVg+K
         pSRi2/x3O+bkhiCoyePADggfyku5c0b7v+ELDVC8tI+yaQC4UHmC3bRgNZLkeC0oaoA9
         CBUjG4/lZ/kKHrypS3vC8K+AnRA5TUlh14Ba9yQlwwyyEu2GaQ/OnjGFGeiglcV/SG++
         cGJQ==
X-Gm-Message-State: ACgBeo1yJC+d+CtDMSeytwL+YEXgJlch7mz77tkCpC1bMJeh0Fak2FqK
        UGYLvzS6PPC5sfZLrylwzaiIkg==
X-Google-Smtp-Source: AA6agR5VOWSKV6NHa14wmd8xtJC5VymaCGFhwD8FcXutv8gec5YTNrBc9b4P55djIeaIffFopDk1sQ==
X-Received: by 2002:a17:90a:8001:b0:1f4:fe95:c420 with SMTP id b1-20020a17090a800100b001f4fe95c420mr5608851pjn.146.1659355868989;
        Mon, 01 Aug 2022 05:11:08 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id x66-20020a628645000000b0052ab3039c4esm8501392pfd.8.2022.08.01.05.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 05:11:08 -0700 (PDT)
Date:   Mon, 1 Aug 2022 17:41:06 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 1/8] libgpiod: Add libgpiod-sys rust crate
Message-ID: <20220801121106.hc2mzippvby5ujg4@vireshk-i7>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <44ee8c36d58049de2f653494e16cba04b198fb35.1657279685.git.viresh.kumar@linaro.org>
 <20220727025706.GA88787@sol>
 <20220727045158.z72byax7pc7kokca@vireshk-i7>
 <20220727051743.GA108225@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727051743.GA108225@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 27-07-22, 13:17, Kent Gibson wrote:
> On Wed, Jul 27, 2022 at 10:21:58AM +0530, Viresh Kumar wrote:
> > On 27-07-22, 10:57, Kent Gibson wrote:
> > > On Fri, Jul 08, 2022 at 05:04:54PM +0530, Viresh Kumar wrote:
> > > > +fn main() {
> > > > +    let files = vec![
> > > > +        "../../../lib/chip.c",
> > > > +        "../../../lib/chip-info.c",
> > > > +        "../../../lib/edge-event.c",
> > > > +        "../../../lib/info-event.c",
> > > > +        "../../../lib/internal.c",
> > > > +        "../../../lib/line-config.c",
> > > > +        "../../../lib/line-info.c",
> > > > +        "../../../lib/line-request.c",
> > > > +        "../../../lib/misc.c",
> > > > +        "../../../lib/request-config.c",
> > > > +    ];
> > > > +
> > > > +    #[cfg(feature = "generate")]
> > > > +    generate_bindings(&files);
> > > > +    build_gpiod(files);
> > > > +}
> > > 
> > > Shouldn't bindings wrap libgpiod and dynamically link against it rather
> > > than building and linking statically?
> > 
> > There are few problems I faced, because of which I had to do it this way.
> > 
> > - I couldn't find a way to do a "Make" for libgpiod from here and then link to
> >   the resultant library.
> > 
> > - libgpiod may not be automatically installed in the environment where the end
> >   user of these Rust APIs exists. So I had to build it.
> > 
> > - And then the API is changing a lot, maybe down the line once it is stable
> >   enough we can change this to something else.
> > 
> 
> Sure, it is a problem, but static isn't the solution.
> You should be able to get the appropriate paths from autoconf, but I would
> refer you to Bart on that.

I am still looking for some help on how to link this dynamically.

FWIW, the problem is that the user crates, like vhost-device, will mention
libgpiod as a dependency crate and likely won't have libgpiod installed in
environment. So build.rs here needs to do some magic so the definitions are all
available to the users.

-- 
viresh
