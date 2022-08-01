Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEB92586B33
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Aug 2022 14:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235009AbiHAMrR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Aug 2022 08:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234970AbiHAMrA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Aug 2022 08:47:00 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47828BF46
        for <linux-gpio@vger.kernel.org>; Mon,  1 Aug 2022 05:38:14 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id b4so371522pji.4
        for <linux-gpio@vger.kernel.org>; Mon, 01 Aug 2022 05:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xQsl16AE0/Dt5xieUwGf0aLTBl7ZVzxSiEMFFObwpqM=;
        b=lYOJfR7KIBlzWynG5+GfdTLiWHkLS9Ncxv/xEiQ+vY+3EzpCjtT1xT8QQRzLCUQiSQ
         n2etievvwAs47kiZ4+lTjs6m/j3c8BHVCs21brysZ9mMb856YziwzkAjSWgKY+WhXQfO
         f6xR6J9s4lpZgs1WlmWrtLpD8zrj3w5N/qrgn4mGMpCHlPZiEfbJ8VJ5L1gnckL7XD0m
         qjL6EAmFHAHLcNEEVNf5otQWD+QJUyGlHCXT5OpDBrPKfHM8bXQD/EP4rdUV09YHiUns
         WilFJPN5sM5sj8pD1mSNR6jKnxDWa4TxUOtiPo9StwyXvmoP9mIgxKXMDFFo7wzLBcWW
         tVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xQsl16AE0/Dt5xieUwGf0aLTBl7ZVzxSiEMFFObwpqM=;
        b=PUv3GoMjm6vnEqxjKcfdTDATHowl8DPRemHSuyjCKOt6lvT4FU1c5NKErIUw0rPFH9
         bNWQUNZbIQnzHWX9ocKeBqOwcvRbti+m3dh4dsXO46/tS/LUWa7D1y8TMa3Dga1WDyI6
         AO5YnPXsokp8uh4U1eMVioLx7i6P+tOGihO+ExwfziB7r/vs0dyprZmdj8UURD/tt8r6
         w8MQvsoDCxEs+QAqG2XVRw0J9yV/gD7XwNiCoT9yPA5x5QTtdExz3yaX3jbcAZW582o6
         ipsqiI2GhH1X24T7T2xe6as2A+yZS2NezsUHl68ktFgXpcGQODE2/UVn1ORX6cYO3TTN
         eK1g==
X-Gm-Message-State: ACgBeo1wVljc/rNuafRqetiavuNkwIf41lUflNDgcOr2TgEDBld2RqUS
        5LJsmC5n1jVjxk6qieOu9e8=
X-Google-Smtp-Source: AA6agR7kyfwGgBsDgchxp5qIUhMzBEi2tZTrc23VVYfMbeOKofJ3ohPa0hxVIMnzhg0/GE5Q+SmQgA==
X-Received: by 2002:a17:903:1c5:b0:16e:e892:fa14 with SMTP id e5-20020a17090301c500b0016ee892fa14mr5321363plh.158.1659357493701;
        Mon, 01 Aug 2022 05:38:13 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id 22-20020a630b16000000b0040ca587fe0fsm7256942pgl.63.2022.08.01.05.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 05:38:13 -0700 (PDT)
Date:   Mon, 1 Aug 2022 20:38:06 +0800
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
Subject: Re: [PATCH V4 7/8] libgpiod: Add rust tests
Message-ID: <20220801123806.GA42433@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <78b3ee21dec2a66003c2eae2800e9699a8ecd180.1657279685.git.viresh.kumar@linaro.org>
 <20220727025847.GG88787@sol>
 <20220801115402.uk4gsptesrisohvk@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801115402.uk4gsptesrisohvk@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 01, 2022 at 05:24:02PM +0530, Viresh Kumar wrote:
> On 27-07-22, 10:58, Kent Gibson wrote:
> > > diff --git a/bindings/rust/tests/line_request.rs b/bindings/rust/tests/line_request.rs
> > > +        #[test]
> > > +        fn set_bias() {
> > > +            let offsets = [3];
> > > +            let mut config = TestConfig::new(NGPIO).unwrap();
> > > +            config.rconfig(Some(&offsets));
> > > +            config.lconfig(Some(Direction::Input), None, None, None, Some(Bias::PullUp));
> > > +            config.request_lines().unwrap();
> > > +            config.request();
> > > +
> > > +            // Set single value
> > > +            assert_eq!(config.sim().val(3).unwrap(), GPIOSIM_VALUE_ACTIVE);
> > > +        }
> > > +    }
> > 
> > Test reconfigure() failure modes.
> 
> What are we specifically looking to test here ? I am not sure I understood which
> failures modes I should target.
> 

reconfigure() can return E2BIG if the configuration is too complex to
encode into uAPI structures.  There are only 10 attribute slots in the uAPI
config, so more than 11 lines with distinct configs can't be encoded.
You want to test that you propagate that error correctly.
I typically test this by giving each line a different debounce value.

> > Test you can reconfigure all values for all attributes (not all values
> > for debounce obviously - just the flags).
> 
> This I have done now, with request.reconfigure_lines().
> 
> > Similarly for request_lines (ideally in chip.rs)
> 
> Isn't this same as the above one? I am not sure again what I should test here.
> 

The request_lines() could be considered sufficient to test
the conversions for both request_config and line_config objects.

But testing request_lines() and reconfigure_lines() doesn't just test
those conversions, it checks that the functions don't mess with the
config along the way.
If you want to take that as a given then sure, just testing the
config variants for request_lines() will do.

Cheers,
Kent.

> I have pushed my current changes here, if it helps:
> 
> git@github.com:vireshk/libgpiod.git master
> 
> -- 
> viresh
