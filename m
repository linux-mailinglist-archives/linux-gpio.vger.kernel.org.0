Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA2467218C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2019 23:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731616AbfGWVa5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jul 2019 17:30:57 -0400
Received: from mout.gmx.net ([212.227.15.19]:57183 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731019AbfGWVa5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Jul 2019 17:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563917424;
        bh=ejmFng2QjFZzODfS2qj9F1WGpZClOx2oEip4jXKXfLg=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=KhQICRUGnpMroAUN9bMGoFAiKs2W9E2tGHu6Fs+4eKbsl+vLpuasSvqOYWReOMlVk
         iRBnSu3k5B9dkq0nt+muwwonElzVPN4pcN0Y8cxig5ebLhgC4+oeXcDdeNZ59g/uE9
         bBokIl0yvHTOyiC3llykGWwU8v4H/4z/UuSmSZL8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.115]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MRoRF-1i0eO90v29-00Szrl; Tue, 23
 Jul 2019 23:30:24 +0200
Subject: Re: [PATCH 00/18] ARM: Add minimal Raspberry Pi 4 support
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Christoph Hellwig <hch@lst.de>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <1563774880-8061-1-git-send-email-wahrenst@gmx.net>
 <96113adb5fcab9c2f4bb5fa82b84ff5f9c07fd07.camel@suse.de>
 <bc650090-db86-ccac-01dc-23f08ad7b19b@gmx.net>
 <20190723093442.GA27239@lst.de>
 <04c5eaa03f3a124dbbce6186e11e19acc4539cc8.camel@suse.de>
 <b15509d6-bc2e-3d06-0eea-943e6e456d62@gmx.net>
 <5f9b11f54c66fd0487837f7e58af3adf7f86635f.camel@suse.de>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <9937cd58-3921-6b9a-b099-d0aa28035e50@gmx.net>
Date:   Tue, 23 Jul 2019 23:30:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5f9b11f54c66fd0487837f7e58af3adf7f86635f.camel@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:h2GW857+HHTVqkW+oDI5RfOm9FP83HJJ2yxHRbtE5rJoQxezczw
 Wuwd8SC6/iENm9aR9BHzJpuB1fU2478xlX+4cj+41G/S0AJxwfF2RaXcHIRyelsmEYCmufb
 nJ8/h0+/cugBOYLIgUi5qV/bcil22OcfL+13jKc6VqlQArcnCkWEkDSbMGmUKVJ3Sixr15a
 RwQP2MgNj+kyhHOIqweXQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:X6lONT7HRJE=:3VdJQ7wGC4XyDSK+2LwGQc
 pu2k+EhXu7HX3jK3ERBqsXTsdyZz7F0XW3QIYftleBKvSpifQe4hCl/H/Y5Ftp3brudMf2rBR
 w9boe0ayy2kbcTJEoK4pIsAWz1c7CnmqmRYedJzDQTF52b5ppUvAlF1ggZKumElHCsCnPGEvv
 +HuMnfUP8JrYVS+dMj1PUmgNfdwwUKNJ0cNwWO1BcTWA5s2dLLlHzWSlgGiMSx09OmSyeGMmv
 TpA3mdefgFDM8qpXX3KWgn/B5DcDB01EdNAh62CwPbtZms6OQX8qYz0AWgYaix2kqTZ1s6sbb
 Bq2X7xyigwZ5twinM7R21UrMRfjbKNLV8cu2D4zlQZFwO373E/xvPwsP1S22EZ4UNKWrYCph1
 Y+8XoY7i4neM0NQqOP3UIhGGuwu2wF3SLoXNIc0bqaldHV5QsD300KmY6lw+P4IVnNxR0tvFI
 85eTEtRmq75ux7aIpbcoFAsjJge8yzz39KVjrxEP9vsrf0IoHM9UOQsRUpxfckLeo0BUMTd27
 kxcy2ohbGZbQc3JDvyfwPl6OO2YgDXEneeVgCDZ8zOgtTyAdH1kNMZ/1sxQU2T6aK3BhUEyL+
 QvVGHWaFgf2wmQ5Ej/Ucaq+uEB1b/nbew2dGCKx5N/uLhbtZE22gq3R0Xq9UZn/ol5JEAOhpW
 1LOLrVP/HyMmFCdEsBH4EPo893iflo2MJCD6SL40+rtIKO5EtMYo9j3jlRJIJ+xCvXOpC9C0d
 zw6liixe+pjKyQcqADrT+f2cWph7VH6WgiVzjYV30mC6B7t+ncWhXWJxKQiTpt6BZ6BRW0+3C
 SzDhqPl+b2+0+BUAay9TqwiaGIF9tqZPWaauCAmzmwSrMkbaNffd6PF/6bz3/XyCuzrJVmLj6
 Qx6ITKBeMtXFltrX7OUEJCcU/SOGWvZOK+zQVeDDopEXAa+lax5LRGYVkdt2H+oqiA1/FVAzw
 VbjeChRDCF3YIKoqISNy8eHdl2VQWEqo7VLQBTn6JgQbGqWwE2r3I0pUzWjKzc+shFDnO232G
 gPBtmfjl63CAPNrl2pqTpgQjPneuIeJ5Jr5pQQP5q6rC/vWFcsAUHMhmI0gOD3nava8z4D+QS
 s9pi5+QkGHNj3U=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Nicolas,

Am 23.07.19 um 19:33 schrieb Nicolas Saenz Julienne:
> On Tue, 2019-07-23 at 18:26 +0200, Stefan Wahren wrote:
>> Hi Nicolas,
>>
>> thanks for your work, but i'm a little bit sceptical about these
>> changes. So here some thoughts.
>>
>> Am 23.07.19 um 15:32 schrieb Nicolas Saenz Julienne:
>>> On Tue, 2019-07-23 at 11:34 +0200, Christoph Hellwig wrote:
>>>> On Mon, Jul 22, 2019 at 08:10:17PM +0200, Stefan Wahren wrote:
>>>>> i rebased this series also and got this only on the RPi 4.
>>>>>
>>>>> After reverting the following:
>>>>>
>>>>> 79a986721de dma-mapping: remove dma_max_pfn
>>>>> 7559d612dff0 mmc: core: let the dma map ops handle bouncing
>>>>>
>>>>> This crash disappear, but wifi seems to be still broken.
>>>>>
>>>>> Would be nice, if you can investigate further.
>>>> That means dma addressing on this system doesn't just work for some
>>>> memory, and the mmc bounce buffering was papering over that just for
>>>> mmc.  Do you have highmem on this system?
>>>>
>>>> You might want to try this series, which has been submitted upstream:
>>>>
>>>>
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/arm-swiotlb
>>> Hi Christoph,
>>> I tried your series on top of Stefan's, it has no effect. I guess it's no
>>> surprise as with mult_v7_defconfig, you get SWIOTLB=n & LPAE=n.
>>>
>>> FYI DMA addressing constraints for RPi4 are the following: devices can only
>>> access the first GB of ram even though the board might have up to 4GB of
>>> ram.
>>> The DMA addresses are aliased with a 0xc0000000 offset. So 0x00000000 phys
>>> is
>>> aliased to 0xc0000000 in DMA. This is the same as for an RFC you commented
>>> last
>>> week trying to fix similar issues for arm64.
>>>
>>> You state in "arm: use swiotlb for bounce buffer on LPAE configs" that "The
>>> DMA
>>> API requires that 32-bit DMA masks are always supported". If I understand it
>>> correctly this device breaks that assumption. Which implies we need a bounce
>>> buffer system in place for any straming DMA user.
>>>
>>> It seems we're unable to use dma-direct/swiotlb, so I enabled arm's
>>> dmabounce
>>> on all devices hooked into RPi's limited interconnect, which fixes this
>>> issue.
>> Does it fix the wifi issue too?
> Well it works as long as I revert this: 901bb98918 ("nl80211: require and
> validate vendor command policy"). Which has nothing to do with DMA anyways.
>
> Was this the issue you where seeing?
Yes. So it's a regression? I will try to test it with a RPi 3B+
