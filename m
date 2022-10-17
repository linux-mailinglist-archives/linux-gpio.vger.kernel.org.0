Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF806601126
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 16:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbiJQObB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 10:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiJQOa7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 10:30:59 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3044350517
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 07:30:57 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id r18so10578713pgr.12
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 07:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SDreUFQXpidd5F204Pw8CEyWr0CQS5N4GdKnyQSC69M=;
        b=Yiyg1UpxcqsUumLroDHxKVjaDMmadlLZ11v4v0sWdJD2CgtQsaIC2Qs57m7Mp7EY2Y
         dg8mP65hKs6rw9rHvmKC0HiC8rKcqILdmvv/MZhA7uv2SWEpieFwvzFPNMlo0mPtetse
         ZKy51CucrwkHgExHdn5COzC8hycL4Bw15Ba99teNpv89fkN0zcbEv3g51hmZ284Tw7oP
         SfIhJCcPdrYDFAxvraf+VyWpI7bdUk13NPa7PtbJhhcHP1u/sLdGL8SeCHn2iRglj1yF
         z4blYtJrv78DZC7rnE2yrxEv1OFk/U8WJERFl+uD4KDnUmd5FqKeZRw/KK9A9vlnEaLE
         kLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDreUFQXpidd5F204Pw8CEyWr0CQS5N4GdKnyQSC69M=;
        b=oJW2WRlht4pqWZ6g7nBkfj0j/VMvEnxkt1Cb0A6i1HjolNybRu6BPOQnJkvxRI3bAV
         4zogm+lR8HJWGRNjeggk47BerP9PJ/njlwBB5ti/gX0O/u9hpQQ78iwUHI0XMO9itGht
         bjTLe4b8CtZV4nRj3z+d3rR61V7uSOeQY3Bkmkvd754AVs3rRRA3PQu5GLL3recAh8em
         CdkcuQyxQwH9dlCo0NM1DsiehPRcYdkqwT3EyMWs/dfScEtsGIxlOZesbP5i6/HL3R4k
         4AGzDzadAftenf7XEzVUyjvEjBU8JkkaIna460nHmrXB5qGS1K14ep3WnLHyTXL1+C9E
         UwNQ==
X-Gm-Message-State: ACrzQf2EufFvGfqtkEx+Y8iyiAdqdL/7ahq4cjQZbs0f96kk6S7cRlz6
        RQeqKeyAJrYIgJvoHhT3IaM8vuP0mQA=
X-Google-Smtp-Source: AMsMyM4eP7P3kx2EqfDm6wN3i2ozUUOa/SSyLlYRdr534lGIP7fj4ewmnV8+ksLz78bpXiMiZXdvsw==
X-Received: by 2002:a05:6a00:22cf:b0:563:9633:298c with SMTP id f15-20020a056a0022cf00b005639633298cmr12771996pfj.54.1666017056584;
        Mon, 17 Oct 2022 07:30:56 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id u13-20020a170903124d00b0017f80305239sm6743646plh.136.2022.10.17.07.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 07:30:56 -0700 (PDT)
Date:   Mon, 17 Oct 2022 22:30:49 +0800
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
Subject: Re: [PATCH V7 7/8] libgpiod: Add rust tests
Message-ID: <Y01nGciXfkXpTRTE@sol>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <b609b421bf39ada7a1e4460e10a201a318be7a28.1665744170.git.viresh.kumar@linaro.org>
 <Y01R+58inH5MgXl7@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y01R+58inH5MgXl7@sol>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 09:00:43PM +0800, Kent Gibson wrote:
> On Fri, Oct 14, 2022 at 04:17:24PM +0530, Viresh Kumar wrote:
> > Add tests for the rust bindings, quite similar to the ones in cxx
> > bindings.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> 
> <snip>
> > +
> > +        #[test]
> > +        fn clock() {
> 
> My preference would be event_clock(), but I can live with clock().
> 
> > +            let mut config = TestConfig::new(NGPIO).unwrap();
> > +            config.lconfig_add_settings(&[0]);
> > +            config.request_lines().unwrap();
> > +            let info = config.chip().line_info(0).unwrap();
> > +            assert_eq!(info.event_clock().unwrap(), EventClock::Monotonic);
> > +
> > +            let mut config = TestConfig::new(NGPIO).unwrap();
> > +            config.lconfig_clock(EventClock::Monotonic);
> > +            config.lconfig_add_settings(&[0]);
> > +            config.request_lines().unwrap();
> > +            let info = config.chip().line_info(0).unwrap();
> > +            assert_eq!(info.event_clock().unwrap(), EventClock::Monotonic);
> > +
> > +            let mut config = TestConfig::new(NGPIO).unwrap();
> > +            config.lconfig_clock(EventClock::Realtime);
> > +            config.lconfig_add_settings(&[0]);
> > +            config.request_lines().unwrap();
> > +            let info = config.chip().line_info(0).unwrap();
> > +            assert_eq!(info.event_clock().unwrap(), EventClock::Realtime);
> > +
> > +            let mut config = TestConfig::new(NGPIO).unwrap();
> > +            config.lconfig_clock(EventClock::HTE);
> > +            config.lconfig_add_settings(&[0]);
> > +            config.request_lines().unwrap();
> > +            let info = config.chip().line_info(0).unwrap();
> > +            assert_eq!(info.event_clock().unwrap(), EventClock::HTE);
> 
> I was surprised to find HTE tests passing on a kernel without CONFIG_HTE.
> I take that as being a kernel bug (GPIO_V2_LINE_VALID_FLAGS includes the
> HTE flag unconditionally - which is wrong IMHO).
> 

Bah, I was running an old-ish kernel (5.19) in my test setup.

A check for this was added in my HTE tidy up -
commit 272ddba0047 "gpiolib: cdev: compile out HTE unless CONFIG_HTE selected"

So the HTE tests now do fail with a more recent kernel (6.0+) - unless you
have HTE support.

Cheers,
Kent.

> You probably shouldn't assume HTE works - unless you have a system that
> supports HTE.
> 
> Other than that the tests look good to me, though as with the Python
> bindings I've only skimmed them.
> 
> Cheers,
> Kent.
