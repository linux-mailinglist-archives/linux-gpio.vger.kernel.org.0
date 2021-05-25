Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED2B7390176
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 15:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbhEYNBm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 09:01:42 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:54131 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232720AbhEYNBk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 09:01:40 -0400
Received: from [192.168.1.155] ([77.2.164.130]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Md6V3-1lD1Bp2l7b-00aGKe; Tue, 25 May 2021 14:59:54 +0200
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <CAOh2x=kcM351ObubnQSzUa=FVBQUmAUhz4u8ExORUthQQ0WbGQ@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <253f218d-07ac-1963-75e1-9ac2d035437a@metux.net>
Date:   Tue, 25 May 2021 14:59:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAOh2x=kcM351ObubnQSzUa=FVBQUmAUhz4u8ExORUthQQ0WbGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:P+C+8jE7h8AIU2+P4QAc0bNMwt+Y7MdaM1X7ydHqfxe9je0tPYy
 be3w5uTCFWkLcxmoBlru5+W4Tk2mr/voJuWycO84rHSYafupt3Uq1xWjFMNW3F03qmqIeo3
 cTkcoPXdGz06y+TYfDTAeOgojJpIJezE0d1fhIopLlIyWOsuvtrqhqZJNb5hcmgo5hMAS2V
 S2cQMbRYoxbMBNMEpWoFw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RbO7NUknbTY=:HjhTGnKuau+6zb9Ta6G1Yh
 VzrJdmQ911+bCR6R5e9wvAcOFl/7wBWYHrYhRqtFvRVTd83T+WlNL0DWFZAEPaSEU2ttLc2FK
 9/cmPPiOBLP6XfSEBMusNIoq+ZDrmgZTI7hxa0TZmkq4k1Xngkr6fCsy7WF25OeETPCaR1mBQ
 K6VZKRIfQfvIBwF/v1jTPvIjPvYEMu+rIk1AhegdZibK/mnIiDyrVQWQ4yiMFEGK13bHBEoxf
 SKmxkahtwNrpOP+R9KtOmG+DY6saa01i9Bfy6/8VTX4cV6mZCtuito1iNurgHq76etXrvUnTe
 CTxBDc6tGp61htLU6taesJY6WUUZMC+R3jOvsPgY/VnzYxLxShmRAMH7jg3arQ0w00/GQQ8aE
 haTTOXh3rQC7a5R7OjC/Y83HbrVdJqRQiRXllD3Jgr1EYKyc/o1DkpT+4eYUMMRfB+BfB7XJ7
 2MWr61dYb2hBdvERcNIBllN4rrEzRtrxHZIzouhQ0NJ5sEvmhkmh892Iz81zBjgnawxLsrjjn
 E1gqPSNvOPVPkxwZXrp8HU=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24.05.21 13:27, Viresh Kumar wrote:

Hi,


> We (Linaro's Project Stratos
> https://linaro.atlassian.net/wiki/spaces/STR/overview)
>   are interested in this stuff. I was trying to look at the last status
> of all this. Few
> questions for you:
> 
> - Was the spec ever posted to virtio-dev list ? I thought that's the
> very first step before
> we merge the code.

I had posted some spec quite some time ago, but it wasn't in the form
of patches against the .tex documentation files yet. It's been laying
aside for quite a while, since I've been busy w/ other things.


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
