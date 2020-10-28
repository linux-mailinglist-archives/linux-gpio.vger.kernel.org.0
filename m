Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8089B29DA09
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 00:10:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgJ1XKl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 19:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgJ1XJO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 19:09:14 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE595C0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:09:14 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id k27so1306607oij.11
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eO5/7xkBvWcjhyzUNXxsrcjlaFar4NsGB67kKk6LzIc=;
        b=c6rW1Nk/e05q15RGsNxt2gfZl4juqQyk5Wd/I4youa2Iuxht1QTbGRnkPpXYyONabh
         OZHATEcRXCNhke5525JYhyTVOKWdX4y2YrXPXLf8P6jbvVfzERc9pQ3OPubYBbkLawgx
         zvI/wzKgpChD0cesNG4M+BlJEb3HoYapJE6JKm/lty/Yi5kCdcxk4pfcmaXuCPXSo5AU
         O52J45ZjfLZoJzePzIfi1N1caDNB5qSLrIkL/mygHsw1c3OvrW7TC1gCSxCoPKS4WFHo
         b32qLOeFlhsd0dir0BwEpdaP7JHo9VjN0wdiETSCGn+g24RdpVqHtexQxVYjK+fw7gsy
         yOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eO5/7xkBvWcjhyzUNXxsrcjlaFar4NsGB67kKk6LzIc=;
        b=RLtvqk3JQzy6W3qLRw+tjiwNminY9bMMSncARVlW3/j+PBD2VlW1VjfvRy+eBR8jj9
         c5JHPdNrWr2RfmZdGs4/8l5ohHtG6xeF9Edp5RVG2xwaarOjZDdg6S+4CZqi62/NwD2k
         qvmy0NYJfLmp50Pje4cJDv7PrUUW67viRgsrZwK2aXJAY0tP/Ndbv5jph0jbWOcLeSZJ
         hzC6he9MYLCax3lhDB9g80mVMxYEJgqYCPItxVT2c1Rj3aik2/HeeVTRtIymawrIVxeX
         rgvOkUlGjdjvYsOjxvN0dnAdIRnPQ6qB0v3c690Feu9guHiY3lmRQUelqNJdd8IlbXvO
         b2Pw==
X-Gm-Message-State: AOAM530WcoOHxJRZXUxag7bT2359HQUohLy/EFk2wVpuzrILYfzqIkMd
        CsW8aLq//buPlJV1t9KyPMwQUIARInNCCg==
X-Google-Smtp-Source: ABdhPJw3feslZwJPQKwguaTgvXPJRhE8TARfxwSrbgZDi00q3siaDbbgRdeGVLIOod3fJLzrF1MIPg==
X-Received: by 2002:a17:90a:498d:: with SMTP id d13mr7455363pjh.100.1603897409211;
        Wed, 28 Oct 2020 08:03:29 -0700 (PDT)
Received: from sol (106-69-179-84.dyn.iinet.net.au. [106.69.179.84])
        by smtp.gmail.com with ESMTPSA id o15sm6956211pfp.91.2020.10.28.08.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 08:03:28 -0700 (PDT)
Date:   Wed, 28 Oct 2020 23:03:22 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2] treewide: rework struct gpiod_line_bulk
Message-ID: <20201028150322.GA221014@sol>
References: <20201027091715.8958-1-brgl@bgdev.pl>
 <20201028093928.GA152368@sol>
 <CAMRc=MeyFR450u7=LUhGNqs7jKv0PAduUAHvM-um2SjfEMRQOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeyFR450u7=LUhGNqs7jKv0PAduUAHvM-um2SjfEMRQOw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 02:19:05PM +0100, Bartosz Golaszewski wrote:
> On Wed, Oct 28, 2020 at 10:39 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Oct 27, 2020 at 10:17:15AM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> >
> > Subject should be prefixed with [libgpiod] according to the README ;).
> >
> 
> Oh come on! :)
> 
> [snip]
> 
> >
> > If you replace the gpiod_line_bulk_iter_foreach_line() here with
> > manually looping over the bulk lines then everything from A to B above
> > can be dropped.
> >
> 
> Something is telling me that dedicated iterators are more elegant. But
> I guess we can do everything manually for now and see about that
> later. Fair enough, I'll drop it.
> 

Good thing I'm here to let you know that little voice is wrong :).

I've got a couple of commits in my working tree[1] that apply to your
patch and drop the iters as I've suggested if you'd like to compare.

Cheers,
Kent.

[1] https://github.com/warthog618/libgpiod/commits/for-v2
