Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2033A3A2FE4
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 17:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbhFJP4N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 11:56:13 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:45435 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbhFJP4N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 11:56:13 -0400
Received: from [192.168.1.155] ([95.115.39.199]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MYcy3-1lmiJv27xT-00VeCN; Thu, 10 Jun 2021 17:54:08 +0200
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Stefano Garzarella --cc virtualization @ lists . linux-foundation . org" 
        <sgarzare@redhat.com>, virtualization@lists.linux-foundation.org
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <96994f4c-8755-90a8-0c50-4e21c436f137@metux.net>
Date:   Thu, 10 Jun 2021 17:54:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TpZLghCRLTrNtNW+A1KmT6oXfMlGYLufbz1HB4G9ZrndMBLiAMA
 FVfl8K9eppG2BpJKNJptrV94A784Wye+RIBqfGfto9qYovYlwzDTQZBKORdm5Nb/3TK2+4n
 4XYrJWRfsSoOilWq4fKT4mBK5lonv00flbjvk8KLQn9c/McKTZOWz8fND0XqCHl1eX8PW5x
 86KB391zJUIxpNc8lPzxw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:N8ukqCZYYn8=:BSOYsJ6jT2KSyQltacOA9y
 agJM0fJ5GIxIEpyhyOMp+UDIQQJYGuL9AFSbYrI1hW8pmjE9d9pRf49tKmoSXSPR4+0AcCO1j
 uHobuj05FlEXa8eHxeOkOFMAmKNeSbK8Ke4NyQjrRulTdjc6eS3P+uFat9cXaVydtKeWzPcDH
 EW49OxY3dDn5U8HMIsDTI6vcDvrvlZiL8OhwXwL5cuCSDCP6xc0yyCQWMedR8mjragnGEZgYB
 K9YYGwdVqzQEMCq2b9IYDUmIObXUoONMzdzrTeI5fMfNQX1yJ6bwANSq86aa3pG4P0ZjxAODh
 fMOA4z+WG7nXbldgwoq2YirtTd/ZTAAY7k8PsskJBZ/Kf9LRyfZ0TJa39X61DzRfaMLE2u9is
 aUPkjGdoUWuC3LtErxd2nnUZO4Ot+sJ4e9frRUYUbKVYPYw54ZP2c4CUGVbbyaQeEark6K+xy
 Dbk0SnU+jiiM3zgLOcZRfdqvqSPnrreALdAYaNLfqqWQ5Tyb59gn+yPgU9/2wHtr7fb7FUUI5
 m8P3VXKNCbDR02ZLLUpNPk=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10.06.21 14:16, Viresh Kumar wrote:
> From: "Enrico Weigelt, metux IT consult" <info@metux.net>
> 
> This patch adds a new driver for Virtio based GPIO devices.
> 
> This allows a guest VM running Linux to access GPIO device provided by
> the host. It supports all basic operations for now, except interrupts
> for the GPIO lines.

What exactly did you change here from my original driver ?

Your already changed the spec havily (w/o consulting me first), so I
guess this driver hasn't so much in common w/ my original design.

Note that I made my original design decisions for good reaons
(see virtio-dev list). It already support async notifications
(IOW: irqs), had an easy upgrade path for future additions, etc.

Note #2: it's already implemented and running in the field (different
kernels, different hypervisors, ...) - it just lacked the going through
virtio comitte's formal specification process, which blocked mainlining.

Is there anything fundamentally wrong w/ my original design, why you
invented a completely new one ?


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
