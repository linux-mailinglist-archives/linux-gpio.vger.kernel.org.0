Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3D6B5AED45
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 16:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbiIFO3z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 10:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233834AbiIFO2T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 10:28:19 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273C542AFD;
        Tue,  6 Sep 2022 06:54:54 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id D0F264195A;
        Tue,  6 Sep 2022 13:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1662472433; bh=7eZyFfHV2eGca4y6uhLlwtiH1hdF6B1YQ3kNqVZg7Nc=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To;
        b=qV0iUdBp+W3mMFbFHXpAoz5nmwIc8F9BZFqBHKOUJIrcv+6FhbE4R3TnCiJu4Jb2Z
         RPK7vDkNUdM8cWMFFOABmwCB9BD78BChO4RHY58gLuTavD3cLjsPwTepvcV7mDK81m
         fZMM7B4grPEoMdoDUri4UxHe03TNjlW6NBh0Rt8B3Az51MOpuAC7S+PS0+XK5OgCWb
         mNJfI7ri3M86n/wue5RqVTuV1Y0SNsUBW4o64zCxQed72+Try5vzsMUQIC9Wf8+kDB
         MpU9hbfmF2bDWgGpaaoIml0WafYz6vILPGSATlkv8iB+4mxs4ge5NBgPE8w7J8Py3D
         hQm90ht8+W6YQ==
Message-ID: <f5bef359-3abe-311c-3521-136eb5b54c4b@marcan.st>
Date:   Tue, 6 Sep 2022 22:53:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: es-ES
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, arnd@arndb.de, lee@kernel.org,
        alyssa@rosenzweig.io, asahi@lists.linux.dev, brgl@bgdev.pl,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        sven@svenpeter.dev, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org
References: <YxDiBFIn6artUOZm@shell.armlinux.org.uk>
 <CAL_Jsq+GCKisAVA0AfE=yWJYy18mAGQ7rY1sKGYraXv-berNSg@mail.gmail.com>
 <d3cec3d22e464fa8@bloch.sibelius.xs4all.nl>
 <20220902172808.GB52527-robh@kernel.org>
 <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
 <d3cecee5edd24f67@bloch.sibelius.xs4all.nl>
 <CACRpkdaSRcczEF8QZ4aO+-HDVS+n-8MXvn6ysnjJfUEabwUJ=w@mail.gmail.com>
 <909bb4e7-5bd2-2903-5bba-87ae37f3448a@marcan.st>
 <CACRpkdajhjpMzjMooDduu0jxrp0uDNJ90VfBPpHx+P14cFfskA@mail.gmail.com>
 <5b75dc7e-5337-73eb-450f-b72f479793c4@marcan.st>
 <YxdOafCWnDUNourH@shell.armlinux.org.uk>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
In-Reply-To: <YxdOafCWnDUNourH@shell.armlinux.org.uk>
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

On 06/09/2022 22.43, Russell King (Oracle) wrote:
> On Tue, Sep 06, 2022 at 10:28:25PM +0900, Hector Martin wrote:
>> Ultimately, we're working with a reverse engineered platform here, and
>> DTs will inevitaby be incremental. But in this particular case, of
>> hardware that has no known useful purpose to an OS, I don't see the
>> point in gratuitously describing it. And besides, the way we set things
>> up, forward-compatible DT upgrades are trivial, and no actual user on
>> this platform is going to be stuck with an old DT and newer software (if
>> their software supports the platform properly, and that takes more than
>> the relatively trivial DT upgrade stuff anyway). I'm a lot more
>> interested in getting bindings upstreamed ASAP (so we can start
>> guaranteeing no backwards-compat breaks, which is important to avoid
>> outright breakage) than I am in trying to be exhaustive up front with
>> device instances. It's perfectly fine to say that users have to upgrade
>> both their DTs and kernels to get newer hardware support, on these
>> platforms.
> 
> It's also a very common process for SoCs - almost no one writes the
> DT first and then writes the drivers. You always see on the mailing
> list series of patches that add a driver for some bit of hardware,
> along with patches adding the DT binding and the DT description.
> 
> I don't think you're doing anything different here to what is common
> practice within the mainline kernel community with this approach.
> 
> The exception to that is when adding a driver for feature X in a SoC,
> it's common to add all instances of X to the dtsi with ``status =
> "disabled"'' and only enable the appropriate blocks on platforms that
> need it.
> 
> So, for example, if a SoC has three network interfaces, all of them
> identical, when adding a network driver and the bindings for the
> network hardware, one would add all three to the SoC description
> whether or not the platform one was working with makes use of them.

Right, and that makes sense for SoCs that third parties can incorporate
into any arbitrary platform, and which have documentation listing those
instances, because then board-level DTs can just enable the ones they need.

But here we're working with SoCs where the only reference for what
hardware exists *is* Apple's DT, and it only lists hardware that is in
use on existing platforms. So there is no sane way for us to know what
hardware exists, except what we can infer from reading the tea leaves
(e.g. you can tell how many UARTs there are from the power domains and
leaked schematics, but this doesn't extend to everything else). For
example, we also know that these SoCs have a second Neural Engine that
Apple have disabled on all shipping platforms, that the t600x series has
an unused USB3 controller, etc... but there's no way we can safely
describe these things in the DT if we can't test that they work and we
don't have documentation even telling us how they're supposed to work :)

> In the case of gpio-macsmc, how would we later add support for the
> slave PMU GPIOs, given that these use keys "gpXX" rather than "gPxx"?
> How do we tell the gpio-macsmc code to use a different set of keys?
> Should DT describe the key "prefix" (in other words "gp" vs "gP"),
> or should it describe it some other way. What if Apple decides to
> instantiate another GPIO controller in a later platform with a
> different prefix, could that be accomodated without breaking any
> solution we come up today?
> 
> Maybe the solution to this would be to describe the key prefix in DT
> as that's effectively its "reg". Or maybe we use "reg" to describe
> it somehow (which is value of the key, which seems to have an
> "address" like quality to it?)
> 
> We don't have to implement code for this now, we just need to get a
> reasonably correct DT binding for the gpio controller.

I agree that this is something to think about (I was about to reply on
the subject).

I can think of two ways: using `reg` for the key name, but that feels
icky since it's ASCII and not *really* a register number/address, or
something like this:

gpio@0 {
	apple,smc-key-base = "gP00";
	...
}

gpio@1 {
	apple,smc-key-base = "gp00";
	...
}

But this ties back to the device enumeration too, since right now the DT
does not drive that (we'd have to add the subdevice to the mfd subdevice
list somehow anyway, if we don't switch to compatibles).

I'd love to hear Rob's opinion on this one, and also whether the
existing Linux and OpenBSD code would currently find gpio@0 {} instead
of gpio {} for backwards compat.

- Hector
