Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D357345A41A
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 14:51:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbhKWNyb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 08:54:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbhKWNyb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Nov 2021 08:54:31 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B72C061574;
        Tue, 23 Nov 2021 05:51:23 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b1so90708217lfs.13;
        Tue, 23 Nov 2021 05:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=mqptCX+502+mx6/wZxLi7LpP5N5dapcrK2a1j1LK8cQ=;
        b=IllgtvhxFASFCMtRpE1WL6MnoONv+z2DcgDLseoBlwJkiPnf9yfyxqhWKvhdlI2SOx
         uJacMi8Vos879q8zZjIdhyl9LIjRoyej+GN2agWXp0DIng2OWdcsJ/p7mRJI8Cvdo/Jy
         4FWGmYRTmY+Art33LXfdlbL7M3OY8nQxkMGEaJzcGX0jV59DWq/cZq3elJNNVJW8+utk
         mpcqK2au3Dz3YPeB0d19QQjp7pV1dun9rcyi5yfQyzgSIzXFf3QdCV3lN8W6tsPKJ4p4
         3ctTN0gnl6C8nNOYNPsS7ZodNpzg0SoOp3rBLWkd+epG4zauPMElhO9gQbNDA0W4itai
         MUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mqptCX+502+mx6/wZxLi7LpP5N5dapcrK2a1j1LK8cQ=;
        b=F5lo5JnqIQxs9a6nNTpD5L99WRi5OnkZDDM3ufKpD/uo4g94RBsRoS6tflSrIwtRhz
         AdQXTfHAHAgYnOHSL0VhZkJgcBqTbmB5ZbRprgaQW2tiaEWuG+3sGvIo7luJDUW5qTFI
         IOtwodaKdDLK+cfSdbh/QQTYI+ZXyuk8d/S4cywFEBL6Dg6cc4DBEosttnrLx/csBlYL
         5LoMRZmXp1UXZJbgr++vXJkIlznpNAqYYcf98KzDO644RuXkzhWuIUKv17pO/wJs2W3A
         a66oAExgRXxP3BtyCGQhtbxNbRaGkk6P7PfHxlGWOh99B9xyCqyUxFmKkzynCeBSH8lP
         gP5g==
X-Gm-Message-State: AOAM532WlbAu2535UYpGwNIg6qgB6CuYMp3tOC8Ra7qLxLkmpEAQVBp5
        HVKcO8lppU+gFd1LqaWhP6g=
X-Google-Smtp-Source: ABdhPJxt5imPZWnFv7AIgYdK1TCp7y2MzUMhS4MDwdLStIpWDAFBkAOHdSWJ+qvI/InaAVcHVfumrA==
X-Received: by 2002:a19:c34a:: with SMTP id t71mr4946142lff.146.1637675481263;
        Tue, 23 Nov 2021 05:51:21 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id e17sm1296602lfr.296.2021.11.23.05.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 05:51:20 -0800 (PST)
Message-ID: <505c6616-2953-8301-8721-9d6c003a40fd@gmail.com>
Date:   Tue, 23 Nov 2021 14:51:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH 2/5] dt-bindings: pinctrl: brcm,ns-pinmux: extend example
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211118132152.15722-1-zajec5@gmail.com>
 <20211118132152.15722-3-zajec5@gmail.com> <YZyahbYwMFz7baTu@atomide.com>
 <2fb0593a-208f-a732-843b-b6723633e208@gmail.com>
 <YZyxPdBYl/yWYyoT@atomide.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <YZyxPdBYl/yWYyoT@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23.11.2021 10:15, Tony Lindgren wrote:
> * Rafał Miłecki <zajec5@gmail.com> [211123 07:56]:
>> Does it mean above "reg" usages are all incorrect and binding "reg" in
>> such way is deprecated? This is something totally new to me, can you
>> confirm that, please?
> 
> Here you have a device with multiple control register instances at
> various register offsets. Using index here makes as much sense as
> the old interrupt number defines we used to have but got rid of.
> 
> Please don't use an index to address them. Index makes sense when
> there is no real offset to use, like a SPI chip select, or a bit
> offset inside the register like a GPIO instance bit.

I think I'll simply trust you on this as there seems to be some thin
line I can't really see. It may be however worth documenting somehwere
what's the rule for changing "reg" context. So that in future less
experienced developers (like me) don't bother maintainers with such
bad concepts.

What I understood from your e-mail is that it's a matter of "reg" usage
in a hardware block binding. If reg contains "multiple control register
instances" (I understand it as reg space size > 0x4) then children nodes
may use "reg" only as address in that register space.

My above understanding doesn't fit however what I see in various
controllers.

*****

Example 1:

usb/generic-xhci.yaml / usb/usb-xhci.yaml

That block binding covers *multiple* registers, see:
reg = <0xf0931000 0x8c8>;

However its children nodes are indexed and use "reg", see:
hub@1 {
     compatible = "usb5e3,610";
     reg = <1>;
};

*****

Example 2:

spi/spi-controller.yaml

That binding uses "fsl,imx28-spi" as example. Its binding covers
*multiple* registers, see:
reg = <0x80010000 0x2000>;

However its children nodes are indexed and use "reg", see:
display@0 {
     compatible = "lg,lg4573";
     spi-max-frequency = <1000000>;
     reg = <0>;
};

*****

So it appears my understanding is wrong somewhere. It seems to be a bit
tricky to get things right so I'd really appreciate some documentation
on that.
