Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE152A8ACF
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 00:32:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732461AbgKEXc5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 18:32:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731060AbgKEXc4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 18:32:56 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551C9C0613CF;
        Thu,  5 Nov 2020 15:32:55 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id g7so2313351pfc.2;
        Thu, 05 Nov 2020 15:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pibkzdTjV68+ZVyJNDC0M5RL/qSDH5KT3MGSB0PSjCA=;
        b=U3WDNJfKYahYQRO5ADhBHaQ3evR0sBikDSlasQkRs7jOm1zemannkYJizQPO4cj1PR
         7U4cJiLRC2lDw0CXG27m3Kdw3gQYksbJb1l4+WKJ95NSIAKqjUW55ytePG+ogTlBTi3e
         ODoj1tCLIFVqZc+bEYkMAAlFx5p6o3wYTTv7Lb4qNa8I4WQNv7VUorg3Y/t/8nkcXlAv
         wLuPbkrToWBawMjqDiDnIuPvuJGDmkuKlvKjrJyEULm7jTgFIlq8yaHrGH21hO62wZ1r
         bia7moaIYGbtygjIQnxSzZJNXYq7dbKlKaWHZL/aAG3tbY6pqutAPbgDQ4cqV066e6fL
         8zkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pibkzdTjV68+ZVyJNDC0M5RL/qSDH5KT3MGSB0PSjCA=;
        b=SEu0YIUnrhrOrtTq6T3rnsYmid2AZmv9ugb3XBEW0firnLzIGRJLTs3r3cTAYkfvL4
         oQnss4/B8HD187OV1S5KWw/t5/3/nJ8qs9slPh97dIhSP09+ixQTiZjKtJs73+JX03dE
         udejxP9lS3C0J5N8ezfPTltA490Rtv1EVUPmVmuB6JkSWbxl4kzpgqIOFVC9m8QC3T98
         98XZUQXkFrkVz4p9GF59TptdVMSMTwcd3r6icOYExFyxgDi+1gl87ArS+6lKQZbZuOjh
         Vy6+q0W2JfvgGKGYYIVmBUcYX4QSAiJlCCdWpixgYFxtwtckWTrjpED3jKXZva+XnM0U
         LExw==
X-Gm-Message-State: AOAM533L39ldu0K20GaZqXvxqC7GsmpYU90oYJQAY+8urqwfbD3Aqglf
        X9hBnD1GrCge9j47DJ1Ec64=
X-Google-Smtp-Source: ABdhPJw0e/N3xE8sqIAud4VjSvM7GPp/3k1I201Ii87bLYebs9enrWYz7vuaFWPg62MQQUqpk1B8iw==
X-Received: by 2002:a65:6a46:: with SMTP id o6mr4552169pgu.36.1604619174930;
        Thu, 05 Nov 2020 15:32:54 -0800 (PST)
Received: from localhost ([160.16.113.140])
        by smtp.gmail.com with ESMTPSA id b23sm3830055pfo.21.2020.11.05.15.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 15:32:54 -0800 (PST)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Fri, 6 Nov 2020 07:32:31 +0800
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] pinctrl: amd: use higher precision for 512 RtcClk
Message-ID: <20201105233231.xva2zjxnmpwy5tmy@Rk>
References: <20201104230703.21466-1-coiby.xu@gmail.com>
 <20201104230703.21466-3-coiby.xu@gmail.com>
 <CAHp75Vf=78VdQPGERb-x1ucsT=SAbt2UV9ANB=vU0S7H+BLQRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHp75Vf=78VdQPGERb-x1ucsT=SAbt2UV9ANB=vU0S7H+BLQRw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 05, 2020 at 01:13:07PM +0200, Andy Shevchenko wrote:
>On Thu, Nov 5, 2020 at 1:07 AM Coiby Xu <coiby.xu@gmail.com> wrote:
>>
>> RTC is 32.768kHz thus 512 RtcClk equals 15625 usec.
>
>I could add that the documentation likely has dropped precision and
>that's why the driver mistakenly took the slightly deviated value.
>
Thank you for the suggestion and other fixes in patch 4/4. Applied in v3.

>Anyway.
>Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
>> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>> Link: https://lore.kernel.org/linux-gpio/2f4706a1-502f-75f0-9596-cc25b4933b6c@redhat.com/
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  drivers/pinctrl/pinctrl-amd.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
>> index d6b2b4bd337c..4aea3e05e8c6 100644
>> --- a/drivers/pinctrl/pinctrl-amd.c
>> +++ b/drivers/pinctrl/pinctrl-amd.c
>> @@ -156,7 +156,7 @@ static int amd_gpio_set_debounce(struct gpio_chip *gc, unsigned offset,
>>                         pin_reg |= BIT(DB_TMR_OUT_UNIT_OFF);
>>                         pin_reg &= ~BIT(DB_TMR_LARGE_OFF);
>>                 } else if (debounce < 250000) {
>> -                       time = debounce / 15600;
>> +                       time = debounce / 15625;
>>                         pin_reg |= time & DB_TMR_OUT_MASK;
>>                         pin_reg &= ~BIT(DB_TMR_OUT_UNIT_OFF);
>>                         pin_reg |= BIT(DB_TMR_LARGE_OFF);
>> --
>> 2.28.0
>>
>
>
>--
>With Best Regards,
>Andy Shevchenko

--
Best regards,
Coiby
