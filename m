Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC06D582396
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 11:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbiG0J7y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 05:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbiG0J7x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 05:59:53 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5CAB27B29
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 02:59:52 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id e132so15496750pgc.5
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jul 2022 02:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=obQ9U7uZXPP88BlCuv21EwK0P4WO7+mgYIIZh9Ri3rI=;
        b=O194OOxrpTQZvilm5neF3l9bKQ15G9ooHbX3hk9sCMqbtWSpyClCkj4OI6gxvunwvy
         YEb0kTjufRT2bCe++GOTj8gj2NJ5omHZQAju2HINt3Mdqx/DYr+9ZprK+ZGRt/IfRXb8
         zLz4nPhMXdFsUlqjw38VAteu4GEG4wciKrFhrlZvVtBNLZDe+fl/jUN4/VI0QLXGXu5H
         7hx4jwLXuzfxRQ5cBjKv5wOGgdSGUau1hYOMfgpE4LsPmPi342UzT1Sfgef8nFQ3Iv8h
         TgcSnQBiq7jucd/k7KXIwRXIqrxA3Hr8KCBCxVAFFjx3OAALdLJQLXAGnfta3gT9Aitx
         q2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=obQ9U7uZXPP88BlCuv21EwK0P4WO7+mgYIIZh9Ri3rI=;
        b=08gPbPr0v0717YaqtzGnzv48z4VNftJZ9d4khvGywPtHVh84TyvxkdbN7fHKKbH1SG
         yYtPSQy0ZBkv0Z++KcsoEjdatRMGkVkPq1DM+Tve/oih8lLwtygqgMWqQabzpzAEMMWk
         pE45pSii3gd6R+9p2jfyTU1MTl80tNTg6m11k3e2d5+fF/ArxFOnIeTtjyKq56rJ6oFO
         ax3wXOQ4JkHAosuCIJ1NiL837N17dPZ6jvXWorBudnMf6HFuAEJ2DKY6zFpjU9sIphEr
         v6eF7cRtf8yXJYdgUzNHDeYZQpb+G5lzYcLsz05jX3lpxNWaUwZJRoizONBGylPIAFdd
         60UA==
X-Gm-Message-State: AJIora845mnyBZbcZIvedu0QDJy8eQAQGdpbwoFrMiF+Y00Nfd8xWYcn
        S/3+pLpcXeKwwm4ot+njX47WKlYq5xE=
X-Google-Smtp-Source: AGRyM1sLiq1WNMonOl1xJD+ED8OdhX+FYe7qcN0n7Wcs7JNKW+uAyr9FuYlXImiiChXDCTI9eP3SqQ==
X-Received: by 2002:a05:6a00:993:b0:52a:dd93:f02d with SMTP id u19-20020a056a00099300b0052add93f02dmr21584344pfg.12.1658915992344;
        Wed, 27 Jul 2022 02:59:52 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id w9-20020a1709026f0900b001636d95fe59sm13215984plk.172.2022.07.27.02.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 02:59:51 -0700 (PDT)
Date:   Wed, 27 Jul 2022 17:59:45 +0800
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
Subject: Re: [PATCH V4 5/8] libgpiod: Add rust examples
Message-ID: <20220727095945.GA117252@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <acd12e70cfb30f04761f3c2efc868ec138c90c63.1657279685.git.viresh.kumar@linaro.org>
 <20220727025815.GE88787@sol>
 <20220727092319.hwblcns4zcfbi4kk@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727092319.hwblcns4zcfbi4kk@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 27, 2022 at 02:53:19PM +0530, Viresh Kumar wrote:
> On 27-07-22, 10:58, Kent Gibson wrote:
> > On Fri, Jul 08, 2022 at 05:04:58PM +0530, Viresh Kumar wrote:
> > > diff --git a/bindings/rust/examples/gpioset.rs b/bindings/rust/examples/gpioset.rs
> > > +    let rconfig = RequestConfig::new().unwrap();
> > > +    rconfig.set_consumer(&args[0]);
> > > +    rconfig.set_offsets(&offsets);
> > > +
> > > +    chip.request_lines(&rconfig, &config).unwrap();
> > 
> > Wait rather than exiting immediately?
> 
> Wait for what exactly ?
> 

For long enough for the user to check that the line is set, as there is
the possibility that when the line is released it will be set back to
its default value and you will get users reporting that your set
doesn't work ;-).

So wait for a keypress?

> > And, as mentioned elsewhere, add a gpiowatch example.
> 
> Will do, sure. Any existing example of the same will help though.
> 

There is an example in my proposed tool changes for v2[1].
It is very similar to gpiomon, just on the chip and with line info
instead of edge events.

Though that example is more complicated than you need as it supports
named lines and operating over multiple chips.
Hopefully you can see past that.
The basic operation is watch the line, then wait for the chip fd to be
readable and read the info changed event from it.

You would only unwatch if you no longer had an interest in the line,
which I expect will be the case in the D-BUS daemon that Bart has
suggested.

Cheers,
Kent.

[1]https://lore.kernel.org/linux-gpio/20220708120626.89844-5-warthog618@gmail.com/

