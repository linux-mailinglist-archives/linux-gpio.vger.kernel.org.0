Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1006F621B67
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 19:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234281AbiKHSEv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 13:04:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234381AbiKHSEu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 13:04:50 -0500
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03685201AB
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 10:04:49 -0800 (PST)
Received: by mail-vk1-xa2c.google.com with SMTP id e2so9455190vkd.13
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 10:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZERxksuhisyfmsTVRKqKOFZk2hWcBt0Kz5avGig7+0=;
        b=uGEWzUNxyztKksUnYKyd7KcmL6v4YnA8y8rde4a4wWhqLkb6aJcbkUHvKZRV/GQgp7
         3c/C1IWnaVznIHB6YefLEVcUuu+GYQto2bLHIR9YLKqUwHpf1Vc027StAwn//Ht7/UU2
         uQVIHU3/WJZ/AKkXag3C9sNmn4Yf1l1zEntCwcJxUefjh6p42orc78a9syp+PrVNKxgU
         k7WqE8pKICU3QUnhiuB4lbrMmFv4UnKLO5dtylrWSaGja+Zu5nfq2QbVw1F/nCtlEdpb
         3odSL4mtVOTJBe063vJmfCAJeHaW5sTB1AQIxr90yeKJug5/PRW08QZcjjmAU2pQDoJF
         V6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ZERxksuhisyfmsTVRKqKOFZk2hWcBt0Kz5avGig7+0=;
        b=6VcpqKQGb7mx8VS7cXUIvoX9jUr40AtEveXnFIv3Oukbdp4oXIWOzFtid/h+bdzmnq
         F8Z+nFJaavOD6iBJkepjg5uyCPLyH0X3hxd4lnZTEvZIyAc5yib/54OG9ShwJY1JcQ5K
         wHPgQCVff++hOLeMQ8RlyRFu9Xv4otOSqRSyRuHHZn34c7lsbu/dfYPjy7BtyFEwT/uI
         tos0zOrSCg6deiFPAHfxFDHid1qEtdCn/JpZXTi8NMu3feRdzqLkutLFRuJOcyPHFH4q
         LSFFv5fCTOCY6jCfuw43TG2a/KgOJTUg5ra0OX1G/x4ceNln27siHjEjykNQ084NWmP2
         ZynA==
X-Gm-Message-State: ACrzQf0x2EWQPw1mUADYTLhwqA69oCBIsRZckdc7FlULeKqyBBP76u5Q
        D6QKdXd7czfT3kieUvRIazH0yGNbraxDSNzqXw13QCTAh5o=
X-Google-Smtp-Source: AMsMyM5EdU890DSlmuGvWRvNGxft0PYJi53i3tRdik/mvKsobX4/Q+GM7tERKmlOV7AstHeYehwYIDnho+Q7LuSRGxU=
X-Received: by 2002:a05:6122:92a:b0:3b8:ae77:6927 with SMTP id
 j42-20020a056122092a00b003b8ae776927mr11031863vka.33.1667930688076; Tue, 08
 Nov 2022 10:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20221011002909.26987-1-warthog618@gmail.com> <20221011002909.26987-5-warthog618@gmail.com>
 <CAMRc=MdC9fcrKaXRTq5eQttdyLo_SwhU7qEeV9+ej3L0ENkrTA@mail.gmail.com> <Y2p4A6FM9nF5RLqw@sol>
In-Reply-To: <Y2p4A6FM9nF5RLqw@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 8 Nov 2022 19:04:36 +0100
Message-ID: <CAMRc=MeaSyx_So_a=T4O3+FtHN7Jc0=6zapP6+Sn5X-4FXs0ww@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v3 4/5] tools: add gpiowatch
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 8, 2022 at 4:38 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Nov 08, 2022 at 04:00:08PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Oct 11, 2022 at 2:29 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > Add a gpiowatch tool, based on gpiomon, to report line info change
> > > events read from chip file descriptors.
> > >
> > > Inspired by the gpio-watch tool in the linux kernel, but with gpiomon
> > > features such as custom formatted output, filtering events of
> > > interest and exiting after a number of events, so more useful for
> > > scripting.
> > >
> > > Default output is minimalist, so just time, event type and line id.
> > > Full event details are available using the custom formatted output.
> > >
> > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > ---
> > >
> > > Changes v2 -> v3:
> > >    - Minimise the default output to more closely match gpiomon.
> > >    - Add --format option for when more detail is required.
> > >    - Add --num-events option to exit after a number of events.
> > >    - Add --event option to report only specific event types.
> > >    - Add --quiet option to not print events.
> > >    - fix monotonic to realtime conversion on 32 bit platforms.
> > >
> >
> > Nice and clean, I don't have any issues other than the regular
> > coding-style bikeshedding.
> >
>
> Will be renamed to gpionotify for v5, ok?

Yes, sure, just like discussed.

>
> > What happened to the idea we've been floating about creating a single,
> > busyboxy executable with links rather than separate executables? Have
> > we ever agreed on it?
> >
>
> Yeah, last we spoke on it we agreed it was of dubious value and a low
> priority, so I didn't go anywhere with it.  You've reconsidered?
>

I'm seeing that the tools-common.c file grew quite a bit after your
rework (which is good, a lot of stuff has been generalized) which
makes me think it wouldn't be a bad idea to not include it 6 times
separately. It's either a libgpio-tools or putting this stuff into the
same executable?

Anyway, we can do it later.

Bart
