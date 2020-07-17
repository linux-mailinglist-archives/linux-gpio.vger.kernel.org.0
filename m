Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB503223D70
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 15:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgGQNzK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 09:55:10 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:39399 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgGQNzI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 09:55:08 -0400
Received: from mail-qv1-f52.google.com ([209.85.219.52]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M27ix-1jyLZL49bF-002Vsh; Fri, 17 Jul 2020 15:55:07 +0200
Received: by mail-qv1-f52.google.com with SMTP id ed14so4261995qvb.2;
        Fri, 17 Jul 2020 06:55:06 -0700 (PDT)
X-Gm-Message-State: AOAM531ODp20DY28PbUj0yWR7rLEccpc5k8Ovz5CcAi35OHgcqR/9gD8
        Tvvv1Fy9VKCD9+Zbm+HqK4SdN4v/sKAQSLPye4g=
X-Google-Smtp-Source: ABdhPJx8LtIaLQvziKo3lourUrEUkUS4ZMZUlWIjb/0jYwIJLV5qk1IAswyVggaESYzsgRC5Y1NVn7LRruYETW4HxFQ=
X-Received: by 2002:a0c:f802:: with SMTP id r2mr9068143qvn.197.1594994105686;
 Fri, 17 Jul 2020 06:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <1594164323-14920-1-git-send-email-Anson.Huang@nxp.com>
 <CACRpkdYP4J+MZjxWUnkM-XGaMmFFZfMCfY13r7G6r2=v3F6zQw@mail.gmail.com>
 <DB3PR0402MB39168FEA9306CBF90A596E31F5630@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916FB27846F462C2210C3BFF57E0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkda2gdu8FsSM0MC6g8C1mebmVc5dFWJZwNvQUPXNi5bnkQ@mail.gmail.com>
 <DB3PR0402MB39167A4BB808A0679257DEF9F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CACRpkdbCVZaHqijqMck+jLAJuCAT31HA=9wwcV_EnQc=hsXLwg@mail.gmail.com>
 <20200717121436.GA2953399@kroah.com> <CAMuHMdWdaQ_jK1T_ErJ36pJbUUS3SFBcqQmyvtufaKha2C76Gg@mail.gmail.com>
 <20200717132101.GA2984939@kroah.com>
In-Reply-To: <20200717132101.GA2984939@kroah.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 17 Jul 2020 15:54:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3fwwx-2gQTXZ9dbko+DuLELGm=nKrYFXfwcJJOf0Xz5g@mail.gmail.com>
Message-ID: <CAK8P3a3fwwx-2gQTXZ9dbko+DuLELGm=nKrYFXfwcJJOf0Xz5g@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: mxc: Support module build
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Anson Huang <anson.huang@nxp.com>,
        John Stultz <john.stultz@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jon Corbet <corbet@lwn.net>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dEZrwx+hzGiTO58D77scQNmTcn4qBOJ4MxH9Pt6/XGIoFsCYPgx
 8+8Z4oqNp0EXx8voOmSwoJLPt4yIRYSbema98zXDcFZfv44gguS59RhHC/ya+BWeCtQf/0a
 6JHum5COraJZ+48BGLVoiz/b2W/SxC7DRMhVrgkUlhBIk+XN/0UaZWqxAvsA/jrwJLNNtTu
 u21KH88s+7Z/WD4Y2NvdQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:T+04+9APdXo=:t1jJfhZF3ic/+H9We7UQqy
 Qv7PMTQSjEKLQ9zt7L9oPnutUjn92bqyPYD3EGItpRVHV8BuVHnJk+knywJI+DQwsnJNfdqR+
 2Dv0/ttH/40MpY8NPGYKnjSPaQG0u7j76oZFyWLM7/hnvdHGyoO1MdD9pbBqYJqsI0nnp50d7
 ebBD1424kWkXyko5xVMrr3AnUXte7L9sSkXRK8dCbwzz3L0LbIIJYkxRkRkmunJoCI30TQFT5
 A+zWR8QNISc6+S3ZZyTfjUtDVAEVrKzQ8hxioaARllP+++KZvtrOh3Se8e9qeeHJw/ty/zzsz
 GAl/UOeq4tnZrX1oTmkQ01n3DyGLnMIyxDr5E5FP/Hm5tL1w0nd6OOrZdQ3V/AOgnUt2OWJET
 qFZcWSlQIH25VVbNOZFFW63AGwWFtS99F9Pi4M4bzLRPyrLQKzXEdG70CTczsqfb78bfgaGy1
 8NyZRAzmU+3RQ+RZB0ygTDXTpDnIFF8SP84dopLVQnaHdWgDtNXXFp9/kiYhZTKo96ejesz9b
 SBBP5+zY02C4JsITREaZUBzlrl/PZBlu0c0snwmFuhKp82EBuU31MjOm+DM83R9WtidiypJl0
 EiQKpsb22Oh85iGS1W0nScYAzadPD8Iuk3t9dqRVW/fRkhMsikm/RGMz/Dtj4uah2YqUbmGdd
 hPUHWRkCkiDqRrHGKjbcwECPRVBt2uPhhKhVb8itKSkJtETIH0Pbqc4M3xGNY/rDw0KCG0z85
 aERgimF5OMx5YKbWPb9W0KrsL6o4QWZQfOsON0fzXMIRwpZC1/xfqNXByf6dFn3Lvh3IQUqUL
 tGmDQLPTzk7SlprMXch4LQU+xA5P4k7WHQkR1ShZj4NIoj1Qu4PQvfWen/LoibFmDzeNC7eeI
 6ng9/YWmAETYF/rBDMuSWS6vUDmg0C5chGLA2Z84k0OOO7C2a8RXxiBdz1A7vtNkaApNcLATv
 3Mjhgmu1DFrzzpQ8gL2dpKCj23Wzf1Qm1t4yyUYoZzLxxXOJ6+NXc
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 3:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Fri, Jul 17, 2020 at 02:27:43PM +0200, Geert Uytterhoeven wrote:
> > Hi Greg,
> >
> > On Fri, Jul 17, 2020 at 2:14 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > Android is just finally pushing vendors to get their code upstream,
> > > which is a good thing to see.  And building things as a module is an
> > > even better thing as now it is finally allowing arm64 systems to be
> > > built to support more than one specific hardware platform at runtime.
> >
> > Can you please stop spreading this FUD?
>
> For many many SoCs today, this is not true.  Their drivers are required
> to be built in and will not work as modules, as we are seeing the
> patches try to fix.

There are two different points here:

a) having drivers as loadable modules: I think everyone agrees this
is a good thing in general. Having more of them makes smaller kernels,
which is good. arm64 is no different from arm32 and powerpc here,
and probably a bit better than x86, which requires all platform specific
core code (PC, numachip, UV, ScaleMP, ...) to be built-in.

b) supporting multiple hardware platforms at runtime: this is totally
unrelated to the platform specific drivers being loadable modules.
arm64 is a little better here than arm32 and powerpc, which need more
than one configuration to support all hardware, about the same as
x86 or s390 and much better than most others that have to chose
a machine at compile time.

> > As I said before, Arm64 kernels have supported more than one specific
> > hardware platform at runtime from the beginning of the arm64 port
> > (assumed the needed platform support has been enabled in the kernel
> >  config, of course).
> > Even most arm32 kernels support this, since the introduction of the
> > CONFIG_ARCH_MULTIPLATFORM option.  In fact every recently
> > introduced arm32 platform is usually v7, and must conform to this.
> > The sole exceptions are very old platforms, and the v4/v5/v6/v7 split
> > due to architectural issues (the latter still support clusters of
> > platforms in a single kernel).
>
> I think the confusion here is that this really does not work well, if at
> all, on most "high end" SoC chips due to the collection of different
> things all of the vendors ship to their customers.  This is the work
> that is trying to be fixed up here.
>
> And look at the driver core work for many driver subsystems to be fixed
> up just to get a single kernel image to work on multiple platforms.
> Just because older ones did it, doesn't mean it actually works today :)

Can you give a specific example? The only problem I'm aware of for
those SoCs is drivers being outside of the mainline kernel. Clearly
having support for loadable modules helps SoC vendors because it
allows them to support a new platform with an existing binary kernel
by shipping third-party driver modules, but for stuff that is already
in mainline, we could in theory support all hardware in a single gigantic
binary kernel with no support for loadable modules at all.

      Arnd
