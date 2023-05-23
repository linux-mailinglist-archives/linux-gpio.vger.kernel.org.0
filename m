Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F99E70DC9D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 14:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236873AbjEWMcH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 08:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236820AbjEWMcH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 08:32:07 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C13185
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 05:31:49 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-76d846a4b85so2077517241.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 05:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684845108; x=1687437108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ox19x9hdk5TkD0RPRerSgv0gVyXxh8DM+MqC+D6PDHc=;
        b=R0igymlS1fEZGAOBZcJLPdkQcU5RjjKkFuDLDnGJWiDnYQjcjatnk81ArdfZF0fapq
         TA+AmXhNf8FbgAthYC8PQHakkHvrEXdrLe8OWBCgMYkFLQLA7GFr5PpUC/NR8NRMU8kp
         HHArwp4j7QpE+FIZNysNdMQXvQ6iFfnxCjaDDvlqLdibrvcb93dNprn2LOWn5j9SqfWz
         3nZQ/3kcxqz2ivVf6rEOgAd/PpUyuooYFzJ2DiF+PSdgGqQGp6NE3Zstg6kYfMIQP0/6
         a3Y6rOH4xg84RuF62VeAPJXk/23XyzIF48dHyRcNgp/zMvd34YV8pabjNPvqcK3nOerP
         Y7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684845108; x=1687437108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ox19x9hdk5TkD0RPRerSgv0gVyXxh8DM+MqC+D6PDHc=;
        b=GHc4gJJdyWHiv9ge8zwEtKxIGcqT77uLwPl8bZwOLQkhUVEZCvhqZjuEqUKR++BCJX
         FbcRuKaJo0ietPtKt/7bnMGoWzBya9OH215SC9m+092M2S7ZFdob0QklaOFG631LtkkS
         ENoWMO9Pe1eeoQiCPos3aTqwWTabJsAF0bbQUbXFgyW16xKjCQqcrrnaC5QTn2/EqMAa
         Y20IkTOR2zkwohYaO2VMtmlmgpZHbO8rpDWg6ROnwQDdULVEb/jRUklrzV45poI43xnN
         dk5wmMXOyq7XR5MmuEisMCs/6+RoLmgjHRDiv0+a7nT1RQ+1LBRDOrxqdCIV3RG2DsDB
         lYfw==
X-Gm-Message-State: AC+VfDwnTCKGlZTmyAx0+XnusAaEFHz6TCj9zvka+ICClrQJFSLzXb/J
        0vNT39zygviyN+Ci+CdV7LwhVVbb19t73z06ikVhzl+tnAakltre
X-Google-Smtp-Source: ACHHUZ6JV5MAMSWKpWtnJA5WxUjI/LKNyiKmvCuHNoLm+uZucjjJJKcdKFCIm2BwAwqsSSjyZT00QBuqMMJK6xrhQkc=
X-Received: by 2002:a05:6102:393:b0:436:367:4ac0 with SMTP id
 m19-20020a056102039300b0043603674ac0mr3648545vsq.19.1684845108089; Tue, 23
 May 2023 05:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <3545766.4eto28bQOc@archbook> <ZGcGZwwRiy2jFfR0@sol>
 <46830564.8zq9ZvEiHi@archbook> <ZGeOLYZ1tEKfMOwn@sol> <CAMRc=McTcK=fPPrkPSr2X5hhypr3aas_f2HJs4TivsJtPHqjeA@mail.gmail.com>
 <ZGySMjMZNUzfikwX@sol>
In-Reply-To: <ZGySMjMZNUzfikwX@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 14:31:37 +0200
Message-ID: <CAMRc=McwX_esiyWcQ4mz7Nv8yKN4fbM7Yif3e0GMeJ0vKKGGeQ@mail.gmail.com>
Subject: Re: [libgpiod] Python bindings don't allow to wait on events indefinitely
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 23, 2023 at 12:15=E2=80=AFPM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> On Tue, May 23, 2023 at 12:03:14PM +0200, Bartosz Golaszewski wrote:
> > On Fri, May 19, 2023 at 4:56=E2=80=AFPM Kent Gibson <warthog618@gmail.c=
om> wrote:
> > >
> > > On Fri, May 19, 2023 at 04:32:32PM +0200, Nicolas Frattaroli wrote:
> > > > On Freitag, 19. Mai 2023 07:17:27 CEST Kent Gibson wrote:
> > > > > On Thu, May 11, 2023 at 10:28:34PM +0200, Nicolas Frattaroli wrot=
e:
> > > > > > Hello,
> > > > > >
> > > > > > in libgpiod 1.6.x, Line.event_wait's codepath had no path where=
 ts
> > > > > > as passed to ppoll could ever be NULL. This means waiting indef=
initely
> > > > > > was impossible.
> > > > > >
> > > > > > I thought hey, maybe the new Python bindings in libgpiod 2.x fi=
xed this,
> > > > > > but no, it has made it worse by explicitly setting timeout to 0=
 seconds
> > > > > > if it's None[1]. Obviously, this behaviour can't be changed now=
, because
> > > > > > people depend on this API to return immediately now with None a=
s the
> > > > > > parameter, and changing it to wait indefinitely would no doubt =
break
> > > > > > actual programs.
> > > > > >
> > > > > > So I'm left wondering if there's a particular reason users of t=
hese
> > > > > > bindings shouldn't wait on events indefinitely or if that same =
mistake
> > > > > > was just made twice in a row.
> > > > > >
> > > > > > Is there some way the API could be enhanced to support waiting =
for
> > > > > > events indefinitely without having to slap a While True with
> > > > > > an arbitrarily high timeout around every single invocation?
> > > > > >
> > > >
> > > > Hello Kent,
> > > >
> > > > > That does sound like a bug to me, but the rest of your mail isn't=
 worth
> > > > > responding to.
> > > >
> > > > I'm not quite sure what you mean. Was my tone this off? I apologise=
 if
> > > > you took my displeasure with libgpiod's bindings as a personal atta=
ck,
> > > > it wasn't intended as such.
> > > >
> > >
> > > Not a personal attack on me, but offensive none the less.
> > > Assume you are the code owner and see how it parses to you.
> > >
> > > > > A more productive approach could be to submit a patch that descri=
bes the
> > > > > problem and suggests a fix, say:
> > > > >
> > > > >  def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] =
=3D None) -> bool:
> > > > > -    if timeout is None:
> > > > > -        timeout =3D 0.0
> > > > > -
> > > > >
> > > > > and see where that goes.
> > > >
> > > > That would go nowhere, as this makes the API behave differently for=
 current
> > > > users calling the function without an argument, as I've mentioned.
> > > >
> > >
> > > By that logic any bug that has visible effects cannot be fixed - in c=
ase
> > > some user depends on those effects.
> > > And all bugs have visible effects.
> > >
> > > The function docs don't specify the behaviour when None is passed -
> > > despite None being the default.
> > >
> > > > One solution would be to pass float("inf") and then check for that,=
 this
> > > > wouldn't break the API, merely extend it, but I'm not sure how good=
 of
> > > > an idea that is to do if someone uses an older libgpiod that doesn'=
t
> > > > have an explicit check for inf. I don't even know what passing inf =
does
> > > > right now, but it's probably worth looking into.
> > > >
> > >
> > > Please no.
> > >
> > > I would expect the API should stick to standard Python conventions,
> > > similar to select itself - " When the timeout argument is omitted the
> > > function blocks until at least one file descriptor is ready."
> > > so wait_edge_event() should block, as should wait_edge_event(None)
> > >
> > > > > to submit a patch
> > > >
> > > > Move the project back to a git forge and I will.
> > > >
> > >
> > > And there you go being confrontational again. GFY.
> > >
> > > Read the README - you submit patches to this list.
> > >
> > > And not my project, so not my call on where it is hosted.
> > > I'm just trying to help you out here, but I'm left wondering why.
> > >
> >
> > I wouldn't call it a bug, more like unusual behavior as far as Python A=
PIs go.
> >
> > I never noticed it before because I typically use the file descriptor
> > directly and pass it to the polling function of choice.
> >
>
> And I never reviewed the implementation - but from the higher level
> functions (wait_edge_events()) I expected that None would block, as that
> is the standard Python convention.
>
> > In any case - the easiest way to fix this would be allowing the use of
> > a negative number to indicate that we should wait forever. Any issue
> > with that?
> >
>
> As above, None makes more sense to me in a Python context.
> I expect that anyone calling wait_edge_events() would expect that to
> block, right?  It does say "wait".
>
> Anyone currently using it will find that it is a NOP, so I doubt there
> are many of those.  And the documentation needs to updated the clarify
> what None does, either way.
>

I'm a bit worried about breaking the interface.

On the other hand I think it boils down to where the contract actually
lives - in the docs describing the behavior or in the code's behavior
itself. In this case the docs don't say anything about None. If we
assume docs take precedence then this could be considered undefined
behavior and we'd *define* it with Kent's change.

If the docs said one thing and the code did another, it would mean
just fixing the code to behave correctly.

Libgpiod v2 is quite recent, it's normal for it to have some quirks
that need ironing and there aren't many users of it yet I suppose.

There's another possibility as well. With python bindings being
available on pypi, I pretty much disconnected the python version
(defined in gpiod/version.py) from the libgpiod API version in
configure.ac. We could change the behavior and bump the major python
version to 3. But this is such a minor change that I don't think it
warrants this...

I need to sleep on it.

Bart

> IIWU, I'd rather fix this correctly now, rather than be explaining the
> negative means blocking to Python users until the end of time.
>
> Cheers,
> Kent.
>
>
