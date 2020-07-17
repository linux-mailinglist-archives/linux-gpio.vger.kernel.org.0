Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11FC122389F
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 11:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbgGQJpj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 05:45:39 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:41491 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgGQJpi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 05:45:38 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MScox-1kOb383cC1-00Sy3v; Fri, 17 Jul 2020 11:45:35 +0200
Received: by mail-lf1-f50.google.com with SMTP id o4so5683698lfi.7;
        Fri, 17 Jul 2020 02:45:35 -0700 (PDT)
X-Gm-Message-State: AOAM533tvq457Cf23uamqChMxdeKLB5VC+83VnKdM/hGLbnEWB8sNSNG
        5xhAbkD+jG9pM+SkDrPHF9ztHGfzF+nVPurpbj8=
X-Google-Smtp-Source: ABdhPJyFXFxPBPYqoAj3/EvTaOGJNqDDWY0LUGcDAcRa1UgsHHGCiywONxN/6LjRhwmrijWD/0vh4LSLU+1CUo9SQh4=
X-Received: by 2002:ac2:51a1:: with SMTP id f1mr4321885lfk.173.1594979135271;
 Fri, 17 Jul 2020 02:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <1594912013-20859-1-git-send-email-Anson.Huang@nxp.com>
 <c00f8fe3-d12a-0f91-c301-c028e5aa3f25@nxp.com> <DB3PR0402MB3916C9FE00C0F4FC62ACB711F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <5e2af0c3-c832-3978-017e-0b1649aac61c@nxp.com> <DB3PR0402MB3916AAEE01257A7F9A25A657F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <c27109aa-280f-db0d-980b-fbd735bab0a6@nxp.com> <DB3PR0402MB3916A84BEF5EEC327EE35180F57C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB3916A84BEF5EEC327EE35180F57C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 17 Jul 2020 11:45:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a256uR0zZn9ew9UoDqP51MdA4emCfMoZuPW6n9MqD5vPQ@mail.gmail.com>
Message-ID: <CAK8P3a256uR0zZn9ew9UoDqP51MdA4emCfMoZuPW6n9MqD5vPQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as module
To:     Anson Huang <anson.huang@nxp.com>
Cc:     Daniel Baluta <daniel.baluta@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:MMqpq/ueeUL6ndfSlPVSvEbpeh7x6jxWTcgoG2cFbk5ArIe+pIl
 Bie/CK2fby81Je/1s+rE5ndSo7ACA93wo+vZm0V9/lJq50J1DlXFW0CDZg6J/UMN7y97C45
 SkJKX5G3jddNM7LLcmfGC0+1oZVoKOqqljApetsWy/u8w8/lPaGGcd3D2cfKdDsij+M2C05
 g057VNevSkP9MYXihEW5g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SrFhWt74psc=:59DJ4ruSghMgT5hBUKbOcd
 IJGRXA0ZCBuvurZa3QPluIjRTvk2KZSIL8P8fz9bxq3S51LOpkMuAj0I+yWDIDcBPf11Q6FHx
 mqWenOq56jtXNHWw1RtIuZ84Zu+QocoKIj5vcI1nGCjDMjUcRkZ9QgCgFcUSmL6oaf1k6a6Yc
 OJjGdm3j3fmIUCotyH88GRV1Sf7u79xNJCHLrlgL+TqmSAaiepEcgBICN6VqrDOX4uP7xtMS6
 3o8nf5WJTfdYL8SogjgdCOuj/M7P8iShBOC1q8/inFj+dANZA0FxevpK0pi9OtXWNkYf+vF3m
 eHK1MayqcpYqj+WnbcrqMpcNHSJuw0chXVkEXM+nr3D6IxkPtiytlY69lEaP4xhJ01Zw1SKLw
 YavJiBg8pOG3P12WgF8tQ85irursBCFe5VMqDrA5peg0Mjhn1ZCbtuTG3nZEo43A0VOvWvLIr
 eIT0PsYCeTnG4gB/oB7nGVzTXgEPC5XBMyqqs+d+/WaRPMgMnkMHtY1aHjV7OVGM9A9VU6Ym+
 9QZrKedH8n7XHai+MMJO6lZJqlKSpWKGrh4BDOOgiX11WYkaeQ1WciMRKuzaAOj6/Sno4CjfZ
 QP7JW/f0V98lnSj8QfxotCZT6b1LuYuyp268tA0dtFCRg74gphzVvKDuolP66rQyH2gjXKYOz
 N6P/2n5FAs2Hfn2x7s3ZOKpu7TbjkMgt8TW123ZY91W0fC9RhZvRPRRQFpBmDVoOvfMS3vEQG
 9kuxttpNQwuFLLIW11HZrimuYZ4QJPGec/F6lSMv9XpF7L3RRh14Y3Z5L13TO5o3/oQuZFxEX
 wpl+6UxUxxXr784ONYcxNh4oJtyYMuEQSKh3KRILmNBDOXCrGjX+tJTNL1+LnB2/nNN71Lg
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 11:24 AM Anson Huang <anson.huang@nxp.com> wrote:
> > Subject: Re: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as module
> > +MODULE_AUTHOR("Dong Aisheng<aisheng.dong@nxp.com>");
> > +MODULE_DESCRIPTION("NXP i.MX SCU common pinctrl driver");
> > +MODULE_LICENSE("GPL v2");
> >
> >
> > This can be in a separate patch.
>
> I don't understand, without adding module license, changing the SCU pinctrl driver
> to "tristate", when building with =M, the build will have warning as below, so I think
> it does NOT make sense to split it to 2 patches.
>
>   CC [M]  drivers/pinctrl/freescale/pinctrl-scu.o
>   MODPOST Module.symvers
> WARNING: modpost: missing MODULE_LICENSE() in drivers/pinctrl/freescale/pinctrl-scu.o
>   LD [M]  drivers/pinctrl/freescale/pinctrl-scu.ko

I agree it would be clearer to do it as separate patches, but you then
have to be careful about the order to avoid the problem you mention.

A clear indication that it may be sensible to split up the patch is that
your changelog has a list of five items in it, which are mostly doing
different things. The ideal way to split up a patch series is to have
each patch with a changelog that has to explain exactly one thing,
and makes it obvious how each changed line corresponds to the
description, but never explain the same thing in more than one patch
(i.e. you combine patches that do the same thing in multiple files).

In this case, a good split may be:

patch 1:
   - Use function callbacks for SCU related functions in pinctrl-imx.c
      in order to support the scenario of PINCTRL_IMX is built in
      while PINCTRL_IMX_SCU is built as module;
    - All drivers using SCU pinctrl driver need to initialize the
      SCU related function callback;

patch 2:
    - Export SCU related functions and use "IS_ENABLED" instead of
      "ifdef" to support SCU pinctrl driver user and itself to be
      built as module;
    - Change PINCTR_IMX_SCU to tristate;
    - Add module author, description and license.

and then rewrite the description to not have a bulleted list.

That said, I don't think it is critical here, and I would not have
complained about the version you sent.

If you end up changing the patch, I think you can actually drop
the "#if IS_ENABLED()" check entirely, as the functions are
now always assumed to be available, and we don't #ifdef
declarations when there is no #else path otherwise.

       Arnd
