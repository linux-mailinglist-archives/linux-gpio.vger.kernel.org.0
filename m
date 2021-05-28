Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1E3393ECD
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 10:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234405AbhE1Ig2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 04:36:28 -0400
Received: from mleia.com ([178.79.152.223]:40780 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230080AbhE1Ig0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 May 2021 04:36:26 -0400
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 92AC35A41;
        Fri, 28 May 2021 08:34:49 +0000 (UTC)
Subject: Re: [PATCH v3 2/3] pinctrl: core: configure pinmux from pins debug
 file
To:     Dario Binacchi <dariobin@libero.it>, linux-kernel@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>,
        Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org
References: <20210520202730.4444-1-dariobin@libero.it>
 <20210520202730.4444-3-dariobin@libero.it>
 <87ea9971-9e15-c595-95cc-14c68b0b68d8@mleia.com>
 <1972814783.387983.1621877304255@mail1.libero.it>
 <414c9176-7922-929f-e82e-f80f07e91b2c@mleia.com>
 <106030092.519428.1622143415836@mail1.libero.it>
 <b25a0e33-d7e8-322a-2a73-bda6e88c8f8b@mleia.com>
 <2062056721.520514.1622147634190@mail1.libero.it>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <3572b776-e39b-4c23-068a-a4491860bfad@mleia.com>
Date:   Fri, 28 May 2021 11:34:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2062056721.520514.1622147634190@mail1.libero.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20210528_083449_628369_1D40431D 
X-CRM114-Status: GOOD (  35.92  )
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Dario,

On 5/27/21 11:33 PM, Dario Binacchi wrote:
> Hi Vladimir,
> 
>> Il 27/05/2021 21:57 Vladimir Zapolskiy <vz@mleia.com> ha scritto:
>>
>>   
>> Hi Dario,
>>
>> On 5/27/21 10:23 PM, Dario Binacchi wrote:
>>> Hi Vladimir,
>>>
>>>> Il 24/05/2021 20:52 Vladimir Zapolskiy <vz@mleia.com> ha scritto:
>>>>
>>>>    
>>>> Hi Dario,
>>>>
>>>> On 5/24/21 8:28 PM, Dario Binacchi wrote:
>>>>> Hi Vladimir,
>>>>>
>>>>>> Il 21/05/2021 08:44 Vladimir Zapolskiy <vz@mleia.com> ha scritto:
>>>>>>
>>>>>>     
>>>>>> Hello Dario,
>>>>>>
>>>>>> On 5/20/21 11:27 PM, Dario Binacchi wrote:
>>>>>>> The MPUs of some architectures (e.g AM335x) must be in privileged
>>>>>>> operating mode to write on the pinmux registers. In such cases, where
>>>>>>> writes will not work from user space, now it can be done from the pins
>>>>>>
>>>>>> user space has no connection to the problem you're trying to solve.
>>>>>>
>>>>>> Please provide a reasonable rationale for adding a new interface, thank
>>>>>> you in advance.
>>>>>>
>>>>>>> debug file if the platform driver exports the pin_dbg_set() helper among
>>>>>>> the registered operations.
>>>>>>>
>>>>>>> Signed-off-by: Dario Binacchi <dariobin@libero.it>
>>>>>>
>>>>>> I strongly object against this new interface.
>>>>>>
>>>>>> As Andy've already mentioned you have to operate with defined pin groups
>>>>>> and functions, and so far you create an interface with an option to
>>>>>> disasterous misusage, it shall be avoided, because there are better
>>>>>> options.
>>>>>>
>>>>>> What's the issue with a regular declaration of pin groups and functions
>>>>>> on your SoC? When it's done, you can operate on this level of abstraction,
>>>>>> there is absolutely no need to add the proposed low-level debug interface.
>>>>>>
>>>>>
>>>>> I quote Drew's words:
>>>>>
>>>>> "I think it could be helpful to be able to set the conf_<module>_<pin>
>>>>> registers directly through debugfs as I can imagine situations where it would
>>>>> be useful for testing. It is a bit dangerous as the person using it has to be
>>>>> careful not to change the wrong bits, but they would need to have debugfs mounted
>>>>> and permissions to write to it."
>>>>>
>>>>> "Bits 6:3 are related to what this subsystem would refer to as pin conf
>>>>> such as slew, input enable and bias. Thus it might make sense to expose
>>>>> something like a select-pinconf file to activate pin conf settings from
>>>>> userspace."
>>>>
>>>> This is already present, please define all wanted configurations of pin
>>>> groups and pin group functions, then switch them in runtime. I see no
>>>> need of a coarse grained interface here...
>>>>
>>>>>    From the emails exchanged I seem to have understood that there is no way to
>>>>> reconfigure slew rate, pull up / down and other properties on the fly.
>>>>
>>>> I think you still can do all the tasks mentioned above on the recent kernel,
>>>> why not?
>>>>
>>>> I am not closely familiar with TI AM335x pinmux/pinconf controller, and if
>>>> needed I can look at the datasheet, but I can imagine that there are pins,
>>>> pin groups, and pin group functions controls. Board specific configuration
>>>> of pinmux is given in DTS, you can modify it with DT overlays for instance,
>>>> and selection of pin group functions in runtime is already possible for
>>>> users in runtime. What is missing from the picture, and why do you insist
>>>> on re-introduction of a much worse interface?
>>>>
>>>>> In the kernel version 4.1.6 that I am using on my custom board, I have fixed
>>>>> the commit f07512e615dd ("pinctrl/pinconfig: add debug interface"). However,
>>>>> this feature was later removed (https://lore.kernel.org/patchwork/patch/1033755/).
>>>>
>>>> Exactly, the feature is not needed.
>>>>
>>>>> The patches I've submitted implement some sort of devmem for pinmux. It too can
>>>>> be used in a dangerous way, but it exists and it is used.
>>>>
>>>> My objection is to giving a "red button" to users, even to users of debugfs.
>>>>
>>>> If it's possible to keep the "dangerous goods" on developers' side only,
>>>> then this shall be preferable, I believe. And fortunately there is such
>>>> a mechanism.
>>>>
>>>>> Anyway, the implementation may be wrong but it does highlight a feature that
>>>>> can be useful in testing or prototyping boards but is not present in the kernel.
>>>>> Can we then find a solution that is right for everyone?
>>>>
>>>> Please see the method above.
>>>>
>>>> In my understanding the problem you are trying to solve shall be defined
>>>> much more precised. Can you please elaborate on this part thoroughly?
>>>>
>>>> I still can not grasp a too generic explanation from you, writing of
>>>> totally arbitrary data to controller registers looks senseless to me...
>>>>
>>>> Assume you are giving a handle to users to write arbitrary data to arbitrary
>>>> I/O mem region, will it solve the problem for you? Of course yes.
>>>>
>>>> But does it sound like a good and acceptable solution? Of course no.
>>>> Why? You need a better and more fine grained interface, namely write only
>>>> to pinmux I/O mem. Great, that's provided by your change, however another
>>>> important condition is still missing, a user shall write only valid data.
>>>> Thus a higher level of abstraction is wanted:
>>>>
>>>> * writing data to I/O mem -- not good enough,
>>>> * writing data to pinmux/pinconf I/O mem -- better, but not good enough,
>>>> * writing *valid* data to pinmux/pinconf I/O mem -- that's right.
>>>
>>> So, why not start from the feature you removed?
>>> It wrote valid data to pinconf I/O mem.
>>
>> Nope. The interface you've introduced allows to write invalid data, and
>> the choice between writing valid data and writing invalid data is given
>> to a user. Please remove this choice completely, technically it's doable.
> 
> I was not pointing to my patch, but to patch f07512e615dd ("pinctrl / pinconfig: add debug interface"
> (which has been removed). If I am not missing something it wrote data to the
> pinconf I/O mem in a more controlled way. 

Right, but still it's not good enough, the reasons are given in the message
of the commit, which reverts the change. And again and again, it is not based
on the most reasonable user-visible abstractions as pin groups and functions.

> Could we use this patch as a starting point for a new implementation that
> uses pin groups and pin group functions ?

Well, you can include this patch into your development process as one of
the initial stages, but it makes no sense to resurrect it in the vanilla.

>>
>>>
>>>>
>>>> The validity of data is defined by a developer, the abstraction name
>>>> has been mentioned multiple times, it's pin groups and pin group functions.
>>
>> Unfortunately you continue to cling to the broken interface, while I see no
>> comments from you about asked to consider pin groups and pin group functions.
> 
> Could you kindly explain to me, with some practical examples, what kind of interface
> would you implement ?
> 

So far I'm quite happy with device tree overlays, for me it gives a solution
to a problem which you're trying to address, but that's my guess only, because
I still don't quite understand what do you seek for... Changing pin slew rates
in runtime or something else? Why can't your keep this strange function out of
vanilla or just make it specific to the AM335x controller?

Any reasonable pinmux/pinctrl "debug" interface anyway should be based on
board device trees/firmware, that's the right place to describe SoC/board
specific valid configurations of the controller.

--
Best wishes,
Vladimir

