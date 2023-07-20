Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C802475AB79
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 11:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjGTJxg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 05:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbjGTJxX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 05:53:23 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00BF2703
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 02:52:49 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b8a8154f9cso4502285ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 02:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689846769; x=1690451569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=buI6hyKge5sCKA90J9Q5tyJ/e03xlxdPmYN/yFOsg/g=;
        b=bvTWp1VmBsfsJ5WnbBD/qLn/b0Us0hX8hPxPb8iT6RPGBd+mK089AFxAEIbCRSl7IH
         HTurMIUv45U3gF8jQ8vm1aowiSbEZyWI8KyoCf8YKNKF2NoWJRqHVwM64P/Lx4at0SFX
         nuDMfSeI1fVQSJoiylPh7aVxU9PGAcere8jvQWHfomCk436NXIioZE0rMcuAuJDSq7mL
         UIf4RwiMLStYDAyhhMvCpEhXcAVLUomJMgI5tX1Xu98p0MPEuNovqcT6/O9jT1nvM3+3
         1KCgbBLT1hN8rWYeg0t/xwzLCdPJSvOu2bHWCOF6ksOoAd9Tx+0lhWLdcaPXL6KJaxJ3
         AZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689846769; x=1690451569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=buI6hyKge5sCKA90J9Q5tyJ/e03xlxdPmYN/yFOsg/g=;
        b=EM9ZWpVcwoEGDVgUK6591gogNo0/qI1HZz0uQMoDrkduC6LiABlkoSYM+kIEbiUvBK
         EtwfGD+/ZWj3x26vrgaS4T1aKIxkeOfQJ1czBenhWDlaLwBCePAmaO7ucyFDHLLUgn4s
         4N6Jyi3TpWkDoo7X+XyqqSo4PAPrWcyXX1zfVoIpXmVsdPtYTDiHf7jkKM/sjxx8hkdR
         qoIIpKh64reXRBdMR8GnSD0xicR0OimqfolQFhfd0msfIOlc1d5s7mpGjygxItO8kzgE
         54Zu6HTWHDYkh+fn4KmvXQnpkxRVIWtgylA02p+YVAPT0Z5hKKYgLuzoS52COk6eQaVB
         q5lw==
X-Gm-Message-State: ABy/qLbXjWmpwKeQU7L/1eKeJq6F/PETTaSv1WvF89CAkC9+Jdwlkc1H
        GpMIGqqc5n9RQA5jJjlgTu6SkdpswRg=
X-Google-Smtp-Source: APBJJlEYVLj8Dz1P6wCJ++Di7578CaoxiZU6Ni7Lge/rgUgrtN5bdW+kPvSw7tqlGYc87qZ4a/vbQQ==
X-Received: by 2002:a17:902:e5cf:b0:1b6:6a14:3734 with SMTP id u15-20020a170902e5cf00b001b66a143734mr6424091plf.29.1689846769235;
        Thu, 20 Jul 2023 02:52:49 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id i17-20020a17090332d100b001adf6b21c77sm885539plr.107.2023.07.20.02.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 02:52:48 -0700 (PDT)
Date:   Thu, 20 Jul 2023 17:52:43 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 0/5] core: provide information about the parent
 chip in line requests
Message-ID: <ZLkD6zFp2kLsO4fA@sol>
References: <20230719192057.172560-1-brgl@bgdev.pl>
 <ZLipqIJE1Mo4oK00@sol>
 <CAMRc=Mf=Xf7KPP+9GPC6=1Gsp3XTfzrwjOK2jrqeP7QUVxtD+Q@mail.gmail.com>
 <ZLjqtVcTCcStYac4@sol>
 <CAMRc=McjEPsYOm5ZcvbtfVkyF6uGk-4bYeKitJ0QKJcNGHrCSA@mail.gmail.com>
 <ZLjyscgZM50A/PLb@sol>
 <CAMRc=MfGYoTmcV2DXiQtBRPu2K3J9H_CDoLXCcfu2dOjA0cEDg@mail.gmail.com>
 <ZLj7an9hR7qy3foM@sol>
 <CAMRc=MfCPieOH-zYyvtoqzjQYt3zW7cL2waWOQbjB0k0wXm0Jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfCPieOH-zYyvtoqzjQYt3zW7cL2waWOQbjB0k0wXm0Jw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 11:38:19AM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 20, 2023 at 11:16 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Jul 20, 2023 at 10:49:46AM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Jul 20, 2023 at 10:39 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Thu, Jul 20, 2023 at 10:25:14AM +0200, Bartosz Golaszewski wrote:
> > > > > On Thu, Jul 20, 2023 at 10:05 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > >
> > > > > > On Thu, Jul 20, 2023 at 09:59:00AM +0200, Bartosz Golaszewski wrote:
> > > > > > > On Thu, Jul 20, 2023 at 5:27 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, Jul 19, 2023 at 09:20:52PM +0200, Bartosz Golaszewski wrote:
> > > > > > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > > > > > >
> > > > > > > > > While working on the DBus API, it occurred to me that while we can obtain
> > > > > > > > > the list of requested offsets from a line request, this information lacks
> > > > > > > > > context if we cannot get any information about the parent chip on which
> > > > > > > > > the request was made.
> > > > > > > > >
> > > > > > > > > We cannot reference the chip in any way as its lifetime is disconnected
> > > > > > > > > from the request but we can at least provide the path to the character
> > > > > > > > > device used to open it as a way of providing some context for the offsets.
> > > > > > > > >
> > > > > > > >
> > > > > > > > No problem with this conceptually, the only question I have is which
> > > > > > > > one of these should be stored:
> > > > > > > >  - requested path e.g. 'a_symlink_to_my_favorite_chip'
> > > > > > > >  - canonicalised path e.g. '/dev/gpiochip0'
> > > > > > > >  - chip name e.g. 'gpiochip0'
> > > > > > > >  - chip number e.g. 0
> > > > > > > >
> > > > > > > > In this patch we get the requested path, right?
> > > > > > > >
> > > > > > >
> > > > > > > Yes, I think we should just use whatever filesystem path was used to
> > > > > > > create the chip as it would be the one allowing the caller to reopen
> > > > > > > the same chip.
> > > > > > >
> > > > > >
> > > > > > So there are instances where those four don't map to the same thing?
> > > > > >
> > > > >
> > > > > Not in a typical situation, it can happen if the chip was removed and
> > > > > another one took its place which is very unlikely.
> > > > >
> > > >
> > > > And a symlink could get changed as well.
> > > >
> > > > > I just think that we cannot have any "hard data" as in: a programmatic
> > > > > reference to the chip in the request (their lifetimes are not
> > > > > connected), so the next best thing is the filesystem path.
> > > > >
> > > >
> > > > Indeed - the chip fd used to request the line is out of scope.
> > > >
> > > > But the number of possible requested paths is many, whereas the other
> > > > three options produce a unique and comparable identifier, in a searching
> > > > sense.
> > > >
> > >
> > > So which one do you suggest?
> > >
> >
> > Any of the latter three are equivlent, so you can use whichever is most
> > convenient.  I've used canonical path in my Rust library, and chip name
> > in my Go library.  IIRC in Rust I had the canonical path handy and it
> > was easier to keep it as is than to break it down to name or number.
> > Why I went with name in the Go is lost in the mists of time.
> > I do recall toying with going with number but I wasn't sure if gpiochips
> > were guaranteed to be named 'gpiochipN'.
> >
> > Given what you have below for DBus, name looks the most natural to me.
> >
> > > > On a related point, does the DBus API allow a client to access lines
> > > > requested by another client?  And if so, how can they be sure they have
> > > > the right line?
> > > >
> > >
> > > Sure they can but various user permissions as configured in the
> > > relevant .conf file may apply.
> > >
> >
> > So setting up the dbus-daemon security policy for the objects?
> >
> 
> Not per-object unfortunately, I don't think this is possible with the
> standard dbus-daemon or dbus-broker. May be possible in the daemon
> itself if we can get the UID of the peer (we can get credentials of
> peers in pure DBus but I'm not sure if we can do it when passing
> through a bus daemon).
> 
> > > So what I've got so far in dbus (and feel free to check out the WiP[1]) is this:
> > >
> >
> > I have had a quick look at it, but so far only a quick look and I'm not
> > familiar with DBus so there is a lot of background to fill in.
> >
> > > There's an /io/gpiod1/gpiochipX object per chip implementing the
> > > io.gpiod1.Chip interface. For each line there's a separate object as
> > > well:
> > >
> > > /io/gpiod1/gpiochip0
> > > /io/gpiod1/gpiochip0/0
> > > /io/gpiod1/gpiochip0/1
> > > /io/gpiod1/gpiochip0/2
> > > /io/gpiod1/gpiochip0/3
> > >
> > > Line objects implement the io.gpiod1.Line interface and the daemon
> > > emits a PropertiesChanged signal for any status changes.
> > >
> >
> > Can the client select which of those signals it sees?
> >
> 
> They can listen for PropertiesChanged on a single line but will get an
> event on any change and will have to filter out the unwanted
> themselves.
> 
> > > You can call io.gpiod1.Chip.RequestLines() method on a chip object
> > > which will return the object path to the new request.
> > >
> > > /io/gpiod1/gpiochip0
> > > /io/gpiod1/gpiochip0/0
> > > /io/gpiod1/gpiochip0/1
> > > /io/gpiod1/gpiochip0/2
> > > /io/gpiod1/gpiochip0/3
> > > /io/gpiod1/request0
> > >
> > > The request will reference the chip object from which it was created
> > > as well as the lines it controls.
> > >
> >
> > What about the reverse mapping?
> >
> 
> As in: line-to-request? Not sure this is needed? I want the
> io.gpiod1.Line interface to expose GetValue/SetValue methods and let
> the daemon figure out the mapping logic internally. These methods
> would fail if the line is not part of any request controlled by the
> daemon.
> 

The case I was thinking of was wanting to release a line, and if you
don't know which request you will have to walk the request objects.

And what of lines that are requested directly by apps other than the
gpio-manager?

> >
> > Where do edge events fit in there?
> >
> 
> It's a signal exposed by the io.gpiod1.Line interface.

But separate from the PropertiesChanged?


I am also wondering if the tools can be extended with the option to
perform their ops using the gpio-manager, particularly get/set/mon that
currently require exclusive access.

Cheers,
Kent.

