Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2584336B24E
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Apr 2021 13:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbhDZLVk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Apr 2021 07:21:40 -0400
Received: from smtpcmd01-sp1.aruba.it ([62.149.158.218]:49272 "EHLO
        smtpcmd01-sp1.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232364AbhDZLVj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Apr 2021 07:21:39 -0400
Received: from [192.168.1.128] ([79.0.204.227])
        by Aruba Outgoing Smtp  with ESMTPSA
        id azINl1D3hkdBBazINlskVa; Mon, 26 Apr 2021 13:20:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1619436056; bh=frTJMNMpm+Hv7Zbg5xN209kUss8MSNY4dnId4BDsBNE=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=bFFh/2KL45c8CGWmt9sRveoyvfUz0ty7k/7UBAbkcxezThKHgh9qoXMUjCmCvp1sm
         7a1xSJe0fv1AOqtVTP65DFHR75SvqrNoT509dhHekd7TJIIo68HxqDUM2YvNvRlZnZ
         GLM7X6PWYVQH96o6kz2nfrdSNy0ExSZEX8XW5Jh5jjERi0rj8d5KfosAOXr+sNDsRj
         T2CAFO/WgAsLjwRG7fM/MW2UKyxjD+r90kkrGfBhY0+qUfl8kjhBNAU09WGCu74rxy
         unfzO3ZWq8FUajr+IKMOW/5d2Ifq2HWeIqi1sYXIsOvbbtt+m0Y+d3L2CoSknLZKVE
         PS972Zifwnhzw==
Subject: Re: [RFC v2 GPIO lines [was: GPIO User I/O]
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
 <d30e64c9-ad7f-7cd5-51a4-3f37d6f1e3d8@enneenne.com>
 <070fa558-6e20-0fbf-d3e4-0a0eca4fe82c@enneenne.com>
 <CACRpkdYFAW2bcB53M3_b2LsveJO_PWZJhprGhdTtfmW11B1WmQ@mail.gmail.com>
 <f66dc9c4-b164-c934-72a8-d4aca063fca5@enneenne.com>
 <CACRpkdbjc6vvpHVjnJNGisRw6LiLZd-95aHWJJORwvaRNigPcw@mail.gmail.com>
 <cb6e208b-446e-eba4-b324-d88aec94a69b@enneenne.com>
 <CACRpkdZBUw5UPyZB-aeVwh8-GiCifbwABZ9mOsyK90t3cdMQ+w@mail.gmail.com>
 <80bf1236-aacd-1044-b0e5-5b5718b7e9f0@enneenne.com>
 <CAHp75Vc1ezuW9m8OCQUmEJoNVoD-Z3eWF=Lzcr2v32Br8Gr60w@mail.gmail.com>
 <CACRpkdY+amtrDE4gaSU5Du2CUivxo6gnUV5zZOcaJJ8=md-4Kg@mail.gmail.com>
 <87207962-5848-3e5c-4d8d-f4a66c864413@enneenne.com>
 <CACRpkdYCdhi_Vb_+0cfD02WRzOhvenoFt5tbowe91RMjQBfeug@mail.gmail.com>
 <474f975d-3fb6-8345-cfbf-79ee313c0850@enneenne.com>
 <CACRpkdZn4+jM1K=UyowOkmax5aP35ao2JtGSy96apOd+_fOp3A@mail.gmail.com>
From:   Rodolfo Giometti <giometti@enneenne.com>
Message-ID: <4d9e5b2f-ab84-1f42-b40e-e5a124717948@enneenne.com>
Date:   Mon, 26 Apr 2021 13:20:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdZn4+jM1K=UyowOkmax5aP35ao2JtGSy96apOd+_fOp3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfN+llEglKLcfC7p6xqL5O9h4h/1LCf3ZFU8Ddb2aeueR3wYx8F1n6VZVLjVJuToU7PKXsUTrRXNqyCYqGghKVhhhfMAbsMyVIVi95MtrAoAC88UouhRt
 B6EJ0sdexTeipf5q8l62N4pxGpSm7GnhmdQsifkvFhxLQ46wP1iBzXzkrbYHOan/5YY0kuJZUplqtcvCBfwwqNZDoPhGF58h3HQ8zePjLNNHAJGRL+bQSnzy
 F9uL3wqY2C2woLbUTTWkffyfcV/klDqJA1/Dfwt+HhXvR/DK2YPfmBKttgCUYKRGJ1SeXRkIpblcQFQLYw5YE5/POKYdx4BmHkTbUxW2+v9xz890/r7IbVfr
 tdnTn5MBHqlyijyKrerLkzWmyHsz4yV+Oq1mQ8Fm0jFzP9SPghpq37PMDC7PDGCLXsmvvRoAl7JPYW/pWbUaoeJI0Dtk8Q==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 26/04/21 12:12, Linus Walleij wrote:
> On Mon, Apr 26, 2021 at 11:44 AM Rodolfo Giometti <giometti@enneenne.com> wrote:
>> On 26/04/21 11:31, Linus Walleij wrote:
>>> On Mon, Apr 26, 2021 at 10:44 AM Rodolfo Giometti <giometti@enneenne.com> wrote:
> 
>>> I would send an RFC of the proposed DT bindings there.
>>
>> I agree. Please, let me know if you need some help.
> 
> I [general tense] would, implied [if I were you].
> 
> What I mean is that whoever wants to drive this should send
> proposed DT bindings there.

:)

> I am not volunteering to drive the project. It needs to be driven
> by those who have the need and can verify that it is fulfils the
> needs they have.

OK, I'm going to re-propose my patch to the devicetree@vger.kernel.org mailing
list putting you on Cc.

Thanks a lot for your suggestions.

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti
