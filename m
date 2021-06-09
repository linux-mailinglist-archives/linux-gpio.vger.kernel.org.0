Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025793A1283
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jun 2021 13:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233970AbhFILXG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Jun 2021 07:23:06 -0400
Received: from gecko.sbs.de ([194.138.37.40]:35422 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239011AbhFILXG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Jun 2021 07:23:06 -0400
X-Greylist: delayed 540 seconds by postgrey-1.27 at vger.kernel.org; Wed, 09 Jun 2021 07:23:05 EDT
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 159BBxIE010037
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 9 Jun 2021 13:11:59 +0200
Received: from md1za8fc.ad001.siemens.net ([139.22.32.109])
        by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 159B8Hm0019317;
        Wed, 9 Jun 2021 13:08:17 +0200
Date:   Wed, 9 Jun 2021 13:08:16 +0200
From:   Henning Schild <henning.schild@siemens.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: intel: fix NULL pointer deref
Message-ID: <20210609130816.3631f0aa@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAHp75Vcj9wmM7H908sqGmXs10BQN8ty1C4qfmk_nXpG_s=BjTQ@mail.gmail.com>
References: <20210609062722.9132-1-henning.schild@siemens.com>
        <YMCT+izizEg0gPLD@lahna.fi.intel.com>
        <CAHp75Vcj9wmM7H908sqGmXs10BQN8ty1C4qfmk_nXpG_s=BjTQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am Wed, 9 Jun 2021 13:33:34 +0300
schrieb Andy Shevchenko <andy.shevchenko@gmail.com>:

> On Wed, Jun 9, 2021 at 1:12 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Wed, Jun 09, 2021 at 08:27:22AM +0200, Henning Schild wrote:  
> > > match could be NULL in which case we do not go ACPI after all  
> 
> ...
> 
> > >       adev = ACPI_COMPANION(&pdev->dev);
> > > -     if (adev) {
> > > -             const void *match =
> > > device_get_match_data(&pdev->dev); -
> > > +     match = device_get_match_data(&pdev->dev);  
> >
> > Actually we don't even call intel_pinctrl_get_soc_data() if the
> > ACPI ID is not listed in the corresponding driver's module table.
> > So I don't think match can ever be NULL.
> >
> > But feel free to prove me wrong ;-)  
> 
> It's possible to have bugs in this driver, but can we see the real
> case here?

Yes that is indeed only showing when using a kernel that has seen other
patches. To be precise i applied "[rfc, PATCH v1 0/7] PCI: introduce
p2sb helper" before running into the problem. Something in there must
be calling the function without the ACPI ID.

I am still working on a series of device drivers for Siemens PCs,
adding i.e. LEDs which are in fact GPIO. Those PCs have a hidden p2sb
and no ACPI entries for the LEDs.

In order to use GPIO from the drivers i need to make sure
"broxton-pinctrl" comes up even if p2sb is hidden.

Long story short, i thought the patch was simple enough to merge even
taken out of my special context.

Currently intel_pinctl only works if "ps2b is not hidden by BIOS" or
"ACPI tables are correct", lifting the ban on the hidden p2sb seems
like a useful thing in general (i.e. sysfs gpio interface). And i was
hoping Andy would take the lead on that. It is something my Siemens
drivers would depend on, but really a generic thing as far as i
understand it.

regards,
Henning
