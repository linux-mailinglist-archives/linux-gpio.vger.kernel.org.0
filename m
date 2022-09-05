Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88E0A5AD5B4
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 17:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiIEPEg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 11:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbiIEPEe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 11:04:34 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FD5A19A
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 08:04:33 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 98B9C41E2F;
        Mon,  5 Sep 2022 15:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1662390271; bh=4j1NwuJDwtPSknMdpbNcwHIk+7R9crA14Er54hayAmg=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To;
        b=I5VcZBYXt3ZaZQpcD8IdttqV8k884pqbr1WQDrVIvEHu6PGd/8x70cMoqmvpBYqCx
         BGrwrYfkmkOKCfwV4Xj6jUTSfbcDeplzBDvn0GSxEVDxWdnlkKOQocN6JqclNTIaxT
         tZG/WElU58UgtsNGxbJwjaK9KwUcc7z1S59BY+fXX6470msQ83/GuzW0s3GUxCriCt
         wkuHtnMW7luB4iGULy/443JOd1oJIHp9JMoD94DGfn6U29AN8ca8zsYjCBoMnxOWBW
         wIFPFzVKHcDBqtp+GCnZ+idaGsQ/xiMqSK5/t6BvNgkDu7Q/A96tO+oMzmipQa4QM1
         6U+qKZPYUnlHQ==
Message-ID: <2126f1db-1904-0be3-3c7d-eee1c2060b4d@marcan.st>
Date:   Tue, 6 Sep 2022 00:04:26 +0900
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
 <E1oTkeb-003t9e-Iy@rmk-PC.armlinux.org.uk>
 <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 5/6] gpio: Add new gpio-macsmc driver for Apple Macs
In-Reply-To: <CAHp75VcG5E+yTH2hG2CbnArsm+ZJ-sWRMmM-wLks0xUJkwSgcg@mail.gmail.com>
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

On 02/09/2022 03.55, Andy Shevchenko wrote:
>> +struct macsmc_gpio {
>> +       struct device *dev;
>> +       struct apple_smc *smc;
>> +       struct gpio_chip gc;
> 
> You might save some CPU cycles / code by shuffling members around.
> Usually we put gpio_chip as a first one, so pointer arithmetics to get
> it becomes a bit simpler, but it needs to be checked by the tool and
> also paying attention to what is used in critical paths (so
> performance-wise).

This is a GPIO chip accessed via a remote CPU. Saving two cycles on
pointer arithmetic is the very definition of premature optimization.

> 
>> +       int first_index;
>> +};
> 
> ...
> 
>> +static int macsmc_gpio_nr(smc_key key)
>> +{
>> +       int low = hex_to_bin(key & 0xff);
>> +       int high = hex_to_bin((key >> 8) & 0xff);
>> +
>> +       if (low < 0 || high < 0)
>> +               return -1;
>> +
>> +       return low | (high << 4);
>> +}
> 
> NIH hex2bin().

No. hex2bin() works on string buffers. This works on an integer
containing packed characters. They are not the same, and do not have the
same semantics endian-wise. Integer represent numbers abstractly, byte
buffers represent bytes in memory in sequence.

>> +static int macsmc_gpio_key(unsigned int offset)
>> +{
>> +       return _SMC_KEY("gP\0\0") | (hex_asc_hi(offset) << 8) | hex_asc_lo(offset);
>> +}
> 
> NIH hex_byte_pack().

Same comment as above.

>> +       /* First try reading the explicit pin mode register */
>> +       ret = apple_smc_rw_u32(smcgp->smc, key, CMD_PINMODE, &val);
>> +       if (!ret)
>> +               return (val & MODE_OUTPUT) ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
>> +
>> +       /*
>> +        * Less common IRQ configs cause CMD_PINMODE to fail, and so does open drain mode.
>> +        * Fall back to reading IRQ mode, which will only succeed for inputs.
>> +        */
>> +       ret = apple_smc_rw_u32(smcgp->smc, key, CMD_IRQ_MODE, &val);
>> +       return (!ret) ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
> 
> What is the meaning of val in this case?

Have you tried reading the comment above the code?

When I write code doing something unintuitive and put a comment on top,
I expect reviewers to *read* it. If you're not going to do that, I might
as well stop writing comments.

> Strange specifier... It seems like a hashed pointer with added (or
> skipped? I don't remember) '4ch'. Perhaps you meant one of '%pE',
> '%p4cc'?
> Ditto for other cases.

As mentioned in the other thread, there was a missed dependency that
added this specifier.

> 
>> +       struct macsmc_gpio *smcgp = gpiochip_get_data(gc);
>> +       int count = apple_smc_get_key_count(smcgp->smc) - smcgp->first_index;
> 
> I would split this assignment and move it closer to the first user.

It is one line away from the first user.

> 
>> +       int i;
>> +
>> +       if (count > MAX_GPIO)
>> +               count = MAX_GPIO;
> 
> Hmm... When can it be the case?

Let's find out! Two lines above:

+	int count = apple_smc_get_key_count(smcgp->smc) - smcgp->first_index;

So I get the toal SMC key count, which is probably 1000 or so, then
subtract the index of the first GPIO key, to get an upper bound on the
last GPIO key just to make sure we don't run off the end of the key list.

In other words, pretty much always.

But you didn't read two lines prior, did you.

> 
>> +       bitmap_zero(valid_mask, ngpios);
>> +
>> +       for (i = 0; i < count; i++) {
>> +               smc_key key;
>> +               int gpio_nr;
> 
>> +               int ret = apple_smc_get_key_by_index(smcgp->smc, smcgp->first_index + i, &key);
> 
> Ditto.

This is zero lines away from the first user.

> 
>> +
>> +               if (ret < 0)
>> +                       return ret;
>> +
>> +               if (key > SMC_KEY(gPff))
>> +                       break;
>> +
>> +               gpio_nr = macsmc_gpio_nr(key);
>> +               if (gpio_nr < 0 || gpio_nr > MAX_GPIO) {
>> +                       dev_err(smcgp->dev, "Bad GPIO key %p4ch\n", &key);
> 
> Yeah, according to the code it will print something you didn't want.

What?

>> +       pdev->dev.of_node = of_get_child_by_name(pdev->dev.parent->of_node, "gpio");
> 
> Can we use fwnode APIs instead?
> Or do you really need this?

This is a producer, not a consumer. It needs to set the of_node so there
is something for consumers to target in the device tree. The consumers
may well use fwnode APIs.

- Hector
