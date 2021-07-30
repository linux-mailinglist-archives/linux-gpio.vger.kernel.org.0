Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA663DBD9F
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 19:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhG3RVj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 13:21:39 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:56108
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230203AbhG3RVj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 30 Jul 2021 13:21:39 -0400
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 4DAF43F232
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 17:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627665693;
        bh=o5z17HicOMnibSKxbfutUtdmQTlkkNRFgUGIEJq9A5o=;
        h=From:To:Cc:References:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=iP1hWkWZT5MwdLvttmMex0l/IDza+w9yJmXaClovbGuDZQk3A2vKh1UBx7N6XEXUf
         GNXXL8D5F3rXZ5Gk+bybOiO4/AKiZ7BIjrf5nXR6f/srdiMQJrjD9ug4gTS6YHKUel
         ZAj8ig1/r+6/u6DxOfF5AWYwJ7EZ2kdNKbLo5orIKO84lDxlBO6O/uitwevsCqDyXt
         KSvAX6pY3v035Z1khVp0+xT81wAuBHXccX256pOfkSlKBKQItACijOQLvezemEmR2e
         acouAcnqVlz5aWFP0O0Kz/JaVgqa2l5eApzLQ07eyR6uNpREj44eMVSq34ifNmACXo
         xIKWVdmtXeorQ==
Received: by mail-ej1-f71.google.com with SMTP id kf3-20020a17090776c3b0290536d9b62eb6so3346463ejc.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 10:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o5z17HicOMnibSKxbfutUtdmQTlkkNRFgUGIEJq9A5o=;
        b=jmlw9H/lVDxf7lHb1KapLKddRIilH37RVu4pZXu2C6Nvwms/iDSSfm9C/vWkkcHK1/
         Y+Zluof+0w9LH0Dfc/2l+Ldj49VI4i46StEagJcz2u2F5+9DLzEbDY3BGyTRTmOyUFzh
         xDGWUcMqY7ZSoWMZrF5T5tEWB0xJy/TNMK77Lmpx2sFVJ2MUpIgX9Ay342aStjgtPnBS
         AKY7Lnj+tDhEiTaIZUN7Y/vNdiwiVa7CdygHIR6X23Y5x5F5rjvm9HmN1Zo/2CDK4POq
         HA2Lh25BfMu1QuVpGkIBzYx+i8EMqLG1BkfSDOPM43Hj/oDtjKGHBRBMD/qCHxvLXWsk
         BRTQ==
X-Gm-Message-State: AOAM532gaUR8S0NIWmrrTW6F4fkgh099JgHyuQy+p61wVrU7ncK6I1uu
        OoUSAcZ1GWO/DsAQG2eWnHoAnzGSWFS9tcagbdnVnkKGvjcDUxC/SK14Zb2Vc6mTI3Hf6N6MHjr
        lLi9xiFDuDL0Am9j7SR0cVZ2LgHIZw484WCFD/tk=
X-Received: by 2002:a17:907:724b:: with SMTP id ds11mr3758108ejc.192.1627665692503;
        Fri, 30 Jul 2021 10:21:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFiKJlif1uhqb84VdmehIjJr5DEUQdSGnnvL110bm0Y0Y4Awj/aQgY4XpZWPb/ITBePmMBnw==
X-Received: by 2002:a17:907:724b:: with SMTP id ds11mr3758080ejc.192.1627665692316;
        Fri, 30 Jul 2021 10:21:32 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id p16sm944758eds.73.2021.07.30.10.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 10:21:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <5e35b0a7-13aa-3c62-ca49-14af2fcb2a08@canonical.com>
Subject: Re: [PATCH 00/12] Add minimal support for Exynos850 SoC
Message-ID: <c3486111-0ec9-9679-d2a2-68b2f33a2450@canonical.com>
Date:   Fri, 30 Jul 2021 19:21:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5e35b0a7-13aa-3c62-ca49-14af2fcb2a08@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/07/2021 17:18, Krzysztof Kozlowski wrote:
> On 30/07/2021 16:49, Sam Protsenko wrote:
>> This patch series adds initial platform support for Samsung Exynos850
>> SoC [1]. With this patchset it's possible to run the kernel with BusyBox
>> rootfs as a RAM disk. More advanced platform support (like MMC driver
>> additions) will be added later. The idea is to keep the first submission
>> minimal to ease the review, and then build up on top of that.
>>
>> [1] https://www.samsung.com/semiconductor/minisite/exynos/products/mobileprocessor/exynos-850/
>>
> 
> Great work!
> 
> What's the SoC revision number (should be accessible via
> /sys/bus/soc/devices/soc0/)? Recent wrap in numbering of Exynos chips
> might bring confusion...

Judging by vendor's sources it is quite confusing. It looks mostly like
Exynos3830 but in few other cases it uses Exynos9 compatibles (Exynos9,
Exynos9820). Only in few places there is Exynos850. Marketing department
made it so confusing...  The revision embedded in SoC would be very
interesting.

Anyway, judging by current versioning, there is a risk Samsung will come
with a new chipset name conflicting with existing ones. It already
overflowed.

It's even worse with a thingy called "Exynos9 auto" which hides
numbering even more.


Best regards,
Krzysztof
