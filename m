Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A7F2A819A
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 15:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731093AbgKEOyX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 09:54:23 -0500
Received: from foss.arm.com ([217.140.110.172]:34882 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730465AbgKEOyX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Nov 2020 09:54:23 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7C8B14BF;
        Thu,  5 Nov 2020 06:54:22 -0800 (PST)
Received: from [10.57.54.223] (unknown [10.57.54.223])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFD583F718;
        Thu,  5 Nov 2020 06:54:21 -0800 (PST)
Subject: Re: [PATCH] pinctrl: Remove hole in pinctrl_gpio_range
To:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
References: <20201028145117.1731876-1-geert+renesas@glider.be>
 <CACRpkdayhrcfyXEB4P+apjOyF=8DZgmu=_H8+aQEr4XEbB0NeQ@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <77bc14cd-7e47-6972-ee0b-fa72bb9e9fad@arm.com>
Date:   Thu, 5 Nov 2020 14:54:21 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdayhrcfyXEB4P+apjOyF=8DZgmu=_H8+aQEr4XEbB0NeQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2020-11-05 13:57, Linus Walleij wrote:
> On Wed, Oct 28, 2020 at 3:51 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> 
>> On 64-bit platforms, pointer size and alignment are 64-bit, hence two
>> 4-byte holes are present before the pins and gc members of the
>> pinctrl_gpio_range structure.  Get rid of these holes by moving the
>> pins pointer.
>>
>> This reduces kernel size of an arm64 Rockchip kernel by ca. 512 bytes.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> Compile-tested only (arm/multi_v7_defconfig and arm64/defconfig).
> 
> Patch applied.
> 
> Do you think it'd be worth it to add a check to checkpatch to suggest
> to move pointers toward the end of any struct?

For a general rule, I thought that ordering struct members largest-first 
was the conventional wisdom, since that way no sensible compiler would 
add padding between any members, only at the end?

That said, the trouble with any checkpatch rule is that people will 
inevitably try to apply it indiscriminately. With structure layout, that 
could often end up hurting readability and/or performance (via cache 
effects), while in many cases making no actual difference to the overall 
size anyway.

Robin.
