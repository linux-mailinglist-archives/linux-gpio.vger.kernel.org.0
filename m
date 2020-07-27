Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3B722EDB4
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 15:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbgG0NmB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 09:42:01 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:35177 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgG0NmA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 09:42:00 -0400
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N49d1-1kzke72vfV-0107gZ; Mon, 27 Jul 2020 15:41:58 +0200
Received: by mail-qk1-f172.google.com with SMTP id 11so15242216qkn.2;
        Mon, 27 Jul 2020 06:41:58 -0700 (PDT)
X-Gm-Message-State: AOAM53259VI8nXMMK7q7cYFIM7IOnKAyiCAAFZcoSUzifOp6PqsdWit4
        thEpYOj5jwk9PFhxiU1w2QT2Ur2bwnZAJaHiXFU=
X-Google-Smtp-Source: ABdhPJzqySuIuVB3czYYTZfyLd6uhBrv9RKw8ilEdQwRCvqND1MWjmxKJ0rPM4aQhz302ObDF3kYrSDVo+yClkDXAmc=
X-Received: by 2002:a37:385:: with SMTP id 127mr21536451qkd.3.1595857317286;
 Mon, 27 Jul 2020 06:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
 <CAK8P3a13gcF_+dkfxZW0u_YuJ92hY1JukWfzM+e30iM=YUhraQ@mail.gmail.com>
 <DB3PR0402MB3916F080E4912B27B18BEADEF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a2CBYV2xEkedQYmzL4XgHPeu02=vmLffq+RWwvEvuUGKQ@mail.gmail.com>
 <DB3PR0402MB391674F67A1B9F2732883C0BF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <CAK8P3a0XpKnbz79dH4i7HofGgpAodtmgdBmVBVQOKfCiJMkpPw@mail.gmail.com> <DB3PR0402MB3916634EA84687D6C7535BC1F5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB3916634EA84687D6C7535BC1F5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 27 Jul 2020 15:41:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a06tu4UgTxT4q9eS4=z5AHiEWQMhk5PfZEz=4t+f26s5Q@mail.gmail.com>
Message-ID: <CAK8P3a06tu4UgTxT4q9eS4=z5AHiEWQMhk5PfZEz=4t+f26s5Q@mail.gmail.com>
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
X-Provags-ID: V03:K1:12GnPkMsBlHbsfD4U38ElU/anl9pwaLxKK+gVFU33Z0wRjMSL66
 hzGxvYT1Glng73TEmHhGcfif2UJSF/g0z+NkRe4hyYb6kn+y2JTOmN8u2fT7hk3PkF8QtJk
 QuOrqTd6xnj0c7c3Ppg3HPdTpUeOYdbuvmdZVijBScyoV8Pi5Cg32EEDTctIgTlcPrXroSp
 MXHmIvTvuYsQCojFom8uw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zFmmZ2Eh8gY=:5PfNRLGeCvCYPbauLK4y1z
 4BtIuXX51hjLZc0BhLw0+MideWc8Be6OWCsuK0q40mA6eR3h+r1fIGEkBawVy6MH8fBD5j0Ob
 VNswoWrjacAoVjOwK38o1RisMFxBa1YpzzO2vzxnma8w/zIjXxaEnP0GxcY511tSAwyiqqfr0
 FrvKHN2WDOm/WUsRfkunTzlOqtjSRsVJ0Ejv0EfZ38dv4wieGGfQ2L4xyO3i+u9RK8bNvOA5I
 5Ynw5uShxa1TgjRpG5MvXkKE2YqrbtwGnNDulS3aTDdnB/rW9cOA+fGLXAdxyi3yUbrqVk44c
 KGMWHHMb2OuZfLNEm3Lg3EeH0nUeobJGL4OKY8zO6Zs/15S8Fa2YvejWj2+XebM5RTAyrHOCL
 N5OCf8iW87ULfnxiPUPeHoht0lMw6wUxaaD6+8nhlCU4Kx6kO2i6j1bZNFiYqk6nzb80uNeyU
 uvzYIboGHGDlfwLkCKy/43TwkLV8aGxYBSW9G+cB+CM/tlG/Lm5J7VaYT2QvW5OgaWmwIDmSu
 jwhqmflLCcwrjk0O+Rrh8TRMe61eLDtZfilEzbmY3XH9RbTGmjM3bw0DzRKqAJQCYX/trCKpz
 oA48xc7RO5nAZOQ1JrEuNvwH7gz/phh5doLSu6/0+cpxKNib0BEBIUvk60IeVxsFC6G1ZHrZe
 epbSIN6jmtrsTEOZreO4a/VuRPfZRiJYDlTxPx+YNDXijHGPiUrXRO4976GQpEcg8hf6m2g32
 dVvPNTWqkZWI9+qvrLIFvq/v7h/X7wwAl4tgTgPzJ+vR0Mrh692WJwkWhKP6peFRUEbjpR5Go
 fFHbwYHImkzkt/WXpi2Z2uUCcATQKk5oYdqVkCnfAHsSmOlNo/TWAzIM4vA6eJ9LztTwwcphh
 /9QxGPfu8UC8TlbjCdt5HA4MgoWiDqaH4yBB9fVDctNbsKSpBP7EJNjNg7XtwFvkLfw6ah+hk
 VwOxfik4dMArcaB1EdExic9QGxnn068T9NNhhX8fwswLozvqdVJmS
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 27, 2020 at 2:23 PM Anson Huang <anson.huang@nxp.com> wrote:
> > Subject: Re: [PATCH V2 1/4] gpio: mxc: Support module build
> >
> > > So, could you please help advise how to proceed it for this GPIO
> > > driver to  support loadable module?
> >
> > I would start by getting a reference board to work with a kernel in which all
> > drivers are built-in except for the pinctrl driver, to see what exactly breaks
> > when you do that, and what other drivers may have the same problems.
> > Maybe it's not that bad after all and you only need a few modifications.
> >
>
> I agreed, but the situation is i.MX SoC contains more than 20 modules, and most of
> them are NOT owned by me, so I am NOT sure when the module owner will start
> working on the support. And if with minimum devices enabled, such as tiny kernel
> with ramfs, it is working even with pinctrl/clock etc. built as loadable module.

Do you have an example that is actually broken? I checked how the gpio
chip is actually used and found that "regulator-fixed", "virtual,mdio-gpio",
"regulator-gpio", "gpio-leds", "marvell,mv88e6085", "microchip,usb2513b",
"fsl,imx7d-usdhc", "fsl,imx6sx-fec", "mmc-pwrseq-simple", "brcm,bcm43438-bt",
 "rohm,bd71837", "nxp,pca9546",  "rtc-m41t80", should all work fine here.

I'm not sure about "fsl,mma8451", maybe test that one manually or look
at the driver in more detail.

"fsl,imx8mq-pcie" looks broken but easily fixed, and this is something we
have already discussed.

imx8mq-nitrogen.c has a "vsel-gpios" property in its "fcs,fan53555"
device node that is neither part of the binding nor handled by the
driver, so this is broken regardless of the gpio driver.

> Meanwhile, as you said, most of the users are still using built-in model, so adding the
> support for GPIO can be in parallel with other modules' work, in other words, with this
> GPIO loadable module support patch, if other modules can NOT work due to lack of
> defer probe implementation, then the patch should be done in other module, adding
> that the default configuration of GPIO is still built-in, do you think it can be an independent
> patch and get into linux-next first?

I think you should be reasonably sure that making the driver a loadable module
does not break other drivers that might rely on the probe order and
that are known
to be used with an i.MX chip. With the list above, that seems to actually be
the case for the most part, but testing is always better.

If there are boards that use other drivers which do not support deferred probing
but don't have those listed in the dts files in the kernel, then that
is not something
you have to worry about I think.

I'll let Linus Walleij comment on whether he thinks the initcall should stay
at subsys_initcall() to avoid breaking users with buggy drivers, or whether
this should be changed to module_init() or builtin_platform_driver() to
have a better chance of finding and fixing those broken drivers.

     Arnd
