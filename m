Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C66338F352
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 20:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbhEXSx7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 14:53:59 -0400
Received: from mleia.com ([178.79.152.223]:41648 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233064AbhEXSx7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 May 2021 14:53:59 -0400
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 1824F4628;
        Mon, 24 May 2021 18:52:30 +0000 (UTC)
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
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <414c9176-7922-929f-e82e-f80f07e91b2c@mleia.com>
Date:   Mon, 24 May 2021 21:52:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1972814783.387983.1621877304255@mail1.libero.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20210524_185230_121317_2B9D6C9C 
X-CRM114-Status: GOOD (  30.60  )
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Dario,

On 5/24/21 8:28 PM, Dario Binacchi wrote:
> Hi Vladimir,
> 
>> Il 21/05/2021 08:44 Vladimir Zapolskiy <vz@mleia.com> ha scritto:
>>
>>   
>> Hello Dario,
>>
>> On 5/20/21 11:27 PM, Dario Binacchi wrote:
>>> The MPUs of some architectures (e.g AM335x) must be in privileged
>>> operating mode to write on the pinmux registers. In such cases, where
>>> writes will not work from user space, now it can be done from the pins
>>
>> user space has no connection to the problem you're trying to solve.
>>
>> Please provide a reasonable rationale for adding a new interface, thank
>> you in advance.
>>
>>> debug file if the platform driver exports the pin_dbg_set() helper among
>>> the registered operations.
>>>
>>> Signed-off-by: Dario Binacchi <dariobin@libero.it>
>>
>> I strongly object against this new interface.
>>
>> As Andy've already mentioned you have to operate with defined pin groups
>> and functions, and so far you create an interface with an option to
>> disasterous misusage, it shall be avoided, because there are better
>> options.
>>
>> What's the issue with a regular declaration of pin groups and functions
>> on your SoC? When it's done, you can operate on this level of abstraction,
>> there is absolutely no need to add the proposed low-level debug interface.
>>
> 
> I quote Drew's words:
> 
> "I think it could be helpful to be able to set the conf_<module>_<pin>
> registers directly through debugfs as I can imagine situations where it would
> be useful for testing. It is a bit dangerous as the person using it has to be
> careful not to change the wrong bits, but they would need to have debugfs mounted
> and permissions to write to it."
> 
> "Bits 6:3 are related to what this subsystem would refer to as pin conf
> such as slew, input enable and bias. Thus it might make sense to expose
> something like a select-pinconf file to activate pin conf settings from
> userspace."

This is already present, please define all wanted configurations of pin
groups and pin group functions, then switch them in runtime. I see no
need of a coarse grained interface here...

>  From the emails exchanged I seem to have understood that there is no way to
> reconfigure slew rate, pull up / down and other properties on the fly.

I think you still can do all the tasks mentioned above on the recent kernel,
why not?

I am not closely familiar with TI AM335x pinmux/pinconf controller, and if
needed I can look at the datasheet, but I can imagine that there are pins,
pin groups, and pin group functions controls. Board specific configuration
of pinmux is given in DTS, you can modify it with DT overlays for instance,
and selection of pin group functions in runtime is already possible for
users in runtime. What is missing from the picture, and why do you insist
on re-introduction of a much worse interface?

> In the kernel version 4.1.6 that I am using on my custom board, I have fixed
> the commit f07512e615dd ("pinctrl/pinconfig: add debug interface"). However,
> this feature was later removed (https://lore.kernel.org/patchwork/patch/1033755/).

Exactly, the feature is not needed.

> The patches I've submitted implement some sort of devmem for pinmux. It too can
> be used in a dangerous way, but it exists and it is used.

My objection is to giving a "red button" to users, even to users of debugfs.

If it's possible to keep the "dangerous goods" on developers' side only,
then this shall be preferable, I believe. And fortunately there is such
a mechanism.

> Anyway, the implementation may be wrong but it does highlight a feature that
> can be useful in testing or prototyping boards but is not present in the kernel.
> Can we then find a solution that is right for everyone?

Please see the method above.

In my understanding the problem you are trying to solve shall be defined
much more precised. Can you please elaborate on this part thoroughly?

I still can not grasp a too generic explanation from you, writing of
totally arbitrary data to controller registers looks senseless to me...

Assume you are giving a handle to users to write arbitrary data to arbitrary
I/O mem region, will it solve the problem for you? Of course yes.

But does it sound like a good and acceptable solution? Of course no.
Why? You need a better and more fine grained interface, namely write only
to pinmux I/O mem. Great, that's provided by your change, however another
important condition is still missing, a user shall write only valid data.
Thus a higher level of abstraction is wanted:

* writing data to I/O mem -- not good enough,
* writing data to pinmux/pinconf I/O mem -- better, but not good enough,
* writing *valid* data to pinmux/pinconf I/O mem -- that's right.

The validity of data is defined by a developer, the abstraction name
has been mentioned multiple times, it's pin groups and pin group functions.

--
Best wishes,
Vladimir
