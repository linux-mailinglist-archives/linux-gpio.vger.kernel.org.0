Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C592D5BDC
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 14:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389114AbgLJNeJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 08:34:09 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46146 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbgLJNeJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 08:34:09 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BADWMo0069011;
        Thu, 10 Dec 2020 07:32:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607607142;
        bh=JHpOR1kUHxtPaKlXFx+C7LrcNp8Gm/RDnhA8hMFAgg8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=GPdRtkF9AvlLw0wgUNk/srZkBu3Y0K7BmILEkuCDUVeh8kicElCIfaxcEMJlhXUaB
         eJIGd76HFFNBlbFLN1cGcaXZDyViSLqgUC1xPs1dkMQILvZf0aCGJECwoy9JiM6tUr
         IyPrbq+GUGxWdBEDN+EtnUxv+gtVWJjJp+QSeMp4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BADWMOw001270
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Dec 2020 07:32:22 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 07:32:21 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 07:32:21 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BADWFuO013329;
        Thu, 10 Dec 2020 07:32:17 -0600
Subject: Re: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To:     Arnd Bergmann <arnd@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        <virtualization@lists.linux-foundation.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net>
 <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
 <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net>
 <CACRpkdbqVoT56H88hoZwDqV0kW_8XTaE5TkMQsg-RRrPqgF=cQ@mail.gmail.com>
 <CAK8P3a1PRQGUXkjdSmqxXSONX_ZoCgsfx8hJBUdBUk14tyzErA@mail.gmail.com>
 <CACRpkdbNAeDsi9B14kbkAeoqX7NE_Ua_yOX1iNF75oNK0ELefQ@mail.gmail.com>
 <2827855a-dc4f-2e17-aca3-4b1b9f0d5084@ti.com>
 <CAK8P3a30=AcEZAZ2yNUgctj=4YM6FhS1ZXB4ts7a7WV=gBcatA@mail.gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <3e16d597-d1f6-f054-4523-a7a00c945618@ti.com>
Date:   Thu, 10 Dec 2020 15:32:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a30=AcEZAZ2yNUgctj=4YM6FhS1ZXB4ts7a7WV=gBcatA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 09/12/2020 22:38, Arnd Bergmann wrote:
> On Wed, Dec 9, 2020 at 9:22 PM Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
>> On 09/12/2020 14:53, Linus Walleij wrote:
>>> On Wed, Dec 9, 2020 at 12:19 PM Arnd Bergmann <arnd@kernel.org> wrote:
>>>> On Wed, Dec 9, 2020 at 9:51 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>>>>> On Tue, Dec 8, 2020 at 3:07 PM Enrico Weigelt, metux IT consult <lkml@metux.net> wrote:
>>>>
>>>>> What we need to understand is if your new usecase is an outlier
>>>>> so it is simplest modeled by a "mock" irq_chip or we have to design
>>>>> something new altogether like notifications on changes. I suspect
>>>>> irq_chip would be best because all drivers using GPIOs for interrupts
>>>>> are expecting interrupts, and it would be an enormous task to
>>>>> change them all and really annoying to create a new mechanism
>>>>> on the side.
>>>>
>>>> I would expect the platform abstraction to actually be close enough
>>>> to a chained irqchip that it actually works: the notification should
>>>> come in via vring_interrupt(), which is a normal interrupt handler
>>>> that calls vq->vq.callback(), calling generic_handle_irq() (and
>>>> possibly chained_irq_enter()/chained_irq_exit() around it) like the
>>>> other gpio drivers do should just work here I think, and if it did
>>>> not, then I would expect this to be just a bug in the driver rather
>>>> than something missing in the gpio framework.
>>>
>>> Performance/latency-wise that would also be strongly encouraged.
>>>
>>> Tglx isn't super-happy about the chained interrupts at times, as they
>>> can create really nasty bugs, but a pure IRQ in fastpath of some
>>> kinde is preferable and intuitive either way.
>>
>> In my opinion the problem here is that proposed patch somehow describes Front end, but
>> says nothing about Backend and overall design.
>>
>> What is expected to be virtualized? whole GPIO chip? or set of GPIOs from different GPIO chips?
>> Most often nobody want to give Guest access to the whole GPIO chip, so, most probably, smth. similar to
>> GPIO Aggregator will be needed.
> 
> I would argue that it does not matter, the virtual GPIO chip could really
> be anything. Certain functions such as a gpio based keyboard require
> interrupts, so it sounds useful to make them work.

Agree, and my point was not to discard IRQ support, but solve problem step by step.
And existing Back end, in any form, may just help to understand virtio-gpio protocol spec and
identify missed pieces.

For example, should 'Configuration space' specify if IRQs are supported on not?

-- 
Best regards,
grygorii
