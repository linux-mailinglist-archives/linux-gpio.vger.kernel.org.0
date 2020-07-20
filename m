Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940642258BC
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 09:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbgGTHiK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 03:38:10 -0400
Received: from smtpweb146.aruba.it ([62.149.158.146]:51159 "EHLO
        smtpweb146.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgGTHiK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 03:38:10 -0400
Received: from [192.168.1.134] ([93.146.66.165])
        by smtpcmd05.ad.aruba.it with bizsmtp
        id 5Ke52302y3Zw7e501Ke679; Mon, 20 Jul 2020 09:38:07 +0200
Subject: Re: [RFC v2 GPIO lines [was: GPIO User I/O]
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com>
 <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
 <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com>
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
From:   Rodolfo Giometti <giometti@enneenne.com>
Message-ID: <a80dda59-4037-e67b-d99c-7dcdcb44a8f4@enneenne.com>
Date:   Mon, 20 Jul 2020 09:38:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc1ezuW9m8OCQUmEJoNVoD-Z3eWF=Lzcr2v32Br8Gr60w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aruba.it; s=a1;
        t=1595230687; bh=GKkOGIGhCBY9lAbMSnioB/xi0FLqCI9XkJzBUYXRyq8=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=Q/sM94YqyKWgCxRnrE8kZTBHfBp7DrbVkIe8dGc2dqp7GkLb36bDj6rhpHPJPjtYg
         p3LadMsQnWhia+OtJAprGIfs5RNfqqhkvzXzd/Nz/E2/qjyaF9lIuA99IMm6UbzpTa
         1AUQC58YoGbKhjJiFE8cxLNJkM90wyrCudQ9FMejb3rMQRTfEpQAUlFe5OfWeP4X8P
         fDw49wU3AvzJBlbezlQ51OYvgZSwuITnZScrpZTL4XNEF9IILZq4S0XkPX2ClivjHz
         G6BWEpyDid/J5XohaUPlaf94stQDK7X0rYDEHTVB/3grsdBTYQb74GSEw9iyzbPADQ
         rZCdCMQmI3GUw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19/07/2020 20:35, Andy Shevchenko wrote:
> On Thu, Jul 16, 2020 at 6:17 PM Rodolfo Giometti <giometti@enneenne.com> wrote:
>> On 16/07/2020 15:38, Linus Walleij wrote:
> 
> ...
> 
>> I see but this interface is not designed for such complex usage nor to compete
>> with the current character interface! It is designed to allow boards
>> manufactures to "describe" some I/O lines that are not used by any driver in the
>> device tree,
> 
> Why are they not in firmware tables? Platform is a set of hardware
> that makes it so.
> If something is not in DT, then there is no possible way to know what
> is that line?
> 
> Or in other words how does the OS know that the certain line is
> connected to a relay?

I'm sorry but I'm not sure to understand you.

I think that within the DT the board developer should describe his/her hardware
in the most detailed manner for drivers and, as last step, for the userspace.
The OS should only knows such IO lines whose are driver related while other ones
(such as a relay or a generic digital input such as a lock/unlock signal) should
be described for the userspace.

At the moment the only way to "describe" a digital output/input not related to
any driver is by using the led or uinput interface that are not designed for
such purposes! My suggestion is to give a proper/dedicated description of such
IO lines.

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti
