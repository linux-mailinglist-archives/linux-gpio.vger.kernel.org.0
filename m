Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3469929460
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 11:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389864AbfEXJRP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 05:17:15 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42808 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389745AbfEXJRP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 05:17:15 -0400
Received: by mail-lf1-f68.google.com with SMTP id y13so6558287lfh.9
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 02:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MQNAZ2qpcerEvwA34HiaREcIaqtFT4giJ0gziFwgnU4=;
        b=J+X9xSnl4BIQvSLLO+SvCj3CZv19Aw7rcBirRTZtbNQGrSoMiAZ+QeWRmpfTLvK5SI
         nF+TkOmYoyoh5yZCyPXqKdtISy8OLwnbnfXPpIEszISmeTAsoHsGqxxsCHlLyQk2FUxE
         ncWjZgFlgNwVK8JqW6QZzRqdAzfSysYBShcPS2EUpT7Z7WcPZvjaNJ92KsJUQa6dL/es
         aEMhKW1JdXsBn2Zqf7oASyAc9NIhwFZlFRHysgZCK2XqHx9mKXjlqFn805pTbseKSSOd
         62za/mG/T+kxlbn0jgxGV1j5a34Z5puz1doKDlmMn7/6PtPpTNP/ozR/+bS60hlVLnbu
         GhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MQNAZ2qpcerEvwA34HiaREcIaqtFT4giJ0gziFwgnU4=;
        b=h1TOWdOp9EN1+c/gN1NuYQRPyXtgdqfcrmfJavS+SezH+lI7QcFX6jX9y8Qh3eDTqT
         pILr0RYxx2e/J+IPMvCvTIJS7Famz94M0Y1b/cd53ckIHl37eeSHl1KBYcg3iTIfDgAm
         RN8NiB8NdjvHeujGc49WE+BOnici/JjjG+SPCFeaK1VO2GFAPjVHgnh7jElyaSheR+8W
         IisLErFWzXgK1GR4RxaSQIVnH37j6V0JB27eUqM7mg6qeL6O5CP3CQjVeEKvC88P6rCd
         Tq/lBiiGu6EPfkUkJiKEoVKRjD6bAhcJAH+pmIExnNVCOQT8dorEjcx24RAJfwsP+xPs
         9h3g==
X-Gm-Message-State: APjAAAV5vpz2SNgjLtdpuEUlh9ULmow+RcFBZ1YLw6E7Oug5gFLEmjsO
        IREz9p/0VmI0x9LRBbZ8N1r4V7WvSZCWnkGRpL0xnA==
X-Google-Smtp-Source: APXvYqwhFZnoWeef1nj+ibv3/z3Wdour3IMfS4Mk2lrPJTMx/qF2SwhC16rn6xiFF+4gJffu8ObxgV8//sWIKgFDgkQ=
X-Received: by 2002:ac2:4919:: with SMTP id n25mr4948262lfi.114.1558689433090;
 Fri, 24 May 2019 02:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <8054bec0-ea24-8590-738b-bae58c0be3b4@infradead.org>
In-Reply-To: <8054bec0-ea24-8590-738b-bae58c0be3b4@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 11:17:00 +0200
Message-ID: <CACRpkdahhJbvZw+2eQr3hFxYED94f42maOnmVKVhB6mSEKUkVw@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix gpio-adp5588 build errors
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 24, 2019 at 12:00 AM Randy Dunlap <rdunlap@infradead.org> wrote=
:

> From: Randy Dunlap <rdunlap@infradead.org>
>
> The gpio-adp5588 driver uses interfaces that are provided by
> GPIOLIB_IRQCHIP, so select that symbol in its Kconfig entry.
>
> Fixes these build errors:
>
> ../drivers/gpio/gpio-adp5588.c: In function =E2=80=98adp5588_irq_handler=
=E2=80=99:
> ../drivers/gpio/gpio-adp5588.c:266:26: error: =E2=80=98struct gpio_chip=
=E2=80=99 has no member named =E2=80=98irq=E2=80=99
>             dev->gpio_chip.irq.domain, gpio));
>                           ^
> ../drivers/gpio/gpio-adp5588.c: In function =E2=80=98adp5588_irq_setup=E2=
=80=99:
> ../drivers/gpio/gpio-adp5588.c:298:2: error: implicit declaration of func=
tion =E2=80=98gpiochip_irqchip_add_nested=E2=80=99 [-Werror=3Dimplicit-func=
tion-declaration]
>   ret =3D gpiochip_irqchip_add_nested(&dev->gpio_chip,
>   ^
> ../drivers/gpio/gpio-adp5588.c:307:2: error: implicit declaration of func=
tion =E2=80=98gpiochip_set_nested_irqchip=E2=80=99 [-Werror=3Dimplicit-func=
tion-declaration]
>   gpiochip_set_nested_irqchip(&dev->gpio_chip,
>   ^
>
> Fixes: 459773ae8dbb ("gpio: adp5588-gpio: support interrupt controller")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Michael Hennerich <michael.hennerich@analog.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org

Patch applied for fixes.

Yours,
Linus Walleij
