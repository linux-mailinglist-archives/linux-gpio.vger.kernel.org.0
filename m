Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8F154BC30C
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Feb 2022 00:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238418AbiBRXxg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Feb 2022 18:53:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235407AbiBRXxg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 18:53:36 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192C740A15
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 15:53:18 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id x18so3566245pfh.5
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 15:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xX4jIKWkuJvihfCJCYEb2n/GDnsjyttxYDlrX3H9B7g=;
        b=Pwk4LQ+ZM+Vq2nnE98u2L8o2M7iC+ntgvTlWac3Vxygt7mzq44bj18dNIDfZvUvERK
         v8oVad4qx/m3cvU6eecVKL80+cuHhFWysI23CPBIeKaIucsyEMqZ+2X+fCdC174+2CV/
         +tzUBCFUN4TmgAo/0z5sSgMOG1XTUCQWzXricZkgftKZqP8PR+Ad0vntvwh98MrTPGos
         Lj4Qef2xMVIEictrXjOBv5+n0Iz9bQJrWvAg2lqG9fIZjCwjvUR55lkVeXca9nfPAovh
         cedN60LpEkV3CxnYprfdGaGpP3lS0G9YEGdJBZGDXXkqeqLQoCCEnOMA4jBlW5bYvC/C
         Au2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xX4jIKWkuJvihfCJCYEb2n/GDnsjyttxYDlrX3H9B7g=;
        b=SS0ZZw9C4lJoCNEL8AgfpbhOA6yLcBmC7AlA0k2cDGdzO0obRC501FPiB15owH/yw2
         wcZGHrmK+BNIWdcfXuqmmUhj3xe2kLOWDPIMaqnB5lUB3pDLe3iyq3JoXwpVungvyXnJ
         Ae0bp1y4VpIe7JN99fUwjLZEjfAIBgbFBsD1S9qUPAof0+DdYgFjiqTDdWcKfo5TUS2z
         uekXoYcRUup4XwOYuKWRyfti8vDUQR6cadPx4i8XC3Dd85otXEYOyr3C4anoZPrjkY4M
         icAoqYL2jQ64ezINXMHDir3i8Le7e3AO1GhAR9iqLT8T/LbxFHY8gEHGngpBX5Udh9h1
         uoLQ==
X-Gm-Message-State: AOAM531j0+cBfup+i5zJhSsMO3fIENaCD2HqWD+SuOAm+iJgYyWtyGv1
        FibXzMDURje2Eo1aLuK/TjrxQ5AYb/jSSw==
X-Google-Smtp-Source: ABdhPJzV2T6HttornkiALjrblC/pzJ69eCvDQ5jHKNsrcat6S09p0PnmBGGXqtZW+zpZ5Qme9OQxcg==
X-Received: by 2002:a05:6a00:1d13:b0:4e1:7958:b59d with SMTP id a19-20020a056a001d1300b004e17958b59dmr9789360pfx.68.1645228396118;
        Fri, 18 Feb 2022 15:53:16 -0800 (PST)
Received: from sol (60-242-155-106.static.tpgi.com.au. [60.242.155.106])
        by smtp.gmail.com with ESMTPSA id c14sm4042271pfm.169.2022.02.18.15.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 15:53:15 -0800 (PST)
Date:   Sat, 19 Feb 2022 07:53:10 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "Hummrich, Tobias" <T.Hummrich@eckelmann.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod 1.6.3] Do different lines have to be in the same scope?
Message-ID: <20220218235310.GA11452@sol>
References: <17c74834c56e4345ac2611b92c301e2f@eckelmann.de>
 <20220215041124.GA15474@sol>
 <CAMRc=Mfg-h-QP=Dm7gTXfpTnitUZdyCyybp2mNuyhiUoyiWRjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfg-h-QP=Dm7gTXfpTnitUZdyCyybp2mNuyhiUoyiWRjg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 18, 2022 at 07:33:16PM +0100, Bartosz Golaszewski wrote:
> On Tue, Feb 15, 2022 at 5:11 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Mon, Feb 14, 2022 at 02:01:29PM +0000, Hummrich, Tobias wrote:
> > > Hi,
> > >
> > > last week I ported part of our gpio related code from sysfs to libgpiod. I use the C++ bindings. I had some problems polling two different lines on different gpio chips and finally realized that all was OK if both lines were defined in the same scope. Out of curiosity I'm asking: Is that really the case in version 1.6.3 and was this intended?
> > >
> >
> > No.  I'm guessing you are doing something wrong, but I'd have to see
> > real code to be sure.  Code > 1000 words.
> >
> > As the lines are on different chips they need to be requested
> > separately, they can't be combinied into a bulk request, but that is the
> > only restriction.
> >
> > > The problem was this: When I declared lines locally in a method and called this method to get the file descriptor, the file descriptor was the same for both lines. Like:
> > >
> > > int MyClass::getFiledescriptor(const std::string &linename)
> > > {
> > >     auto currentLine = gpiod::find_line(linename);
> > >     return currentLine.event_get_fd();
> > > }
> > >
> > > ... returned 23 for both parameters "in1" and "in2" while gpioinfo told me that these names where unique.
> >
> > I'm very surprised this works for you.  Note that find_line() and
> > get_line() methods return an unrequested line object.  You need to
> > request the line from the kernel using request() before calling
> > event_get_fd() - and that should throw if you haven't, which makes
> > me think your actual code is different or something very weird is
> > going on here.
> >
> > Have a look at the gpiogetcxx and gpiomoncxx examples to see how a
> > line is requested.
> >
> > What does gpioinfo show for those lines?
> > Why do you need the fd, anyway?  Are you confusing it with the offset?
> > And why poll when you can get edge events?
> >
> > Bart - the need to request lines is frequently misunderstood - Gasai Maple
> > had a similar problem, thinking get_line() and set_direction_output()
> > would be sufficient to set the line output value.
> > Consider updating the documentation to highlight which methods require
> > that the line is requested before they are usable - even if they do
> > return an error or throw in that case.
> 
> Make sense, thanks for the heads-up. Will do.
> 
> > This also applies to v2.
> >
> 
> I don't think so - in v2 you can't do anything without the request
> handle and you only get it when you call gpiod_chip_request_lines(). I
> will add some code examples in a dedicated directory though like many
> other projects do. Code > 1000 words. :)
> 

Yeah, my bad.  I was refering to the cxx bindings and eyeballing [1],
but the v2 cxx binding patches haven't been applied there yet, have they?
So that is still at v1, unlike my local branch that has the patches
applied :-(.

On that point, when you do merge patches into the libgpiod-2.0 branch
could you not squash them into one revision?  I'm losing track of where
we're at.  No problem with doing it just prior to release if you want to
remove all the development cruft, but having the full history is helpful
while things are unstable.

Cheers,
Kent.

> Bart
> 
> > >
> > > It is OK for me now, the two lines I'm polling are members of one class now, it works as intended, and I'm fine with that. But still I wonder if I misunderstood something or just did it wrong.
> > >
> > > Is a new version of libgpiod published soon? Then this whole text may be obsolete.
> > >
> >
> > Indeed, if I were you I would be looking at the libgpiod v2 branch[1]
> > that will soon obsolete v1 and has a slightly different API.  e.g.
> > gpiod::find_line() is gone as it is problematic - instead you need to
> > call find_line() on the appropriate chip and it now returns the line
> > offset.
> > That is assuming you are on a reasonably recent kernel - libgpiod v2
> > requires kernel v5.10 or later.
> >
> > Cheers,
> > Kent.
> >
> > [1] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/?h=next/libgpiod-2.0
> >
