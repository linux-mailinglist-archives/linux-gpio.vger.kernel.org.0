Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F22398550
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 11:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbhFBJdZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Jun 2021 05:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhFBJdY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Jun 2021 05:33:24 -0400
Received: from mailserv1.kapsi.fi (mailserv1.kapsi.fi [IPv6:2001:67c:1be8::25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE6BC061574;
        Wed,  2 Jun 2021 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=ext.kapsi.fi; s=20161220; h=Subject:Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Sender:
        Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
        :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=AjV7/JHcEMe19kxGoVpLU0xcuOHEXaPt4n0m5dWna2g=; b=CT2Kn/6BMWX/PeaMqTRJg124K7
        /Q9OCBDYUnUEqxr/XMf4++kJb94L7XAZcXlVT7F4VSxBuMasP1I03hZzl5+xVIFJQj7czZXhDuKzf
        pR0oWQ8hGCjizI/41IfRQiCUmPr1Drb484jhg58uweDD+pZjxrWo7fCuFwjtcbbi97ZLpMHQYSi7S
        te21dgWhOaRnKmN9kFKMys/eWFDbUOdFCGPjvVcAfKOWcmbM0T6chtTOjzgKN0NnQqzdL658UBX1J
        /evDLZhftQkR+INEorR8mzG1exCxw+H0jbwpBGaxorZZGPfzXKnY24z051lpOPZVeSy4BgXl0bCXT
        z59pC7QQ==;
Received: from 164-105-191-90.dyn.estpak.ee ([90.191.105.164]:61130 helo=[192.168.3.116])
        by mailserv1.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <maukka@ext.kapsi.fi>)
        id 1loNDr-0001WS-JF; Wed, 02 Jun 2021 12:31:36 +0300
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210530161333.3996-1-maukka@ext.kapsi.fi>
 <20210530161333.3996-2-maukka@ext.kapsi.fi>
 <CACRpkdZfdd=ogHoNGuLzGGZYkvw7xtNO2VJm-t-2vMibGNy=dA@mail.gmail.com>
From:   Mauri Sandberg <maukka@ext.kapsi.fi>
Message-ID: <866ff376-6d74-49c9-9e4c-2bf36bbd5981@ext.kapsi.fi>
Date:   Wed, 2 Jun 2021 12:31:34 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdZfdd=ogHoNGuLzGGZYkvw7xtNO2VJm-t-2vMibGNy=dA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-SA-Exim-Connect-IP: 90.191.105.164
X-SA-Exim-Mail-From: maukka@ext.kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mailserv1.kapsi.fi
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,TVD_RCVD_IP,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.2
Subject: Re: [PATCH v4 1/2] dt-bindings: gpio-mux-input: add documentation
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mailserv1.kapsi.fi)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 1.6.2021 13.44, Linus Walleij wrote:
> On Sun, May 30, 2021 at 6:16 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
>
>> Add documentation for a general GPIO multiplexer.
>>
>> Signed-off-by: Mauri Sandberg <maukka@ext.kapsi.fi>
>> Tested-by: Drew Fustini <drew@beagleboard.org>
>> Reviewed-by: Drew Fustini <drew@beagleboard.org>
> After some thinking I realized these bindings should not
> be restricted to just input. There exist electronic constructions
> such as open drain that would make it possible to mux also
> outputs.
>
>>   .../bindings/gpio/gpio-mux-input.yaml         | 75 +++++++++++++++++++
> Rename it just gpio-mux.yaml
>
>> +$id: http://devicetree.org/schemas/gpio/gpio-mux-input.yaml#
> Also here
>
>> +title: Generic GPIO input multiplexer
> Generic GPIO multiplexer
>
>> +description: |
>> +  A generic GPIO based input multiplexer
> Not just input
>
>> +  This driver uses a mux-controller to drive the multiplexer and has a single
>> +  output pin for reading the inputs to the mux.
> Make this clearer and do not mention "driver".
> Here is a suggestion:
>
> This hardware construction multiplexes (cascades) several GPIO
> lines from one-to-many using a software controlled multiplexer.
> The most common use case is probably reading several inputs
> by switching the multiplexer over several input lines, which in
> practice works well since input lines has high impedance.
>
> Constructions with multiplexed outputs are also possible using
> open drain electronics.
>
>> +  For GPIO consumer documentation see gpio.txt.
> No need to mention this I think, not your problem :D
>
>> +  pin-gpios:
> I still want this renamed like in my previous mail.
>
> Hope all is clear!
>
> Yours,
> Linus Walleij

Hi and thanks the  comments.

Generally I agree with everything you noted above and elsewhere and will 
make changes
accordingly. But there is a small detail that needs to be sorted out. 
The name 'gpio-mux'
has already been taken by 'mux-gpio' driver [2] [3].

Should we look for another name for this driver and it's bindings or 
refactor the mux-gpio's bindings
first? I would be inclined to do the latter as the config symbol for 
mux-gpio is the same way around,
MUX_GPIO.

The bindings for mux-gpio need to be converted to .yaml anyhow and maybe 
the issues with the schema
that Rob pointed out elsewhere would go away too. Otherwise I cannot 
really say what's wrong as the
errors look unrelated to me.

-- Mauri

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mux/gpio-mux.txt
[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mux/gpio.c





