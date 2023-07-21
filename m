Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69DCE75BBD9
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jul 2023 03:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjGUBiA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 21:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjGUBh5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 21:37:57 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1F11FED
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 18:37:55 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1b8eb69d641so1113856fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 18:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689903474; x=1690508274;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KIUqnJ+k/T7m5niKH4PaGsgV261IZMmCLuPH5xRk8VM=;
        b=P8lUq7/o74TbYkQFu1K+Jop9Cxc2fsKOpOVC0x/lBQmisyysv2jgGD0FFoGkDD7rtE
         N//VCAkb/7gysQWC024zzWxhz5nzK+xTqsp4X6B5qON7BNLL6tGpg1y3R9FFNjk1asgL
         cwhvy1zbluXTwUNK+8x5I24DfztNPzr86S2GqBuCmqHETQvCnOIs4dH1Az9qI+A7vsqj
         ZeZVOXVqk2PjgHgDtLl3Q8Riay3xfUnwtr/Z98VB2tEmikUfWShRzARdHLXsDTiNzqdV
         uHqDQJIRsQO11SfBoLXEih5RxTGD9rrUgiV/gbsvNDjBbOxdXX0pGOdIuVsDj0UFzlt+
         K9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689903474; x=1690508274;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KIUqnJ+k/T7m5niKH4PaGsgV261IZMmCLuPH5xRk8VM=;
        b=DbZ0S+YX4kPqnOhTuZgCY1/+yN4C1xZ6Qfyk3KAVBoqWbwDL6mOAHIAxY2gRLC7c2W
         JJ8LyvzAMr6/x0agxyIR5vYlFuj6I2wReGNW211+1AtY2lEo65v8kqFJP7a+9bRiDTTT
         qDHbGGG6gtKmUYXMgMB3zIVqAjvP6idGkyKPWPa9SHp3oNJMu3ZHc3ZXYf4swEaMlmKp
         g8armTmhidewvKJ0gBH3uLRGxxDgXMlsJ+rkmE+AKDs6yeiLX+HwgJoDzsfr7tEdZ4x+
         JZ01VGi4cRKAre7jmm4cxduJSXLYbY8SiSpmKHs1lmtkxrv2HEz6jmSP0L3nO0deVdYV
         hOwQ==
X-Gm-Message-State: ABy/qLape+hjRM9Ox4V68HgEnb2iDXhGPygX9PO+1ixBGDCny3D7/QRr
        a+MWRRZSGvbIHLG4cxcw7pevFMN4cWY=
X-Google-Smtp-Source: APBJJlGpmWtV72qAwm01GfLHlsds4ZGfkHERqJ2QMJvkabIPCwF+m4Wcsg2JpRShOirBLd49fGo0Yw==
X-Received: by 2002:a05:6870:a714:b0:1ad:34f5:559e with SMTP id g20-20020a056870a71400b001ad34f5559emr534420oam.25.1689903474120;
        Thu, 20 Jul 2023 18:37:54 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id t14-20020aa7938e000000b00682b299b6besm1817310pfe.70.2023.07.20.18.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 18:37:53 -0700 (PDT)
Date:   Fri, 21 Jul 2023 09:37:48 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 0/5] core: provide information about the parent
 chip in line requests
Message-ID: <ZLnhbENoYDmnN2j3@sol>
References: <ZLjqtVcTCcStYac4@sol>
 <CAMRc=McjEPsYOm5ZcvbtfVkyF6uGk-4bYeKitJ0QKJcNGHrCSA@mail.gmail.com>
 <ZLjyscgZM50A/PLb@sol>
 <CAMRc=MfGYoTmcV2DXiQtBRPu2K3J9H_CDoLXCcfu2dOjA0cEDg@mail.gmail.com>
 <ZLj7an9hR7qy3foM@sol>
 <CAMRc=MfCPieOH-zYyvtoqzjQYt3zW7cL2waWOQbjB0k0wXm0Jw@mail.gmail.com>
 <ZLkD6zFp2kLsO4fA@sol>
 <CAMRc=Md34kYQ4B8NQo2c+seJTN_24he7J5bwRD8sPy-xJyqkXw@mail.gmail.com>
 <ZLk4kVrT45dTNSNM@sol>
 <CAMRc=Meu9X-1hE=tPzCUfo1QeyHSR=qxWzN++FKTHnzn=1HrBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Meu9X-1hE=tPzCUfo1QeyHSR=qxWzN++FKTHnzn=1HrBQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 05:01:09PM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 20, 2023 at 3:37 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Jul 20, 2023 at 02:30:45PM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Jul 20, 2023 at 11:52 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > >
> > > > The case I was thinking of was wanting to release a line, and if you
> > > > don't know which request you will have to walk the request objects.
> > > >
> > >
> > > You cannot release a single line if it's part of a wider request though.
> > >
> >
> > Of course. Unless we were to extend the uAPI to allow that.
> >
> > > > And what of lines that are requested directly by apps other than the
> > > > gpio-manager?
> > > >
> > >
> > > You can tell they're used but cannot request them just like with any
> > > other user of the cdev.
> > >
> >
> > This is going to be a pain point - the concept of "used" is getting
> > muddy.
> >
> > Say two processes want to get a line.
> > So both need to request it before they can get it?
> > Or only one does the request and both can get?
> 
> I think I badly worded the previous answer. The GPIO manager has no
> notion of a user. It just receives a message from the bus. It's the
> daemon that filters the users (e.g. only users in "gpio" group can
> request and set/get GPIOs). So the answer is: one user can in fact
> request a line, it stays requested by the manager and then another
> user can set it or even release it as long as it's got the permissions
> to do so. This is similar to how sysfs works.
> 

Sure.  The point I was trying to make is how does the user determine if
they can release the line via gpio-manager?  Currently they have to walk
the requests looking for the line - and they might not find it.

This is only a minor pain point - in practice the processes will most
likely all be using gpio-manager.

> >
> > The latter case is painful to use.
> > The former requires request being idempotent or at least to return an
> > error that distiguishes a line already held by gpio-manager and a line
> > already held but not by gpio-manager.
> >
> 
> This should be fine. The manager knows if it's the one controlling a
> line. It's just a matter of distinct error codes.
> 
> > > > > >
> > > > > > Where do edge events fit in there?
> > > > > >
> > > > >
> > > > > It's a signal exposed by the io.gpiod1.Line interface.
> > > >
> > > > But separate from the PropertiesChanged?
> > > >
> > >
> > > Yes. PropertiesChanged is emitted on changes in properties (direction,
> > > edge, all reported by gpionotify) while EdgeEvent is for edges
> > > exclusively.
> > >
> > > >
> > > > I am also wondering if the tools can be extended with the option to
> > > > perform their ops using the gpio-manager, particularly get/set/mon that
> > > > currently require exclusive access.
> > > >
> > >
> > > There's a client app already functional in my WiP branch. Think nmcli
> > > for NetworkManager. It doesn't link against libgpiod - only uses the
> > > DBus API.
> > >
> >
> > Sure - doesn't mean other tools can't use the DBus API too.
> > My thinking was existing users of GPIO tools could just add
> > an option, say -D, to their scripts to switch over to gpio-manager.
> >
> 
> The functionality of the DBus API doesn't have a full overlap with
> using the library. I don't see why we would want to do this. It would
> introduce a lot of overhead for no reason. I think a separate client
> that doesn't use any libgpiod APIs at all is what's needed.
> 

Fair enough. That works for me.

> > > You can do something like this (not all of this is implemented yet):
> > >
> > > $ # Wait for a chip with a particular label to appear
> > > $ gpiocli wait --chip="foobar" --timeout=10s
> > > $ # Request a line for edge events
> > > $ gpiocli request --input --rising-edge --falling-edge foo
> > > request0
> >
> > Will that support multiple lines, possibly spanning multiple chips?
> 
> Multiple lines, sure. Spanning multiple chips: I don't think so. Why
> would we need this?
> 

There is no need - the user can make multiple requests as they are now
persistant.  Just wondering what the API looks like to the user.

Cheers,
Kent.
