Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDEF339808C
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 07:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbhFBFFi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 01:05:38 -0400
Received: from muru.com ([72.249.23.125]:35156 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229863AbhFBFFi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 2 Jun 2021 01:05:38 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3864E80E0;
        Wed,  2 Jun 2021 05:04:01 +0000 (UTC)
Date:   Wed, 2 Jun 2021 08:03:51 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dario Binacchi <dariobin@libero.it>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] pinctrl: core: configure pinmux from pins debug
 file
Message-ID: <YLcRN0KSCpvCS4ET@atomide.com>
References: <20210520202730.4444-1-dariobin@libero.it>
 <20210520202730.4444-3-dariobin@libero.it>
 <87ea9971-9e15-c595-95cc-14c68b0b68d8@mleia.com>
 <1972814783.387983.1621877304255@mail1.libero.it>
 <414c9176-7922-929f-e82e-f80f07e91b2c@mleia.com>
 <106030092.519428.1622143415836@mail1.libero.it>
 <b25a0e33-d7e8-322a-2a73-bda6e88c8f8b@mleia.com>
 <2062056721.520514.1622147634190@mail1.libero.it>
 <CACRpkdZb4WZS8cd=nFz_J0GrBc5HJ8SMYtniB2W_Jpq_vtPTYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZb4WZS8cd=nFz_J0GrBc5HJ8SMYtniB2W_Jpq_vtPTYQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

* Linus Walleij <linus.walleij@linaro.org> [210528 09:08]:
> On Thu, May 27, 2021 at 10:33 PM Dario Binacchi <dariobin@libero.it> wrote:
> > > Il 27/05/2021 21:57 Vladimir Zapolskiy <vz@mleia.com> ha scritto:
> 
> > > Unfortunately you continue to cling to the broken interface, while I see no
> > > comments from you about asked to consider pin groups and pin group functions.
> >
> > Could you kindly explain to me, with some practical examples, what kind of interface
> > would you implement ?
> 
> I am not fully understanding this discussion.
> 
> I get the feeling that this is caused by the early architectural decisions with
> pinctrl-single to put all configuration of pin groups and functions per pin into
> the device tree.
>
> Tony specifically wanted this because what he gets from TI are some raw
> ASIC data dumps from the designers, that he could make a script to process
> into device tree rather than into .h files, and get this out of the kernel.
> (As I remember it, Tony correct me if I'm wrong.)

Yeah the idea was to avoid stuffing even more SoC specific data into the
kernel and rather use devicetree data only for the booted SoC.
 
> This makes it hard to align some concepts of the pin control subsystem such
> as functions and groups because pinctrl-single assume a 1-to-1 mapping
> between one pin and one group, which in turn has a 1-to-many mapping
> to functions.
> 
> Is the patch trying to debugfs around this somehow?
> 
> If this hack is only needed for pinctrl-single.c then it should be placed in
> that driver, so Tony can review it and maintain it as applicable in that
> driver's context only, not in the pinctrl core as it appears the general
> applicability for other drivers is not there.
> 
> Would this really be useful for other drivers than pinctrl-single.c?

I'd rather go with a generic interface. I think it should work if we only
allow enabling and disabling of unclaimed pingroups from sysfs. And then
we can also allow creating new pingroups for unclaimed pins if needed.

Regards,

Tony
