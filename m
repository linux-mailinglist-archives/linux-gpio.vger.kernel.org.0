Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A8E40894D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Sep 2021 12:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238610AbhIMKqZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Sep 2021 06:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239032AbhIMKqY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Sep 2021 06:46:24 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EE7C061574
        for <linux-gpio@vger.kernel.org>; Mon, 13 Sep 2021 03:45:09 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id j16so8421909pfc.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Sep 2021 03:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3HKBpsH3PNknJdcvmjTAgwPJTvamLZlsD+nQrGYrlJM=;
        b=hwTUfN3VYbOylF75Bd9CtF3oKIc0FsOU4XcFY8R8yi4No3ysJklEGajDBhyiHCUihM
         gNQc+MaNGpLY6u+ZeTn2f7/QFFqclOu7vioBE/O0JbF9mx5YCdRAQlsQSrSUb1lhqT+p
         0XNG/q5QbdPIU7dVy38SHhIRjrEPQ6mogsWZ0AyhaEo0wFZ/IwH/1MhJeSOXFQchFenq
         mzq8JoVWdt/6SXh0lNHHXZPKFpTsZwLxv8QarrXL1b0XiyihX6WGK0xEIox9ib3Cvmr1
         QJ4LH/2SbvX32VFKRAyC6zWk9akYj6ZIcdB2M7tJvBM8LyruV0BfPfe8e1h2amCZ94Cd
         61iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3HKBpsH3PNknJdcvmjTAgwPJTvamLZlsD+nQrGYrlJM=;
        b=e4MsLKxWzFep34DwX54wRsTbYnkKAWsU2YpPX/nM0LQR4fPDiWx3Ln0RjfiC+HTFXz
         asmMlzv1c8w8rxqoZMIzidQTHz7h5CsoS8JfRwHvR2O1p7qGQdTnjMcKeUR1w6RoQC0M
         re+4bZGeCf/9r7x3jYbUGmgM6ZLWPGxsVzrsPqWMmpss0DhVO7You0g1n5IHXmokU917
         BUtWQLD4cbfW7Zqmy72myjQh5gDvUEhvvFAgBD8S+FZx8XjJuUCrIoOuOh6vKFN5norX
         g+sKMluE3I8ymcamXV+a4x0omPc2cP1MeIv4VCEcAYIT/npPRUvehoGhgsCMzQMKsPN/
         KzPQ==
X-Gm-Message-State: AOAM53349NAwx4gaPGPR7Dl+3PcsjurYV+z4R0f4QphlRFAbJDYo4wr3
        wgTJwrsjh/1YK3OVOfkaK7zNYzYFyccIPw==
X-Google-Smtp-Source: ABdhPJxvTohzjUeMqGq41kK6htkAVASzFz1NfTgRmtFKu7tVOHoSS+BU3surNe7F6L3tzVAEDVUNAA==
X-Received: by 2002:aa7:9ac9:0:b0:3fb:28ca:584b with SMTP id x9-20020aa79ac9000000b003fb28ca584bmr10367484pfp.64.1631529908415;
        Mon, 13 Sep 2021 03:45:08 -0700 (PDT)
Received: from sol (106-69-191-134.dyn.iinet.net.au. [106.69.191.134])
        by smtp.gmail.com with ESMTPSA id x9sm6531428pjp.50.2021.09.13.03.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 03:45:07 -0700 (PDT)
Date:   Mon, 13 Sep 2021 18:45:03 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     "Marek Novak | ACRIOS Systems s.r.o." <novak@acrios.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] Add Lua 5.1 binding for libgpiod v1.0.x branch
Message-ID: <20210913104503.GA37615@sol>
References: <8a49314e-f727-aace-9c54-122b038d1fad@acrios.com>
 <CAMRc=MeMhxv60r4M-Obi1TYo97n0YaYYyRNR7HNLT5ousbUYAg@mail.gmail.com>
 <4e125d57-0cf3-16ea-96de-c6fbbafd5bd9@acrios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e125d57-0cf3-16ea-96de-c6fbbafd5bd9@acrios.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 10, 2021 at 09:59:36PM +0200, Marek Novak | ACRIOS Systems s.r.o. wrote:
> On 09. 09. 21 10:20, Bartosz Golaszewski wrote:
> > On Tue, Sep 7, 2021 at 6:10 PM Marek Novak | ACRIOS Systems s.r.o.
> > <novak@acrios.com> wrote:
> > > 
> > >   From ca1b5688de2d1cb63bb9823e28b87c52f23df449 Mon Sep 17 00:00:00 2001
> > > From: Marek NOVAK <novak@acrios.com>
> > > Date: Fri, 3 Sep 2021 18:41:02 +0200
> > > Subject: [PATCH] Adding Lua 5.1 bindings as 'gpiod' Lua module
> > > 
> > > - Adding bindings directory with wrapper code
> > > - Adding Makefile.am for building and distributing as a Lua module
> > > - Adding --enable-bindings-lua option for autogen.sh
> > > - Adding examples with basic lua gpioset and gpioget implementation
> > > - Output, input and event input with new(), get(), set() and wait()
> > >     methods are implemented.
> > > 
> > > Signed-off-by: Marek NOVAK <novak@acrios.com>
> > > ---
> > 
> > Hi Marek!
> > 
> > Thanks for the patch, any new bindings are much appreciated! However
> > the 1.0.x branch has been unsupported for over 3 years. Why did you
> > decide to base your work on this one?
> > 
> > The currently supported branch for the 1.x series is 1.6.x but even
> > then I don't really want to add new features to it as we're currently
> > developing the 2.0 version which will become the new preferred base
> > for all new work. Any chance you could base your work on the
> > next/libgpiod-2.0 branch just like Viresh did with his Rust bindings?
> > 
> > Bartosz
> > 
> 
> Hi Bartosz!
> 
> Thanks for checking my patch. I later realized it was not well processed
> when sent using Thunderbird (I will use git send-email next time). I also
> learnt that on some systems, the macros from ax_lua.m4 are not available and
> I added it in a m4 folder. I have a v2 of the patch almost ready (build
> being tested on different environments by my colleagues). So I can post it
> here if anybody needs it on 1.x version supported...
> 
> To my motivation to select v1.0.x branch - I wanted to select a 1.x branch
> as base since this one is used in OpenWRT distribution (https://github.com/openwrt/packages/blob/openwrt-21.02/libs/libgpiod/Makefile).
> And my target use-case is to have Lua support for GPIO interaction there for
> some late device-specific initialization scripts.
> 
> However, I think I can switch to a 2.x version of libgpiod on our fork of
> OpenWRT v21.02 and base my contribution on it... Currently I use a package
> which builds Lua binding "out of tree", being quite ugly, but available for
> public here (https://sw.acrios.com/acrios/lua-gpiod). I could / should maybe
> also support not just Lua 5.1, but also the other actively used version of
> Lua...
> 
> I will update my contibution to 2.x, test it and then post it here...
> 

Be aware that libgpiod 2.x relies on the GPIO uAPI v2 which was released
in Linux v5.10, while OpenWRT v21.02 has only just transitioned to
Linux v5.4.
So you might be stuck between a rock and a hard place - unless OpenWRT
happens to be planning another kernel jump in the near future.

Cheers,
Kent.
