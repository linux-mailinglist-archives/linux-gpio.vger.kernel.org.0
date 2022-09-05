Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 839DB5AD6B8
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 17:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238362AbiIEPjr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 11:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238958AbiIEPjg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 11:39:36 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB513DEE8
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 08:39:34 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 1BEBD41E2F;
        Mon,  5 Sep 2022 15:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1662392373; bh=CPuvfrj+bg5Wc9yyPhZWo6SV0wB4yQZN+c8KRS6Vr0M=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To;
        b=LT1ztgMe28WggocrB6F19ZACYhsxHVDmsk+iwtNrNvzj+lOCx5kjsgfiRpkPSzOrG
         nBaJVrL92+YDDJNF+BXuuJ56XLyxZMGT9l98bqF4tw8tYs9ruu90oCDcAb7vNixJsg
         HYJPoWne6D+uFDb3/N0SXrs9WUEasqyLYzK1c+8L/d/n9Eh7gJldvZFymICpe09nk2
         aD0YmCVKpnJjNHqM5QAaIFwU66O09LVWtNHX/7zJHZSFFva/uxKzwmJYBzlZ6fYqOM
         ev/uZr6LEgSLKyWfOSBXeWSlfIW9lQ1P5E9Aqa2tvFUDS5TewVfbTYnt6etvY2J0dG
         5haqKHo9caKfA==
Message-ID: <2dbeef40-7ab8-a5e7-ce47-0c27720b947c@marcan.st>
Date:   Tue, 6 Sep 2022 00:39:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
References: <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
 <YxHVdjYPlIINZ/Wc@shell.armlinux.org.uk>
 <CAHp75VeO3gxypRTUc9Subvh+NZ7X4_RR=eFUZpPNwBeWk+_ipg@mail.gmail.com>
 <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk>
 <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk>
 <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk>
 <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
In-Reply-To: <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk>
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

On 05/09/2022 19.20, Russell King (Oracle) wrote:
> So, I'm going with my first suggestion for the hex2bin() conversion
> above, and adding a comment thusly:
> 
>         /*
>          * The most significant nibble comes from k[0] and key bits 15..8
>          * The least significant nibble comes from k[1] and key bits 7..0
>          */
>         k[0] = key >> 8;
>         k[1] = key;
> 
> because I needed the comment to prove to myself that I wasn't breaking
> this code. Maybe it's obvious to you, but it isn't obvious to everyone.

Honestly, I don't see what this buys us over the original code. It's
longer, no more readable, makes you think about the order that
characters are stored in the string as an extra indirection step, which
as as you found out with having to write the comment, is easy to get
backwards.

But I will say it is at least *semantically* correct, if awkward.

Let's back up and talk a bit about SMC keys for a second.

First, SMC is a legacy mess and plays around with endianness wrong in
several places - there are values which are in wrong-endian for no
reason, etc. So any discussion over "what would happen on a big-endian
platform" is ultimately speculation. If this ever ends up running on
some ancient PowerPC Mac (did any of those ever ship with an SMC that
followed these semantics?) then we'll have to deal with the endianness
issues then and correct any incorrect assumptions, because right now we
just don't have the information on what Apple's *intent* was when
designing this whole thing, if there was an intent at all.

That said. When I designed this driver, and the way I understand the
hardware, I consider SMC keys to be 32-bit integers containing packed
ASCII characters in natural integer order, that is, 0xAABBCCDD
representing the fourcc ABCD in that order. The SMC backend is designed
with this in mind, and puts things in the right endian in the right
contexts when it comes to the actual interface with the SMC coprocessor
(which is, itself, a mix of shared memory - which is a bag of bytes -
and 64-bit mailbox messages - which are fundamentally integers and
merely represented in little-endian at the hardware level - so I'm sure
how you can see how this gets interesting).

In other words, at the driver level, *SMC keys are not character
strings, nor integers stored in some byte order*. They are integers.
Integers do not have a byte order until they are stored to memory.
Therefore, using functions that operate on strings on SMC keys is wrong,
and requires you to make a trip through endian-land to get it right (as
you found out).

Making the representation of SMC keys in the driver 32-bit integers
makes manipulating them easier and ergonomic in C, and allows for things
like comparisons (look at how the GPIO code uses < to compare SMC keys,
which maps to ASCIIbetical sort the way the keys are naturally encoded),
while basically relegating all the endian issues to the SMC core. For
comparison, if the data structure were a char[4] in reading order, there
would be no ergonomic way to do comparisons without some helper
function/macro. And comparisons are used quite a bit as part of the
self-discovery aspects of SMC (there's that binary search function to
find key indices, which also took like 4 tries to get right... please
don't break it! :).

This is why I added a printk specifier, because V4L/etc already had a
very special-purpose specifier with fancy rules just for them, and I
think a generic FOURCC style format specifier that works in any context
is useful (this isn't the only driver dealing with this kind of
FOURCC-style construct). The printk patch in particular adds 4
variations to the existing v4l specifier that that interpret endianness
differently, so it can be used in any context (in this context, the
specifier is 'h' which means 'host endian' and is the correct specifier
for abstract integers, which are passed by reference in this case and
therefore inherit the host endianness).

- Hector
