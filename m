Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5F5318BE1
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Feb 2021 14:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbhBKNVB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Feb 2021 08:21:01 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:37999 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbhBKNSn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2021 08:18:43 -0500
Received: from [192.168.1.155] ([95.114.27.115]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M8yPu-1lE3Av2zoM-0063xQ; Thu, 11 Feb 2021 14:15:51 +0100
Subject: Re: [RFC PATCH 12/12] platform/x86/of: add support for PC Engines APU
 v2/3/4 boards
To:     Rob Herring <robh+dt@kernel.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org
References: <20210208222203.22335-1-info@metux.net>
 <20210208222203.22335-13-info@metux.net>
 <CAL_JsqJw+EjMoc92e-XMjn=0wat3TmcToHU1V2rW9UB9UhmDEA@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <1a96e003-e264-9f9b-4239-4b3b002c0198@metux.net>
Date:   Thu, 11 Feb 2021 14:15:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJw+EjMoc92e-XMjn=0wat3TmcToHU1V2rW9UB9UhmDEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:X03an0jzA7Ik2yin6U2Zx4JrFGvXamVp+aFMSxgk7gvcKjOnIG2
 wRS+NMnI958UjkK1bAW4exbjNEvRWZ4ey6UZ/64Wd23lvW+3NvDnpHNqEqa3EAzsTjMSeCb
 uDnDWaaxXEORuRz806oib9eZzBt5K/+/B3QtShlGtjSybccD7Yex6xVSQN8drwU+hYgwMdT
 UNQdvFXyUb8a8euhz5KLQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iBvfJPWk7OE=:tQXOSq539WLmvFCUNCOBEG
 W4jA2/b156mHHTcc63xYdiTc8DwuHKNNCPNatkoJNn+AmALQJ0VWiwHZKTWrgm2lcxJsMtRxo
 wnZVhG59kLAMEwXRwSLzyD4AD3Wb9d2jQW5gyYVXos+6kb0UQTDYQsboEZhxo9CKlLD/ceQtV
 Mi7uaSAvqgfTECa6MnBYgzbln8Xpp3rYHWQT6SGGgVKW2hN42JwUneuwrnyALk9Rzb53NNdtv
 PhoarSX7K0oU5Vn5AkuhYFzVvWl5xufuI9IV28Rajfp1IG/sq4zutlTf4t8jWUzoHH1D3JQdJ
 TixDQ5UEECULBXxxLM8BFIe5ZWUedHT8MiuHrWg0aW945siyMdOalTHlKHcUmBocrrC3M5F6z
 V1wlARoAS3v3rUDA1rv+uEcw5xpeCZ2pDY3NQMEdxwtWHerWKVdE2G/eEj/QW
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09.02.21 01:06, Rob Herring wrote:

Hi,

>> +/ {
>> +    apu2x {
>> +        compatible = "virtual,dmi-board";
>> +        dmi-sys-vendor = "PC engines";
>> +        dmi-board-name =
>> +          "APU2",
>> +          "apu2",
>> +          "PC engines apu2",
>> +          "APU3",
>> +          "apu3",
>> +          "PC engines apu3",
>> +          "APU4",
>> +          "apu4",
>> +          "PC engines apu4";
> 
> I think these DMI properties just need to be the compatible string(s).
> We already have a way to do matching with DT and don't need a
> secondary way. If you can

It's not easy fitting that into one string, because we've got lots of
combinations that need to be matched. In this specific case, I haven't
seen any board where the vendor name isn't an exact match of the given
string (that's why it's only one entry), but in the past seen several
boards where even this changes between bios versions. The board names,
more varying.

Something that's not reflected in this example yet: there're even more
subtle differences between production series (eg. certain pins not
wired, etc). Supporting such things would need adding more matching
rules and possibly runtime DT manipulations.

>> +        unbind {
>> +            acpi = "PNP0076:00", "PNP0B00:00";
>> +            platform = "platform-framebuffer.0", "PNP0103:00";
> 
> This node really needs to go. It's clearly Linuxisms. It either has to
> go in the kernel or userspace.

Note that the whole thing here *is* a Linuxism. This kind of DTs is
built into the kernel, not in firmware or anywhere else. This stuff is
only for cases where firmware is not giving, or giving broken
information. And it's for replacing hand-written C code by a machine
readable description.

I had to put that in, since in some cases firmware (-versions) already
enumerates some devices, but does it in a wrong or incomplete way.
So, these devices need to be removed first, before the correct ones
can be initialized. (note that this patch, for now, is just an hacking
example - some details are still broken).

If anybody has a better idea how to do that, let me know.

In general, I'd like to have everything for one board (family) in one
declarative file.

>> +        };
>> +        devices {
>> +            gpio1: gpio1 {
>> +                compatible = "amd,fch-gpio";
> 
> This of course will need to be documented.

Yes, but that's a different issue. It's still in RFC stage.
The gpio-amd-fch changes are in this patch queue for a complete example,
but probably will be upstreamed separately.

>> +                gpio-controller;
>> +                status = "okay";
> 
> nit: That's the default.

Okay, dropping it.


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
