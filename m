Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9522D4773
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 18:06:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732422AbgLIRGC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 12:06:02 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45921 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731142AbgLIRGB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 12:06:01 -0500
Received: by mail-wr1-f65.google.com with SMTP id t4so2532647wrr.12;
        Wed, 09 Dec 2020 09:05:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BkEMdzQBnRw5kKsCrRgdUmxrosH4dCM9KyrzBWJ3NbQ=;
        b=ek6YbDAO/Y+4/0fzbiYz9czrgeiJcaMNZCJfT1sqISPmN1KXyTxJzjWhk9MRAjH9ra
         +lRdDJXiYOfABb3lRO5KjtkecKZRbpagsuDvaXdbca5H+FRPmrVeU1aFvTXTiOeVg4mL
         jI9AfsW3Rw+3A6EBdEUYExOprVyIN15ZLbQax2nH5sOsWJ1dOP6q9ph4eE2Fo4M4svZ6
         +ZCP6jUeh8bFbOUaMiLgvHjEeqgON8OtVjNIlWPH+FUuM8qugAoXF4IaB0qO989C8y3P
         ZsTip3xLYeTDy1TRoIQZi/v8p8s7uJs2o2VtNDAsZAUUU67D6CYNotzPqwcPhWNRW2ch
         ST9w==
X-Gm-Message-State: AOAM533XeVYBvV4YZB+gC35iV+8DRezWM8YoUGGliP3iRVQJF5sOYfmL
        b1MnppsZJSSmPjJ7xpufdYtO4+Yok9lcJQ==
X-Google-Smtp-Source: ABdhPJyli6/IKkCQgN8kfI+ASYjJ3DS3gOV0parNRdmD7qpyqGi3Eu7JM5muZu7Gih5qzPiHORUXnw==
X-Received: by 2002:a05:651c:384:: with SMTP id e4mr1473588ljp.90.1607533518561;
        Wed, 09 Dec 2020 09:05:18 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id o19sm236178lfd.250.2020.12.09.09.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 09:05:17 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kn2uc-0006M6-LL; Wed, 09 Dec 2020 18:05:59 +0100
Date:   Wed, 9 Dec 2020 18:05:58 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>, Marc Zyngier <maz@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Subject: Re: [PATCH 3/4] USB: serial: ftdi_sio: Log the CBUS GPIO validity
Message-ID: <X9ED9k5gxIlQ0YJ/@localhost>
References: <20201204164739.781812-1-maz@kernel.org>
 <20201204164739.781812-4-maz@kernel.org>
 <X848LXNv3GRmmSXA@localhost>
 <02b461244a33d5eb0620cfaa13c2b03e@kernel.org>
 <X85IC5NvcWikXfZY@localhost>
 <CACRpkda+JJ9ZMmwPcA_Rc0tgqKQw+VTgfVyp8PsZG55VM82uzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkda+JJ9ZMmwPcA_Rc0tgqKQw+VTgfVyp8PsZG55VM82uzg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 09, 2020 at 10:35:53AM +0100, Linus Walleij wrote:
> On Mon, Dec 7, 2020 at 4:19 PM Johan Hovold <johan@kernel.org> wrote:
> > On Mon, Dec 07, 2020 at 03:00:37PM +0000, Marc Zyngier wrote:
> > > On 2020-12-07 14:29, Johan Hovold wrote:
> > > > On Fri, Dec 04, 2020 at 04:47:38PM +0000, Marc Zyngier wrote:
> >
> > > >> +  if (!bitmap_full(valid_mask, ngpios))
> > > >> +          dev_warn_once(&port->dev, "Consider using a tool such as ftx-prog
> > > >> to enable GPIOs if required\n");
> > > >> +
> > > >
> > > > And again, this is not something that belongs in the logs of just about
> > > > every system with an attached ftdi device.
> > >
> > > Fine by me, this patch can be dropped without issue. After all,
> > > I now know how to deal with these chips.
> > >
> > > > While not possible to combine with the valid_mask approach, this is
> > > > something which we could otherwise add to the request() callback for
> > > > the
> > > > first request that fails due to the mux configuration.
> > >
> > > That was Linus' initial suggestion. But I think a consistent user
> > > API is more important than free advise in the kernel log.
> >
> > I tend to agree. So since your valid-mask approach clearly has some
> > merit in that it marks the lines in use when using the new cdev
> > interface, perhaps we should stick with that.
> 
> It sounds like we agree that this patch sans prints is acceptable.
> 
> It makes things better so let's go with that.

Sounds good.

I'm about to apply patches 2, 3 and 4 with some smaller changes like
demoting the printk messages to KERN_DEBUG and dropping the ftx-progs
warning.

> The problem for the user is that the line looks to be
> "used by the kernel" (true in some sense) but they have no
> idea what to do about it and that the ftx-prog will solve
> their hacking problem.

Right, it's not ideal, but the datasheets for these devices clearly
states that the configuration of the CBUS pins is done in EEPROM and the
vendor provides some tool to do that. Then there's a bunch of open
source implementations for the same including ftx-progs (which can only
be used for a subset of these devices).

I'd be fine with a dev_err() on the first request that fails saying that
the CBUS pin is not configured for GPIO use (perhaps even on every
request if its not something that a non-root user can trigger). But we
cannot have both that and have the line marked in-use through the
chardev interface currently.

I'm admittedly a bit torn on which is preferable.

Johan
