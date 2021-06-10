Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C173A2EC7
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 16:56:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbhFJO6p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 10:58:45 -0400
Received: from lizzard.sbs.de ([194.138.37.39]:59686 "EHLO lizzard.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230410AbhFJO6p (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Jun 2021 10:58:45 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 15AEuYlL023357
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Jun 2021 16:56:34 +0200
Received: from md1za8fc.ad001.siemens.net ([167.87.8.208])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 15AEuYIK028233;
        Thu, 10 Jun 2021 16:56:34 +0200
Date:   Thu, 10 Jun 2021 16:56:32 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: fix NULL pointer deref
Message-ID: <20210610165632.0d9bb321@md1za8fc.ad001.siemens.net>
In-Reply-To: <YMIijnvoudaodX+A@smile.fi.intel.com>
References: <20210609062722.9132-1-henning.schild@siemens.com>
        <YMCT+izizEg0gPLD@lahna.fi.intel.com>
        <CAHp75Vcj9wmM7H908sqGmXs10BQN8ty1C4qfmk_nXpG_s=BjTQ@mail.gmail.com>
        <20210609130816.3631f0aa@md1za8fc.ad001.siemens.net>
        <YMIgwORlAzz/gJcK@smile.fi.intel.com>
        <YMIijnvoudaodX+A@smile.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Thu, 10 Jun 2021 17:32:46 +0300
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Thu, Jun 10, 2021 at 05:25:04PM +0300, Andy Shevchenko wrote:
> > On Wed, Jun 09, 2021 at 01:08:16PM +0200, Henning Schild wrote:  
> > > Am Wed, 9 Jun 2021 13:33:34 +0300
> > > schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:  
> > 
> > ...
> >   
> > > In order to use GPIO from the drivers i need to make sure
> > > "broxton-pinctrl" comes up even if p2sb is hidden.
> > > 
> > > Long story short, i thought the patch was simple enough to merge
> > > even taken out of my special context.
> > > 
> > > Currently intel_pinctl only works if "ps2b is not hidden by BIOS"
> > > or "ACPI tables are correct", lifting the ban on the hidden p2sb
> > > seems like a useful thing in general (i.e. sysfs gpio interface).
> > > And i was hoping Andy would take the lead on that. It is
> > > something my Siemens drivers would depend on, but really a
> > > generic thing as far as i understand it.  
> > 
> > From p2sb series discussion it appears that this patch is not
> > needed. The case is when BIOS already provides an ACPI device.
> > 
> > So, the initial bug is in that series that needs to check if the
> > ACPI device is exposed and forbid platform device instantiation in
> > that case.  
> 
> Actually, I'm still thinking how this ever possible. We have all
> drivers to provide SoC data pointers. match data may be NULL if and
> only if the ACPI device provided is a new one that doesn't provide a
> SoC data.
> 
> So, w/o seeing ACPI table, I'm really puzzled here.

Not sure what exactly you mean. Let us kill this thread and ignore the
patch. It was posted out of context and the NULL deref code-path does
not exist in the kernel, so the check is not needed.

I will revisit the machine where your patch-series did lead to a
double-init and EBUSY on claiming those memory ressources. And i will
add ACPI info there as well.

regards,
Henning
