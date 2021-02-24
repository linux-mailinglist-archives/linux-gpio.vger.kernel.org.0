Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C138E324187
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Feb 2021 17:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbhBXP7r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Feb 2021 10:59:47 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:57079 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238573AbhBXPdc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Feb 2021 10:33:32 -0500
X-Greylist: delayed 69437 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Feb 2021 10:33:30 EST
Received: from [192.168.1.155] ([77.2.19.91]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MeCYx-1lmu1s3oWN-00bNPe; Wed, 24 Feb 2021 16:30:44 +0100
Subject: Re: [RFC PATCH 09/12] drivers: base: reintroduce find_bus()
To:     Greg KH <gregkh@linuxfoundation.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, rafael@kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, frowand.list@gmail.com,
        pantelis.antoniou@konsulko.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20210208222203.22335-1-info@metux.net>
 <20210208222203.22335-10-info@metux.net> <YCen7uHqFJQ/U/5p@kroah.com>
 <da82c033-3a82-3420-4d06-f5c39c524ae9@metux.net> <YDYHhYRDBDKGSZ1r@kroah.com>
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <9db34ee4-30dc-9e69-6e82-00cbf4615ed5@metux.net>
Date:   Wed, 24 Feb 2021 16:30:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDYHhYRDBDKGSZ1r@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mmo9Pc/0GYHESIzBRv6D4duVXYi0igQdmijnEbfrvu4Oao4dFfX
 G0y5WB2yjQYxEu8yPzpeFzE3k7hWM/cMZkp1vjqo+y9rAg7a6CNNZDV51yWjscyeStjUdYW
 lTz0zEJb6HvFl08t75u+jatWWbONlx5rz47B6g5jItILg5ufHmQ9eSPVLMJB0YO9csGC7lD
 Zr43gdWr3j7oSnQMqnpYQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ylPdVO6clTk=:ta/tLM5X3RdLcmEfayqFsG
 OO1SjQ4QEcInjYBU6ePzx8MW1BeAMSSsGtiwuxwXp3EppERVkX8+IMqPhmSjBuApKgiY+ambg
 SJ6rgtxJ7h+m/ShAyDlk6F5iGXPNC5Jy/DTE16qzYeOTAo5yC1O2JqJoyqcMFiA0YT7Q4Tvf8
 quGJQzhPlRSBeSGpa5IZqVUhQj+R2eqEIHUjbh+WwMshdE+x3MkyjitZTZLUFKgGjg0t/QoAZ
 932QHG+9Enn5ha0JPTgI3b8lJyRILIKGCTjV6u8SluZrd6w5xQ449BYEzXQ8Byy50ciAXB9Ao
 a7+B2NXFbUI8zNeSx6NO76ZcYhUSQfEzeDzNb/Urh69m3NStdrNLFNoiF6EhCbntC5He+5p7p
 XtcbRjKFwpcXEQHucK784gzmG4foNCGDi4FHU/FqQ3llMa39swrNILX/aHqSR
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24.02.21 09:00, Greg KH wrote:

> Have the firmware code do it itself, do nto try to "reach across" like
> this.

By "firmware code" you mean Linux acpi core or the board's bios ?

a) Fixing BIOS would be the cleanest solution, but we cant expect all
    users to do field upgrades. Many of the devices (eg. the customer,
    I've originally wrote the apu board driver for, deployed them in
    really remote locations, sometimes even just reachable by ship,
    heli or horse, litterally)

b) Explicit blacklisting somewhere in apci enumeration code could work,
    but I really hate the idea of such board and bios version specific
    quirks in a place, completely unrelated to the actual board driver.

Actually, I'm also hoping to find a proper way for having those things
in one file per board, in the future. (probably not applicable for
early stuff, or _OSI(Linux), etc)

> And what problem are you really trying to solve here by doing this?

The problem is that *some* bios versions (that came much later, after
pcengines-apuv2 driver went into production) added a few things that
the driver is already doing - different versions doing it differently
(eg. even enumerating gpio connected leds with completely different
names, etc), and still some gpio connected devices missing. Some
versions (just forgot, which one it's been exactly) even enumerate
*some* gpios (and LEDs behind them) as a different device, whose Linux
driver just happens to work. Meanwhile I can't find any reference of
that in the coreboot source, anymore.

As you can see: bios is anything but reliable on that platform.

What I'm trying to achieve: the kernel should behave exactly the
same, no matter what board revision, bios version, kernel version,
etc. (there should be especially no need to have special per-board
quirks in userland, depending on board rev, bios version, kernel
version).

If you've got a better solution, I'll be glad to hear it.


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
