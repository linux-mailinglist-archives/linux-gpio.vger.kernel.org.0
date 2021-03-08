Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 566E2330BDB
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 11:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbhCHK6h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 05:58:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbhCHK6N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 05:58:13 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71EEC061760
        for <linux-gpio@vger.kernel.org>; Mon,  8 Mar 2021 02:58:12 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id mm21so19324397ejb.12
        for <linux-gpio@vger.kernel.org>; Mon, 08 Mar 2021 02:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cakLU/eCVibA/iJUsPZ/Q2ABgxzfNfr1tJxKBYGIySk=;
        b=BTBqBrUFxR1nwyCuWnwC6e1DEERyTpTbaHk6owBxXjbWU8CuECLmKi/NSs11fNl5Y3
         AIl8cgQMkcD9RjzQdWnPRmKqiHZq3fRxJpmt622AOYG56b2bh0ANSFaWDHLCiy1mX0Wv
         uXvc7B+2HAr5i12uyVLydPXvt68rQ/I4AolZfgaJ0JoE0q4m6Pv8WYZCg1xahdh/7ndv
         QWI9fmOHAnEmFdHCE8FuWyhZpmI/HQIn3sHcRu+LXm6nxzspXtR6VYB65duFImKgDdzk
         1BVaA2tOV8qZEonKP9+uuHoWLleK+dlHk+77+fER0jXob7Wm4To0+KkBfQiFKF/aif8F
         iicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cakLU/eCVibA/iJUsPZ/Q2ABgxzfNfr1tJxKBYGIySk=;
        b=f5us0h7ZSmEZv4mzI7NkNx1Bn6fMChPXNXJ5G/04MCuw349R881HWpsvFTaRsalk9J
         WoHVjPYCkvgcLotJcQMThO5aSJIk8h10W2hspjnyeuWJp3UThE1qImnVK64LvlIySMVH
         OjmrcyDiIv4KPS7dja6qwKmWDxXh1XghJm08iWWJm2SzopKIg1/g7rqts1A4VKJlqfrt
         v/QY6LMDAWSHjp32hDAROODtfJ7COoUIv2FdxP5Pa7MKHJ08NMTBV3QPeJQ6AJf5H2fl
         K1DUWF8X7ES1kc3ujRACNk/krD6rFjCZVurnsMsV7FCY1YxkCuzL+xREPkHZC8gBQaG/
         P+pA==
X-Gm-Message-State: AOAM533zbE4aleigKMNUSD4hqW5/X7P2cD5e0EKgKJHMf6h59e0VPRdW
        yWrcRWRhktayJ6bOJbAjQSR4XY4vuf1p95ga9oNlFw==
X-Google-Smtp-Source: ABdhPJyh7cYNblznEQDzmgBCp9FhnkGIWSgzPhPC3Nx9KFcWWRsdhoOzb1arlNSmU6ZCa/pt47xg+BRBvMZeZsH2CFw=
X-Received: by 2002:a17:906:d938:: with SMTP id rn24mr15092670ejb.87.1615201091145;
 Mon, 08 Mar 2021 02:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20210304102452.21726-9-brgl@bgdev.pl> <CAMuHMdXRK5=w1-Z=EbM60Sf2bLY1EiVaxbZjMP+XyQ3g7nBpZw@mail.gmail.com>
 <YEHs3CxWnusWklME@kroah.com> <CAMRc=MddDb+nakgEM+Xeqm=rMMkkWO2EDekD36EoPJashYP88w@mail.gmail.com>
 <YEHyDUQ3V7Pl6+TU@kroah.com> <CAMRc=Md7FeQAd4Syh685+jyZAq2QStBNoo0ACQxrSB=4N6d3dg@mail.gmail.com>
 <YEIG0u8Vg3e6ZBhz@kroah.com> <CAMRc=Meznt=5m_4OnSRf04xHsUy39hH7S7_8ftZaHq6GD-taEw@mail.gmail.com>
 <YEIVi8aDSEukrK7E@kroah.com> <CAMRc=MeNBt=J2LkDAYKhd9iQJCfyTvAxBKmJZ7vjVUOmYjexLg@mail.gmail.com>
 <YEJH0J6czwpNlZAg@kroah.com>
In-Reply-To: <YEJH0J6czwpNlZAg@kroah.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 8 Mar 2021 11:58:00 +0100
Message-ID: <CAMRc=McbqH27Xwqhwk0yvN5fhMFhGn=gPHi13QE2+WsWvFDETA@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] drivers: export device_is_bound()
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>, Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 5, 2021 at 4:01 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 05, 2021 at 03:20:27PM +0100, Bartosz Golaszewski wrote:
> > On Fri, Mar 5, 2021 at 12:27 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Mar 05, 2021 at 11:58:18AM +0100, Bartosz Golaszewski wrote:
> > > > On Fri, Mar 5, 2021 at 11:24 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Fri, Mar 05, 2021 at 10:16:10AM +0100, Bartosz Golaszewski wrote:
> > > > > > On Fri, Mar 5, 2021 at 9:55 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > > > >
> > > > > > > On Fri, Mar 05, 2021 at 09:45:41AM +0100, Bartosz Golaszewski wrote:
> > > > > > > > On Fri, Mar 5, 2021 at 9:34 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > > > > > >
> > > > > > > > > On Fri, Mar 05, 2021 at 09:18:30AM +0100, Geert Uytterhoeven wrote:
> > > > > > > > > > CC Greg
> > > > > > > > > >
> > > > > > > > > > On Thu, Mar 4, 2021 at 11:30 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > > > > > > > >
> > > > > > > > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > > > > > > >
> > > > > > > > > > > Export the symbol for device_is_bound() so that we can use it in gpio-sim
> > > > > > > > > > > to check if the simulated GPIO chip is bound before fetching its driver
> > > > > > > > > > > data from configfs callbacks in order to retrieve the name of the GPIO
> > > > > > > > > > > chip device.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > > > > > > > ---
> > > > > > > > > > >  drivers/base/dd.c | 1 +
> > > > > > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > > > > > > > > > > index 9179825ff646..c62c02e3490a 100644
> > > > > > > > > > > --- a/drivers/base/dd.c
> > > > > > > > > > > +++ b/drivers/base/dd.c
> > > > > > > > > > > @@ -353,6 +353,7 @@ bool device_is_bound(struct device *dev)
> > > > > > > > > > >  {
> > > > > > > > > > >         return dev->p && klist_node_attached(&dev->p->knode_driver);
> > > > > > > > > > >  }
> > > > > > > > > > > +EXPORT_SYMBOL_GPL(device_is_bound);
> > > > > > > > >
> > > > > > > > > No.  Please no.  Why is this needed?  Feels like someone is doing
> > > > > > > > > something really wrong...
> > > > > > > > >
> > > > > > > > > NACK.
> > > > > > > > >
> > > > > > > >
> > > > > > > > I should have Cc'ed you the entire series, my bad.
> > > > > > > >
> > > > > > > > This is the patch that uses this change - it's a new, improved testing
> > > > > > > > module for GPIO using configfs & sysfs as you (I think) suggested a
> > > > > > > > while ago:
> > > > > > > >
> > > > > > > > https://lkml.org/lkml/2021/3/4/355
> > > > > > > >
> > > > > > > > The story goes like this: committing the configfs item registers a
> > > > > > > > platform device.
> > > > > > >
> > > > > > > Ick, no, stop there, that's not a "real" device, please do not abuse
> > > > > > > platform devices like that, you all know I hate this :(
> > > > > > >
> > > > > > > Use the virtbus code instead perhaps?
> > > > > > >
> > > > > >
> > > > > > I have no idea what virtbus is and grepping for it only returns three
> > > > > > hits in: ./drivers/pci/iov.c and it's a function argument.
> > > > > >
> > > > > > If it stands for virtual bus then for sure it sounds like the right
> > > > > > thing but I need to find more info on this.
> > > > >
> > > > > Sorry, wrong name, see Documentation/driver-api/auxiliary_bus.rst for
> > > > > the details.  "virtbus" was what I think about it as that was my
> > > > > original name for it, but it eventually got merged with a different
> > > > > name.
> > > > >
> >
> > Unless I'm not seeing something - it completely doesn't look like the
> > right solution. This auxiliary bus sounds like MFD with extra steps.
> > Its aim seems to be to provide virtual devices for sub-modules of real
> > devices.
> >
> > What I have here really is a dummy device for which no HW exists.
>
> Then just use a "normal" virtual device.  We have loads of them.  But if
> you want to bind a "driver" to it, then use the aux bus please.  Do NOT
> abuse a platform device for this.
>
> > Also: while the preferred way is to use configfs to instantiate these
> > simulated devices, then can still be registered from device-tree (this
> > is a feature that was requested and eventually implemented in
> > gpio-mockup which we want to phase out so we can't just drop it).
> > AFAIK only platform devices can be populated from DT.
>
> If you really are using DT, then ok, a platform device can be used, but
> you didn't say that :)
>

My bad. Yes we need to use DT. And platform device does sound like the
best approach.

> > I guess we could create something like a "virtual bus" that would be
> > there for devices that don't exist on any physical bus but this would
> > end up in big part being the same thing as platform devices.
>
> That's what the aux bus code is there for.  So maybe you do need to use
> it.
>

I'm fine with that if it can be instantiated from DT but it doesn't seem so.

> > > > > > > > As far as I understand - there's no guarantee that
> > > > > > > > the device will be bound to a driver before the commit callback (or
> > > > > > > > more specifically platform_device_register_full() in this case)
> > > > > > > > returns so the user may try to retrieve the name of the device
> > > > > > > > immediately (normally user-space should wait for the associated uevent
> > > > > > > > but nobody can force that) by doing:
> > > > > > > >
> > > > > > > > mv /sys/kernel/config/gpio-sim/pending/foo /sys/kernel/config/gpio-sim/live/
> > > > > > > > cat /sys/kernel/config/gpio-sim/live/foo/dev_name
> > > > > > > >
> > > > > > > > If the device is not bound at this point, we'll have a crash in the
> > > > > > > > kernel as opposed to just returning -ENODEV.
> > > > > > >
> > > > > > > How will the kernel crash?  What has created the dev_name sysfs file
> > > > > > > before it is possible to be read from?  That feels like the root
> > > > > > > problem.
> > > > > > >
> > > > > >
> > > > > > It's not sysfs - it's in configfs. Each chip has a read-only configfs
> > > > > > attribute that returns the name of the device - I don't really have a
> > > > > > better idea to map the configfs items to devices that committing
> > > > > > creates.
> > > > >
> > > > > Same question, why are you exporting a configfs attribute that can not
> > > > > be read from?  Only export it when your driver is bound to the device.
> > > > >
> > > >
> > > > The device doesn't know anything about configfs. Why would it? The
> > > > configuration of a GPIO chip can't be changed after it's instantiated,
> > > > this is why we have committable items.
> > > >
> > > > We export a directory in configfs: gpio-sim -> user creates a new
> > > > directory (item) in gpio-sim/pending/foo and it's not tied to any
> > > > device yet but exports attributes which we use to configure the device
> > > > (label, number of lines, line names etc.), then we mv
> > > > gpio-sim/pending/foo gpio-sim/live and this is when the device gets
> > > > created and registered with the subsystem. We take all the configured
> > > > attributes and put them into device properties for both the driver and
> > > > gpiolib core (for standard properties) to read - just like we would
> > > > with a regular GPIO driver because this is the goal: test the core
> > > > code.
> > >
> > > Ok, but they why are you trying to have dev_name be an exported thing?
> > > I don't understand an attribute here that is visable but can not be read
> > > from.
> > >
> >
> > Because once the associated configfs item is committed and the device
> > created, it will become readable. The list of attributes is fixed in
> > configfs. I'm not sure what the better approach would be - return
> > "none" if the device handle is NULL?
>
> Sounds reasonable, I don't know how configfs works, it's been a decade
> since I last touched it.
>
> > > And why not just use the default device name function: dev_name(), which
> > > will always return a string that will work no matter if the device is
> > > bound to a driver or not.
> > >
> >
> > I can do this but then it's possible that user-space gets the name of
> > the device which doesn't exist in sysfs. I guess we can mention that
> > in the documentation.
>
> Device names can change over time, nothing new there.
>

Ok will change in v3. I'll Cc you next time.

Bart
