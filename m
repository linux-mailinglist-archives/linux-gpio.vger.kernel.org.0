Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8FC3248AED
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 18:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgHRQBj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Aug 2020 12:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgHRQBZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Aug 2020 12:01:25 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F4AC061389
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2020 09:01:25 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id g19so21666555ioh.8
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2020 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Gym2tejdb0g4aQXNlLsZJh+UArq4iQEZDcjWdT1yRs=;
        b=u15Wkw77yW7R43+sMA5Mo2P9C8/9OmXOeReZUq+JKqSOaFllTsYjMEZMCIKd86cX1M
         1FO/fa6bYI2CZQbpT9AaW4YeEo1HTS/op0ecwy2AV+RYo1JmXBM7ZhQxpodomtzuAXBO
         PqELKcSPsk6M/Q6jxAuf/PsaSBYnpGXsYSgzEj5pvg3ZMz9J1D+3mcyScc1CsofmmGWg
         T0/nAcmk6C2N7XyhrhbdEKtrva5hiAVhISJgLIpAc/CH5W+8cf/3LHhq4nf92eY18Dvz
         kFW275EL8mbbwJ+P2djiED/4sWPg2+hnD+LqGD0lq0IPcTgmk3xr3GV98V2vC2+3Loui
         dVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Gym2tejdb0g4aQXNlLsZJh+UArq4iQEZDcjWdT1yRs=;
        b=bIwodKChmv7Cj2VBdtT8ZjA00pEVlPX57Gqb1BlDEvIhoXUQy7wkraktHOYhPKXW3b
         O004qApUPTsHDe7yEHVkJXLLAh1Cr2LrjzGpQ+IKPW8nPC7mC//fZcz+GkdZz2AuZNGs
         DwUBzUAphpYYm19E8C78su8lIG9Ks5xpjkD4qgUvI3kObFl8IxQHVkj6NVuER8WBw+nq
         TnDTtAEr89qiACP/Wh4F0v5Za0rqE0D/gYqpV51riO5tfvLeTyKfkyPnarFmro89k4Kx
         loMSjgS4Ok8xmmAGG/F675mm72Bzjj940KLmd1RhjNY6oqwSrolALRNv4FUVoFbk1PeA
         V+3w==
X-Gm-Message-State: AOAM533BQCQmxl8Ypbuu1C8Iscqx6QdWY+X5sBtpweBzSAOg2ljsi1OR
        Ft+B1CWVBZTzVDsdmJjjWH4FeWiM6YBTAMKuaUuFIw==
X-Google-Smtp-Source: ABdhPJy1MVC55cCyOwzu6KKBvz8y8svMheQL/j5cQn1Lr6rTp03Bo1H3TEca8ZwAQgjeIiHQG0bYbKcwXRFV1cye0vc=
X-Received: by 2002:a6b:3807:: with SMTP id f7mr14814320ioa.131.1597766484440;
 Tue, 18 Aug 2020 09:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200608090652.805516-1-gary.bisson@boundarydevices.com>
 <20200608090652.805516-4-gary.bisson@boundarydevices.com> <CAMRc=MdaMKEW2n32eYD7q1R6V4GWGakk2xmUWmejncLD-x+pYQ@mail.gmail.com>
 <20200817083835.GB91176@p1g2> <CAMRc=Mf=vE5_10Z4iOu=pn3vUuLiuD=V8o9kU3H7j4WT9L2N=w@mail.gmail.com>
In-Reply-To: <CAMRc=Mf=vE5_10Z4iOu=pn3vUuLiuD=V8o9kU3H7j4WT9L2N=w@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 18 Aug 2020 18:01:13 +0200
Message-ID: <CAMRc=MecqRb-=qeudU2=fMGi3yujuz5qYDruni6+fv8EALu_ig@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 3/3] Android.bp: initial addition
To:     Gary Bisson <gary.bisson@boundarydevices.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 17, 2020 at 6:24 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>

[snip]

> > >
> > > I don't know Android very well but if its build system can launch
> > > autotools, then maybe you could autotoolify this file by providing
> > > Android.bp.in and letting autotools expand this macro?
> >
> > No unfortunately that is not how the AOSP build system works (or at
> > least I'm not aware of it).
> > AFAIK all the open-source projects used in AOSP (see external/ folder)
> > have a separate Android.bp alongside the autotools files.
> >
> > Here are a few examples of Android.bp files added by Google to
> > well-known projects:
> > - curl [1]
> > - iputils [2]
> > - strace [3]
> >
> > In the case above it is up to Google to maintain that file as only
> > hosted on their servers (not merged upstream).
> > But some other projects are ok merging it which makes it easier (at
> > least for me) like can-utils [4].
> >
>
> I'm perfectly fine with merging this file but I don't like having
> another place to look at when bumping the version number. I bunched up
> all API and ABI versions together in configure.ac in order to not
> forget anything when making new releases.
>
> I'm sure Android's build system is not as limited as not to allow to
> run some external scripts that would at least fetch the current
> version from configure.ac, is it?
>

Can you do something like this[1] but make the command fetch the
version string from configure.ac?

Bartosz

[1] http://androidxref.com/9.0.0_r3/xref/external/libmojo/Android.bp#67

[snip]
