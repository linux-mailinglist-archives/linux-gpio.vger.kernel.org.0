Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4390F75B030
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jul 2023 15:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbjGTNha (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jul 2023 09:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbjGTNh3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jul 2023 09:37:29 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC50426B1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 06:37:27 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-56347da4a50so554740eaf.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Jul 2023 06:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689860247; x=1690465047;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rB0tZy3ndiOSRyVc5kRCcMjDKtypCkMkC10YE8ZYYug=;
        b=VqjIotnd7RvJBbgr6YrQvAMSocaCLHhnK23QxFy2fxFU5jwyf+OI/7vn361CXpaHXU
         GGObFc2JqapwMyM8BKldULKP5TPewVfCkFwSAP4dgjU0ccAYos/c0ngCttwqHhx3O7aA
         /XWKjLNbGAebihqjEYWYMguwTKqLkS2ZeHMD84CmbxC1tRAC16tAHltUCfQD2q/kckFt
         AoH2hNBITJHCFrawoK+C0Zi7Y32kFXk9WhUzu4G5Dd68WZyiD0eUVYgEQlMBKg3vXwf6
         yws5rN3r30gsp7YvOmXFszwJ7DY2wfT74+l3yfINYYFvFZPsNxJtRspAXXC69t1P54Kj
         Nklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689860247; x=1690465047;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rB0tZy3ndiOSRyVc5kRCcMjDKtypCkMkC10YE8ZYYug=;
        b=lHmLFKBjaAw7kdgH1xd5U0Aoh/IV4TbMkT7gq5J4SxjYuKZZumAcszRDdWi3ubQNtX
         8KMBBzT35oRkO4skGQON/QMbtlaJtNZvEiClRaqgN+elNOwmtyUzvR3p4aqoU/pugsJT
         d0IL12+WiYNIMJUXqE89m7fdsOM5hRr8BoKwV1FYYJWl7P5qa1r3uZfKKY/Q21eETjkX
         hd+oIJNIUwsXOsfkBw4S30+zGpNodjooMTeIpDVTXikfFCYTsOqa+ye1+8zNIS7ZWM8R
         xm206EjKx4/hngrRKA2HEXo+m55fA4sZN/XDkjbSlPkGum6bHo7Ylbyy0DbAcGcKRJus
         M7nA==
X-Gm-Message-State: ABy/qLbyWIm2/s4ujBYCc1Z5US1sYxY533lHmId3HqjeKEuZkBKkPoWA
        Rr4m0C6HFk+XJzUTgkym3Nw=
X-Google-Smtp-Source: APBJJlHKbMogWGvc8ZB/00r/iq2Vz7b/8diDQPSdaPqsAcqFNnmDMr4Q9ZLZTdP1hxpnJFmqcfpMog==
X-Received: by 2002:a05:6358:93a3:b0:134:d617:e2c9 with SMTP id h35-20020a05635893a300b00134d617e2c9mr22920606rwb.29.1689860246696;
        Thu, 20 Jul 2023 06:37:26 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id r2-20020a63a002000000b0053fb1fbd3f2sm1137444pge.91.2023.07.20.06.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 06:37:26 -0700 (PDT)
Date:   Thu, 20 Jul 2023 21:37:21 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 0/5] core: provide information about the parent
 chip in line requests
Message-ID: <ZLk4kVrT45dTNSNM@sol>
References: <ZLipqIJE1Mo4oK00@sol>
 <CAMRc=Mf=Xf7KPP+9GPC6=1Gsp3XTfzrwjOK2jrqeP7QUVxtD+Q@mail.gmail.com>
 <ZLjqtVcTCcStYac4@sol>
 <CAMRc=McjEPsYOm5ZcvbtfVkyF6uGk-4bYeKitJ0QKJcNGHrCSA@mail.gmail.com>
 <ZLjyscgZM50A/PLb@sol>
 <CAMRc=MfGYoTmcV2DXiQtBRPu2K3J9H_CDoLXCcfu2dOjA0cEDg@mail.gmail.com>
 <ZLj7an9hR7qy3foM@sol>
 <CAMRc=MfCPieOH-zYyvtoqzjQYt3zW7cL2waWOQbjB0k0wXm0Jw@mail.gmail.com>
 <ZLkD6zFp2kLsO4fA@sol>
 <CAMRc=Md34kYQ4B8NQo2c+seJTN_24he7J5bwRD8sPy-xJyqkXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md34kYQ4B8NQo2c+seJTN_24he7J5bwRD8sPy-xJyqkXw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 02:30:45PM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 20, 2023 at 11:52 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> >
> > The case I was thinking of was wanting to release a line, and if you
> > don't know which request you will have to walk the request objects.
> >
> 
> You cannot release a single line if it's part of a wider request though.
> 

Of course. Unless we were to extend the uAPI to allow that.

> > And what of lines that are requested directly by apps other than the
> > gpio-manager?
> >
> 
> You can tell they're used but cannot request them just like with any
> other user of the cdev.
> 

This is going to be a pain point - the concept of "used" is getting
muddy.

Say two processes want to get a line.
So both need to request it before they can get it?
Or only one does the request and both can get?

The latter case is painful to use.
The former requires request being idempotent or at least to return an
error that distiguishes a line already held by gpio-manager and a line
already held but not by gpio-manager.

> > > >
> > > > Where do edge events fit in there?
> > > >
> > >
> > > It's a signal exposed by the io.gpiod1.Line interface.
> >
> > But separate from the PropertiesChanged?
> >
> 
> Yes. PropertiesChanged is emitted on changes in properties (direction,
> edge, all reported by gpionotify) while EdgeEvent is for edges
> exclusively.
> 
> >
> > I am also wondering if the tools can be extended with the option to
> > perform their ops using the gpio-manager, particularly get/set/mon that
> > currently require exclusive access.
> >
> 
> There's a client app already functional in my WiP branch. Think nmcli
> for NetworkManager. It doesn't link against libgpiod - only uses the
> DBus API.
> 

Sure - doesn't mean other tools can't use the DBus API too.
My thinking was existing users of GPIO tools could just add
an option, say -D, to their scripts to switch over to gpio-manager.

> You can do something like this (not all of this is implemented yet):
> 
> $ # Wait for a chip with a particular label to appear
> $ gpiocli wait --chip="foobar" --timeout=10s
> $ # Request a line for edge events
> $ gpiocli request --input --rising-edge --falling-edge foo
> request0

Will that support multiple lines, possibly spanning multiple chips?

> $ # List available requests
> $ gpiocli requests
> request0 (gpiochip0) offsets: [4]

But that will only return the requests made by gpio-manager, right?

> $ # Wait for edge events:
> $ gpiocli monitor foo
> Offset: 4 RISING EDGE Timestamp: 3425234234
> $ # Release the request
> $ gpiocli release request0
> 
> This way the user can easily use bash scripts, command line or even
> any DBus library out there while we still use the character device in
> the daemon and ditch sysfs.
> 

Agreed.  As covered earlier, access control needs to be fleshed out, but
other than that I don't see any obvious deal breakers.

Cheers,
Kent.
