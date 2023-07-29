Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3DB5767B72
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jul 2023 04:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234323AbjG2CDW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jul 2023 22:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232828AbjG2CDW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jul 2023 22:03:22 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FA894490
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jul 2023 19:03:18 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bbf0f36ce4so6450505ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jul 2023 19:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690596198; x=1691200998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vtwuwo+EXWSfS9ZVzadI3Xpurl9u3IR4ceexRIGwXOg=;
        b=GHE49G7qb8iTjlVc+PEeihO4OnGIFgSwV3aaES9gVa+hXS68ZbtKWO5/izKNqI74gV
         SbaZaAgwsI3R84fssqvUAS+QDox7Wm/Zw3hWwwG1zX16SbdAXutSjN82BQRBxafY1Cm4
         b7wyix5T3tbBYyMhD3EpmO6qkrWwYdyvqaIV9Oma1Aio1Q9dEg9WYUl0eZqPpbhZOnvp
         mUzoQvqVC8ts6M7o6U7F/I+p0MxGdJ76fKEE7pHmf+i052OWnBbTBtWUB+Ewj48+Xt3n
         M0vqvlQk+iKcuObzjWXhcOQcGxEFvYkP4EgQ6ZM4Z0vZ7GxNms+f29PFa7bTELu5EL0U
         oGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690596198; x=1691200998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vtwuwo+EXWSfS9ZVzadI3Xpurl9u3IR4ceexRIGwXOg=;
        b=Ma0HPGNWdaMF7lxIy8P52bSxQ/pL9zSHnibdLaLIMv0/HRnOs8+nGc3baHcKXahYng
         g6b8xfRVhxK0m8EM/DwUWYIH694ysn9cQ12GwREWBsh3AwHzpxlOkWidLILXKFilFAoQ
         InSq36qbAKFffiP2nUvhReQT0ccBNzkLmwTA/o0GMdwXaJy7AMKN1z388pfyZpwsJWLD
         wCsGw61KtInC+ZzFXloe/rEYmkac/YcH3NSX/N987GdmSRTuoY/SnMQK31nk1bpOBCh3
         0+1G7BQfdTF5cxQYzzcZNI9dds5CYCwGFdjvNB0ZcqCPpPSpp277Rk1xgLUnkAi2xq59
         Eqow==
X-Gm-Message-State: ABy/qLZbOPT/7Y7fp6x5h6Mn3e2opp1HaGeiOqwKHmEzOBMzdOcnjzmS
        jFxFHs697WtkBfL1xe6qtsDZ7P/8jMU=
X-Google-Smtp-Source: APBJJlGOp6W4QeTq0W4afUkJs51tXCZWLzMOy7vOuT5fLFTssOIFFUrViTGfGgFciXHyvyf19uupTQ==
X-Received: by 2002:a17:902:8217:b0:1b6:771a:3516 with SMTP id x23-20020a170902821700b001b6771a3516mr2946473pln.22.1690596197755;
        Fri, 28 Jul 2023 19:03:17 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id jn13-20020a170903050d00b001b895a18472sm4197618plb.117.2023.07.28.19.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 19:03:17 -0700 (PDT)
Date:   Sat, 29 Jul 2023 10:03:12 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     andy pugh <bodgesoc@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] gpiod_line_get_value_bulk may be broken?
Message-ID: <ZMRzYD6wGYywiPbd@sol>
References: <CAN1+YZU95GyPdE0fDcQNweMCHq0FXQ5RxR5dqmKdmMUaoiMsfw@mail.gmail.com>
 <ZMLZSqRwrPfKEbX3@sol>
 <CAN1+YZX1m8iZPg1EM8ivqCft83hT1ERcmb2kxx53rNFA7NTJ3w@mail.gmail.com>
 <ZMLnz25brQvcwBVW@sol>
 <CAN1+YZXqsgCXVhiVHasBMBzCVs-r=wi93m6m5ojUhOi_NOsOxg@mail.gmail.com>
 <ZMNYsOXrOOZgxLeC@sol>
 <CAN1+YZWjEZQY6yffCFrt0vLVA6P0j5dDbRz=b5c0MXJoSszhig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN1+YZWjEZQY6yffCFrt0vLVA6P0j5dDbRz=b5c0MXJoSszhig@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 28, 2023 at 08:01:13PM +0100, andy pugh wrote:
> On Fri, 28 Jul 2023 at 06:57, Kent Gibson <warthog618@gmail.com> wrote:
> 
> > Your problem is that finding lines this way produces gpiod_lines with
> > different chip pointers, and gpiod_line_request_bulk_input() is taking
> > that to mean different chips, so the request itself is failing - but you
> > didn't check.
> 
> That was on my list of things to check next, but it was getting late
> and I wanted to send the failing case as requested.
> I had guessed that the same line_bulk_same_chip() routine would be the
> cause of the bulk request failing too.
> 
> I think that test might be flawed....
> 

Fixing the same chip check might be possible, but I would have to look
into all the other cases where is it used and for any other side effects.
I'm much more familiar with v2, so I'm not sure how deep that rabbit
hole goes.

> >   line0 = gpiod_chip_find_line(chip, "GPIO17");
> >   line1 = gpiod_chip_find_line(chip, "GPIO18");
> >   line2 = gpiod_chip_find_line(chip, "GPIO19");
> 
> This is working for me now, thanks.
> 
> > Not saying the gpiod_line_request_bulk_input() behaviour is correct, but
> > given v1 is obsoleted by v2, and there is a reasonable workaround for
> > v1 (assuming you know the chip the line is on), I'm not sure Bart will
> > want to fix that quirk.
> 
> Unfortunately I won't know what chip the line is on, but I have
> already considered that and plan to have an array of structs
> containing the "bulk" and the "chip" for each chip that is needed
> according to the IO line list submitted by the (pesky!) users.
> 

So the IO lines are specified by name?

The GPIO uAPI is chip based, so if you have lines on multiple chips you
will need a line_bulk for each chip.  So you are going to have to
partition the lines before adding them to a bulk either way.
The v1 API is a bit unfortunate as you have to add gpiod_lines to
the bulk.
The libgpiod v2 API makes that a bit easier by separating the chip and
offsets when creating line_requests (which replaced the line_bulk).

For v1 you would currently need to get a gpiod_line from that specific
chip object, as I did above with gpiod_chip_find_line().
To make that more general you would use gpiod_find_line() to determine
which chip the line is on, then get a new gpiod_line for each line on
that chip using gpiod_chip_get_line() or gpiod_chip_get_lines(), rather
than repeating the find on the chip - you know the offset now.

> > For the same reason, I would suggest that you try libgpiod v2 and use
> > that instead if you possibly can - assuming libgpiod is fast enough for
> > your application.
> 
> libgpiod2 (and any further bugfix to 1.6 for that matter) have the
> problem of not being currently available as packages in the
> distributions we use.
> 

Be aware that the libgpiod2 library package in Debian is actually libgpiod v1
- currently 1.6.3 in stable[1].
Not sure about the story behind that - before my time.
And no idea what they will package libgpiod v2 as, libgpiod-2??, but
there will be confusion whatever they do.
There is no libgpiod v2 package in Debian yet, AFAIAA, but they are
at least aware.

As libgpiod v1 and libgpiod v2 target different versions of the GPIO
uAPI, there is a case for having both installed at the same time - older
apps require v1 and newer ones v2.  So that is going to be fun.

> It is possible that we could serve the package from our _own_ package
> server which we have been running for a couple of decades, but as we
> have _just_ been accepted as a mainline Debian package that would seem
> a little peculiar (and involves trying to explain to machinists how to
> add extra repositories and set up the associated keys)
> 

Could you statically link until libgpiod v2 becomes more widely available?

I would strongly lean towards using v2 over v1 if that is at all
possible, to avoid having to port from v1 to v2 at a later date.

> I think I see the way forwards now. Thanks for your help.
> 

Sorry that your path ahead isn't as smooth as it could be.

Cheers,
Kent.

[1] https://tracker.debian.org/pkg/libgpiod

