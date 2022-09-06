Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD1E5AE6B2
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 13:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232925AbiIFLgj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 07:36:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233020AbiIFLgg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 07:36:36 -0400
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0F47645F;
        Tue,  6 Sep 2022 04:36:33 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id D82EB41F12;
        Tue,  6 Sep 2022 11:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
        t=1662464191; bh=iZaovA3utTa1MRTvB6tlYyIRYCuVcLY9Hsc4sBAEXHA=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To;
        b=gaJghwidE54NgcQlYlv0xIM81NWChh/4fnOJRbbzs/VRr8HNzQ+WaJtZkHSV1tH8u
         81Vth9//yauZpcTBB4TgSuAuAo09pCRsJvYfzYsJiDD6Guai6KQ0tp/452hyfGdi3/
         /cbMpAKzpFLy58hDgpKnppEl7OT58u11d6/2pVPtXgP6RbhvMQQgeIO+c4XiseVZu5
         a8hgRWBghjlRPgcLXpaeJT6nwkrmbdBxcUVIIacVl3z5JEPQplCbjV13euzaopq+Gc
         xDs3MqsdVMSni2cvqh2cKVoTWllkCHOrgCDQNVGxohTU5YDF0lZWqi3/RGqFhq/Ck3
         d8zQBxImKX+wQ==
Message-ID: <909bb4e7-5bd2-2903-5bba-87ae37f3448a@marcan.st>
Date:   Tue, 6 Sep 2022 20:36:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: es-ES
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>, robh@kernel.org,
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
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
In-Reply-To: <CACRpkdaSRcczEF8QZ4aO+-HDVS+n-8MXvn6ysnjJfUEabwUJ=w@mail.gmail.com>
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

On 06/09/2022 20.22, Linus Walleij wrote:
> On Tue, Sep 6, 2022 at 11:31 AM Mark Kettenis <mark.kettenis@xs4all.nl> wrote:
> 
>> Another argument for having sub-nodes is that the firmware actually
>> exposes *two* GPIO controllers.  For now we only support the "master"
>> PMU GPIOs, but there also is a "slave" PMU GPIO controller that uses a
>> separate set of SMC "keys".  We currently don't need any of the pins
>> on the "slave", so we don't expose it in the DT yet.
> 
> That sounds backward, like we don't expose device X as DT node
> because $OS doesn't use it yet. DT should just expose (by nodes or
> other ways) all hardware that exist or at least all hardware we know
> about no matter what $OS is using.

How so? The are piles and piles of unused hardware not exposed in the
DT, and piles and piles of hardware that will be used but we haven't
figured out how to do it yet, so it's not exposed. For example, we know
there are like 8 or so UARTs, but we don't define them in the DT because
they are not connected to anything on any existing device and we don't
need them. Apple does the same thing in their DTs (only used hardware is
defined).

I don't really see the point of exposing a GPIO controller when we don't
actually do anything with the pins yet, and might never do so. Having
drivers bind and stay unused just increases the amount of code running
without any ultimate purpose, so why do it? It's not like any other OS
would use the hardware either - GPIOs are only useful if they are
referenced in the DT for something, and we don't have anything that
would reference these.

For SMC in particular, there's a huge amount of functionality we don't
have drivers for yet, and I don't see the point of trying to conjure up
DT bindings for it until someone writes a driver (and has a reason to do
so) :)

> FWIW I think nodes makes most sense because no doubt for example
> the RTC is a separate hardware unit somewhere, and so is the
> GPIO. The fact that it is hidden behind a software abstraction doesn't
> change the fact that the HW definitely has these discrete units.

The RTC and the GPIO happen to be part of the same physical IC (PMU),
but yes, I agree.

- Hector
