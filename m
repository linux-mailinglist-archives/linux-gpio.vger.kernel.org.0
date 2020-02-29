Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 063EF17489E
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Feb 2020 19:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbgB2SOe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Feb 2020 13:14:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59364 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727314AbgB2SOe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Feb 2020 13:14:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583000073;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hoU8K7lmVxB2DxULfOjJQYORwunWEmNAqcyibntU0Kg=;
        b=WUeo2RKRWn+0hsZe2/MYALkMi8YKJJdGZOII5S42RMlyY81c6JCjkw7i/RbVv6HyXUsx6w
        mAOEAuDjj46gSk/64HJ8vhSjaUV2O+pwgY98/+5bBVDLD+K+pM+CQrmxGHgODD2iDEZBD+
        3wzp59Dzfw0K4JP9zNEDUAckds5dVd4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-_4YUI_CbOs-Wem3erlR-eg-1; Sat, 29 Feb 2020 13:14:31 -0500
X-MC-Unique: _4YUI_CbOs-Wem3erlR-eg-1
Received: by mail-wr1-f71.google.com with SMTP id p8so3161160wrw.5
        for <linux-gpio@vger.kernel.org>; Sat, 29 Feb 2020 10:14:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hoU8K7lmVxB2DxULfOjJQYORwunWEmNAqcyibntU0Kg=;
        b=S/36toIRmqQxJxaZWHtP+Hda2MGsgdAzu2cL1UBNrhL9OmUi6evaZBvl6yLpT4f1Qa
         d6rkSw/n2mJHs7Yy9RZyOr5bqy/ZROUmIkGXU1vvw3yf8LTCUbeYGr4wJpiuVYePCPFI
         3qxn0NPkl9GjjGbnbmuAN5hjEvVKdx029l4+RL5yr6S7Ys2Fxr6dWYnw/+gqycnC9dY+
         Gi0MQbYm/276P5GuAJ9m6Hiqx7Dc+8A/r8uQcp4ijUtjcK//wUIaE1DS2/FGratHDrUU
         /8hkuNiwzUES1o8vv7j9yGgJAPd+p0/XvO/YfRLZRsmJs0CAXd1Vc7wQ/0tCAvz6T8p0
         ckSw==
X-Gm-Message-State: APjAAAWFriU3+QFKmjEFTTuw4Xuz8VNXlgYctkM8Oxz9bBtOFRz0A6Zj
        pe+gopkPnnTT+OeD75dVMYCuzk0+wpmPwZ/zggWpC03Nw14TBMkPo4R2gCzwy8aFdIbgyVMXSNG
        d7WHvzM2+DNG9sZDV4eLPFw==
X-Received: by 2002:adf:e542:: with SMTP id z2mr12193164wrm.150.1583000070084;
        Sat, 29 Feb 2020 10:14:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwewR/nz74BPPb/ljig/lJrvBCI32Bq+jkBuhoNyB4A/Bz349qUg566eVEzjX+g6m2Zn/vfTg==
X-Received: by 2002:adf:e542:: with SMTP id z2mr12193149wrm.150.1583000069857;
        Sat, 29 Feb 2020 10:14:29 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id w19sm6941566wmc.22.2020.02.29.10.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Feb 2020 10:14:29 -0800 (PST)
Subject: Re: [PATCH resend 1/3] gpiolib: acpi: ignore-wakeup handling rework
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Marc Lehmann <schmorp@schmorp.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
References: <20200225102753.8351-1-hdegoede@redhat.com>
 <CACRpkdb3W=fL3VnNSep2MFnihqEj5GwWsN6BdWRSWckZBMHAOg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <80cc50cf-68e6-5208-36aa-97dbecc38b8f@redhat.com>
Date:   Sat, 29 Feb 2020 19:14:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdb3W=fL3VnNSep2MFnihqEj5GwWsN6BdWRSWckZBMHAOg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 2/28/20 11:54 PM, Linus Walleij wrote:
> On Tue, Feb 25, 2020 at 11:28 AM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> The first patch just updates the comment describing why we are ignoring
>> GPIO ACPI event wakeups on HP x2 10 models.
> 
> OK
> 
>> The second patch is more interesting, in the mean time I've learned their
>> are actually at least 3 variants of the HP x2 10, and the original quirk
>> only applies to the Cherry Trail with TI PMIC variant (and the original
>> DMI match only matches that model). We need a similar quirk for the
>> Bay Trail with AXP288 model, but there we only want to ignore the wakeups
>> for the GPIO ACPI event which is (ab)used for embedded-controller events
>> on this model while still honoring the wakeup flags on other pins.
>>
>> I'm not 100% happy with the solution I've come up with to allow ignoring
>> events on a single pin. But this was the best KISS thing I could come up
>> with. Alternatives would involve string parsing (*), which I would rather
>> avoid. I'm very much open to alternatives for the current approach in the
>> second patch.
>>
>> Since sending out the first 2 patches of this series I've received
>> positive testing feedback for the quirk for the HP X2 10 Cherry Trail +
>> AXP288 PMIC variant, so here is a resend of the first 2 patches with
>> a third patch adding a quirk for the third variant of HP X2 10 added.
> 
> I'm waiting for some ACPI person to say yes to this,
> Mika ideally but the other Intel guys like Andy also works :)

In the mean time Anday has reviewed the series and as somewhat expected
he did not like the second patch very much. I'm working on an updated version
fixing Andy's concerns.

Regards,

Hans

