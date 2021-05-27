Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24EE4393738
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 22:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235871AbhE0Uf3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 16:35:29 -0400
Received: from smtp-16-i2.italiaonline.it ([213.209.12.16]:44997 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235848AbhE0Uf3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 May 2021 16:35:29 -0400
Received: from oxapps-37-174.iol.local ([10.101.8.220])
        by smtp-16.iol.local with ESMTPA
        id mMhWlXhgrnZuOmMhWlUyQx; Thu, 27 May 2021 22:33:54 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1622147634; bh=ILl+M1Rlp+V574qVdMFe1tTsMFB80jeClUQjn5kQV54=;
        h=From;
        b=aZjP2hjdFgHQ8P4nKQ2eH3TEbJyKvjC8eJ4LAo2NqJc8hCVBQSgKVpFqKt4uI3DOF
         1IrkD9CHUWBR/wcGcyW7NdoT12JY7gUoMIIOpIW7mPAJjd6YL9lrfM3Fd5DHxpP/1E
         VYIjbvRkqi7e5dRgcQE7WWgO3EbiGWAa2OBcPYmgU5knlIaB7UGh4eT8DCssPGPOzD
         odHc6+oEcNFscZ0voNEhTRH9OXtFCKhMYK/dKKV7P6qb+qI3g5mR8nBtIsHHjUhF+e
         wPDSQKAMrFG4+ADqzSJYbbPrSYunwsgNje01ec0hrhVFbyJ9gBX37ih0kNEjOG1Bll
         jnkA2sVINryhQ==
X-CNFS-Analysis: v=2.4 cv=OJbiYQWB c=1 sm=1 tr=0 ts=60b00232 cx=a_exe
 a=C8U9wQxWOnS4tgU1BwpF/g==:117 a=08fdJdSdiRUA:10 a=IkcTkHD0fZMA:10
 a=IeDTYxtbb8wA:10 a=6J6j7_AOAAAA:8 a=VwQbUJbxAAAA:8 a=uRkiGd3C0NBOzgFH5zMA:9
 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19 a=QEXdDO2ut3YA:10 a=DoBsnWhqfNmTxX1QClym:22
 a=AjGcO6oz07-iQ99wixmX:22
Date:   Thu, 27 May 2021 22:33:54 +0200 (CEST)
From:   Dario Binacchi <dariobin@libero.it>
To:     Vladimir Zapolskiy <vz@mleia.com>, linux-kernel@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>,
        Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org
Message-ID: <2062056721.520514.1622147634190@mail1.libero.it>
In-Reply-To: <b25a0e33-d7e8-322a-2a73-bda6e88c8f8b@mleia.com>
References: <20210520202730.4444-1-dariobin@libero.it>
 <20210520202730.4444-3-dariobin@libero.it>
 <87ea9971-9e15-c595-95cc-14c68b0b68d8@mleia.com>
 <1972814783.387983.1621877304255@mail1.libero.it>
 <414c9176-7922-929f-e82e-f80f07e91b2c@mleia.com>
 <106030092.519428.1622143415836@mail1.libero.it>
 <b25a0e33-d7e8-322a-2a73-bda6e88c8f8b@mleia.com>
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
x-libjamsun: ogLGItkAlsvV2hSKbyuGgsNV3FzisaEl
x-libjamv: 3mrbWlUiP04=
X-CMAE-Envelope: MS4xfKRKzMelYb/WoSzZUnOxtY1bPvMicsUoeHxiJR/SHTLf390TcmDUrybzc8JYhyxlPqzmukO5hPunf4JfcT8qt2Zzatk4ZSy9HTjhJ0IRxsfHUMopvbV+
 9S0TKiN96dh/tZ7vpJm5agz6Nzho/3ibV1ZdOyjupRLjKekrkXfML1fVEz3Jsmk7++qC2noEOJFG5QNarTI4gnVur4R1BXzM5+3n7KUUjeKjpAX3gMiit8ub
 a4D8G+iMxSNgFleFlKfc+lUn6TdEi4GEkyu3ECZI3nccZXKYgVybrseskqHtWjgQAw7PWnxIBbLxsbVAIM9rY3lg47UFR3+wegrGnLOSn7d4wi9Gm9glEzWC
 EhFbLpmEZEcrsU83aRDSvSXiQzk/5JUBpmZh1F9AJvYTGoEMEQE=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Vladimir,

> Il 27/05/2021 21:57 Vladimir Zapolskiy <vz@mleia.com> ha scritto:
> 
>  
> Hi Dario,
> 
> On 5/27/21 10:23 PM, Dario Binacchi wrote:
> > Hi Vladimir,
> > 
> >> Il 24/05/2021 20:52 Vladimir Zapolskiy <vz@mleia.com> ha scritto:
> >>
> >>   
> >> Hi Dario,
> >>
> >> On 5/24/21 8:28 PM, Dario Binacchi wrote:
> >>> Hi Vladimir,
> >>>
> >>>> Il 21/05/2021 08:44 Vladimir Zapolskiy <vz@mleia.com> ha scritto:
> >>>>
> >>>>    
> >>>> Hello Dario,
> >>>>
> >>>> On 5/20/21 11:27 PM, Dario Binacchi wrote:
> >>>>> The MPUs of some architectures (e.g AM335x) must be in privileged
> >>>>> operating mode to write on the pinmux registers. In such cases, where
> >>>>> writes will not work from user space, now it can be done from the pins
> >>>>
> >>>> user space has no connection to the problem you're trying to solve.
> >>>>
> >>>> Please provide a reasonable rationale for adding a new interface, thank
> >>>> you in advance.
> >>>>
> >>>>> debug file if the platform driver exports the pin_dbg_set() helper among
> >>>>> the registered operations.
> >>>>>
> >>>>> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> >>>>
> >>>> I strongly object against this new interface.
> >>>>
> >>>> As Andy've already mentioned you have to operate with defined pin groups
> >>>> and functions, and so far you create an interface with an option to
> >>>> disasterous misusage, it shall be avoided, because there are better
> >>>> options.
> >>>>
> >>>> What's the issue with a regular declaration of pin groups and functions
> >>>> on your SoC? When it's done, you can operate on this level of abstraction,
> >>>> there is absolutely no need to add the proposed low-level debug interface.
> >>>>
> >>>
> >>> I quote Drew's words:
> >>>
> >>> "I think it could be helpful to be able to set the conf_<module>_<pin>
> >>> registers directly through debugfs as I can imagine situations where it would
> >>> be useful for testing. It is a bit dangerous as the person using it has to be
> >>> careful not to change the wrong bits, but they would need to have debugfs mounted
> >>> and permissions to write to it."
> >>>
> >>> "Bits 6:3 are related to what this subsystem would refer to as pin conf
> >>> such as slew, input enable and bias. Thus it might make sense to expose
> >>> something like a select-pinconf file to activate pin conf settings from
> >>> userspace."
> >>
> >> This is already present, please define all wanted configurations of pin
> >> groups and pin group functions, then switch them in runtime. I see no
> >> need of a coarse grained interface here...
> >>
> >>>   From the emails exchanged I seem to have understood that there is no way to
> >>> reconfigure slew rate, pull up / down and other properties on the fly.
> >>
> >> I think you still can do all the tasks mentioned above on the recent kernel,
> >> why not?
> >>
> >> I am not closely familiar with TI AM335x pinmux/pinconf controller, and if
> >> needed I can look at the datasheet, but I can imagine that there are pins,
> >> pin groups, and pin group functions controls. Board specific configuration
> >> of pinmux is given in DTS, you can modify it with DT overlays for instance,
> >> and selection of pin group functions in runtime is already possible for
> >> users in runtime. What is missing from the picture, and why do you insist
> >> on re-introduction of a much worse interface?
> >>
> >>> In the kernel version 4.1.6 that I am using on my custom board, I have fixed
> >>> the commit f07512e615dd ("pinctrl/pinconfig: add debug interface"). However,
> >>> this feature was later removed (https://lore.kernel.org/patchwork/patch/1033755/).
> >>
> >> Exactly, the feature is not needed.
> >>
> >>> The patches I've submitted implement some sort of devmem for pinmux. It too can
> >>> be used in a dangerous way, but it exists and it is used.
> >>
> >> My objection is to giving a "red button" to users, even to users of debugfs.
> >>
> >> If it's possible to keep the "dangerous goods" on developers' side only,
> >> then this shall be preferable, I believe. And fortunately there is such
> >> a mechanism.
> >>
> >>> Anyway, the implementation may be wrong but it does highlight a feature that
> >>> can be useful in testing or prototyping boards but is not present in the kernel.
> >>> Can we then find a solution that is right for everyone?
> >>
> >> Please see the method above.
> >>
> >> In my understanding the problem you are trying to solve shall be defined
> >> much more precised. Can you please elaborate on this part thoroughly?
> >>
> >> I still can not grasp a too generic explanation from you, writing of
> >> totally arbitrary data to controller registers looks senseless to me...
> >>
> >> Assume you are giving a handle to users to write arbitrary data to arbitrary
> >> I/O mem region, will it solve the problem for you? Of course yes.
> >>
> >> But does it sound like a good and acceptable solution? Of course no.
> >> Why? You need a better and more fine grained interface, namely write only
> >> to pinmux I/O mem. Great, that's provided by your change, however another
> >> important condition is still missing, a user shall write only valid data.
> >> Thus a higher level of abstraction is wanted:
> >>
> >> * writing data to I/O mem -- not good enough,
> >> * writing data to pinmux/pinconf I/O mem -- better, but not good enough,
> >> * writing *valid* data to pinmux/pinconf I/O mem -- that's right.
> > 
> > So, why not start from the feature you removed?
> > It wrote valid data to pinconf I/O mem.
> 
> Nope. The interface you've introduced allows to write invalid data, and
> the choice between writing valid data and writing invalid data is given
> to a user. Please remove this choice completely, technically it's doable.

I was not pointing to my patch, but to patch f07512e615dd ("pinctrl / pinconfig: add debug interface" 
(which has been removed). If I am not missing something it wrote data to the 
pinconf I/O mem in a more controlled way. Could we use this patch as a starting 
point for a new implementation that uses pin groups and pin group functions ?

> 
> > 
> >>
> >> The validity of data is defined by a developer, the abstraction name
> >> has been mentioned multiple times, it's pin groups and pin group functions.
> 
> Unfortunately you continue to cling to the broken interface, while I see no
> comments from you about asked to consider pin groups and pin group functions.

Could you kindly explain to me, with some practical examples, what kind of interface
would you implement ?

Thanks and regards,
Dario

> 
> --
> Best wishes,
> Vladimir
