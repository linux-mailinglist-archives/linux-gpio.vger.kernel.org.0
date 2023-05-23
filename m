Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBD0E70DD65
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 15:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232878AbjEWNUu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 09:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236869AbjEWNUs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 09:20:48 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF39188
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 06:20:42 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1ae3a5dfa42so51727845ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 06:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684848042; x=1687440042;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kb9RKzLKAecMUVzyHWpkkE6dHDpXArUTn800hes7E0o=;
        b=Zjy0sB0qmK2uIp2s123IRkPv+EAAOXL5ta6FK0V2fArZ6BrLMVBpRr7vxbQVMHogRC
         CyqKvGZtVJk4+fXP6I0Y5vRY+G4M4MOEwEhjdjV74SwlBnWR/2FUdPolLv280htmB6Ev
         qzsurFAeg4D+SgD8mWskwSr1xuLK0XWexdbzm00GWNZAMSm0fYqbIlDfA+Y5FR6bKlyW
         +lMCv/Kc3XkndiL5Cud3ebArHYfUO0pD/r4P5D1/ik/j2cd5nai+a79vcmCaxyVazoaw
         21N8auK302WFTELLfzSnux1FFsc2RrXh7ajparwsdPt4+tV53D25pWOBULIeVcCkR/KI
         RvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684848042; x=1687440042;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kb9RKzLKAecMUVzyHWpkkE6dHDpXArUTn800hes7E0o=;
        b=Xc0LclD7MuyxYLWWK8w5TtEtk5++lepRPbOfW8dttEzkJ+nAdS7C2KrIfc0p1L79d2
         nR810eUQKr60IMESvyH7f9BxGVgyCGSb0HBjDsosH2sqOAdg2wkqngYz4JCDBLWd+Rcl
         Tpl2MaQKnWtjfh8mm7FxbvDicguGsdPoV409riPEgY7dFzZmANcxkB2w5eAwy2xdVfrc
         hEPiepB067TEyjXdTqwleptZmw0sH+pzy/ORe8ze4WNfkks1aitm7Y9C1dFZQlMkcjPI
         zf+cBXYTxdwKb30raTqAL8mJWeUeCNwbWoy7cv0UWSs7H3Sd0mbtLJKLXBAGrNo/EPdt
         Fk3w==
X-Gm-Message-State: AC+VfDxI/HoL32mJrA5VeYM5O4unEH45HdU1Do1ylByc4+W+q4FFfnta
        HxRoJcbd9RxT2SNiLv/ZQxY=
X-Google-Smtp-Source: ACHHUZ5yKZPWTp3b/hnrEFb2FJ/u/F9HbnEP51J/MDyqSsGSoz9RQfLuCjWVnYF6A+H7iJNS7DbuHw==
X-Received: by 2002:a17:902:f551:b0:1ae:5c72:d63c with SMTP id h17-20020a170902f55100b001ae5c72d63cmr17699733plf.11.1684848041947;
        Tue, 23 May 2023 06:20:41 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id w10-20020a170902e88a00b001a687c505e9sm6736000plg.237.2023.05.23.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 06:20:41 -0700 (PDT)
Date:   Tue, 23 May 2023 21:20:37 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] Python bindings don't allow to wait on events
 indefinitely
Message-ID: <ZGy9pYLVSCvP/FGb@sol>
References: <3545766.4eto28bQOc@archbook>
 <ZGcGZwwRiy2jFfR0@sol>
 <46830564.8zq9ZvEiHi@archbook>
 <ZGeOLYZ1tEKfMOwn@sol>
 <CAMRc=McTcK=fPPrkPSr2X5hhypr3aas_f2HJs4TivsJtPHqjeA@mail.gmail.com>
 <ZGySMjMZNUzfikwX@sol>
 <CAMRc=McwX_esiyWcQ4mz7Nv8yKN4fbM7Yif3e0GMeJ0vKKGGeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McwX_esiyWcQ4mz7Nv8yKN4fbM7Yif3e0GMeJ0vKKGGeQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 23, 2023 at 02:31:37PM +0200, Bartosz Golaszewski wrote:
> On Tue, May 23, 2023 at 12:15 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, May 23, 2023 at 12:03:14PM +0200, Bartosz Golaszewski wrote:
> > > On Fri, May 19, 2023 at 4:56 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Fri, May 19, 2023 at 04:32:32PM +0200, Nicolas Frattaroli wrote:
> > > > > On Freitag, 19. Mai 2023 07:17:27 CEST Kent Gibson wrote:
> > > > > > On Thu, May 11, 2023 at 10:28:34PM +0200, Nicolas Frattaroli wrote:
> > > > > > > Hello,
> > > > > > >
> > > > > > > in libgpiod 1.6.x, Line.event_wait's codepath had no path where ts
> > > > > > > as passed to ppoll could ever be NULL. This means waiting indefinitely
> > > > > > > was impossible.
> > > > > > >
> > > > > > > I thought hey, maybe the new Python bindings in libgpiod 2.x fixed this,
> > > > > > > but no, it has made it worse by explicitly setting timeout to 0 seconds
> > > > > > > if it's None[1]. Obviously, this behaviour can't be changed now, because
> > > > > > > people depend on this API to return immediately now with None as the
> > > > > > > parameter, and changing it to wait indefinitely would no doubt break
> > > > > > > actual programs.
> > > > > > >
> > > > > > > So I'm left wondering if there's a particular reason users of these
> > > > > > > bindings shouldn't wait on events indefinitely or if that same mistake
> > > > > > > was just made twice in a row.
> > > > > > >
> > > > > > > Is there some way the API could be enhanced to support waiting for
> > > > > > > events indefinitely without having to slap a While True with
> > > > > > > an arbitrarily high timeout around every single invocation?
> > > > > > >
> > > > >
> > > > > Hello Kent,
> > > > >
> > > > > > That does sound like a bug to me, but the rest of your mail isn't worth
> > > > > > responding to.
> > > > >
> > > > > I'm not quite sure what you mean. Was my tone this off? I apologise if
> > > > > you took my displeasure with libgpiod's bindings as a personal attack,
> > > > > it wasn't intended as such.
> > > > >
> > > >
> > > > Not a personal attack on me, but offensive none the less.
> > > > Assume you are the code owner and see how it parses to you.
> > > >
> > > > > > A more productive approach could be to submit a patch that describes the
> > > > > > problem and suggests a fix, say:
> > > > > >
> > > > > >  def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
> > > > > > -    if timeout is None:
> > > > > > -        timeout = 0.0
> > > > > > -
> > > > > >
> > > > > > and see where that goes.
> > > > >
> > > > > That would go nowhere, as this makes the API behave differently for current
> > > > > users calling the function without an argument, as I've mentioned.
> > > > >
> > > >
> > > > By that logic any bug that has visible effects cannot be fixed - in case
> > > > some user depends on those effects.
> > > > And all bugs have visible effects.
> > > >
> > > > The function docs don't specify the behaviour when None is passed -
> > > > despite None being the default.
> > > >
> > > > > One solution would be to pass float("inf") and then check for that, this
> > > > > wouldn't break the API, merely extend it, but I'm not sure how good of
> > > > > an idea that is to do if someone uses an older libgpiod that doesn't
> > > > > have an explicit check for inf. I don't even know what passing inf does
> > > > > right now, but it's probably worth looking into.
> > > > >
> > > >
> > > > Please no.
> > > >
> > > > I would expect the API should stick to standard Python conventions,
> > > > similar to select itself - " When the timeout argument is omitted the
> > > > function blocks until at least one file descriptor is ready."
> > > > so wait_edge_event() should block, as should wait_edge_event(None)
> > > >
> > > > > > to submit a patch
> > > > >
> > > > > Move the project back to a git forge and I will.
> > > > >
> > > >
> > > > And there you go being confrontational again. GFY.
> > > >
> > > > Read the README - you submit patches to this list.
> > > >
> > > > And not my project, so not my call on where it is hosted.
> > > > I'm just trying to help you out here, but I'm left wondering why.
> > > >
> > >
> > > I wouldn't call it a bug, more like unusual behavior as far as Python APIs go.
> > >
> > > I never noticed it before because I typically use the file descriptor
> > > directly and pass it to the polling function of choice.
> > >
> >
> > And I never reviewed the implementation - but from the higher level
> > functions (wait_edge_events()) I expected that None would block, as that
> > is the standard Python convention.
> >
> > > In any case - the easiest way to fix this would be allowing the use of
> > > a negative number to indicate that we should wait forever. Any issue
> > > with that?
> > >
> >
> > As above, None makes more sense to me in a Python context.
> > I expect that anyone calling wait_edge_events() would expect that to
> > block, right?  It does say "wait".
> >
> > Anyone currently using it will find that it is a NOP, so I doubt there
> > are many of those.  And the documentation needs to updated the clarify
> > what None does, either way.
> >
> 
> I'm a bit worried about breaking the interface.
> 
> On the other hand I think it boils down to where the contract actually
> lives - in the docs describing the behavior or in the code's behavior
> itself. In this case the docs don't say anything about None. If we
> assume docs take precedence then this could be considered undefined
> behavior and we'd *define* it with Kent's change.
> 
> If the docs said one thing and the code did another, it would mean
> just fixing the code to behave correctly.
> 
> Libgpiod v2 is quite recent, it's normal for it to have some quirks
> that need ironing and there aren't many users of it yet I suppose.
> 
> There's another possibility as well. With python bindings being
> available on pypi, I pretty much disconnected the python version
> (defined in gpiod/version.py) from the libgpiod API version in
> configure.ac. We could change the behavior and bump the major python
> version to 3. But this is such a minor change that I don't think it
> warrants this...
> 
> I need to sleep on it.
> 

And just to confirm, my stance is that this is an implementation bug in
the interface.  wait_edge_events() should block, and it doesn't.
That is the bug.  The fix is to make it block.

The fact the doc doesn't specify the behaviour means we have the freedom
to clarify how it should behave, and if we have that choice we should go
with what Python users expect.  I'm sure I assumed wait_edge_events()
would block when I reviewed the API - cos why wouldn't it.  If there was
any doubt I would've asked you to specify the None behaviour -
particularly if that behaviour would be non-obvious to Python users.

IMHO anyone making use of the broken behaviour is doing so in error,
so I personally have no problem with breaking their broken usage.

Sorry, I'll put my soapbox away...

Cheers,
Kent.
