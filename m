Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 173533A3001
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 18:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhFJQC1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 12:02:27 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:44295 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhFJQC1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 12:02:27 -0400
Received: from [192.168.1.155] ([95.115.39.199]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MuDPh-1l4MO33oXV-00uYtt; Thu, 10 Jun 2021 18:00:23 +0200
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Arnd Bergmann <arnd@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CAK8P3a11YhcEOjauWc872BQv+SO-E5+gnz7Lk6UK42iVw7Oyfg@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <82bdf2e6-35fb-74e8-1b2c-198fe8d528e6@metux.net>
Date:   Thu, 10 Jun 2021 18:00:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a11YhcEOjauWc872BQv+SO-E5+gnz7Lk6UK42iVw7Oyfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KQsiXSBnL3Xwtzh+4csb7zDCBty4K8v8NkMMz18y2IgJxDpNr5Y
 CrCUFSbcYjjTQ5O21EC7wncPD4V+Gk6ezpYjgVNL9/GfLyBGPjPgnkXjpXfg7/s51ztQj+7
 pFW9cNiVl/uYL2WzCges8+QrQCn47OK5jsGlrL9xl8jnLMLVaexqcraEC5OcyrsDvL64Yu4
 tvhi+Zn62xFEIV+m3UjKA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:16ZCoke447c=:LBGHWn9Vn6ARMF7jtXetBG
 rzMAW5C+Q7RmicndoG9vv77U7RlNn0FxWoYH8+AMP5xE83oxq7wGVOkkHP9bQRAEGIhGjb4YS
 fyr029xkSMxaUHvCiwM+941JVgC5g98zZbLUE6NaV1b1JkePkrJY82CdHUvvy3FxMFBurTQHr
 4dAoKQFZN+OjBx234+uU2YrZcclQ9EWrLWVSE2FjkuDJ1PFBakQJDZ8fLZFZ37zl71px+S/Q3
 LG4/7SKCmKOlNCTm2ss/r7OLEFXofAJ2J9bi4dft/VpcyoISQC9qudw4kJv8fEjiTpQTMxxSw
 Alos9axtXZa080xASTQGT7KkgPMafcuTLiSyVm1yFd6EDsFI5mZI9eyk6O2YJceftZr4dGdGl
 d9R4eoNBgAbgEfwXMrIbTYCseX6rZOcTrTN+Yp81605SYBw6mPisuaOppWZtEUiaCNCFZD0fF
 cixXsh9fuKHLs+llJ4OB5QRpjJl+JuuCsvoUp85pTkkCBQoWN1xK/pHIDBdGad6JIy609WflN
 +NPQwd0bQFWnpP4bvEfJi0=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10.06.21 15:22, Arnd Bergmann wrote:

> Can you give an example of how this would be hooked up to other drivers
> using those gpios. Can you give an example of how using the "gpio-keys" or
> "gpio-leds" drivers in combination with virtio-gpio looks like in the DT?

Connecting between self-probing bus'es and DT is generally tricky. IMHO
we don't have any generic mechanism for that.

I've made a few attempts, but nothing practically useful, which would be
accepted by the corresponding maintainers, yet. We'd either need some
very special logic in DT probing or pseudo-bus'es for the mapping.
(DT wants to do those connections via phandle's, which in turn need the
referenced nodes to be present in the DT).

>  From what I can tell, both the mmio and pci variants of virtio can have their
> dev->of_node populated, but I don't see the logic in register_virtio_device()
> that looks up the of_node of the virtio_device that the of_gpio code then
> tries to refer to.

Have you ever successfully bound a virtio device via DT ?


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
