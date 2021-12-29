Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C170A4816EB
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Dec 2021 22:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232086AbhL2VLL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Dec 2021 16:11:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbhL2VLL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Dec 2021 16:11:11 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704D6C061574;
        Wed, 29 Dec 2021 13:11:11 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id n30-20020a17090a5aa100b001b2b6509685so3635471pji.3;
        Wed, 29 Dec 2021 13:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lUnDghFJEnX7HKIkKaL2v/UI+FnjGpWjBjAatHbaNyk=;
        b=SDadAKXPNwYijC1AOhPAM5AgMIX9fs8P1KgwyPT5waMcWKHvI8dR80dztwfZa2E2R7
         S8xZcBNqEGnadZM9eesKZMJmWw5OHgW4dQoH4FF9uJjsghMT0zjdvfEVx4nOZje3pRiO
         3BVlOX96ehGgywIkZxEWyMP+y68Kj7qw1Qd8+gW9g+AHhPg3lYVo3KuHuEvSO5fciwL6
         dYzgZaTj0CQCFpRr2WarQmvhFF6nD+wHtZ3hBdNGi5P7WgX4IWS+DbQntqzsG4D6ijNS
         T+r0JQhKScO7bSGX1mZDk1HuzYtfxc4hLKAxFlIJ73QMVHGRYwIK0jBXqgBudJEHaP9V
         XXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lUnDghFJEnX7HKIkKaL2v/UI+FnjGpWjBjAatHbaNyk=;
        b=SrWyP5nC62Io/i0IkTsnew7SGICY23ZLUBXVXczsYubepx7Q0YsPBF6hAVnTm+ECht
         /XICcLolK2QNkgd0C6LjwZddFzD3GKPdRL7w3l2ZK9WlcE6u3GjM/Ium8LQ358Czu0m5
         RhTg2TMdkKKpicu9XNxyCNK0vyBOGiFNbz/49AlRyV0Lk1+P4oYAa82XS/b+AM6FnC+t
         Gv9qY2zEqczDEywANpXrC//eFmEwcVDl2lfw2lllzidPMUodFZ25JXTp3svdmYs9B+DK
         QX7IL4PtnxLq7/OvWTteZ9kwBBPaQaTsEr+pL6twVoE4PclWpicLWfZOg2szz81kLZuZ
         fjNA==
X-Gm-Message-State: AOAM531t3wV5xNhTVo1uH0N0Rd2BITePpqfPwsv2Dv+yEFqnZKahu0Pz
        ipIKTrVU6u/9/3PUiF7oVw0=
X-Google-Smtp-Source: ABdhPJxgjH2BR2Fy0OP7CMCAJhKPBcHuWX/2CL0KSZ7eg2bVhtRnS+AyKSrwtfEwTmuke3HvOb0w3w==
X-Received: by 2002:a17:90b:33cd:: with SMTP id lk13mr34215326pjb.35.1640812270900;
        Wed, 29 Dec 2021 13:11:10 -0800 (PST)
Received: from ?IPV6:2600:8802:b00:4a48:580b:8916:6bbf:96c9? ([2600:8802:b00:4a48:580b:8916:6bbf:96c9])
        by smtp.gmail.com with ESMTPSA id q28sm20840398pgn.14.2021.12.29.13.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Dec 2021 13:11:10 -0800 (PST)
Message-ID: <1df8425c-c1bb-3d1e-4a78-87b6d0967d57@gmail.com>
Date:   Wed, 29 Dec 2021 13:11:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 1/2] pinctrl: bcm2835: Change init order for gpio hogs
Content-Language: en-US
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Phil Elwell <phil@raspberrypi.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-gpio@vger.kernel.org,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Thierry Reding <treding@nvidia.com>
References: <20211206092237.4105895-1-phil@raspberrypi.com>
 <20211206092237.4105895-2-phil@raspberrypi.com>
 <CACRpkdZ95bCJVDo4tCXsMnsXax4+ZydoLS7AsM-yzMjXbONk=w@mail.gmail.com>
 <95851343-2887-1e04-9598-e8c8ae74a99a@i2se.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <95851343-2887-1e04-9598-e8c8ae74a99a@i2se.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 12/29/2021 11:07 AM, Stefan Wahren wrote:
> Am 10.12.21 um 00:24 schrieb Linus Walleij:
>> On Mon, Dec 6, 2021 at 10:22 AM Phil Elwell <phil@raspberrypi.com> wrote:
>>
>>> ...and gpio-ranges
>>>
>>> pinctrl-bcm2835 is a combined pinctrl/gpio driver. Currently the gpio
>>> side is registered first, but this breaks gpio hogs (which are
>>> configured during gpiochip_add_data). Part of the hog initialisation
>>> is a call to pinctrl_gpio_request, and since the pinctrl driver hasn't
>>> yet been registered this results in an -EPROBE_DEFER from which it can
>>> never recover.
>>>
>>> Change the initialisation sequence to register the pinctrl driver
>>> first.
>>>
>>> This also solves a similar problem with the gpio-ranges property, which
>>> is required in order for released pins to be returned to inputs.
>>>
>>> Fixes: 73345a18d464b ("pinctrl: bcm2835: Pass irqchip when adding gpiochip")
>>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
>> This patch (1/2) applied for fixes.
> 
> Unfortunately this change breaks all GPIO LEDs at least on the Raspberry
> Pi 3 Plus (Linux 5.16-rc7, multi_v7_defconfig). The ACT LED for instance
> stays in the last state instead of the configured heartbeat behavior.
> Also there are no GPIO LEDs in /sys/class/leds/ directory.
> 
> After reverting this change everything is back to normal.

And this patch has already been applied to the stable 5.15 and 5.10 
branches as well, FWIW.
-- 
Florian
