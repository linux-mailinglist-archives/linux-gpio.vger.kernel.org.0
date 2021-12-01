Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60F72465283
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Dec 2021 17:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351376AbhLAQL2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 11:11:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351382AbhLAQL2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 11:11:28 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5609DC061574
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 08:08:07 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id u1so53379493wru.13
        for <linux-gpio@vger.kernel.org>; Wed, 01 Dec 2021 08:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=up9aWqNU++fIqZ5rpoghBL3aWKa9Mbv5J65Y802nH48=;
        b=CKLuRG1D/Fx9ICAVbH1iS1A9K282AihRM8V+4+Ka4FPetKWVwqJ6X8fH1KtoniSpob
         vAVoRSBj/87eusJ+X3eB5LFALpxuzQfjFgvoBdoBNJWHqvfVl/riYCVXiok4BoeJaMNb
         gQBvEPgXqAPrOC3EXXZkcvfZQY02BjcM+tDCT8FNSozuf1nbCOQSejYXtsJfUW6Eq+ot
         p0MSoqZjCGwOwCHl0OmKJiVQUabXOR7za9y9pdmjYwdx4iqsElI6Cg3ulPTh77QtN+ZJ
         ybOgy3aE9hf3Uo9T5Q13MHPOEsps696kieVPGMMc9+04nto6X3/1CP18LZWwXWNtNmVN
         AN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=up9aWqNU++fIqZ5rpoghBL3aWKa9Mbv5J65Y802nH48=;
        b=wCvCt++URVMRhu/WpA+PqmxNzjT2DSqummt16TqVN//eFydreHvkDHohdAHuztg2nK
         OhGlQWcOeWw0ug1a7vA1SHyBuu5P2Znn5YpSow6PhdiA9IFZXuFcqh7jJXdYaiC0sx9N
         oxbrRhJCvNNVtUclrSlKowG8DgxxfJphhvAVKP89/zyPId2SK2T6NAyAHhaOJfXO8D6o
         CYiB/YSEgd8qCqw83CJYFoHv+9A7AFQOW3D7bhwpmiABeCyPptABzwx6XVc7E8Jmn9nr
         utmRR7s6aLLJ0ceg+N8VgnF9mH8xrBJWvLtFCUA8sEYOj2fmeN4GdGa4I3fiJ4J4irQP
         FZaA==
X-Gm-Message-State: AOAM531gscnEyJa+tFbw8UH2CjT/O3y8PlnsAxWgo8AlarDWPWpxtSMp
        m3cwj8kwgekd7qCFohzt17TMyA==
X-Google-Smtp-Source: ABdhPJwIcn/Ajhb5/TTb5upg1Lb8z70PlKpvwWbi04Ie5jC8PsHijD5v++Ql5vwM9pYClpU4O4Lk9Q==
X-Received: by 2002:a5d:5144:: with SMTP id u4mr7895393wrt.91.1638374885967;
        Wed, 01 Dec 2021 08:08:05 -0800 (PST)
Received: from ?IPV6:2a00:1098:3142:14:3430:4041:27d3:fbce? ([2a00:1098:3142:14:3430:4041:27d3:fbce])
        by smtp.gmail.com with ESMTPSA id l26sm235841wms.15.2021.12.01.08.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 08:08:05 -0800 (PST)
Message-ID: <3f03d11b-ed73-9f1e-5de1-44cb3ae3e415@raspberrypi.com>
Date:   Wed, 1 Dec 2021 16:08:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/2] pinctrl: bcm2835: Change init order for gpio hogs
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20211129105556.675235-1-phil@raspberrypi.com>
 <20211129105556.675235-2-phil@raspberrypi.com>
 <CAHp75Vei9FUY0gGD99gVv_FZzcpN1y_i65BB-auyAFUwqsQxNA@mail.gmail.com>
 <06345f5a-c8e7-848b-d25f-3f3e32ab5418@raspberrypi.com>
 <CAHp75VcZNUXxk7rD2sL=AFe4kz+hXX361rp15K8fN1c4x8zhXA@mail.gmail.com>
From:   Phil Elwell <phil@raspberrypi.com>
In-Reply-To: <CAHp75VcZNUXxk7rD2sL=AFe4kz+hXX361rp15K8fN1c4x8zhXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01/12/2021 15:38, Andy Shevchenko wrote:
> On Wed, Dec 1, 2021 at 5:18 PM Phil Elwell <phil@raspberrypi.com> wrote:
>> On 01/12/2021 12:06, Andy Shevchenko wrote:
>>> On Monday, November 29, 2021, Phil Elwell <phil@raspberrypi.com
>>> <mailto:phil@raspberrypi.com>> wrote:
>>>
>>>      ...and gpio-ranges
>>>
>>>      pinctrl-bcm2835 is a combined pinctrl/gpio driver. Currently the gpio
>>>      side is registered first, but this breaks gpio hogs (which are
>>>      configured during gpiochip_add_data). Part of the hog initialisation
>>>      is a call to pinctrl_gpio_request, and since the pinctrl driver hasn't
>>>      yet been registered this results in an -EPROBE_DEFER from which it can
>>>      never recover.
>>>
>>>      Change the initialisation sequence to register the pinctrl driver
>>>      first.
>>>
>>>      This also solves a similar problem with the gpio-ranges property, which
>>>      is required in order for released pins to be returned to inputs.
>>>
>>>
>>> We have a callback in GPIO chip to register pin ranges, why driver does it
>>> separately?
>>
>> A few experiments (this is not my driver) appear to show that the call to
>> pinctrl_add_gpio_range can be removed, but only once the gpio-ranges DT property
>> has been added if we want to remain functionality throughout a bisect. That tidy
>> up might be better done with a followup commit once the DT patch has also
>> been accepted, unless it's possible to guarantee the sequencing between
>> the pinctrl/gpio tree and the DT tree.
> 
> What I meant is why these calls are done in the probe and not in
> ->add_pin_ranges() callback?
> Shouldn't it fix the issue you have observed?

I'm no expert in the field, isn't it preferable to set the gpio-ranges 
pinctrl<->GPIO correspondence with a single line of DT rather than several lines 
of code? A quick grep shows over 700 instances of gpio-ranges in DT, at least 
some of which are reflexive, and only 7 drivers with add_pin_ranges methods.

>>>      Fixes: 73345a18d464b ("pinctrl: bcm2835: Pass irqchip when adding
>>>                              gpiochip")
>>>      Signed-off-by: Phil Elwell <phil@raspberrypi.com <mailto:phil@raspberrypi.com>>
>>>
>>> Is it originally so strange indentation or is it only on my side?
>>
>> The "g" is below the "p" in the patch.
> 
> Which is wrong. Tags mustn't be multilines (i.e. split over a single line).

checkpatch disagrees:

scripts/checkpatch.pl 0001-ARM-dts-gpio-ranges-property-is-now-required.patch
WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#10:
[1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")

Phil

