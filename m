Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9294E255FBC
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 19:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgH1RaN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 13:30:13 -0400
Received: from imap3.hz.codethink.co.uk ([176.9.8.87]:53622 "EHLO
        imap3.hz.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgH1RaN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 13:30:13 -0400
Received: from [188.210.212.0] (helo=[192.168.0.104])
        by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1kBiCU-0005jr-Sz; Fri, 28 Aug 2020 18:30:06 +0100
Subject: Re: [PATCH 1/3] pinctrl: mcp23s08: Fixup mcp23x17 regmap_config
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?Q?Jan_Kundr=c3=a1t?= <jan.kundrat@cesnet.cz>,
        Phil Reid <preid@electromag.com.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200814100357.209340-1-thomas.preston@codethink.co.uk>
 <20200814100357.209340-2-thomas.preston@codethink.co.uk>
 <CACRpkdZj-eAz0yse3OcKLiO0sPVHJMmhVZ_yLWFt1YKPe3hkRg@mail.gmail.com>
 <20200828092833.GP1891694@smile.fi.intel.com>
From:   Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <2dac46c5-b52b-5670-74ca-615d6429f34e@codethink.co.uk>
Date:   Fri, 28 Aug 2020 18:30:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200828092833.GP1891694@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28/08/2020 10:28, Andy Shevchenko wrote:
> On Fri, Aug 28, 2020 at 11:06:21AM +0200, Linus Walleij wrote:
>> On Fri, Aug 14, 2020 at 12:04 PM Thomas Preston
>> <thomas.preston@codethink.co.uk> wrote:
>>
>>> - Fix a typo where mcp23x17 configs are referred to as mcp23x16.
>>> - Fix precious range to include INTCAP{A,B}, which clear on read.
>>> - Fix precious range to include GPIOB, which clears on read.
>>> - Fix volatile range to include GPIOB, to fix debugfs registers
>>>    reporting different values than `gpioget gpiochip2 {0..15}`.
>>>
>>> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
>>
>> Since the other two patches seem wrong, please resend this one patch,
>> also include the people on TO: here: Andy, Phil and Jan, who all use
>> this chip a lot.
> 
> And it seems it combines a lot of stuff in one patch. Can we have a split with
> appropriate Fixes: tags?
> 

Yeah no problem, just looking at this now.
