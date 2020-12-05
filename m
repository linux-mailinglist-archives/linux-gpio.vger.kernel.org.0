Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A80242CFEBA
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 21:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725536AbgLEUSR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 15:18:17 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:47905 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgLEUSQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 15:18:16 -0500
Received: from [192.168.1.155] ([95.117.6.188]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MbRwP-1k9pJD3wRl-00bwGo; Sat, 05 Dec 2020 21:15:31 +0100
Subject: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mst@redhat.com, jasowang@redhat.com,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net>
Date:   Sat, 5 Dec 2020 21:15:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201203191135.21576-2-info@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6Us/Eccm2b+8uFxw1F3t+QrfFkxImB2I2ty+Sf0QMFWg/I08C+0
 l/putPEzoIZdUH7OratR6bhG5Wy5rbrzir2gcr2T83PhcZL3s+tN+LfQ0QpaonL4C2Nu5/I
 baDn5qVWWroBU8pOeaRhpPy9tmeBMVkzlfmhLKOxlsZCYIiEIxKjJMl57Kc88zmH7OFxMy5
 x+dpS83a3PhirR79mANbQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TmIGK7FxUCU=:yAJyBYcomdQV3KBUpDYeoh
 7Ge9qY1V8TDxnX8V6yve7wUof8n/FkUM9wClbl4yh6qUcL5r3mNwZRDoNPECQQjpoDTUHMytG
 rYjGRCAbBatBR7IYgg9wiBYMHqUMHlbwByVqAdq0Wwn7PxImKXp+bSiXl69HnKUwFkeZ/ZXqk
 h7QYanonsFRUq1z+CNJS2v0F5n2uJAOZL+4iqVYbpHSrq2O/IZHcrZ2uNiwnzBJ/1mQecCdlW
 +3AIO9ESFYwOJe+Z6nzDzhW1+/cKJsiNBhb9EaNDCxmetXm5oNpXhXtkKr0UsoGSrYe7hxNzM
 3PmuVvz/ILrxFzD4ElD91NMu4TjHDRZjD/L29ni5LEktB3rSDvAHDnxTveECZjzMYejJ7H9/I
 miRi2KQ5May5m3yoPoMC9K+c0UhmWEUFlPN95YJidQg0YPEgQQTmIRibVZDLs
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 03.12.20 20:11, Enrico Weigelt, metux IT consult wrote:

Friends,

I've still got a problem w/ signal/irq handling:

The virtio-gpio device/host can raise a signal on line state change.
Kinda IRQ, but not actually running through real IRQs, instead by a
message running though queue. (hmm, kida MSI ? :o).

I've tried allocating an IRQ range and calling generic_handle_irq(),
but then I'm getting unhanled IRQ trap.

My hope was some gpio lib function for calling in when an line state
changes, that does all the magic (somebody listening on some gpio,
or gpio used as interrupt source), but the only thing I could find
was some helpers for gpio chips that have their own builtin
interrupt controller (VIRTIO_GPIO_EV_HOST_LEVEL).

Somehow feels that's not quite what I'm looking for.

Could anybody please give me more insights ?


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
