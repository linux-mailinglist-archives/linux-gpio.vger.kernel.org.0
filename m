Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEFAB21831D
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 11:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbgGHJIH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 05:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgGHJIG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 05:08:06 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C796DC08C5DC;
        Wed,  8 Jul 2020 02:08:05 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id s16so20945590lfp.12;
        Wed, 08 Jul 2020 02:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8vrM7hTRpKdzeQsBDUGOGiFhO9KbY2xs+nqLJ5TqqjM=;
        b=rrpjEioWfto0pCCURutcSD1sx6k0SJyxgqz0ggrNvtwTub7XcIv0RPl5g49CNpSspr
         Ny5W6RKdoLKN0OIIB55VzjoOxhncJOwvrUT8gSh6J9eCOMYDE6JpjAfdj3Ae8mox7d9m
         Bjyj2OUPLshsq2tAT1Fj6CBXeDxGgO6Vx8bJ4sJZpgYameUgh3ak3ZIiA9pbao0uHDaF
         h68IDzdEsYafPnrEOSgLndiiAT8D1bZHF6glkc6oxbqQiZoc2fBJP1uouLW6L5sw5kZ1
         zgCSFz0iEpyWkPqI5ofmXN+KxqN5IoQKI8729EDGi473ivPG6/GdNSFHv+sAgB0gs3Ue
         9vdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8vrM7hTRpKdzeQsBDUGOGiFhO9KbY2xs+nqLJ5TqqjM=;
        b=Fur4iQGAJykWxAtKEU2mHti4vOLeK0Gy/u5XL14H+VXOHfqYS2dm4aC1m/izm7RDbe
         SgtElpbBNjCKevd0zwW5wf1Ab7mYgPWUtQSsWe2uQSDQ2346mkoUlvqSBM1KwwkM3M3E
         A4Fp5bjk2yJ+OnD/KupwOHXWToPsE7gWVIJubiv2SWjvLjPeaQ37ljuMgCHYWUrBvlWK
         YEpBEGyE9r1cNaF5L8X5tmdzS+rMiW7Y2L/rlhLM2KyKXi1eVThwUqggwmXv6YUcHjnd
         ZYkTcHsDsZpjKEjjbQ5oBvuRNXZwRQuAzRbNdkY2+3f4mWFq7EfjYqBKULwjPeHgGqXv
         4fUw==
X-Gm-Message-State: AOAM53224D0A9kcPUYlFF7Oo7QGwQghXGjz0PqQDt49zwszpZFxiDrDD
        MBH7qgCn1Z0N5+nDxFnRhvwxokm6
X-Google-Smtp-Source: ABdhPJw1E33uomRbtkL7t7n99pBlhOsxY+dYwbKBX6rimfjlZVxvteERnSyN/fu++WfDQK78tvdMHw==
X-Received: by 2002:ac2:5a5e:: with SMTP id r30mr35947527lfn.30.1594199283821;
        Wed, 08 Jul 2020 02:08:03 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.googlemail.com with ESMTPSA id b6sm760739ljj.89.2020.07.08.02.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 02:08:03 -0700 (PDT)
Subject: Re: [PATCH v1 3/5] gpio: max77620: Replace interrupt-enable array
 with bitmap
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200708082634.30191-1-digetx@gmail.com>
 <20200708082634.30191-4-digetx@gmail.com>
 <CAHp75Vc56D5QeL2WArUj4OGGk4XgkiK37FnFr=5+XsisLpng1A@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c201575a-ab2a-d74d-9791-3fde7844eb01@gmail.com>
Date:   Wed, 8 Jul 2020 12:08:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc56D5QeL2WArUj4OGGk4XgkiK37FnFr=5+XsisLpng1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

08.07.2020 11:44, Andy Shevchenko пишет:
> On Wed, Jul 8, 2020 at 11:30 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> There is no need to dedicate an array where a bitmap could be used.
>> Let's replace the interrupt's enable-array with the enable-mask in order
>> to improve the code a tad.
> 
> ...
> 
>> +#include <linux/bitops.h>
> 
>>         unsigned int            irq_type[MAX77620_GPIO_NR];
>> -       bool                    irq_enabled[MAX77620_GPIO_NR];
>> +       unsigned long           irq_enb_mask;
> 
> I would rather to move to DECLARE_BITMAP()
> (the macro is defined in types.h IIRC)
> 

Hello, Andy! I know about DECLARE_BITMAP(), it is a very useful macro
for bitmaps that are over 32 bits, which is absolutely not the case
here. This macro will make code more difficult to read and then we will
have to use the bitmap API, which is unnecessary overhead for this case,
and thus, it won't be an improvement anymore, IMO.

I'd either keep this patch as-is or drop it.
