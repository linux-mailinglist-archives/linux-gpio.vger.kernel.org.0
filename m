Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3345633F06D
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 13:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhCQMep (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 08:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbhCQMeO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 08:34:14 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB889C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 17 Mar 2021 05:34:14 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id u18so701209plc.12
        for <linux-gpio@vger.kernel.org>; Wed, 17 Mar 2021 05:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tTv/bvmRIG0DZp/nod73E0fUI/jwpB7NVJIWj7h1tTc=;
        b=Z0qW57MMAJEZAD13nK/hCfZXkDQ9oqQiQJ+scLEAbX0M9qWd2v+AjwcnRGGq+0GYHu
         lqG31g8h9lJCr8C85sMl7jsIPzDNLMFeyF5xxBtB+CjA/+1ZqAia1mJiuYCGIciUaz5W
         2j1VRxOB1toDj9xj6UV5a+PE5R7QBuCWmXJ4FkUtvLBOkqJjIWMQEP4XchbN1LnQAxQj
         iMDjnFPPBFfkVP08bDOPoqmqvFYOAc8IdrwTnD5jiLmzF4rDYobnXJxc8RwIMWd5zxXg
         EzcknUXXWUTIXbIt5nrycPjcJ96IgHmj23vSVnPTvC8ELrWuynpr9o5kobitR7uMaTAa
         z01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tTv/bvmRIG0DZp/nod73E0fUI/jwpB7NVJIWj7h1tTc=;
        b=dB3qet6OuAf8vcZohezLH2f0xa3JxgwkMf4+Hjt5AlJmd/MdN7CD7P9kFgdDVhhCqJ
         k7jECLF9WKtsYWl/WPwSeAMunu47x7qhKUdKTxxjDl/YggC/Y4LN2C5zFBOK5V5sX32G
         FUN51KtOP2H7GoUnbz6dyY6hxttRcmaEg6yf1cdbnjVENdliXD1DbFlZ/4tclKsHujJ8
         Lc6CvLtbcfcdW/TwTcz3p+c5u4PSSKzEcoAf4qw4YZRVlRzMGvnbA+iRWw2dY4IJOmy/
         GZrYjOktWVYqq1DrHYO5/tt1QcPlZMcZ7SMLdKMl6vGv3U0fW7gqeuOMXI5VBE6wEPwp
         1Q/w==
X-Gm-Message-State: AOAM530ptVN6Nv7dNGjE0xLh6DSjvMXpN0zarVO89l8bWvUk17fDGM99
        t+SKVskAfV8oFq8CFKfWBcatp3/hpM6HBfGbjhU=
X-Google-Smtp-Source: ABdhPJzwyskjErrkGFo5lBzyhSvfK2mnD0YdnQHx1LzCygvahKblPdbUay/yEEUt8RAnuQw4Yh/5I423FUdJ4zL1cTk=
X-Received: by 2002:a17:90a:b311:: with SMTP id d17mr4575345pjr.228.1615984454276;
 Wed, 17 Mar 2021 05:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <946021874.11132.1615900079722@seven.thorsis.com> <CAHp75Vf05NN0dXUrMSOXBRuYRnQRHO_92itZ3ndOyX1oERWt=g@mail.gmail.com>
In-Reply-To: <CAHp75Vf05NN0dXUrMSOXBRuYRnQRHO_92itZ3ndOyX1oERWt=g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 17 Mar 2021 14:33:58 +0200
Message-ID: <CAHp75VczovYQB70HVEmDA=xfTBcNuSm2f8x9Mnbj0P0Z4UHRMQ@mail.gmail.com>
Subject: Re: setting gpio-line-names in dts for sama5d2 SoC
To:     Alexander Dahl <ada@thorsis.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

+Cc: Bart, Linus

On Wed, Mar 17, 2021 at 1:22 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
>
>
> On Tuesday, March 16, 2021, Alexander Dahl <ada@thorsis.com> wrote:
>>
>> Hei hei,
>>
>> for a Microchip SAMA5D2 SoC based device I try to set gpio-line-names in=
 .dts file like this:
>>
>> 257 &pioA {
>> 258         gpio-line-names =3D "",                   /* PA0  */
>> 259                           "",                   /* PA1  */
>> 260                           "",                   /* PA2  */
>> 261                           "FOO",                /* PA3  */
>> 262                           "BAR",                /* PA4  */
>> 263                           "",                   /* PA5  */
>>
>> =E2=80=A6 and so on for all 4 * 32 GPIO Pins. However when calling `gpio=
info` in userspace, I always get this:
>>
>> $ gpioinfo
>> gpiochip0 - 128 lines:
>>         line   0:        "PA0"       unused   input  active-high
>>         line   1:        "PA1"       unused   input  active-high
>>         line   2:        "PA2"       unused   input  active-high
>>         line   3:        "PA3"       unused   input  active-high
>>         line   4:        "PA4"       unused   input  active-high
>>         line   5:        "PA5"       unused   input  active-high
>>
>> =E2=80=A6 and so on. Those "PA0" line names are set by the pinctrl drive=
r in drivers/pinctrl/pinctrl-at91-pio4.c before calling gpiochip_add_data()=
 and from reading the code in drivers/gpio/gpiolib.c I suspect devprop_gpio=
chip_set_names() is never called then, so those names in .dts are simply ig=
nored.
>>
>> Those default names from the at91 pio4 pinctrl driver are certainly corr=
ect speaking of pin names, but from a userspace point of view it would be b=
etter if I could override those from dts, so an application using libgpiod =
could look for a name like e.g. "VALVE7_EN" without caring to which pin tha=
t's actually connected. Can I override those with a currently present kerne=
l? Or is it a problem in either the at91 pio4 driver or the gpiolib core? O=
r is that no real usecase and should I do it differently?
>
>
> I would like to know the consequences if allow this, but to me it sounds =
like a bug in the gpiolib.c.
>
>>
>> Greets
>> Alex
>
>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


--=20
With Best Regards,
Andy Shevchenko
