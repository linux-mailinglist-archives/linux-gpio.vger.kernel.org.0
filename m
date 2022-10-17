Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F201600FAA
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 15:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbiJQNAz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 09:00:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbiJQNAy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 09:00:54 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05979402F7
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 06:00:50 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id f23so10689959plr.6
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 06:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xYOGiCZ/GVQsfy3KdQpcV1SHJX0m8jkV0q7CF7u376o=;
        b=MM0lKRDIe8brK7O5toXVE5w+h+IhnZ+PepzGNBXwaLYuLXRLnocMvdW9QDKGzwA4Y7
         qpvFBJfamg2pwL7DIPZWawcNZL21pwg0bJ4oho7inNnVAR6iiQyigYBbuCucGPzarvs+
         vbCMQi8ghwlTBItYUkHL67qexHxNJeAZuo0L4Egwa9AjTuYm8DvsnbzhkmwuZjKj0dpe
         hSQPSqBDfqqe65QxU3K7RiW2FzMlsR4QEIxolgM+PtTcMLReC/V5jv98BdbQQSm9CVNZ
         Ki3T9ZmpNTQaZ6K1gs3xpST9GyyGOt8CbwYbjO8RXPrTqnM0D1mwcPnVcixNfrRF9q4U
         zDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYOGiCZ/GVQsfy3KdQpcV1SHJX0m8jkV0q7CF7u376o=;
        b=Fj//HhZxIf+tjdOuIHmOQ0JV5QAKrBhFaqGZGE/KKl9oL3Upe5FUkb11MYK0nEfX8G
         4d1YUFych0m+Ko1K2P8zvH8bHEb+JyauLsKRjKkIJKU1bcNO8rn0OU4Sm2y1WsI0ADcV
         OPCqP9o+4V2dvGDBf/QOCm90MBcRIoFsdi97uEcKDWUjQMrhnZocK1NpkUCXzm+teEka
         HSbjavN51ijHw8HrrsMgnoxK2sUGRaIGMUtwn3vW99piBjp9iJTpP1bvy4T93ZuVN48d
         Jy7/Rr0LoMLf9TLzX3LvWy5+BnO1tl5Y8ZThKDt3y6IKcEPaIaKygC4zGDhGrx4u05jv
         zxTg==
X-Gm-Message-State: ACrzQf3rLdam/xY1kyMeNSzMYNUKa7aiE84czMgK2TiDVhWReL5XwveQ
        UKDU2ZyZMp7gTyCTzfAnvWI=
X-Google-Smtp-Source: AMsMyM5Hc/2MwJbQzpHWLqD6ioDyqplI2x2qVH4jl92H/DCvCP+vdd7Np0HmMpLSBs/HtY0FEm4khw==
X-Received: by 2002:a17:90b:350d:b0:20d:5438:f59a with SMTP id ls13-20020a17090b350d00b0020d5438f59amr13176055pjb.41.1666011649425;
        Mon, 17 Oct 2022 06:00:49 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id b30-20020aa78ede000000b0053e6eae9665sm7289808pfr.140.2022.10.17.06.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 06:00:49 -0700 (PDT)
Date:   Mon, 17 Oct 2022 21:00:43 +0800
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
Message-ID: <Y01R+58inH5MgXl7@sol>
References: <cover.1665744170.git.viresh.kumar@linaro.org>
 <b609b421bf39ada7a1e4460e10a201a318be7a28.1665744170.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b609b421bf39ada7a1e4460e10a201a318be7a28.1665744170.git.viresh.kumar@linaro.org>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 14, 2022 at 04:17:24PM +0530, Viresh Kumar wrote:
> Add tests for the rust bindings, quite similar to the ones in cxx
> bindings.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---

<snip>
> +
> +        #[test]
> +        fn clock() {

My preference would be event_clock(), but I can live with clock().

> +            let mut config = TestConfig::new(NGPIO).unwrap();
> +            config.lconfig_add_settings(&[0]);
> +            config.request_lines().unwrap();
> +            let info = config.chip().line_info(0).unwrap();
> +            assert_eq!(info.event_clock().unwrap(), EventClock::Monotonic);
> +
> +            let mut config = TestConfig::new(NGPIO).unwrap();
> +            config.lconfig_clock(EventClock::Monotonic);
> +            config.lconfig_add_settings(&[0]);
> +            config.request_lines().unwrap();
> +            let info = config.chip().line_info(0).unwrap();
> +            assert_eq!(info.event_clock().unwrap(), EventClock::Monotonic);
> +
> +            let mut config = TestConfig::new(NGPIO).unwrap();
> +            config.lconfig_clock(EventClock::Realtime);
> +            config.lconfig_add_settings(&[0]);
> +            config.request_lines().unwrap();
> +            let info = config.chip().line_info(0).unwrap();
> +            assert_eq!(info.event_clock().unwrap(), EventClock::Realtime);
> +
> +            let mut config = TestConfig::new(NGPIO).unwrap();
> +            config.lconfig_clock(EventClock::HTE);
> +            config.lconfig_add_settings(&[0]);
> +            config.request_lines().unwrap();
> +            let info = config.chip().line_info(0).unwrap();
> +            assert_eq!(info.event_clock().unwrap(), EventClock::HTE);

I was surprised to find HTE tests passing on a kernel without CONFIG_HTE.
I take that as being a kernel bug (GPIO_V2_LINE_VALID_FLAGS includes the
HTE flag unconditionally - which is wrong IMHO).

You probably shouldn't assume HTE works - unless you have a system that
supports HTE.

Other than that the tests look good to me, though as with the Python
bindings I've only skimmed them.

Cheers,
Kent.
