Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA258711B87
	for <lists+linux-gpio@lfdr.de>; Fri, 26 May 2023 02:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbjEZApy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 May 2023 20:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbjEZApx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2023 20:45:53 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B73CE1A2
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 17:45:43 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-52cb78647ecso116080a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 17:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685061943; x=1687653943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lVFdy/HZ1zoO5L3KSOm46Dm3YsfVbeFz/pGAcTvo22k=;
        b=f4u2UMX8B3PXIc3Er1V/EVaksbbvcEiMqXNtijI6wbIZisTbGXKwqA632d1iQYc16z
         NvBraOA8WOifaTv0qzDOHzBwh9j5dd0vuURO6x9Fz43aThttYjWbGKhJBzwazmDcg0th
         9lJ+uSn21kt/Ej8MmMd1qdrr8TZFAsNXQeTKtcsvP4pe/JJhLM5u7OoA1aioKVmRJPK6
         G2vYA8VZvlLcOiQiNbs2jzKDbsAmzv/KFtgwrdyCzBDKugEIGpG7YtT8ByOBbi4MR0Y2
         EBflRX5fJR4312Y6NjSbApeKUoYc4595NzHR99Qj49LCZlyGU+Y2lQHeFHg9tyMseUEy
         ULXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685061943; x=1687653943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVFdy/HZ1zoO5L3KSOm46Dm3YsfVbeFz/pGAcTvo22k=;
        b=lU/H3os+0XsqXl46KzleMUq3r+ROzs1Lj+GUShKlAfRCduI/w28JYeSENOhFAJWbBx
         YFa6LbgMOv/247nA/W+wj76jvHBCeQXTkvfozVdaFFEzPS8zQOsmzdPVygVPkkMr+QTk
         RskEvzrvN083ZIJ30T6mrbtIV5mG9rWEbafIcsiLIDDt5yj8+wFrWt2P55/YB29g1DSZ
         eRMQyffKWP5TZO+M+JJTO4Ne8EoMIh1LE8eL1k2FLi/E5h99P/yPPjOoa7swCJCLbGZH
         zDebGAxGGoRZA2hWwVmRLbsn4i9T7ozWYy2EfEFYZhVcHsC+bO3tvRrSg+VoDocBZiFf
         Kkeg==
X-Gm-Message-State: AC+VfDwG5UlvYqCjBeXE+OCO+zZSltkolOtrA/s8MW2Tmd7r44NHFF2b
        Nbjqhi2OWuV8TT2rAdsUk9EGjYZ6QZw=
X-Google-Smtp-Source: ACHHUZ7P5BaYHwxWf/wsWr/5HJTAwDsvEJv0oCMnfTXIpLEiXNoK9V74WqAxWpqebZav+Y8hFBTuxg==
X-Received: by 2002:a17:903:453:b0:1af:c1af:8d83 with SMTP id iw19-20020a170903045300b001afc1af8d83mr466604plb.45.1685061943119;
        Thu, 25 May 2023 17:45:43 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id l21-20020a170902d35500b001ae365072ccsm1963638plk.122.2023.05.25.17.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 17:45:42 -0700 (PDT)
Date:   Fri, 26 May 2023 08:45:38 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     brgl@bgdev.pl
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [BUG] gpiolib: cdev: can't read RELEASED event for last line
Message-ID: <ZHABMhDmcLY78EB+@sol>
References: <ZG7RgGasxXz4/pwl@sol>
 <ZG8Jpjq/N97plOGe@sol>
 <ZG8SRE9QzBYRspCO@sol>
 <ZG9g1N1Jbm0aB4ST@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZG9g1N1Jbm0aB4ST@sol>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 25, 2023 at 09:21:24PM +0800, Kent Gibson wrote:
> On Thu, May 25, 2023 at 03:46:12PM +0800, Kent Gibson wrote:
> > On Thu, May 25, 2023 at 03:09:26PM +0800, Kent Gibson wrote:
> > > On Thu, May 25, 2023 at 11:09:52AM +0800, Kent Gibson wrote:
> > > > Hi Bart,
> > > > 
> > > I can also confirm that receiving the event using a blocking read() on the
> > > fd still works, it is a poll() on the fd followed by a read() that fails.
> > > 
> > 
> > Hmmm, so it occurred to me that gpionotify does the poll()/read(), so it
> > should exhibit the bug.  But no, it doesn't.
> > 
> > So it could be my code doing something boneheaded??
> > Or there is some other variable at play.
> > I'll try to write a test for it with libgpiod and see I can reproduce
> > it.  But I might put it on the back burner - this one isn't terribly
> > high priority.
> > 
> 
> Bisect result:
> 
> [bdbbae241a04f387ba910b8609f95fad5f1470c7] gpiolib: protect the GPIO device against being dropped while in use by user-space
> 
> So, the semaphores patch.
> The Rust test gets the timings right to hit a race/order of events issue?
> 

Well that throws some new light on the problem.
One of the differentiators of the Rust test from the other ways I was
trying to reproduce the problem is that the Rust test is multithreaded.

This being semaphore related makes other weirdness I was seeing make
sense.
The original form of that test was locking up when the bg thread
released the line.  The drop never returned and the fg thread never
received a RELEASED event.  That wasn't a problem with the drop, or an
event being lost, as I assumed, that was a DEADLOCK.

The current form of the test uses message passing to coordinate the
threads, so that deadlock condition doesn't occur any more.
(That change was because of my concern that the lack of buffering of info
changed events in the kernel could result in lost events - and the goal of
the test was to test my iterator, not the kernel...)

I'll revert that test case to see if I can reproduce the deadlock case.

But it looks like those semaphores have problems. At least one path
might lead to deadlock and another leads to an inconsistent state.

Cheers,
Kent.
