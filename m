Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56DCD2D2F49
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 17:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730095AbgLHQRA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 11:17:00 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41950 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729667AbgLHQRA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 11:17:00 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8GFuO1021516;
        Tue, 8 Dec 2020 10:15:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607444156;
        bh=WiNdks4Je7o7SD1jGll8k06315J6vHdjJNp9aadg/FE=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=pxeiPtRq2cgW5M5HSIcjk/wHXc19JmfrO43OO3mADZmzxaw3kio/xvlUVPZeIAhPe
         i7IYVQxyjWgceDqu6gUJD4Nhxq2nS7iIAVCJqtgluJuOI8dq9sP85vGbcf+l9FUHWo
         ngPoLPjEDOqxMv+nMe5hycuqLNjRKpqcwE8tsmQw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8GFul6048136
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Dec 2020 10:15:56 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 10:15:55 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 10:15:55 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8GFqYm050075;
        Tue, 8 Dec 2020 10:15:52 -0600
Subject: Re: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        <virtualization@lists.linux-foundation.org>,
        <linux-riscv@lists.infradead.org>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net>
 <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
 <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <87a486d8-70a0-89f7-1ae4-cd408d0e31be@ti.com>
Date:   Tue, 8 Dec 2020 18:15:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 08/12/2020 16:04, Enrico Weigelt, metux IT consult wrote:
> On 08.12.20 10:38, Linus Walleij wrote:
> 
> Hi,
> 
>> This is Bartosz territory, but the gpio-mockup.c driver will insert
>> IRQs into the system, he went and added really core stuff
>> into kernel/irq to make this happen. Notice that in Kconfig
>> it does:
>>
>> select IRQ_SIM
>>
>> Then this is used:
>> include/linux/irq_sim.h
>>
>> This is intended for simulating IRQs and both GPIO and IIO use it.
>> I think this inserts IRQs from debugfs and I have no idea how
>> flexible that is.
> 
> Oh, thx.
> 
> It seems to implement a pseudo-irqchip driver. I've already though about
> doing that, but didn't think its worth it, just for my driver alone.
> I've implemented a few irq handling cb's directly the driver. But since
> we already have it, I'll reconsider :)
> 
> BUT: this wasn't exactly my question :p
> 
> I've been looking for some more direct notification callback for gpio
> consumers: here the consumer would register itself as a listener on
> some gpio_desc and called back when something changes (with data what
> exactly changed, eg. "gpio #3 input switched to high").

But this is exactly why there is GPIO IRQs in the first place,
which are used to notify consumers.

More over most consumers doesn't know where the IRQ came from - on one HW it can be gpio,
while on another HW - direct interrupt controller line.

-- 
Best regards,
grygorii
