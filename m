Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8648332D7E4
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 17:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232882AbhCDQe2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 11:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238097AbhCDQeV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 11:34:21 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2368FC061756;
        Thu,  4 Mar 2021 08:33:41 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id w18so19313865pfu.9;
        Thu, 04 Mar 2021 08:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fKRKJCoCVwwFTODGuX4rs6ChueZgWGfVYbX4LTaEaw0=;
        b=CyLZEwJKOP+jXtRxwZQTJ6J7lLyomvTFeznOX2bPkweHCJbl9yTJujLH26kACPXHVX
         OevsfTWIncBc5YuoGBt1cx3AwOYhe0xNjedPzdjY0pPYpj25uiWagRvz7qVaHXrphOMv
         TF6MA/VnjhCqUH7GVckquC4H2FCDLgAJ3tD8PXUI6TXhoKTlq+RhIXcBBq1ubBk3k6Vd
         9TWFSSi2ew4qQZvENFikOhyM1bW3QCzlItI8BlRhmwVtTTIbMTfkTHxUTnT9icmlwgZB
         xSu8tjNBBvTRqPSGsmOR5ZUxnMoXGebZ9mP1i8HVGROblgQZz2ikCXbxidw9W0eroYhQ
         pCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fKRKJCoCVwwFTODGuX4rs6ChueZgWGfVYbX4LTaEaw0=;
        b=Vy/6MKwOs9ONGArieATAIvp8GgOai4RQscAtwSGKbHy09Aq6ALjE/DTYzS3Kh7E2O1
         p3OGPMrXtU2cHy20ineOf4wstS4tYJUTLGdqH4fzQ2L+SPQ+kjAkFTfswSOf5mItBZVX
         LSzyorUbsDTo9lefg4pHaP9Pl0zBfVYEq+GY4GWtdXc/b7J47IjXR3ZtHrKj/EBZhQ+n
         hAh8wJ5iTeVpfaBYH47Br9OhxmXUKzCnyamnhq6J8mFMjm2c0Ck4CH4oQsk/t3fKeo08
         BasnD+GG7wkTatRRhaKDOOs5T4q7Pr7pehTah2teRLMzWaJjCYFKrHg1pzVPm3r0ye7T
         p2Jw==
X-Gm-Message-State: AOAM531Q86+tc11Do37v/0jwPCPGqdgl2t+235WvVdpds6Sqn5BmzcUH
        uN0JV0gAxxYSzo5T3iLFIUQxWIvOl3KtEHFTYUAffTSpbyNYljij
X-Google-Smtp-Source: ABdhPJyg0eVPrkkjm9uxmWb2GtaW+mqFGmCfjxHgCuIp7ggu8O8pYa6FmqgXxBLltu6IzJkUv27fsQuaoKzi/rjito4=
X-Received: by 2002:a65:5ac9:: with SMTP id d9mr4302936pgt.74.1614875620533;
 Thu, 04 Mar 2021 08:33:40 -0800 (PST)
MIME-Version: 1.0
References: <20210304085710.7128-1-noltari@gmail.com> <20210304085710.7128-3-noltari@gmail.com>
 <CAHp75VcpGNaQDR5puEX3nTGOQC0vHNjCje3MLLynoBHdjEi0_w@mail.gmail.com>
 <9A8A595D-2556-4493-AA96-41A3C3E39292@gmail.com> <CAHp75VdJGh=Vy=kJr2CemPbSa-amYykNoYd0-jaz0utdC_bkbg@mail.gmail.com>
 <0504ADC2-0DD5-4E9E-B7DF-353B4EBAB6B4@gmail.com> <CAHp75VdkCxBeh_cWwN9dKRpEMntMp22yVjWRCuYumhMzrWi+SA@mail.gmail.com>
 <68F60F3F-33DD-4183-84F9-8D62BFA8A8F1@gmail.com>
In-Reply-To: <68F60F3F-33DD-4183-84F9-8D62BFA8A8F1@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Mar 2021 18:33:24 +0200
Message-ID: <CAHp75VdJ0=EewuHW2Ja5MQ=e9q0njGun8iN5Q6JWUxe=CLB=MQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/15] gpio: regmap: set gpio_chip of_node
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 5:44 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gm=
ail.com> wrote:
> > El 4 mar 2021, a las 16:28, Andy Shevchenko <andy.shevchenko@gmail.com>=
 escribi=C3=B3:
> > On Thu, Mar 4, 2021 at 5:24 PM =C3=81lvaro Fern=C3=A1ndez Rojas <noltar=
i@gmail.com> wrote:
> >>> El 4 mar 2021, a las 16:17, Andy Shevchenko <andy.shevchenko@gmail.co=
m> escribi=C3=B3:
> >>> On Thu, Mar 4, 2021 at 5:06 PM =C3=81lvaro Fern=C3=A1ndez Rojas <nolt=
ari@gmail.com> wrote:
> >>>>> El 4 mar 2021, a las 11:35, Andy Shevchenko <andy.shevchenko@gmail.=
com> escribi=C3=B3:
> >>>>> On Thu, Mar 4, 2021 at 10:57 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> >>>>> <noltari@gmail.com> wrote:
> >>>
> >>>>>> + * @of_node:           (Optional) The device node
> >>>>>
> >>>>>> +       struct device_node *of_node;
> >>>>>
> >>>>> Can we use fwnode from day 1, please?
> >>>>
> >>>> Could you explain this? I haven=E2=80=99t dealt with fwnode never :$
> >>>> BTW, this is done to fix this check when parsing gpio ranges:
> >>>> https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff3=
6dba370f797/drivers/gpio/gpiolib-of.c#L933-L934
> >>>
> >>> Use struct fwnode_handle pointer instead of OF-specific one.
> >>
> >> But is that compatible with the current gpiolib-of code? :$
> >
> > Yes (after a bit of amendment I have sent today as v2:
> > https://lore.kernel.org/linux-gpio/20210304150215.80652-1-andriy.shevch=
enko@linux.intel.com/T/#u).
>
> Well that doesn=E2=80=99t fulfill my definition of =E2=80=9Ccurrent gpiol=
ib-of code=E2=80=9D=E2=80=A6
> @Linus what should I do about this?

Well, fwnode is a generic, and I strongly against spreading
OF-specific code when we have fwnode working. But let's hear Linus
out, of course!

But it seems you are right and the library needs a few more amendments.

> >>> Also here is the question, why do you need to have that field in the
> >>> regmap config structure and can't simply use the parent's fwnode?
> >>> Also I'm puzzled why it's not working w/o this patch: GPIO library
> >>> effectively assigns parent's fwnode (okay, of_node right now).
> >>
> >> Because gpio regmap a child node of the pin controller, which is the o=
ne probed (gpio regmap is probed from the pin controller).
> >> Therefore the parent=E2=80=99s fwnode is useless, since the correct gp=
io_chip node is the child's one (we have pin-ranges declared in the child n=
ode, referencing the parent pinctrl node).
> >
> > I see. Can you point me out to the code where we get the node and
> > where it's being retrieved / filled?
>
> Sure, this is where the child node is searched: https://github.com/Noltar=
i/linux/blob/6d1ebb8ff26ed54592eef1fcd3b58834acb48c04/drivers/pinctrl/bcm/p=
inctrl-bcm63xx.c#L100-L109
> Then the gpio child node is probed and assigned here: https://github.com/=
Noltari/linux/blob/6d1ebb8ff26ed54592eef1fcd3b58834acb48c04/drivers/pinctrl=
/bcm/pinctrl-bcm63xx.c#L51

So, this is not (*yet) in upstream, correct?

So, why not to switch to fwnode API in that driver as well?

When you do that and supply fwnode thru the regmap configuration, in
the gpio-regmap we may assign it to of_node (via to_of_node() API).

> Basically, I based that part of the code on the ingenic pin controller: h=
ttps://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff36dba370f=
797/drivers/pinctrl/pinctrl-ingenic.c#L2485-L2491
> https://github.com/torvalds/linux/blob/f69d02e37a85645aa90d18cacfff36dba3=
70f797/Documentation/devicetree/bindings/pinctrl/ingenic%2Cpinctrl.yaml#L15=
5-L176

This doesn't use remgap GPIO.

--=20
With Best Regards,
Andy Shevchenko
