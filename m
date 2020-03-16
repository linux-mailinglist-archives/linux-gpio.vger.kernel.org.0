Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3EF186613
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2020 09:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730024AbgCPIFf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Mar 2020 04:05:35 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:51631 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729745AbgCPIFe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Mar 2020 04:05:34 -0400
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MfYDO-1jpHQi43i4-00fy0Q; Mon, 16 Mar 2020 09:05:33 +0100
Received: by mail-qt1-f170.google.com with SMTP id l13so13339604qtv.10;
        Mon, 16 Mar 2020 01:05:32 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3SHLogusaAsBjNcX+ufaupENI1ADQCk2SLjDz+X2WSE1EEXOqx
        laZWC0J20bnXBsrzBw6aMz58ZARaZ9k8PyP1L4I=
X-Google-Smtp-Source: ADFU+vscHuj0T93JjgojfKfyFtbyqwhr+FzDIfyfzVkaoXDOWQcAs9KVhaCUmDBS62IUcGSpwhk7Bx9472iMoIVCU1o=
X-Received: by 2002:ac8:5193:: with SMTP id c19mr23911589qtn.204.1584345931621;
 Mon, 16 Mar 2020 01:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <1584070036-26447-1-git-send-email-peng.fan@nxp.com>
 <1584070036-26447-4-git-send-email-peng.fan@nxp.com> <CAK8P3a14BU5uHEqkVyWkeFVmxA1hJifQE+GkXFgmn59s_TL+Rw@mail.gmail.com>
 <AM0PR04MB4481E7BC1DF01CFC975577A088F90@AM0PR04MB4481.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB4481E7BC1DF01CFC975577A088F90@AM0PR04MB4481.eurprd04.prod.outlook.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 16 Mar 2020 09:05:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2F4oREw8AgNqQo18hLfVG4GcMJ72bST6EBd_KYhsRfsA@mail.gmail.com>
Message-ID: <CAK8P3a2F4oREw8AgNqQo18hLfVG4GcMJ72bST6EBd_KYhsRfsA@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: imx: select ARM_GIC_V3 for i.MX8M
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Aisheng Dong <aisheng.dong@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:C/9dMaP4OGvrdGP60xaL66vbJGrhUEzebMdVLmwJzaqNP/7u4m4
 QpfeAQAZU3zScueyx71GmSAHdrOR6dvyPskEUPVg1aCbh6cHKpl9tOI08z3c9l6w31gEO+P
 UaLVZxn7b0D3dhBRhyxbQxqmkqvzIKQ2LV/ArDo0lYSwC8AKyzLd08+7AjUKHF4/kqXszPQ
 MrJFRGoGY7xSS0Zm10Hug==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K9XUUBtc12Q=:PjHFrfC0O5vPJlhc9Rhm+C
 uXPm9YvEgE10OZHHTEvGqHbHySmHpNs6ZKInsG1dVz+he0h289VJEwoHjRR6Ymi1d29Y7FsEm
 2TTStf1doy/Y1bkeJjMcTrpxv14K8sV4VQSa4/XbNH/K4XCdBQhFsaSnhTdnH3KUcMVyQ56dP
 tCzfQ7ln2cK04IztVSTFOvsiHUerSZA7i/KjYwHTl3OkAox8pU7Gl0PcdRVjsVDXKSs5pbG6/
 FVH1W36fJeNcvUqfFfcZOTAo1abDGLMihVGlFYoNnXlIOKnixdwnar98UgBGmiHh9uC3LfJFl
 BNWRfGfjiV35WFWM9XIAcK+jDaeHDH06VAiYN3rLLvFAvFOrKos0dWtxK41jgAXiJpMuV2Q0X
 Fqi5DINDO1mn20WWxXou/9V4aSorRnFVWz/fGXLjmSSWhmmgzJGZRFT6Uqxjl+aQJXfY5UzGa
 0PWXT4JFUarmUMhDQoDU42LUCw6ab4TIZBssZ+WirUcYOX7/94Wxi9jwh6mnFwx3xdOHbiEPQ
 rxH0xV8P6a69S/0DoWpBEa+NRWBnLgYB5VaJemp8wQaSgA77tBRp0SPhDEhgX3qbQttH2Bx3w
 cWL7OllgXsA8ra8bMUYNtGYzwsw16ngHlIhcbQmPjwN6QciXAHTefeAvZhgpZI+B6GxhUhBdL
 /UeJQbHlZSMKWuHHEGmsbE63Sa3qaP1R7drDFpRFQLOEpa4zqT6e1dcapTSi2fm/pAE3c+Nmc
 mErHbPSE4KDsIT+tcSS+sCYVl7+KZu8hK+vFTT7QQcpckayK9fXBvwS+Gyvqc0lok/MHEDn8u
 oNd+gdPNrrXro1hP3vF79VFCeCqnAxEsDXWeFXSoNgkKjI9U/c=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 16, 2020 at 7:43 AM Peng Fan <peng.fan@nxp.com> wrote:
> > Subject: Re: [PATCH 3/3] soc: imx: select ARM_GIC_V3 for i.MX8M
> >
> > On Fri, Mar 13, 2020 at 4:34 AM <peng.fan@nxp.com> wrote:
> > >
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Select ARM_GIC_V3, then it is able to use gic v3 driver in aarch32
> > > mode linux on aarch64 hardware. For aarch64 mode, it not hurts to
> > > select ARM_GIC_V3.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> >
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> >
> > > diff --git a/drivers/soc/imx/Kconfig b/drivers/soc/imx/Kconfig index
> > > 70019cefa617..0b69024296d5 100644
> > > --- a/drivers/soc/imx/Kconfig
> > > +++ b/drivers/soc/imx/Kconfig
> > > @@ -21,6 +21,7 @@ config SOC_IMX8M
> > >         bool "i.MX8M SoC family support"
> > >         depends on ARCH_MXC || COMPILE_TEST
> > >         default ARCH_MXC && ARM64
> > > +       select ARM_GIC_V3
> >
> > It would seem sensible to also drop the dependency on the 'default'
>
> If drop default, we need enable this config option in ARM64 defconfig,
> I would leave it as is for now.

I meant making it 'default ARCH_MXC' so it gets enabled for both
32-bit and 64-bit i.MX configurations, not just 64-bit.

      Arnd
