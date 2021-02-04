Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C9930F18C
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Feb 2021 12:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235576AbhBDLHE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Feb 2021 06:07:04 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:60701 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235575AbhBDLHC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Feb 2021 06:07:02 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 305E53C0DA8;
        Thu,  4 Feb 2021 10:59:00 +0000 (UTC)
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 36493FF80B;
        Thu,  4 Feb 2021 10:57:53 +0000 (UTC)
Date:   Thu, 4 Feb 2021 11:57:52 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
Message-ID: <20210204105752.GA3940374@piout.net>
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
 <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
 <CAHp75VeYroY5uG38NrsqwbHnjT0j_LMMD3JmNmRED3OY5ff7xA@mail.gmail.com>
 <CAMeQTsZRng0UWkO5fXUmZW=-gnKWiigwO0BwMY9p1T2D-hoMNA@mail.gmail.com>
 <CAKMK7uEBaWMz-AjuJO3vvUBvacqMHuevOhMhQ0a+r5TtyDpwuQ@mail.gmail.com>
 <797cf4ac-ffdc-e73e-cb58-d027beb6e3b4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <797cf4ac-ffdc-e73e-cb58-d027beb6e3b4@redhat.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 04/02/2021 11:50:03+0100, Hans de Goede wrote:
> Hi,
> 
> On 2/4/21 11:36 AM, Daniel Vetter wrote:
> > On Thu, Feb 4, 2021 at 11:19 AM Patrik Jakobsson
> > <patrik.r.jakobsson@gmail.com> wrote:
> >>
> >> On Wed, Feb 3, 2021 at 1:00 PM Andy Shevchenko
> >> <andy.shevchenko@gmail.com> wrote:
> >>>
> >>> On Tue, Jan 26, 2021 at 5:25 PM Patrik Jakobsson
> >>> <patrik.r.jakobsson@gmail.com> wrote:
> >>>> On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
> >>>> <andriy.shevchenko@linux.intel.com> wrote:
> >>>>>
> >>>>> Hi guys,
> >>>>>
> >>>>> This is first part of Intel MID outdated platforms removal. It's collected into
> >>>>> immutable branch with a given tag, please pull to yours subsystems.
> >>>>
> >>>> Hi Andy,
> >>>> Do you plan on eventually removing X86_INTEL_MID completely? If so,
> >>>> then I should probably start looking at removing the corresponding
> >>>> parts in GMA500.
> >>>
> >>> I have noticed new commits in DRM against GMA500 and it seems now in a
> >>> conflict with my immutable branch. Are you sure you don't forget to
> >>> pull it?
> >>
> >> Hi Andy, sorry I missed pulling the immutable branch before taking the
> >> gma500 medfield removal. I was unsure how to do that through drm-misc
> >> and it's tools so I got sidetracked. What would be the correct way to
> >> fix this?
> > 
> > Imo Linus can resolve this, it's pretty trivial, as long as both pull
> > requests point it out to him.
> 
> The removal of older Intel platforms touches a number of subsystem trees,
> the idea about the IM branch was that all subsystem-trees would merge that.
> 
> I can certainly point out the problem in the pdx86 pull-req to Linus,
> but the GPIO pull-req also contains a merge of the IM branch as will
> the x86/tip and rtc pull-reqs I believe. We can add a remark to all
> the pull-reqs about the issue I guess ?
> 

FWIW, I'm not going to merge the PR in the rtc tree because it is a
simple removal and doesn't have any conflicts.

> But it might be better to still merge the branch into drm-misc-next and
> resolve the conflict there. I think that should avoid Linus seeing it ?
> 

Linus doesn't mind seeing and solving conflicts.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
