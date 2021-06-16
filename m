Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E090F3A9DDC
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 16:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234119AbhFPOn5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 10:43:57 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:39925 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233914AbhFPOn5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Jun 2021 10:43:57 -0400
Received: from [192.168.1.155] ([95.115.35.150]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MSLEm-1licf82p6u-00SerU; Wed, 16 Jun 2021 16:41:26 +0200
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
To:     Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        linux-riscv <linux-riscv@lists.infradead.org>
References: <20210615174911.973-1-info@metux.net>
 <CACRpkdbwLOOT6nuhpkT5x-AZVipsD2qG8Qu4xoiRotHQNknwzw@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <098f669f-b451-18e1-9aed-a71f400bd581@metux.net>
Date:   Wed, 16 Jun 2021 16:41:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbwLOOT6nuhpkT5x-AZVipsD2qG8Qu4xoiRotHQNknwzw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CR6mpicfGsY9r/evUqTXH8C70befzHJD17gK1boMJb2mNiw2I3w
 u9bascsokR1YLBsRaAjFl9nCA0nXMUduSAIVdTJsuBt//Y1hu5AbrPkpQ5Bewzb1Peh7x0m
 OJsttVts/KwE3xipe3/w+Di4ulseb46HgCXAWsbZwtIW1CWD52UQu24Sh7tjYr+AujL6fle
 DtR3xtegpA75e0CGxI5aw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fMVu1T4nu7g=:4lDZNogMmvE1wFbQcnZQ0B
 hBMiXVmcPPsYTquq0lJBIq7dqufr+FVBlwhCMtjMCtupVmGeVKmzhQLeZtIn0EqCtwP17PQC1
 bI4PhWcGXUahcXYS6EV82U3W2kaSYt7WSXN334mB665gcj2/yg90+n9mZ+hGyJiwnS+1XcWQ/
 U6OflJL9RiKDC/q+61jIjkRcm+8bbuwuCA4idwY9O67k50FabdiGYUKE1RmY05OjaAxgnk0AO
 jZBLFx00sKx0u7GOr3YKFhpHV84KJIdnhRy9FXO4LOE5OIgUnJDHC+FG2it+fuzaV5ud9zpzM
 Iztr85Sus6eg7hgkhxUxp+6GOYiOKJSNC1csHjDXN+RIw93lfgeqglRhXvzIDq7qAlKFORGbc
 SgnoSFASpckcaCipHWdnINRFf+zjpPLo55xzD0+rMIVAbabemAUPj8ZuOEqiYgaqgM/WGa2Hy
 /xsV6746LXXSuzAPiwPRjHVo4p2NJAqyjnjVbgO/gaw7BsyePIXVOSmAkD1jA7tBvxgXAny0C
 6dcDS5dKyeTDANgMo4EGqI=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16.06.21 10:31, Linus Walleij wrote:
 > Hi Enrico,

 > So now there are two contesting patches for this and that creates a
 > social problem for us as maintainers. I am not too happy about that.

note that this is a polished up of a repost of my original driver
from last year.

 > Can we get the discussion down to actual technical points?

Sure. Perhaps you recall or discussions from late 2020. The missing
point there was (besides a few wording issues) the missing formal
specification process w/ virtio TC. (spec was already included in this
driver as well as the corresponding qemu patches).

My spec was not just meant for VM applications but also actual silicon
(as already mentioned, some folks of my client also implemented it in
FPGAs - don't ask me about details, they just mentioned it was quite
easy for them).

This is why it is so trimmed on things like fixed packet size,
unidirectional queues, mirroring packets w/ thus a few bits changed,
etc. In constrast, a more network-like approach might have been looking
nicer to traditional computer programmers, but much more complex to do
in pure logic and eat up *lots of* more gates (think of actual memory
management instead of hardwired latches, more complex decoding, etc).

Meanwhile it played out working nicely in several HIL installations

If I wanted to have a simple and CPU-only approach (just for VMs), I
would have just mounted some sysfs pieces via 9P :p

Several weeks ago, Viresh just wanted to continue the missing pieces
(which was: tex'ifying the spec and submitting to virtio TC), but then
unfortunately he invented something entirely different also put my name
on it.

Easy to imagine that I'm not amused at all.


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
