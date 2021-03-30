Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54BDC34E96C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 15:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbhC3Nl0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 09:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232075AbhC3NlC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Mar 2021 09:41:02 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 475E4C061762;
        Tue, 30 Mar 2021 06:41:02 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id x16so16277237wrn.4;
        Tue, 30 Mar 2021 06:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iSGujRrFS5RdEviA4Q6vzzVoPMK67fzyhRCmyZdY4l8=;
        b=MMhm08qeNGNuUhf+sOznIuDrwu99kTolOJPS5ZtrJV953HpCS1pjutbp2FSyILv+0D
         4pB0uJz2g5XTiEmDcX/yIcRSDSQgCcNeYBe9Uha46gkY/pa8MHduUMs0eY1yDBVteU/Z
         bL17/2YWX40BCyyPVcymSAOTPQ8ZZ22MPseLv7SAT1LG0XD6K32vcWO6vXPQ2sBdqCHs
         Zuin4PqHSoQ2O+yOoSgGg3K4n96NPYCL+sVam/uBmJoVotzQvusYg+TuHHgNfpUj2NFp
         p7qL3aArEloIm1GD43Tj6MHH1XFpjIwloHUUmiLj/PdrpKkiQq8Fg5mPp7mpbxa5s8JA
         OBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iSGujRrFS5RdEviA4Q6vzzVoPMK67fzyhRCmyZdY4l8=;
        b=hqvvjFr4CKFOSeD52sPRsR+fF8vAQDVjx+pOQAsVfMd0blnynwXLfx1P95mqBS89vh
         u1BkEuJnsCEmroMDFBTwO+DJh9ZUeF2Jf/siF5xjwdIqemtjXqEt6iDDPb4Sidh+RYiU
         OyFFZ9esSD0SrZtVUWVUzUGuWqJZOWtfFb/xtYr+dPzTZgfJUxTNVi5SgkjUazhAQU1G
         i3EfB+Y/iolFLvRwVAzx/Ad/X6EAFLj+M/GalpUwdUWLrddy4Qad4JoIaoQxLgeng63A
         WwRJVknEHUlU+1Es6vrDxd8fcsMMXnu9OBQg7oYMsp5Ao3Nyut7p2xflEIpzujr1V1Da
         kh+w==
X-Gm-Message-State: AOAM532q9hSFZ8k6TlQiGKVknEi86z57jnYW4SW0OCg6kU9wwX6MvFDd
        MwOPBOVXjhUb9M42vnnLFXMG4qtuP842VA==
X-Google-Smtp-Source: ABdhPJxjmZDTJeoB505URXrekffgYpW/oM5pMFfOEXW+zxIDWI4HQwPJRdVDW7doj2nnlxoNol7R3g==
X-Received: by 2002:adf:fcc9:: with SMTP id f9mr33957017wrs.420.1617111660832;
        Tue, 30 Mar 2021 06:41:00 -0700 (PDT)
Received: from [192.168.1.10] (176.red-79-148-190.dynamicip.rima-tde.net. [79.148.190.176])
        by smtp.gmail.com with ESMTPSA id f7sm3459355wmq.11.2021.03.30.06.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 06:41:00 -0700 (PDT)
Subject: Re: [PATCH v2] pinctrl: bcm: bcm6362: fix warning
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210330103225.3949-1-noltari@gmail.com>
 <CAHp75VdCLuS-0YL6+_vz5GqJC9N0AOiuYazkB1VNvbsPD78NAA@mail.gmail.com>
From:   =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Message-ID: <63f54c37-757d-7eff-f2e5-77ce374185e9@gmail.com>
Date:   Tue, 30 Mar 2021 15:41:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdCLuS-0YL6+_vz5GqJC9N0AOiuYazkB1VNvbsPD78NAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

El 30/03/2021 a las 12:55, Andy Shevchenko escribió:
> On Tue, Mar 30, 2021 at 1:33 PM Álvaro Fernández Rojas
> <noltari@gmail.com> wrote:
>>
>> The current implementation of bcm6362_set_gpio() produces the following
>> warning on x86_64:
>> drivers/pinctrl/bcm/pinctrl-bcm6362.c: In function 'bcm6362_set_gpio':
>> drivers/pinctrl/bcm/pinctrl-bcm6362.c:503:8: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>>    503 |        (uint32_t) desc->drv_data, 0);
>>        |        ^
>>
>> Modify the code to make it similar to bcm63268_set_gpio() in order to fix
>> the warning.
> 
> Seems good to me, thanks!
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
>> Fixes: 705791e23ecd ("pinctrl: add a pincontrol driver for BCM6362")
>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>> ---
> 
> Missed changelog here.

Yes, sorry about that but I added it to v1 patch by mistake... ;D
  v2: use uintptr_t, remove unneeded space and modify put
  regmap_update_bits() call on a single line.

> 
>>   drivers/pinctrl/bcm/pinctrl-bcm6362.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm6362.c b/drivers/pinctrl/bcm/pinctrl-bcm6362.c
>> index eb7ec80353e9..40ef495b6301 100644
>> --- a/drivers/pinctrl/bcm/pinctrl-bcm6362.c
>> +++ b/drivers/pinctrl/bcm/pinctrl-bcm6362.c
>> @@ -496,11 +496,11 @@ static int bcm6362_pinctrl_get_groups(struct pinctrl_dev *pctldev,
>>   static void bcm6362_set_gpio(struct bcm63xx_pinctrl *pc, unsigned pin)
>>   {
>>          const struct pinctrl_pin_desc *desc = &bcm6362_pins[pin];
>> +       unsigned int basemode = (uintptr_t)desc->drv_data;
>>          unsigned int mask = bcm63xx_bank_pin(pin);
>>
>> -       if (desc->drv_data)
>> -               regmap_update_bits(pc->regs, BCM6362_BASEMODE_REG,
>> -                                  (uint32_t) desc->drv_data, 0);
>> +       if (basemode)
>> +               regmap_update_bits(pc->regs, BCM6362_BASEMODE_REG, basemode, 0);
>>
>>          if (pin < BCM63XX_BANK_GPIOS) {
>>                  /* base mode 0 => gpio 1 => mux function */
>> --
>> 2.20.1
>>
> 
> 

Best regards,
Álvaro.
