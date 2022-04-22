Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21E2050B71F
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Apr 2022 14:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1447350AbiDVMVs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 08:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235624AbiDVMVr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 08:21:47 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 620FA55222;
        Fri, 22 Apr 2022 05:18:54 -0700 (PDT)
Received: from [2a02:8108:963f:de38:6624:6d8d:f790:d5c]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1nhsFP-000118-K1; Fri, 22 Apr 2022 14:18:51 +0200
Message-ID: <ae465387-7d77-a208-2c9d-18d6ffad69a0@leemhuis.info>
Date:   Fri, 22 Apr 2022 14:18:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] gpio: Request interrupts after IRQ is initialized
Content-Language: en-US
From:   Thorsten Leemhuis <regressions@leemhuis.info>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     firew4lker <firew4lker@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Shreeya Patel <shreeya.patel@collabora.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Basavaraj.Natikar@amd.com, Richard.Gong@amd.com,
        stable@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20220414025705.598-1-mario.limonciello@amd.com>
 <20966c6b-9045-9f8b-ba35-bf44091ce380@gmail.com>
 <67df4178-5943-69d8-0d61-f533671a1248@amd.com>
 <CACRpkdbvN0ZJnn+N=Vt2n_aO4CnM=E4qpe_3dmu-c8_Ufp8ZzQ@mail.gmail.com>
 <de25abef-c071-9f71-36dd-8f2f0b77dc28@leemhuis.info>
In-Reply-To: <de25abef-c071-9f71-36dd-8f2f0b77dc28@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1650629934;3fe65a09;
X-HE-SMSGID: 1nhsFP-000118-K1
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21.04.22 18:07, Thorsten Leemhuis wrote:
> On 20.04.22 00:02, Linus Walleij wrote:
>> On Mon, Apr 18, 2022 at 6:34 AM Mario Limonciello
>> <mario.limonciello@amd.com> wrote:
>>
>>> Linus Walleij,
>>>
>>> As this is backported to 5.15.y, 5.16.y, 5.17.y and those all had point
>>> releases a bunch of people are hitting it now.  If you choose to adopt
>>> this patch instead of revert the broken one, you can add to the commit
>>> message too:
>>>
>>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1976
>>
>> I am on parental leave kind of, but Bartosz knows what to do,
>> in this case, since it is ACPI-related, Andy knows best what
>> to do, and I see he also replied.
> 
> Bartosz, Andy, what's the status here? It looks like the patch didn't
> make any progress in the past few days (or did I miss it?). I'd really
> like to see this patch or a revert of 5467801f1fcb ("gpio: Restrict
> usage of GPIO chip irq members before initialization") mainlined by rc4,
> so Greg (CCed) can fix it in the next round of stable updates, as it
> seems quite a few people are affected by the problem.

Mario, are you aware if this patch made any progress towards getting
merged? If not, I wonder if we (you?) maybe should ask Linus to pick
this up directly giving the circumstances to speed things up (or maybe a
v2 that incorporates all the Reviewed-by/ACKs that accumulated).

Ciao, Thorsten

> Reminder: this is one of those issue that we IMHO really should fix
> quickly, as explained by a text recently added to the documentation:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/handling-regressions.rst#n131
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> P.S.: As the Linux kernel's regression tracker I deal with a lot of
> reports and sometimes miss something important when writing mails like
> this. If that's the case here, don't hesitate to tell me in a public
> reply, it's in everyone's interest to set the public record straight.
> 
