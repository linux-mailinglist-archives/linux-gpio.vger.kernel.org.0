Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 558412DB0C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2019 12:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfE2KvF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 06:51:05 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:37172 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbfE2KvF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 May 2019 06:51:05 -0400
Received: by mail-it1-f194.google.com with SMTP id s16so2760409ita.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 May 2019 03:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3LAgcjR7era76837ZVupJ1O8SoQVeLnh8cZfpeylJLY=;
        b=EEG1HaatyVgH65b4dDbncceMTfLGdSGuXy3aR3ymfnN10mD1HnXAioDuMpjBF390dy
         BGUI4mcrWKlfljrBm6+oAeE6NOJ/LLWkfpmRKOKwbR1pwNSe99mQJ7hF/Vd2fC2LhQ+c
         QX8iPPaVGNyw+AtmTQ/xbVzsmCZW7Yrgdt2jXdIHAkax/onBAkcIN00lFOnLQtn/N++I
         CYDKIqMzCi1ZujkbKqgkWi8ERRlsP4rvL4jxPZ/Lk9vVh4H1+KLSANN30Gsot4GJ1ebB
         Mjy1nYTClXsu3oYHoh9eCNGACkfHs1grNeKctK0VRNXKKhRCEsT8UmQrHs+f9PKg95vU
         Z7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3LAgcjR7era76837ZVupJ1O8SoQVeLnh8cZfpeylJLY=;
        b=h/aA65Lv8HGEHOIvWb/skvxmMSJqxBqz5Jl4lD0EaZzoDX0p5/qZHyNojwwoZZ5ZB5
         r2Kva+WVGuBqJ8EgG8/bDKaYC3OIHi4gPHuFKBuue4vxH5EKjd3kFUPRyVlRT36eHBNS
         7u1g+I+21zYSPYH2Ql1NC8hVRVLNJg1UmrusERfKTxTczpyaEdgZA3Xf6pZfFq3nTprs
         PD6nOByn3HjuVo0tb9SuYirSB5pjUn3UVRtCjKI2TtFHJDDBWiw1aQFrH4PWbrB/+Yqs
         rXo+Bf+QPAzOMSbuM3q8FyXSyD3cQ4GNVkyYLHNSXq+z3JNqt70waYiuSwRwTW7B97mK
         aofQ==
X-Gm-Message-State: APjAAAUFUvZVtBypPXLTePeDhPQ5YfrzqD4Ua2kcUxCSf+3grS36vyRG
        /m7Vi9OLEkfEkdg+Wd6EYWtU1Cn3Wo+mKj+wWFql3sLmwxY=
X-Google-Smtp-Source: APXvYqw7rzjT8QDzUeqqM6KMIsW4kP6oMm7U8AcW9PA716fmjdAA2zox27Ha8YQxOL1CTcIXB4QKLXBnckJa9XyN9Ys=
X-Received: by 2002:a24:1614:: with SMTP id a20mr501136ita.153.1559127064365;
 Wed, 29 May 2019 03:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190529101342.30673-1-ard.biesheuvel@linaro.org> <20190529102747.GI2781@lahna.fi.intel.com>
In-Reply-To: <20190529102747.GI2781@lahna.fi.intel.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Wed, 29 May 2019 12:50:51 +0200
Message-ID: <CAKv+Gu_N2OC6mMcpvmz+gqa2cNaCf+ALe-tc0z+s4kDDi1RK3w@mail.gmail.com>
Subject: Re: [RFC PATCH] gpio/acpi: set direction for ACPI OpRegion GPIOs
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 29 May 2019 at 12:27, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Wed, May 29, 2019 at 12:13:42PM +0200, Ard Biesheuvel wrote:
> > The ACPI GPIO OpRegion code never sets the direction for GPIOs that
> > it configures from scratch, leaving unconfigured GPIOs to be left
> > at the default direction, which is typically input not output.
>
> The code does:
>
>   enum gpiod_flags flags = acpi_gpio_to_gpiod_flags(agpio);
>
> before it requests the GPIO. Isn't that sufficient?

Yes, it works if I set the PullXxx value explicitly in the GpioIo() resource.
