Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03A875B993E
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Sep 2022 13:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbiIOLB4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Sep 2022 07:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiIOLBz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Sep 2022 07:01:55 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9A18FD75
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 04:01:54 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id q9so7868800pgq.8
        for <linux-gpio@vger.kernel.org>; Thu, 15 Sep 2022 04:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=4NcK1AvpUcI16sxS33GVWL1porUczX36mfh6Rzdkq04=;
        b=h7u3xdYlU5F/0EDTiAHTj0rUuWUIU68s2k8ONdM0BdDvg4err2FTg1fbrXTrV6gbXR
         MEJ70zmZKeQpP2mIwHpSgslBSoqfSi3WAEkKRQ10HL2tiyNs2i3V7L6wauhL8ufom2mt
         9DOyM/vKZpEredy6QifmPg/Dsyym74tJAM4VFLWmaukAyDHQLEQMJ4ZRupGPJTKqLVj2
         z4dojQWdIzkLFFBG0pCAgaJunzKFPWfoq97oV+r3513H0Fc2fZaWoaGCBJbSp2c68vbQ
         xeyktdyyQFXn+0Avc5lYqmYm/OgalPhXsD6JCuDYaxxGdp/Ua3DM57hz6s/dRIY5T0iw
         +gJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=4NcK1AvpUcI16sxS33GVWL1porUczX36mfh6Rzdkq04=;
        b=bPmZCkK4fpKGWSa1+Q1MCyJvyTdO9JIyT5gS0eEry/4qIJNrYktrc2CxXKW3SA5egL
         41o4fjtT7+FPIUBv6VPtLF7GHh/hlUhVAI/L9XQQlJDBeUzSRd/GQspvHdaQZCUA9SzU
         Dt0IQvRjSvLsWgHRsOUVKr5npPz/TV8QjzGIxkxeYJ7OY/W1h4rDYjYppbLPy9OmbNWO
         Yngjn1UlDGjQHfIZ96oX7daCfXcW8CiMqZW8KqSbrUwQUCav2Mi+iyBRc5aJq87q9dRa
         9fJ8hrNmCwUn7UI5dHiW/xk9ZwsnF59OPCjQqTIhw4TNEMjX7q2phBSnDqvITV/74ZrC
         6psA==
X-Gm-Message-State: ACgBeo2zrbxF5GpciV4iL5GqoX6vfaaJLF6dUCYVIFBmXMSk9rRpozvx
        CLYu7zxWrXidUaeC0w15PxU=
X-Google-Smtp-Source: AA6agR6yocAjKPo7dLsK513fzDZf397YJjnmylNoDRtxmpPf8Ra9BeVQ7BR5inc+tXw9x334trQw4w==
X-Received: by 2002:a63:1d1a:0:b0:433:f6ea:dce6 with SMTP id d26-20020a631d1a000000b00433f6eadce6mr34936813pgd.178.1663239713624;
        Thu, 15 Sep 2022 04:01:53 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a1f4300b001f2ef3c7956sm1393915pjy.25.2022.09.15.04.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 04:01:53 -0700 (PDT)
Date:   Thu, 15 Sep 2022 19:01:48 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v2] bindings: cxx: tests: use the builder
 pattern for the GPIO simulator
Message-ID: <YyMGHEbFTs02HguJ@sol>
References: <20220915084723.19910-1-brgl@bgdev.pl>
 <YyL4AwaJIO9kim9s@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyL4AwaJIO9kim9s@sol>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 15, 2022 at 06:01:39PM +0800, Kent Gibson wrote:
> On Thu, Sep 15, 2022 at 10:47:23AM +0200, Bartosz Golaszewski wrote:
> > In order to make the interface more elegant use the Rust-like builder
> > pattern for the GPIO simulator class.
> > 
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> 
> > -	::gpiosim::chip sim({{ property::NUM_LINES, 8 }, { property::LABEL, "foobar" }});
> > +	auto sim = make_sim()
> > +		.set_num_lines(8)
> > +		.set_label("foobar")
> > +		.build();
> > +
> 
> You do this a few times, so perhaps add a helper to create a simple
> simulator with a given a number of lines?
> 
> (I called the equivalent in my tests a Simpleton, borrowing LinusW's
> practice of naming things after yourself.
> Not that I'm suggesting you use that name.)

Good grief - I meant LinusT.  See what I mean?

Cheers,
Kent.

