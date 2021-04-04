Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B313538A2
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Apr 2021 17:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbhDDPgH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Apr 2021 11:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbhDDPgG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Apr 2021 11:36:06 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88948C061756
        for <linux-gpio@vger.kernel.org>; Sun,  4 Apr 2021 08:36:01 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso9294734oti.11
        for <linux-gpio@vger.kernel.org>; Sun, 04 Apr 2021 08:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n0eEdC7mBUiPPXya3Y9BVKMX6ZxRcKjPLkHh3VAAdW8=;
        b=zBqeczybKV8RqV5Cy3UbktilO0KErD9GaP+vaEiGPhy6/8mHWWBQRQGJJMBLLCC48W
         CkEERHRLvyw9pxw0/oVKWhK1cOxHQNNC+yuoW5LeyWQp7XmahSs1OnmYcYQQnvDJX58q
         qJFcI6uAwzS2TBPx1ul4UldzMbKtai518QcNcg+9Z3hFcJgn0DjnlafiodKJeAtGl5de
         wG+aNyG4Tf9nDn5AlXqZSNjo8VvBSM8eguHIKUfJ/Mc4QYwDKCKU9r3V7/WPrc/CzGd2
         65ieX0+LB1+LUUnY8i9mFL3ifbWkJ6etV/khv/JOP2fppkOVMw6OCZ3EQQcraGVR4/Zb
         dJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n0eEdC7mBUiPPXya3Y9BVKMX6ZxRcKjPLkHh3VAAdW8=;
        b=fjPtRM4C01mLB0n8SE9w72VmRvVBrAe3efmm7ewMZdpealH2T1qTQNpcxT8KNehCLS
         IpBv/sfhiAu9j6NzKYYVhLAW1R6iUd3767xgxpdrO+6L6XIKq0dIgpzgGiSmLdrFmRmt
         KZqdu+XrZ8jm1EQkTCRmNUKJkzDq6q67j3ZwsYZTIVdjv/bj32BVnIk+rYMEp0R5stgy
         jysI3HnGJmrlJ3D26z1LuncI9xCdfH0CXwyh58YDbkD9c55bNflz6ZlXkYcyVvirI9cX
         fMDv09DQAk9QtxEpJe6GYbrynNxH4hpdGZDZmlCu/Vh0GHz7vPnn6BxEBBZCvscUT3r/
         E8xQ==
X-Gm-Message-State: AOAM532yYAO3k7OlNmlwpUObv1kNfzda+ZO6H33SIsbAx5tYzM2WPJNv
        aXSP7G1xiwJzkcf/mFy4IGuCOrDGCXu/388nL5YtIw==
X-Google-Smtp-Source: ABdhPJyjJUZxAteXw+s90y95RB8uUUgg00sfyQwIYHW4c6rUxHkpk1KkDE1XwV5Dadf7s9MGnB/iKH8RYODu6+k89z0=
X-Received: by 2002:a9d:7854:: with SMTP id c20mr20118470otm.114.1617550560787;
 Sun, 04 Apr 2021 08:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210223195326.1355245-1-sandberg@mailfence.com>
 <20210223195326.1355245-2-sandberg@mailfence.com> <CAPgEAj5CZ1KxLEn3=GjKJTBFM8dTpC=NRGwLkN6wuw7VVv6YDw@mail.gmail.com>
 <1306564766.662706.1617546604089@ichabod.co-bxl>
In-Reply-To: <1306564766.662706.1617546604089@ichabod.co-bxl>
From:   Drew Fustini <drew@beagleboard.org>
Date:   Sun, 4 Apr 2021 08:35:49 -0700
Message-ID: <CAPgEAj4Zd9FWL1UFkBLbiJRadBhGqc+NWdrKCxaTXyVeO3tSxA@mail.gmail.com>
Subject: Re: [PATCH] gpio: driver for the NXP 74HC153 chip
To:     Mauri Sandberg <sandberg@mailfence.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Apr 4, 2021, 07:30 Mauri Sandberg <sandberg@mailfence.com> wrote:
>
> > ----------------------------------------
> > From: Drew Fustini <drew@beagleboard.org>
> > On Tue, Feb 23, 2021 at 11:56 AM Mauri Sandberg <sandberg@mailfence.com> wrote:
> > >
> > > Support for NXP 74HC153 Dual 4-input Multiplexer. This provides a GPIO
> > > interface supporting input mode only
> >
> > I would like to try this out.   This seems like a commodity part so I
> > looked for it in a DIP package.  I only see that from TI in the
> > SN74HC153N.  Do you anticipate a different vendor being a problem?
>
> Oh I am so sorry you guys had to see this. This is based on something I found and assumed to be up to
> standards and thought of trying to upstream it with modifications to device tree functionality only. Soon
> afterwards I realised its shortcomings in the GPIO api department and being too specific and sent a proposal
> what's now known as 'gpio-mux-input'. No further efforts should be put into this.
>
> I do not know how to withdraw a patch. Also, maybe I should have used the same thread with v2 instead
> of sending a new patch with new title.

No problem, I should not have replied to this old email, I had just
searched for the mention of the IC.

Do you think TI SN74HC153N should be ok for testing the gpio input
multiplexer patch [1]?

Thanks,
Drew

[1] https://lore.kernel.org/linux-gpio/20210325122832.119147-1-sandberg@mailfence.com/
