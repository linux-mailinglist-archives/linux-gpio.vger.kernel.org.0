Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 295A775AACC
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 11:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbjGTJaJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 05:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbjGTJ3o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 05:29:44 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4885F2737
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 02:16:33 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7658430eb5dso68067185a.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 02:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689844592; x=1692436592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=15lBN42JG3QU/recV6MHqbQqFUMYwFFne8GpvY40F7M=;
        b=ol5X9ubap8xZLGyxoDakjwJPLnjtukBF0TByBMr9PRxAHod0ZDrm5BKSExFSiCocaX
         v6D0vZYGvP6zzRiMIRA4B9d4ehy2b9fr592W3RsM40jlNa5EuE9+jD3nq1dWNs87/w1B
         JxuiAPu8kUVHPSfLKHHMXxHOmozKCk7OTzOAOoq+zI0hdNDx9l3Qlb9EAQ2rFFAgHEau
         00o88vcJ4vensNBebZeEq6h003E60D3lXqPKb6PPxNu/Jf/2BXfSMnedkZgvONxWsrl1
         6LSe160n4euDAN8n+aSI1McD03QoPhSwAXvh0mKtOxyCu3MQDzTGFE9Pb+LlJo76ke1l
         k0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689844592; x=1692436592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15lBN42JG3QU/recV6MHqbQqFUMYwFFne8GpvY40F7M=;
        b=Ks1pGDstirSx5IXVqhjTyLK8+2aT2pkENoFT6MTFiuxlfkUJBSIA/ixgXtQi7kR7gv
         H5ma4K8ZzxotnLWpRgNW9PpercsdgbROQdk6JcWbKEU2sbjuB0YCMfPwo9YeaiR5LfSq
         WfA7GXxx1bXCyowjTbhqxgxc/18IHTdgUxImdHc+w9HuGMeyYlPPT4CYkDuSUyULXVOO
         WVVIKo70BeYy79dqm4uW4EGUridDbE888Bq/ncvnN2yw0ruJCRDwqVfAdzOk0bfAMgDX
         v12OPTQYUhi1z5pmnEUPxw73JeG/lLbfgSy/wNFTrSGaKR6VflD22tAHP14tf1MvKrmP
         z2xQ==
X-Gm-Message-State: ABy/qLbT7IaTFl7l6cuUoeG5lYQ7hmn8JNPa2lXJU8TtG1EJe4V6VaIa
        33BHbvyy+f/m57TVKsIz+CM=
X-Google-Smtp-Source: APBJJlFjg4c/5Nm71c/iJCHsuxgSdQh7ycETSNsLqhJvnQJuCCpU4CnDpLh27jDlCzmNz2cxZTsQ8Q==
X-Received: by 2002:a05:620a:2687:b0:767:3fa7:2afa with SMTP id c7-20020a05620a268700b007673fa72afamr25326572qkp.28.1689844592266;
        Thu, 20 Jul 2023 02:16:32 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id q6-20020a170902bd8600b001a1b66af22fsm801989pls.62.2023.07.20.02.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 02:16:31 -0700 (PDT)
Date:   Thu, 20 Jul 2023 17:16:26 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 0/5] core: provide information about the parent
 chip in line requests
Message-ID: <ZLj7an9hR7qy3foM@sol>
References: <20230719192057.172560-1-brgl@bgdev.pl>
 <ZLipqIJE1Mo4oK00@sol>
 <CAMRc=Mf=Xf7KPP+9GPC6=1Gsp3XTfzrwjOK2jrqeP7QUVxtD+Q@mail.gmail.com>
 <ZLjqtVcTCcStYac4@sol>
 <CAMRc=McjEPsYOm5ZcvbtfVkyF6uGk-4bYeKitJ0QKJcNGHrCSA@mail.gmail.com>
 <ZLjyscgZM50A/PLb@sol>
 <CAMRc=MfGYoTmcV2DXiQtBRPu2K3J9H_CDoLXCcfu2dOjA0cEDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfGYoTmcV2DXiQtBRPu2K3J9H_CDoLXCcfu2dOjA0cEDg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 10:49:46AM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 20, 2023 at 10:39 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Jul 20, 2023 at 10:25:14AM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Jul 20, 2023 at 10:05 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Thu, Jul 20, 2023 at 09:59:00AM +0200, Bartosz Golaszewski wrote:
> > > > > On Thu, Jul 20, 2023 at 5:27 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > >
> > > > > > On Wed, Jul 19, 2023 at 09:20:52PM +0200, Bartosz Golaszewski wrote:
> > > > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > > > >
> > > > > > > While working on the DBus API, it occurred to me that while we can obtain
> > > > > > > the list of requested offsets from a line request, this information lacks
> > > > > > > context if we cannot get any information about the parent chip on which
> > > > > > > the request was made.
> > > > > > >
> > > > > > > We cannot reference the chip in any way as its lifetime is disconnected
> > > > > > > from the request but we can at least provide the path to the character
> > > > > > > device used to open it as a way of providing some context for the offsets.
> > > > > > >
> > > > > >
> > > > > > No problem with this conceptually, the only question I have is which
> > > > > > one of these should be stored:
> > > > > >  - requested path e.g. 'a_symlink_to_my_favorite_chip'
> > > > > >  - canonicalised path e.g. '/dev/gpiochip0'
> > > > > >  - chip name e.g. 'gpiochip0'
> > > > > >  - chip number e.g. 0
> > > > > >
> > > > > > In this patch we get the requested path, right?
> > > > > >
> > > > >
> > > > > Yes, I think we should just use whatever filesystem path was used to
> > > > > create the chip as it would be the one allowing the caller to reopen
> > > > > the same chip.
> > > > >
> > > >
> > > > So there are instances where those four don't map to the same thing?
> > > >
> > >
> > > Not in a typical situation, it can happen if the chip was removed and
> > > another one took its place which is very unlikely.
> > >
> >
> > And a symlink could get changed as well.
> >
> > > I just think that we cannot have any "hard data" as in: a programmatic
> > > reference to the chip in the request (their lifetimes are not
> > > connected), so the next best thing is the filesystem path.
> > >
> >
> > Indeed - the chip fd used to request the line is out of scope.
> >
> > But the number of possible requested paths is many, whereas the other
> > three options produce a unique and comparable identifier, in a searching
> > sense.
> >
> 
> So which one do you suggest?
> 

Any of the latter three are equivlent, so you can use whichever is most
convenient.  I've used canonical path in my Rust library, and chip name
in my Go library.  IIRC in Rust I had the canonical path handy and it
was easier to keep it as is than to break it down to name or number.
Why I went with name in the Go is lost in the mists of time.
I do recall toying with going with number but I wasn't sure if gpiochips
were guaranteed to be named 'gpiochipN'.

Given what you have below for DBus, name looks the most natural to me.

> > On a related point, does the DBus API allow a client to access lines
> > requested by another client?  And if so, how can they be sure they have
> > the right line?
> >
> 
> Sure they can but various user permissions as configured in the
> relevant .conf file may apply.
> 

So setting up the dbus-daemon security policy for the objects?

> So what I've got so far in dbus (and feel free to check out the WiP[1]) is this:
> 

I have had a quick look at it, but so far only a quick look and I'm not
familiar with DBus so there is a lot of background to fill in.

> There's an /io/gpiod1/gpiochipX object per chip implementing the
> io.gpiod1.Chip interface. For each line there's a separate object as
> well:
> 
> /io/gpiod1/gpiochip0
> /io/gpiod1/gpiochip0/0
> /io/gpiod1/gpiochip0/1
> /io/gpiod1/gpiochip0/2
> /io/gpiod1/gpiochip0/3
> 
> Line objects implement the io.gpiod1.Line interface and the daemon
> emits a PropertiesChanged signal for any status changes.
> 

Can the client select which of those signals it sees?

> You can call io.gpiod1.Chip.RequestLines() method on a chip object
> which will return the object path to the new request.
> 
> /io/gpiod1/gpiochip0
> /io/gpiod1/gpiochip0/0
> /io/gpiod1/gpiochip0/1
> /io/gpiod1/gpiochip0/2
> /io/gpiod1/gpiochip0/3
> /io/gpiod1/request0
> 
> The request will reference the chip object from which it was created
> as well as the lines it controls.
> 

What about the reverse mapping?


Where do edge events fit in there?

Cheers,
Kent.
