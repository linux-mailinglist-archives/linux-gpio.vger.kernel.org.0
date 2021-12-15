Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 157AA475E57
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Dec 2021 18:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245195AbhLOROy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Dec 2021 12:14:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245165AbhLOROx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Dec 2021 12:14:53 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C48C4C061574;
        Wed, 15 Dec 2021 09:14:53 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id a11-20020a17090a854b00b001b11aae38d6so410379pjw.2;
        Wed, 15 Dec 2021 09:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YT8smCp++7rpjPPvcLC6ZleZpIbwHY0O/hwtx+yl3nI=;
        b=HCYSWGQ4oDB4ZZz3sVUf6ZCzZ8wGD2VV3Y7NgNheJ7VCUFTcctESj9txImuuYRx/F/
         Kcd0SMvPIFdrD9ihVkWqnzqB8dyZTC1corWSsxV9Zm7S+k+PIIfOg2Q/hrxGtBEpHH2i
         rPwzmy13cVId2jMqRIhURoURSX8XKvwoAmKimOZjL2f9+hg189xihtYxA7lozptbphYa
         9KP555DBuuyheUYgP4mRbOUPa1N26L09o+he1ng6kPRw0Z89miY6s4abiSxa2YCGXPkn
         AgbtnNtVNHHcYZZJvWy3//6cH7pKTmGNIX6S8wrRlvjc96r6QqsukfHQnt/Q8ABtAIA/
         P2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YT8smCp++7rpjPPvcLC6ZleZpIbwHY0O/hwtx+yl3nI=;
        b=00Z8x3TDmB7QnZgk1FCN0bozyWPnIBTt1xlGx9y5WGcyL5mEjh/c7/2MvffPAGr+Yy
         lsIb1eZnzkwG7wXdIGrb/elM0GibWzekBVakANGJX5iI8BeOmcSd+tcpm2a9u96cD66o
         gQ92rizc4FOtDRmoogSH79nAhDr0pXbJa0CgCwb5cK54QRhce17oWY1nqDLz+9PVbKpt
         QSpfQb8wEJ9IY5JOXqLaYJ0Niw8kM7VDF+BnAXKHdtyr5dkeIMbI6UfIW3yjlNoK3z8X
         M4rDOky5ASw8hRANrEjJSun8dU13TxNbPA4p34GdYSNhx+L6m5YBTAsn5htCxD1HOC5Q
         WTzQ==
X-Gm-Message-State: AOAM5317Z8DlYwyS43XfhgJ5yTwtF3gbx1vrJL4xArY+FnRAQ9w67SEM
        5ZGy00DVELJO/fTP+srhTLno73GP7vo=
X-Google-Smtp-Source: ABdhPJx4dVZ/4Ilnr8TFqwhG2CPESVXzwo/g1+SeeBTx7zBteTbjwPh6cpH9XwtCajto4dJ4LDLdsA==
X-Received: by 2002:a17:902:f54d:b0:146:8d4f:1b68 with SMTP id h13-20020a170902f54d00b001468d4f1b68mr12321855plf.25.1639588492813;
        Wed, 15 Dec 2021 09:14:52 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id n22sm3195333pfu.2.2021.12.15.09.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 09:14:51 -0800 (PST)
Subject: Re: [PATCH v2 2/2] ARM: dts: gpio-ranges property is now required
To:     nicolas saenz julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linus.walleij" <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
References: <20211206092237.4105895-1-phil@raspberrypi.com>
 <20211206092237.4105895-3-phil@raspberrypi.com>
 <CGME20211214142139eucas1p1c100b7fd4b8c8ce85bc03e1ce6b783db@eucas1p1.samsung.com>
 <8671ebd8-a853-7394-9864-0457514337e2@samsung.com>
 <2ce5956f-ce8c-80f0-df9a-492a8da00a08@raspberrypi.com>
 <dbba6665-9688-9a5e-091b-eaa8e92e6886@gmail.com>
 <83bda801c9be665086f94acce46d44da5d24ba9c.camel@kernel.org>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <45fa0de1-c2be-84dd-782e-184ab608895f@gmail.com>
Date:   Wed, 15 Dec 2021 09:14:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <83bda801c9be665086f94acce46d44da5d24ba9c.camel@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/15/21 1:02 AM, nicolas saenz julienne wrote:
> Florian,
> 
> On Tue, 2021-12-14 at 09:12 -0800, Florian Fainelli wrote:
>> On 12/14/21 6:32 AM, Phil Elwell wrote:
>>> Hi Marek,
>>>
>>> On 14/12/2021 14:21, Marek Szyprowski wrote:
>>>> Hi Phil,
>>>>
>>>> On 06.12.2021 10:22, Phil Elwell wrote:
>>>>> Since [1], added in 5.7, the absence of a gpio-ranges property has
>>>>> prevented GPIOs from being restored to inputs when released.
>>>>> Add those properties for BCM283x and BCM2711 devices.
>>>>>
>>>>> [1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
>>>>>       pin-ranges")
>>>>>
>>>>> Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without
>>>>> pin-ranges")
>>>>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
>>>>
>>>> This patch breaks today's linux-next (next-20211214) on RPi3 and RPi4.
>>>> Either there is something missing or wrong here. Booting stops after
>>>> following messages (on RPi4):
>>>>
>>>> [    3.186786] pinctrl-bcm2835 fe200000.gpio: could not add GPIO chip
>>>> [    3.234513] pinctrl-bcm2835 fe200000.gpio: could not add GPIO chip
>>>> [    3.276703] mmc0: SDHCI controller on fe340000.mmc [fe340000.mmc]
>>>> using ADMA
>>>> [    3.287191] pinctrl-bcm2835 fe200000.gpio
>>>
>>> This patch is part of a two-patch set, the cover note for which says:
>>>
>>>     2. Since [1], a "gpio-ranges" property is required in order for pins
>>>     to be returned to inputs when freed. Note that without patch 1, the
>>>     device never gets out of EPROBE_DEFER.
>>>
>>> It looks as though patch 2 has been merged without/before patch 1
>>> ("pinctrl: bcm2835: Change init order for gpio hogs").
>>
>> Yes, the hope was that there would be no such breakage, I suppose we
>> will have to work out a plan to address that and coordinate both changes
>> landing in at the same time.
>>
>> I will work with Arnd to back out the Device Tree changes, sorry about that.
> 
> This is linux-next, so I can back out the DT change myself. Sorry for the
> breakage.
> 
> As for channeling the path, would it make sense for linusw to take it alonside
> GPIO fix?

That would definitively work, Linus, are you comfortable with doing
that? I will reply to the patch with an Acked-by if that helps.
-- 
Florian
