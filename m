Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44024664AC
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 14:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346920AbhLBNss (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Dec 2021 08:48:48 -0500
Received: from mga09.intel.com ([134.134.136.24]:61448 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1358325AbhLBNsr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 2 Dec 2021 08:48:47 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="236521709"
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; 
   d="scan'208";a="236521709"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2021 05:45:24 -0800
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; 
   d="scan'208";a="459659280"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2021 05:45:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1msmNm-001PJ2-Q4;
        Thu, 02 Dec 2021 15:44:18 +0200
Date:   Thu, 2 Dec 2021 15:44:18 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 2/6] gpiolib: allow to specify the firmware node in
 struct gpio_chip
Message-ID: <YajNsrKmEEBr5zWs@smile.fi.intel.com>
References: <YaZNyMV5gX5cZpar@smile.fi.intel.com>
 <CAMRc=Mf5d1i34eBez+pOYjjdyfRL9N_ha_==Cn1rANr=2CB9aQ@mail.gmail.com>
 <YaaQp2rq7N71dm1l@smile.fi.intel.com>
 <CAMRc=Me=Oq_V=+p-AFPcyDjBs-+4Ug3k0AWK9fdEEet2JD3eFw@mail.gmail.com>
 <CAMRc=MdQ+a7UrE7csg3GsiLXYGkzti-wPUwPh5J=7WBj74OVZg@mail.gmail.com>
 <YaimotqSgHzS2wdA@smile.fi.intel.com>
 <CAMRc=Mew8xfPb9kgH-bf=t+yb1xGpRwv3Vn0+b-9pPbp3M3g5Q@mail.gmail.com>
 <YaivZe6Qo9LMoywi@smile.fi.intel.com>
 <Yaiv470uDhTbPD1A@smile.fi.intel.com>
 <CAMRc=Mdz=pihuTamENmTiWRGeUU=tb_PuxvsarS+oXFpyq4p=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mdz=pihuTamENmTiWRGeUU=tb_PuxvsarS+oXFpyq4p=g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 02, 2021 at 02:06:57PM +0100, Bartosz Golaszewski wrote:
> On Thu, Dec 2, 2021 at 12:38 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Thu, Dec 02, 2021 at 01:35:01PM +0200, Andy Shevchenko wrote:
> > > On Thu, Dec 02, 2021 at 12:24:06PM +0100, Bartosz Golaszewski wrote:
> > > > On Thu, Dec 2, 2021 at 11:58 AM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > >
> > > > > On Wed, Dec 01, 2021 at 02:11:28PM +0100, Bartosz Golaszewski wrote:
> > > > > > On Tue, Nov 30, 2021 at 10:04 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > >
> > > > > ...
> > > > >
> > > > > > Let me maybe rephrase the problem: currently, for GPIO devices
> > > > > > instantiating multiple banks created outside of the OF or ACPI
> > > > > > frameworks (e.g. instantiated manually and configured using a
> > > > > > hierarchy of software nodes with a single parent swnode and a number
> > > > > > of child swnodes representing the children), it is impossible to
> > > > > > assign firmware nodes other than the one representing the top GPIO
> > > > > > device to the gpiochip child devices.
> > > > > >
> > > > > > In fact if we want to drop the OF APIs entirely from gpiolib - this
> > > > > > would be the right first step as for gpio-sim it actually replaces the
> > > > > > gc->of_node = some_of_node; assignment that OF-based drivers do for
> > > > > > sub-nodes defining banks and it does work with device-tree (I verified
> > > > > > that too) thanks to the fwnode abstraction layer.
> > > > >
> > > > > In exchange of acknowledgements I confirm that I understood the issue
> > > > > you are describing. What I still don't like is this band-aid:ish approach.
> > > > > What we really need is to replace of_node by fwnode in GPIO library once
> > > > > for all. But it can be done later after your simulation series (or before,
> > > > > i.o.w. independently), hence I propose to update TODO and do it separately.
> > > > >
> > > >
> > > > But this is what we already do for OF. How would the core gpiolib know
> > > > how the firmware nodes represent the banks? It's the driver's job to
> > > > tell the framework which node corresponds with what. If anything, we
> > > > should start replacing of_nodes with fwnodes in drivers and eventually
> > > > we'd drop the of_node pointer from gpio_chip entirely, but we'd keep
> > > > the fwnode pointer I added as the driver still needs to assign it
> > > > itself.
> > > >
> > > > Again: I may be missing something here but I've been going through
> > > > this on and on and can't figure out any other way. Looking at
> > > > gpiolib-acpi.c I don't see it correctly assigning fwnodes to
> > > > sub-devices either but I don't have any HW to test it.
> > > >
> > > > As for this series: I can't really drop this patch as gpio-sim relies
> > > > on swnodes being correctly associated with gpio_chips to identify the
> > > > gpiodevs from configfs callbacks.
> > >
> > > Then we need to replace of_node by fwnode as a first step. I have looked
> > > briefly into the list of drivers that may have been cleaned up and it doesn't
> > > look too long.
> >
> > Let me kick this off by sending couple of patches.
> 
> Are you fine with merging this in the meantime to get gpio-sim into mainline?

gpio-sim, yes, (though I may bikeshed about naming of the configfs attributes,
etc) but not this patch.

-- 
With Best Regards,
Andy Shevchenko


