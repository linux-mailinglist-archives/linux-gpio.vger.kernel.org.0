Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E02F590663
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Aug 2022 20:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234385AbiHKSXB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Aug 2022 14:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235176AbiHKSW7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Aug 2022 14:22:59 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F9D979CB
        for <linux-gpio@vger.kernel.org>; Thu, 11 Aug 2022 11:22:57 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-116c7286aaaso6518252fac.11
        for <linux-gpio@vger.kernel.org>; Thu, 11 Aug 2022 11:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ad4ObokUjbYiMPx2YqgbLALUBws6u8gG48o8Szq/t6M=;
        b=ozIQkOrmUyo+2tkcomK4QGB+4cNKWfFPKtveqc8xKWSl956qs0TfGXUpNBYrTSugC2
         69e2bsuy7e6LwNWYuV5hZW3TyiN9pobBR6xkILLNwImDVF82C/JwWkzOMZbeCLHBK/0f
         YN7q1+K+OE7w3ZAWV0A0+0dEVK7dMmG5SGhEGjRQBeBRTdfF4flIxeIxz1MnXQEvg27h
         q9T5Pnk4VNTTh4bXUa93BLYiZpV664mbtawVI9dqPCoyVpot4StL3+T1iRqKLI6whGJP
         c7V0FTLDu67NQL/xtEWz4hKIVtjCAV1b++hhk9p2sVWJ6zs+GFHDqRfGbdwq83Q2XDq1
         2AHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ad4ObokUjbYiMPx2YqgbLALUBws6u8gG48o8Szq/t6M=;
        b=c12Tsub4bgz9wt7qJqtEwJl2vi5/SM7j4X92qaG0x6epOSAokPae8kwne/zCAhvyca
         LvJ9zo2kyLBn/KYg5sG352YxBy4eh9gH6bxOw7XuXTtUoEEXyVgcY8qfZA8pJxdVbQaJ
         SwnKDbysVjbZ1uiscvHBD58tip6K2Je12Bh6ONQX687scbssNpjX6IvBQSweVZhojtC2
         A/GHWRN4HdTPplik4GIPy09c2WkpUQ7LxaI9uGA5SHeU5gWmrhR8G1FQGnFi0JgKjhzS
         9p9VK67Yxoj5BKRPoyQFM72qzx3mkIuR676LxzxKjQXqt3kFNmDzSwqxKiT89sBlkPnC
         9DHg==
X-Gm-Message-State: ACgBeo1CuEuLxqgS2SmLJFKTJwWBBdd/ISS+Fjs9w9GH2fyucp34kn1U
        qAt9ktjKOGSHfoobKSp9wA7mUltmRKg=
X-Google-Smtp-Source: AA6agR7yQEvzSF5BDRITxdhRE7KM2jVEmEheh8m1GoALgrZyhqi5qeqUUdJs0Oq4IQ1+YDH1758tww==
X-Received: by 2002:a05:6870:82a5:b0:113:88fe:11ff with SMTP id q37-20020a05687082a500b0011388fe11ffmr81121oae.218.1660242176351;
        Thu, 11 Aug 2022 11:22:56 -0700 (PDT)
Received: from [172.31.250.1] ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 51-20020a9d0bb6000000b00616d3ec6734sm1249444oth.53.2022.08.11.11.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 11:22:55 -0700 (PDT)
Message-ID: <a6aa8619-e620-929d-fd6e-8ecba2948a7b@gmail.com>
Date:   Thu, 11 Aug 2022 13:22:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: gpiod_get() - How to get GPIO from chip & offset?
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
References: <d2c3cb8e-4042-13ad-4bb9-21b289ba773c@gmail.com>
 <CAHp75Vf_KG0W8doF5m-4Fqbh+PHjOO4e7_+7Ne7qeC8XbwUk1A@mail.gmail.com>
 <CAHp75Vf5KsgJSM_dsLC9Gd012XWco=nrMS2Fzf_Ejz_9MnjxWQ@mail.gmail.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
From:   Ian Pilcher <arequipeno@gmail.com>
In-Reply-To: <CAHp75Vf5KsgJSM_dsLC9Gd012XWco=nrMS2Fzf_Ejz_9MnjxWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 8/8/22 10:00, Andy Shevchenko wrote:
> On Mon, Aug 8, 2022 at 4:57 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Sun, Aug 7, 2022 at 4:57 PM Ian Pilcher <arequipeno@gmail.com> wrote:
>> Ah, looking into your driver code [1] I think you need to a) switch to
>> use existing GPIO driver, which is gpio-ich.c in your case and b) use
>> GPIO lookup tables, you may look at Simatech latest development on how
>> to achieve that. It uses some Intel chips and LEDs that are connected
>> to GPIOs.
> 
> Same for your I2C GPIO expander, why do you not use the kernel driver for it?!

That "board" module is ancient.  I originally wrote it when I installed
CentOS 6 (kernel 2.6) on my NAS.  Since then, I've only ever touched it
when something breaks - either for me or for one of a very small number
of other users.  In fact, I was running CentOS 7 on the NAS until last
week, when I decided it was finally time to move to a more modern OS.

>>> I know the offset of the GPIO on the chip, but I can't figure out how to
>>> use that.
>>
>> And you don't need to use GPIO offset, whatever it means. What you
>> need is to have a relative number of GPIO to the chip, so GPIO chip +
>> relative offset will uniquely give you the line.

I was using "offset" to refer to the relative number of the GPIO on the
chip, so we're talking about the same thing here.

>>> Ultimately, my goal is to set the direction of the GPIO from within a
>>> "board setup" module.

This turned out to be a bad idea.  It turns out to be easy to set the
GPIO direction from user space, so I'm doing it that way, regardless of
how elegant or inelegant it is.

>>> [1] https://github.com/ipilcher/n5550/blob/master/modules/n5550_board.c
>>
>> Why not try to upstream this?

Mainly because it's a super-niche use case that's never seemed worth the
trouble, as the vast majority of people just run the Thecus-provided OS.

> With the above additional remark I think you will learn a lot about
> Linux kernel programming if you try to upstream, even unsuccessfully

I'm sure that I would, possibly more than I want to.  :-)  (My goal is
not to become a kernel developer; I simply want the blinky lights on my
NAS to work.)

> (which I don't believe can happen if you listen to maintainers, e.g.
> PDx86 subsystem maintainer where your code belongs to).

Well, my own experience doesn't necessarily bear that out (see my
efforts to contribute the block device LED trigger), but point taken.

Again, thanks for the response!

-- 
========================================================================
Google                                      Where SkyNet meets Idiocracy
========================================================================
