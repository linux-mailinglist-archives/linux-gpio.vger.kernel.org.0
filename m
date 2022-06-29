Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4526F55FE5C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 13:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbiF2LSB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 07:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbiF2LSB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 07:18:01 -0400
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7863E5D8
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 04:17:58 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by router.aksignal.cz (Postfix) with ESMTP id 47092416C1;
        Wed, 29 Jun 2022 13:17:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
        by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
        with LMTP id ap1OsCDxGBJt; Wed, 29 Jun 2022 13:17:55 +0200 (CEST)
Received: from [172.28.0.3] (unknown [193.150.13.224])
        (Authenticated sender: jiri.prchal@aksignal.cz)
        by router.aksignal.cz (Postfix) with ESMTPSA id 39147416BF;
        Wed, 29 Jun 2022 13:17:55 +0200 (CEST)
Message-ID: <b8d63150-cd1d-692a-9470-d75278135350@aksignal.cz>
Date:   Wed, 29 Jun 2022 13:17:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [libgpiod] feature request: output state read and sustain
Content-Language: cs
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
References: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
 <20220325145742.GA46960@sol>
 <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
 <20220325160146.GA49114@sol>
 <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
 <20220328080841.GA14353@sol>
 <757ac53e-07bb-1ffa-2734-08c1c321ff0e@aksignal.cz>
 <20220629072353.GA18684@sol>
 <a1cdd48d-0da9-b61a-3530-ef2e99539b74@aksignal.cz>
 <CAHp75Vd2=XAD_qmsYp0AWoi2mryR-FFq5ipFqa4d7qB+bFkS0g@mail.gmail.com>
 <20220629104757.GA29289@sol>
From:   =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
In-Reply-To: <20220629104757.GA29289@sol>
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



On 29. 06. 22 12:47, Kent Gibson wrote:
> On Wed, Jun 29, 2022 at 12:27:13PM +0200, Andy Shevchenko wrote:
>> On Wed, Jun 29, 2022 at 11:27 AM Jiří Prchal <jiri.prchal@aksignal.cz> wrote:
>>> On 29. 06. 22 9:23, Kent Gibson wrote:
>>>> On Tue, Jun 28, 2022 at 03:08:20PM +0200, Jiří Prchal wrote:
>>
>>>>> using new libgpiod / chardev driver, is there any way to get state of
>>>>> output? I mean one process sets it for example to 1 and another process
>>>>> reads this output state for example to show that on web page.
>>
>> I'm not sure it's guaranteed to read output back. Some (b0rken?) GPIO
>> chips may not allow this on H/W level and when reading they always
>> will get the value of Input Buffer (now imagine if the line is
>> configured as Output with Input being disconnected from the physical
>> pin).
>>
> 
> Agreed.  Userspace should know the value they set the output to, and so
> have no need to read it back.  GPIO is not NVM.
Not NVM, bat RAM and it keeps their data untill reset, after reset it has specific value (usually 0)
I haven't seen HW without possibility of reading back output register, but I don't say there couldn't be such one.

> 
> The only time it makes sense to me to go to the hardware for output
> values is for open-drain outputs, but as you say, even then it would
> depend in the hardware and driver supporting it. And for those cases it
> might be better to explicitly emulate open-drain and switch the line to
> an input when not being actively drive.
Open-drain outputs as many HW as I know has separate register for output to switch on and off the tranzistor and input register to read value on pin.
So 2 values are needed from o-d outputs. OK, first could be write only and second read only.
> 
>>>>> I have to say that old sysfs interface was more user friendly...
>>
>> And much more buggy and PITA.
>>
>>>> "new" being anything since Linux 4.8 ;-)?
>>>> And strictly speaking it isn't a driver - libgpiod and the GPIO subsystem
>>>> provide an interface to the chip driver.  More on that later.
>>>>
>>>> Only the process holding the line has access to the current value.
>>>> If you need that value elsewhere then it has to be published by that
>>>> process - it is not available through the GPIO API itself.
>>>> There is nothing preventing that process publishing the value
>>>> in whatever way is appropriate to your application.
>>>> e.g. write it to a file that can be read by your webapp, just as it
>>>> would from sysfs.
>>>>
>>>> Less restrictive access models are frequently "more user friendly", but
>>>> have other issues. e.g. some misbehaving process just reset your
>>>> modem for you.
>>>>
>>>> And sysfs has other great features like being slow and being complete
>>>> rubbish for events on input lines.
>>>>
>>>>> And at second: it would be better to NOT "the state of a GPIO line
>>>>> controlled over the character device reverts to default when the last
>>>>> process referencing the file descriptor representing the device file exits."
>>>>> "Set and forget" behavior is more natural to what some gpios are used. For
>>>>> example resetting external modems, need set 1 for short time, then to 0 and
>>>>> leave it for long long time until next reset is needed. It's non sense to
>>>>> keep running some process only to keep output at 0.
>>>>
>>>> Agreed, that might be more natural, but that behaviour is not by choice,
>>>> it is a consequence of the kernel internals.  In short, if the GPIO
>>>> subsystem does not hold the chip then the driver is free to do what it
>>>> likes to it.
>>>> So when you release a line all bets are off.
>>>> It may stay where you left it, but it may not - it may even switch to an
>>>> input - it depends on the driver.
>>> Does it mean that without changing this particular line it could be changed? For example by setting another line in chip?
>>
>> No, it's only about the line in question.
>>
>>>> If it works for you that's great, but without major kernel changes
>>>> libgpiod has no better option than to provide the caveat as the "set and
>>>> forget" behaviour is something that it cannot guarantee.
>>> Than is only way to write my own user space driver simulating sysfs? Or what is the right way of this scenario:
>>> start proces -> gpioset =1 -> sleep -> gpioset =0 -> do other things
>>> when the proces dies systemd will start it again
>>
>> Do not use shell. Use proper programming language that may give you an
>> easier way of handling this, i.e. _context_. Shell tools are
>> _context-less_ and here is the problem you are trying to solve, but
>> from the wrong end.
>>
> 
> Actually my proposed gpioset for v2 will support running interactively
> so it can maintain context and be driven from shell - for cases where
> basic scripting will suffice.
It would be nice.

Jiri
> 
> Cheers,
> Kent.
