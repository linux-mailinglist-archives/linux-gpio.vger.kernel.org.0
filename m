Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5A55AE97E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 15:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233785AbiIFN2l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 09:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234273AbiIFN2f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 09:28:35 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 572CF74378;
        Tue,  6 Sep 2022 06:28:33 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id E32D44195A;
        Tue,  6 Sep 2022 13:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1662470911; bh=jyzFa+d/WW1HTVfXwMPJ0UMxCC3QGOsvt8da4F6sulE=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To;
        b=xJy/P528mwySImU9dk2Fq97Qq9iX9WKGGiGsHi/piFjIWh10mbFrFNzQMF3Y2cHBw
         PgG5GAX4eNnxCYXsfceC+cjP4i6k2SFekwE6cntht+YbeJKHp8NjHn63dKZhRItD4+
         jWw7DtnoPS1mnZ7VXOPXb5W9oip/HxUvzBBxzGZ4Y7viLMpJw9IdzKJOgyJKwkdAMg
         +iMqn7JhQR9JxH9SXtaT62N0b2fh1/keyjYqqeZqlr7s1lJD7qZd8Lk7IroXPjT9XG
         82jTBkEQCLhlE4quhDKECUzQMTCFgw79yhg3kOSKR4EfZ5bVz/5AFUXqPaQupW0ZRp
         qLdbHZgbQVMIw==
Message-ID: <5b75dc7e-5337-73eb-450f-b72f479793c4@marcan.st>
Date:   Tue, 6 Sep 2022 22:28:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: es-ES
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mark Kettenis <mark.kettenis@xs4all.nl>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, arnd@arndb.de, lee@kernel.org,
        alyssa@rosenzweig.io, asahi@lists.linux.dev, brgl@bgdev.pl,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        sven@svenpeter.dev, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org
References: <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
 <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
 <YxDOpCq0vIlt4VNa@shell.armlinux.org.uk>
 <2fedff34-6a20-f1ce-a756-2bd8671fcd52@linaro.org>
 <YxDWG5dmzErhKIXw@shell.armlinux.org.uk>
 <ef6c7248-1efa-5366-6bcd-900c5f10ccb2@linaro.org>
 <YxDiBFIn6artUOZm@shell.armlinux.org.uk>
 <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl>
 <20220902172808.GB52527-robh@kernel.org>
 <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
 <d3cecee5edd24f67@bloch.sibelius.xs4all.nl>
 <CACRpkdaSRcczEF8QZ4aO+-HDVS+n-8MXvn6ysnjJfUEabwUJ=w@mail.gmail.com>
 <909bb4e7-5bd2-2903-5bba-87ae37f3448a@marcan.st>
 <CACRpkdajhjpMzjMooDduu0jxrp0uDNJ90VfBPpHx+P14cFfskA@mail.gmail.com>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
In-Reply-To: <CACRpkdajhjpMzjMooDduu0jxrp0uDNJ90VfBPpHx+P14cFfskA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/09/2022 20.57, Linus Walleij wrote:
> On Tue, Sep 6, 2022 at 1:36 PM Hector Martin <marcan@marcan.st> wrote:
>> On 06/09/2022 20.22, Linus Walleij wrote:
>>> On Tue, Sep 6, 2022 at 11:31 AM Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
>>>
>>>> Another argument for having sub-nodes is that the firmware actually
>>>> exposes *two* GPIO controllers.  For now we only support the "master"
>>>> PMU GPIOs, but there also is a "slave" PMU GPIO controller that uses a
>>>> separate set of SMC "keys".  We currently don't need any of the pins
>>>> on the "slave", so we don't expose it in the DT yet.
>>>
>>> That sounds backward, like we don't expose device X as DT node
>>> because $OS doesn't use it yet. DT should just expose (by nodes or
>>> other ways) all hardware that exist or at least all hardware we know
>>> about no matter what $OS is using.
>>
>> How so? The are piles and piles of unused hardware not exposed in the
>> DT, and piles and piles of hardware that will be used but we haven't
>> figured out how to do it yet, so it's not exposed. For example, we know
>> there are like 8 or so UARTs, but we don't define them in the DT because
>> they are not connected to anything on any existing device and we don't
>> need them. Apple does the same thing in their DTs (only used hardware is
>> defined).
>>
>> I don't really see the point of exposing a GPIO controller when we don't
>> actually do anything with the pins yet, and might never do so. Having
>> drivers bind and stay unused just increases the amount of code running
>> without any ultimate purpose, so why do it? It's not like any other OS
>> would use the hardware either - GPIOs are only useful if they are
>> referenced in the DT for something, and we don't have anything that
>> would reference these.
> 
> This comes from the FDT background in OpenFirmware, and there is
> definitely a timeline perspective (also called "waterfall model") in that
> line of thinking: a DT is written that describes the hardware and flashed
> into the BIOS and never changed, then the operating system is
> implemented at a later point. This is how e.g. the PC ACPI BIOS tables
> are also thinking about themselves.

Yes, but again, that only makes sense from the point of view of
describing hardware that exists, is useful, and could be used by the OS.

For any given platform X, if platform X does not use the secondary GPIO
controller for any service describable in the DT, then there is no point
in describing that GPIO controller. Same way ACPI tables do not describe
every single physical GPIO available on a platform, just whatever is
used by the AML.

This is the case for every existing Apple device to my knowledge.
Apple's device trees have zero references to the secondary controller's
GPIOs. It's possible they are only used internally by SMC, or they were
added to support future platforms that don't exist yet, or for debugging
purposes, or who knows.

If some day we find a use for those GPIOs, that would require a DT
change *anyway*, to describe that usage, and the controller could be
described then (we did something like that, using a GPIO that Apple
doesn't, for the interim display-backlight power control support, though
that is a temporary hack that will go away). Heck, we don't even know
what these GPIOs are connected to right now!

Ultimately, we're working with a reverse engineered platform here, and
DTs will inevitaby be incremental. But in this particular case, of
hardware that has no known useful purpose to an OS, I don't see the
point in gratuitously describing it. And besides, the way we set things
up, forward-compatible DT upgrades are trivial, and no actual user on
this platform is going to be stuck with an old DT and newer software (if
their software supports the platform properly, and that takes more than
the relatively trivial DT upgrade stuff anyway). I'm a lot more
interested in getting bindings upstreamed ASAP (so we can start
guaranteeing no backwards-compat breaks, which is important to avoid
outright breakage) than I am in trying to be exhaustive up front with
device instances. It's perfectly fine to say that users have to upgrade
both their DTs and kernels to get newer hardware support, on these
platforms.

- Hector
