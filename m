Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821443A48C3
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jun 2021 20:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhFKSjc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Jun 2021 14:39:32 -0400
Received: from goliath.siemens.de ([192.35.17.28]:38492 "EHLO
        goliath.siemens.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbhFKSjb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Jun 2021 14:39:31 -0400
X-Greylist: delayed 1067 seconds by postgrey-1.27 at vger.kernel.org; Fri, 11 Jun 2021 14:39:31 EDT
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 15BIJcgx023316
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Jun 2021 20:19:38 +0200
Received: from md1za8fc.ad001.siemens.net ([139.22.32.109])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 15BIJchk026427;
        Fri, 11 Jun 2021 20:19:38 +0200
Date:   Fri, 11 Jun 2021 20:19:35 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: fix NULL pointer deref
Message-ID: <20210611201935.4d83ed2a@md1za8fc.ad001.siemens.net>
In-Reply-To: <YMIvn+iGt2ijfh7z@smile.fi.intel.com>
References: <20210609062722.9132-1-henning.schild@siemens.com>
        <YMCT+izizEg0gPLD@lahna.fi.intel.com>
        <CAHp75Vcj9wmM7H908sqGmXs10BQN8ty1C4qfmk_nXpG_s=BjTQ@mail.gmail.com>
        <20210609130816.3631f0aa@md1za8fc.ad001.siemens.net>
        <YMIgwORlAzz/gJcK@smile.fi.intel.com>
        <YMIijnvoudaodX+A@smile.fi.intel.com>
        <20210610165632.0d9bb321@md1za8fc.ad001.siemens.net>
        <CAHp75Vd+r3_OnRAYJcHVTU3Q2ekLYV_oHQQ6-wWmq=9hm_cP1g@mail.gmail.com>
        <YMIvn+iGt2ijfh7z@smile.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Thu, 10 Jun 2021 18:28:31 +0300
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Thu, Jun 10, 2021 at 06:00:29PM +0300, Andy Shevchenko wrote:
> > On Thu, Jun 10, 2021 at 5:56 PM Henning Schild
> > <henning.schild@siemens.com> wrote:  
> > >
> > > Am Thu, 10 Jun 2021 17:32:46 +0300
> > > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:
> > >  
> > > > On Thu, Jun 10, 2021 at 05:25:04PM +0300, Andy Shevchenko
> > > > wrote:  
> > > > > On Wed, Jun 09, 2021 at 01:08:16PM +0200, Henning Schild
> > > > > wrote:  
> > > > > > Am Wed, 9 Jun 2021 13:33:34 +0300
> > > > > > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:  
> > > > >
> > > > > ...
> > > > >  
> > > > > > In order to use GPIO from the drivers i need to make sure
> > > > > > "broxton-pinctrl" comes up even if p2sb is hidden.
> > > > > >
> > > > > > Long story short, i thought the patch was simple enough to
> > > > > > merge even taken out of my special context.
> > > > > >
> > > > > > Currently intel_pinctl only works if "ps2b is not hidden by
> > > > > > BIOS" or "ACPI tables are correct", lifting the ban on the
> > > > > > hidden p2sb seems like a useful thing in general (i.e.
> > > > > > sysfs gpio interface). And i was hoping Andy would take the
> > > > > > lead on that. It is something my Siemens drivers would
> > > > > > depend on, but really a generic thing as far as i
> > > > > > understand it.  
> > > > >
> > > > > From p2sb series discussion it appears that this patch is not
> > > > > needed. The case is when BIOS already provides an ACPI device.
> > > > >
> > > > > So, the initial bug is in that series that needs to check if
> > > > > the ACPI device is exposed and forbid platform device
> > > > > instantiation in that case.  
> > > >
> > > > Actually, I'm still thinking how this ever possible. We have all
> > > > drivers to provide SoC data pointers. match data may be NULL if
> > > > and only if the ACPI device provided is a new one that doesn't
> > > > provide a SoC data.
> > > >
> > > > So, w/o seeing ACPI table, I'm really puzzled here.  
> > >
> > > Not sure what exactly you mean. Let us kill this thread and
> > > ignore the patch. It was posted out of context and the NULL deref
> > > code-path does not exist in the kernel, so the check is not
> > > needed.
> > >
> > > I will revisit the machine where your patch-series did lead to a
> > > double-init and EBUSY on claiming those memory ressources. And i
> > > will add ACPI info there as well.  
> > 
> > I guess I got what's going on here. When we create a platform device
> > we get an associated companion device (which is parent in this case
> > of LPC) and that's why when we try enumerating it you have got the
> > first branch chosen.  
> 
> I have just sent another patch based on this report. Can you please
> test it?

Thanks, that fixed the NULL deref introduced by " [rfc, PATCH v1 0/7]
PCI: introduce p2sb helper", so it should be added to a v2 i guess.

A remaining cosmetic issue is this ...
[    4.131578] broxton-pinctrl apollolake-pinctrl.0: can't request region for resource [mem 0xd0c50000-0xd0c5076b 64bit]
[    4.131669] broxton-pinctrl: probe of apollolake-pinctrl.0 failed with error -16

For all 4 parts. I guess it could detect being already loaded via ACPI
end EBUSY out with INFO instead of ERR.

And i guess if the probing was - for some reason - the other way
around. /sys/class/gpio/gpiochip267/label would be either "INT3452:03"
or "apollolake-pinctrl.3" and a driver building on top would need to
deal with that chip having one of the two names.
I imagine the probing order could change when ACPI gains table entries
with a BIOS update, or looses table entries ...

GPIO_LOOKUP_IDX("apollolake-pinctrl.0" vs. "INT34.."

Same for a userland component using the sysfs GPIO interface and
looking for the chip by "label".

regards,
Henning
