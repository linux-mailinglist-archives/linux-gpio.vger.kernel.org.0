Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C98D35DCA0
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 12:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343638AbhDMKoV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Apr 2021 06:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343539AbhDMKoT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Apr 2021 06:44:19 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA0EC061574
        for <linux-gpio@vger.kernel.org>; Tue, 13 Apr 2021 03:43:59 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id l14so11361030ybf.11
        for <linux-gpio@vger.kernel.org>; Tue, 13 Apr 2021 03:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ofMEg8rv+pKPXoMYWJfZuMSoaHQfPurW7rv78Elym1g=;
        b=T4ehIf9EYTEgcw6LNW7hIhfOrIYn21tK4+JDzP8gY0zjqewX2yID8aWTpK6Fw+gsIK
         YgpWOAdmzlajJxemylLiZaHR+eUGjC5DUvFFn2pHTAInVlUVBMl/Q0YaOcUc/ku4Jwtf
         8ikiLmqHVecKPhTDqJXsD0VntQXoQyJUFdL6iMK7i2i8YxavNj1hjyA2ra/hCI6IeLOI
         BiLLbvTnQuGOXDvTyf6VrSlZtON6DhL5GifvpOZc4mi68htOtc4nKk2byBO0W11OuP4t
         kX7D2IomWQoOg1D9aIUWK96L1lg1BwXA6Nv01GnltBy8wNorb8HZApmwP3P9EErPVksQ
         Lr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ofMEg8rv+pKPXoMYWJfZuMSoaHQfPurW7rv78Elym1g=;
        b=hbrCdiX0iFAlEhILDKwV/xsxNwCj50MXRoH5rftTieueWKYWb3zKXRfw1jVQbS3+2I
         VaONF2VOk7W36rvxUBLFoVgZl6i1VNgg11K6zhNUF73shEeOznA+Zm3cI126WBhQbHsR
         hjCGklGzt1z1xP61aWqbkWCIXD7cQjMgyFW74lvKNAqjE0bH0kKLEljukIRcCnl7kpgp
         SIemZiASpuSVnpDjHjqogJyYISkwHjydUR98SvidGgJdJrlav38GourHSTcyPJwgKoBd
         JJewjq7rMNk+fhfH+VUkNsSFasWbWSTm6Ymj5tM7Z8qnE8Dev5ZeGKJDsz12WWvTjePH
         ui0w==
X-Gm-Message-State: AOAM532QnRy2NiR1zsrSD0COrfAIzzlif3ngPc+2L3yZ+/nJQxxUCFvX
        B0Id2Obqgeu8Crv8uBCQ5VJlSArDk+P7CFfjnYikWQ==
X-Google-Smtp-Source: ABdhPJwxTRPFSADOuvrXeqzsYv1i7IsnlryBCVMraRG7Gf38jktjIDWGtBxokWM80IHU/g/5E3+ChsgR596COR7mFHk=
X-Received: by 2002:a25:ac52:: with SMTP id r18mr41442127ybd.25.1618310638808;
 Tue, 13 Apr 2021 03:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210409140806.31824-1-srinivas.neeli@xilinx.com>
 <20210409140806.31824-2-srinivas.neeli@xilinx.com> <CAHp75Vddd6ygr4mJ9Z+SuGZmfLcgDLWLZaxby2XE2mX8War-qQ@mail.gmail.com>
In-Reply-To: <CAHp75Vddd6ygr4mJ9Z+SuGZmfLcgDLWLZaxby2XE2mX8War-qQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 13 Apr 2021 12:43:48 +0200
Message-ID: <CAMpxmJW=HWf_NxGpfBkX=utgOTs4+6RtypxnKGtpuYnX=t8rGQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: zynq: use module_platform_driver to simplify
 the code
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Srinivas Neeli <srinivas.neeli@xilinx.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "shubhrajyoti.datta@xilinx.com" <shubhrajyoti.datta@xilinx.com>,
        "sgoud@xilinx.com" <sgoud@xilinx.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@xilinx.com" <git@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 10, 2021 at 12:08 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
>
>
> On Friday, April 9, 2021, Srinivas Neeli <srinivas.neeli@xilinx.com> wrot=
e:
>>
>> module_platform_driver() makes the code simpler by eliminating
>> boilerplate code.
>>
>> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
>> ---
>>  drivers/gpio/gpio-zynq.c | 17 +----------------
>>  1 file changed, 1 insertion(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
>> index 3521c1dc3ac0..bb1ac0c5cf26 100644
>> --- a/drivers/gpio/gpio-zynq.c
>> +++ b/drivers/gpio/gpio-zynq.c
>> @@ -1020,22 +1020,7 @@ static struct platform_driver zynq_gpio_driver =
=3D {
>>         .remove =3D zynq_gpio_remove,
>>  };
>>
>> -/**
>> - * zynq_gpio_init - Initial driver registration call
>> - *
>> - * Return: value from platform_driver_register
>> - */
>> -static int __init zynq_gpio_init(void)
>> -{
>> -       return platform_driver_register(&zynq_gpio_driver);
>> -}
>> -postcore_initcall(zynq_gpio_init);
>
>
>
> It=E2=80=99s not an equivalent. Have you tested on actual hardware? If no=
, there is no go for this change.
>

Yep, this has been like this since the initial introduction of this
driver. Unfortunately there's no documented reason so unless we can
test it, it has to stay this way.

Bartosz
