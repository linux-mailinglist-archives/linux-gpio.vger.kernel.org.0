Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E9C2475A2
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Aug 2020 21:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732082AbgHQTZz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Aug 2020 15:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732084AbgHQTZn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2020 15:25:43 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC6AC061342
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2020 12:25:42 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id x69so16068945qkb.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2020 12:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/kXuaN4AISusMlSkk2TTILtf5athEb7HHTj/BXfUUMU=;
        b=sef5NOnEMc5nMqLQAehSTQDhfZ46QOtS1oW9CJlK4AXP5+gkrMhCAMBEtPbqvVzKr0
         yAjODdfU4JSnB5BKF062O+zy171oc4LMeifmp7mPMhAyJc0ylBp3d+TEKBmHRMxQari4
         szVpFMjye/T+BFept4uUfaYCo+Hmg44nsfyBxrIA8R3yloM0ejE6Q5JtCPSwvJ1b2aLC
         pKBFRTtOYokNbXXiKPv4yP5068Go4iUiwMTxXTcVmPoSZ5AfIi64/BdoMxmbFqHL3p5g
         NcX2J40IBF8QKAMIcwzICyWcRYeRQ8TqkrXYO9jpCKWw9Ap5euwpwVptWMJFxzge4ndT
         bzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/kXuaN4AISusMlSkk2TTILtf5athEb7HHTj/BXfUUMU=;
        b=qreYZ7LxhcOYJeui+y1BvFwwXybOHEnZiA0t0+1v3wSeh5g6YrnXptH2ijjFKjIJMI
         +xyy9A4PW6VtjclSMBime/UCJvJ67ELghL+kkvNoH8B8Pbiifq0TO7A2JZ4L5FNXVr90
         jDcnfI2FyBHnJm+q1z5uINTz4Snd5PNe3vMFtvddD5NxnUCfP/d4I1X5ASLr7s18VsWo
         /m38GaNIxzva9fhkxJqlF/DUaJHJTCUTh4w1PRvrDhF63oq0OPBNN2AsaRJvbRbvPxVO
         wHLlDb2ya+EF4nODvipKHF6WKRbB3U3n73AdFD6OzvRh9A4z020cbh8CYG+MkfBSadn6
         lofA==
X-Gm-Message-State: AOAM5305LW2OTO8hWfNfx52OrpZ8CZFpgsDXC4o+lkDsDRF4yZcGWSkr
        00EzDnFcKdOHuYgW73IqGDB2UzdsQPrsOakkrYZ27w==
X-Google-Smtp-Source: ABdhPJx655WoWSZf8sKCtbQuqerBJWhb5d5rkooksrvYXLljTd0tdKuq/bKTr3OTKpoHtxRX1s5CYeo/ddHv+O/tjjo=
X-Received: by 2002:a37:a495:: with SMTP id n143mr14451570qke.330.1597692341063;
 Mon, 17 Aug 2020 12:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200814030257.135463-1-warthog618@gmail.com> <CAMpxmJUCwXVv6U9sE=8isRMoNd8QvM9XLu4PU2Rr454wt_FTUw@mail.gmail.com>
 <20200817184018.GV1891694@smile.fi.intel.com>
In-Reply-To: <20200817184018.GV1891694@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 17 Aug 2020 21:25:30 +0200
Message-ID: <CAMpxmJV6k=mQaYsH_abTHhyXis+hLJkJX+M9jAtciUB=0uoEUA@mail.gmail.com>
Subject: Re: [PATCH v4 00/20] gpio: cdev: add uAPI v2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 17, 2020 at 8:40 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Aug 17, 2020 at 08:24:24PM +0200, Bartosz Golaszewski wrote:
> > On Fri, Aug 14, 2020 at 5:03 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > This patchset defines and implements adds a new version of the
> > > GPIO CDEV uAPI to address existing 32/64-bit alignment issues, add
> > > support for debounce, event sequence numbers, and allowing for requested
> > > lines with different configurations.
> > > It provides some future proofing by adding optional configuration fields
> > > and padding reserved for future use.
> > >
> > > The series can be partitioned into two sets; the first eleven
> > > contain the v2 uAPI implementation, and the final seven port
> > > the GPIO tools to the v2 uAPI and extend them to use new uAPI features.
> > >
> > > The more complicated patches include their own commentary where
> > > appropriate.
>
> > The series looks quite good to me and I think we're on track to get it
> > in for v5.10. I'd love to have Andy (Cc'd) take a look as well. There
> > are some nits here and there but as long as we get the ABI right, any
> > implementation details can be ironed out later.
> >
> > I need to think about some details a bit more but I really like the
> > current state of the patches.
>
> First of all, I apologize for being silent, I'm quite busy with internal
> development / work.
>
> Second, I didn't hear further why we can't fix current ABI as proposed by Arnd
> and see what we will have afterwards?
>

Sure we can get back to fixing it but it will only address a single
bug and still not allow us to add new features and simplifications. Do
you mind rebasing your old patch on top of v5.9-rc1?

> Third, I'm not satisfied with the approach of wasting some memory for padding
> and I think the proper solution for the ABI is to have versioning inside the
> structures.
>
> What do you think?
>

Wasting a bit of memory is fine with me. As long as we're not copying
more than a page-worth of memory between the kernel and user-space,
the overhead is insignificant.

I prefer to make structs extensible over adding new versions in the future.

Bart
