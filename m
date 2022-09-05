Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B40B25AD706
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 17:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbiIEP64 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 11:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbiIEP64 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 11:58:56 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B7A85E67F
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 08:58:55 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id C208541E2F;
        Mon,  5 Sep 2022 15:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1662393533; bh=5ddIZgY8HRuxr3R3vJUCU/dgdvSecu10g2j2J67YZUU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=lvu0BWQXg9PFAElDpqGc4s4rYJg7PpX1JsqE6r1tjNl4ENWfdXNsDMb68pseb578Z
         YhXVNNhGdBXGrgPB5WFo7gAx9PTgmAeV9bvs/8aElvTgwvUB8H/HrKD180fqhPY2aB
         FBFkgN8Ibs32smEYgjQiwIAV+RVidX5q7DblX0Oi776vC9F4v1J9nwN4384BGQWru6
         S2RzfQU2NDpmVxrRZcay92iwSj2V8geGA/LU2ZE5G4s3AS/7HY/0rloMkpeaQhvaEm
         nOBVdvIKXKnkB07s9HGbkPT/Ilr/Pe8ssS3/XHip6h+Cj2hIm+SLaIsuzlUiJFWe0+
         dP0O8KagF8KYA==
Message-ID: <57c02bdd-4f98-40f7-22a9-4f39508159e8@marcan.st>
Date:   Tue, 6 Sep 2022 00:58:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
Content-Language: es-ES
To:     =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik@cutebit.org>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sven Peter <sven@svenpeter.dev>
References: <YxHp6CNhlQ5Hx1m8@shell.armlinux.org.uk>
 <CAHp75Vd-hT3Z-TUCG3y872_Y7sPAW2QBGC28S7aimOf3WQHg6A@mail.gmail.com>
 <YxIXPSZlEBcKYulW@shell.armlinux.org.uk>
 <CAHp75VeTYSn+ODtoH27OB2U+XYVEphonm+QR3Z+NVs-nJ90w9w@mail.gmail.com>
 <YxIifddpeJRCuImc@shell.armlinux.org.uk>
 <CAHp75VddN-cEY3AN=PWO5pR4D6YaDTRQgjbZLS=C5dLBTSVGwA@mail.gmail.com>
 <YxXNZzeBRiiS6FNk@shell.armlinux.org.uk>
 <CAHp75Vcq4LVRmgELvLJ8fNk3xdSfGikyLDL_7LGvKg4a4L4J=A@mail.gmail.com>
 <YxX1Lp7ClRSBhbno@shell.armlinux.org.uk>
 <CAHp75VfcTzbhOGr=0YH+nfpgcfDg8mhF1b5tZF3wudPiKhp7Qw@mail.gmail.com>
 <YxYWdDUBNOV+DaU0@shell.armlinux.org.uk>
 <FD0C690B-DFA6-4CF0-8C54-8D829F0ABE2B@cutebit.org>
From:   Hector Martin <marcan@marcan.st>
In-Reply-To: <FD0C690B-DFA6-4CF0-8C54-8D829F0ABE2B@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/09/2022 00.44, Martin Povišer wrote:
> 
>> On 5. 9. 2022, at 17:32, Russell King (Oracle) <linux@armlinux.org.uk> wrote:
> 
>> I still need a resolution between you and Hector over the smc_key
>> issue - specifically, do I pick up the patch that adds support for
>> %p4ch, or do we re-architect the smc_key thing and also in doing so
>> get rid of the need for your "endian conversion" thing.
> 
> Idea about the %p4ch thing: We will leave the keys true
> to their nature (i.e. 32-bit integer), and at least initially
> for the prints we will employ macros
> 
> #define SMC_KEYFMT “%c%c%c%c”
> #define SMC_KEYFMT_VAL(val) (val)>>24,(val)>>16,(val)>>8,(val)
> 
> used like
> 
> printk(“blah blah” SMC_KEYFMT “ blah\n”, SMC_KEYFMT_VAL(key));
> 
> This has the nice property that it is pretty much like the specifier,
> and later can be easily replaced with the real thing.

Not the prettiest, but I'll take this over trying to mess around with
string buffer conversions or anything involving non-native endianness if
the printk specifier patch is going to be controversial.

I'd prefer shorter macro names though, like SMC_KFMT/SMC_KVAL(), to
avoid further lengthening already-long printk lines.

- Hector
