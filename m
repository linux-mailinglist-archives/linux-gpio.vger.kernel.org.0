Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F02F55FF03
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Jun 2022 13:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbiF2LsX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Jun 2022 07:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiF2LsW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2022 07:48:22 -0400
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB32C2DF0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2022 04:48:19 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by router.aksignal.cz (Postfix) with ESMTP id 0930D4E7DF;
        Wed, 29 Jun 2022 13:48:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
        by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
        with LMTP id bgInrR02r2Ex; Wed, 29 Jun 2022 13:48:17 +0200 (CEST)
Received: from [172.28.0.3] (unknown [193.150.13.224])
        (Authenticated sender: jiri.prchal@aksignal.cz)
        by router.aksignal.cz (Postfix) with ESMTPSA id 703774E7DE;
        Wed, 29 Jun 2022 13:48:17 +0200 (CEST)
Message-ID: <3b7e2035-a829-b99e-f51b-0bcf04ccdfc6@aksignal.cz>
Date:   Wed, 29 Jun 2022 13:48:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [libgpiod] feature request: output state read and sustain
Content-Language: en-US
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
References: <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
 <20220325160146.GA49114@sol>
 <1d43c967-e3c9-21a8-3040-2db54ba85bdf@aksignal.cz>
 <20220328080841.GA14353@sol>
 <757ac53e-07bb-1ffa-2734-08c1c321ff0e@aksignal.cz>
 <20220629072353.GA18684@sol>
 <a1cdd48d-0da9-b61a-3530-ef2e99539b74@aksignal.cz>
 <CAHp75Vd2=XAD_qmsYp0AWoi2mryR-FFq5ipFqa4d7qB+bFkS0g@mail.gmail.com>
 <20220629104757.GA29289@sol>
 <b8d63150-cd1d-692a-9470-d75278135350@aksignal.cz>
 <20220629112519.GA30910@sol>
From:   =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
In-Reply-To: <20220629112519.GA30910@sol>
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



On 29. 06. 22 13:25, Kent Gibson wrote:
> On Wed, Jun 29, 2022 at 01:17:54PM +0200, Jiří Prchal wrote:
>>
>>
>> On 29. 06. 22 12:47, Kent Gibson wrote:
>>> On Wed, Jun 29, 2022 at 12:27:13PM +0200, Andy Shevchenko wrote:
>>>> On Wed, Jun 29, 2022 at 11:27 AM Jiří Prchal <jiri.prchal@aksignal.cz> wrote:
>>>>> On 29. 06. 22 9:23, Kent Gibson wrote:
>>>>>> On Tue, Jun 28, 2022 at 03:08:20PM +0200, Jiří Prchal wrote:
>>>>
>>>>>>> using new libgpiod / chardev driver, is there any way to get state of
>>>>>>> output? I mean one process sets it for example to 1 and another process
>>>>>>> reads this output state for example to show that on web page.
>>>>
>>>> I'm not sure it's guaranteed to read output back. Some (b0rken?) GPIO
>>>> chips may not allow this on H/W level and when reading they always
>>>> will get the value of Input Buffer (now imagine if the line is
>>>> configured as Output with Input being disconnected from the physical
>>>> pin).
>>>>
>>>
>>> Agreed.  Userspace should know the value they set the output to, and so
>>> have no need to read it back.  GPIO is not NVM.
>> Not NVM, bat RAM and it keeps their data untill reset, after reset it has specific value (usually 0)
>> I haven't seen HW without possibility of reading back output register, but I don't say there couldn't be such one.
>>
> 
> No, no it is not RAM.
> 
> And I have seen hardware where you can't read back the output.
> And so has Andy apparently.
> That is the problem - there is lots of hardware out there and we are
> trying to provide a consistent interface to inconsistent hardware.
OK, but if hw supports it why not provide it. And for hw without support keep it's value in memory? Or return to user space with errno indicating "no support"?
> 
> Cheers,
> Kent.
