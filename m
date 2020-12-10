Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D80D62D55DE
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 09:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388523AbgLJIzi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 03:55:38 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41777 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388471AbgLJIxr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 03:53:47 -0500
Received: by mail-lf1-f67.google.com with SMTP id r24so7065578lfm.8;
        Thu, 10 Dec 2020 00:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bOy3TnVkZfD/QJ6W6TH3cGOKY7t0Nb1QFNap39CXdx8=;
        b=tEQ6gqGcO8POrI5aGd15cYHeke6OIfxSsARKgN2PWus3DD76ugWcwk5iP4kS4e9L4a
         4GihTfeHUjkWfFDJAjLbXZMIFVJCCFHsoOCpDEp9saMQpiyvyAvjDa8yPKxn9VusB3Vt
         KVYwYxmhIbkE9bUYxETMrVjAzuy6ueGAGys3uEIfWwGA0oe85hlxOSZVza1PwUz7q1xF
         TGz13r0gC2IFxyKXObUugQ4wXy7V8d9dapEJ90v1Z5AkkY0fVgbTl/tAS3z7ap6S9cTW
         tO6ViahR4ipsKqd2DLBeQejU/Q3yCW8za7cuP/cqlhuu3Dd1xjfoaXlRd0+mKym3yMwl
         1dZw==
X-Gm-Message-State: AOAM531U0KC8ew3AKE/ezR+NorzuroTH0ix76DDx+PcEC4uZkbDMawld
        nwBqCQeLEHT4UieZFB1rtMwOdPHm8cvpXA==
X-Google-Smtp-Source: ABdhPJwOk/2gC90gugGCGIxW7Gp9pcvUXF8bZEHIG/K5ILxkbIMPEdC7vX7u8feZ1iAQMVTOGuzbKw==
X-Received: by 2002:ac2:42cf:: with SMTP id n15mr2161158lfl.461.1607590385182;
        Thu, 10 Dec 2020 00:53:05 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id v25sm444803lfg.88.2020.12.10.00.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 00:53:04 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1knHhp-00083Q-1k; Thu, 10 Dec 2020 09:53:45 +0100
Date:   Thu, 10 Dec 2020 09:53:45 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
Message-ID: <X9HiGaIzk4UaZG7i@localhost>
References: <20201122170822.21715-1-mani@kernel.org>
 <20201122170822.21715-3-mani@kernel.org>
 <CACRpkdbY-aZB1BAD=JkZAHA+OQvpH12AD3tLAp6Nf1hwr74s9A@mail.gmail.com>
 <X8ZmfbQp7/BGgxec@localhost>
 <CACRpkdZJdxqxUEQaKUHctHRSQAUpYZJtuxonwVd_ZFAsLBbKrA@mail.gmail.com>
 <X89OOUOG0x0SSxXA@localhost>
 <CACRpkdavm7GG8HdV1xk0W_b1EzUmvF0kKAGnp0u6t42NAWa9iA@mail.gmail.com>
 <X9DsWahl6UDwZwBn@localhost>
 <CACRpkdYm-j9QcK8hgNrC33KruWE17Q0F4+T=UanE7PCEZEtu6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYm-j9QcK8hgNrC33KruWE17Q0F4+T=UanE7PCEZEtu6w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 09, 2020 at 05:25:32PM +0100, Linus Walleij wrote:
> On Wed, Dec 9, 2020 at 4:24 PM Johan Hovold <johan@kernel.org> wrote:
> > On Tue, Dec 08, 2020 at 01:41:52PM +0100, Linus Walleij wrote:
> 
> > > depends on !GPIO_SYSFS
> > >
> > > so it can't even be compiled in if someone is using the sysfs.
> > >
> > > That should solve the situation where people are (ab)using
> > > the sysfs and getting name collisions as a result.
> >
> > Would it possible to set a flag to suppress just the sysfs entry
> > renaming instead?
> 
> Hm you mean that when a GPIO is "exported" in sysfs
> it should not get a symbolic name from the names but instead
> just the number?

Right.

> I bet someone has written their scripts to take advantage of
> the symbolic names so I suspect the task becomes bigger
> like suppress the sysfs entry renaming if and only if there is
> a namespace collision.
> 
> But I think we can do that, doesn't seem too hard?
> 
> I just hacked up this:
> https://lore.kernel.org/linux-gpio/20201209161821.92931-1-linus.walleij@linaro.org/T/#u

I just replied to that thread, but to summarize, you can't rely on
having the sysfs code detect collisions since that will trigger a bunch
of nasty warnings and backtraces. We also don't want the sysfs interface
for a specific USB device to depend on probe order (only the first one
plugged in gets to use the line names). And adding line names now could
in fact be what breaks currently working scripts.

> > Despite its flaws the sysfs interface is still very convenient and I'd
> > prefer not to disable it just because of the line names.
> 
> Would these conveniences be identical to those listed
> in my recent TODO entry?
> https://lore.kernel.org/linux-gpio/20201204083533.65830-1-linus.walleij@linaro.org/

Indeed.

> There are several other issues with the sysfs, so making it conflict
> with other drivers is almost  plus in the direction of discouragement
> from the GPIO submaintainer point of view, but I do see that
> people like it for the reasons in the TODO. :/
> 
> I am strongly encouraging any developer with a few spare cycles
> on their hands to go and implement the debugfs facility because
> we can make it so much better than the sysfs, easier and
> more convenient for testing etc.

Don't you run the risk of having people enable debugfs in production
systems now just so they can use the old-style interface?

Side note: if you skip the "export" part of the interface, how would you
indicate that a line is already in use or not available (e.g.
gpio-range-reserved)?

> > > Then it should be fine for any driver to provide a names array
> > > provided all the names are unique on that gpiochip.
> >
> > So it sounds like there's nothing preventing per-chip-unique names in
> > the rest of gpiolib and the new chardev interface then? Are the
> > user-space libraries able to cope with it, etc?
> 
> Yes the documentation refers to libgpiod a very well maintained
> library:
> https://www.kernel.org/doc/html/latest/driver-api/gpio/using-gpio.html
> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/

Just did a super quick check and it seems libgpiod still assumes a flat
name space. For example, gpiod_chip_find_line() returns only the first
line found that matches a name. Shouldn't be impossible to extend, but
just want to make sure this flat namespace assumption hasn't been to
heavily relied upon.

Johan
