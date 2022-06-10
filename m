Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49483545CBB
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jun 2022 08:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234157AbiFJG6I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jun 2022 02:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244135AbiFJG6G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jun 2022 02:58:06 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A94156B7A
        for <linux-gpio@vger.kernel.org>; Thu,  9 Jun 2022 23:58:02 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id v19so33995266edd.4
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jun 2022 23:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vb9vZlA0KeF3DFt/HLpJJKuJybJZMakJSP4WouEemNc=;
        b=RzqxMjVAjiCbR9VVX507YdKHxA2gFzS0HmZ3O9JxO99eC7/9ikzkGqI5EUM/9tUIPp
         jAUN5cgtMH2W0qk1HMTzSK5vyO6vnnC5cQxJ0RhPlM9/CgzL2M8zZhRE/rSztWa9jN5e
         7xoGyll+NNO352+07I4rbo1iJOLJCKaMqYBC/mIZKpHUgkTiqQ6IPcE6TMIThrAZzKpt
         sXyRONEWvNeX5h+od1sD9DuV4gHrE04THfBErNDTYFWOAxbhkeXyUySWszHxhe936Wy2
         uXf9PZ+IP6Byq2ozZ+tm/TF+eP0YUWGP6kIYRDN22T13GDxMCgniwYG0INtCykbcGi5Z
         H0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vb9vZlA0KeF3DFt/HLpJJKuJybJZMakJSP4WouEemNc=;
        b=BoqAsfiJ8/YozlWFqO7EEv+0THvT8UD16wsp70jYAM3wPddMPS0gOwjndOL9bZ4blp
         mIf7+L4ReILj0CO+ClfzXBYzWMB/kUBAuNxIQdiWFgj/cOcngs4tXkCtTbh891ibm8u0
         0ijtrr61EZ7HvPFsn4tJOs3S/Z10gXfGUXtzPfZAjDZS+Vocg69fsVzzrSUxwN6w+N+5
         Hi4vGiYB1pfqPGkjS4in8lxK2WihjdCzFtBvBDb7ZFr/NgCJtTcry93zdF/j2rXLfkjh
         OgyfyM03kgLZIidCmbwKuZnWldpeY+YHtRLQsdQImfR7/pzpCGp/J3EnFpqywS4cs41+
         8n6g==
X-Gm-Message-State: AOAM5313J4oJc2AciMQ3OWk4XD4RzN3rFzn7FzZyFd/0wW2UjjXJL/pZ
        mGMj5oeq+lfvvffidt3ivEvlrgexWWBhuHrOl5D83A==
X-Google-Smtp-Source: ABdhPJy5jPkTijhNzaIayYKQLGHO9mpjvGtyf6RDmWLdlGoYXwWUqWbAGLiJLl4Wc5KrOBHC472Nn07uyJ8HQEMhWi8=
X-Received: by 2002:a05:6402:e0c:b0:42d:7f16:ac2c with SMTP id
 h12-20020a0564020e0c00b0042d7f16ac2cmr48954207edh.328.1654844280621; Thu, 09
 Jun 2022 23:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220525140704.94983-4-brgl@bgdev.pl> <20220603124600.GA35695@sol>
 <20220604024131.GB13574@sol> <Yp3TmNg2uBlC0XzI@smile.fi.intel.com>
 <20220607015220.GA9430@sol> <CAMRc=MdwgGefC0AgRCvgMfAZmq_+1GnXH6XMezjyBEKs37QuAQ@mail.gmail.com>
 <20220609044922.GA11301@sol> <CAMRc=Md_7WO69hKqToSoAAyDQWxfqgg-PisrBF5AzrsKMM8FQA@mail.gmail.com>
 <20220609152112.12fc6db4@griffin> <CAMRc=Mfgov0S-dZ7Ut2oj4A8=xE7d-4iX=8Q+Kv4Tb==JviMjw@mail.gmail.com>
 <20220610042319.GB7623@sol>
In-Reply-To: <20220610042319.GB7623@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Jun 2022 08:57:50 +0200
Message-ID: <CAMRc=MfZ2+17sGVoyDZXDYtR8nm6ZxQKzps9wviqX448h45guQ@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH 3/5] bindings: python: add examples for v2 API
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Jiri Benc <jbenc@upir.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 10, 2022 at 6:23 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Jun 09, 2022 at 06:06:04PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Jun 9, 2022 at 3:21 PM Jiri Benc <jbenc@upir.cz> wrote:
> > >
> > > On Thu, 9 Jun 2022 10:42:44 +0200, Bartosz Golaszewski wrote:
> > > > On Thu, Jun 9, 2022 at 6:49 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > Agree that it would be easier to write a pythonic wrapper around the C
> > > > > API in Python, so no problem with that.
> > > > > However, the pythonic wrapper should the one named gpiod, as it is
> > > > > intended to be the primary interface for Python.  Rename your existing
> > > > > to gpiod_c or gpiod_core or something.
> > > >
> > > > I don't agree. The module that wraps the C library should still be
> > > > called gpiod and be the primary interface. The pythonic module would
> > > > just offer helpers that would still use the gpiod data types for most
> > > > part.
> > >
> > > As a Python user, I'd much rather see the high level API being the
> > > primary interface and being named 'gpiod'. The easier to use and more
> > > Pythonic, the better. The low level library bindings and low level data
> > > types are just an implementation detail for me when coding in Python.
> > > If I wanted low level, I'd code everything directly in C.
> > >
> >
> > But Kent is not talking about a whole new "pythonic" layer on top of
> > the code that is the subject of this series. The bindings are already
> > quite pythonic in that you can get most stuff done with a "logical"
> > one-liner. The gpiod module doesn't map C API 1:1, it already
> > simplifies a bunch of interfaces. Kent's idea IIUC is about providing
> > a set of helpers that would produce the gpiod objects in shorter code
> > by hiding the details of intermediate objects being created.
> >
>
> Yeah, no, I'm saying that there should be one primary Python interface
> to gpiod, and it should be the most pythonic.  And complete.
> The casual user should be able to get by with a few simple commands, but
> the complete functionality should still be accessible, via that same
> API, for more complicated cases.
>
> > Re the event buffer: yeah, I think in python (unlike C++ or future
> > Rust bindings) it makes sense to hide it within the request as we
> > can't profit from implicitly not copying the event objects.
> >
>
> That is a consequence of building on top of the gpiod C API, as you have
> to deal with two object models, and the related type conversions or
> lifecycle management.
> A native binding built on top of the ioctls can use native objects
> throughout can take better advantage of the language.
> e.g. here the equivalent of my Python suggestion using my Rust
> gpiocdev library (sadly without named lines support as I hadn't
> considered that at the time):
>
>     // request the lines
>     let req = Request::builder()
>         .on_chip("/dev/gpiochip0")
>         .with_lines(&[17,18])
>         .with_edge_detection(EdgeDetection::BothEdges)
>         .request()?;
>

So in Python you'd like to see an equivalent in the form of:

req = gpiod.request_lines(chip="/dev/gpiochip0", lines=["GPIO17",
"RESET_0"], edge_detection=Edge.BOTH)

>     // wait for line edge events
>     for event in req.edge_events()? {
>         println!("{:?}", event?);
>     }

and:

for event in req.read_edge_events():
    print(event)

Note that for the event reading: implementing yield in C API is not
currently possible. I think the best way to implement the above
example is to simply return a buffer filled with events that is
already iterable.

Ok I can work with that. It also makes sense to take keyword arguments
by default in all methods.

Thanks
Bart

>
> That has a hidden event buffer within the request.  The default size is 1,
> but add .with_user_event_buffer_size(N) and you get an N event buffer.
> There is no copying involved, just borrowing, as all the objects are
> visible to the borrow checker.
>
> > If anyone wants to create an even simpler, complete interface for
> > gpiod, then it's a task for a whole new project. Think: pydbus built
> > on top of GLib dbus bindings in python, built on top of glib's dbus
> > implementation.
> >
>
> Don't tempt me - though I would target the GPIO uAPI ioctls, not gpiod,
> for the reasons above.
>
> Cheers,
> Kent.
