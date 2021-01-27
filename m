Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEA1305FCF
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 16:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235673AbhA0Pet (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 10:34:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:56844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235196AbhA0PFO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Jan 2021 10:05:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C359207D8;
        Wed, 27 Jan 2021 15:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611759873;
        bh=A5lQceW5WkUV3NZnaUs4+oJ/FTWq97QkH8sVu2gmDxI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GGdWepzCfbLCO2phk+j0D0bqMvwv8XEWgT2bYxwztDmIgxFnXa/wgjb9EuyrIh2YD
         1uTfhT/K8AHZPl4ITw1qqumb0eKJiTUByjBWrp8GGHTKK6O3p6EMhVZP5GQHs1wANx
         cxxaY0iR+6fwiInu54C+PFqHe834IWZ5hQUY9cic=
Date:   Wed, 27 Jan 2021 16:04:30 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Saravana Kannan <saravanak@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        kernel-team@android.com, linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
Message-ID: <YBGA/tK+yyX3i1xx@kroah.com>
References: <20210122193600.1415639-1-saravanak@google.com>
 <YBF3MVttE1aTfx7o@kroah.com>
 <CAMpxmJXDo6oXKzkun9PCT3bWN8adUcyWvf3Sr7SkrKD6r4P8Pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJXDo6oXKzkun9PCT3bWN8adUcyWvf3Sr7SkrKD6r4P8Pg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 27, 2021 at 03:31:17PM +0100, Bartosz Golaszewski wrote:
> On Wed, Jan 27, 2021 at 3:22 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Jan 22, 2021 at 11:35:59AM -0800, Saravana Kannan wrote:
> > > There are multiple instances of GPIO device tree nodes of the form:
> > >
> > > foo {
> > >       compatible = "acme,foo";
> > >       ...
> > >
> > >       gpio0: gpio0@xxxxxxxx {
> > >               compatible = "acme,bar";
> > >               ...
> > >               gpio-controller;
> > >       };
> > >
> > >       gpio1: gpio1@xxxxxxxx {
> > >               compatible = "acme,bar";
> > >               ...
> > >               gpio-controller;
> > >       };
> > >
> > >       ...
> > > }
> > >
> > > bazz {
> > >       my-gpios = <&gpio0 ...>;
> > > }
> > >
> > > Case 1: The driver for "foo" populates struct device for these gpio*
> > > nodes and then probes them using a driver that binds with "acme,bar".
> > > This driver for "acme,bar" then registers the gpio* nodes with gpiolib.
> > > This lines up with how DT nodes with the "compatible" property are
> > > typically converted to struct devices and then registered with driver
> > > core to probe them. This also allows the gpio* devices to hook into all
> > > the driver core capabilities like runtime PM, probe deferral,
> > > suspend/resume ordering, device links, etc.
> > >
> > > Case 2: The driver for "foo" doesn't populate struct devices for these
> > > gpio* nodes before registering them with gpiolib. Instead it just loops
> > > through its child nodes and directly registers the gpio* nodes with
> > > gpiolib.
> > >
> > > Drivers that follow case 2 cause problems with fw_devlink=on. This is
> > > because fw_devlink will prevent bazz from probing until there's a struct
> > > device that has gpio0 as its fwnode (because bazz lists gpio0 as a GPIO
> > > supplier). Once the struct device is available, fw_devlink will create a
> > > device link with gpio0 device as the supplier and bazz device as the
> > > consumer. After this point, since the gpio0 device will never bind to a
> > > driver, the device link will prevent bazz device from ever probing.
> > >
> > > Finding and refactoring all the instances of drivers that follow case 2
> > > will cause a lot of code churn and it is not something that can be done
> > > in one shot. In some instances it might not even be possible to refactor
> > > them cleanly. Examples of such instances are [1] [2].
> > >
> > > This patch works around this problem and avoids all the code churn by
> > > simply setting the fwnode of the gpio_device and creating a stub driver
> > > to bind to the gpio_device. This allows all the consumers to continue
> > > probing when the driver follows case 2.
> > >
> > > [1] - https://lore.kernel.org/lkml/20201014191235.7f71fcb4@xhacker.debian/
> > > [2] - https://lore.kernel.org/lkml/e28e1f38d87c12a3c714a6573beba6e1@kernel.org/
> > > Cc: Marc Zyngier <maz@kernel.org>
> > > Cc: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> > > Cc: Kever Yang <kever.yang@rock-chips.com>
> > > Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
> >
> > As this commit is in my driver-core git tree, can I just take this in
> > the same tree?  Can I get an ack from the maintainer for this?
> >
> > thanks,
> >
> > greg k-h
> 
> Go ahead.
> 
> Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Thanks, now queued up.

greg k-h
