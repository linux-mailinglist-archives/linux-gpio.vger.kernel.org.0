Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9FB96379FB
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Nov 2022 14:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbiKXNcg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Nov 2022 08:32:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiKXNcf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2022 08:32:35 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF792DFE
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 05:32:32 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id io19so1469840plb.8
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2022 05:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f2zEmWgfF9XcFkkwimYQG/5ddYoTnSToCGn8/7U6hD4=;
        b=VhTkCLdwhQtz3hypQ2XPt94p90TOw6lj2N9V+ZOIvI1QlZHHlfY5TsYXX3QEp7X2C9
         wuZStbF36h0fvGfRmi2iq2qGMpZWGo6uaMgEMFarvIGBTYUr7GXb61gJITZ/ZPH/Ywcv
         kxyWFEkJZ7FK9g3okz9d80yBPHMDnJnS277CXFD69zB/kQeFPS89pssq1SS94zenxKg9
         1wyO/GIQR2AxWu97TWUNFflWvQdNLedQY2Ov/1N54O+2J+dG4im7vGGUzEqVOrAPuWgH
         u/ut6stpZsFPydDfHbKGxbs1Cu/BY2CSHtBqbFGJT9wA0M4t61dH2cQUMSQeKexs/+9T
         y8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2zEmWgfF9XcFkkwimYQG/5ddYoTnSToCGn8/7U6hD4=;
        b=aF/F2gOqSd6Apv4W3GDm2ReaiFZ6gYRKFLumeuFmfOM46ogUv1aqH7fWdEVIuugXnY
         4yIx36Wj58PNoKOZrFsIlgWMiYNPlSbPDgxn/Vfw/mJQELGqqUK8bOp1roydxB7HvLB1
         pl/W1tuAKM0Y1ouTjfBdhXos2Ldbim8nSYNoBqSxPjvq1z9GuxNL6I25DHxdSSrfv6NC
         fyQ3G1b+QGYfrMyVRrtZ7cjWs+dqTbYn85XFjdC7hRN126bOR7et1IOVsWUH3jzR0xH1
         ZCW36SecBvtKQAxxtDYlBtWwZCUSHtrFQDZpILfHvHEfMs+DAI0thXrd7awLM0tC2f9f
         quTA==
X-Gm-Message-State: ANoB5plbio7F63i2KnANN9FUohK1XYbHRuYU46Y537eY+tIVsObEVsKX
        WTdAX6oY/QPlP0FAH/xuovqDNgLrvu8=
X-Google-Smtp-Source: AA0mqf7LGYhWIakqNspT+fjJlpYjONQ5EDSF9bJXiG9vie2uR92gb5XtkK1FN63mbNgOep4J7Objfw==
X-Received: by 2002:a17:902:a511:b0:187:3bc8:fc56 with SMTP id s17-20020a170902a51100b001873bc8fc56mr15446728plq.83.1669296752392;
        Thu, 24 Nov 2022 05:32:32 -0800 (PST)
Received: from sol (110-174-14-241.tpgi.com.au. [110.174.14.241])
        by smtp.gmail.com with ESMTPSA id ca16-20020a17090af31000b0020ad86f4c54sm1188462pjb.16.2022.11.24.05.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 05:32:30 -0800 (PST)
Date:   Thu, 24 Nov 2022 21:32:25 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: libgpiod: rust bindings and bindgen issue with C enums
Message-ID: <Y39yackN2u7q2Fxs@sol>
References: <CAMRc=Me-LcGx1GUFZ3NnxvbW=wcKnpJ+jpDHjYb+20+_7gSCfg@mail.gmail.com>
 <CANiq72=vU1inYDgZJR1ukKkQF=Pj93eD3=Cw6iFE+8xf_+Brbw@mail.gmail.com>
 <CAMRc=Me2hHmEohYwCvnrKVhxNSHts9wrtNCRMp4neBu1AcZnOQ@mail.gmail.com>
 <CAMRc=Mf=ZbVJQJU0QkBMoRUFp1DrV1BJ0nVFn62jd6YMq83HNg@mail.gmail.com>
 <20221124104501.2bfllqmpfegdcs3m@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221124104501.2bfllqmpfegdcs3m@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 24, 2022 at 04:15:01PM +0530, Viresh Kumar wrote:
> On 23-11-22, 19:37, Bartosz Golaszewski wrote:
> > Could you take a look at https://github.com/brgl/libgpiod-private?
> > There's a branch called topic/further-libgpiod-v2-updates. Can you
> > check out commit 5a4e08d546a8ec32757e6c9cc59d7a16939721ea and tell me
> > how you'd make rust bindings work with it because I'm out of ideas
> > (and my comfort zone)?
> 
> https://github.com/vireshk/libgpiod brgl/fix
> 
> For the benefit of others, I am pasting the entire diff of Rust changes required
> to make the C library enums named.
> 
> The part that can be improved, but I am not sure how, is the Error enum. Maybe
> Miguel or Kent can help ?
> 
> The problem is that the InvalidEnumValue Error needs to be generic, which makes
> it:
> 
> "
> pub enum Error<E> {
>     ...
>     InvalidEnumValue(&'static str, E),
> };
> 
> pub type Result<T, E> = std::result::Result<T, Error<E>>;
> "
> 
> Where E can be i32 or u32. Currently I just cast it everywhere as i32 to make
> it work.
> 

I don't see this as a problem for generics.  Whether the enum is signed
or unsigned doesn't need to affect the Error variant, much less the whole
Error type.  The Error doesn't need to respresent the type of the source
of the error, it needs to represent the type required to convey
information to the user.
Just accepting that the InvalidEnumValue variant expects i32, and casting
from u32 if necessary, seems appropriate to me.  Unless there are some
extreme values you are concerned about - but then you always switch it
up to  i64 ;-).

What is the problem that generics solve - that a subsequent bindgen or
gpiod.h change might change signage on you?  If so then cast them all
- even if the cast isn't necessary at present.

Cheers,
Kent.
