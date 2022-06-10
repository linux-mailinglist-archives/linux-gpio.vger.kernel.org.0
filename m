Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8DD545AF0
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jun 2022 06:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237430AbiFJEXb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jun 2022 00:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236191AbiFJEX2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jun 2022 00:23:28 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FEF4E79
        for <linux-gpio@vger.kernel.org>; Thu,  9 Jun 2022 21:23:27 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id h192so16916925pgc.4
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jun 2022 21:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4gDrySwiZUU+Rrp0o3CNRq4gn8NF53JOg4BPnZH89ic=;
        b=jW6jP3H9ij7v3DUe9sesiVUnNCSZCgQhnjwbQ4y6fPB5EHNIdHXyNs/L2o9QGwZ5BR
         weYd70TY+gdpvX9FHLHqI3XIQVJp3d/uJFzENzD0lsX1jeUSyOrN3UZ9zaCxVs/cQmTs
         7S22WMx3dOsFldCo6tBBGGjgXe1KMjD99VLvd5qAAQvBtUX1/ZmuH1m2pPhal1PrJeHe
         U4rg95NB4WCwvi5PtPD7B4OCDduP11qJ0CZvuK3mgfe6Zh3f5ipPk26V5FA+fszWk/Gx
         fOb6KADQEoc4J4cgtGqO0PDmedzp5mnK9BK5IqTqM5W6REHTwi2KS/AVLwX4kcnyPfx7
         pzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4gDrySwiZUU+Rrp0o3CNRq4gn8NF53JOg4BPnZH89ic=;
        b=g+tzeU/1EAG/CMH448dCRjcaqW4jsUpyikn8bNe7I3xZhEKsuFymCEgcEHn2MO69wX
         Gf7vGkbSdg2aCt7nXwyG5EvJqYhWdcU1+ydaA2bekI3oZFCSwYg1DlJIbgKhIxaTAaQH
         XRyOnfoHlwu2rh6CJxo/sfjSdI1oTofRbEbybDQkj3UWMjJa8q/6quuErCrumz+/bruT
         rWTBFxoMmR/L8vNTjlD+ywvSo0XCd9Mpf04iXtUDEBpXmKHM2HjLqXveR1tzcTTbZFvO
         B4mwydYJ3mseR6GVDOWbAYJy9diogHXrsOKFhzgPh9VJfLol/Bh1P3IApQmPZS6W6+6o
         IQdg==
X-Gm-Message-State: AOAM5309AlGepKX/iOWNiSrsZAb96V8s7VOE+cZln/P5D/bD8KebbKsD
        45sL1r8NvRfw9EDMtTyzp34=
X-Google-Smtp-Source: ABdhPJwAd3cwnTQtZFxtD4BHEw9gxhBESSBZoT82egCz6T7Oc4KTm8bFfA8w1LZl14cKV//ivjaUbQ==
X-Received: by 2002:aa7:88d2:0:b0:50a:cf7d:6ff1 with SMTP id k18-20020aa788d2000000b0050acf7d6ff1mr44356715pff.67.1654835006307;
        Thu, 09 Jun 2022 21:23:26 -0700 (PDT)
Received: from sol (14-200-166-137.static.tpgi.com.au. [14.200.166.137])
        by smtp.gmail.com with ESMTPSA id c15-20020a170902c2cf00b0016231f64631sm17293179pla.309.2022.06.09.21.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 21:23:25 -0700 (PDT)
Date:   Fri, 10 Jun 2022 12:23:19 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Jiri Benc <jbenc@upir.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH 3/5] bindings: python: add examples for v2
 API
Message-ID: <20220610042319.GB7623@sol>
References: <20220525140704.94983-4-brgl@bgdev.pl>
 <20220603124600.GA35695@sol>
 <20220604024131.GB13574@sol>
 <Yp3TmNg2uBlC0XzI@smile.fi.intel.com>
 <20220607015220.GA9430@sol>
 <CAMRc=MdwgGefC0AgRCvgMfAZmq_+1GnXH6XMezjyBEKs37QuAQ@mail.gmail.com>
 <20220609044922.GA11301@sol>
 <CAMRc=Md_7WO69hKqToSoAAyDQWxfqgg-PisrBF5AzrsKMM8FQA@mail.gmail.com>
 <20220609152112.12fc6db4@griffin>
 <CAMRc=Mfgov0S-dZ7Ut2oj4A8=xE7d-4iX=8Q+Kv4Tb==JviMjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfgov0S-dZ7Ut2oj4A8=xE7d-4iX=8Q+Kv4Tb==JviMjw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 09, 2022 at 06:06:04PM +0200, Bartosz Golaszewski wrote:
> On Thu, Jun 9, 2022 at 3:21 PM Jiri Benc <jbenc@upir.cz> wrote:
> >
> > On Thu, 9 Jun 2022 10:42:44 +0200, Bartosz Golaszewski wrote:
> > > On Thu, Jun 9, 2022 at 6:49 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > Agree that it would be easier to write a pythonic wrapper around the C
> > > > API in Python, so no problem with that.
> > > > However, the pythonic wrapper should the one named gpiod, as it is
> > > > intended to be the primary interface for Python.  Rename your existing
> > > > to gpiod_c or gpiod_core or something.
> > >
> > > I don't agree. The module that wraps the C library should still be
> > > called gpiod and be the primary interface. The pythonic module would
> > > just offer helpers that would still use the gpiod data types for most
> > > part.
> >
> > As a Python user, I'd much rather see the high level API being the
> > primary interface and being named 'gpiod'. The easier to use and more
> > Pythonic, the better. The low level library bindings and low level data
> > types are just an implementation detail for me when coding in Python.
> > If I wanted low level, I'd code everything directly in C.
> >
> 
> But Kent is not talking about a whole new "pythonic" layer on top of
> the code that is the subject of this series. The bindings are already
> quite pythonic in that you can get most stuff done with a "logical"
> one-liner. The gpiod module doesn't map C API 1:1, it already
> simplifies a bunch of interfaces. Kent's idea IIUC is about providing
> a set of helpers that would produce the gpiod objects in shorter code
> by hiding the details of intermediate objects being created.
> 

Yeah, no, I'm saying that there should be one primary Python interface
to gpiod, and it should be the most pythonic.  And complete.
The casual user should be able to get by with a few simple commands, but
the complete functionality should still be accessible, via that same
API, for more complicated cases.

> Re the event buffer: yeah, I think in python (unlike C++ or future
> Rust bindings) it makes sense to hide it within the request as we
> can't profit from implicitly not copying the event objects.
> 

That is a consequence of building on top of the gpiod C API, as you have
to deal with two object models, and the related type conversions or
lifecycle management.
A native binding built on top of the ioctls can use native objects
throughout can take better advantage of the language.
e.g. here the equivalent of my Python suggestion using my Rust
gpiocdev library (sadly without named lines support as I hadn't
considered that at the time):

    // request the lines
    let req = Request::builder()
        .on_chip("/dev/gpiochip0")
        .with_lines(&[17,18])
        .with_edge_detection(EdgeDetection::BothEdges)
        .request()?;

    // wait for line edge events
    for event in req.edge_events()? {
        println!("{:?}", event?);
    }

That has a hidden event buffer within the request.  The default size is 1,
but add .with_user_event_buffer_size(N) and you get an N event buffer.
There is no copying involved, just borrowing, as all the objects are
visible to the borrow checker.

> If anyone wants to create an even simpler, complete interface for
> gpiod, then it's a task for a whole new project. Think: pydbus built
> on top of GLib dbus bindings in python, built on top of glib's dbus
> implementation.
> 

Don't tempt me - though I would target the GPIO uAPI ioctls, not gpiod,
for the reasons above.

Cheers,
Kent.
