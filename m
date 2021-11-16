Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5712E45397E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 19:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239573AbhKPSoo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 13:44:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233361AbhKPSon (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 13:44:43 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19035C061570;
        Tue, 16 Nov 2021 10:41:46 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id v15so614587ljc.0;
        Tue, 16 Nov 2021 10:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ev+Z8GofAuShA+6MSPbZsEyMexTvzjpgK5iAE8RYcEo=;
        b=WP6JjhxLaDgeIKB3Oaah0awO6eNzClvs20jJHLQ4Uhm9yqz4hM9gHJ8mH1nQJacF9o
         lpaMm6uMdq3YLjCO2MNAT2W9GOpC3c5KVDXSW0Xu/VsyXIV7LZx7AXoojNM7pRxT3b5A
         Img5LjlfTYCoYRqFEccV6Z8AhFIctVXFl0gy67lBTFwCWFRDYVXqaEDPrkJGeSn5o1wV
         bvWYykjXvB6VK+LZnbzlq8YbfRXSDjIXE8ABWl4ktk4RUvYUXIilP85DJTFI1YdFoBHk
         OCtSucHG//VoN2Q8k2s+QQwqProlEESCn4/Jp9GwGW8o5RM2U5RknKIFA0Uo3Fq0gGD8
         17ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ev+Z8GofAuShA+6MSPbZsEyMexTvzjpgK5iAE8RYcEo=;
        b=SfxhXloDNU++kDpLGMV+0yxfB4NM5L92Q64LSXY00nN9l/MKhHPT5zFGA32+N9jJgY
         hdKL/vkNu6+QkSXyN73CnDJQTgKFCCvMx8fkDO8jxEHK1nfgRwsOE1RItZ+6rZgVhjmu
         AlICnz8cXajya+wNnJpKjyiQwV1LeELnF7EBya9nvgwit7U6CZ86p6hCg02pmph3YDVW
         WaPljZA+0ttwwBp4IuDiopd0H1kzH+8rDz2PVMJJQZ+abcSKkLI1deqoRmZn483YPKrC
         fZ9/bll/Vas1lab/XHvw0SXWkXpFSRvZNAIbgR6tifZEx9VtVTm+Rakr7YjDxvOnHhRz
         040w==
X-Gm-Message-State: AOAM530VWDiOoaUP6KiJNL3+jswRbaGUkvTR+pwEUFBX5SXp0tnu8kAz
        l3NAiYQ7uPayo/mKtE82SBo=
X-Google-Smtp-Source: ABdhPJwy7gnyina6AmEtdTgTI8tN+0APz/lr3dAPSGSO7jRZEGujy4FJ3mEu9Kb8MKhcScMinhw4ug==
X-Received: by 2002:a05:651c:11cf:: with SMTP id z15mr1349209ljo.30.1637088104403;
        Tue, 16 Nov 2021 10:41:44 -0800 (PST)
Received: from ?IPV6:2001:14ba:16ee:fa00::4? (dc73szyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16ee:fa00::4])
        by smtp.gmail.com with ESMTPSA id n7sm1924466ljg.113.2021.11.16.10.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 10:41:44 -0800 (PST)
Message-ID: <50c260a1-c6d0-1a0b-45da-ab1a2d1379c3@gmail.com>
Date:   Tue, 16 Nov 2021 20:41:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH RESEND 0/4] Drop ROHM BD70528 support
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>
References: <cover.1637066805.git.matti.vaittinen@fi.rohmeurope.com>
 <CAHp75Ve_qS0Qc8XLHLwFnWEPzQtgNfEeVr8q9L4gK2m5a-By0A@mail.gmail.com>
From:   Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CAHp75Ve_qS0Qc8XLHLwFnWEPzQtgNfEeVr8q9L4gK2m5a-By0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/16/21 18:10, Andy Shevchenko wrote:
> On Tue, Nov 16, 2021 at 2:52 PM Matti Vaittinen
> <matti.vaittinen@fi.rohmeurope.com> wrote:
>>
>> Drop ROHM BD70528 support
>>
>> Unfortunately there has not been a big demand for ROHM BD70528
>> IC. The few users I know control PMIC from separate M4-core,
>> which is not running Linux. I am not aware of any users of this
>> Linux driver.
>>
>> While I did really like this IC and writing the drivers for it,
>> seems like these drivers are becoming useless burden. So, I see
>> no point in maintaining them. Let's just drop the drivers if
>> there is no objections to this series. :(
>>
>> The regulator, WDG and power-supply drivers were already dropped.
>>
>> The RTC and clk drivers remain in use by few other ROHM IC drivers.
>> Nevertheless, they are already converted to not depend the BD70528
>> defines during previous cycle.
>>
>> This series cleans the remaining pieces, GPIO, MFD, dt-bindings and
>> MAINTAINER entries. The GPIO code uses defines from MFD - but the GPIO
>> part is also depending on MFD KConfig entry - so there should be no
>> breakages even if the patches were applied to respective subsystem trees
>> and were not carried via single tree.
> 
> FWIW, no objections from me.

Thanks Andy!

I see acks from Andu, Bartosz, Lee and Rob. It'd be nice to see ack from 
Linus W too - but other than that - I guess this is good to go. Any 
preferences regarding the tree(s) that could carry the patches? All via 
MFD or each patch merged to the subsystem it fits the best?

Best Regards
	Matti Vaittinen
