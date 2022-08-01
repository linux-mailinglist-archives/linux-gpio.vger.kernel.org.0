Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B59BD586E21
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Aug 2022 17:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbiHAP4Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Aug 2022 11:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbiHAP4Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Aug 2022 11:56:24 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5DD72FFF3
        for <linux-gpio@vger.kernel.org>; Mon,  1 Aug 2022 08:56:23 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id q16so10055493pgq.6
        for <linux-gpio@vger.kernel.org>; Mon, 01 Aug 2022 08:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H6hUgxKxbhxpiMPWoSWM47VALtS/yuWff3URm6iNcXU=;
        b=n7cXhMeX4WlroFEQYNXgUYm+aMlY6En/B3pL46wSv0lunZ6zya2qbNISs8iw07Y0pn
         Iv9Krx/CtZn0kVdCQJeMBRDBD0P8tHCKlv1SAxF6Xjxo47d5BR/c56mJw5N8HNZItYM3
         EMr3852oHHq/TNlVLnYy4C6ult9Vv+likzXxUXxynWQHxRP/NcFNjLYrwlTwFyiPRnHu
         L7Tn+7B3ixXRKvnSarPVpQpJb8Cl7ELlipgrhFKqKrg0kFE1Os6QlyToXxiEYpRrywRd
         HQqpNdZrL0R5y4/g7p4xY96aERdLgXRwYtat4xa1867orYx8jlgOIFbSOi5t3aj+po2r
         6+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H6hUgxKxbhxpiMPWoSWM47VALtS/yuWff3URm6iNcXU=;
        b=GIMqwvO/rNe0LXBLd0ZkdtXl0d6BN2GfL1AxLZrWsasVQcPPIxkILFMlnR1sHDpCbo
         OE2h+WC645l8tYweBoLPb0VCRFOCuu3xNh4QcYbTMEXRo7DPFHIsrpV1JHRrjw7R5JyP
         w1dzKZmkbVPbrYcYu0KzGVa9kLRJYGoQi9UucWLtfJYoRC7PhNaYgVgxwGK8C7ibH5e3
         xVVPzLsEUlA8aC1k6B6et18DlVfT9GyDUMiR+RtvGrBCQc325fF3nZBv1QlLYTAd1JS2
         x+WprKJy2AQywuVL6w4yfskAJ35ThbME2EoEVv4sHRGWuwYJQjtnfJ5DWSTrQX0xZdzr
         txgA==
X-Gm-Message-State: AJIora/sa5xbB6R6V6QlNEd5Rmp8uyZ7z2Y3aXH7PBHQPbY6UCw6QXdl
        g0hjDXNYcDcsGhXRunIwS0Y=
X-Google-Smtp-Source: AA6agR5QKtvy6bvoz6teLIGM6oJeMy4RV8r3i1F2DIrhSFvkyBSmzthRwqrikxGqRkkZRA0ombiFag==
X-Received: by 2002:a63:f804:0:b0:41b:a3b4:4edc with SMTP id n4-20020a63f804000000b0041ba3b44edcmr11715339pgh.479.1659369383046;
        Mon, 01 Aug 2022 08:56:23 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id b1-20020a170903228100b0016c06a10861sm9891610plh.74.2022.08.01.08.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 08:56:22 -0700 (PDT)
Date:   Mon, 1 Aug 2022 23:56:15 +0800
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
Message-ID: <20220801155615.GA84978@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <44ee8c36d58049de2f653494e16cba04b198fb35.1657279685.git.viresh.kumar@linaro.org>
 <20220727025706.GA88787@sol>
 <20220727045158.z72byax7pc7kokca@vireshk-i7>
 <20220727051743.GA108225@sol>
 <20220801121106.hc2mzippvby5ujg4@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801121106.hc2mzippvby5ujg4@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 01, 2022 at 05:41:06PM +0530, Viresh Kumar wrote:
> On 27-07-22, 13:17, Kent Gibson wrote:
> > On Wed, Jul 27, 2022 at 10:21:58AM +0530, Viresh Kumar wrote:
> > > On 27-07-22, 10:57, Kent Gibson wrote:
> > > > On Fri, Jul 08, 2022 at 05:04:54PM +0530, Viresh Kumar wrote:
> > > > > +fn main() {
> > > > > +    let files = vec![
> > > > > +        "../../../lib/chip.c",
> > > > > +        "../../../lib/chip-info.c",
> > > > > +        "../../../lib/edge-event.c",
> > > > > +        "../../../lib/info-event.c",
> > > > > +        "../../../lib/internal.c",
> > > > > +        "../../../lib/line-config.c",
> > > > > +        "../../../lib/line-info.c",
> > > > > +        "../../../lib/line-request.c",
> > > > > +        "../../../lib/misc.c",
> > > > > +        "../../../lib/request-config.c",
> > > > > +    ];
> > > > > +
> > > > > +    #[cfg(feature = "generate")]
> > > > > +    generate_bindings(&files);
> > > > > +    build_gpiod(files);
> > > > > +}
> > > > 
> > > > Shouldn't bindings wrap libgpiod and dynamically link against it rather
> > > > than building and linking statically?
> > > 
> > > There are few problems I faced, because of which I had to do it this way.
> > > 
> > > - I couldn't find a way to do a "Make" for libgpiod from here and then link to
> > >   the resultant library.
> > > 
> > > - libgpiod may not be automatically installed in the environment where the end
> > >   user of these Rust APIs exists. So I had to build it.
> > > 
> > > - And then the API is changing a lot, maybe down the line once it is stable
> > >   enough we can change this to something else.
> > > 
> > 
> > Sure, it is a problem, but static isn't the solution.
> > You should be able to get the appropriate paths from autoconf, but I would
> > refer you to Bart on that.
> 
> I am still looking for some help on how to link this dynamically.
> 
> FWIW, the problem is that the user crates, like vhost-device, will mention
> libgpiod as a dependency crate and likely won't have libgpiod installed in
> environment. So build.rs here needs to do some magic so the definitions are all
> available to the users.
> 

The Rust bindings themselves should be building against the local build
tree, so well known relative paths.

For users, require they have libgpiod installed and use pkg_config to
locate it?

Is that what you mean?

Else, how do other Rust crates wrapping dynamic C libraries do it?

Cheers,
Kent.

