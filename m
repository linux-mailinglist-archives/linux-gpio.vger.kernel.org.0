Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54A21D0287
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2019 22:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730720AbfJHUxQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Oct 2019 16:53:16 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46708 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730523AbfJHUxP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Oct 2019 16:53:15 -0400
Received: by mail-wr1-f67.google.com with SMTP id o18so20963244wrv.13;
        Tue, 08 Oct 2019 13:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hV2EwO2uZ4W6iHqEsIR6MXJZhvQewq77P3f/1i1sjXQ=;
        b=GBfi7pL3nla+lzN02m5TnyxB/TP+gpypRDaIrb6zCW6+1eF56N3141JJy/ShDrzRdP
         yofuQYnX1ypSw4+4S2p6xJ90yBXn3J52WCBu57c00Cwtz8l9oE7Tmyoxy3pnWjAOTDd6
         zZmlJC3TfkTTTLOqO23EQEYzNpZXujxVU/F5w6dpgyhCy38qXX+3jCDPYz9sxCWBufnL
         3bxCu7Yz+CWivUca8qRg6QJicLwpE2em7MVoL6ytfpJP+w/rSq+Y/JZ+qDHyEuzGulio
         a1AIWIflcnMQDsXdIjcsJtETaWu1L7P22AL1Mxkt2caMoovLKr0dBlxuTR1kPmg3eBZq
         UEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hV2EwO2uZ4W6iHqEsIR6MXJZhvQewq77P3f/1i1sjXQ=;
        b=ORSKncw2rXEnGS8FAF1ln+3DjGQX2OtQJPwikiYXM3X/YvgZeodTxtB0GvtPh8fdBP
         63c67l9d78m1NntLAssWNpSiqfIgnOrJRMx1Vn48GJRSgoQhi0py/v7qac846RxM1jnB
         FZ2iIqLmfp3IAJUhfYtwrKr67gxHRKe/KVQWG7xy7txXr7Oct2F6AcpGIEQNflD/EJAV
         T8ipRScqMNzdrbpC1XjP2U+9+YD/r15gTFHFb1Oc71jfM/6bjfylgqjUipXib8l1xUy/
         JYN/aLh1+J6MN9DVwzMGGo+KreFUDlVBs2SNqbiEAhM02I7UfbXCgVK7WzyWIKUx2kg8
         Z46g==
X-Gm-Message-State: APjAAAWLZUIbMWA75wQ+jJsXUXtj0faNWrMyqLNKgmR92s70uhFlUzGs
        b822lk9jyp5OGrwPKUobWDB/XFnJbS4=
X-Google-Smtp-Source: APXvYqy/Cer8U8dtWqWt6nyYT6ft/t9jf+/ma2FWZwHz57W57eFfMWsxYw/LYDuQfTt0EnnORZHwMg==
X-Received: by 2002:a5d:6943:: with SMTP id r3mr6654428wrw.21.1570567991190;
        Tue, 08 Oct 2019 13:53:11 -0700 (PDT)
Received: from [192.168.1.19] (bgs228.neoplus.adsl.tpnet.pl. [83.28.82.228])
        by smtp.gmail.com with ESMTPSA id t203sm6028688wmf.42.2019.10.08.13.53.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 13:53:09 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: gpio: support multi-level brightness
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
References: <1570203299-4270-1-git-send-email-akinobu.mita@gmail.com>
 <96ac332f-359f-531a-7890-45b39e168b82@gmail.com>
 <CAC5umyggUm26JHU9QeND=rTozjXwH5uMiVvoK=Zqo31eBn69pg@mail.gmail.com>
 <7d451092-bf8a-e1d4-996c-8af3cc816fc7@gmail.com>
 <CAC5umyiK8LBqQ1B1LPQgWXGCk_a+JyKgidrRZpPMDu+NZncDXw@mail.gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <72129a38-d975-74d4-269d-6269556d7aae@gmail.com>
Date:   Tue, 8 Oct 2019 22:53:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAC5umyiK8LBqQ1B1LPQgWXGCk_a+JyKgidrRZpPMDu+NZncDXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10/6/19 4:11 PM, Akinobu Mita wrote:
> 2019年10月6日(日) 4:17 Jacek Anaszewski <jacek.anaszewski@gmail.com>:
>>
>> On 10/5/19 3:20 PM, Akinobu Mita wrote:
>>> 2019年10月5日(土) 6:17 Jacek Anaszewski <jacek.anaszewski@gmail.com>:
>>>>
>>>> Hi Akinobu,
>>>>
>>>> Why do you think this change is needed? Does it solve
>>>> some use case for you?
>>>
>>> It can be useful when using with an LED trigger that could set the
>>> brightness values other than LED_FULL or LED_OFF.
>>>
>>> The LED CPU trigger for all CPUs (not per CPU) sets the brightness value
>>> depending on the number of active CPUs.  We can define the multi brightness
>>> level gpio LED with fewer number of GPIO LEDs than the total number of
>>> CPUs, and the LEDs can be viewed as a level meter.
>>
>> Can't you achieve exactly the same effect by creating separate LED class
>> device for each GPIO LED and registering each of them for separate cpuN
>> trigger?
> 
> If there are GPIO LEDs as many as the total number of CPUs, we can.
> However, if there are only two GPIO LEDs and six CPUs, we can only know
> the CPU activity for two CPUs out of six CPUs with cpuN trigger.
> So it's different from using cpu (all) trigger with multi level (2-level)
> brightness GPIO LED.

OK, that's a reasonable argument. However, this is clearly
trigger-specific functionality and we should not delegate this
logic down to the driver.

What you propose should be a responsibility of a trigger that would
allow registering multiple LEDs for its disposal. This would have to
be different from existing LED Trigger mechanism, that blindly
applies trigger event to all LEDs that have registered for it.

Such a trigger would have to be a separate LED (pattern?) class device.
It would need to be told how many LEDs it is going to manage
and create files for filling the LED names. This design could be also
used for defining patterns spanning on multiple LEDs. Just a rough idea.
We can dwell on it if it catches.

-- 
Best regards,
Jacek Anaszewski


