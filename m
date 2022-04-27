Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1A05110D1
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Apr 2022 08:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357961AbiD0GFL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Apr 2022 02:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357954AbiD0GFK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Apr 2022 02:05:10 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF33B49241
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 23:02:00 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id z16so744334pfh.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 23:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2ZBLLBDcoBpFhEDXMHyyfBKFIV0DGVf1q7v5SuK7PuA=;
        b=gFvu7sNrvdKr8wNwb6yuLU7MZ9K9YO5sbZGT0SZp3V+0V7LsN+apwCTP79T45r13fU
         KiKF6S5Xl7YYyv+kspyb9Qnnbv7vY9y6n4sfOJpYUN5R4e5Atc2tIwo6YY8Mz+q1vr0q
         5QA5mOL+5B0VO4JI+DAKcazHoIkL8lp7muZbAbdfTuhDQ4kKZvBC8pbpPvvICKiwZ0xV
         dyJn5VjwITFWbieEn9vio6nlPBqonv5LPL26fWHx9ez3jopDBbhLVxNoMU6ef5/FhNnZ
         +9Dgo2cY+GVA5fmGssWg8AxD8/e5haeKBbfjgxj+Kr6G19CjZ+pcA1vqcYbdW2hGzYRj
         pENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2ZBLLBDcoBpFhEDXMHyyfBKFIV0DGVf1q7v5SuK7PuA=;
        b=C7XH+Ol8L4X6iswDKJzSdH7y6ORePooQ1biPZoUZT8KAznMXHV/JI3JK8HxUohyGD/
         RCXLNYycI3gL5XjcmOQOndKfkK375kFhkFoH+eusg/dwNJDWpFhO+agf+NTbdDYniGAB
         5PrxmUc3k3pcChcDxE1Vwl1umUAq9qc+DSq+RuJwZ3tglxJy0tgzUr767jpwSK09RLkt
         kW901X8cwID7d9GoY19PI+QkGcxIZxDDPuQ3iaK0VoLpjS5lCuZTeXFLGFP5iDDJp6Fj
         Vtd72cMpERYSrT3WJR9/Qmw9p5MSl6Z+Cjrof5c2GsRlH5Tjy9lI0YtnOJ2/x1coG3H/
         hLWw==
X-Gm-Message-State: AOAM532inNyhNs9uRo57PA1MzxZPEzu38BHjFzOo7fIxEoiJ4gwJhORm
        qYuziIouX+AnSjklrzfH4SE=
X-Google-Smtp-Source: ABdhPJw2gFGoleKn0K1LewGpex7PYgFj+twm+dlhruPCzUygQnPpsJEhK4tbqky2myKRkif5UwOOmw==
X-Received: by 2002:a63:e51:0:b0:3a4:9d22:1fd5 with SMTP id 17-20020a630e51000000b003a49d221fd5mr22792182pgo.586.1651039320081;
        Tue, 26 Apr 2022 23:02:00 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id d16-20020a056a00245000b004f771b48736sm18766618pfj.194.2022.04.26.23.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 23:01:59 -0700 (PDT)
Date:   Wed, 27 Apr 2022 14:01:53 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexander Stein <alexander.stein@mailbox.org>,
        David Kozub <zub@linux.fjfi.cvut.cz>,
        Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>,
        Michael Beach <michaelb@ieee.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v6 5/5] bindings: cxx: add implementation
Message-ID: <20220427060153.GB118500@sol>
References: <20220426125023.2664623-1-brgl@bgdev.pl>
 <20220426125023.2664623-6-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426125023.2664623-6-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 26, 2022 at 02:50:23PM +0200, Bartosz Golaszewski wrote:
> This contains the actual implementation of the v2 C++ bindings.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

[snip]

> +
> +GPIOD_CXX_API ::std::size_t line_request::num_lines(void) const
> +{
> +	this->_m_priv->throw_if_released();
> +
> +	return ::gpiod_line_request_get_num_lines(this->_m_priv->request.get());
> +}
> +
> +GPIOD_CXX_API line::offsets line_request::offsets(void) const
> +{
> +	this->_m_priv->throw_if_released();
> +
> +	::std::vector<unsigned int> buf(this->num_lines());
> +	line::offsets offsets(this->num_lines());
> +
> +	::gpiod_line_request_get_offsets(this->_m_priv->request.get(), buf.data());
> +
> +	auto num_lines = this->num_lines();
> +	for (unsigned int i = 0; i < num_lines; i++)
> +		offsets[i] = buf[i];
> +
> +	return offsets;
> +}
> +

My previous comment was "Cache num_lines locally rather than calling
num_lines() several times."

You cached it in the wrong place - it should be first thing in the
function, so you only call it once, not three times.

And the throw_if_released() is still "redundant as this->num_lines()
also does it", and it is the first thing called here - after the
throw_if_released().

And I would've made this patch 3/5, not 5/5.

But I'm fine with this set going in either way - in fact give its size
I'd rather see minor tweaks applied later than go through another round
of review.

For the series:

Reviewed-by: Kent Gibson <warthog618@gmail.com>

I really would also like to see some feedback from C++ developers that
will actually be using it, as they have a bigger stake in it than I do.
But that is up to them.

Cheers,
Kent.
