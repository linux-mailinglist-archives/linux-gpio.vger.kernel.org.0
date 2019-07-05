Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE37860630
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2019 14:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728782AbfGEMug (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jul 2019 08:50:36 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38018 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbfGEMuf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Jul 2019 08:50:35 -0400
Received: by mail-ot1-f65.google.com with SMTP id d17so8959263oth.5
        for <linux-gpio@vger.kernel.org>; Fri, 05 Jul 2019 05:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FIkr57DGKA3Q6AfbFJSXSoEMY5we+AeS4yYazxarf0U=;
        b=HWfTtuHJMeQk3WvwzFgJoUDwPeD2L4gyga5Xe0xi2YqSuTWn5BVGPJlg2A3PKVFSGs
         4NqeXFE/HRzmVmEWZ6HQDeUchtRIjOu4tN5al3dn9ALxyP5fhPhl8jcLvdUOEUMfN+lU
         8kfLtM6THhpejbrgtZcCTyiYN3vsG73/vXLuctjR1EZ9s9Q4QJ/YgkQngN5UiGgk2iJy
         deKfQDtBeUEaS7z9MRb11IE+Fndmb1bmjWv/ABhaBL/l2cIdVYzwWlbhxIhs+h/xsXNY
         rLa9VpMH+ncbm5BpfAHsXYaJYSqnYedT+E1MGkByGbH8uQQBwpIBhIG6Wr5jz9d5K2yn
         vaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FIkr57DGKA3Q6AfbFJSXSoEMY5we+AeS4yYazxarf0U=;
        b=UGT3kEG8kn+d1zGzO/vg1Kh3ao+muIxUBiAeq0CY0YjAJbwXNQnTDtTTjfilZC07bB
         ZIH94nUx8/V6gomyVrINdAfTblEy6vxS8jiUIo0mStVAaWiVK7tNkk6Odbe1I08mRjMq
         QAdo4CR0qFMdFUe99dl49tJUgND1HT1ASVU1HQu2lXQt/fcntm8K+nQxaTbjVwupQvkS
         AIkutiI7EORnTLwRfdCRyCxOhTGpYD2IR0mkeKdcFA3VCVCZuKedwiGSO8o52+c9sh/+
         9fALw8iePvr+qBA32fyBw7+yqHhRJm/MfKL2DNgJTIC1xHx6WFqEgbuykawEUrWjk3RO
         KtiQ==
X-Gm-Message-State: APjAAAVQYffqzuqomSoRfYOGQinlmV4gEk8uov8RtYwmwTpBkXampEbi
        kZtWhaELOAi2lKCqIbLnhDoPHHXSx3oODF3JITupCQ==
X-Google-Smtp-Source: APXvYqyj3P6SvTAvEnVCM85tldcabDwB2YoCwofDk7jcXord3thnCYIP7vt/wN10NBUwzFT3suk99YuEgagp0UNfLTY=
X-Received: by 2002:a05:6830:210f:: with SMTP id i15mr2713379otc.250.1562331035267;
 Fri, 05 Jul 2019 05:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190705093031.18182-1-michael.wu@vatics.com> <CAMpxmJUzaEREeUxCu2BCV12Huv7K=yeUSKntA5RGMfOQbnxaFg@mail.gmail.com>
 <5DB475451BAA174CB158B5E897FC1525920E9FD0@MBS-6F-DAG.vivotek.tw>
In-Reply-To: <5DB475451BAA174CB158B5E897FC1525920E9FD0@MBS-6F-DAG.vivotek.tw>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 5 Jul 2019 14:50:24 +0200
Message-ID: <CAMpxmJVQhTeMa1dA+3ikW0Lbsp0BSajN=tO3VcQ3_GLt-=8OOw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix incorrect IRQ requesting of an active-low lineevent
To:     Michael Wu <Michael.Wu@vatics.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, mvp.kutali@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 5 lip 2019 o 12:35 <Michael.Wu@vatics.com> napisa=C5=82(a):
>
> Hi Bartosz,
>
> For example, there is a button which drives level to be low when it is pu=
shed, and drivers level to be high when it is released.
> We want to catch the event when the button is pushed.
>
> In user space we configure a line event with the following code:
>
> req.handleflags =3D GPIOHANDLE_REQUEST_INPUT;
> req.eventflags =3D GPIOEVENT_REQUEST_FALLING_EDGE;
>
> and we hope to get "falling" events by reading the device node:
>
> while (1) {
>         read(fd, &dat,sizeof(dat));
>         if (dat.id =3D=3D 0) {
>                 printf("button pushed\n");
>         }
> }
>
> Run the same logic on another board which the polarity of the button is i=
nverted. The button drives level to be high when it is pushed.
> For the inverted level case, we have to add flag GPIOHANDLE_REQUEST_ACTIV=
E_LOW:
>
> req.handleflags =3D GPIOHANDLE_REQUEST_INPUT | GPIOHANDLE_REQUEST_ACTIVE_=
LOW;
> req.eventflags =3D GPIOEVENT_REQUEST_FALLING_EDGE;
>
> At the result, there are no any events been caught when the button is pus=
hed.
> By the way, button releasing will emit a "falling" event.
>
>
> Sincerely,
>
> Michael Wu

First: please don't top-post on the mailing list.

Second: have you even built the version you sent? Because I'm getting this:

drivers/gpio/gpiolib.c: In function =E2=80=98lineevent_create=E2=80=99:
drivers/gpio/gpiolib.c:963:4: error: =E2=80=98IRQ_TRIGGER_RISING=E2=80=99 u=
ndeclared
(first use in this function)
    IRQ_TRIGGER_RISING : IRQF_TRIGGER_FALLING;
    ^~~~~~~~~~~~~~~~~~

And third: after fixing the define, this indeed looks like a bug and
I'll need to add a test for that to libgpiod once it's upstream.
Strange we didn't catch it before.

Please send a fixed version and add a Cc tag for stable. Nice catch!

Best regards
Bartosz Golaszewski
