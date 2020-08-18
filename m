Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3580D248B04
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 18:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgHRQFN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 12:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbgHRQFI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Aug 2020 12:05:08 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9D6C061389
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2020 09:05:07 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g75so17494977wme.4
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2020 09:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W/8sYK684byzC/uZpWkZoY3vxqoNkYnZ1gKikb2pJzI=;
        b=e21fLYDtTD0Wfzxwvj6chqG1zrSMf590PeDokumjzeobHhIb/YSuD0nStpTckm4lQK
         iTHJrzv72cuIRir9N15tFKcBx8xFL2sZc+55GU9uUU1Dcih8Wn5+jHjkNXeZBlYCj7gk
         Ml5B2QTpcht9dVMfnjYCwvcfoVRg5NCOGf0sT0zpAnG9pOJ65MqKwswLS6Fz7YzKLdU3
         s4BI44JJOMYVzfi1uLxEGMxBHNsPRGoLlTtGAljFcuxKrSwNoz5rgjgwVhuDKHNeSgBw
         XSV1OPJhPE+hpXxNQ71FEdNIV2GfBR1jXzoHijI1W992UqSTYAw+satAbP3tlHk1F4vF
         1K2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W/8sYK684byzC/uZpWkZoY3vxqoNkYnZ1gKikb2pJzI=;
        b=J52YVCxtjU8y87UAA1rTVZIbHliMwTFumL3Hx2bbaeaPBMCQNhTQYZDiKrRwN8QWG+
         X+UiWSnijVg6DFAtJ0LXS6JcEx46h5Hi5nLG3i3QMNwS0avMWDGvTSj5BAuFgJ+9F21g
         rfZe7xGNyKrgFkykDNUnfi4MnoHlHKKZ8mwzAiBLJ/G/8OuwABFe38EXSLDCBSaMz8j6
         nCQiCgHGodjviCkRcJ6SyBY8f+crb2ES5fDPHm+BlJcdC0068Y5doiWv5y6iUk8IUxKX
         QkXgP7ur4d8rZL/FotnKANLiC1nr7FaltcJPvL3pB4dBgvGK/l2USGT7dbQU4uDZIrVo
         tUMw==
X-Gm-Message-State: AOAM530m8Zk0WyoiTO8oAiftje+aBWbjsrSq8KJKcwRpdcLGHvx/spun
        B3yGoSXCWwhs2J8gpxKZYgAvsD/4GJNKDQ==
X-Google-Smtp-Source: ABdhPJwG1McYK0VPfZj3Y4wpQkJs8KZK6pEhPQBtI/ig82+hDjJsExpkTnymrhqL7vfdshi0zmBxgA==
X-Received: by 2002:a1c:f605:: with SMTP id w5mr603576wmc.26.1597766705629;
        Tue, 18 Aug 2020 09:05:05 -0700 (PDT)
Received: from p1g2 (2a01cb000f8e270038fe4c27b4fe9348.ipv6.abo.wanadoo.fr. [2a01:cb00:f8e:2700:38fe:4c27:b4fe:9348])
        by smtp.gmail.com with ESMTPSA id a10sm37825035wrh.36.2020.08.18.09.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 09:05:05 -0700 (PDT)
Date:   Tue, 18 Aug 2020 18:05:03 +0200
From:   Gary Bisson <gary.bisson@boundarydevices.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 3/3] Android.bp: initial addition
Message-ID: <20200818160503.GB500735@p1g2>
References: <20200608090652.805516-1-gary.bisson@boundarydevices.com>
 <20200608090652.805516-4-gary.bisson@boundarydevices.com>
 <CAMRc=MdaMKEW2n32eYD7q1R6V4GWGakk2xmUWmejncLD-x+pYQ@mail.gmail.com>
 <20200817083835.GB91176@p1g2>
 <CAMRc=Mf=vE5_10Z4iOu=pn3vUuLiuD=V8o9kU3H7j4WT9L2N=w@mail.gmail.com>
 <CAMRc=MecqRb-=qeudU2=fMGi3yujuz5qYDruni6+fv8EALu_ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MecqRb-=qeudU2=fMGi3yujuz5qYDruni6+fv8EALu_ig@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On Tue, Aug 18, 2020 at 06:01:13PM +0200, Bartosz Golaszewski wrote:
> On Mon, Aug 17, 2020 at 6:24 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> 
> [snip]
> 
> > > >
> > > > I don't know Android very well but if its build system can launch
> > > > autotools, then maybe you could autotoolify this file by providing
> > > > Android.bp.in and letting autotools expand this macro?
> > >
> > > No unfortunately that is not how the AOSP build system works (or at
> > > least I'm not aware of it).
> > > AFAIK all the open-source projects used in AOSP (see external/ folder)
> > > have a separate Android.bp alongside the autotools files.
> > >
> > > Here are a few examples of Android.bp files added by Google to
> > > well-known projects:
> > > - curl [1]
> > > - iputils [2]
> > > - strace [3]
> > >
> > > In the case above it is up to Google to maintain that file as only
> > > hosted on their servers (not merged upstream).
> > > But some other projects are ok merging it which makes it easier (at
> > > least for me) like can-utils [4].
> > >
> >
> > I'm perfectly fine with merging this file but I don't like having
> > another place to look at when bumping the version number. I bunched up
> > all API and ABI versions together in configure.ac in order to not
> > forget anything when making new releases.
> >
> > I'm sure Android's build system is not as limited as not to allow to
> > run some external scripts that would at least fetch the current
> > version from configure.ac, is it?
> >
> 
> Can you do something like this[1] but make the command fetch the
> version string from configure.ac?
> 
> Bartosz
> 
> [1] http://androidxref.com/9.0.0_r3/xref/external/libmojo/Android.bp#67

Yes I'll try to come up with something that get the version from
configure.ac. Same as the other patch, might be only next week.

Thanks,
Gary
