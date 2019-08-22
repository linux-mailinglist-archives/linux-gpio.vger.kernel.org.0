Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 477AF988B5
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2019 02:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727493AbfHVAuK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Aug 2019 20:50:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:54576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727257AbfHVAuK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Aug 2019 20:50:10 -0400
Received: from [10.44.0.22] (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 614B5216F4;
        Thu, 22 Aug 2019 00:50:08 +0000 (UTC)
Subject: Re: [PATCH] m68k: coldfire: Include the GPIO driver header
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20190821070923.687-1-linus.walleij@linaro.org>
 <CAMuHMdWF1GXYtFbjrALRMObqzezd-cBwDPAqhC-9d=RbrLxNyQ@mail.gmail.com>
 <fb01f312-5cc5-03a1-a1a5-a12819e2ff7b@linux-m68k.org>
 <CAMuHMdVsqKqppkvXYm=NiGeikhC_i99hH+Y2ecjQfr3S2-BTZA@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <5bba9a8e-5f8d-8f33-6dba-503ae59a8ee4@linux-m68k.org>
Date:   Thu, 22 Aug 2019 10:50:05 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVsqKqppkvXYm=NiGeikhC_i99hH+Y2ecjQfr3S2-BTZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert, Linus,

On 21/8/19 10:50 pm, Geert Uytterhoeven wrote:
> On Wed, Aug 21, 2019 at 2:22 PM Greg Ungerer <gerg@linux-m68k.org> wrote:
>> On 21/8/19 5:19 pm, Geert Uytterhoeven wrote:
>>> CC Greg (coldfire)
>>
>> Thanks Geert.
>> I am happy to take it via the m68knommu tree if you prefer?
> 
> Sounds most logical to me.
> Thanks!

Pushed to the for-next branch of the m68knommu git tree.

Regards
Greg



>>> On Wed, Aug 21, 2019 at 9:09 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>>>> The Coldfire GPIO driver needs to explicitly incldue the
>>>> GPIO driver header since it is providing a driver.
>>>>
>>>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>>>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>>> ---
>>>> Geert can you pick this up for m68k?
>>>> ---
>>>>    arch/m68k/coldfire/gpio.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/m68k/coldfire/gpio.c b/arch/m68k/coldfire/gpio.c
>>>> index a83898426127..ca26de257871 100644
>>>> --- a/arch/m68k/coldfire/gpio.c
>>>> +++ b/arch/m68k/coldfire/gpio.c
>>>> @@ -9,6 +9,7 @@
>>>>    #include <linux/module.h>
>>>>    #include <linux/init.h>
>>>>    #include <linux/device.h>
>>>> +#include <linux/gpio/driver.h>
>>>>
>>>>    #include <linux/io.h>
>>>>    #include <asm/coldfire.h>
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
