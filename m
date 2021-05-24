Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD34F38F242
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 19:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233022AbhEXR3z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 13:29:55 -0400
Received: from smtp-18-i2.italiaonline.it ([213.209.12.18]:40535 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232693AbhEXR3z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 May 2021 13:29:55 -0400
Received: from oxapps-32-144.iol.local ([10.101.8.190])
        by smtp-18.iol.local with ESMTPA
        id lENMlcrRCgCmjlENMlpOi4; Mon, 24 May 2021 19:28:24 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1621877305; bh=0zgtXDd54u0EeN7Gh7fxKK+qLGMlsdc1bj99HlF/eZg=;
        h=From;
        b=SG6yeVsyOwxGiHrYb0xgoCqjludbnNV3xJSStse88XvN8HBT4ziOyjLJe0Gqb0wd1
         edZmYstscK/UAMAsVpKMzOmZQOjkBbv3YnmoRVPE5GkLlsTFUUwHjaS0WHHSIe0fwg
         YXL6gLnZTaNpUw4ArJfM8qK1L5ocy98l8kriS4h+JAYOedKVuUQ5gwxgqWIZA3gCHX
         81N+7Ow5Su0frEtrpQKUtZ3I0qmXXcjfMEGDaZWFGztBMzwiRo/pdC3tD6JXBaxyBg
         dO5L1cjLOt3O8mxgQAtc1UXlOw3O+Jc9BW8fkcwO+kfLM0lhQF1a1FJUi7hbrNmxcO
         Y5QmtV5s1rTgw==
X-CNFS-Analysis: v=2.4 cv=X5uXlEfe c=1 sm=1 tr=0 ts=60abe239 cx=a_exe
 a=+LyvvGPX93CApvOVpnXrdQ==:117 a=08fdJdSdiRUA:10 a=IkcTkHD0fZMA:10
 a=IeDTYxtbb8wA:10 a=6J6j7_AOAAAA:8 a=VwQbUJbxAAAA:8 a=EZdtCtFMmvtFuqPiPk4A:9
 a=QEXdDO2ut3YA:10 a=DoBsnWhqfNmTxX1QClym:22 a=AjGcO6oz07-iQ99wixmX:22
Date:   Mon, 24 May 2021 19:28:24 +0200 (CEST)
From:   Dario Binacchi <dariobin@libero.it>
To:     Vladimir Zapolskiy <vz@mleia.com>, linux-kernel@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>,
        Drew Fustini <drew@beagleboard.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org
Message-ID: <1972814783.387983.1621877304255@mail1.libero.it>
In-Reply-To: <87ea9971-9e15-c595-95cc-14c68b0b68d8@mleia.com>
References: <20210520202730.4444-1-dariobin@libero.it>
 <20210520202730.4444-3-dariobin@libero.it>
 <87ea9971-9e15-c595-95cc-14c68b0b68d8@mleia.com>
Subject: Re: [PATCH v3 2/3] pinctrl: core: configure pinmux from pins debug
 file
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev34
X-Originating-IP: 82.60.150.250
X-Originating-Client: open-xchange-appsuite
x-libjamsun: 5JjfDxm06Xm5f3jUcYMhO61+PxMcWi7J
x-libjamv: 4pXjlC2sfj4=
X-CMAE-Envelope: MS4xfNCLPm0XoiybzFhtSzDZBCVjhTJED0HWWZPx5WUonT22g3SlsoDiAwBPsVRfEeffUyjHTzKMX9ZZ0BuH70juSqSdQYLA5JYk5Jm79zUlylfPGTvr7CV2
 IxLYSiPsUCyEylUz48KYn1eYlY9L0dszcBmSD2zhmddKKl7fq553hKHZuiAoti9zyj4R2ZhF5k1gk9iSpCpgeRC/C+d7lziWLum2xFNItOYa4HtN4otxJzsf
 5Iq3C/l7Ev/fs14SyCAY+NRgm04Pmud1cgMwUmwM4JgZ49If/MGcikUuMZqvBK6j9aGTM+0PqaC8mTWmaLdZ5Dxq4VLnhqfyMhrVc8pPUnY+KCqQBRccO3GG
 Utquf8w+xMiVaJM74+OSDRPJt9EnWfc5x2oe7Y5WkTDfm1ag3YU=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Vladimir,

> Il 21/05/2021 08:44 Vladimir Zapolskiy <vz@mleia.com> ha scritto:
> 
>  
> Hello Dario,
> 
> On 5/20/21 11:27 PM, Dario Binacchi wrote:
> > The MPUs of some architectures (e.g AM335x) must be in privileged
> > operating mode to write on the pinmux registers. In such cases, where
> > writes will not work from user space, now it can be done from the pins
> 
> user space has no connection to the problem you're trying to solve.
> 
> Please provide a reasonable rationale for adding a new interface, thank
> you in advance.
> 
> > debug file if the platform driver exports the pin_dbg_set() helper among
> > the registered operations.
> > 
> > Signed-off-by: Dario Binacchi <dariobin@libero.it>
> 
> I strongly object against this new interface.
> 
> As Andy've already mentioned you have to operate with defined pin groups
> and functions, and so far you create an interface with an option to
> disasterous misusage, it shall be avoided, because there are better
> options.
> 
> What's the issue with a regular declaration of pin groups and functions
> on your SoC? When it's done, you can operate on this level of abstraction,
> there is absolutely no need to add the proposed low-level debug interface.
> 

I quote Drew's words: 

"I think it could be helpful to be able to set the conf_<module>_<pin>  
registers directly through debugfs as I can imagine situations where it would 
be useful for testing. It is a bit dangerous as the person using it has to be 
careful not to change the wrong bits, but they would need to have debugfs mounted 
and permissions to write to it."

"Bits 6:3 are related to what this subsystem would refer to as pin conf
such as slew, input enable and bias. Thus it might make sense to expose
something like a select-pinconf file to activate pin conf settings from
userspace."
 
From the emails exchanged I seem to have understood that there is no way to 
reconfigure slew rate, pull up / down and other properties on the fly. 
In the kernel version 4.1.6 that I am using on my custom board, I have fixed
the commit f07512e615dd ("pinctrl/pinconfig: add debug interface"). However,
this feature was later removed (https://lore.kernel.org/patchwork/patch/1033755/).
The patches I've submitted implement some sort of devmem for pinmux. It too can 
be used in a dangerous way, but it exists and it is used.

Anyway, the implementation may be wrong but it does highlight a feature that 
can be useful in testing or prototyping boards but is not present in the kernel.
Can we then find a solution that is right for everyone?

Thanks and regards, 
Dario

> --
> Best wishes,
> Vladimir
