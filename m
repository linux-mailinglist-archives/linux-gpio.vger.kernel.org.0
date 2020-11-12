Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD4942B039B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Nov 2020 12:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727223AbgKLLM4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Nov 2020 06:12:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25824 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725902AbgKLLMz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 06:12:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605179574;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dLouGW5K6TPl9Cwb1tNR62+WK1yKnOfirQaBSmMfJ8Q=;
        b=WmbuD+8eGyX2fhlXiRxhLAbJKKfeaYwOXMAe9G9A2ZZZeV6IoxaHu3sbBgs+X//9As//VM
        r/+ZceH9bLY61I3bFrIiwaHZUHPy/m6mQ5BICAlVlI2iQCgJRQKnHLMrhcUSONJpdoHB1f
        37lxS8PMBTTlvgK7xvw41x7wFAEMusg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-EB-uJx66OdS0R1NMoV5d6w-1; Thu, 12 Nov 2020 06:12:52 -0500
X-MC-Unique: EB-uJx66OdS0R1NMoV5d6w-1
Received: by mail-ej1-f71.google.com with SMTP id t1so1684110ejb.21
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2020 03:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dLouGW5K6TPl9Cwb1tNR62+WK1yKnOfirQaBSmMfJ8Q=;
        b=lyRun0bnESao6f+gSwtp9guHeQX/4Ni0FMv30LGOvKrbJzThund43vgjb7iLd+0c1O
         3m2Z+HvcgzsDFX0YC7XUPtPEQeqlItO3VXyj6U3UV2swu6CtuEly8Wz/zd723HDfxmn6
         aYapvYt6zxXPNRQZbncaPyO/72QdxAc7WF0nANQ/Vm5rnLFIxq6fxHCHKGI4Gp37+Spy
         cxEMVHGRp+QzhkCAoEG8izf6S5+SG4cZgCajF+a/PEMd62Mx1cEjERGLGMCVEf1UgPHZ
         E357O1lCPqxJW6kuMZi9J6z32NZSDhIDCGns195BuJPPkLjxTHdpZqf465+fzHP/XZIz
         /k6w==
X-Gm-Message-State: AOAM533KFBAy4AL3bJMOGkDcnwPI3FOOj46c//h85FtLreIUD2/r2a5S
        bQbuX5A757M0d2944CzJcoiBiZc/U23sEPEq1qU7OzufR4F/4JiyD5PIPMDk22TaeVNBS32jfbn
        L+PAFBL14V2wMez9IUDLG+jP4YgXUVA3EKoJMsgteY6xTNK1bSb53u1J1uWG0NVW3WhAeNUrn4A
        ==
X-Received: by 2002:a50:be8f:: with SMTP id b15mr4400620edk.180.1605179570935;
        Thu, 12 Nov 2020 03:12:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzX+lloS3HVj+7e3yxeLqUMGim3XxAtmuNfGsotDVZ5b+hihodVETc7TqrlOca8umKq49/6Zg==
X-Received: by 2002:a50:be8f:: with SMTP id b15mr4400600edk.180.1605179570787;
        Thu, 12 Nov 2020 03:12:50 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id e10sm2181745edq.55.2020.11.12.03.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2020 03:12:50 -0800 (PST)
Subject: Re: [PATCH v7 07/18] gpiolib: Introduce gpio_set_debounce_timeout()
 for internal use
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20201111222008.39993-1-andriy.shevchenko@linux.intel.com>
 <20201111222008.39993-8-andriy.shevchenko@linux.intel.com>
 <20201112081638.GV2495@lahna.fi.intel.com>
 <CAHp75Vehbo-Ai5SE8JX1g4wggrQvz9TpwjsiS6C0r5mztwSg6A@mail.gmail.com>
 <20201112110601.GA2495@lahna.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e176656b-81e1-d9f8-a108-ac8376f6c136@redhat.com>
Date:   Thu, 12 Nov 2020 12:12:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201112110601.GA2495@lahna.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 11/12/20 12:06 PM, Mika Westerberg wrote:
> On Thu, Nov 12, 2020 at 12:19:37PM +0200, Andy Shevchenko wrote:
>> On Thu, Nov 12, 2020 at 10:17 AM Mika Westerberg
>> <mika.westerberg@linux.intel.com> wrote:
>>> On Thu, Nov 12, 2020 at 12:19:57AM +0200, Andy Shevchenko wrote:
>>
>> ...
>>
>>>> +int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)
>>
>>> Sorry for commenting this late but I realized we have
>>> gpiod_set_debounce() already. At least this new function should follow
>>> the naming (gpiod as it takes descriptior):
>>>
>>> int gpiod_set_debounce_optional(struct gpio_desc *desc, unsigned int debounce);
>>
>> Unfortunately it will be inconsistent with the naming schema. I
>> explained the choice of name in the cover letter. I will elaborate a
>> bit there.
> 
> OK, It seems that I was not CC'd cover letter of the last two versions,
> or it got dropped somewhere.

Yes I did not get the cover-letter either, I was actually wondering if there
was one...

Regards,

Hans

