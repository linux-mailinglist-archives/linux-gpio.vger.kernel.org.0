Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38B148CD45
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jan 2022 21:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357774AbiALUu4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jan 2022 15:50:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41806 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1357760AbiALUuv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jan 2022 15:50:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642020651;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/AzNgphb6SLRqgXLyfjiup2tbJ9pjMlsU+DT4h955bU=;
        b=DLayDQ4zWPPfs8+sXfDbdMxDGIDplIfQcP9vLijzzknt6npwoWWkGKS/TXVnKHsQDr1MMA
        MICaI3Nl8AjsSHbOfOFwNxK2W0Q6Ax3DcN7LNnHZr9OeuMvk1v0DJFScEA0a79H1eXaMnV
        v8/4IBvx1pqHVqSStJS1Aouz4Ba9O/Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-NobRQqvKOK6RgjpFyANEQg-1; Wed, 12 Jan 2022 15:50:50 -0500
X-MC-Unique: NobRQqvKOK6RgjpFyANEQg-1
Received: by mail-ed1-f71.google.com with SMTP id q15-20020a056402518f00b003f87abf9c37so3322743edd.15
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jan 2022 12:50:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/AzNgphb6SLRqgXLyfjiup2tbJ9pjMlsU+DT4h955bU=;
        b=YpXQzwT7M1XDWwLKLvdDnxv5TswBzKfUv+efbMqAYi3RlQojCqs+TR9Vq4ffg5vnoY
         SQC8AZGZrxtwfQmpuC25+vugK2MjNlJdQhng4x4Yrrx8E2flc7LrD1tfTO+zvmbNYYVC
         Hz8k/4uHQb0P+8F9B9x5ROdzsM3ErR32aiPPd8EWP7AqV6AqtB1Go8sMG5Mqj53ScNon
         XKwLqKchR/h57aOzrlcyxdS5FPKCJw8ozS7gMzmHpCvbKdQnZtD8jvHtRoDsHUUA91sR
         PT4m5Lo56CpAu+PcYNRoL3NFbomyl9ItA68gciG+a+QCtIdec+DHjpF4UUxenqV1jarO
         BxvQ==
X-Gm-Message-State: AOAM530f7Bq6p/yxoIFcyKw+nuLpy0AzsTgfga6irHWllRP0QzKM4KQ2
        /Ps9+gtdQ+Rt/tQeSVRZvITfZxKg4zfaDUCxL17yPt005W7YVXrAtaUbfDTsJsV78HK6ru9lR+U
        SVxmr96o9SK2ci5mh/XoreA==
X-Received: by 2002:a17:906:5208:: with SMTP id g8mr1128546ejm.634.1642020648842;
        Wed, 12 Jan 2022 12:50:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsrnR/Wg8SSbTVUThpT4lf8LMlD+BIJSmzcYyOO4/8axv5KIchkEQSHwjX/IvDoofJw+dXQQ==
X-Received: by 2002:a17:906:5208:: with SMTP id g8mr1128534ejm.634.1642020648653;
        Wed, 12 Jan 2022 12:50:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id z19sm318263edd.78.2022.01.12.12.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 12:50:48 -0800 (PST)
Message-ID: <1fb6eb89-7c87-b30e-0ebe-911ce7dcf881@redhat.com>
Date:   Wed, 12 Jan 2022 21:50:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3] pinctrl: baytrail: Clear direct_irq_en flag on broken
 configs
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     kernel test robot <lkp@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org, linux-gpio@vger.kernel.org
References: <20220107234456.148389-1-hdegoede@redhat.com>
 <202201090203.kgCw6bSd-lkp@intel.com>
 <eb4ef470-cfaf-13be-cb66-ca38c1a85a23@redhat.com>
 <Yd89sQz8L/KJ4BXA@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yd89sQz8L/KJ4BXA@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 1/12/22 21:44, Andy Shevchenko wrote:
> On Wed, Jan 12, 2022 at 08:58:00PM +0100, Hans de Goede wrote:
>> On 1/8/22 19:54, kernel test robot wrote:
> 
>>>>> drivers/pinctrl/intel/pinctrl-baytrail.c:1483:58: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
>>>                    dev_dbg(vg->dev, "Pin %i: uses direct IRQ %ld\n", pin, match - direct_irq);
>>>                                                              ~~~          ^~~~~~~~~~~~~~~~~~
>>>                                                              %d
>>>    include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
>>>                    dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
>>>                                                        ~~~     ^~~~~~~~~~~
>>>    include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
>>>                    _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
>>>                                            ~~~    ^~~~~~~~~~~
>>>    1 warning generated.
>>
>> Hmm, ok. so x86_64 needs a %ld for the pointer arithmic result on i386 needs a %d
>> without the 'l' what fun. I'll just store it in a temp int variable in the next
>> version.
> 
> Why not to use uintptr_t and corresponding specifier (or ptrdiff_t)?

those or long resp. int depending on the arch to, but I could just
cast the result of the "match - direct_irq" pointer arithmetic to
an int, however due to the other changes in v4 using a local variable
seems cleaner, see the v4 which I'm about to send out in a couple of
minutes.

I think you will find v4 interesting because I've done a detailed
analysis of how the pinctrl conf0 pad register trigger bits and the IO-APIC
trigger bits work together, which is quite enlightening to how this all
works (and AFAICT not documented).

Regards,

Hans

