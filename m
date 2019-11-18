Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5F9410056C
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 13:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfKRMQX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 07:16:23 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:44575 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfKRMQX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 07:16:23 -0500
Received: from [192.168.1.155] ([77.2.21.1]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N0G5n-1hcFmY0NEN-00xMaq; Mon, 18 Nov 2019 13:16:09 +0100
Subject: Re: [RFC v2 0/2] gpio: Support for shared GPIO lines on boards
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        m.szyprowski@samsung.com, broonie@kernel.org, t-kristo@ti.com,
        mripard@kernel.org, p.zabel@pengutronix.de,
        devicetree@vger.kernel.org
References: <20191030120440.3699-1-peter.ujfalusi@ti.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <3c384b40-f353-eaec-b1d6-ba74f5338ce1@metux.net>
Date:   Mon, 18 Nov 2019 13:15:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030120440.3699-1-peter.ujfalusi@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VQpp2LkkGOFS32U8chMPZcvqbjQhQ4rc0tkcJc2OEzDXeYPb7ST
 ow42k80v1vJuyImw6DO3M/z0OBC3Rtgi4CV1ZmFn2ryR6JkELuOZjoa/YAFxNyIb5KkFShw
 Lh17wToVV5OzhFFAeF3uTIZZfujHBFH87yJIJxRVvUOlJl0IHM0OpoomgDBHm7pQ6SHm8AL
 ZvKAB7oOJ22vwXDNnCbJA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/ACmG4NFdI4=:I0pAr59f+vmixjhNzmC0rZ
 hzINcwOJeCyyisQoH13jRRu1oh1HGt9LJIn4tfb77oMSomT5slJuexjZAcD/bHJXc0OjKS8PF
 vTqXO5m5tye6l1CR42/92uFlxFFx0ppf8xOwKrBXvznRdoPwLeam3fztkE1MJN69V0GJcZUNs
 8v1cLG5hdiPNPCN9bL8r9fnRcPlqpO6dKEuvnm3iCzoPmiD1GDMPeJswaHqiHgPhxtL8kZpKd
 sLecXLGCSTnY/vvdg6eW+01IMfV3EPThHJ3uHgS/T5xUnniu8qFGmVQa2c2gMk5wMcyTfz/oI
 xak6YD7TxN5Eo1/pELE3Jao3uhij+j2n5sYDZ1dhyngDiBk/AvDwDDMsg8dNqWizwNpS40Uy7
 Dhmubna2gXqlaRMZrRc9YcsDcLnk2HY5gwCYV1LQK6Jwn66xbJYCr/syfkwLYa4b41l5V7ecI
 fBLpaH1hd+tskh3r4XWGuUSj8RPR555QTWTUiXXxCv22Zw5cjvNaTI1Hw0o6kD1vYd7+rXGg3
 yuvSnpgTUDqst9vGd8yG1wbZRDOcg9rS76eyxIN937k6USvrpZAQt85C3XFv6CgFY56CzjEKX
 MvItOY6vSIJJxPWUNrydgfTVwkp/Ts4yIKBF4Ui0XFIytB06/NEyNphqtTixGJlvyBK51Pkr9
 R2CiYl1NM6653CmwieonpjSJrh31V0R9Q+Yl6HMkXWCu36hTNfYE3/4rkhSsHEn4t7F3AFoUV
 NWjmpEJTPUoXD1vtWNLML6DfWhs927ye48HE62Ixm66jfVLnLt7o8B1TKjjjHWyHmAzc2V04u
 pHuzDTM/7CdMAXxGK2uFtYMtV5Zr1+Neu7Wkw3xF2PSpLIVbpcDAx32qKZ/P403tDy3YCU48s
 rUoOJZtBxZXtyH5iRp+Q==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30.10.19 13:04, Peter Ujfalusi wrote:

Hi,

> For example any device using the same GPIO as reset/enable line can
> reset/enable other devices, which is not something the other device might like
> or can handle.

IMHO, for such cases, invidual drivers shouldn't fiddle w/ raw gpio's
directly, but be connected to (gpio-based) reset controllers or
regulators instead. I believe, GPIO isn't the correct abstraction layer
for such cases: it's not even IO, just O.

Let's sit back and rethink what the driver really wants to tell in those
cases. For the enable lines we have:

a) make sure the device is enabled/powered
b) device does not need to be enabled/powered anymore
c) device must be powercycled

You see, it's actually tristate, which gets relevant if multiple devices
on one line.

Now add reset lines:

a) force device into reset state
b) force device out of reset state
c) allow device going into reset state (but no need to force)
d) allow device coming out of reset state (but no need to force)

It even gets more weird if a device can be reset or powercycled
externally.


hmm, not entirely trivial ...

> For example a device needs to be configured after it is enabled, but some other
> driver would reset it while handling the same GPIO -> the device is not
> operational anymmore as it lost it's configuration.

Yeah, at least we need some signalling to the driver, so it can do the
necessary steps. From the driver's PoV, it's an "foreign reset".

> With the gpio-shared gpiochip we can overcome this by giving the gpio-shared
> the role of making sure that the GPIO line only changes state when it will not
> disturb any of the clients sharing the same GPIO line.

How exactly do we know when such disturbance can / cannot happen ?
That would be depending on individual chips *and* how they're wired on
the board. We'd end up with some logical multiplexer, that's board
specific.

<snip>

> If any of the codec requests the GPIO to be high, the line will go up and will
> only going to be low when both of them set's their shared line to low.

So, if one driver request reset, all attached devices will be reset ?
Or if all drivers request reset, all attached devices will be reset ?

Doesn't look so quite non-disturbing to me :o

> I have also looked at the reset framework, but again it can not be applied in a
> generic way for GPIOs shared for other purposes 

What are the exact scenarios you have in mind ?

> and all existing drivers must
> be converted to use the reset framework (and adding a linux only warpper on top
> of reset GPIOs).

Maybe a bit time consuming, but IMHO not difficult. We could add generic
helpers for creating a reset driver on a gpio. So the drivers wouldn't
even care about gpio itself anymore, but let the reset subsystem so it
all (eg. look for DT node and request corresponding gpio, etc).

IMHO, that's something we should do nevertheless, even if it's just for
cleaner code.

After that we could put any kind of funny logic behind the scenes (eg.
one could connect the reset pin to a spare uart instead of gpio, etc),
w/o ever touching the individual drivers.


--mtx

-- 
Dringender Hinweis: aufgrund existenzieller Bedrohung durch "Emotet"
sollten Sie *niemals* MS-Office-Dokumente via E-Mail annehmen/öffenen,
selbst wenn diese von vermeintlich vertrauenswürdigen Absendern zu
stammen scheinen. Andernfalls droht Totalschaden.
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
