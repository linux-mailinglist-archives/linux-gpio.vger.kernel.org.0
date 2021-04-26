Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6882A36B054
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Apr 2021 11:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbhDZJRf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Apr 2021 05:17:35 -0400
Received: from smtpcmd01-g.aruba.it ([62.149.158.217]:47533 "EHLO
        smtpcmd01-g.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232078AbhDZJRf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Apr 2021 05:17:35 -0400
Received: from [192.168.1.128] ([79.0.204.227])
        by Aruba Outgoing Smtp  with ESMTPSA
        id axMElxVEPkdBBaxMHlqa4B; Mon, 26 Apr 2021 11:16:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1619428612; bh=xngmwhFikqISVkfo/nez+Zdkk/XeKXm3Q0dY+3DmJkk=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=dOR9TkTYRv86CyXVyyqY7JYUaYt+7bXDml7pceUL4HMWdziUY8X6nBbCqiHB7Seti
         qzkgbQ6G8EPmhHko2ayDLx42u7frrIqyKaU6bGvSgYgz4L2MzZ5ifwrDBWWLz+q9+k
         qWnOMwBnGT/M+VTb7bQBwAjwyOkABcYo4YY23gzDYTgU62jkg3kYHwiycAnhYTf77l
         FPzfl/q9MVFpa/4dgjkSzco/IQ1BPNw9gp8dFiYCl578nWPSx5YFZjOvJnxoUTGklq
         JyTAmZfZjrhPDH1aWgSX+cay4lWCcrme2d7SaxDggDMqWSCx4BzwdrnSAaCSP4f1PE
         +tGf/cIKMMmEw==
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
 <CACRpkdY+amtrDE4gaSU5Du2CUivxo6gnUV5zZOcaJJ8=md-4Kg@mail.gmail.com>
 <87207962-5848-3e5c-4d8d-f4a66c864413@enneenne.com>
 <CAHp75VdrRx7kc9OfRuGjqHHvM9akvzsHYSJgWKfr783wvTdhuA@mail.gmail.com>
From:   Rodolfo Giometti <giometti@enneenne.com>
Message-ID: <0de973db-daa7-4dde-161f-a6f477b06e9b@enneenne.com>
Date:   Mon, 26 Apr 2021 11:16:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VdrRx7kc9OfRuGjqHHvM9akvzsHYSJgWKfr783wvTdhuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDMiSpx6Dh918brawoQwREDxs+0AibdOJu8qz9Vi20pa8xDQVPEB9jegQW+O3sTniwHogHQzPTkeZrO1kwcOfm7Ex5zt0Md2DNPVocOccwzTBD1hLbZc
 TS1LvbrVzH2aDFTnbR8LCTAM10+DR+ehCi350uZ9YLRlpDotCJCKj13ZLXxrCr3HY6QSz3mIODl1jtNskrc5lk1Jd0c6Ryp2X1n5DeRtBTAInlcqiCLSHUmi
 fB05Qh5qSEkmj+xSv+z/6ylgIx7dDMo2jTSPRfCjfC0vr046X1T2fz8sSxR9OfBOFrpx+um4tkV6X0cdr8Lb0wLK7yMZwOMCQ05AhJDbNLZ3hy319evjZuoN
 1Np1Gupk4My2xRI5BIfeVrn9aLi5YmLSBfjirP4JjYW13FBgsIBczjeAd2gAXtW6gov3Ca+cWQCmn3+IIEVN6/c3ngV4Ew==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 26/04/21 10:48, Andy Shevchenko wrote:
> On Mon, Apr 26, 2021 at 11:44 AM Rodolfo Giometti <giometti@enneenne.com> wrote:
>>
>> On 20/07/20 10:17, Linus Walleij wrote:
>>> IIUC Rodolfo's idea is to provide this with a DT compatible.
>>> The use case will be industrial automation-ish tasks from userspace.
>>>
>>> Currently the only mechanism we have in the device tree to
>>> assign a use for a line is the "gpio-line-names" property,
>>> which creates a name that is reported upward to the character
>>> device.
>>>
>>> Rodolfo's patch is for scripting use cases, assigning some lines
>>> for some cases to be handled by scripts, not the character device.
>>>
>>> What I am a bit worried about is if this would be a Linuxism, as DT
>>> should be OS neutral.
> 
> Not only neutral but be software'isms free!
> It's only about hardware.
> 
> What I understand here is that we have missed the intermediate layer
> (let's call it 'platform abstraction') where it's related to the
> platform and neither strictly speaking hardware, nor software per se.

Maybe I don't well understand the-problem(TM), but why people are currently
using led and uinput layers to describes their output or input lines?

Why don't providing a dedicated layer for this special scope?

My two cents,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti
