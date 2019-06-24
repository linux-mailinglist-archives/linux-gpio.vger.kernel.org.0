Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99C3D4FF75
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 04:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbfFXCgd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Jun 2019 22:36:33 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:55345 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726321AbfFXCgc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Jun 2019 22:36:32 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20190624000832epoutp046b96c81e3192ba8a284fd87ca68117e4~q_dSUSwb71862018620epoutp04a
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2019 00:08:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20190624000832epoutp046b96c81e3192ba8a284fd87ca68117e4~q_dSUSwb71862018620epoutp04a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561334912;
        bh=FXLhH3xp58N69ijMnn/sGIRveP7AeFn1jV5SXYXCSfo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=e/k9EVQHgtzF6idvBashl0scU6AqpCG3MikscZIOkWNep6MYPFyUtqO4RE+tc7+H0
         LTgvUPQAZdSdROBgxBbGGNUMJqyH4V5c762HQc12PfoGoiQZJ2kVty5jtkKoKhqxAw
         QqTf+cxP0HmxrBRXfu7B9AZrYkSN0TNRQAvRK/4c=
Received: from epsmges1p5.samsung.com (unknown [182.195.40.156]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20190624000828epcas1p35a140a12268e526527e29b924b776d5c~q_dO12xgF2287522875epcas1p3m;
        Mon, 24 Jun 2019 00:08:28 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        02.07.04108.874101D5; Mon, 24 Jun 2019 09:08:24 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20190624000822epcas1p423597f0f8dd7a4a68047ee0ef6421d11~q_dJj4tkz2257922579epcas1p45;
        Mon, 24 Jun 2019 00:08:22 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190624000822epsmtrp10fb5112d79464145805163aff943c17c~q_dJjHIpg0223602236epsmtrp1U;
        Mon, 24 Jun 2019 00:08:22 +0000 (GMT)
X-AuditID: b6c32a39-89fff7000000100c-ca-5d1014781765
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        92.90.03662.674101D5; Mon, 24 Jun 2019 09:08:22 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190624000822epsmtip2abc340df84519acf14a96ee564282d31~q_dJZLITx2730627306epsmtip2g;
        Mon, 24 Jun 2019 00:08:22 +0000 (GMT)
Subject: Re: [PATCH] extcon: gpio: Request reasonable interrupts
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <547eacd4-e4b9-e9a9-9f89-aa33b05cb674@samsung.com>
Date:   Mon, 24 Jun 2019 09:10:58 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdaCaZyzfr9=QRz6uRZpK6mw_zDeVmBwgH7=FPbNGKB9tQ@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmk+LIzCtJLcpLzFFi42LZdlhTT7dCRCDW4OIHZospf5YzWWye/4fR
        4vKuOWwWtxtXsDmweNy5tofNo2/LKkaPz5vkApijsm0yUhNTUosUUvOS81My89JtlbyD453j
        Tc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgLYpKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yV
        UgtScgosC/SKE3OLS/PS9ZLzc60MDQyMTIEKE7IzHv86yFhwj69iy1PpBsYd3F2MHBwSAiYS
        n1YwdzFycQgJ7GCUaNl8hxXC+cQocf/DIhYI5xujxLmtT9m7GDnBOt69ncgOkdjLKPFu9T82
        COc9o8SliTfBqoQFHCRmXf8MZosI6Eh0b/vJCmIzCyxnlFhwzxLEZhPQktj/4gYbiM0voChx
        9cdjRhCbV8BO4tuHJ2D1LAKqEg9WdoHZogIREpe37IKqEZQ4OfMJC4jNKRAo8fl3CwvEfHGJ
        W0/mM0HY8hLNW2eDPSchcIZN4vPhy1AvuEhs6zvJCGELS7w6vgUqLiXxsr8Nyq6WWHnyCBtE
        cwejxJb9F1ghEsYS+5dOZgKFHrOApsT6XfoQYUWJnb/nMkIs5pN497WHFRLAvBIdbUIQJcoS
        lx/cZYKwJSUWt3eyTWBUmoXknVlIXpiF5IVZCMsWMLKsYhRLLSjOTU8tNiwwRY7sTYzghKhl
        uYPx2DmfQ4wCHIxKPLwCG/hjhVgTy4orcw8xSnAwK4nw8uTwxArxpiRWVqUW5ccXleakFh9i
        NAWG9kRmKdHkfGCyziuJNzQ1MjY2tjAxNDM1NFQS543nvhkjJJCeWJKanZpakFoE08fEwSnV
        wKjrWcP7dOksg/p1iUnbj33dc9r/yqqpyjZK/3/2vHaYdu3OjXceyhVcTLna79/8TJ4srqAf
        wHxKU23hkSW1TldWid6sMri4U33bjsUMi3d4rJ2eHlJwV0assP3kPzbejMoTh9czR002DQ9f
        Gzx7oZrjM23m3a+DlA5Pm+t0R3PNNoaln50jn19TYinOSDTUYi4qTgQAZ8Fbe54DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsWy7bCSvG6ZiECswbKfuhZT/ixnstg8/w+j
        xeVdc9gsbjeuYHNg8bhzbQ+bR9+WVYwenzfJBTBHcdmkpOZklqUW6dslcGU8/nWQseAeX8WW
        p9INjDu4uxg5OSQETCTevZ3I3sXIxSEksJtR4trE5YwQCUmJaRePMncxcgDZwhKHDxdD1Lxl
        lLhy5S1YjbCAg8Ss65/ZQWwRAR2J7m0/WUGKmAWWM0rcP3qXFaKjh0niz4duNpAqNgEtif0v
        boDZ/AKKEld/PAabxCtgJ/HtwxNWEJtFQFXiwcouMFtUIEKir202G0SNoMTJmU9YQGxOgUCJ
        z79bwGxmAXWJP/MuMUPY4hK3nsxngrDlJZq3zmaewCg8C0n7LCQts5C0zELSsoCRZRWjZGpB
        cW56brFhgVFearlecWJucWleul5yfu4mRnB0aGntYDxxIv4QowAHoxIPr8AG/lgh1sSy4src
        Q4wSHMxKIrw8OTyxQrwpiZVVqUX58UWlOanFhxilOViUxHnl849FCgmkJ5akZqemFqQWwWSZ
        ODilGhitA5ZkTA/PXP/FavIHn5tX69lPndnlelTsOIdFwOd5f/7+mxNauauS7/rrvhJ5xY4I
        f+9tBc/tOuKOdTv0Zenu+/vI0LEjdtlU1f5ta87Kl3u/4VzVlcdtvEw7Of94aPnnm9Zq61d8
        X/w8n6lQKkL2sYqkm+q1rJt3DZ8tXiSjOf+U2/lpL1YqsRRnJBpqMRcVJwIAT2T+9IoCAAA=
X-CMS-MailID: 20190624000822epcas1p423597f0f8dd7a4a68047ee0ef6421d11
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190530183941epcas5p4688d5fa80df649e4184a296ea78e6256
References: <CGME20190530183941epcas5p4688d5fa80df649e4184a296ea78e6256@epcas5p4.samsung.com>
        <20190530183932.4132-1-linus.walleij@linaro.org>
        <28b92b86-19ac-0bf3-57d8-c7ab4557a45b@samsung.com>
        <CACRpkdaCaZyzfr9=QRz6uRZpK6mw_zDeVmBwgH7=FPbNGKB9tQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19. 6. 8. 오전 6:24, Linus Walleij wrote:
> On Tue, Jun 4, 2019 at 3:30 AM Chanwoo Choi <cw00.choi@samsung.com> wrote:
>> On 19. 5. 31. 오전 3:39, Linus Walleij wrote:
> 
>>> +     /*
>>> +      * It is unlikely that this is an acknowledged interrupt that goes
>>> +      * away after handling, what we are looking for are falling edges
>>> +      * if the signal is active low, and rising edges if the signal is
>>> +      * active high.
>>> +      */
>>> +     if (gpiod_is_active_low(data->gpiod))
>>> +             irq_flags = IRQF_TRIGGER_FALLING;
>>
>> If gpiod_is_active_low(data->gpiod) is true, irq_flags might be
>> IRQF_TRIGGER_LOW instead of IRQF_TRIGGER_FALLING. How can we sure
>> that irq_flags is always IRQF_TRIGGER_FALLING?
> 
> OK correct me if I'm wrong, but this is an external connector and
> the GPIO goes low/high when the connector is physically inserted.
> If it was level trigged, it would lock up the CPU with interrupts until
> it was unplugged again, since there is no way to acknowledge a
> level IRQ.
> 
> I think level IRQ on GPIOs are only used for logic peripherals
> such as ethernet controllers etc where you can talk to the peripheral
> and get it to deassert the line and thus acknowledge the IRQ.
> 
> So the way I see it only edge triggering makes sense for extcon.
> 
> Correct me if I'm wrong.

Sorry for late reply because of vacation.

Actually, I have not thought that the kind of irq_flags are fixed
according to the category of specific h/w device. Until now, as I knew,
the h/w device have to initialize the the kind of irq_flags
for each peripheral device dependency. The each vendor of peripheral device
might design the kind of the kind of irq-flags for detection.

If possible, could you provide some example on mainline kernel?

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
