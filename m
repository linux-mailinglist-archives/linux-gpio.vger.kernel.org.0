Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D92A5AD577
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 16:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238602AbiIEOqe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 10:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238688AbiIEOqP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 10:46:15 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC47E99
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 07:45:46 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id D220141F78;
        Mon,  5 Sep 2022 14:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1662389143; bh=Sfkarbh+mj978KpQK6dR0RRYHFHFAtnCR9HLnUvhxwo=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To;
        b=cFcr98vezlk65L4eHBUjZ0ogKbDzSWQi88S4RonjYmrGv318jMJa6q6ovc5eO4rs8
         7SvECRzb8piFH4amV2gFfNMzS1a7R1hmlVsvarJV0QeYtI7zwSXDxzXHfiGcWli7bV
         QO1hpM2ZX7UUp+IhKEkNjigICDftStv1wg5pgf3iciu6/HWEeEaVnNHBbh7rrq2Zd1
         8Av8sBXG/8UFnZHlg+9qSDK+uH6YAVtn+3f/rO0fQK2kHGHFnW1om4ItnCPdj3blud
         VEt35u5397hU8PGckoEnZQjRTrhiUqHjHUgozk8tT01EdBaLW47MKxbJl4BYcsQ5mH
         bLPIX8QPwQorg==
Message-ID: <7f20d473-7bbc-b0b3-3daf-dfc935ca3151@marcan.st>
Date:   Mon, 5 Sep 2022 23:45:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: es-ES
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeW-003t9Y-Ey@rmk-PC.armlinux.org.uk>
 <CAHp75Ve1ackTCOAkVar00OyDW-+BOPbRmsJRH3-z1bdNaukC+Q@mail.gmail.com>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 4/6] platform/apple: Add new Apple Mac SMC driver
In-Reply-To: <CAHp75Ve1ackTCOAkVar00OyDW-+BOPbRmsJRH3-z1bdNaukC+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02/09/2022 04.26, Andy Shevchenko wrote:
> On Thu, Sep 1, 2022 at 5:18 PM Russell King <rmk+kernel@armlinux.org.uk> wrote:
>>
>> From: Hector Martin <marcan@marcan.st>
>>
>> This driver implements support for the SMC (System Management
>> Controller) in Apple Macs. In contrast to the existing applesmc driver,
>> it uses pluggable backends that allow it to support different SMC
>> implementations, and uses the MFD subsystem to expose the core SMC
>> functionality so that specific features (gpio, hwmon, battery, etc.) can
>> be implemented by separate drivers in their respective downstream
>> subsystems.
>>
>> The initial RTKit backend adds support for Apple Silicon Macs (M1 et
>> al). We hope a backend for T2 Macs will be written in the future
>> (since those are not supported by applesmc), and eventually an x86
>> backend would allow us to fully deprecate applesmc in favor of this
>> driver.
> 
> ...
> 
>>  drivers/platform/Kconfig           |   2 +
>>  drivers/platform/Makefile          |   1 +
>>  drivers/platform/apple/Kconfig     |  49 ++++
>>  drivers/platform/apple/Makefile    |  11 +
> 
> Are you going to collect the code from, e.g., PDx86 which supports
> some apple devices here?

This driver is intended to eventually supersede hwmon/applesmc.c, once
it gets the missing features (hwmon in particular) and someone writes a
legacy x86 backend. In the meantime, it is likely to first gain support
for T2 machines, which applesmc.c does not have.

>> +       smc->msg_id = (smc->msg_id + 1) & 0xf;
> 
> % 16 will tell much cleaner of the purpose, no?

I disagree. msg_id goes in a bit field in SMC messages, and & 0xf
perfectly conveys the idea that it is limited to 4 bits.

> 
> ...
> 
>> +       while (smc->atomic_pending) {
>> +               ret = apple_rtkit_poll(smc->rtk);
>> +               if (ret < 0) {
>> +                       dev_err(smc->dev, "RTKit poll failed (%llx)", msg);
>> +                       return ret;
>> +               }
>> +               udelay(100);
>> +       }
> 
> Something from iopoll.h to be utilised?

No? Andy, I know you like to rapid-fire code reviews, but please read
and understand the code you're reviewing with context, don't just fire
off random comments based on gut feeling. This is calling through a
framework that winds up in the mailbox code and then through a callback
processes incoming messages. It's not an iopoll.

> 
>> +               return -EIO;
>> +       }
> 
> ...
> 
>> +       result = FIELD_GET(SMC_RESULT, smc->cmd_ret);
>> +       if (result != 0)
>> +               return -result;
> 
> And this is in Linux error numbering space?!

It's in some random error numbering space, and who knows how we should
map it. Maybe we should just return -EIO unconditionally, but that loses
all available information...

>> +       smc->msg_id = (smc->msg_id + 1) & 0xf;
> 
> See above. Perhaps you need a macro / inline helper for this to avoid dups.

I really don't think incrementing a 4-bit counter is an idiom that
kernel driver programmers are going to find confusing, and gratuituous
macro use just makes the code harder to read.

>> +       do {
>> +               if (wait_for_completion_timeout(&smc->cmd_done,
>> +                                               msecs_to_jiffies(SMC_RECV_TIMEOUT)) == 0) {
>> +                       dev_err(smc->dev, "Command timed out (%llx)", msg);
>> +                       return -ETIMEDOUT;
>> +               }
>> +               if (FIELD_GET(SMC_ID, smc->cmd_ret) == smc->msg_id)
>> +                       break;
> 
>> +               dev_err(smc->dev, "Command sequence mismatch (expected %d, got %d)\n",
>> +                       smc->msg_id, (unsigned int)FIELD_GET(SMC_ID, smc->cmd_ret));
> 
> Guaranteed to flood the logs...

No.

> 
>> +       } while(1);
> 
> ...with such a conditional.

It's waiting on a completion every loop. And the message ID is 4 bits,
so the most you will ever get is 15 messages (but in practice what
happens is that if this goes wrong, it just times out on the next loop,
and generally everything breaks anyway, and all of it is indicative of a
major bug.

Again, please read the code, don't just go "dev_err() in a while(1), bad!".

>> +       if (size <= 4)
>> +               memcpy(buf, &rdata, size);
>> +       else
>> +               memcpy_fromio(buf, smc->shmem.iomem, size);
> 
> This is unclear why plain memcpy() for the small size and what are the
> side effects of the memory.

It's on the stack. Can you *please* read more than two lines of context
while reviewing? This is getting tiring. You do this *all* the time.
It's even taking the address of the variable right there, you didn't
even need to read past that one line to understand it.

> Maybe you wanted memremap() instead of
> ioremap() to begin with?

ioremap() uses a completely different mapping mode to memremap(). They
are not interchangeable and memremap will not work here.

>> +       if (res.end < res.start || !resource_contains(smc->sram, &res)) {
> 
> Is it a reimplementation of something like resource_intersect() and Co?

I don't know, is it? Can you please make specific suggestions instead of
randomly throwing around ideas without checking whether they actually
make sense?

>> +       bfr->iomem = smc->sram_base + (res.start - smc->sram->start);
> 
> Isn't it better to write as
> 
>   res.start + (base - start)
> 
> ?

smc->sram_base is the iomem base of the sram, smc->sram->start is the
physical address of the sram, and res.start is the physical address of
the area the SMC is referencing.

__iomem + (physaddr - physaddr) == __iomem + offset == __iomem

You are proposing:

physaddr + (__iomem - physaddr)

which not only does not make sense, it's undefined behavior in C, since
you are doing pointer arithmetic exceeding the object bounds of the
iomem map.

>> +       smc->sram = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
> 
>> +       if (!smc->sram)
>> +               return dev_err_probe(dev, EIO,
>> +                                    "No SRAM region");
> 
> Dup, the below does this message for you.

There is a difference between "the DT is missing the SRAM resource" and
"couldn't map the SRAM resource for some reason". Why merge them into
one error?

> 
>> +       smc->sram_base = devm_ioremap_resource(dev, smc->sram);
>> +       if (IS_ERR(smc->sram_base))
>> +               return dev_err_probe(dev, PTR_ERR(smc->sram_base),
>> +                                    "Failed to map SRAM region");
> 
> Don't we have devm_platform_ioremap_resource_byname() ?

Except I use smc->sram elsewhere.

You cannot review patches by ignoring everything but the two lines of
context you are staring at right now. Before complaining about
something, please *look* to see if there is a good reason for the code
to be the way it is.

> ...
> 
>> +typedef u32 smc_key;
> 
> Why?!

Because SMC keys are 32 bits and giving them their own type makes it
explicit what is supposed to be an SMC key.

> 
>> +#define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
> 
> If s is a byte buffer, the above is NIH get_unaligned_be32(). Or in
> case of alignment be32_to_cpu() with respective type (__be32) to be
> used.

Except this is a constexpr, and get_unaligned_be32 is not.

s is a 32-bit identifier that happens to consist of 4 8-bit character
ASCII fields. This is a macro to generate them from ASCII strings, as
compile-time constants. You'd have figured that out if you read ahead to
where it is used, instead of continuing your two-line-context review.

>> +#define apple_smc_write_flag apple_smc_write_u8
> 
> Why is it needed?

Because some SMC keys are boolean flags, and the ABI is identical to u8
but the logical semantics are not, and the code is clearer when it makes
it explicit that the value is supposed to be a boolean, not just an
arbitrary 8-bit integer.

Andy, no offense, but you drive-by everything I try to upstream (or
author in this case) and half of your suggestions are wrong and I have
to waste my time explaining why, and most of the rest are negligible
style nitpicks. Every now and then you point out some useful kernel
function that I didn't know about, but your signal to noise rate is
terrible. Please put some effort into your reviews. It feels like you're
on some kind of quest to review as much code as possible, without the
slightest care for quality.

- Hector
