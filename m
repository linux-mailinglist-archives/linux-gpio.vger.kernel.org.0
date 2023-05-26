Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16DF8712076
	for <lists+linux-gpio@lfdr.de>; Fri, 26 May 2023 08:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242316AbjEZGvM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 May 2023 02:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242171AbjEZGvL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2023 02:51:11 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716DF1A2
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 23:51:10 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-253520adb30so406307a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 23:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685083870; x=1687675870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PRrElg0+R8bhCVeF7ctcDDmmnh4xyp1i1XsqsVruGYs=;
        b=eNWm8G/wKE54dik2agC4Vr/VEagp100nbnfxYb255uZlNqAfblkUa3+yzwQOi9eORP
         JN62A+rv1o6LH5RohJ+buGcNOTVTKDcgQtKACY6seZplYH1a9rtyxCzglxiQlumcXhle
         sy0pk+vpO92X48O1OC2NGfEqNq0CZOg53Hlopi7lgTQWA4pvAN1gzgmvyK5BYAezqH0r
         zaQUibA25LBGke+o2VRZUD5r69u/Dcg4rzfzHY0GK7iJxBLd8KDkY8ZhB9zDWDIyy4Kj
         wDHVGgF61pV2MXbBaFtTf5u/ElCF39nJGU6K4mD2bV/CXaVamar7+QSXIz9MtNjiAP7G
         Gyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685083870; x=1687675870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRrElg0+R8bhCVeF7ctcDDmmnh4xyp1i1XsqsVruGYs=;
        b=Vq0VwGs9ANW6mVHMo0AD9zRsSM+65rE7l0r8ceZwQuhKUzFOLPGiwWletMS1QN2QwH
         nHz/38Me/aoeJUMUbnd3IO0k/P3MItL5XIlIia4GZS0XSQ/xi2VDis8rL/J7TYlG/uwN
         IQXQc70kR2LZF74XvJiWI2BRQGxPD4JgLLH/r5vs+wt9/XsLOPSL5imkDhwqcaiPhvzn
         RfE9DUZQMayikpZz5cstu9qv2mPV6WufrliPucIdnn7G3ie0xRm5YKORSruZr0raqerG
         07laxFa+V9wKKRLqjCRk23b/Fz+CMAROSMty+oVTRlelZT2QA2Q+LL3jFHWaZuq1rZjt
         aSdw==
X-Gm-Message-State: AC+VfDyu2xzCwxJq3Sy4P0+lmA66H7LY7nWUYY4ip6zDAByHqa1yxWLe
        eyWkd1oXnzztTNdxu/rhxJ90CK3f5Cw=
X-Google-Smtp-Source: ACHHUZ5aZpjpSEtOKIcbTQA75ccVQosteTxhS1eLoV0eicBc6jySpYbUHaYZwWqW3CM3PaZ2H4fcaw==
X-Received: by 2002:a17:90a:7ace:b0:24d:f159:d28b with SMTP id b14-20020a17090a7ace00b0024df159d28bmr1135915pjl.47.1685083869531;
        Thu, 25 May 2023 23:51:09 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id o2-20020a17090ad20200b002535a0f2028sm3917727pju.51.2023.05.25.23.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 23:51:09 -0700 (PDT)
Date:   Fri, 26 May 2023 14:51:04 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [BUG] gpiolib: cdev: can't read RELEASED event for last line
Message-ID: <ZHBW2H0nbnoFh+gC@sol>
References: <ZG7RgGasxXz4/pwl@sol>
 <ZG8Jpjq/N97plOGe@sol>
 <ZG8SRE9QzBYRspCO@sol>
 <ZG9g1N1Jbm0aB4ST@sol>
 <ZHABMhDmcLY78EB+@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHABMhDmcLY78EB+@sol>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 26, 2023 at 08:45:38AM +0800, Kent Gibson wrote:
> On Thu, May 25, 2023 at 09:21:24PM +0800, Kent Gibson wrote:
> > On Thu, May 25, 2023 at 03:46:12PM +0800, Kent Gibson wrote:
> > > On Thu, May 25, 2023 at 03:09:26PM +0800, Kent Gibson wrote:
> > > > On Thu, May 25, 2023 at 11:09:52AM +0800, Kent Gibson wrote:
> > > > > Hi Bart,
> > > > > 
> > > > I can also confirm that receiving the event using a blocking read() on the
> > > > fd still works, it is a poll() on the fd followed by a read() that fails.
> > > > 
> > > 
> > > Hmmm, so it occurred to me that gpionotify does the poll()/read(), so it
> > > should exhibit the bug.  But no, it doesn't.
> > > 
> > > So it could be my code doing something boneheaded??
> > > Or there is some other variable at play.
> > > I'll try to write a test for it with libgpiod and see I can reproduce
> > > it.  But I might put it on the back burner - this one isn't terribly
> > > high priority.
> > > 
> > 
> > Bisect result:
> > 
> > [bdbbae241a04f387ba910b8609f95fad5f1470c7] gpiolib: protect the GPIO device against being dropped while in use by user-space
> > 
> > So, the semaphores patch.
> > The Rust test gets the timings right to hit a race/order of events issue?
> > 
> 
> Well that throws some new light on the problem.
> One of the differentiators of the Rust test from the other ways I was
> trying to reproduce the problem is that the Rust test is multithreaded.
> 
> This being semaphore related makes other weirdness I was seeing make
> sense.
> The original form of that test was locking up when the bg thread
> released the line.  The drop never returned and the fg thread never
> received a RELEASED event.  That wasn't a problem with the drop, or an
> event being lost, as I assumed, that was a DEADLOCK.
> 
> The current form of the test uses message passing to coordinate the
> threads, so that deadlock condition doesn't occur any more.
> (That change was because of my concern that the lack of buffering of info
> changed events in the kernel could result in lost events - and the goal of
> the test was to test my iterator, not the kernel...)
> 
> I'll revert that test case to see if I can reproduce the deadlock case.
> 
> But it looks like those semaphores have problems. At least one path
> might lead to deadlock and another leads to an inconsistent state.
> 

I have failed to reproduce the deadlock case, which is good news, I
guess.  Not sure what the issue was then, but not seeing it now.
I dealing with kernel crashes at the time, so perhaps my kernel was
in a weird state?

Anyway, I've split the problem ENODEV test case out into a new repo[1]
so it is easier to play with.  In the longer term the idea is to create a
regression test suite for the uAPI.

You can run the tests by checking out the repo and calling "cargo test".

At the moment there are two tests in there - the enodev, and the
"deadlock" (well the test that was hanging on me, but now isn't).
The deadlock test is just for reference.

I've reduced the enodev case as much as I can to try to identify the
root cause.

It could be related to the event queue somehow, as it passes if it
doesn't wait for the bg thread to complete and reads the events as they
arrive.  So the two threads do not run concurrently when it fails.

It also passes if the request/drop is performed in the same thread.
So it requires the bg thread.

Not sure if that helps any, but that is where I'm at - still puzzled.

Cheers,
Kent.

[1]https://github.com/warthog618/gurt-rs
