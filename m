Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27BB23A5E0D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 10:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232542AbhFNIGA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Jun 2021 04:06:00 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:60919 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232579AbhFNIF6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Jun 2021 04:05:58 -0400
Received: from [192.168.1.155] ([95.115.71.85]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N2m3G-1lC24S3Wxw-0139xw; Mon, 14 Jun 2021 10:03:45 +0200
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
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
 <20210611035623.z4f2ynumzozigqnv@vireshk-i7>
 <CAMuHMdVrtSnFpPbB0P3Wxqm1D6vU1_cnh3ypsZJRNF6ueKdAsw@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <db2d29fd-ff27-0c75-2472-dd031564dbf1@metux.net>
Date:   Mon, 14 Jun 2021 10:03:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVrtSnFpPbB0P3Wxqm1D6vU1_cnh3ypsZJRNF6ueKdAsw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:a1TH943iNPJU0DBABn30QUTNQbG26NROFfuw6N6R2mBvsA7XAR7
 kEPNOQsE8fSppcP5+xrqfNJzCGc6Kynnici5xXsA+KwIE/NskgFY5mkYbhr9If3dJ5ykPnI
 GP38GA986wJFdpb2caTCrzIVJ5PrbJYo89RNV/6ygVxomnc5Qu8a9uMN1ipZV99tUeN3ofN
 wk3OMkryakXWptJFeYBUQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:o8I6iU3YHHE=:hSoiMl1lG1SgsJU1sHl3Oa
 uT9NCeDq4+mii9kzBqGQlgQ78I+ESdtk1gaIi5ZkErFWrC1uLaJPwkZfZ3GSezu1imPOKk4Z7
 cu0EDqa4IzbTeKcrGdk4uEVZpUbhZBR/EclOT43Yd9TApqJA+PrynMXuIo1Wlv7YU1GPurHGZ
 ZXOOoZYIkqGL+AnhX+x8VxNt1EeVHSWPVIo/Vdc0ZVCv+Dmt1hhsm9O06IKYWGaOl+Rd8GxSS
 AMTQfYYa8KSRgkVC0AYASrZArSgzDHuORyBIAUSOop081mFfZQ1G6RRNAK+ToCxc/Ldtn8wiS
 JppP8/L3FjslZXTW2+e+O/xWAHYgJS9Xj3Lzo4qxFa60AB6lxSZVINglqaFGgc3asHw2g/OJl
 49CqPgc3Rcc1Tp/78nBrlQXmhGbYlDhrefk4x/M4wa5QVn4I7hCSLUQHH6TYJWIIU3/OCYdW5
 F+i6ecjCaXnlY1KKN6MsjTDz9b5fdSpWtujdca7fq9aMX2qAQGLW28dbRniC08OLcGiCV3omv
 Kk4/tFWUcXadITfKxhQDZI=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11.06.21 09:42, Geert Uytterhoeven wrote:

hi,

> I my PoC "[PATCH QEMU v2 0/5] Add a GPIO backend"[1], I didn't have
> a virtio transport, but just hooked into the PL061 GPIO emulation
> in QEMU.  The PL061 QEMU driver talked to the GPIO backend, which
> talked to /dev/gpiochipN on the host.

for qemu side you might be interested in my patch queue from last year
(including the virtio-gpio implementation) - it also introduces an
gpio backend subsys that allows attaching simulation gpio's to various
backends. so far just implemented a dummy backend (that can be
manipulated by qemu console) and using it just in the virtio-gpio
device emulation.

https://github.com/oss-qm/qemu/tree/wip/gpio-v2

> So QEMU has to translate the virtio-gpio communication to e.g.
> /dev/gpiochipN on the host (or a different backend on non-Linux or
> bare-metal HV).

For qemu case, yes, depending on your actual configuration. You can
attach the virtual device to any gpio backend you like (once it's 
actually implemented). Yet only implemented the dummy, which doesn't
speak to a real hosts gpio, but can be used simulations like HIL.


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
