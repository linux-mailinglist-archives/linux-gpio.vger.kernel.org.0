Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 692EF1AC55A
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 16:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393952AbgDPORN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 10:17:13 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50568 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393942AbgDPORK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 10:17:10 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03GEGxtb079531;
        Thu, 16 Apr 2020 09:16:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587046619;
        bh=9BclR6MwFJOWMIsrTHHHb17/A/NQ6wqTWrRF52eywVw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=A2QRGnS85VX3U7rTWAsDNwwo0CXUbckK0r9NpVKpTJe8IuPigT8Yzu2hOwc2DuwP5
         D5fdJXTvMjpUbXyajyqopUsGBoSHeZwaxhmyIpvrfLPqY6UIkRbo4ZrVTfu1VJCC8H
         HZQj5Cg6r2u5jZhAOwotB/jchmO9mYSn+Qj3diEk=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03GEGxgU077547
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Apr 2020 09:16:59 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Apr 2020 09:16:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Apr 2020 09:16:58 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03GEGqhp009673;
        Thu, 16 Apr 2020 09:16:54 -0500
Subject: Re: gpio-omap: add support gpiolib bias (pull-up/down) flags?
To:     Drew Fustini <drew@pdp7.com>,
        Robert Nelson <robertcnelson@gmail.com>
CC:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
References: <CAEf4M_Du6Egn-3nZHtSnMMwohc+-DyEdtWU5DqSJi71+nDthFw@mail.gmail.com>
 <CACRpkdaPoMGZ7jGh6j4dYexx+qCcoMQ37vS7kbpf=3TtcA9zQQ@mail.gmail.com>
 <CAEf4M_B_sxOiKFnEVUrx00RE2MaMA98LpijNhp0EVY11eRAXHg@mail.gmail.com>
 <CAD6h2NT840zMfwaJatfKzai8QjZEQmF5v0xgE+9ngSJJ+Qy+6g@mail.gmail.com>
 <20200413123921.GA32586@x1> <578a51c3-9cb4-91f9-4735-c512bf75553c@ti.com>
 <CAOCHtYg=rM_zP6Wr3bWKfvGpeK7sXLj6GLN3DXSh8JgfqDTcCA@mail.gmail.com>
 <db5e49dc-41b4-2ba5-87b3-f345749d7984@ti.com>
 <CAOCHtYgNH-OUWdKgKLr7U8Zy2OZb=P9Rpsv4mFii+VwU7h-vGA@mail.gmail.com>
 <20200415233712.GA16167@x1>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <495f118d-380d-a994-d8f9-bacdfe4efb85@ti.com>
Date:   Thu, 16 Apr 2020 17:16:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415233712.GA16167@x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 16/04/2020 02:37, Drew Fustini wrote:
> On Wed, Apr 15, 2020 at 08:59:09AM -0500, Robert Nelson wrote:
>> On Wed, Apr 15, 2020 at 8:47 AM Grygorii Strashko
>> <grygorii.strashko@ti.com> wrote:
>>> On 15/04/2020 16:20, Robert Nelson wrote:
>>>> Hi Grygorii,
>>>>
>>>> On Wed, Apr 15, 2020 at 8:15 AM Grygorii Strashko
>>>> <grygorii.strashko@ti.com> wrote:
>>>>>
>>>>> For this platforms the dynamic GPIO muxing/configuration is not supported, and GPIO block by itself
>>>>> does not provide such functions as pullup/pulldown.
>>>>
>>>> Correct, that's the state today, while Drew is investing time into
>>>> trying to figure out how to properly extend this feature into our
>>>> platform.
>>>
>>> Sry, but it's not clear what's the final target (at least from public part of this thread).
>>
>> We are mainly targeting am335x based devices.  Today (well last few
>> years) we've utilized a "hack-ish" kernel module (bone-pinmux-helper)
>> to allow users to overide/change the pinmux-ing directly from
>> user-space...  (This evil module allows us to specify a list of
>> options for each pin, thus users can easily configure specifies of the
>> pin, aka gpio_pd/gpio_pu/etc from user-space...).  Since that time,
>> mainline has now grown a generic gpio pull-up/pull-down functionality,
>> with the ability to re-control these values directly from a generic
>> gpio library (libgpiod).
> 
> Hello Grygorii -
> 
> As Robert described, I wanted to make us of the new support for bias
> flags in the gpiolib uapi which allows userspace libraries like libgpiod
> set pull-up or pull-down on lines [0].
> 
> Is there no way for gpio-omap to call into the pinctrl-single backend to
> set the bias bits (PULLUDEN and PULLTYPESEL) in pad control registers?
> 

I'm not sure how this could help ;( If there were dedicated GPIO pins - then yes.
But on all Sitara SoCs the pins are multi-functional and GPIO is not a primary function.
So to use some PIN as GPIO the MUX_MODE has to be *carefully* changed - and for this DT updated.
Which, in turn, means proper pull-up/pull-down can also be configured at the same time.
And all above is static configuration - even if it involves connecting different modules to BB.

(Changing MUX_MODE from user space sounds very unsafe for me.)

Next, how it can be ensured that User space will not corrupt PIN which is not a GPIO?
Usually only set of GPIOs per bank  are really muxed out as GPIO and, right now, there is no
way to say which ones, because pinmuxing and GPIOs configurations are going through different frameworks.

Lets say request come to configure GPIO1.20 to PULLUDEN - there is no way to be sure this pin
is actually pinmuxed as GPIO and not rgmii2_td1. And everything depends on DT and User qualification.
Now this is safe - just User will not get what he wants if he misses with GPIO number.
But if GPIO driver will be allowed to go and change some pinmux - it can kill rgmii2.

Or do you have more global ideas for pinmux management?

-- 
Best regards,
grygorii
