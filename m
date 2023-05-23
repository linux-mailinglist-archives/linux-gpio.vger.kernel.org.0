Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B04A870DA0F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 12:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbjEWKPV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 06:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbjEWKPU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 06:15:20 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54484100
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 03:15:19 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64d2b42a8f9so4074214b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 03:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684836919; x=1687428919;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CDZj2M9cclqlBz0K8zTyhaWhcs0bYy9leV2/wst2UcE=;
        b=MVP4Vti8u1EAgMDbEGofOsqtqNT0ZF0o2mupMFqi30psUmX5PiOmAICmfxDrmaAs9v
         /8BAq+5R0QYnpa44VV9GI5omTVwWpyVdpqkVjdEad3nxcEicN/zXBBjLb6IPnXpydXKA
         tAfxvsUh5Hg/4C4JlMBHoQjkV6Mbo39jiEH/3C9kQ34+cuwXDprFmyGukM3fqCfv/0NI
         cGt/mkHbZmFxZ1lTG6YO0gLBysZEiM3bYuNl/0OnJNIIegr2BqVMXe1Ch5rY3v3jz43t
         rd6xP7mdCpYHtFnr5UjiI7Uq8QWB0XEHkRxOiqtn9SGOMIxPnVX7Y6s6esPYrDm/SYsG
         HlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684836919; x=1687428919;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDZj2M9cclqlBz0K8zTyhaWhcs0bYy9leV2/wst2UcE=;
        b=G0NhDZCaj66xy4lt8w7GzC2JJyYTVcKaDpZiZzdr2MP0oOctfOJQ1H31h1RonUBuJo
         G9T6sW2JC2DQezICqKJYtPP5PDDHKJOckQkxLJoPrGLWjZYAjpw4BkhItg8z4HiHZx5X
         ZvpQNxfJyOK6BTMgVdiJsFfQOWjR2cz/sBi9sT1zpIqerOpQv4X8DKbXu0sdt4d2EHUD
         WOexFU4143kqGg+XM+hPkmGjNqToWH8uxbR/owtQPzyq1xE5vIDLJmuSFj08u5bJMjof
         ue+Uq0fL+07KuwkJVWFVtzuE7a+eWq+a+oe4JL8wO3qK+j8OyownibcWL8cqTtEeTo0L
         VG/w==
X-Gm-Message-State: AC+VfDxnktEWSCVs828wXkAagkBsXvn2hr3uFHbxG6lAVaCoeMlhzLDF
        5bViNbvfCEg8P3CfFLXWolsGZq0+JT4=
X-Google-Smtp-Source: ACHHUZ6u2FiAo8eYK2g5MH+kUczgt/m5VM8keZ9HLnzVfTy60CQc5g2RIA9aINNR+y9saJRYKQhduw==
X-Received: by 2002:a05:6a20:7346:b0:105:94e5:f5c5 with SMTP id v6-20020a056a20734600b0010594e5f5c5mr15930552pzc.56.1684836918588;
        Tue, 23 May 2023 03:15:18 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id x25-20020aa79199000000b006348cb791f4sm5443466pfa.192.2023.05.23.03.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 03:15:18 -0700 (PDT)
Date:   Tue, 23 May 2023 18:15:14 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] Python bindings don't allow to wait on events
 indefinitely
Message-ID: <ZGySMjMZNUzfikwX@sol>
References: <3545766.4eto28bQOc@archbook>
 <ZGcGZwwRiy2jFfR0@sol>
 <46830564.8zq9ZvEiHi@archbook>
 <ZGeOLYZ1tEKfMOwn@sol>
 <CAMRc=McTcK=fPPrkPSr2X5hhypr3aas_f2HJs4TivsJtPHqjeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McTcK=fPPrkPSr2X5hhypr3aas_f2HJs4TivsJtPHqjeA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 23, 2023 at 12:03:14PM +0200, Bartosz Golaszewski wrote:
> On Fri, May 19, 2023 at 4:56 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, May 19, 2023 at 04:32:32PM +0200, Nicolas Frattaroli wrote:
> > > On Freitag, 19. Mai 2023 07:17:27 CEST Kent Gibson wrote:
> > > > On Thu, May 11, 2023 at 10:28:34PM +0200, Nicolas Frattaroli wrote:
> > > > > Hello,
> > > > >
> > > > > in libgpiod 1.6.x, Line.event_wait's codepath had no path where ts
> > > > > as passed to ppoll could ever be NULL. This means waiting indefinitely
> > > > > was impossible.
> > > > >
> > > > > I thought hey, maybe the new Python bindings in libgpiod 2.x fixed this,
> > > > > but no, it has made it worse by explicitly setting timeout to 0 seconds
> > > > > if it's None[1]. Obviously, this behaviour can't be changed now, because
> > > > > people depend on this API to return immediately now with None as the
> > > > > parameter, and changing it to wait indefinitely would no doubt break
> > > > > actual programs.
> > > > >
> > > > > So I'm left wondering if there's a particular reason users of these
> > > > > bindings shouldn't wait on events indefinitely or if that same mistake
> > > > > was just made twice in a row.
> > > > >
> > > > > Is there some way the API could be enhanced to support waiting for
> > > > > events indefinitely without having to slap a While True with
> > > > > an arbitrarily high timeout around every single invocation?
> > > > >
> > >
> > > Hello Kent,
> > >
> > > > That does sound like a bug to me, but the rest of your mail isn't worth
> > > > responding to.
> > >
> > > I'm not quite sure what you mean. Was my tone this off? I apologise if
> > > you took my displeasure with libgpiod's bindings as a personal attack,
> > > it wasn't intended as such.
> > >
> >
> > Not a personal attack on me, but offensive none the less.
> > Assume you are the code owner and see how it parses to you.
> >
> > > > A more productive approach could be to submit a patch that describes the
> > > > problem and suggests a fix, say:
> > > >
> > > >  def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
> > > > -    if timeout is None:
> > > > -        timeout = 0.0
> > > > -
> > > >
> > > > and see where that goes.
> > >
> > > That would go nowhere, as this makes the API behave differently for current
> > > users calling the function without an argument, as I've mentioned.
> > >
> >
> > By that logic any bug that has visible effects cannot be fixed - in case
> > some user depends on those effects.
> > And all bugs have visible effects.
> >
> > The function docs don't specify the behaviour when None is passed -
> > despite None being the default.
> >
> > > One solution would be to pass float("inf") and then check for that, this
> > > wouldn't break the API, merely extend it, but I'm not sure how good of
> > > an idea that is to do if someone uses an older libgpiod that doesn't
> > > have an explicit check for inf. I don't even know what passing inf does
> > > right now, but it's probably worth looking into.
> > >
> >
> > Please no.
> >
> > I would expect the API should stick to standard Python conventions,
> > similar to select itself - " When the timeout argument is omitted the
> > function blocks until at least one file descriptor is ready."
> > so wait_edge_event() should block, as should wait_edge_event(None)
> >
> > > > to submit a patch
> > >
> > > Move the project back to a git forge and I will.
> > >
> >
> > And there you go being confrontational again. GFY.
> >
> > Read the README - you submit patches to this list.
> >
> > And not my project, so not my call on where it is hosted.
> > I'm just trying to help you out here, but I'm left wondering why.
> >
> 
> I wouldn't call it a bug, more like unusual behavior as far as Python APIs go.
> 
> I never noticed it before because I typically use the file descriptor
> directly and pass it to the polling function of choice.
> 

And I never reviewed the implementation - but from the higher level
functions (wait_edge_events()) I expected that None would block, as that
is the standard Python convention.

> In any case - the easiest way to fix this would be allowing the use of
> a negative number to indicate that we should wait forever. Any issue
> with that?
> 

As above, None makes more sense to me in a Python context.
I expect that anyone calling wait_edge_events() would expect that to
block, right?  It does say "wait".

Anyone currently using it will find that it is a NOP, so I doubt there
are many of those.  And the documentation needs to updated the clarify
what None does, either way.

IIWU, I'd rather fix this correctly now, rather than be explaining the
negative means blocking to Python users until the end of time.

Cheers,
Kent.


