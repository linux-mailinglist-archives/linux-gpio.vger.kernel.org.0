Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80AFB219BAB
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 11:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgGIJIB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 05:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbgGIJIB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 05:08:01 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08FF1C061A0B;
        Thu,  9 Jul 2020 02:08:01 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id b92so825040pjc.4;
        Thu, 09 Jul 2020 02:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=j3K2X3/RiGy249KpzJwq9E4MvMleCWKUqV6iVngTkS8=;
        b=SQJbLNgzhdKt01fp9fZPyoHqwU8+UpC+a7O8V/WpWkH1DDIXjYR5B0pHn2nHngRHlN
         JDA0G4ruUCz6wrkNDFJ/UXDGC/MGMbEKQvNqNMUQtbppd7zxbZ1j3sKY1LDkCVa/sYH4
         tCL6+mtsYBneYv1EC4wtcBr8Zk81brcr1HUJBuTct2diJ4kI9ZcwfBHsUMGPPGxecnvj
         xGOUC9XtQglTlZSo7k0PAMc7GVn9PmWxb4wq2TYYuxHwYkBn2Fb620VVwnxuLa5QF6BS
         o9Z2OfqVrOBg8F9xuQN08N6fs4GOAgCgCRo35vGx4myODcTCjcRXUZunFCdzt+GdGgI1
         0+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=j3K2X3/RiGy249KpzJwq9E4MvMleCWKUqV6iVngTkS8=;
        b=otz9GeoB71fI9MyukEnbuVYfY0miIZp03Cp2dgjv5qdLD/U8zrM7S9s6E4+/20ZsB/
         8CsJJpZBr3tNzeU9rinS+0lfVWg6AoITPmO+g9N+u/CQGjbhgiAsCT9dgLDQqmB7iUJp
         4fXjISMGxaYFtOX54xF7v2EakRjyGuqx3we6904gP6EnyyOnM+QRtpXGSExxlcL+jMAN
         Vw05TFQex18KJtodjQgojhf9bbv6DMhB0wYBzWBxledVHfe9Vm24m2u2HdqWl8n/xl5i
         eJ0GN0EoSTlM7ayvaVWgdaPXxb65/jxJ6AB1wwLfSMpU12Nej5/snTM8gwTkVPEgyHUj
         1O+g==
X-Gm-Message-State: AOAM533YWTHKEvlfZfuguMqnuckZPlZNGoDPVVCSKbeodnTfXmsKBmjB
        RzLOO5OLdDA3NVzrUpCkdXAwF1wT3mCZhOT+VII=
X-Google-Smtp-Source: ABdhPJwRtV0Jd7qJCGSCXF3A+Ex2/kk91xx8MhsUVXW+KUq9GprPICkkSO6Biphls5J1Y9iAFKqSpeUZLPlRTZx2L+g=
X-Received: by 2002:a17:90b:3547:: with SMTP id lt7mr13725161pjb.181.1594285680452;
 Thu, 09 Jul 2020 02:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200708202355.28507-1-digetx@gmail.com> <20200708202355.28507-4-digetx@gmail.com>
 <CAHp75VejftNuSqdYvd1YE1SdRON6=mQ_iD2dEr4K9D8YGgeRBQ@mail.gmail.com> <675c4691-d372-4fe1-d515-c86fdba2f588@gmail.com>
In-Reply-To: <675c4691-d372-4fe1-d515-c86fdba2f588@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Jul 2020 12:07:44 +0300
Message-ID: <CAHp75Vd89QpwaGvkpzG+pxnLd8S2guPCARLW5xPwhxXL8ZRfFw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] gpio: max77620: Don't set of_node
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 9, 2020 at 12:44 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> 08.07.2020 23:57, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wednesday, July 8, 2020, Dmitry Osipenko <digetx@gmail.com
> > <mailto:digetx@gmail.com>> wrote:

...

> > I gave a second look and I think my suggestion is wrong. Here is an
> > interesting propagation of the parent device node to its grand son,
> > leaving son=E2=80=99s one untouched. Original code has intentions to do=
 that way.
>
> The [1] says that gpio_chip.parent should point at the "device providing
> the GPIOs".

Yes, physical device I believe.

> That's the pdev->dev.parent in the case of this driver.
> MAX77620 is an MFD PMIC device that has virtual sub-devices like GPIO
> controller, PINCTRL and RTC. The MFD is the parent device that provides
> the GPIOs [2].
>
> [1]
> https://elixir.bootlin.com/linux/v5.8-rc3/source/include/linux/gpio/drive=
r.h#L276
>
> [2]
> https://elixir.bootlin.com/linux/v5.8-rc3/source/arch/arm64/boot/dts/nvid=
ia/tegra210-p2180.dtsi#L48
>
> I think the old code was wrong and this patch is correct, please correct
> me if I'm missing something.

Hmm... I have checked through GPIO drivers I have knowledge of / care
about and PMIC ones do like you suggested in this patch, the rest
(which are instantiated from MFD) take a virtual platform device.

Looking at DT excerpt I think you're rather right than wrong, so I
leave it to you and maintainers.
Thanks!

--=20
With Best Regards,
Andy Shevchenko
