Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB60563304
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 13:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbiGALzS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 07:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233327AbiGALzR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 07:55:17 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D84F83F08
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 04:55:17 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id s206so2215490pgs.3
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 04:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TxpyTtnLVodngSd8eTp1uiFyI3LxXSM8g58XJa0oAyI=;
        b=SQfGCn+aXcx24lOPFQtF0pHpQgYfAgvy5s8b53alF4lE1NtC++Ptl/4VrmgA48nVbP
         jo5TfI9Nw/FC2//S2mKqdUMTKuX7MB2pYnDl2yPXshg5Ry71TavXS5BTgwiOMGMKWCmq
         S4Fe/NP4fmQn/pfrmCHheDx2q3cbIkac1qUS/0UlK/qEki3WVnHenEi4T+DM5E6JO5YJ
         dizb+Km73AdJRarHW+ViF0L5PFk0YLTVKvS/3ljeOXAbT3npzZePJ3dF0pHIEFqcG4BZ
         9j7H0fcdrlCJE7iqFXb+AoYD7tlH20sEhQJJiGFia93xcE8pU68F2UipsljGWVs7V6yL
         GntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TxpyTtnLVodngSd8eTp1uiFyI3LxXSM8g58XJa0oAyI=;
        b=Py/MPANP0yhWdBmhjWw2gIT8m9FOicPiXgHpUihNzxWa8TbiA52oQR1lZugcYydSEJ
         EmIct5QmGwGfm1QDqTyMYMNt+9sgL864H95MdrNJJqD9O900ywKfcNTdNmBEIall51fy
         2GHSLMrMzyAyFxBE8otv71DjZNx6MDDamBOYRqoqypPGr94jvPbvJpGkCfdI2kwYUTit
         vSiFSv5iRJfJsb/zNe3WAG7mcbIOEJoDrb5nl4lQp6OoWmx3SywUbS7cUah7bMfeasNR
         AbGWvken3oG6yMpxp+mSpq8z3onrdIeKZqIoKa8KHERDqaI1Op2hu8WdINRshD/KoJka
         iglg==
X-Gm-Message-State: AJIora8uvcJkkxAokySjFjvlRfsqsahbf91iI/RZPsrMi0R90r/NddZs
        v28wz9o4bwKnoyucKlDnPdefgKmAiGc=
X-Google-Smtp-Source: AGRyM1t8bd/IHAupWnsd7VOVdTVv6cx/7hj5au0SqsAEUpOSGxnDIf4JKDHkNM9m98PiatFIUeY5cA==
X-Received: by 2002:a05:6a00:14ca:b0:525:77ac:b0d5 with SMTP id w10-20020a056a0014ca00b0052577acb0d5mr19567551pfu.24.1656676516714;
        Fri, 01 Jul 2022 04:55:16 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id n9-20020a170902f60900b0016a79b69f91sm12910744plg.26.2022.07.01.04.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 04:55:16 -0700 (PDT)
Date:   Fri, 1 Jul 2022 19:55:12 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH] misc: make gpiod_is_gpiochip_device() not
 set errno
Message-ID: <20220701115512.GB42057@sol>
References: <20220701110056.58502-1-brgl@bgdev.pl>
 <20220701114351.GA41317@sol>
 <CAMRc=MeNfO0-1sn8a4aPpb2tskueVMT=oALbx+VK0x0_yGo-fA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeNfO0-1sn8a4aPpb2tskueVMT=oALbx+VK0x0_yGo-fA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 01, 2022 at 01:50:46PM +0200, Bartosz Golaszewski wrote:
> On Fri, Jul 1, 2022 at 1:43 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Jul 01, 2022 at 01:00:56PM +0200, Bartosz Golaszewski wrote:
> > > This function should just report whether the file indicated by path is
> > > a GPIO chip or not. Let's rework it to not set errno. Failure to open a
> > > chip should still report errro numbers like before.
> > >
> >
> > This is will break my tool patch, for sure.
> > My gpiodetect uses the errno behaviour to give a clue as to why a chip
> > might not be available to a user, and that work was already done in
> > gpiod_is_gpiochip_device().
> > There might be other places the errno was propagated as well, but
> > whatever, I'll sort something out.
> >
> 
> Doesn't it make more sense to call gpiod_is_gpiochip_device() and then
> if it returns true, just try to open it and then report failure?
> 

Not for the case where the chip doesn't exist -
gpiod_is_gpiochip_device() has already worked that out.

But don't worry - I'll sort something out.

Cheers,
Kent.
