Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C352B46A2B4
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Dec 2021 18:25:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239467AbhLFR2b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Dec 2021 12:28:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234199AbhLFR2b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Dec 2021 12:28:31 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D707C061746;
        Mon,  6 Dec 2021 09:25:02 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 137so11161614pgg.3;
        Mon, 06 Dec 2021 09:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wGI0LCAPIz5KvwQ+2lj86H/d+Nna109rkn2gLihP96U=;
        b=l4kwufD61aG+RlFU1MapBNvhESj/nDyKEMOQZWmxE7EdpPeHCyqXfDnN/Xb0thwyTd
         kmL/hfzcSKaQ4qI8+KgSZZHX2tVLlvOmXOqsvJeSd+4haW10Upb6dSixslnxHKj209LL
         Soh4i3UMoVFfG8TGxMR2lnyGgJmxwxn3xf4MywMvFib/DqD4lbfjLN7y6MQTC09qoHZl
         lSb3nzI0Q9jt/+gJyDQzvv+0oK5Llhc8jltU0DoRsQSdz4w9WK7WJw+lNX0EKcVtFb2O
         3FtVLbSwihT0Fh4oiznlarR0hjNXzl+fE05HTeUIoPhr62FkxL1PXvGtzUhrXsfxZy7N
         aB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wGI0LCAPIz5KvwQ+2lj86H/d+Nna109rkn2gLihP96U=;
        b=lJQZ/S9eg144y59UdoF5LjMHdQ1yULUZaQR9bxQj+G4EAtPOnq502vw12h3GVYOfsH
         YryzMnKllFjBe919hlUBUTfStS99VvE3rNwuxJlrLnnfJH720xKGiHFuJPEOUhFmiXsj
         ev5Fn5GT+MrJCbmy7OOpdH6dxofbdM1tfVP8hXTfOCN9LSW4yxFSEo7o8kwuSkFI7dUm
         iqiTegNHRnDRrdgMfaI5WYRJjYjF0WopUqT+cGHIkLzizDOYA6OGnMslyOI3Ew48FoVz
         YerPyGVIrkFTwNrAbAH5eJe09MvO5FsuiGppmpRIxiK0Woh7MOm1GiSwvoa4NvVD4YfR
         n8KQ==
X-Gm-Message-State: AOAM530fA8IZQpY5EJWmFGx7lPt8TYFF3q51t05+ywoTATDymoTC+KTU
        yGzW5BfFXsyNbRvxsOazWyw4ODAvw1U=
X-Google-Smtp-Source: ABdhPJzyaRX/JKtzcPrFdJuWbLVhqC7eLihaPTEv9nqQiYflZsBLBcwSjvc62O57fjcIJonuCrVAsw==
X-Received: by 2002:aa7:93c4:0:b0:49f:a7f5:7f5a with SMTP id y4-20020aa793c4000000b0049fa7f57f5amr38082976pff.8.1638811501406;
        Mon, 06 Dec 2021 09:25:01 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id 12sm485pjn.16.2021.12.06.09.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 09:25:00 -0800 (PST)
Subject: Re: [PATCH v2 2/2] ARM: dts: gpio-ranges property is now required
To:     Linus Walleij <linus.walleij@linaro.org>,
        Phil Elwell <phil@raspberrypi.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
References: <20211206092237.4105895-1-phil@raspberrypi.com>
 <20211206092237.4105895-3-phil@raspberrypi.com>
 <CACRpkdYJAZcr_PPCGPYcitfcwd9GDFf+7hPJkOmjomqCrruNfw@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <04acf5f1-7d82-b12b-f70f-1712a4a2610c@gmail.com>
Date:   Mon, 6 Dec 2021 09:24:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYJAZcr_PPCGPYcitfcwd9GDFf+7hPJkOmjomqCrruNfw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/6/21 2:33 AM, Linus Walleij wrote:
> On Mon, Dec 6, 2021 at 10:22 AM Phil Elwell <phil@raspberrypi.com> wrote:
> 
>> Since [1], added in 5.7, the absence of a gpio-ranges property has
>> prevented GPIOs from being restored to inputs when released.
>> Add those properties for BCM283x and BCM2711 devices.
>>
>> [1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
>>     pin-ranges")
>>
>> Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Please funnel this patch through the SoC tree.

This one was definitively going to go via ARM SoC in the absence of any
explicit routing, did you mean that patch #1 should also be routed via
ARM SoC?
-- 
Florian
