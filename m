Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B211C3AA071
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 17:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234838AbhFPP5c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 11:57:32 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:37293 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235033AbhFPPzn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Jun 2021 11:55:43 -0400
Received: from [192.168.1.155] ([95.115.35.150]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MlwJv-1lT2i31xRr-00j4qj; Wed, 16 Jun 2021 17:52:24 +0200
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Alex Benn?e <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org,
        Alistair Strachan <astrachan@google.com>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
 <YMlwTiN4Y9bK3M4Q@yoga>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <8d58da79-8e54-048b-db89-8c1caaa0320f@metux.net>
Date:   Wed, 16 Jun 2021 17:52:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YMlwTiN4Y9bK3M4Q@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zYV2Vb8N523yfGwaAamnyOfO9IKmEQnqd6sTMik2ROSZ7cvYmAN
 P+VxcmAsXGX6vzb4SRBaxlBoX7KUvdrVZZEJEWZNpRygC9ACFb6Hfn33WlquBmdPoOQZvXX
 VSqVi2NWO7+sNcnkirbpTVkxHEPc7Jh96VOoZzzK8GfiJ2t1meINaY99JOXByCRWhC1rvRg
 AGnmOmcNFRqNPwmCe/9/A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bYb/owV9rlA=:ixDRRrjFdE2oUtq7B2uSI1
 VEXzB2qPM57T1OTriUP7i36IyDMD7R0aEPbCSak0OhU9eTyIcubcYk4ewmTdNVQOX2CrX9zus
 lj25xXuGUiQgI92OTRbDtrIzc/DWsqS+dZVA5dC7L4Q7Kscv4UqI+5UcmZ8vANAtwyCuJx4Cb
 7fvWxGC0d2X3mHk9oVXX5bh+NhcqwJJIUVzAJBbnlxDcN00BsIJFqDZjNvLv6S3kOCOooUY4/
 5iMYR9VvrPtCX0StbrMKitflvTjyfcw+HB9Ju2BAGVW5YanTpQjc2WaEui2vykhL1RJ2BMVHQ
 CD5vZ8JhGdMGu4zMa1/hWSwitBK3L2Ygpkc+sf16cGMoFwKTGATc16XIqFuYAcMMSeFnfg2Kp
 vwfr4U/Sfvt7HhWkWJRnZGorVVXY7t5VZ10YK8iakVeG1aIHplvTCYZ6WOfGO+DahUv97SB9v
 aUF9bPHxMB8QjZx/7Od2CXy18DqA0zszh32Xrn4iHELpnRg+FZ4GX6qnL3QEX1bAzEzTJRQxZ
 63s4fqdKFtSdtj1IKOVp2M=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16.06.21 05:30, Bjorn Andersson wrote:

> Combined with the virtio-i2c effort this could provide an alternative by
> simply tunneling the busses and GPIOs into Linux and use standard iio
> drivers, for cases where this suits your product requirements better.

So, you wanna use virtio as logical interface between the two CPUs ?
Interesting idea. Usually folks use rpmsg for those things.

What is running on the secondary CPU ? Some OS like Linux or some bare
metal stuff ? What kind of CPU is that anyways ?

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
