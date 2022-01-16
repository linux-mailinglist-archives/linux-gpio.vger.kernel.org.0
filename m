Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04BD148FBFE
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 10:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbiAPJiL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Jan 2022 04:38:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37871 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231261AbiAPJiK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 16 Jan 2022 04:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642325890;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XM7twxV5fcYmhWZi9on2pwh6tX7Y+btUVEYKhEYQmW0=;
        b=asZuBBj7/ZJaMAeas7xqfs0SupixqmN02XjwtfwuJFGdqI6cF7ktoezDH6+jM/gWfdzYu1
        /s8pvnwdhCp5Q8gotJkuExbQUcc1MlXwEXFHcmkZYQLi09FbLYgKmnUuzpX/z2nzOTC6xG
        d0jYEeRLsE89Gh2P2IPhUZZI4qfSCkA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-TwVPi_EINUuZu_rK1yJQrA-1; Sun, 16 Jan 2022 04:38:08 -0500
X-MC-Unique: TwVPi_EINUuZu_rK1yJQrA-1
Received: by mail-ed1-f70.google.com with SMTP id x19-20020a05640226d300b003f8b80f5729so11627690edd.13
        for <linux-gpio@vger.kernel.org>; Sun, 16 Jan 2022 01:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XM7twxV5fcYmhWZi9on2pwh6tX7Y+btUVEYKhEYQmW0=;
        b=2qSzMfKg+mnsx5j5DkbZBXpoZGN4kWV/RmOOnotlZcF1EjiYgnpFYweNyEA08t56OK
         JaSiNpj6pdG9msw9O31pz8rw9sits03nAth8lNWH55DXy4jHK7d+r7gn/dUoZCxnq+bn
         c9f3BNRFUeykNAf/W+9S9stOEddRHCkGGw27EH7m9jLOLmGoPy+USaq9bFT+bSIVvKLE
         SFau43FvDxO4PtOIeTeLBmkKVT8LBZakrHKlQRq6qcHWE9J4SDS80KPg7g2kA9152rJ5
         wCjO8vzETTZrM6isHhGeGoeMnkeb0Y7n41TOhtaFEiM39UhFAyL0lV+ReCuvGpSz5ZGc
         8UUQ==
X-Gm-Message-State: AOAM533MqsLINZYazZQY0kwRc5tUhSKmvsYZQ12V8LoBvBMYm2fJu/ne
        +Z5qMpZHdfZM3mrSP1jKH5krS5l2xH26tbBTp9cfNBfd4RptzkC9FazaFaL+epUwcaHg2J8c+0l
        w9kxBFLRIt2l1LFh4eczF6Q==
X-Received: by 2002:a05:6402:5216:: with SMTP id s22mr574010edd.44.1642325887583;
        Sun, 16 Jan 2022 01:38:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyjqSYKYOIiX7r82o3B8yNVo+jx1JCi65D/vF8iNnGK/gwpxQdlfAFtLLplSFiGSZfOdjvDA==
X-Received: by 2002:a05:6402:5216:: with SMTP id s22mr574000edd.44.1642325887431;
        Sun, 16 Jan 2022 01:38:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id r17sm4318000edw.70.2022.01.16.01.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 01:38:06 -0800 (PST)
Message-ID: <99b07461-750f-fcd3-efc3-4dc4d9f9a859@redhat.com>
Date:   Sun, 16 Jan 2022 10:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] pinctrl: cherryview: Trigger hwirq0 for interrupt-lines
 without a mapping
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
References: <20220104164238.253142-1-hdegoede@redhat.com>
 <YdS8X1w7YWizdady@smile.fi.intel.com>
 <CACRpkdbHwKyJnwYno9OOWrFtapAp=bN_VYLu_p6xG2wMJjQKJA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CACRpkdbHwKyJnwYno9OOWrFtapAp=bN_VYLu_p6xG2wMJjQKJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/16/22 02:01, Linus Walleij wrote:
> On Tue, Jan 4, 2022 at 10:31 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
>> On Tue, Jan 04, 2022 at 05:42:38PM +0100, Hans de Goede wrote:
>>> Commit bdfbef2d29dc ("pinctrl: cherryview: Don't use selection 0 to mark
>>> an interrupt line as unused") made the code properly differentiate
>>> between unset vs (hwirq) 0 entries in the GPIO-controller interrupt-line
>>> to GPIO pinnumber/hwirq mapping.
>>>
>>> This is causing some boards to not boot. This commit restores the old
>>> behavior of triggering hwirq 0 when receiving an interrupt on an
>>> interrupt-line for which there is no mapping.
>>
>> Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> Linus, can you apply this directly for v5.16 release?
> 
> Unfortunately I am a bit snowed under by backlog but I have now
> applied it for fixes for v5.17.

Thank you.

> Should I now also tag it for stable?

The troublesome commit this fixes / worksaround is only in Torvald's
current master, not in the v5.16 tag, so there is no need for this to
go stable.

Regards,

Hans

