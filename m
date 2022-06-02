Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55DDA53B84D
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jun 2022 13:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234509AbiFBLxE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Jun 2022 07:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232849AbiFBLw5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jun 2022 07:52:57 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A70A92B1D6C
        for <linux-gpio@vger.kernel.org>; Thu,  2 Jun 2022 04:52:50 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id b5so4312364plx.10
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jun 2022 04:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XGLcjp4rbRwqm97jWc+2mlFT7EWqc7T9kLofaeVr3wA=;
        b=GFlU4a+IrAxYAiSwyRt4wxmPqBXze9eX74yo7iINyR+oBEK/brFUv4dA25P2yiAET2
         cCD/p592eaYC2CdyT+A65TOXeHtCW/CeKNKM8DKuKrXWlcA6X2i8s2r0I5iBluzeVCxg
         ItJDxZ7UgrkdBIRKaE0jB9OAGkkx6TCVnHcTjGmS1bVR4yrUojaIJUA+dqRGK1cX4pBv
         hizw7JOj1P/QWQ+no7Yoz2DKWqz1388H2hI2tzWJgN8d0WjkBtWhXrY8U1y8NCMOMJTY
         hviU/VpB6O1MXRzmooSuOPA907RBm8td0qZx7HK4S7x5GjQ25suKnU/LUAAxuvKFjIeB
         /8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XGLcjp4rbRwqm97jWc+2mlFT7EWqc7T9kLofaeVr3wA=;
        b=jjmxIVV4/41VlbGpaC8+qEvEwUar91wbmyJPZ78ch0BvepBouQJOf/kixLjKQCmJke
         bgKQpwLMxol7QwuO1H6bBZavtdNPN+M5gXxR6hygO3hoxZJonJMyBtYxYbjKa/Bb/DVd
         5yOrUEx0wFTXuat9xhj2xeI7oY132TYcOXux/i1JBeybDmkkFccRoq6xFYdXFUSH1qxc
         waCj3DuL6Zuib0m5RNFw2LfXYZzg9QHmJnoOxEuwvAfelNWDSGwC/4kVm72VWD4aovMv
         eazDlfWKYAG3NDf/LcAvpswf7pAgwDrMFqy+ZPF4k+MjaoI0kndLvupy9wKZZbfgCnfl
         Vs/A==
X-Gm-Message-State: AOAM5303IHcfH/xSupHyjBjQ2IsgAIMfs+mqwL84gy73xqq7ij3HX9Ao
        wtB0eFSEO32hx0uiXlKN2kAocOLxOH0=
X-Google-Smtp-Source: ABdhPJxSsNlZyJU0sVSakPgk2GszH2N+k9FkGDoPHAqk0PywnrD1dcLrQ2Y62eBA0TGv0KRrD+s0sw==
X-Received: by 2002:a17:90b:1d08:b0:1e4:dad9:64e5 with SMTP id on8-20020a17090b1d0800b001e4dad964e5mr9560651pjb.200.1654170769956;
        Thu, 02 Jun 2022 04:52:49 -0700 (PDT)
Received: from sol ([203.221.89.174])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090311c900b0015e8d4eb277sm3354213plh.193.2022.06.02.04.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 04:52:49 -0700 (PDT)
Date:   Thu, 2 Jun 2022 19:52:41 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        Alexander Stein <alexander.stein@mailbox.org>,
        David Kozub <zub@linux.fjfi.cvut.cz>,
        Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>,
        Michael Beach <michaelb@ieee.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio@vger.kernel.org, Ben Hutchings <ben.hutchings@mind.be>
Subject: Re: [libgpiod v2][PATCH] treewide: implement v2 API
Message-ID: <20220602115241.GA43087@sol>
References: <20220602112656.31261-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602112656.31261-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 02, 2022 at 01:26:56PM +0200, Bartosz Golaszewski wrote:
> This is the main changeset implementing the new libgpiod API for the core
> C library as well as C++ and Python bindings. It's actually the effect of
> squashing all the patches we've had in the next/libgpiod-v2.0 branch (and
> that have been developed and reviewed over the course of several months)
> so that the master branch can remain bisectable.
> 
> Big thanks to Kent Gibson for his reviews.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> [Ben: fix format specifier for uint64_t]
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> [Viresh: Fix ioctl number for gpiod_line_request_reconfigure_lines()]
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> [Kent: splitting of chip_info out of chip, documentation tweaks and some renaming]
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
> There were no reviews so far for the python bindings but I'm generally
> happy with them and think that the contents of next/libgpiod-2.0 branch
> are mature enough to get them into master and continue the work incrementally
> there. So this is the amalgamation of all the work done so far on libgpiod v2
> that I'd like to apply soon.
> 

My apologies for not getting back to you earlier wrt the python
bindings.
When I try them I get:

$ python3
Python 3.9.2 (default, Feb 28 2021, 17:03:44)
[GCC 10.2.1 20210110] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import gpiod
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "exception.c", line 1, in <module>
NameError: __build_class__ not found
>>>

I may be doing something dopey, but building v1.6.3 on the same
platform (a clean Debian 11.3 install with a v5.18 kernel with gpiosim
and gpio-mockup) works fine.
Haven't had a chance to look into it further...

Any ideas?

Cheers,
Kent.
