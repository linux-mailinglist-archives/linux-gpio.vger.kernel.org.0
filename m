Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDCE73F48B1
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Aug 2021 12:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235577AbhHWKdN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Aug 2021 06:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30671 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236127AbhHWKdF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Aug 2021 06:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629714742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nJMWPNeTnj7zhav+yI4spIor4jwXSbFgOr2bhQSRf8g=;
        b=EleQPg6cmc4NpskMHipmq/yl1+/rmRXxEmwguDwRGfsjngWcWghBT6woVfHlTKypXoYFkU
        5L5h5bRta9CCbFYwQWLznWMsBpDNEUlHwo/QvEjAAqDL4C/d/lKpj4R+JFZK0zxM3mdIyP
        reFlp0dJfo4zYeUJN31jBldLWRDIfc0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-_MaQENAfPLeLCvMShBhUwA-1; Mon, 23 Aug 2021 06:32:21 -0400
X-MC-Unique: _MaQENAfPLeLCvMShBhUwA-1
Received: by mail-ej1-f69.google.com with SMTP id g15-20020a170906c18f00b005c696624511so569285ejz.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Aug 2021 03:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nJMWPNeTnj7zhav+yI4spIor4jwXSbFgOr2bhQSRf8g=;
        b=odfi6Svuae2CVVMcgwg612yiXifRH6/Mih+4qT4wqYQZk3qm4rY/7cVDGo2KUOB+VL
         O1jP4LOZQYJmTT7LqwHBld87saof56oBkQhrps3Q+3u9IAK3wOg1Fp3EiUvOoXekNebF
         1OMTnZscK9cK/lnV4qh13yJurM/mmJmIkd5ljIV37lQoDuEjoRpaGqrjoEpJOIJ+1F0s
         WT+6CUTtXNE4iKFx8Q+fYU8VqySG2W8QuiQZEI8267h8kavfE5prz98uoX+kykzojfdY
         iEDt4+mycTceUMdcdwJ83jhXCE7hOvUBLEykOjw9bX4EWvehGbDO4+tc4Wm4GjU2b8EJ
         wLmQ==
X-Gm-Message-State: AOAM533KGbiC5mU0LHfTs+sns7vpye7n1gexDQdYyS1ZhNOyQ/2/qrY/
        E1BiQMyCvWLuWaKwPOFqh6u/84YupkbW44KGFSJM5jEqmNcMWP3rf4NLG35qc4l33G+15f5YkV8
        ZQ2el4+FimH8NrIXOXkGqC0bNPS9UKZE5b0i5oAKzpqavpDcnMzt2IGAmYTM8PttrZnMazbOKbw
        ==
X-Received: by 2002:a05:6402:3485:: with SMTP id v5mr35875297edc.205.1629714740170;
        Mon, 23 Aug 2021 03:32:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyT6CjtW+EGjkz8dsP5BtLFJLa2Of6gSwe0YbezvYrObS8/DjQk9XgBUyqy8c71UAtuX05lVQ==
X-Received: by 2002:a05:6402:3485:: with SMTP id v5mr35875241edc.205.1629714739482;
        Mon, 23 Aug 2021 03:32:19 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id q21sm7130023ejs.43.2021.08.23.03.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 03:32:19 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: baytrail: Pick first supported debounce value
 larger then the requested value
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
References: <20210819203952.785132-1-hdegoede@redhat.com>
 <YR+qHHVgALcpQ6k+@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ee7274c0-15f1-3ca0-cca3-bcdc37350334@redhat.com>
Date:   Mon, 23 Aug 2021 12:32:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YR+qHHVgALcpQ6k+@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On 8/20/21 3:11 PM, Andy Shevchenko wrote:
> On Thu, Aug 19, 2021 at 10:39:52PM +0200, Hans de Goede wrote:
>> Bay Trail pin control only supports a couple of discrete debounce timeout
>> values. Instead of returning -EINVAL for other values, pick the first
>> supported debounce timeout value larger then the requested timeout.
>>
>> E.g. on a HP ElitePad 1000 G2, where the ACPI tables specify a timeout of
>> 20 ms for various _AIE ACPI event sources, this will result in a timeout
>> of 24 ms instead of returning -EINVAL to the caller.
> 
> I would prefer to see case 1...375: case 376...750: It makes it more explicit
> what we choose. Also it will be in align with debounce getter switch-case.

Ok, that works for me.

> Nevertheless, there is the bigger problem here, which is that the debounce
> setting is global per community and neither current nor new code addresses.
> 
> What we need is to have a bitmap of size 3-bit * N_pins (per community) to save
> settings and each time we try to adjust them, we have to go through that bitmap
> and check actual users and see if we have conflicting requests.
> 
> You may ask why we have to keep the actual debounce value and not the biggest
> one. The reason why is simple, if the following flow of requests comes we will
> have better setting at the end:
> 
> 1) A asks for debounce of 1ms (we set to 1.5ms)
> 2) B asks for 10ms (we set likely to 12ms *)
> 3) B gone (we should return to 1.5ms)
> 4) C asks for 400us (*)
> 
> *) TBH I have no idea what to do with these cases, i.e. when better to satisfy
>    the bigger, when issue warning, when just print a debug message. I admit
>    that debounce on BYT has been not thought through on HW level.
> 

I believe that most DSDTs only use 1 value, so the whole bitmap thing seems
over-complicated.

I did noticed the dev_dbg which I added triggering by a requested value of 50 ms.
I've tracked that down to  drivers/input/misc/soc_button_array.c setting
debounce_interval to 50, which then gets passed to gpiod_set_debounce() by
drivers/input/keyboard/gpio_keys.c. gpio_keys.c will fallback to sw debouncing using
mod_delayed_work() if gpiod_set_debounce() fails, so I think we should deny
big debounce values to keep that fallback working.

I suggest we do the following:

1. Reject value < 0 || value > 24 ms values (avoiding the gpio_keys case)
2. Determine rounded-up value using modified switch-case as you suggest 
3. Check vs last set rounded-debounce value (if set) and warn + fail
   the set_debounce if it is different
4. Remember the last set debounce value

If the warnings turn out to trigger, we can then look at the DSDT of
that specific device and figure out a way forward from there, with the
knowledge of how a troublesome device actually uses this (I know a sample
of 1 troublesome device is not necessarily representative, but it is
better then no samples and I expect / hope there to simply be no samples).

(we can then also skip the debounce-time programming when it is unchanged)

How does that sound ?

Regards,

Hans

