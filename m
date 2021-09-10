Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86625407238
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Sep 2021 21:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233384AbhIJUAx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Sep 2021 16:00:53 -0400
Received: from wes1-so1-redir.wedos.net ([46.28.106.44]:39507 "EHLO
        wes1-so1.wedos.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233114AbhIJUAw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Sep 2021 16:00:52 -0400
Received: from [192.168.42.180] (pc-213-194-230-47.valachnet.cz [213.194.230.47])
        by wes1-so1.wedos.net (Postfix) with ESMTPSA id 4H5mtK3bCKzpm;
        Fri, 10 Sep 2021 21:59:37 +0200 (CEST)
Subject: Re: [libgpiod] Add Lua 5.1 binding for libgpiod v1.0.x branch
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <8a49314e-f727-aace-9c54-122b038d1fad@acrios.com>
 <CAMRc=MeMhxv60r4M-Obi1TYo97n0YaYYyRNR7HNLT5ousbUYAg@mail.gmail.com>
From:   "Marek Novak | ACRIOS Systems s.r.o." <novak@acrios.com>
Message-ID: <4e125d57-0cf3-16ea-96de-c6fbbafd5bd9@acrios.com>
Date:   Fri, 10 Sep 2021 21:59:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMRc=MeMhxv60r4M-Obi1TYo97n0YaYYyRNR7HNLT5ousbUYAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09. 09. 21 10:20, Bartosz Golaszewski wrote:
> On Tue, Sep 7, 2021 at 6:10 PM Marek Novak | ACRIOS Systems s.r.o.
> <novak@acrios.com> wrote:
>>
>>   From ca1b5688de2d1cb63bb9823e28b87c52f23df449 Mon Sep 17 00:00:00 2001
>> From: Marek NOVAK <novak@acrios.com>
>> Date: Fri, 3 Sep 2021 18:41:02 +0200
>> Subject: [PATCH] Adding Lua 5.1 bindings as 'gpiod' Lua module
>>
>> - Adding bindings directory with wrapper code
>> - Adding Makefile.am for building and distributing as a Lua module
>> - Adding --enable-bindings-lua option for autogen.sh
>> - Adding examples with basic lua gpioset and gpioget implementation
>> - Output, input and event input with new(), get(), set() and wait()
>>     methods are implemented.
>>
>> Signed-off-by: Marek NOVAK <novak@acrios.com>
>> ---
> 
> Hi Marek!
> 
> Thanks for the patch, any new bindings are much appreciated! However
> the 1.0.x branch has been unsupported for over 3 years. Why did you
> decide to base your work on this one?
> 
> The currently supported branch for the 1.x series is 1.6.x but even
> then I don't really want to add new features to it as we're currently
> developing the 2.0 version which will become the new preferred base
> for all new work. Any chance you could base your work on the
> next/libgpiod-2.0 branch just like Viresh did with his Rust bindings?
> 
> Bartosz
> 

Hi Bartosz!

Thanks for checking my patch. I later realized it was not well processed 
when sent using Thunderbird (I will use git send-email next time). I 
also learnt that on some systems, the macros from ax_lua.m4 are not 
available and I added it in a m4 folder. I have a v2 of the patch almost 
ready (build being tested on different environments by my colleagues). 
So I can post it here if anybody needs it on 1.x version supported...

To my motivation to select v1.0.x branch - I wanted to select a 1.x 
branch as base since this one is used in OpenWRT distribution 
(https://github.com/openwrt/packages/blob/openwrt-21.02/libs/libgpiod/Makefile). 
And my target use-case is to have Lua support for GPIO interaction there 
for some late device-specific initialization scripts.

However, I think I can switch to a 2.x version of libgpiod on our fork 
of OpenWRT v21.02 and base my contribution on it... Currently I use a 
package which builds Lua binding "out of tree", being quite ugly, but 
available for public here (https://sw.acrios.com/acrios/lua-gpiod). I 
could / should maybe also support not just Lua 5.1, but also the other 
actively used version of Lua...

I will update my contibution to 2.x, test it and then post it here...

---
Marek Novak
ACRIOS Systems s.r.o.


