Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6CB24E7680
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Mar 2022 16:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356744AbiCYPP2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Mar 2022 11:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377519AbiCYPOv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Mar 2022 11:14:51 -0400
Received: from router.aksignal.cz (router.aksignal.cz [62.44.4.214])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7FA424080
        for <linux-gpio@vger.kernel.org>; Fri, 25 Mar 2022 08:13:15 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by router.aksignal.cz (Postfix) with ESMTP id 5F09A420E0;
        Fri, 25 Mar 2022 16:13:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at router.aksignal.cz
Received: from router.aksignal.cz ([127.0.0.1])
        by localhost (router.aksignal.cz [127.0.0.1]) (amavisd-new, port 10026)
        with LMTP id OB_JT6SVLoX8; Fri, 25 Mar 2022 16:13:12 +0100 (CET)
Received: from [172.25.161.48] (unknown [83.240.30.185])
        (Authenticated sender: jiri.prchal@aksignal.cz)
        by router.aksignal.cz (Postfix) with ESMTPSA id 6A8D4420DE;
        Fri, 25 Mar 2022 16:13:12 +0100 (CET)
Message-ID: <48129be0-f29d-96ae-cec3-2b4a2ee10aa8@aksignal.cz>
Date:   Fri, 25 Mar 2022 16:13:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [libgpiod] bug: pull-up does not work
Content-Language: en-US
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, brgl@bgdev.pl
References: <62b30818-92fa-e44c-c9dd-fd8cc49a6e6a@aksignal.cz>
 <20220325145742.GA46960@sol>
From:   =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
In-Reply-To: <20220325145742.GA46960@sol>
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



On 25. 03. 22 15:57, Kent Gibson wrote:
> On Fri, Mar 25, 2022 at 11:02:07AM +0100, Jiří Prchal wrote:
>> Hi,
>> since in debian is 1.6.2 and pull-up doesn't work so I cloned git, branch
>> next/libgpiod-2.0 and compiled libgpiod and tools, but no luck, same result.
>>
> 
> You mean it doesn't work for you on your platform.
> 
> The libgpiod-2.0 branch is a work in progress and should not be considered
> the place to go to find solutions to problems with v1.6.
> Not that I'm saying that the v2 branch doesn't work, I'm actually pretty
> sure it does, but its purpose is to switch to the latest kernel uAPI, not
> to provide fixes, should they be needed, for v1.6.
Just thought api v1 doesn't support pull-ups so tried v2.
> 
>> ~# uname -r
>> 5.17.0-rc7_cpm9g25
>>
>> floating pins should go with pull-up/down
>> ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
>> 0 0 0 0 0 0 0 0
>> ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
>> 1 1 0 0 0 0 0 0
>> ~# gpioget -B pull-up 3 6 8 10 12 14 16 18 20
>> 0 1 0 1 0 0 0 0
>>
>> ~# gpioget -v
>> gpioget (libgpiod) v2.0-devel
>>
>> Whats wrong with it?
> 
> You forgot to mention which of those pins are floating.
All of them.
> Or what gpiochip3 is and whether it supports biasing.
AT91SAM9G25, hw supports pull-ups.
> 
> So does your chip support pull-up/down?
> The kernel can only enable it if the hardware and pinctrl driver supports it.
Is there possibility that pinctrl doesn't support it? I think other 
gpios used in kernel are with pull-up.
Example:
pinctrl@fffff400 {
	1wire {
		pinctrl_1wire: 1wire-0 {
			atmel,pins = <AT91_PIOC 0 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP>; /* 
PC0 PIO, pull-up */
		};
	};
};

> If the hardware doesn't support it then attempting to set the
> pull-up/down is quietly ignored, which would be consistent with what you
> are seeing.
> 
> Cheers,
> Kent.
> 
