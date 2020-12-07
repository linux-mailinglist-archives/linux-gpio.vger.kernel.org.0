Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00322D1A5B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 21:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbgLGUPQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 15:15:16 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:53215 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgLGUPQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 15:15:16 -0500
Received: from [192.168.1.155] ([95.114.88.149]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MvryJ-1ju7tU1IdL-00suqF; Mon, 07 Dec 2020 21:12:43 +0100
Subject: Re: [PATCH v2] drivers: gpio: put virtual gpio device into their own
 submenu
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20201207112354.13884-1-info@metux.net>
 <CAHp75Vd_iiqTYvgD59C7j+btx70s_Ge0UC4JU2uPa33enFW08w@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <0a04718c-4201-1d04-7ca1-6c2ddf1b26d9@metux.net>
Date:   Mon, 7 Dec 2020 21:12:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd_iiqTYvgD59C7j+btx70s_Ge0UC4JU2uPa33enFW08w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wuHzSCHKGRzk49zmXKxwNvnQtGCuU4vJKGepsU8ljku6GuEVR4Z
 IrNCltYoax5f0QzZIYHOujvFnsek6pIjzc9INA640a7115DegTd+x5s9sKU6sAyqWXp6z4/
 Te6fFcku+jKYrO2l79aXH1Q/CIsIqGMAoNoGcY+2jreP/oRygZ9glEOiYdFUkAI653QoONg
 P6AE4T3SR3ZPkyW0hm42Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3N0dqt4ZoHk=:dErUXfvFuQskeoF7HHqSWh
 SaCj85sRICqxY6u8q9P5A8nf3VTomb6899KzxHEGfXyeYnOdsLVSCIBIJeCmXlmaNgAe5+w3l
 D1/iN5gLJcUKXhzPD+tM8jbSDdHTjQbWNEQbmXaQe0IYlWFK/fHlYl+fCnwXbXYmnEhKtZwsH
 353BaVYWxqUaZeHJnNez600WGg/JUn3gRz3GcfyKLWQZqo6CRv2Zn/7Z0a0vwMF5ZZdo9A80P
 BpkEQSlu+GF5IAztrQ1EH807fEdhZI/bMsMu6NhQjJ++goB6MaQbI6fJSbTZc0hCDkEXW3Y0r
 nS730y6Vyv5A4GdqbWjBBVVXGXFTbl8iybdVimmmga84HTTSr9crRzL+8RfPi40q8vtBkjuqb
 +2Ub9D3uTkuCgniPsty4L2OKQPw+hTATJ/s+aJE6knomiwQ2k2E2KL4tiQKlM
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07.12.20 16:42, Andy Shevchenko wrote:
> On Mon, Dec 7, 2020 at 1:29 PM Enrico Weigelt, metux IT consult
> <info@metux.net> wrote:
>>
>> Since we already have a few virtual GPIO drivers, and more to come,
>> this category deserves its own submenu.
>>
>> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
>> ---
> 
> You are not a first day contributor, where is the changelog?

grmpf, didn't expect this is also needed in such a trivial case :o


--mtx


> 

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
