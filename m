Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29B782AD15F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 09:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgKJIfy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 03:35:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39699 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727001AbgKJIfx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 03:35:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604997351;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rkN7D/hgSNweMvBM06mGIOugGufcW/6sK1YGZnNu8jY=;
        b=BARuUQkFOI/JYc2rn+4FH4likwfCQN7Dmww0wcLuauYHgMtcfGfQ9GqbJOVQdXMvANWfOF
        FNdCqLqEX5T3En5LReNjkVYgwIrqIlCfEMBGitMHz2HBlZdECuc1iIQPwtRvcJVW9FUSDj
        Bwt0NT0oGkm8vVRaevo0Xfyx96ASvoY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-Xv5SXQRzPVmDlKDFwcAKAQ-1; Tue, 10 Nov 2020 03:35:44 -0500
X-MC-Unique: Xv5SXQRzPVmDlKDFwcAKAQ-1
Received: by mail-ed1-f71.google.com with SMTP id y8so3929183edj.5
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 00:35:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rkN7D/hgSNweMvBM06mGIOugGufcW/6sK1YGZnNu8jY=;
        b=s7Uv7+zubB3rEwWscYUl0r3eiXCvtZUpMijE6xKpQsMzi34jAYhHKPmoa/VY4Rk8La
         QHQc2+C1+Bj7lalMYraSnRyT7rf6my6DIaLaPwmneJMm/lRlpfX5DBhxWpnlKPcONjHz
         FSeSSceCy8LGuGXvMlFgsyw1W/+bkSDKagFsRYTowkA8c6y4eesQPP8n8kiB7F7owxE9
         JfOS0sY4esvShP/hAeNGXezLx4Dh4+0qFCtIqoQKaUv34pwYOvfm9uKMSOaEwXH5vuEj
         C+GF2J1FeG4jDVdDRTpMtVL5hjXQPvV2oqkZkDzC93XCYMOZeN0qWl3IU/qJnpZGzw+y
         VOBQ==
X-Gm-Message-State: AOAM5307eBknGm/C0gPsLZH0G8qO7Otc909aOMytih2JVIM+sRyfFAHj
        6jn00gubMQKe5ByJeAmX2pyNu1xkNoWAmsXkK7st/pa6Cjmbmdw99f7mpQe1Qgh+J9hD/1HYGPC
        vyDGccYY5QfWDzpMeHet8ig==
X-Received: by 2002:a17:906:1c84:: with SMTP id g4mr20093409ejh.155.1604997342711;
        Tue, 10 Nov 2020 00:35:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiKNTuLFGtFdqVQ3vKqeY77is0fz4PKf95K1874hlngMmkJjpl4DHeFyY7etbTIXUDaakLPw==
X-Received: by 2002:a17:906:1c84:: with SMTP id g4mr20093393ejh.155.1604997342489;
        Tue, 10 Nov 2020 00:35:42 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id j5sm5280780eja.47.2020.11.10.00.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 00:35:41 -0800 (PST)
Subject: Re: [PATCH v3 4/4] pinctrl: amd: remove debounce filter setting in
 IRQ type setting
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        stable@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
References: <20201105231912.69527-1-coiby.xu@gmail.com>
 <20201105231912.69527-5-coiby.xu@gmail.com>
 <fa67aa70-2a14-35af-632b-b0e86dc4b436@redhat.com>
 <20201110082633.2rtmegilva2hgst4@Rk>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0aed4370-ed79-7f23-56c2-27b9df4af46e@redhat.com>
Date:   Tue, 10 Nov 2020 09:35:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201110082633.2rtmegilva2hgst4@Rk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/10/20 9:26 AM, Coiby Xu wrote:
> On Mon, Nov 09, 2020 at 02:52:17PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 11/6/20 12:19 AM, Coiby Xu wrote:
>>> Debounce filter setting should be independent from IRQ type setting
>>> because according to the ACPI specs, there are separate arguments for
>>> specifying debounce timeout and IRQ type in GpioIo() and GpioInt().
>>>
>>> This will fix broken touchpads for laptops whose BIOS set the debounce
>>> timeout to a relatively large value. For example, the BIOS of Lenovo
>>> Legion-5 AMD gaming laptops including 15ARH05 (R7000) and R7000P set
>>> the debounce timeout to 124.8ms. This led to the kernel receiving only
>>> ~7 HID reports per second from the Synaptics touchpad
>>> (MSFT0001:00 06CB:7F28). Existing touchpads like [1][2] are not troubled
>>> by this bug because the debounce timeout has been set to 0 by the BIOS
>>> before enabling the debounce filter in setting IRQ type.
>>>
>>> [1] https://github.com/Syniurge/i2c-amd-mp2/issues/11#issuecomment-721331582
>>> [2] https://forum.manjaro.org/t/random-short-touchpad-freezes/30832/28
>>>
>>> Cc: Hans de Goede <hdegoede@redhat.com>
>>> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
>>> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>>> Cc: stable@vger.kernel.org
>>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>>> BugLink: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190
>>> Link: https://lore.kernel.org/linux-gpio/CAHp75VcwiGREBUJ0A06EEw-SyabqYsp%2Bdqs2DpSrhaY-2GVdAA%40mail.gmail.com/
>>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>>
>> I'm not entirely sure about this patch. This is consistent with how we
>> already stopped touching the debounce timeout setting during init, so
>> that speaks in favor of this change.
>>
>> Still I'm worried a bit that this might have undesirable side effects.
>>
> Now I can only confirm this patch won't affect the mentioned touchpads.
> I'll see if other distributions like Manjaro are willing to test it
> through the unstable channel.
> 
>> I guess this should be landed together with Andy's series to apply
>> the debounce setting from the ACPI GPIO resources.
> 
> Thank you for the reminding! You are right, Andy's patch
> "gpiolib: acpi: Take into account debounce settings" is needed to
> fix this kind of touchpad issues. Since that patch hasn't been
> merged, is there a way to refer to it in the commit message?

You can always refer to it by subject, as you did above.

Regards,

Hans



>>> ---
>>>  drivers/pinctrl/pinctrl-amd.c | 7 -------
>>>  1 file changed, 7 deletions(-)
>>>
>>> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
>>> index e9b761c2b77a..2d4acf21117c 100644
>>> --- a/drivers/pinctrl/pinctrl-amd.c
>>> +++ b/drivers/pinctrl/pinctrl-amd.c
>>> @@ -468,7 +468,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>>          pin_reg &= ~BIT(LEVEL_TRIG_OFF);
>>>          pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>>>          pin_reg |= ACTIVE_HIGH << ACTIVE_LEVEL_OFF;
>>> -        pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
>>>          irq_set_handler_locked(d, handle_edge_irq);
>>>          break;
>>>
>>> @@ -476,7 +475,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>>          pin_reg &= ~BIT(LEVEL_TRIG_OFF);
>>>          pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>>>          pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
>>> -        pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
>>>          irq_set_handler_locked(d, handle_edge_irq);
>>>          break;
>>>
>>> @@ -484,7 +482,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>>          pin_reg &= ~BIT(LEVEL_TRIG_OFF);
>>>          pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>>>          pin_reg |= BOTH_EADGE << ACTIVE_LEVEL_OFF;
>>> -        pin_reg |= DB_TYPE_REMOVE_GLITCH << DB_CNTRL_OFF;
>>>          irq_set_handler_locked(d, handle_edge_irq);
>>>          break;
>>>
>>> @@ -492,8 +489,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>>          pin_reg |= LEVEL_TRIGGER << LEVEL_TRIG_OFF;
>>>          pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>>>          pin_reg |= ACTIVE_HIGH << ACTIVE_LEVEL_OFF;
>>> -        pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
>>> -        pin_reg |= DB_TYPE_PRESERVE_LOW_GLITCH << DB_CNTRL_OFF;
>>>          irq_set_handler_locked(d, handle_level_irq);
>>>          break;
>>>
>>> @@ -501,8 +496,6 @@ static int amd_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>>          pin_reg |= LEVEL_TRIGGER << LEVEL_TRIG_OFF;
>>>          pin_reg &= ~(ACTIVE_LEVEL_MASK << ACTIVE_LEVEL_OFF);
>>>          pin_reg |= ACTIVE_LOW << ACTIVE_LEVEL_OFF;
>>> -        pin_reg &= ~(DB_CNTRl_MASK << DB_CNTRL_OFF);
>>> -        pin_reg |= DB_TYPE_PRESERVE_HIGH_GLITCH << DB_CNTRL_OFF;
>>>          irq_set_handler_locked(d, handle_level_irq);
>>>          break;
>>>
>>>
>>
> 
> -- 
> Best regards,
> Coiby
> 

