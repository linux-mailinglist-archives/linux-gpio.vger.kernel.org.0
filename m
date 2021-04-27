Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA9636C123
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Apr 2021 10:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbhD0IkI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Apr 2021 04:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbhD0IkH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Apr 2021 04:40:07 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD9CC061574;
        Tue, 27 Apr 2021 01:39:23 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id c19so4982451pfv.2;
        Tue, 27 Apr 2021 01:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WbD3QVbXZu3WNT1Bk5QSK4arbQcsJJhMykackKFFxrs=;
        b=LMCCQWlhSuuqDiNjoQlZFEsiCaZD5ahO6hrZdrZ1vLgzmHjYaQwTpd3I5JV4kOHo3B
         Dt7fbmaM4y2YRG/2ep+RMdGS6Ug5/wSikua5SkBJ8EiJjgh683WLHPrnST0yj3DMY6cf
         kxXdpvriQHWq16JpjtYQDqIZXgFtDwDbEKmazJkGrvCgZFQDoIOI4Qrws62nqikDfi9C
         sDTlb9+8O3Ho5aVzQxJ7nJQcAo8FIi1Sp8gdqhBLBZgqcwFY8htPLW1HW8GsqP2K36QI
         vNx6VCG9hPXtO8sdaiq690Qn5hVM3NqG+7AdzkMlhxV8BipkqY32Sa5vJJlG0rMgqTqU
         880A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WbD3QVbXZu3WNT1Bk5QSK4arbQcsJJhMykackKFFxrs=;
        b=NhZf45/hL4wJigpOD0qh+FjgHO+0WJYSKbTbO4PQGSOkK2uj+Xh5kvAC2Anf5m/WAt
         qqwAuhkdKTn5SULAh6BycMzF30mvuQJngxlh08KnnfUOpHzV59BMS3tyc5aPSzvHSlDs
         PMsTkNjVydM5yg7FkJ1//+IH+6SnV7OySPLBUs+xxg/Sh90OSH+17PhXi9mljOTdIaHs
         cCHxZduCPE4Ah/lLBNbFcOfWxlF4cd1fWbuNUarALyAGFx52qyGDOW4AYyFDdgx+4/CY
         EIKEmgDGPoVOwHSqJHd1QMEZYBaSR3Tm0YA/nAAUxlqhtte2HP+YNBc0dSw96/4VtW3a
         FB2A==
X-Gm-Message-State: AOAM533z/rY7ckT/UCkOOe3jSFP2+0kfA3WiCnz6rD03c84WAaOTh/QD
        Df/C7vPJj6d+ziXrL8wEAZN/KAO7eNDmINjl7H0=
X-Google-Smtp-Source: ABdhPJwBTRVgWc9tF+yqjNvYtqkQUx6Ee/MwFxPcbVWb/QYygiRoBKQmN8ENn07b7VZqh8TVAYoYcCj/SUuDJM1DPPk=
X-Received: by 2002:a65:5a4d:: with SMTP id z13mr20821633pgs.4.1619512762749;
 Tue, 27 Apr 2021 01:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1619080202-31924-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VfCbbnN-TBJiYFb=6Rhf30jA-Hz1p1UORsubF7UG6-ATw@mail.gmail.com>
 <DM5PR02MB3877B234F85F3B4887DF3A95BD429@DM5PR02MB3877.namprd02.prod.outlook.com>
 <CAHp75VfugGqLNU8LKJ_K3dPr=-eh6LHx75eV=33jH9OnryBoGA@mail.gmail.com>
 <d1220d39-4be4-a375-042f-e7bb0264ed35@xilinx.com> <CAHp75Vejqe3r6s5eoOfza0DjXEwN-hK73FWkxx6VNpx0y1ms2w@mail.gmail.com>
 <180ca47b-d627-2d7b-1d18-5557bfcf5875@xilinx.com>
In-Reply-To: <180ca47b-d627-2d7b-1d18-5557bfcf5875@xilinx.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 27 Apr 2021 11:39:06 +0300
Message-ID: <CAHp75Ve1MY6wms7d1e2cByzV0Zy-rRs-qNMk=6X_fw=zu4rbgw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Sai Krishna Potthuri <lakshmis@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 27, 2021 at 10:38 AM Michal Simek <michal.simek@xilinx.com> wro=
te:
> On 4/27/21 9:31 AM, Andy Shevchenko wrote:
> > On Tue, Apr 27, 2021 at 10:23 AM Michal Simek <michal.simek@xilinx.com>=
 wrote:
> >> On 4/26/21 4:04 PM, Andy Shevchenko wrote:
> >>> On Mon, Apr 26, 2021 at 4:20 PM Sai Krishna Potthuri
> >>> <lakshmis@xilinx.com> wrote:
> >>>>> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> >>>>> Sent: Friday, April 23, 2021 9:24 PM
> >>>>> On Thu, Apr 22, 2021 at 11:31 AM Sai Krishna Potthuri
> >>>>> <lakshmi.sai.krishna.potthuri@xilinx.com> wrote:

...

> >>>>>> +       help
> >>>>>> +         This selects the pinctrl driver for Xilinx ZynqMP platfo=
rm.
> >>>>>> +         This driver will query the pin information from the firm=
ware
> >>>>>> +         and allow configuring the pins.
> >>>>>> +         Configuration can include the mux function to select on =
those
> >>>>>> +         pin(s)/group(s), and various pin configuration parameter=
s
> >>>>>> +         such as pull-up, slew rate, etc.
> >>>>>
> >>>>> Missed module name.
> >>>> Is this (module name) a configuration option in Kconfig?
> >>>
> >>> It's a text in a free form that sheds light on how the module will be
> >>> named in case the user will choose "m".
> >>
> >> Is this described somewhere in documentation that module name should b=
e
> >> the part of symbol description? I was looking at pinctrl Kconfig and I
> >> can't see any description like this there that's why I want to double
> >> check.
> >
> > I dunno if it is described, the group of maintainers require that for s=
ome time.
> > I personally found this as a good practice.
>
> I don't think it is a big deal to add it but it is a question if this
> information is useful because module names should correspond target in
> Makefile which can be considered as additional information.

For you as a *developer* =E2=80=94 yes, for me as a *user* =E2=80=94 no. Yo=
u are
telling me something like "hey, if you want to know more you must dig
into kernel sources". No, this is not how we should treat users,
should we?


> >> Also if this is a rule checkpatch should be extended to checking this.
> >
> > There was a discussion at some point to add a check that help
> > description shouldn't be less than 3 lines. Not sure what the outcome
> > of it.
>
> This check is likely there because I have definitely seen these messages
> coming but never seen any name checking.

Yeah, it was about insisting developers to be more verbose in the help
descriptions, but the name is, as I said, an activity "de facto"
rather than "de jure". Just look around for the latest new driver
contributions (I follow IIO, I2C, SPI, GPIO, pin control) for how they
provide their help descriptions (I admit that not everybody follows
that practice).

--=20
With Best Regards,
Andy Shevchenko
