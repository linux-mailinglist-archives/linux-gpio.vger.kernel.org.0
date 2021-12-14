Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C8F4748F8
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Dec 2021 18:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233831AbhLNRMl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Dec 2021 12:12:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233758AbhLNRMk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Dec 2021 12:12:40 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF71C061574;
        Tue, 14 Dec 2021 09:12:40 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id r5so17845039pgi.6;
        Tue, 14 Dec 2021 09:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=c0ijK4rkqUObK3Qna2KfVjEpIRTSrS20P3RvVnUJL0E=;
        b=pyO9bt0fxCsjxE90seFFJWwEKl5gFHNBb7k+SX1X2JsgMeR76LauZ1anfSYQPakUcP
         DsvjzWTpWP6aS9gXJg616oRPQ0CZ22TCbIfTLUaIXeORpaINHqchpb2dn+c8DYZRVAAy
         qbOpzohojNS4eYdZ++ewLJTrVBepeb2JEd1l4eRizZA6KMmAOpzNHLdJsxbr/RFQiV7A
         4DGfDMELjvZYE7vNZ4aqGc2V1S6eu7lFbogSaHdGtxZByaCk9zgyUBBI3NH1R2GNMXn/
         DMo0fjLtnW9Q9cAME45Uv0pUY6WQtRP+wpCeg8y9LoCY8a39mnSQWjv0wYq7PUbPj2xs
         htYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c0ijK4rkqUObK3Qna2KfVjEpIRTSrS20P3RvVnUJL0E=;
        b=aZp2X0CYuUrlvtLEcuxUnZVbkpZifF9sRokRFqFj2Tk7FOTx0sycLIYxGXujM2SK/l
         gJA/WswGfXSrz6GVd68t5Qi2j+cx/RXZHkc3lGx9HFdwiBGGGIM2yMK7RDBMyE5ho4R5
         Ri8gq0QEZ9fy8oE1GUuPXLCiZM0Jz0+uDFd2XE4mrZluROoFlf1jI37tcmNHAgWhMfIZ
         C6fOJUsonYAhS7sKyEbNRPEsrL/kYxDRIppbTQw26HozSlgHVsHKTDZeIAl6clabvYNQ
         EC7NQap5JI92bcwa5mJ8KO/wZpxsFCPicggtHAHhjc4bMVtBTPYHIWGQIU7XhuO8/SUP
         IM3g==
X-Gm-Message-State: AOAM53300TpPKwWwRrg5/afBc7IFKAOQYPWuTS2IF45OpALUzcIuhNII
        mZh6R05rsFEtHPKb5WQjxPksnJulCcY=
X-Google-Smtp-Source: ABdhPJxgpctV36XTAUnYGSOdSE2GY/FJVcvK49ixErtUs6MUUKbd78YODMtk/4y4FwMBvCwYpkn5rA==
X-Received: by 2002:a63:6d4f:: with SMTP id i76mr4468714pgc.611.1639501959198;
        Tue, 14 Dec 2021 09:12:39 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id t2sm425953pfd.36.2021.12.14.09.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 09:12:38 -0800 (PST)
Subject: Re: [PATCH v2 2/2] ARM: dts: gpio-ranges property is now required
To:     Phil Elwell <phil@raspberrypi.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
References: <20211206092237.4105895-1-phil@raspberrypi.com>
 <20211206092237.4105895-3-phil@raspberrypi.com>
 <CGME20211214142139eucas1p1c100b7fd4b8c8ce85bc03e1ce6b783db@eucas1p1.samsung.com>
 <8671ebd8-a853-7394-9864-0457514337e2@samsung.com>
 <2ce5956f-ce8c-80f0-df9a-492a8da00a08@raspberrypi.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <dbba6665-9688-9a5e-091b-eaa8e92e6886@gmail.com>
Date:   Tue, 14 Dec 2021 09:12:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2ce5956f-ce8c-80f0-df9a-492a8da00a08@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/14/21 6:32 AM, Phil Elwell wrote:
> Hi Marek,
> 
> On 14/12/2021 14:21, Marek Szyprowski wrote:
>> Hi Phil,
>>
>> On 06.12.2021 10:22, Phil Elwell wrote:
>>> Since [1], added in 5.7, the absence of a gpio-ranges property has
>>> prevented GPIOs from being restored to inputs when released.
>>> Add those properties for BCM283x and BCM2711 devices.
>>>
>>> [1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
>>>       pin-ranges")
>>>
>>> Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without
>>> pin-ranges")
>>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
>>
>> This patch breaks today's linux-next (next-20211214) on RPi3 and RPi4.
>> Either there is something missing or wrong here. Booting stops after
>> following messages (on RPi4):
>>
>> [    3.186786] pinctrl-bcm2835 fe200000.gpio: could not add GPIO chip
>> [    3.234513] pinctrl-bcm2835 fe200000.gpio: could not add GPIO chip
>> [    3.276703] mmc0: SDHCI controller on fe340000.mmc [fe340000.mmc]
>> using ADMA
>> [    3.287191] pinctrl-bcm2835 fe200000.gpio
> 
> This patch is part of a two-patch set, the cover note for which says:
> 
>     2. Since [1], a "gpio-ranges" property is required in order for pins
>     to be returned to inputs when freed. Note that without patch 1, the
>     device never gets out of EPROBE_DEFER.
> 
> It looks as though patch 2 has been merged without/before patch 1
> ("pinctrl: bcm2835: Change init order for gpio hogs").

Yes, the hope was that there would be no such breakage, I suppose we
will have to work out a plan to address that and coordinate both changes
landing in at the same time.

I will work with Arnd to back out the Device Tree changes, sorry about that.
-- 
Florian
