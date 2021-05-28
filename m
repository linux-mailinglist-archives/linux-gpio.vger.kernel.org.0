Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC6E394658
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 19:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232936AbhE1RZB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 13:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhE1RZA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 13:25:00 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 014CFC061574;
        Fri, 28 May 2021 10:23:25 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id C0C7222172;
        Fri, 28 May 2021 19:23:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1622222603;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IDuWvQqFShHWimnqBlKHNcabbY7RqOavTF/jlqWv7vg=;
        b=K5ymFjHp5q2y6BgWN9HIr/0HIhOhJvH5h/ZBhRWPlvfq3w9qyETvRf+fG1vmegHdgZC3Wq
        Pv2VvOxmBNoAX1dYSdbMoWJP2EbDd72bZHItpidXenI2EmxnCL2seVKaIgTPLiGcXlyILf
        Ko/lKknnCY2Hcu6M1XIKWoMhdLeVovg=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 28 May 2021 19:23:23 +0200
From:   Michael Walle <michael@walle.cc>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     bgolaszewski@baylibre.com, bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-power <linux-power@fi.rohmeurope.com>,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, jonas.gorski@gmail.com,
        noltari@gmail.com, andy.shevchenko@gmail.com, f.fainelli@gmail.com
Subject: Re: [PATCH v4 0/3] gpio: gpio-regmap: Support few custom operations
In-Reply-To: <93578f0271fba68429f911c74acc1b7bd5610644.camel@fi.rohmeurope.com>
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
 <CACRpkdaSr_CV1pKS44Ru15AEJ0-1429+6E7Lei2sPHdaijr9iw@mail.gmail.com>
 <0c2a8ffab666ef31f5cee50b8b47767285dfe829.camel@fi.rohmeurope.com>
 <CACRpkdZ2GdrGr8-XnVvf59O4AVBueBjX0PHYGtOeOdGXi=iE4A@mail.gmail.com>
 <15d9e565021c115eec268c7fca810799eb503a90.camel@fi.rohmeurope.com>
 <CAMpxmJVJAX8jPrYg3=jkG4JqEEnUfpexfn+cFKWJQYpdRJaRUA@mail.gmail.com>
 <93578f0271fba68429f911c74acc1b7bd5610644.camel@fi.rohmeurope.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ee700b25c170047045a65bed2236089d@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Matti,

Am 2021-05-28 17:42, schrieb Vaittinen, Matti:
> Hi Bartosz,
> 
> On Fri, 2021-05-28 at 16:31 +0200, Bartosz Golaszewski wrote:
>> On Fri, May 28, 2021 at 8:33 AM Vaittinen, Matti
>> <Matti.Vaittinen@fi.rohmeurope.com> wrote:
>> 
>> [snip]
>> 
>> > > What makes things easy for me to maintain is active and happy
>> > > driver maintainers, so it is paramount that the file looks to
>> > > Michael
>> > > like something he wants to keep maintaining. This removes work
>> > > from me and Bartosz.
>> >
>> > I agree. When someone takes care of a driver, he should be happy
>> > with
>> > it. Period. And thanks to Michael for writing this driver and
>> > reviewing
>> > the patches. Reviewing is hard work.
>> >
>> > On the other hand, I don't enjoy writing code I am unhappy with
>> > either.
>> > And as this particular piece of code is not a paid task for me, I
>> > do
>> > this for fun. gpio-regmap is not mandatory for my drivers now. So,
>> > I'll
>> > just opt-out from this change. I'll happily use the gpio-regmap
>> > where
>> > it fits, when it fits.
>> >
>> 
>> I take it that path 2/3 is still good to go?
> 
> I don't think it had explicit ack from Michael yet - but I think it was
> not objected either. I can respin it alone if needed but would help me
> if you just pick it from this series (assuming it's Ok for others).

Just sent my R-b.

I'd pick the removal of the gpio_regmap_set_drvdata(), too. If you're
fine with it I'd submit a new patch with just that.

-michael
