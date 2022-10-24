Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93BA060997B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Oct 2022 06:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbiJXEyL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Oct 2022 00:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbiJXEyG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2022 00:54:06 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B2537A529;
        Sun, 23 Oct 2022 21:54:04 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 458AD42137;
        Mon, 24 Oct 2022 04:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1666587242; bh=hTIfI1TimkoQbe2AR20uYjLSCpdXcrxx7IELqXaCqFI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=G/m7gCvhKw9O2d4cKPN8jwXyzQPu/KeSr3SYbUo6bVg+Oc7LD7hcdnqzKXNwA/cP5
         Qz9x4YelwUF/VzZFsJ9Qeb3Ui+QDgPj78zpYR4PPUvJP0N//apKkmjK8FJy4HG+Rx+
         5fUD3ddBvsbrgiyA3hASpBcafQWQa+61My4P3hQP4B7PxvoGvBLwZy5F8Q/0Kfu/CI
         ISv0P89RnaK6V3BMrUkY9M3Q3tXMdE/lguht1NqUUwjes45NkbdkHkWQWB9pONzRiD
         QQNHGIzejzGkPHtGlXVySnxh5l9tvR81LcOeD+oniSTfP4YQx6Qfja+mUj9m67HMA/
         XKNm0Id5540Aw==
Message-ID: <62ac9899-477e-8181-3b31-4afae9a9c3df@marcan.st>
Date:   Mon, 24 Oct 2022 13:53:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/7] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Content-Language: en-US
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Petr Mladek <pmladek@suse.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
 <E1oVYUS-005CmS-IA@rmk-PC.armlinux.org.uk> <Y0/Kt9CW5vYcxHhK@alley>
 <Y0/kJwpbvbeul8n3@shell.armlinux.org.uk>
From:   Hector Martin <marcan@marcan.st>
In-Reply-To: <Y0/kJwpbvbeul8n3@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19/10/2022 20.48, Russell King (Oracle) wrote:
> On Wed, Oct 19, 2022 at 12:00:23PM +0200, Petr Mladek wrote:
>> On Tue 2022-09-06 14:19:44, Russell King wrote:
>>> From: Hector Martin <marcan@marcan.st>
>>>
> ... 
>>> +Generic FourCC code
>>> +-------------------
>>> +
>>> +::
>>> +	%p4c[hnbl]	gP00 (0x67503030)
>>> +
>>> +Print a generic FourCC code, as both ASCII characters and its numerical
>>> +value as hexadecimal.
>>> +
>>> +The additional ``h``, ``r``, ``b``, and ``l`` specifiers are used to specify
>>> +host, reversed, big or little endian order data respectively. Host endian
>>> +order means the data is interpreted as a 32-bit integer and the most
>>> +significant byte is printed first; that is, the character code as printed
>>> +matches the byte order stored in memory on big-endian systems, and is reversed
>>> +on little-endian systems.
>>> +
>>> +Passed by reference.
>>> +
>>> +Examples for a little-endian machine, given &(u32)0x67503030::
>>> +
>>> +	%p4ch	gP00 (0x67503030)
>>> +	%p4cl	gP00 (0x67503030)
>>> +	%p4cb	00Pg (0x30305067)
>>> +	%p4cr	00Pg (0x30305067)
>>
>> Nit: I would prefer to keep the same order (h,r,b,l) everywhere.
>>
>>      I guess that you wanted to show exactly the same results next
>>      to each other. But it is not the case on big-endian anyway.
> 
> This is straight from the Asahi kernel tree, and is unmodified. I'm
> guessing you're use of "you" here refers to Hector rather than me.
> 
> So, Hector, any opinions on Petr's comments please?

Fine with me, feel free to make the changes :)

- Hector
