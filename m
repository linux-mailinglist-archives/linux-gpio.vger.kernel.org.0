Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8433A337650
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 15:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233959AbhCKO6k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 09:58:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:34154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233892AbhCKO6K (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Mar 2021 09:58:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5BF365004;
        Thu, 11 Mar 2021 14:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615474689;
        bh=aR7DpbxtFxIv6MnyvAR0dkFIyBYC2zBruNgZfrrgUNA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TgEMAJIlEbN2J5HLzWhN9/87u5D4Q0nZ6RZbTEg/JMV78EZ6Q1dGV+t0Ku8GqGKgU
         YqvyR4Gv3ESqThUbYirxvMipBX6NVoJwelDws2D0Udx6zPLVo14kcR8np1mTjEgZ7U
         5Ot/ttH5KBt1pofDogLL926DQ+gCFxl4D6t4ysZuecfcTxsIGgPmBHLtBG+CFN/SZ7
         ZdR/9mOR7wjOLUoSZsjSwzOgceYilLKBp8uE9etyQztpnk1JV9DJSc/eVxD7wEwivk
         sVYQ4wAXwIKWE82G8X/rmsC35TSRhUzTLNpxiWOxGfP/X803VSB4EUmjychQdZbBjC
         GNA6CGoEXEqvA==
Received: by mail-ej1-f54.google.com with SMTP id lr13so46827837ejb.8;
        Thu, 11 Mar 2021 06:58:09 -0800 (PST)
X-Gm-Message-State: AOAM531TgpRiwRyGEs8L+PTkuadOVNWfQo3rclC7KAtTRPFV884rq6zj
        kFgFEXZUJUcAQlh6qq4d0CUwXCteqCnZqW5Xrg==
X-Google-Smtp-Source: ABdhPJwmSElZbRkcCnb9ZIBKPYqZtpmKLVr22hQeCKoWIRKJZm1MtHyWE2xBEn1f56xsjbunT+wQbtX3GPFTYkhU+us=
X-Received: by 2002:a17:906:25c4:: with SMTP id n4mr3463796ejb.359.1615474687893;
 Thu, 11 Mar 2021 06:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20210310125504.31886-1-noltari@gmail.com> <20210310125504.31886-4-noltari@gmail.com>
 <CAL_JsqKZA-j2iXvVTXWtiuyKPOWeOUP0r+x-bV6QP6=_moy2VA@mail.gmail.com> <CACRpkda=isBSW8BwYJ2pCaPcByRoo2GFNVoZCxhaCbEKk9iNsg@mail.gmail.com>
In-Reply-To: <CACRpkda=isBSW8BwYJ2pCaPcByRoo2GFNVoZCxhaCbEKk9iNsg@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 11 Mar 2021 07:57:55 -0700
X-Gmail-Original-Message-ID: <CAL_Jsq+FfYE2SrzwB_A=d-LMut-JrqdivKz6x8EQhkc3Zh5NAA@mail.gmail.com>
Message-ID: <CAL_Jsq+FfYE2SrzwB_A=d-LMut-JrqdivKz6x8EQhkc3Zh5NAA@mail.gmail.com>
Subject: Re: [PATCH v6 03/15] pinctrl: bcm: add bcm63xx base code
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>,
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
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 10, 2021 at 6:09 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Mar 10, 2021 at 6:51 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> > > +static const struct of_device_id bcm63xx_gpio_of_match[] = {
> > > +       { .compatible = "brcm,bcm6318-gpio", },
> > > +       { .compatible = "brcm,bcm6328-gpio", },
> > > +       { .compatible = "brcm,bcm6358-gpio", },
> > > +       { .compatible = "brcm,bcm6362-gpio", },
> > > +       { .compatible = "brcm,bcm6368-gpio", },
> > > +       { .compatible = "brcm,bcm63268-gpio", },
> >
> > All these would be moved to gpio-mmio.c (or maybe that can have a
> > fallback compatible?).
>
> This is gpio-regmap.c and it can only be used as a library
> by a certain driver. gpio-mmio.c can be used stand-alone
> for certain really simple hardware (though most use that
> as a library as well).

I don't really care which one is used, but the problem is that this
choice is leaking into the binding design. The primary problem here is
once someone uses regmap, then they think they must have a syscon and
can abandon using 'reg' and normal address properties as Linux happens
to not use them (currently). I think we really need some better regmap
vs. mmio handling to eliminate this duplication of foo-mmio and
foo-regmap drivers and difference in binding design. Not sure exactly
what that looks like, but basically some sort of 'reg' property to
regmap creation.

Given we already have a Broadcom GPIO binding for what looks to be
similar to this one, I'm left wondering what's the real difference
here?

Rob
