Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347672D2CA0
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 15:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729497AbgLHOHy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 09:07:54 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:60269 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729462AbgLHOHy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 09:07:54 -0500
Received: from [192.168.1.155] ([95.117.39.192]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mzhax-1jzus61WUL-00viD2; Tue, 08 Dec 2020 15:05:07 +0100
Subject: Re: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net>
 <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net>
Date:   Tue, 8 Dec 2020 15:04:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:G4pb0xE5H22ojPKBimkPJ8QHTZy9Ztkg67vq+dnwAqAyIP7Owjp
 PtM4xLyYwEOsOB5Jeky7p0oHn4OV0smr3NYA6ZBFzuAz8Wj154fwdKeJAA7RKqTpXhphJ0A
 KZ+KK0E+bN0KXeCyh8zH7Zs4RpyqkMmgg1F2DoLmutar7t2c9swfhYmzbPPLxZS31ACp14U
 zhqcJNgYORsE2qZ0/AFTw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:a0Ff9jNvXYo=:mUVNahr6lKpBJFzi+wLba2
 BTDIDBHKoHwdSkhKUdoqJmrbqtF3ZYCKFqGIgJUBJmegkGz/SOcu3pd2KOd4s2s3/QuXaNdk0
 uguRGeRDIcNPst62WfMtiwo4Iw/Vunm5FNmfJFeatXDqWazimqqDCanpscLSdrblTa20JB1VW
 c7kuVDEz155jDxAxRrlCHa4xGdgZYPY0yAQaS4Dv3uUFDVLnMUFpMkDRsUEKPq4noO6+ucdvE
 SRzQXp3T1n3zUjTN8U0oP43qsyQntWyl1RTCSoXTQO9xSgs89oOoNRoJT2rv1BUKKBfwqnqmI
 LpZWwaBmU/uSsj4PGpYC4o/F9bS7XDbzC7/lddp5AyIn8cCAKy4qL8gpxMSWZ9sTqpjvl4Hqq
 945/WLdlpTWKQh+Nbd0YlPUVBPRRhnU8HM133F3fS5h9vHMLhveOWfk66rqfG
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08.12.20 10:38, Linus Walleij wrote:

Hi,

> This is Bartosz territory, but the gpio-mockup.c driver will insert
> IRQs into the system, he went and added really core stuff
> into kernel/irq to make this happen. Notice that in Kconfig
> it does:
> 
> select IRQ_SIM
> 
> Then this is used:
> include/linux/irq_sim.h
> 
> This is intended for simulating IRQs and both GPIO and IIO use it.
> I think this inserts IRQs from debugfs and I have no idea how
> flexible that is.

Oh, thx.

It seems to implement a pseudo-irqchip driver. I've already though about
doing that, but didn't think its worth it, just for my driver alone.
I've implemented a few irq handling cb's directly the driver. But since
we already have it, I'll reconsider :)

BUT: this wasn't exactly my question :p

I've been looking for some more direct notification callback for gpio
consumers: here the consumer would register itself as a listener on
some gpio_desc and called back when something changes (with data what
exactly changed, eg. "gpio #3 input switched to high").

Seems we currently just have the indirect path via interrupts.

--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
