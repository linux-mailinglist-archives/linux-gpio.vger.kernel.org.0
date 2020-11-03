Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C28D2A43A4
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Nov 2020 12:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbgKCLAl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Nov 2020 06:00:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20078 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727742AbgKCLAl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Nov 2020 06:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604401239;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4o15AbZ3fzzRBP1WGF4Ln3XoduoIEZnQEtzI6bpRkTQ=;
        b=VkgXF96d4iIimtUoWOWk5fmwBzr31sdmKzF01EKq6v7CtIvF9KCHeSyDYMNX0ZaEEaJj9/
        jdRaKWo/u2v9+BVmig431tp9B5v0vA1lUBoa5YsVCCmDivicA1W65Ed7ZSAB2ZvJiRnGZ5
        w2eyTbDatSDXf+MEc+9ZPWYXb5Da1YY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-q7ZgTs9ONGyi6OGbYAEkIw-1; Tue, 03 Nov 2020 06:00:37 -0500
X-MC-Unique: q7ZgTs9ONGyi6OGbYAEkIw-1
Received: by mail-ej1-f71.google.com with SMTP id p19so5232960ejy.11
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2020 03:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4o15AbZ3fzzRBP1WGF4Ln3XoduoIEZnQEtzI6bpRkTQ=;
        b=MD08U6qRGYzPzSp0g28g9B5b99vJD108tNja0XswAR4UXXnCEfgSnYixb8ZJLqA5PI
         5vDGkuU8/jHg1RqrjqIix0KHD7b/vxqHsoXYByfYlAedyZl1/cVcMMlPH5YXKPzN3lUn
         0nbizkYvaYz5WE1okGmDxv7nPJexpjo2OxS6DdyxlP3iy+RCzjy2yZ77yYfrjJl5hJbD
         77mER3MRD/7X3aoiZQOlyYFLlx/AXaSyZIathIRNQ1/wdadmRP9oghwmNLKNTF9V1DRm
         KhC4esL5UT0pGLBcchpT8hglFDClXBvkZFszj5/GSrgLxPQb5LKRynfMp1CzWi5A3t9W
         e8FA==
X-Gm-Message-State: AOAM530bMPjZAM63/ugULmJAY77EN+13ioxLg+hzXVORwLYCUaBYQOFD
        ZvwVtahaxb+QIZ/wOeERflBoD/wDYTHZYEecarbUEFu3xzyTTBK6V/DqOEsCqgqY6CR3NqMlgXt
        4QD3tv+/9EhaB6kfJ/fxHDA==
X-Received: by 2002:a17:906:38d8:: with SMTP id r24mr20090750ejd.32.1604401235716;
        Tue, 03 Nov 2020 03:00:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoTWc0lQXkFflXZFy12IX1To15obznIM0owvbQRpO/sFj9xQr0nsFAtgQ3VglLSFX3nxtVeQ==
X-Received: by 2002:a17:906:38d8:: with SMTP id r24mr20090714ejd.32.1604401235448;
        Tue, 03 Nov 2020 03:00:35 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id sa23sm10746638ejb.80.2020.11.03.03.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 03:00:34 -0800 (PST)
Subject: Re: Any other ways to debug GPIO interrupt controller (pinctrl-amd)
 for broken touchpads of a new laptop model?
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Coiby Xu <coiby.xu@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        wang jun <availa@outlook.com>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20201006044941.fdjsp346kc5thyzy@Rk>
 <e9cfac98-51fc-b169-cb74-80fd11de12ec@redhat.com>
 <20201006083157.3pg6zvju5buxspns@Rk>
 <69853d2b-239c-79d5-bf6f-7dc0eec65602@redhat.com>
 <4f02cbdf-e1dd-b138-4975-118dd4f86089@redhat.com>
 <a07d3890-f560-855f-3631-a3d5848dcdf5@redhat.com>
 <20201014042420.fkkyabmrkiekpmfw@Rk>
 <df2c008b-e7b5-4fdd-42ea-4d1c62b52139@redhat.com>
 <20201026225400.37almqey2wxyazkn@Rk>
 <f15806d6-32e2-c6b0-8f96-670a196380a8@redhat.com>
 <20201103000507.ufzukd2vkb5h2e3b@Rk>
 <2f4706a1-502f-75f0-9596-cc25b4933b6c@redhat.com>
 <CAHp75VdYhe4YEAzULMNkhihTQwHAP3fC2F6iD=datqzyzd=4fQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6a8a246b-1b11-f569-b495-6440e70fc121@redhat.com>
Date:   Tue, 3 Nov 2020 12:00:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VdYhe4YEAzULMNkhihTQwHAP3fC2F6iD=datqzyzd=4fQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/3/20 11:49 AM, Andy Shevchenko wrote:
> On Tue, Nov 3, 2020 at 12:12 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 11/3/20 1:05 AM, Coiby Xu wrote:
>>> On Tue, Oct 27, 2020 at 11:09:11AM +0100, Hans de Goede wrote:
> 
> ...
> 
>>> [1] https://lore.kernel.org/patchwork/comment/1522675/
>>
>> This is a case where Andy is obviously right and you should just use the
>> higher precision "unit = 15625" value (except probably that is wrong too,
>> see below).
>>
>> We have had similar issues with the docs for getting the TSC frequency
>> on some Intel chips, where the docs said 16.6 MHz for a certain register
>> value, where what they meant was 100/6 MHz which really is significantly
>> different. This was leading to a time drift of 5 minutes / day on non
>> networked (so no NTP) Linux systems.
>>
>> I think this is what Andy was referring to when he wrote:
>> "What the heck with HW companies! (Just an emotion based on the experience)"
> 
> Exactly!
> 
> ...
> 
>> Actually all the values look somewhat suspect. The comment:
>>
>>>                 Debounce        Debounce        Timer   Max
>>>                 TmrLarge        TmrOutUnit      Unit    Debounce
>>>                                                         Time
>>>                 0       0       61 usec (2 RtcClk)      976 usec
>>>                 0       1       244 usec (8 RtcClk)     3.9 msec
>>>                 1       0       15.6 msec (512 RtcClk)  250 msec
>>>                 1       1       62.5 msec (2048 RtcClk) 1 sec
>>
>> Helpfully gives the values in RtcClks. A typical RTC clock crystal
>> is 32 KHz which gives us 31.25 usec per tick, so I would expect the
>> values to be:
> 
> I guess you are mistaken here. Usual frequency for RTC is 32.768kHz
> [1], which gives more or less above values
> 
> 30.51757
> 61.03515
> 244.14062
> 15625
> 62500

You are completely right, my bad.

> [1]: https://en.wikipedia.org/wiki/Real-time_clock
> (just google: rtc clock frequency)

I did duckduckgo, but one of the first hits said 32KHz crystal and
I assumed that meant 32.000 KHz falling into the exact precision
trap I was complaining about in my previous email, oops.

Regards,

Hans


