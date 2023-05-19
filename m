Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4707D709AA6
	for <lists+linux-gpio@lfdr.de>; Fri, 19 May 2023 16:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbjESO47 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 May 2023 10:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbjESO45 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 May 2023 10:56:57 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7836FC7
        for <linux-gpio@vger.kernel.org>; Fri, 19 May 2023 07:56:51 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-64d24136685so704953b3a.1
        for <linux-gpio@vger.kernel.org>; Fri, 19 May 2023 07:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684508211; x=1687100211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q2egXTOnPLlfUBNGeBIDphILzMZIRxkCXGFv0gysOpo=;
        b=alT1RQIGaMXLbzIkPxoyaz+ey3I/sRxXY6EdoPw+lcmUSXai272HhISz0qUqE91ZT8
         VCoBKpkDprE6mMZjvLh/dvPSYNqyeKsWAD7OnOCwl1B79BIQH9nV2n4SmHVZLHpg5JY7
         8XEorR7lQYU6X8ULAPUIO7rrqMr4lqdwrgFw1rvQPDpT2JKy7QihMUVhd7/YvYe9O38A
         EG7tlIK3W1EdI/Wm4LxcdGOPGwFQzBLJZAdw4nUNAwVpdxFYHGeZc7x+sz+ZqDqElCca
         jI9i3+wjfO7MVwddUOpHy87TFm/l22r5pdaGvDwiRW/1fd5h9MHKDz70kaj1tVPrzDxc
         d3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684508211; x=1687100211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2egXTOnPLlfUBNGeBIDphILzMZIRxkCXGFv0gysOpo=;
        b=F2NHr/AmXbVIntYO39r1y4tTcReB7dl4NvbIAZYU6lMKiVac/j0Q52gPSMT1FgJYMB
         rsfcnkv/3ubQYR4NoyE8nSENw8sywC83zfwEQmulocHFmU5hii8pSUdXeCdnWDFnyzxw
         7n5S5z0JankB1o7vdT5kisJOiPoFeLYhqIzM/sdZxm+jjUULwOpd7d4ufjMQPdykvN7W
         nbOY2tOdWCknVhPkeVh33udBBn/cCmtFwsGu03Tbd81x/k8+MmmAhDhtdO9IllNDvlJ4
         F2E9+M2rQmDSQVHZg1NFZLLv77J1sSiYTE5xBWezxgiv9YQKpxWiIndpq4d6p9m1Y6Ns
         V1jA==
X-Gm-Message-State: AC+VfDwJauXoKngu6rOUZD1nqzkJ7JYwklwkD51upcDXkE+7Hud46mSm
        5GW4pLKodCR71VAusdNThao=
X-Google-Smtp-Source: ACHHUZ49qKrrZ8DMv75cewMHIKrmcG3vzAJQbgd3oBrOCwBlCJGPdcK+neXhhzHBQq++wPwIHHqVhQ==
X-Received: by 2002:a05:6a20:42a0:b0:ee:9647:45fa with SMTP id o32-20020a056a2042a000b000ee964745famr2949146pzj.20.1684508210740;
        Fri, 19 May 2023 07:56:50 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id x18-20020aa793b2000000b006258dd63a3fsm3111227pff.56.2023.05.19.07.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 07:56:50 -0700 (PDT)
Date:   Fri, 19 May 2023 22:56:45 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod] Python bindings don't allow to wait on events
 indefinitely
Message-ID: <ZGeOLYZ1tEKfMOwn@sol>
References: <3545766.4eto28bQOc@archbook>
 <ZGcGZwwRiy2jFfR0@sol>
 <46830564.8zq9ZvEiHi@archbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46830564.8zq9ZvEiHi@archbook>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 19, 2023 at 04:32:32PM +0200, Nicolas Frattaroli wrote:
> On Freitag, 19. Mai 2023 07:17:27 CEST Kent Gibson wrote:
> > On Thu, May 11, 2023 at 10:28:34PM +0200, Nicolas Frattaroli wrote:
> > > Hello,
> > > 
> > > in libgpiod 1.6.x, Line.event_wait's codepath had no path where ts
> > > as passed to ppoll could ever be NULL. This means waiting indefinitely
> > > was impossible.
> > > 
> > > I thought hey, maybe the new Python bindings in libgpiod 2.x fixed this,
> > > but no, it has made it worse by explicitly setting timeout to 0 seconds
> > > if it's None[1]. Obviously, this behaviour can't be changed now, because
> > > people depend on this API to return immediately now with None as the
> > > parameter, and changing it to wait indefinitely would no doubt break
> > > actual programs.
> > > 
> > > So I'm left wondering if there's a particular reason users of these
> > > bindings shouldn't wait on events indefinitely or if that same mistake
> > > was just made twice in a row.
> > > 
> > > Is there some way the API could be enhanced to support waiting for
> > > events indefinitely without having to slap a While True with
> > > an arbitrarily high timeout around every single invocation?
> > > 
> 
> Hello Kent,
>  
> > That does sound like a bug to me, but the rest of your mail isn't worth
> > responding to.
> 
> I'm not quite sure what you mean. Was my tone this off? I apologise if
> you took my displeasure with libgpiod's bindings as a personal attack,
> it wasn't intended as such.
> 

Not a personal attack on me, but offensive none the less.
Assume you are the code owner and see how it parses to you.

> > A more productive approach could be to submit a patch that describes the
> > problem and suggests a fix, say:
> > 
> >  def poll_fd(fd: int, timeout: Optional[Union[timedelta, float]] = None) -> bool:
> > -    if timeout is None:
> > -        timeout = 0.0
> > -
> > 
> > and see where that goes.
> 
> That would go nowhere, as this makes the API behave differently for current
> users calling the function without an argument, as I've mentioned.
> 

By that logic any bug that has visible effects cannot be fixed - in case
some user depends on those effects.
And all bugs have visible effects.

The function docs don't specify the behaviour when None is passed -
despite None being the default.

> One solution would be to pass float("inf") and then check for that, this
> wouldn't break the API, merely extend it, but I'm not sure how good of
> an idea that is to do if someone uses an older libgpiod that doesn't
> have an explicit check for inf. I don't even know what passing inf does
> right now, but it's probably worth looking into.
> 

Please no.

I would expect the API should stick to standard Python conventions,
similar to select itself - " When the timeout argument is omitted the
function blocks until at least one file descriptor is ready."
so wait_edge_event() should block, as should wait_edge_event(None)

> > to submit a patch
> 
> Move the project back to a git forge and I will.
> 

And there you go being confrontational again. GFY.

Read the README - you submit patches to this list.

And not my project, so not my call on where it is hosted.
I'm just trying to help you out here, but I'm left wondering why.

Cheers,
Kent.
