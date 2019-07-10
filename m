Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7591646D0
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2019 15:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbfGJNJs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jul 2019 09:09:48 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:48851 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfGJNJs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jul 2019 09:09:48 -0400
Received: from [192.168.1.110] ([95.117.121.26]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MSKq0-1hw6TJ2JPU-00Sinv; Wed, 10 Jul 2019 15:09:45 +0200
Subject: Re: [PATCH] gpio: don't WARN() on NULL descs if gpiolib is disabled
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Claus H . Stovgaard" <cst@phaseone.com>
References: <20190708082343.30726-1-brgl@bgdev.pl>
 <CACRpkdb5xKHZja0mkd-wZJ+YHZpGJaDrkA0dv60MNYKXFcPK4w@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <6d863a60-c825-724f-503a-2aacbe78f2ba@metux.net>
Date:   Wed, 10 Jul 2019 15:09:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdb5xKHZja0mkd-wZJ+YHZpGJaDrkA0dv60MNYKXFcPK4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:FnVbftG8EdEvWc2pYCA4d+y1eyDiPCus7EowZWUH+O70GmSpMcU
 ly2jgEo0D7148q6PkFwp8d8f2ypXH+kFCMlRRYuz9KoHzDAATxN0W44eUC3EOPfSIvoRebA
 /59E+nEIwHVBiLzHJvcC5lM7kEm9KfGy7lg/m5XkHRIo8Nx9pgFB1G9YS2c6RrU9b5HGySo
 DHitxwbYdJzT1H2mfMtkQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dXL+xzn3D8k=:ApILMSyaW2Ok3K5XbhSII+
 DnR9WuXEstP/LHtsDMIE8eC6wNqjLmMBk1E4BagmCXda/oijcFjP5ZVnhe9LtmB2spyFaFu6/
 HtSRMo+4wDzmoqbTnsZAbCjCjv9/Fp8giZ3XqtQYmxRPplAhvshAzRDooqR1r3wCLfQQixPqS
 DbYWCWRwBuX6o2sjrabtQxwNpzAPMNC2KT9iuddBrvseI+oZYkSe5ZX4u2hcO+XJB8Ni70PRn
 x0jPZeNz3GysN41HT5qkhKDBK2xX7neqkrxhg6N/HZtf3DsT+SLgtVkNRDaMiGzr+Qayv4xBz
 ade6Gop1aumM90o5aSliu55o/38sln92BGOrlMr9P5SvPpRzBIQmwYKJMdij4Nh5WzH4lWrjS
 kZZEAGKf3paDRJ/yQIWcfL3uSk7dYSZLenKYaQ/zmZLhK8CyzeMw1534TRM+ZS0zzWzte7rlt
 5W+NCfqaQwq0ouRejWgjnFdDxgjTH5yFLhpMuWuPN5NVVYiAnrXyDmUS/U3In7Lzr0TtLY4co
 xXHOn8ZhbFuHg32tB5A64/L6RdpGGxgsT4wcNY0zWsZOQWCCwZlFlZT2fZPjPrd94MKArsGLe
 o5C2RhjTkfnT5gm8dtUGSq56azwo44tABLAsd6jGmSFaV4UEWaF/t1kAoNOgp1IpghMGWoUws
 n1JCsYcOqjLH+0P1l5dfcxD5Z/C90aG8W9HylV+VrjczmCiPNFL9a4m3KpcrW1cMXMh3fo5qh
 sWU4WSwYJ+DmqbOYQwsuYjt3Gx/DKD0UYAfGbsuTLvOFJWB0TR8XnmVQLeY=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09.07.19 15:30, Linus Walleij wrote:

Hi,

> I remember I had this discussion in the past, and I made a large> refactoring to make it possible for drivers that need gpiod_*> calls
to simply do:> > select GPIOLIB> > in Kconfig.
Would that allow enabling gpio consumers or drivers selectable w/o
having the gpio subsystem enabled first ?

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
