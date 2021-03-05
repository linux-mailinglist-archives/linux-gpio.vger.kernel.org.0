Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F73A32E63D
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 11:25:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhCEKY3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 05:24:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:53148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229653AbhCEKYW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Mar 2021 05:24:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5400264F60;
        Fri,  5 Mar 2021 10:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614939862;
        bh=PCjZwGuPtDOERTWm9atWeueaPz+VUz9TVRiY7Wp08Dg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EUZPPaY8/R5c81/HQ+m3iptQLi8dqYaCdrEW5Yuz93V/ipep9LDQjcaRx5AT2dCTT
         s0tGyxJlVzYUu33EMKu0lAYrZtdPxCA6oU8gH5l9MtCcIcJWObEfNAhM0U+77UU36D
         GfgiY+zf8NgkSvMhGBi5wEHtNOJeGrbLm6ta8r0g=
Date:   Fri, 5 Mar 2021 11:24:18 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>, Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 08/12] drivers: export device_is_bound()
Message-ID: <YEIG0u8Vg3e6ZBhz@kroah.com>
References: <20210304102452.21726-1-brgl@bgdev.pl>
 <20210304102452.21726-9-brgl@bgdev.pl>
 <CAMuHMdXRK5=w1-Z=EbM60Sf2bLY1EiVaxbZjMP+XyQ3g7nBpZw@mail.gmail.com>
 <YEHs3CxWnusWklME@kroah.com>
 <CAMRc=MddDb+nakgEM+Xeqm=rMMkkWO2EDekD36EoPJashYP88w@mail.gmail.com>
 <YEHyDUQ3V7Pl6+TU@kroah.com>
 <CAMRc=Md7FeQAd4Syh685+jyZAq2QStBNoo0ACQxrSB=4N6d3dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Md7FeQAd4Syh685+jyZAq2QStBNoo0ACQxrSB=4N6d3dg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 05, 2021 at 10:16:10AM +0100, Bartosz Golaszewski wrote:
> On Fri, Mar 5, 2021 at 9:55 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Mar 05, 2021 at 09:45:41AM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Mar 5, 2021 at 9:34 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Mar 05, 2021 at 09:18:30AM +0100, Geert Uytterhoeven wrote:
> > > > > CC Greg
> > > > >
> > > > > On Thu, Mar 4, 2021 at 11:30 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > > >
> > > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > >
> > > > > > Export the symbol for device_is_bound() so that we can use it in gpio-sim
> > > > > > to check if the simulated GPIO chip is bound before fetching its driver
> > > > > > data from configfs callbacks in order to retrieve the name of the GPIO
> > > > > > chip device.
> > > > > >
> > > > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > > ---
> > > > > >  drivers/base/dd.c | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > >
> > > > > > diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > > > > > index 9179825ff646..c62c02e3490a 100644
> > > > > > --- a/drivers/base/dd.c
> > > > > > +++ b/drivers/base/dd.c
> > > > > > @@ -353,6 +353,7 @@ bool device_is_bound(struct device *dev)
> > > > > >  {
> > > > > >         return dev->p && klist_node_attached(&dev->p->knode_driver);
> > > > > >  }
> > > > > > +EXPORT_SYMBOL_GPL(device_is_bound);
> > > >
> > > > No.  Please no.  Why is this needed?  Feels like someone is doing
> > > > something really wrong...
> > > >
> > > > NACK.
> > > >
> > >
> > > I should have Cc'ed you the entire series, my bad.
> > >
> > > This is the patch that uses this change - it's a new, improved testing
> > > module for GPIO using configfs & sysfs as you (I think) suggested a
> > > while ago:
> > >
> > > https://lkml.org/lkml/2021/3/4/355
> > >
> > > The story goes like this: committing the configfs item registers a
> > > platform device.
> >
> > Ick, no, stop there, that's not a "real" device, please do not abuse
> > platform devices like that, you all know I hate this :(
> >
> > Use the virtbus code instead perhaps?
> >
> 
> I have no idea what virtbus is and grepping for it only returns three
> hits in: ./drivers/pci/iov.c and it's a function argument.
> 
> If it stands for virtual bus then for sure it sounds like the right
> thing but I need to find more info on this.

Sorry, wrong name, see Documentation/driver-api/auxiliary_bus.rst for
the details.  "virtbus" was what I think about it as that was my
original name for it, but it eventually got merged with a different
name.

> > > As far as I understand - there's no guarantee that
> > > the device will be bound to a driver before the commit callback (or
> > > more specifically platform_device_register_full() in this case)
> > > returns so the user may try to retrieve the name of the device
> > > immediately (normally user-space should wait for the associated uevent
> > > but nobody can force that) by doing:
> > >
> > > mv /sys/kernel/config/gpio-sim/pending/foo /sys/kernel/config/gpio-sim/live/
> > > cat /sys/kernel/config/gpio-sim/live/foo/dev_name
> > >
> > > If the device is not bound at this point, we'll have a crash in the
> > > kernel as opposed to just returning -ENODEV.
> >
> > How will the kernel crash?  What has created the dev_name sysfs file
> > before it is possible to be read from?  That feels like the root
> > problem.
> >
> 
> It's not sysfs - it's in configfs. Each chip has a read-only configfs
> attribute that returns the name of the device - I don't really have a
> better idea to map the configfs items to devices that committing
> creates.

Same question, why are you exporting a configfs attribute that can not
be read from?  Only export it when your driver is bound to the device.

thanks,

greg k-h
