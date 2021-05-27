Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33BF393630
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 21:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234359AbhE0TZM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 15:25:12 -0400
Received: from smtp-16-i2.italiaonline.it ([213.209.12.16]:43621 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229791AbhE0TZL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 May 2021 15:25:11 -0400
Received: from oxapps-37-174.iol.local ([10.101.8.220])
        by smtp-16.iol.local with ESMTPA
        id mLbTlXJoxnZuOmLbTlUdwV; Thu, 27 May 2021 21:23:36 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1622143416; bh=KSKMfkbOX2FTIZKDBFF4g/A3zOrHfqKqYBTXdyeSyFY=;
        h=From;
        b=p4+MZ1fCJT5MbVqAa0lynMom5xvSOGuzRU8IfLIWl4B7jNhm99HVofLMDjfRVzpLU
         k6sFRoMik/NQotB5g6S3U3yopLs3mJgG+3V56Q/8LupUl/RlS0cjGZVYetwdI6PE25
         ghr4JJdBNf2oxqZUPuQvHjTvYglb5mYufXYzu5HP0IhMEvVWVbWKGF9e8z4g/4LT7k
         LCFKkoGxOkjlFBWcvvSxyJrLOa4mOMFT/1x9/FnniJqGauPt4p+LI5Ykpyt5bmcgbc
         mu+7aOB0fetkwESS+3n+RojQflsHQE0W5WzpPF4s4pfQKz6xpbthSsE1brDl7X3weR
         zyp8qHczXzvew==
X-CNFS-Analysis: v=2.4 cv=OJbiYQWB c=1 sm=1 tr=0 ts=60aff1b8 cx=a_exe
 a=C8U9wQxWOnS4tgU1BwpF/g==:117 a=08fdJdSdiRUA:10 a=IkcTkHD0fZMA:10
 a=IeDTYxtbb8wA:10 a=6J6j7_AOAAAA:8 a=VwQbUJbxAAAA:8 a=5CYqDcJYUY0sNDUCx-AA:9
 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19 a=QEXdDO2ut3YA:10 a=DoBsnWhqfNmTxX1QClym:22
 a=AjGcO6oz07-iQ99wixmX:22
Date:   Thu, 27 May 2021 21:23:35 +0200 (CEST)
From:   Dario Binacchi <dariobin@libero.it>
To:     Vladimir Zapolskiy <vz@mleia.com>, linux-kernel@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>,
        Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org
Message-ID: <106030092.519428.1622143415836@mail1.libero.it>
In-Reply-To: <414c9176-7922-929f-e82e-f80f07e91b2c@mleia.com>
References: <20210520202730.4444-1-dariobin@libero.it>
 <20210520202730.4444-3-dariobin@libero.it>
 <87ea9971-9e15-c595-95cc-14c68b0b68d8@mleia.com>
 <1972814783.387983.1621877304255@mail1.libero.it>
 <414c9176-7922-929f-e82e-f80f07e91b2c@mleia.com>
Subject: Re: [PATCH v3 2/3] pinctrl: core: configure pinmux from pins debug
 file
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev34
X-Originating-IP: 82.60.150.250
X-Originating-Client: open-xchange-appsuite
x-libjamsun: /ODCUiEPoJiIqWY3KpAugKjlsbxi8E4W
x-libjamv: 0nKVBLZh4nE=
X-CMAE-Envelope: MS4xfMxQhit4UqFiHrQtfpbrW+1hhC9j0lehziSLlapI+IyoPGca6RxxaNxZuOoVfwoQeI2IytmsXNOsHQTWXz9Hk6l+I19CTyicgh++KWm9ZFaM9GJNp5xI
 B1owpMk7fpYpN+ktywQHkTYHOiZmrwOBBCcftuE9e4SGZFEtBRt+PWt+kH6ek2sGAbYL7U5pQ1Yerr9RTOg95AJYB+KBGg4kWpB+c+qzCxGE4cqCuk1Mvmh5
 eXd5lcQvxVXIFo367z8teFDWFEEnPCoIcDWRVMbXjz35MlXdOtoSJlRCLm3qlXLFY2oMbQ7xWOccxWw4sr42TzlpJE/ZEkbJJih8qx4q7aWIKUFADurHal19
 P23EME3ijgyDSR64yNIjKvBtu3lWRdpmEjjXg+oToHQBzNw86bc=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Vladimir,

> Il 24/05/2021 20:52 Vladimir Zapolskiy <vz@mleia.com> ha scritto:
> 
>  
> Hi Dario,
> 
> On 5/24/21 8:28 PM, Dario Binacchi wrote:
> > Hi Vladimir,
> > 
> >> Il 21/05/2021 08:44 Vladimir Zapolskiy <vz@mleia.com> ha scritto:
> >>
> >>   
> >> Hello Dario,
> >>
> >> On 5/20/21 11:27 PM, Dario Binacchi wrote:
> >>> The MPUs of some architectures (e.g AM335x) must be in privileged
> >>> operating mode to write on the pinmux registers. In such cases, where
> >>> writes will not work from user space, now it can be done from the pins
> >>
> >> user space has no connection to the problem you're trying to solve.
> >>
> >> Please provide a reasonable rationale for adding a new interface, thank
> >> you in advance.
> >>
> >>> debug file if the platform driver exports the pin_dbg_set() helper among
> >>> the registered operations.
> >>>
> >>> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> >>
> >> I strongly object against this new interface.
> >>
> >> As Andy've already mentioned you have to operate with defined pin groups
> >> and functions, and so far you create an interface with an option to
> >> disasterous misusage, it shall be avoided, because there are better
> >> options.
> >>
> >> What's the issue with a regular declaration of pin groups and functions
> >> on your SoC? When it's done, you can operate on this level of abstraction,
> >> there is absolutely no need to add the proposed low-level debug interface.
> >>
> > 
> > I quote Drew's words:
> > 
> > "I think it could be helpful to be able to set the conf_<module>_<pin>
> > registers directly through debugfs as I can imagine situations where it would
> > be useful for testing. It is a bit dangerous as the person using it has to be
> > careful not to change the wrong bits, but they would need to have debugfs mounted
> > and permissions to write to it."
> > 
> > "Bits 6:3 are related to what this subsystem would refer to as pin conf
> > such as slew, input enable and bias. Thus it might make sense to expose
> > something like a select-pinconf file to activate pin conf settings from
> > userspace."
> 
> This is already present, please define all wanted configurations of pin
> groups and pin group functions, then switch them in runtime. I see no
> need of a coarse grained interface here...
> 
> >  From the emails exchanged I seem to have understood that there is no way to
> > reconfigure slew rate, pull up / down and other properties on the fly.
> 
> I think you still can do all the tasks mentioned above on the recent kernel,
> why not?
> 
> I am not closely familiar with TI AM335x pinmux/pinconf controller, and if
> needed I can look at the datasheet, but I can imagine that there are pins,
> pin groups, and pin group functions controls. Board specific configuration
> of pinmux is given in DTS, you can modify it with DT overlays for instance,
> and selection of pin group functions in runtime is already possible for
> users in runtime. What is missing from the picture, and why do you insist
> on re-introduction of a much worse interface?
> 
> > In the kernel version 4.1.6 that I am using on my custom board, I have fixed
> > the commit f07512e615dd ("pinctrl/pinconfig: add debug interface"). However,
> > this feature was later removed (https://lore.kernel.org/patchwork/patch/1033755/).
> 
> Exactly, the feature is not needed.
> 
> > The patches I've submitted implement some sort of devmem for pinmux. It too can
> > be used in a dangerous way, but it exists and it is used.
> 
> My objection is to giving a "red button" to users, even to users of debugfs.
> 
> If it's possible to keep the "dangerous goods" on developers' side only,
> then this shall be preferable, I believe. And fortunately there is such
> a mechanism.
> 
> > Anyway, the implementation may be wrong but it does highlight a feature that
> > can be useful in testing or prototyping boards but is not present in the kernel.
> > Can we then find a solution that is right for everyone?
> 
> Please see the method above.
> 
> In my understanding the problem you are trying to solve shall be defined
> much more precised. Can you please elaborate on this part thoroughly?
> 
> I still can not grasp a too generic explanation from you, writing of
> totally arbitrary data to controller registers looks senseless to me...
> 
> Assume you are giving a handle to users to write arbitrary data to arbitrary
> I/O mem region, will it solve the problem for you? Of course yes.
> 
> But does it sound like a good and acceptable solution? Of course no.
> Why? You need a better and more fine grained interface, namely write only
> to pinmux I/O mem. Great, that's provided by your change, however another
> important condition is still missing, a user shall write only valid data.
> Thus a higher level of abstraction is wanted:
> 
> * writing data to I/O mem -- not good enough,
> * writing data to pinmux/pinconf I/O mem -- better, but not good enough,
> * writing *valid* data to pinmux/pinconf I/O mem -- that's right.

So, why not start from the feature you removed?
It wrote valid data to pinconf I/O mem.

Thanks and regards,
Dario

> 
> The validity of data is defined by a developer, the abstraction name
> has been mentioned multiple times, it's pin groups and pin group functions.
> 
> --
> Best wishes,
> Vladimir
