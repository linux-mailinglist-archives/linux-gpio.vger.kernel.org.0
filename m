Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28CD34E8EC1
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Mar 2022 09:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236695AbiC1HOB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Mar 2022 03:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiC1HOB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Mar 2022 03:14:01 -0400
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190B452B1E
        for <linux-gpio@vger.kernel.org>; Mon, 28 Mar 2022 00:12:20 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by router.aksignal.cz (Postfix) with ESMTP id 6275C453DD;
        Mon, 28 Mar 2022 09:12:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
        by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
        with LMTP id N0uakXN2AbiN; Mon, 28 Mar 2022 09:12:16 +0200 (CEST)
Received: from [172.25.161.48] (unknown [83.240.30.185])
        (Authenticated sender: jiri.prchal@aksignal.cz)
        by router.aksignal.cz (Postfix) with ESMTPSA id 8D25F453DA;
        Mon, 28 Mar 2022 09:12:16 +0200 (CEST)
Message-ID: <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
Date:   Mon, 28 Mar 2022 09:12:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [libgpiod] bug: pull-up does not work
Content-Language: en-US
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl,
        andy.shevchenko@gmail.com
References: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
 <20220325145742.GA46960@sol>
 <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
 <20220325160146.GA49114@sol>
From:   =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
In-Reply-To: <20220325160146.GA49114@sol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 25. 03. 22 17:01, Kent Gibson wrote:
> On Fri, Mar 25, 2022 at 04:13:11PM +0100, Jiří Prchal wrote:
>>
>>
>> On 25. 03. 22 15:57, Kent Gibson wrote:
>>> On Fri, Mar 25, 2022 at 11:02:07AM +0100, Jiří Prchal wrote:
>>>> Hi,
>>>> since in debian is 1.6.2 and pull-up doesn't work so I cloned git, branch
>>>> next/libgpiod-2.0 and compiled libgpiod and tools, but no luck, same result.
>>>>
>>>
>>> You mean it doesn't work for you on your platform.
>>>
>>> The libgpiod-2.0 branch is a work in progress and should not be considered
>>> the place to go to find solutions to problems with v1.6.
>>> Not that I'm saying that the v2 branch doesn't work, I'm actually pretty
>>> sure it does, but its purpose is to switch to the latest kernel uAPI, not
>>> to provide fixes, should they be needed, for v1.6.
>> Just thought api v1 doesn't support pull-ups so tried v2.
> 
> v1 does support bias since Linux v5.5, and libgpiod added support in v1.5.
> 
>>>
>>>> ~# uname -r
>>>> 5.17.0-rc7_cpm9g25
>>>>
>>>> floating pins should go with pull-up/down
>>>> ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
>>>> 0 0 0 0 0 0 0 0
>>>> ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
>>>> 1 1 0 0 0 0 0 0
>>>> ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
>>>> 0 1 0 1 0 0 0 0
>>>>
>>>> ~# gpioget -v
>>>> gpioget (libgpiod) v2.0-devel
>>>>
>>>> Whats wrong with it?
>>>
>>> You forgot to mention which of those pins are floating.
>> All of them.
>>> Or what gpiochip3 is and whether it supports biasing.
>> AT91SAM9G25, hw supports pull-ups.
>>>
>>> So does your chip support pull-up/down?
>>> The kernel can only enable it if the hardware and pinctrl driver supports it.
>> Is there possibility that pinctrl doesn't support it? I think other gpios
>> used in kernel are with pull-up.
>> Example:
>> pinctrl@fffff400 {
>> 	1wire {
>> 		pinctrl_1wire: 1wire-0 {
>> 			atmel,pins = <AT91_PIOC 0 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP>; /* PC0
>> PIO, pull-up */
>> 		};
>> 	};
>> };
>>
> 
> Pinctrl and device tree are outside my area, but my understanding is
> that setting via DT is a separate interface, so while it may be
> supported by DT it may not be via the gpiolib interface.
> But I will defer to anyone else on that.
> (CCing in Andy since I'm pretty sure he would know)
> 
> Not sure which pinctrl is relevant for your case.
> pinctrl-at91 doesn't appear to support setting the pull-up via the gpiolib
> interface, but pinctrl-at91-pio4 does, so my guess would be you are using
> the pinctrl-at91.
pinctrl-at91-pio4 didn't help, syminfo says "for Atmel PIO4 controller 
available on sama5d2 SoC" but my is sam9g25.
How can I find out if it supports gpiolib?
> 
> But again, this is outside my area so you would need to confirm that
> yourself or get feedback from someone else.
> If you determine that you are using a pinctrl that supports setting
> bias via gpiolib then we'll have to do some more digging.
> 
> Cheers,
> Kent.
> 
Thanks
Jiri
