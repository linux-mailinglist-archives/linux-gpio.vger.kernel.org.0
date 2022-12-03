Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C866E64168D
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Dec 2022 13:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiLCMKt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 3 Dec 2022 07:10:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiLCMKt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 3 Dec 2022 07:10:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE5045EC1
        for <linux-gpio@vger.kernel.org>; Sat,  3 Dec 2022 04:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670069388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QF9fv85ZYD8u1Tcz/z3zMYQdnjBegRaXvPl7jptww0Q=;
        b=KiT2THYNn/qd/WLSLRviczwCiAKRVdkl6b1RRw3UWkBAZNrBX74UZpLiSVA+LChFaM5x5w
        cZjoGT14vk0TQMWRvPjj7IHmO/HZoTJ/PZhUvrnLALzw2ZYt7RRP5Hxn2E/b6O0lQwM/Yd
        wSOfifKT+ZrOLcixj/lAylkKEL8R3iI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-108-wbiDgEXaPZuMPfa4CE-GZg-1; Sat, 03 Dec 2022 07:09:47 -0500
X-MC-Unique: wbiDgEXaPZuMPfa4CE-GZg-1
Received: by mail-ed1-f69.google.com with SMTP id w4-20020a05640234c400b004631f8923baso3470631edc.5
        for <linux-gpio@vger.kernel.org>; Sat, 03 Dec 2022 04:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QF9fv85ZYD8u1Tcz/z3zMYQdnjBegRaXvPl7jptww0Q=;
        b=qiVJLjxMyiFhJf5qzu4t97Yj3eBezuabbEYeajxOjAU4NMHff3/qlUKFDbnWMwYkqS
         ERrFuu5LzAS3mOlkDFuihRrCPO1cBPpTX92zuVUB5SzoaX13q1yFZan/UpoU9cGclafo
         xskgyAm+31GoUWyw4QPOZQtgGD77qm4RkBt0G3wum47Hcr9jlLhsvzj6eo5PnPxBMLXp
         ffRe6DGaHRKofuIDM7N0YvgdkiA94A5calPpKli6Q5bXSLoaNghGITrzHij9lAW9yqAr
         ZYunEu+va3zlTE2A8V8m8H8XT+eY1TTPbbfQLEcLh7gjY3nrGssd6KxXSTNyDF+DXinG
         EW6Q==
X-Gm-Message-State: ANoB5plq5pKcqAvjhXbo0J9zcVlDiT6DqzLPXYsiwo4AMu0QOfUFVGf+
        +2VswOYh/WYvH0ruiyq0+gKBVnpqjA12rAaZTH/SNejueulhq3Q8W9B3wDc42IAg4w+m5G1/iMp
        IXJAFsNSjtMhG46qSDH+k2Q==
X-Received: by 2002:a17:906:2c51:b0:7b2:8c66:9bda with SMTP id f17-20020a1709062c5100b007b28c669bdamr21320496ejh.732.1670069386187;
        Sat, 03 Dec 2022 04:09:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ZcvyoU7z1e4iYoIvOCZM0CZ5JzfOs6XEyPrG60h/v2cIKxkFPHgpQqvXzmBZMuLPgdP2zGQ==
X-Received: by 2002:a17:906:2c51:b0:7b2:8c66:9bda with SMTP id f17-20020a1709062c5100b007b28c669bdamr21320476ejh.732.1670069385937;
        Sat, 03 Dec 2022 04:09:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id p8-20020a170906a00800b007ad69e9d34dsm4160575ejy.54.2022.12.03.04.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Dec 2022 04:09:45 -0800 (PST)
Message-ID: <8246b761-d83d-de59-fa30-a82d6bbc9533@redhat.com>
Date:   Sat, 3 Dec 2022 13:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 2/3] Documentation: gpio: Add a section on what to
 return in ->get() callback
Content-Language: en-US, nl
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>
References: <20221130155519.20362-1-andriy.shevchenko@linux.intel.com>
 <20221130155519.20362-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdaQWZE6=BNEh5hSH9=jBK=TcLoD1uUb=JyNYmHFvaSAfg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CACRpkdaQWZE6=BNEh5hSH9=jBK=TcLoD1uUb=JyNYmHFvaSAfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 12/3/22 10:38, Linus Walleij wrote:
> On Wed, Nov 30, 2022 at 4:55 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
>> +The below table gathered the most used cases.
>> +
>> +==========  ==========  ===============  =======================
>> +  Input       Output         State        What value to return?
>> +==========  ==========  ===============  =======================
>> + Disabled    Disabled    Hi-Z             input buffer
>> + Disabled    OS/OD/etc   Single ended     [cached] output buffer
>> +    x        Push-Pull   Out              [cached] output buffer
>> + Enabled     Disabled    In               input buffer
>> + Enabled     OS/OD/etc   Bidirectional    input buffer
>> +==========  ==========  ===============  =======================
> 
> This looks about right to me, but we need more input, Kent?

As I already mentioned in earlier replies to me this
seems to make things needlessly complicated for GPIO chips
where there are separate registers for reading the input-buffer vs
setting the output-buffer.

To implement the above drivers for these would need to check if
the pin is in push/pull mode and then read the register setting
the output-buffer in get() while reading the register reading
from the input-buffer in other cases in get().

I fail to see any downsides to just always reading
the register reading the input-buffer on GPIO chips like this,
when the pin in in push/pull output mode that should simply
give us the right value and when it does not this could
help detect short-circuits to Gnd/Vdd.

Where as I fear that implementing 2 different strategies in
get() for these kinda GPIO chips, will most likely be a
source of bug. Esp. since testing all the permutations
from the above table is going to be tricky in many cases.

If we go this route and demand that drivers for GPIO chips
with a separate (read-only) register for the input-buffer
sometimes read the register for the output-buffer on get()
can we then add a helper to the core which returns which
of the 2 registers should be used so that drivers don't
have to duplicate the logic for checking this ?

Regards,

Hans


