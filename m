Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46C4A637C43
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Nov 2022 15:58:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiKXO6Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Nov 2022 09:58:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiKXO6I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2022 09:58:08 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600C4827CF
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 06:58:06 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so5337018pjs.4
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 06:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E6p7AkDD+OqFnhMGEjs+CpV7AC/in3vZeINhFqhTEOI=;
        b=asyClKKLWn/JenIWYKNu1099+PW7OuKa+FOGXJoyjswV6ej6A+fxYfTzEbvgX7lWUQ
         KHb6QsIjLBUmTh0MRxkEdU0qehHYEncZGeN8rb6/xw9kGG0cp2L/1CCynzRt9vuoPWK3
         dsI2yzHk6I7/AKy+D7/B3YfyYkZeDH/xAKnIW4qCBuWZtWiTm3saTZQEIpkqANWBh9pO
         u4bT/3wwDOpWOteI14df0q/9rn0nMw21TTWIRVeVL/QtLs1Ui5yzTHUgK0H9RjLU7koh
         pCf4eIMItCFdgHm093VLh26cGW4NICDfCSudri265r8wwlRP056/72fQw3G+qlACkcGb
         3kYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6p7AkDD+OqFnhMGEjs+CpV7AC/in3vZeINhFqhTEOI=;
        b=yd1OFdt1Adn4sE1E7Padn+FOCvApAc+6nkHEUFQ/CFA83fdX/7OvxmFx9tefQ10+S3
         h4J9EntwvGLxM+sQ3CPb7AKM8tquuS7AMba1CwSVA3FFAQJumXw5Hhvt5qSb61sodasS
         ErbZawg4sZBNiMPE1gVtgVqlaWbrS+s0phsgSUlLjXie1TqKRjm5Pa7WwkW/MMdjBN3h
         exNDrJRprwX/qLw22n+cjqv62qa0Y0eYM+NnLg3lN3ntynkRKCDro10BAixdiVK8fUCc
         NlzXGvQrJEuE+CqaW6PYrK5fixDe6Mz6SihOtvdbdllCj0ZJzukU+KBfSaWmI1W1kNO3
         9sJQ==
X-Gm-Message-State: ANoB5pmBkE52moy0fF51wQOfvwBtTNlbHyZrQC2kQrUNNDaBdYO5eJwB
        LJf1A+nOiZgv9uizjNplPPc=
X-Google-Smtp-Source: AA0mqf7j8HlwieHiTifmFHrnTRrlWDpH1lmoha6U4z0g84lTk0yMlDbvfkHJ6u0LGOKNXeOjUDGjYw==
X-Received: by 2002:a17:90a:1a12:b0:20a:6ffc:f0c6 with SMTP id 18-20020a17090a1a1200b0020a6ffcf0c6mr42413422pjk.49.1669301886382;
        Thu, 24 Nov 2022 06:58:06 -0800 (PST)
Received: from sol (110-174-14-241.tpgi.com.au. [110.174.14.241])
        by smtp.gmail.com with ESMTPSA id j3-20020a170902da8300b00186b549cdc2sm1428858plx.157.2022.11.24.06.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 06:58:06 -0800 (PST)
Date:   Thu, 24 Nov 2022 22:58:01 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: libgpiod: rust bindings and bindgen issue with C enums
Message-ID: <Y3+GeREjXKkTQY6Y@sol>
References: <CAMRc=Me-LcGx1GUFZ3NnxvbW=wcKnpJ+jpDHjYb+20+_7gSCfg@mail.gmail.com>
 <CANiq72=vU1inYDgZJR1ukKkQF=Pj93eD3=Cw6iFE+8xf_+Brbw@mail.gmail.com>
 <CAMRc=Me2hHmEohYwCvnrKVhxNSHts9wrtNCRMp4neBu1AcZnOQ@mail.gmail.com>
 <CAMRc=Mf=ZbVJQJU0QkBMoRUFp1DrV1BJ0nVFn62jd6YMq83HNg@mail.gmail.com>
 <20221124104501.2bfllqmpfegdcs3m@vireshk-i7>
 <Y39yackN2u7q2Fxs@sol>
 <CANiq72=ufe1eGRVAcHcn9TZiMx2-HC-QQPZMbss5ErSdcpMyBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=ufe1eGRVAcHcn9TZiMx2-HC-QQPZMbss5ErSdcpMyBA@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 24, 2022 at 03:46:27PM +0100, Miguel Ojeda wrote:
> On Thu, Nov 24, 2022 at 2:32 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > I don't see this as a problem for generics.  Whether the enum is signed
> > or unsigned doesn't need to affect the Error variant, much less the whole
> > Error type.  The Error doesn't need to respresent the type of the source
> > of the error, it needs to represent the type required to convey
> > information to the user.
> > Just accepting that the InvalidEnumValue variant expects i32, and casting
> > from u32 if necessary, seems appropriate to me.  Unless there are some
> > extreme values you are concerned about - but then you always switch it
> > up to  i64 ;-).
> 
> Yeah, I am not sure what a generic `Error` buys us here.
> 
> If one really wants to preserve whether it is signed or not, that is
> only two possibilities, not an open set of them. Moreover, I imagine
> one wants to constraint them for users, rather than let users provide
> the type `E`.
> 
> Thus one could have a sum type with 2 variants like
> `InvalidEnumValue(..., Either<i32, u32>)` or something more explicit.
> 
> But that is assuming there is a need to preserve it. What is the
> variant meant to be used for by users? e.g. if it is just for
> reporting, it probably doesn't matter. Actually, does the user even
> need the number? Could `InvalidArguments` be enough?
> 

AIUI, it is just for reporting.  The value itself is helpful to
understand the root cause of the problem.  Not critical, but nice to
have.

> Looking at it a bit more, I am confused why the error is possible to
> begin with. There is `Value::new()` which appears to be public and can
> return `InvalidEnumValue`, but why should it be used by users? They
> should create the `enum` directly, no? And for the other `new()`s that
> also return `InvalidEnumValue`s, I see they are `pub(crate)`. That is
> what I would expect, but still, why is the error a possibility to
> begin with?
> 

The possibility for error can arise from running against a later
libgpiod that has additional values for the enum that these bindings are
obviously unaware of. e.g. the hte event clock recently added.  If you
had bindings built prior to that addition there is no Rust variant
in the event clock enum for that to map to.

Cheers,
Kent.

> For instance, somewhere else the library does `Direction::new(...)`
> with a value from the C side. The values from the C side must be
> correct, i.e. it is a bug otherwise, right? Thus one can trust them,
> or assert them, or if one wants to avoid panics for something that is
> a bug, one could return a `InternalLibraryError` with no extra
> information, because there is really not much users can do with the
> error details apart from knowing there is a bug in either the Rust or
> the C side.
> 
> I have taken a quick look at the C++ side for that same case, and from
> a quick look, C++ appears to throw if the mappings are wrong, so it
> sounds to me like you can similarly assert the validity in Rust and
> remove the `InvalidEnumValue` variant altogether.
> 
> Cheers,
> Miguel
