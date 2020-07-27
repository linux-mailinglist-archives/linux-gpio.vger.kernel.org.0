Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59EA322EB93
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 13:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgG0L5K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 07:57:10 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:44645 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgG0L5J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 07:57:09 -0400
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M5PyX-1jzCo22Tdl-001Usj; Mon, 27 Jul 2020 13:57:07 +0200
Received: by mail-qt1-f172.google.com with SMTP id x12so3393889qtp.1;
        Mon, 27 Jul 2020 04:57:07 -0700 (PDT)
X-Gm-Message-State: AOAM533hwC0o+QICrgAUudli/KSbXpYLjtxUcmKWyriTc08/sLWozvNT
        PdHhjqz4VP/9leH7ZsDB7ER45q9jfQf3ia5aQWQ=
X-Google-Smtp-Source: ABdhPJwFjJ1uRx0gAvd79MzpUgGmevKDSEKaa19hQHPld/iDrKkAmTlENbDuZgj3D2W2HPQijmLDdpkpYWtQsGd1oI0=
X-Received: by 2002:aed:2946:: with SMTP id s64mr1380801qtd.204.1595851026347;
 Mon, 27 Jul 2020 04:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
 <CAK8P3a13gcF_+dkfxZW0u_YuJ92hY1JukWfzM+e30iM=YUhraQ@mail.gmail.com>
 <DB3PR0402MB3916F080E4912B27B18BEADEF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a2CBYV2xEkedQYmzL4XgHPeu02=vmLffq+RWwvEvuUGKQ@mail.gmail.com> <DB3PR0402MB391674F67A1B9F2732883C0BF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB391674F67A1B9F2732883C0BF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 27 Jul 2020 13:56:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0XpKnbz79dH4i7HofGgpAodtmgdBmVBVQOKfCiJMkpPw@mail.gmail.com>
Message-ID: <CAK8P3a0XpKnbz79dH4i7HofGgpAodtmgdBmVBVQOKfCiJMkpPw@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] gpio: mxc: Support module build
To:     Anson Huang <anson.huang@nxp.com>
Cc:     Russell King - ARM Linux <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Peter Chen <peter.chen@nxp.com>,
        "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Peng Fan <peng.fan@nxp.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joel Stanley <joel@jms.id.au>, Lubomir Rintel <lkundrak@v3.sk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "michael@walle.cc" <michael@walle.cc>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UJSE/0Z58OfPCysYxpev10bzJJ2QCZVPWuJ92JbTOlm8Ltvyesv
 z8SK2bN5skPJMHvMpVd62Fi/Fw/6zBsMiDU/H7o00mSeaG75DTnrDXPtiz787CiVk1szH0l
 Ikx6f9am+dDGVnTFnSq0/Xva7/XXUMhV11yWTmZZuPToDzoMN76kqEZQ+PBDFD/zpiv3d//
 z1pDThXn6JEkeiyYJS2HA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2+B8acJeJ84=:AinRmLuRvgh/UARc6XbADL
 WYlWhi/tSQcVDG0M5F9cNDcWZF+qxOe6fN0XwUGNFilRGzpyw1viOvGlpo37cihSoDs6GASj/
 GOSoorlBuaucbnv2+vOB1ag8NC2BaInAOajhDOrd8drH9/jigzHl1rMiClQS3U4Lnpk7QMKT7
 +jPBPc2usDFAmhXRg0wpc7NBao3R8H8Mr3Z9VKWT+Ll7EiarBaKSxQUjtW1SeqiZYgZQFqpHo
 x2iKRwPdyFdqL7owWyQN9uYJYyyUThIxo5EbsY/+aXzFNP1XDJ/gvBqiinXWgg/0kH+kQ7RZk
 tv5PMThLuV4cGp0f29IiuqbcPzNC+k/PTVy6doUAuTRg3vX+ll03EWmKuLjtQgi59VZsUNh+N
 jhqZyk7DvzokpsJklGf67L/USV7E9JW6QoRHK6PF+Pd7ZOtBjhMZoM47M6y4f2YeQm1/z7NJP
 9d+nJxrt3c1N5+3GvNYepIcMBbl5bUY2pZZkAB+tvGlHqSLktC7BVJNaaIm0iUb2S9VYR/QAT
 nXqr54dQX2WxRp8j382FXTj9X+/BDPW6y2LxS/sSwUlxLH0Tpw0vRd4snD/FLU/XDUcC2u5Xp
 avs5uSqWM1TcuNfIeCQDm6ReKIoTmDuAEqdJx+kiYeOHf/nByDK5UrbofFLzNZy/zxTcJL405
 QpYAWCC+JqLrN4QthW3+y/uC1+xTIUqpFYb/uwk9wt9B1Uy64sspT7kEVu5L6pdEEfECarrLF
 YslcYXE6mgpGRAWX5tmxsMnJmZ5bbVmTdU4LledckACtRjBVgMzfPYYbgVnI9RU7BA23rPgdf
 mlmMpzzvEQ/LPhfvSSQj7jrsUebx6weqOl8BF7vdYNTes5ysY6slQQP9lupnh/iaQQLe05UOW
 p95y37eFoWiXjeSdt4Xdc9rtLT2w8SuecxuAmgW2RHjfvFi+tt6xeS2BOnnfLw57/xhRrINB3
 7QsKZLr0LigqgCJilgp9AtH7rSYksAyI1GSRUash0z3iBiw/Ay4sV
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 27, 2020 at 1:21 PM Anson Huang <anson.huang@nxp.com> wrote:
> > Subject: Re: [PATCH V2 1/4] gpio: mxc: Support module build
> > On Mon, Jul 27, 2020 at 10:18 AM Anson Huang <anson.huang@nxp.com> wrote:
> > > > Subject: Re: [PATCH V2 1/4] gpio: mxc: Support module build
> > >
> > > commit e188cbf7564fba80e8339b9406e8740f3e495c63
> > > Author: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> > > Date:   Thu Sep 8 04:48:15 2016 +0300
> > >
> > >     gpio: mxc: shift gpio_mxc_init() to subsys_initcall level
> >
> > That commit made the initialization later not earlier, as it originally was a
> > postcore_initcall(). In the loadable module case, you make it even later than
> > that, possibly as the last module loaded when booting up the system (followed
> > by a storm of deferred probes).
> >
>
> Yes, loadable module will make it even later, the assumption is userspace can load it
> before any users depend on GPIO driver. Given that we have to support loadable module
> for all SoC specific module, do you have any other suggestion of how to proceed this
> requirement for SoC GPIO driver?

I think in general, drivers should be prepared for -EPROBE_DEFER error
codes returned from interfaces such as devm_gpiod_get().

> > I don't think we can rely on user space to coordinate module load order.
> > The modules are generally loaded in an arbitrary order during the coldplug
> > phase of the boot when user space looks at the available devices and loads a
> > module for each one of them in the order it finds them in sysfs.
> >
> > This means all drivers that rely on gpio, pinctrl or irqchip interfaces exported
> > from this driver have to be able to deal with them not being there. This can
> > also happen when the pinctrl driver is the only one that is a loadable module,
> > while everything else is built-in. While that is not a configuration that users
> > would likely choose intentionally, I don't see a reason why it shouldn't work.
> >
> > Using module_init() or builtin_platform_driver() here would make give similar
> > behavior for the built-in and modular cases and be somewhat more consistent,
> > so you don't run into bugs only when the driver is a loadable module but make
> > them obvious even to existing users with a builtin driver.
> >
>
> My original idea of adding loadable module support for SoC specific module is, try
> to keep it exactly same when the driver is built-in, but for GKI support, first, we need
> to support GPIO driver built as module, and we definitely need to think about the module
> load sequence to handle these dependency, but thinking about the common module widely
> used by devices, such as pinctrl, clock and GPIO, maybe other modules need some patches
> to handle the dependency, but that will be done later when we are working for those modules.

Overall, my feeling is that making sure all drivers that depend on the pinctrl
driver can deal with deferred probing is a prerequisite before this can be
made a loadable module itself (same for clk, irqchip, etc drivers that others
may rely on).

I understand that your primary motivation is to fit into Google's GKI framework,
but I think that doing the conversion only partially would neither serve to
improve the kernel nor actually meet the GKI requirements.

Most pinctrl drivers are currently always built-in to work around the
load order dependencies. This of course is a bit of a hack and we'd be
better off if all drivers managed to avoid the dependencies, but this
can also require a lot of work.

> So, could you please help advise how to proceed it for this GPIO driver to
>  support loadable module?

I would start by getting a reference board to work with a kernel in which
all drivers are built-in except for the pinctrl driver, to see what exactly
breaks when you do that, and what other drivers may have the same
problems. Maybe it's not that bad after all and you only need a few
modifications.

      Arnd
