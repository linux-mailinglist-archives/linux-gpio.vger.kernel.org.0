Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3468E36B0E7
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Apr 2021 11:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbhDZJo4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Apr 2021 05:44:56 -0400
Received: from smtpcmd01-sp1.aruba.it ([62.149.158.218]:35394 "EHLO
        smtpcmd01-sp1.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232626AbhDZJoz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Apr 2021 05:44:55 -0400
Received: from [192.168.1.128] ([79.0.204.227])
        by Aruba Outgoing Smtp  with ESMTPSA
        id axmYlyOK0kdBBaxmblr2LF; Mon, 26 Apr 2021 11:44:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1619430252; bh=wZi1+/un9KXEzwZfs0USwJMBSnH9Sra/mxHMIZT2T6g=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=dQux+IYvjQGVuM5Tpimzn8HLp6wkvxnt+MtZZz15eDxR0lHNPWhxK7BUZTm7KffUZ
         n5y0AlakYBYlPR/MkTOWXB9Npyumz1/FMIniqRAtJe9vMWwWa5c1AWn7i5cE7c0T6E
         RSA2CL6pbUo18RQxJAbLQxyBwoLe89cBsP4lrk+Nyd4MFnaMu6xF7GnqN8ksROE+u7
         5Ywg7oBfCDTeL4q3LN6uyRVh5wLvBW2M4DNVLSnOIKKdUtr14EiCS/5Wl9Ju3yodTM
         bH253V3NrO8Z5aDc+9xP/WfCVOB7LgX2eoAN1VRVy07r911w1lSfbGlkTftSF2Dswg
         UTM6I0z0nR72w==
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
 <CACRpkdYCdhi_Vb_+0cfD02WRzOhvenoFt5tbowe91RMjQBfeug@mail.gmail.com>
From:   Rodolfo Giometti <giometti@enneenne.com>
Message-ID: <474f975d-3fb6-8345-cfbf-79ee313c0850@enneenne.com>
Date:   Mon, 26 Apr 2021 11:43:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdYCdhi_Vb_+0cfD02WRzOhvenoFt5tbowe91RMjQBfeug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNPKHPVlWE1XyHHI+VDg7UuxoHO5/pvy8Xsz12HOYegKil6JNWeCErm6U6U7XvIZevfEiESeXfQzWmsDlhCeYWD7vDAwSs6vCJ6V9yWB0SLKtp7wrlyd
 BtVM2QQ7+qKi+jfFiHhIzoeiVaQHbCBRm6ekTy39zdNFfgN3SFRRZwCfHvS+9Qy3s7+yfxix0mHLplLLhuc/XB+NRw6HWDLDoZ46I18hZ2nV7JEPPk/F71Bg
 5jbMInVm1ffh2bRLBuFi/b9OrDKCsvIfg3qF/0VeQ/65j6K2PH6ro3uq68/GzsUSDq/EK+FvQM/XLg1ikYApBQYYELc0kRqpElY3wiWpiofVhkcnB/Jv+t9o
 sgt5anNTS4s9apxTqGq+13P4Bc9byW1XIIgJ+DagLnXMt7DUB3sv21hoxMlQAs5pfGsB+QdrqTRdqqKJMuxfBQ7Pq+szHg==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 26/04/21 11:31, Linus Walleij wrote:
> On Mon, Apr 26, 2021 at 10:44 AM Rodolfo Giometti <giometti@enneenne.com> wrote:
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
>>
>> Hello Linus,
>>
>> I'm currently using my solution for GPIOs management as input or output lines
>> described in the DT on several systems.
>>
>> Are you re-thinking about this topic? Can we go further for inclusion or should
>> I continue doing out-of-tree? :(
> 
> It is a system description question, and I think you will need to discuss it
> on the devicetree@vger.kernel.org mailing list.
> 
> The people there are working with things like the system device tree which
> is intended to describe aspects of a system apart from what Linux or
> any operating system is doing with the hardware.

That sounds great to me! :-)

> I would send an RFC of the proposed DT bindings there.

I agree. Please, let me know if you need some help.

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti
