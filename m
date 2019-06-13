Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A81744D99
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2019 22:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729221AbfFMUjh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jun 2019 16:39:37 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:46847 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726779AbfFMUjh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jun 2019 16:39:37 -0400
Received: from [192.168.1.110] ([95.115.103.162]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MysiI-1iW5NG2uzy-00vxkx; Thu, 13 Jun 2019 22:39:32 +0200
Subject: Re: [PATCH V1 1/2] gpio: inverter: Add virtual controller for gpio
 configuration
To:     Linus Walleij <linus.walleij@linaro.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
References: <1560315034-29712-1-git-send-email-harish_kandiga@mentor.com>
 <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
 <CACRpkdaSLwELtWMiEvYRBRF1d6E_9ymupdiCe-rEaaJkCfOd4A@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <b56f84bd-6f31-95ff-427f-1bf0dfa27421@metux.net>
Date:   Thu, 13 Jun 2019 22:39:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdaSLwELtWMiEvYRBRF1d6E_9ymupdiCe-rEaaJkCfOd4A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Qjra3C+6w7N8CvCBuFtpDmSWaCLqsGyvs4p/w+SySeWOQed4vpS
 xU1qHEXhHLIpkSqWfepz54KP/DyHQzT6VBPWJUIB6fnYtI8pU5mkQ/JgXf/Jejv3SEqJO5w
 40RPShmaKVyGGybpzlOFqPLDIBsKHeFl9vBoeR5HrOwqEqhl5npx8Vy2yjOL1RsqX/oyLk9
 +DiAx4sqUX9K6uyDASUig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nqNpydVZt3A=:nakzs2gtDVH3S628HMjlJH
 fTOKbisuw9EOy6XzNEQTcP6uB23Ws6uCZiUUi3VUx4F1MCBGkJdyztGO31I0zqsb4Z0NTpCC6
 1o+0+kL1XWhYzXonaYfKrKYzznwudkYfiNsaL4BuQeooNKDHoPWw10l7Nehay1lgjDpVBOcjc
 0Dej+eNWwL8BZrJxWFin35e9ZJ4UsY66m8njPNLqoRFJwkfozAhibHZj2U33bOJuY++H2vYtl
 MUbqdkAtoRNeHj/2kDY1PsEcnlBPSw7FURzlaNgHPWC92KCNGtRAlpcKnmqRgLf1Tz0DnplHs
 VUX2RQus3IvVvnKf37bCLR77H10VmzlxyI04u3eIlOUUxNWdbiVvBwG4ncVppATL4o0sMNx3p
 kXdTGQrLLFEdHL1e8kLBcaCliSgGX0KcpN6zE/V3J7UGCVaKzQUwR159P5Em2gY/d/m3vDgOI
 D2PAXN+ZtYfUsQ78WzIsDKOv/u7CewW/nBi/kUr0yhveicVdcfjArz1bEkXK8DdOLAaiJ2MHv
 jKtX/JSbStPCtCg3oD6gq28ohJXpb7HZ5HWTydsyAbDE6/EmZN40InHVSDoDMOfsDOVjg/YHK
 bL6qnT4VqjbluSMXFlIADRgCLSoWKCesdC55MXDy3DKtsQz9UZPvti0tPRQRcgGqQ205mxgFi
 hD/c+Dyazp5YZyGPpRin1WmK3lSvHe6Wfy7KJIQBEWAKKkeW4QjSr0/io/vj1e/bZUPtFk8IJ
 0x87EMeSZ2fXtFCaGu4QlMmuqfvwfTwT4RUaLtmxHB9px19KJggZevYvP+M=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13.06.19 08:44, Linus Walleij wrote:

Hi,

>> When there is no kernel
>> driver using the gpio pin, it becomes necessary for the userspace
>> to configure the polarity of the gpio pin.
> 
> So sometimes this might be necessary also for kernelspace,
> it models the inverter on the PCB very well, and the fact
> that DTS files work around it by adding things like
> active low flags are really just hacks.

I wouldn't call this always just hacks. There're cases where some line
just is low-active by definition (or by external factors).

If we really wanna pricely model the actual hardware in DT, w/o writing
tons of special-purpose drivers, we'd need some kind of virtual device
composition in DT language - something i've been looking for quite
while. If that thing could even operate on other sources like ACPI,
DMI, etc (perhaps somehow mapping it DT), we could get rid of lots of
platform and mfd drivers ... but that's goona be a completely separate
topic :o

I'd like to summarize: both approaches have their place, depending on
the actual use case. It's good to have both, there i'm welcoming
this new driver, but like to keep the old approach, too.

>> +config GPIO_INVERTER
>> +       tristate "Virtual GPIO controller for configuring the gpio polarity"
> 
> "Inverter GPIO controller for handling hardware inverters"

I wouldn't like to limit this to actual hardware inverted on the board.
There're other use cases, too, eg. if the incoming signal is low-active,
but consumer shouldn't have to care about that.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
