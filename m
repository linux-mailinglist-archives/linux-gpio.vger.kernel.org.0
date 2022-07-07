Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B113569E71
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jul 2022 11:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234132AbiGGJSy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jul 2022 05:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbiGGJSy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jul 2022 05:18:54 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95545326DA
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jul 2022 02:18:53 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id i190so4779614pge.7
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jul 2022 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BiSDmXw+YCQmzXKuYXE+FYx2waoT+9d5JcgYX/UIM8s=;
        b=Op60KyFObQ+xOn1tjS/zM8byElDtCg2l+cHW6kUO4taJGmE2MgPAdydVxjF0A0ixuq
         YmMNijh1fGcVboH/cCl7SE18jN0DcFtmfLgL9OOWeza8GIe4//YI30phViv2LzjuS3WL
         G4ZTwuYAErP8PhqFHJQr5rmVnmnSw2+i0mpKxcHRPloEHIPYV36qzyP3MXEGhcOxAo18
         icJ42VJv8h5xpotb2rusM3xWfkBVOUL0agpD4g6cmt5AWvdqNFxzbXvi1fAB9XjN8NO0
         qUqHObFmv7LGj3dYCUy3xsuO6cioHFtarmw2qEa97tEnLiyx19D2Ohl6iUgYTaBemJVw
         OcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BiSDmXw+YCQmzXKuYXE+FYx2waoT+9d5JcgYX/UIM8s=;
        b=1djO4HHgX9gRtGHfs2Qo592rH0RcnoFvXpPuJfyS3vOiPkKxGUFd9gx9shDz2snili
         Tpi5JWs4j7TAq38dwDRqheuXSTa1hFn1iO30O63vRTeB+pFPi+u/kzD7mxejIm3Bh+Iu
         b0a0kzSXgx4eweOpLNIdfoen4tp75etwsTzeI+2bl2DgAxsuXuS6LW2nfqJMRkPsw2gN
         WP1XT/Ftz+adf/FN5ibWOramOZYQ7zZqfusakPPRkTFRaLk6ysgkglzsBY7RcprMe1RN
         n8Rx5Rq6AAZzamu3z6GokUOfx7FAay0MsncxFSvhzMR83knIJeAXuAW5fmDZzpSOeJLO
         eSJw==
X-Gm-Message-State: AJIora9RofYRR/As2gDg8KKiCf1p6F1dNJs5VQHApBPc0nHpPD3b3PE7
        8wOWUUPxZ+A18WO4tvXhUrqYPcQMJis=
X-Google-Smtp-Source: AGRyM1v8DQ8BkNV9ltk0UEVFlLwVKNc/+bIdVeoDa1+oK0ENnvH9t+dxghIqCWLnCzx8QswhpEO4bg==
X-Received: by 2002:a17:902:d549:b0:16a:3ac1:354 with SMTP id z9-20020a170902d54900b0016a3ac10354mr52326629plf.148.1657185532913;
        Thu, 07 Jul 2022 02:18:52 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id n9-20020a17090b0d0900b001ef8912f763sm8170818pjz.7.2022.07.07.02.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 02:18:52 -0700 (PDT)
Date:   Thu, 7 Jul 2022 17:18:48 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH 1/4] tools: line name focussed rework
Message-ID: <20220707091848.GA57683@sol>
References: <20220627134447.81927-1-warthog618@gmail.com>
 <20220627134447.81927-2-warthog618@gmail.com>
 <CAMRc=Mf_WKcTNq0o8AbcBWzdMa=-D_=A5S_Y3ZJ40wimhMUwXw@mail.gmail.com>
 <20220707022407.GA7250@sol>
 <CAMRc=McGO6B-zGSbOMz5RXQ=EgTm2o-Si8TAw1RWXBmhFbtYhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McGO6B-zGSbOMz5RXQ=EgTm2o-Si8TAw1RWXBmhFbtYhw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 07, 2022 at 11:01:49AM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 7, 2022 at 4:24 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Jul 06, 2022 at 10:20:00PM +0200, Bartosz Golaszewski wrote:
> > > On Mon, Jun 27, 2022 at 3:46 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > Rework the tool suite to support identifying lines by name and to
> > > > support operating on the GPIO lines available to the user at once, rather
> > > > than on one particular GPIO chip.
> > > >
> > > > All tools, other than gpiodetect, now provide the name to (chip,offset)
> > > > mapping that was previously only performed by gpiofind. As names are not
> > > > guaranteed to be unique, a --strict option is provided for all tools to
> > > > either abort the operation or report all lines with the matching name, as
> > > > appropriate.
> > > > By default the tools operate on the first line found with a matching name.
> > > >
> > > > Selection of line by (chip,offset) is still supported with a --chip
> > > > option, though it restricts the scope of the operation to an individual
> > > > chip.  When the --chip option is specified, the lines are assumed to be
> > > > identified by offset where they parse as an integer, else by name.
> > > > To cater for the unusual case where a line name parses as an integer,
> > > > but is different from the offset, the --by-name option forces the lines
> > > > to be identified by name.
> > > >
> > >
> > > We could potentially extend it by allowing multiple --chip arguments
> > > for multiple chips but let's not go there unless requested.
> > >
> >
> > We could but then we'd have to custom parse the command line.
> > Or repeatedly apply getopt()?
> > So yeah, keep it simple for now.
> 
> getopt() will go to the relevant switch case everytime it encounters
> the flag, then you can process it and add it to the list.
> 

Yeah, but the lines are positional parameters between the --chip
options.
i.e.
 
 --chip gpiochip1 1 2 4  --chip gpiochip3 6 7 8

I thought getopt() bails when it hits positional args?
Or am I missing something?

> >
> > > > The updated tools are intentionally NOT backwardly compatible with the
> > > > previous tools. Using old command lines with the updated tools will
> > > > almost certainly fail, though migrating old command lines is generally as
> > > > simple as adding a '-c' before the chip.
> > > >
> > > > In addition the individual tools are modified as follows:
> > > >
> > > > gpiodetect:
> > > >
> > > > Add the option to select individual chips.
> > > >
> > >
> > > We discussed at some point that gpiodetect should also check if any of
> > > the files it iterates over is a symbolic link to a GPIO device and
> > > print some info accordingly (e.g. foobar [link to /dev/gpiochip2])-
> > > are you thinking about adding this too?
> > >
> >
> > Did we?  My bad then - I clearly forgot and instead filtered the symlinks
> > out so it only reports actual chips (btw the v1 tools report the symlinks
> > by repeating the actual, which is the worst of both worlds).
> >
> 
> I think so. In any case I think this would be useful.
> 

gpiodetect on a symlink will report for the chip that link points to.
Similarly gpioinfo.
Isn't that sufficient?

i.e. the bare form of gpiodetect and gpioinfo report all the actual
chipts, while the specific form reports whatever the provided path,
resolves to, including following symlinks.

...
> > >
> > > readline is licensed under GPLv3 - this bleeds into gpioset and will
> > > make a lot of companies bounce off of it. Any chance you could use
> > > libedit instead? It's supposed to be a drop-in replacement for
> > > readline but I have never used it first hand.
> > >
> >
> > Hey, you mentioned readline before I implemented it.
> > Though I don't recall "avoid" being mentioned :-(.
> >
> 
> No, you're right, I mentioned it but then realized it's GPLv3.
> 
> > Ok, I'll take a look.  Hopefully it is just a drop-in.
> >
> > Out of curiosity which aspect of GPLv3 is the problem, for a tool
> > which is publicly available and they aren't going to modify?
> > Just having a GPLv3 library on their system?
> >
> 
> You'd be surprised how allergic companies are to GPLv3. Anything
> "tainted" with GPLv3 is often banned.
> 

Ok, news to me.  I might quarantine them to prevent building against
them, but banning them outright is a bit extreme.
OTOH I've worked at places that banned Linux (or tried to anyway).

Anyway, I'll look into the alternatives.

Cheers,
Kent.
