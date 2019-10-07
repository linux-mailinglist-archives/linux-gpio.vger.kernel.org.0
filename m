Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B29A9CEA3F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2019 19:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbfJGRK5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Oct 2019 13:10:57 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35649 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728048AbfJGRK5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Oct 2019 13:10:57 -0400
Received: by mail-pg1-f196.google.com with SMTP id p30so6509161pgl.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2019 10:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=nIO6O9ahSz9V8fOp+W/95V7uzxghRqzih625nuEdwR0=;
        b=hZW2x0sX8IHEsBdGXbQ7dhAyaFiXvbS0sfin1r0QdfUN0ohP/3mUrNCKIFJgBPRG48
         ezy9APJy0R1jKr69irFMCUBON0svtdadAaeXk0fE48899dvlcrRE4mnke7FpcnZlAVW+
         gKD78Sdfwo3tX/dmlwT8JVIOas4+wU9P/Ys80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=nIO6O9ahSz9V8fOp+W/95V7uzxghRqzih625nuEdwR0=;
        b=BHdussbMD7dtGhUG3cVUPPikbx8wYHVQOB0PcoiYCL1Xdqb6yfq2+9djc4lhJPEKDW
         2h2hnbhA0gGRKpqtB5MB66BPPf93LIQJ0kKuyXOEe9UkrWCdNDCDwMZD6d1ERU21Hkwz
         oC7HJWE/pLMCoOPDX6PEgUXJQxtUI29IUyN2NKfBeOWYbnSsG2UhmVCyqHFAXhQWSHmn
         HlF/xk+ft33kMWwIjVyBUeDcCCZZyzRmETtWs+Uyc2DgMhwEHKHnUqHMFL2t0bkwgEub
         CIxSdVhdofzChdUPepDmFr18FkF1eApOzks/Fu4zXLYuc8QD5Pdwt7R33AF8ImnxfAVV
         zsbA==
X-Gm-Message-State: APjAAAUYuJbU9SvE3xVua9fMltlqgbKTmyi3S660T/h08rUfWt5IGYaH
        knlwgONrw9BAQ1UKYcWjoBEQXQ==
X-Google-Smtp-Source: APXvYqyHrGt6RhHocknkFK2phK2rTRMyH7SfeP1YDq+8SfupmWTWQyHmhMhYdbC1a+Oq5/qjUN4W9Q==
X-Received: by 2002:a63:68e:: with SMTP id 136mr11613874pgg.18.1570468256741;
        Mon, 07 Oct 2019 10:10:56 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id e6sm16243153pfl.146.2019.10.07.10.10.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 10:10:55 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] pinctrl: iproc: use unique name for irq chip
To:     Marc Zyngier <maz@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        rayagonda.kokatanur@broadcom.com, li.jin@broadcom.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20191003000310.17099-1-chris.packham@alliedtelesis.co.nz>
 <20191003000310.17099-3-chris.packham@alliedtelesis.co.nz>
 <CAMuHMdV7syxxtnHEcgFBrf5DLo-M_71tZFWHHQ6kTO=2A1eVhg@mail.gmail.com>
 <86blutdlap.wl-maz@kernel.org>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <44510e8c-4e9b-603f-2c26-19db9121d68c@broadcom.com>
Date:   Mon, 7 Oct 2019 10:10:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <86blutdlap.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 2019-10-07 1:14 a.m., Marc Zyngier wrote:
> On Mon, 07 Oct 2019 08:30:50 +0100,
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> Hi Chris,
>>
>> CC MarcZ
>>
>> On Thu, Oct 3, 2019 at 2:03 AM Chris Packham
>> <chris.packham@alliedtelesis.co.nz> wrote:
>>> Use the dev_name(dev) for the irqc->name so that we get unique names
>>> when we have multiple instances of this driver.
>>>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> A while ago, Marc Zyngier pointed out that the irq_chip .name field
>> should contain the device's class name, not the instance's name.
>> Hence the current code is correct?
> Thanks Geert for looping me in. The main reasons why I oppose this
> kind of "let's show as much information as we can in /proc/interrupts"
> are:
>
> - It clutters the output badly: the formatting of this file, which is
>    bad enough when you have a small number of CPUs, becomes unreadable
>    when you have a large number of them *and* stupidly long strings
>    that only make sense on a given platform.
>
> - Like it or not, /proc is ABI. We don't change things randomly there
>    without a good reason, and debugging isn't one of them.
>
> - Debug information belongs to debugfs, where we already have plenty
>    of stuff (see CONFIG_GENERIC_IRQ_DEBUGFS). I'd rather we improve
>    this infrastructure if needed, rather than add platform specific
>    hacks.
>
> </rant>
>
> Thanks,
>
> 	M.
Thanks Marc/Geert.  Sounds like we should drop patch 2 from series.
>
>> See also "[PATCH 0/4] irqchip: renesas: Use proper irq_chip name and parent"
>> (https://lore.kernel.org/lkml/20190607095858.10028-1-geert+renesas@glider.be/)
>> Note that the irqchip patches in that series have been applied; the gpio
>> patches haven't been applied yet.
>>
>>> --- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
>>> +++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
>>> @@ -858,7 +858,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
>>>                  struct gpio_irq_chip *girq;
>>>
>>>                  irqc = &chip->irqchip;
>>> -               irqc->name = "bcm-iproc-gpio";
>>> +               irqc->name = dev_name(dev);
>>>                  irqc->irq_ack = iproc_gpio_irq_ack;
>>>                  irqc->irq_mask = iproc_gpio_irq_mask;
>>>                  irqc->irq_unmask = iproc_gpio_irq_unmask;
>> Gr{oetje,eeting}s,
>>
>>                          Geert
>>
>> -- 
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>>
>> In personal conversations with technical people, I call myself a hacker. But
>> when I'm talking to journalists I just say "programmer" or something like that.
>>                                  -- Linus Torvalds
>>

