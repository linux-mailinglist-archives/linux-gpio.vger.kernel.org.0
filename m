Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE0425B7530
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Sep 2022 17:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234031AbiIMPep (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Sep 2022 11:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236855AbiIMPeM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Sep 2022 11:34:12 -0400
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B806D9E3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 07:41:36 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id lz22so28038246ejb.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 Sep 2022 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Oxnd9qCwRFTsmxT6x25WRkCUJPviNayUbip4kaM0mLQ=;
        b=7SjLMC1FEEFg9IdvZm3cpyY6yrPLNUbl2gQKIaC8psHcNogFBg8Hr+CshxAKjGARpK
         JEcPaS17tXMZh9j6F2VVEY/mSuGaC7lYw8LZwVFaeAQSRa3moX5Vp+e9INHxUJU5Gt3/
         gdXP2m52nM3yFEC2zlR2LA9aB6j3VvbWFYZ4n703YCTkxIYkzGo8zd+Y+rWettgdDE7q
         1c1LbRT0RdssUFz0FtXdqE91P2x5swt7efArBhUaTrZHYxU7Xyx+0VytOvshyuzQUHpz
         zcesaXDQrPwQlJoRt7VLXrVrR0BeSIu53tyOVe1+A1Con6e6T2HNB73XlD/zoIE9VQP1
         Qtqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Oxnd9qCwRFTsmxT6x25WRkCUJPviNayUbip4kaM0mLQ=;
        b=Ep21xojadLIEEiBXItk7hjKva/crWFbCnmb17wNCxw7Ua0/zMVXlelLfBrO+nBaMZT
         bUhfnmN3UA0m1xDcFJmYYyS1Az/8VlARYZVPKhZGqRfYgzE4otFHbZ+/SzoeAAayOqfj
         iPhBOhK/1UMrDMK6Mfydj8iDnO5A8UiavYsIbFqU3zYb6mj9ZNMn0zkjLz4QLeTcLljK
         W26GEJwR5O80ktoE6PAzMxPMcHX5wRS86cME5f8rnqDfeVVj6ciYY9TXnPPnTtQDc+z3
         Py6hVKquRqJ/VSBR4ZqPjn17EBRoTSI2JJMSqB8dHHFBCEATZX317Q1Ux3YJLHaavfw+
         iJIA==
X-Gm-Message-State: ACgBeo0nPFDpJBQYCRHabSkEXiIouo30Bf7kZeFRzzBVKyGHs39QKSC0
        Qdu72PBzw8G8eDXvGP7BL3udW/eo3S/f85ZkgFS4tg==
X-Google-Smtp-Source: AA6agR5cTaKBU3zIDbSLmVyeUqwX8xrt7vR1zWK4dMBLYkpfUGhGpXhMdWUTUABqr0Rm+oS565VSt8ueOzQ2VlD6ujk=
X-Received: by 2002:a17:907:3da9:b0:77b:9672:3f7f with SMTP id
 he41-20020a1709073da900b0077b96723f7fmr10436534ejc.636.1663079719450; Tue, 13
 Sep 2022 07:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220909121329.42004-1-brgl@bgdev.pl> <20220909121329.42004-3-brgl@bgdev.pl>
 <YxykorLetCjAls/Z@sol> <CAMRc=Me46b+Fjz_AAbZZVbaELjY6NGVfNE6mwueiKRTpYe98rA@mail.gmail.com>
 <Yx8Bj0+4STpklMc2@sol> <CAMRc=Me=QxXRgZKyirj23r4hEN9bzcPSM6N4z=0yGgAZheh=Qg@mail.gmail.com>
 <Yx/nG5YsyCa+VXoj@sol> <CAMRc=MfoZQV-aHKSkAw6d_jPPbjn==oR0LA=irjuWLGzQiRP-w@mail.gmail.com>
 <YyCTmZocN/CY4Pg6@sol>
In-Reply-To: <YyCTmZocN/CY4Pg6@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 13 Sep 2022 16:35:08 +0200
Message-ID: <CAMRc=MdBRGW0skXOgPbZy=w4EiWcyKmKwKSZuAj+k4EtbPmvdg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: cdev: export the consumer's PID
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 13, 2022 at 4:28 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Sep 13, 2022 at 10:54:26AM +0200, Bartosz Golaszewski wrote:
> > On Tue, Sep 13, 2022 at 4:12 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > On Mon, Sep 12, 2022 at 11:56:17AM +0200, Bartosz Golaszewski wrote:
> > > > On Mon, Sep 12, 2022 at 11:53 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > >
> > > >
> > > > [snip]
> > > >
> > > > > >
> > > > > > Using -1 sounds good but I've just realized there's a different
> > > > > > problem. A process holding a file descriptor may fork and both the
> > > > > > parent and the child will keep the same file descriptors open. Now
> > > > > > we'll have two processes (with different PIDs) holding the same GPIO
> > > > > > lines (specifically holding a file descriptor to the same anonymous
> > > > > > inode).
> > > > > >
> > > > > > This already poses a problem for this patch as we'd need to return an
> > > > > > array of PIDs which we don't have the space for but also is a
> > > > > > situation which we haven't discussed previously IIRC - two processes
> > > > > > keeping the same GPIO lines requested.
> > > > > >
> > > > > > I don't have any good idea on how to address this yet. One thing off
> > > > > > the top of my head is: close the parent's file descriptor from kernel
> > > > > > space (is it even possible?) on fork() (kind of like the close() on
> > > > > > exec flag).
> > > > > >
> > > > > > I need to think about it more.
> > > > > >
> > > > >
> > > > > I thought the O_CLOEXEC was set on the request fds exactly to prevent this
> > > > > case - only one process can hold the request fd.
> > > > >
> > > >
> > > > O_CLOEXEC means "close on exec" not "close on fork". When you fork,
> > > > you inherit all file descriptors from your parent. Only once you call
> > > > execve() are the fds with this flag closed *in the child*.
> > > >
> > >
> > > Ah, ok.
> > > You want to pass request fd ownership from parent to child??
> > > Why not lock ownership to the parent, so O_CLOFORK, were that
> > > available?
> > >
> >
> > Because what if we want to request a line and then daemonize i.e. fork
> > and exit in parent? It makes much more sense to keep the lines
> > requested in the child IMO.
> >
>
> Then you are doing it backwards - daemonize first ;-).
>
> Generally speaking, doesn't transfer of resource ownership to the forked
> child create havoc in multi-threaded apps? i.e. one thread requests a
> resource, another forks.  The parent thread unknowingly loses ownership,
> and the forked child process only starts with a replica of the forking
> thread.
>

Yeah, sounds like a bad idea.

> > During the BoF at Linux Plumbers it was suggested to use
> > /proc/$PID/fdinfo to expose the information about which lines are
> > requested but I can't figure out a way to do it elegantly.
> >
>
> Yeah, missed that :-(.
>
> Makes sense.
>
> As each request fd can contain multiple lines on a particular chip,
> you would need to identify the gpiochip and the offsets for that request.
> So two fields - the gpiochip path, and the list of offsets.
>
> Is that already too clunky or am I missing something?
>

It's worse than that - we don't know the character device's filesystem
path in gpiolib. Nor should we, as we can be in a different fs
namespace when checking it than in which we were when we opened the
device (which is also another concern for storing the path to the
character device in struct gpiod_chip - unless we specify explicitly
that it's the path that was used to open it). Since we don't know it -
we can only get it from the file descriptor that the requesting
process got after calling open() on the GPIO device. But this fd may
have been closed in the meantime. I think I opened a can of worms with
this one. :)

Bartosz
