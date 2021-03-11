Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 501DC337C8B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 19:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbhCKSZM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 13:25:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:59406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230214AbhCKSYn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Mar 2021 13:24:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78CC964FBA;
        Thu, 11 Mar 2021 18:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615487082;
        bh=LLqLzhWdnxok5DUvrrOQtdyJlbSSW+8QR1bbI8CYBlM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kumijSRoty+JtAfLxQacL/8rhAVOjwq0WCiYvVvuI1QeEj6Sw5GXcsbZucl8FmGfs
         Q3HgLb3Z7tTXOfBb+XF/1EUXhvRbUrZEqjAfsx1FXXdOKs0sdB6y66InNGhK3lavqo
         UCh9cqimjmaKyR17Sb/Awhd8EOx9Hv5EjYM4dA1/Hy/WQhZrQnklUT5pYZlm6/uRrc
         sY2kFQEG63JHcL+LH/4fBNlojvxhTZoQT0XfJg6cGZNkdPS0+rLoBJe4FJB+knAFUY
         J9aWmxbYbmoLdsfwoqQNSf1jdDhbzItnbvqwsz+aDndPRvx4g8ifJzaHVPcb+3/sTL
         3hiblbN2pdfbg==
Received: by mail-ed1-f41.google.com with SMTP id i61so4267636edd.7;
        Thu, 11 Mar 2021 10:24:42 -0800 (PST)
X-Gm-Message-State: AOAM531ZYA62oBM6D/qSOi8smCw9si2AegC11dzMA0HDA+DxvshP+VTd
        8AZFju1ntssc0E+IVfau1yI4Tujmj+4X1ScLOw==
X-Google-Smtp-Source: ABdhPJw5ikUwneb4H6p8ZB8IoPDrdXlBIWUwvYgPRmdS0rgdwxxMrII3gdPBLn/6UQTl79dMIvdOpebnCsEZAJgfa0I=
X-Received: by 2002:aa7:c403:: with SMTP id j3mr9879781edq.137.1615487080829;
 Thu, 11 Mar 2021 10:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20210310125504.31886-1-noltari@gmail.com> <20210310125504.31886-4-noltari@gmail.com>
 <CAL_JsqKZA-j2iXvVTXWtiuyKPOWeOUP0r+x-bV6QP6=_moy2VA@mail.gmail.com>
 <CACRpkda=isBSW8BwYJ2pCaPcByRoo2GFNVoZCxhaCbEKk9iNsg@mail.gmail.com>
 <CAL_Jsq+FfYE2SrzwB_A=d-LMut-JrqdivKz6x8EQhkc3Zh5NAA@mail.gmail.com>
 <CACRpkdaMYy_Z34i+0uRgciC=xBtoeNsWViHU9ZysvxqrFXB5+w@mail.gmail.com> <edb31609-e138-9844-7168-004c882cae97@gmail.com>
In-Reply-To: <edb31609-e138-9844-7168-004c882cae97@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 11 Mar 2021 11:24:28 -0700
X-Gmail-Original-Message-ID: <CAL_JsqKSqQLUJB9OArwjtSgo5g4nPYLJFt+x54MwS+EHq0+Jww@mail.gmail.com>
Message-ID: <CAL_JsqKSqQLUJB9OArwjtSgo5g4nPYLJFt+x54MwS+EHq0+Jww@mail.gmail.com>
Subject: Re: [PATCH v6 03/15] pinctrl: bcm: add bcm63xx base code
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 11, 2021 at 10:00 AM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> Hi Rob and Linus,
>
> El 11/03/2021 a las 17:13, Linus Walleij escribi=C3=B3:
> > On Thu, Mar 11, 2021 at 3:58 PM Rob Herring <robh+dt@kernel.org> wrote:
> >> On Wed, Mar 10, 2021 at 6:09 PM Linus Walleij <linus.walleij@linaro.or=
g> wrote:
> >>> On Wed, Mar 10, 2021 at 6:51 PM Rob Herring <robh+dt@kernel.org> wrot=
e:
> >>>
> >>>>> +static const struct of_device_id bcm63xx_gpio_of_match[] =3D {
> >>>>> +       { .compatible =3D "brcm,bcm6318-gpio", },
> >>>>> +       { .compatible =3D "brcm,bcm6328-gpio", },
> >>>>> +       { .compatible =3D "brcm,bcm6358-gpio", },
> >>>>> +       { .compatible =3D "brcm,bcm6362-gpio", },
> >>>>> +       { .compatible =3D "brcm,bcm6368-gpio", },
> >>>>> +       { .compatible =3D "brcm,bcm63268-gpio", },
> >>>>
> >>>> All these would be moved to gpio-mmio.c (or maybe that can have a
> >>>> fallback compatible?).
> >>>
> >>> This is gpio-regmap.c and it can only be used as a library
> >>> by a certain driver. gpio-mmio.c can be used stand-alone
> >>> for certain really simple hardware (though most use that
> >>> as a library as well).
> >>
> >> I don't really care which one is used, but the problem is that this
> >> choice is leaking into the binding design.
> >
> > Aha I guess I misunderstood your comment.
> >
> >> The primary problem here is
> >> once someone uses regmap, then they think they must have a syscon and
> >> can abandon using 'reg' and normal address properties as Linux happens
> >> to not use them (currently). I think we really need some better regmap
> >> vs. mmio handling to eliminate this duplication of foo-mmio and
> >> foo-regmap drivers and difference in binding design. Not sure exactly
> >> what that looks like, but basically some sort of 'reg' property to
> >> regmap creation.
> >
> > I see the problem. Yeah we should try to be more strict around
> > these things. To me there are syscons and "other regmaps",
> > where syscon is a real hurdle of registers while "other regmaps"
> > are just regmaps by convenience.
> >
> > Documentation/devicetree/bindings/mfd/syscon.yaml
> > describes what a syscon really is so if everyone could
> > just read the documentation that would be great ...
> >
> >> Given we already have a Broadcom GPIO binding for what looks to be
> >> similar to this one, I'm left wondering what's the real difference
> >> here?
> >
> > Which one is similar? I can take a look.
>
> @Linus I think @Rob is referring to brcm,bcm6345-gpio:
> https://github.com/torvalds/linux/blob/a74e6a014c9d4d4161061f770c9b4f9837=
2ac778/drivers/gpio/gpio-mmio.c#L686

Well, since it's the bindings we're talking about:
Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.txt

Which says this:
"These bindings can be used on any BCM63xx SoC. However, BCM6338 and
BCM6345 are the only ones which don't need a pinctrl driver."

Not that the 1 in tree user of this is perfect. Seems like it too
should be a child of a system controller if there's other registers.

>
> However, the real difference between BCM6345 (and BCM6338) is that these
> SoCs have no pin controller at all, only a GPIO controller:
>
> BCM6345:
> typedef struct GpioControl {
>    uint16        unused0;
>    byte          unused1;
>    byte          TBusSel;
>    uint16        unused2;
>    uint16        GPIODir;
>    byte          unused3;
>    byte          Leds;
>    uint16        GPIOio;
>    uint32        UartCtl;
> } GpioControl;
>
> BCM6338:
> typedef struct GpioControl {
>    uint32        unused0;
>    uint32        GPIODir;      /* bits 7:0 */
>    uint32        unused1;
>    uint32        GPIOio;       /* bits 7:0 */
>    uint32        LEDCtrl;
>    uint32        SpiSlaveCfg;
>    uint32        vRegConfig;
> } GpioControl;
>
> BCM6348 and newer also have pinctrl.
> That's the main difference between that driver @Rob's referring to and
> the ones in this patch series.
