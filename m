Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8818222EA3A
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 12:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbgG0KoY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 06:44:24 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:53339 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbgG0KoX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 06:44:23 -0400
Received: from mail-qv1-f54.google.com ([209.85.219.54]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MjjOl-1kfN7e0U4x-00lGCB; Mon, 27 Jul 2020 12:44:21 +0200
Received: by mail-qv1-f54.google.com with SMTP id s15so2753219qvv.7;
        Mon, 27 Jul 2020 03:44:20 -0700 (PDT)
X-Gm-Message-State: AOAM531kv6+eVfJIW3zBDkVWmVxrXMnUUbxvRBJE/UGhhFdszoH5wuAo
        IVH6i69BlVcUVe+LbUxMMVs9owJXXAR5nJ/XUEs=
X-Google-Smtp-Source: ABdhPJz7ZI+MqffVKKf+QoCh3SbQ7McXgqV4SfZ00yheNSefpvv2rs9WSqV0I1PS06b9ZrHARO0LqyOJ1dzlgIrR28M=
X-Received: by 2002:ad4:44e5:: with SMTP id p5mr5320907qvt.197.1595846659806;
 Mon, 27 Jul 2020 03:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
 <CAK8P3a13gcF_+dkfxZW0u_YuJ92hY1JukWfzM+e30iM=YUhraQ@mail.gmail.com> <DB3PR0402MB3916F080E4912B27B18BEADEF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR0402MB3916F080E4912B27B18BEADEF5720@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 27 Jul 2020 12:44:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2CBYV2xEkedQYmzL4XgHPeu02=vmLffq+RWwvEvuUGKQ@mail.gmail.com>
Message-ID: <CAK8P3a2CBYV2xEkedQYmzL4XgHPeu02=vmLffq+RWwvEvuUGKQ@mail.gmail.com>
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
X-Provags-ID: V03:K1:z+cy1YNlMdO3jfv0k640ByP7SFEBeCAIaWwTls5vlMvnYEIghax
 rNxYSGRG2T2kfIcblyQXoCCSKrVWKD9sGaVLT9YQHvFX/u9VzYUTPLllWudZ2J33ubJPxdS
 v2ccZhiWQ5ap37OQlktljezwQi6WCyrlwPqjRnxEY22i5ro7uJatt0mf+YmLSNLFL+g8nHL
 lG9fAt/FjXc5/CzWYm5Wg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wslqdFZ1lh4=:dl/oPsLfIcaHogn6hFEBTp
 pJM4ej1DWuSSOtjH3pbD6NeZUBn6ly1cZydmbMPEN+d/+ASjQav1gZRnfetrROGmbOHwLGaJe
 hdSKjst6lbNVHChotg6LS2v835eoZU0e6IsA5drNeieeVPfNKVIWbBoMw87Qbz0rFNqpHQjft
 cXOWpIon5Tw1u0I4KcGJCXWebrzhJtj2ZKJjyvS/Xr+4MTMydgePrjOl/uEYesNa4+eF462iU
 PcYH7Y/2fPFkzu4OdLjet4iXlKNYE0MddYSi1IFt6a/IQ7lAj1sE5IC4b7fqKAct1FH8JtrFp
 8WH3D5ybbRtST8LCmEXMUuzX9vpnfg1hCaimcgq2CBoDuvOHobBPLhm3YfBi+qepci575Zh4/
 t043WzAc88GS8alcl5wijjqwW10Pvb3oG+PKnnA8WVB5soj+dKpq5MQeaIu+i7NOLnTh+emnB
 31TRoxoJErfpOeOBIjqVFsrn4Zf4QhTdK6cKKLXxqfQxiKTOl712D5mfS7932spp3UOUoP0vW
 jQQWEiBi8frgUSnIAGEwU/W6iQMXZvsQU8mcY0PXVQEfERca1Rj58MqwVSUhL4ke0ZPH7cQPI
 iW3DFhdYXjkt7m/BRqblWtixzafkr65Uu33DFU6xdARXVoSaeKTNPpE/4PhaT14GvwzwtUwhC
 N7EydnKHaQl7wDQvqPBOwUyEWrf7spkiA9h8yQtTQkNXP5azVrfDEjLClWobu+hJlEtolugGc
 2GOdgk03lCBLK+5cGIcYDpxuJHV7HW3haS6mUyghu62KoLf22jK8n1GcyooV3sA3aH2yokWFn
 uVwNfYnbrE3+xspRxOxxb9pJpcS4UXbm/QUWbKRiDGaigMMuI+XkpDR/tdqs0EU14X8nFd8hf
 sSkqp5V10ZbVNzBsjxkWYSW9PjR5vnFOtsyYv5izmTVmaMekT6hvOMoEoZ6ZO/eA6BUolaV1g
 cm5vu3XRodY+Xxjxha0++ExXJx6AFzYAreFqVaT7KVAU1m5m1m1we
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 27, 2020 at 10:18 AM Anson Huang <anson.huang@nxp.com> wrote:
> > Subject: Re: [PATCH V2 1/4] gpio: mxc: Support module build
> >
> > On Wed, Jul 22, 2020 at 3:50 AM Anson Huang <Anson.Huang@nxp.com>
> > wrote:
> > >
> > > Change config to tristate, add module device table, module author,
> > > description and license to support module build for i.MX GPIO driver.
> > >
> > > As this is a SoC GPIO module, it provides common functions for most of
> > > the peripheral devices, such as GPIO pins control, secondary interrupt
> > > controller for GPIO pins IRQ etc., without GPIO driver, most of the
> > > peripheral devices will NOT work properly, so GPIO module is similar
> > > with clock, pinctrl driver that should be loaded ONCE and never
> > > unloaded.
> > >
> > > Since MXC GPIO driver needs to have init function to register syscore
> > > ops once, here still use subsys_initcall(), NOT module_platform_driver().
> >
> > I'm not following this explanation.
> >
> > Why is this driver using syscore_ops rather than
> > SIMPLE_DEV_PM_OPS() or similar?
>
> Below is the original patch of using syscore_ops, it has explanation:
>
> commit 1a5287a3dbc34cd0c02c8f64c9131bd23cdfe2bb
> Author: Anson Huang <anson.huang@nxp.com>
> Date:   Fri Nov 9 04:56:56 2018 +0000
>
>     gpio: mxc: move gpio noirq suspend/resume to syscore phase
>
>     During noirq suspend/resume phase, GPIO irq could arrive
>     and its registers like IMR will be changed by irq handle
>     process, to make the GPIO registers exactly when it is
>     powered ON after resume, move the GPIO noirq suspend/resume
>     callback to syscore suspend/resume phase, local irq is
>     disabled at this phase so GPIO registers are atomic.

The description makes sense, but this must be a problem that
other gpio/pinctrl irqchip drivers have as well.

Linus, could you have a look? I see these other pinctrl drivers
using SIMPLE_DEV_PM_OPS:

drivers/pinctrl/nomadik/pinctrl-nomadik.c:static
SIMPLE_DEV_PM_OPS(nmk_pinctrl_pm_ops,
drivers/pinctrl/pinctrl-rockchip.c:static
SIMPLE_DEV_PM_OPS(rockchip_pinctrl_dev_pm_ops,
rockchip_pinctrl_suspend,
drivers/pinctrl/pinctrl-stmfx.c:static
SIMPLE_DEV_PM_OPS(stmfx_pinctrl_dev_pm_ops,
drivers/pinctrl/qcom/pinctrl-msm.c:SIMPLE_DEV_PM_OPS(msm_pinctrl_dev_pm_ops,
msm_pinctrl_suspend,
drivers/pinctrl/spear/pinctrl-plgpio.c:static
SIMPLE_DEV_PM_OPS(plgpio_dev_pm_ops, plgpio_suspend, plgpio_resume);

Linus, can you have a look and see if that same problem applies
to all of the above?

It seems that some drivers use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS()
instead, which looks like it is meant to address the same problem, but
as I have not used that myself, I may be misunderstanding the problem
or what this one does.

> > Why do you need subsys_initcall() rather than a device_initcall()?
>
> The subsys_initcal() is done by below commit, the commit log has detail explanation.
>
>
> commit e188cbf7564fba80e8339b9406e8740f3e495c63
> Author: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> Date:   Thu Sep 8 04:48:15 2016 +0300
>
>     gpio: mxc: shift gpio_mxc_init() to subsys_initcall level

That commit made the initialization later not earlier, as it originally
was a postcore_initcall(). In the loadable module case, you make
it even later than that, possibly as the last module loaded when
booting up the system (followed by a storm of deferred probes).

> > If the subsys_initcall() is indeed required here instead of device_initcall(), how
> > can it work if the driver is a loadable module?
>
> My understanding is: there are two scenarios, one for built-in case, the other is for loadable module,
> the subsys_initcall() is for built-in case according to the upper commit, for loadable
> module, the user needs to handle the sequence of modules loaded.

I don't think we can rely on user space to coordinate module load order.
The modules are generally loaded in an arbitrary order during the
coldplug phase of the boot when user space looks at the available
devices and loads a module for each one of them in the order it
finds them in sysfs.

This means all drivers that rely on gpio, pinctrl or irqchip interfaces
exported from this driver have to be able to deal with them not being
there. This can also happen when the pinctrl driver is the only one
that is a loadable module, while everything else is built-in. While
that is not a configuration that users would likely choose intentionally,
I don't see a reason why it shouldn't work.

Using module_init() or builtin_platform_driver() here would make
give similar behavior for the built-in and modular cases and be
somewhat more consistent, so you don't run into bugs only when
the driver is a loadable module but make them obvious even to
existing users with a builtin driver.

       Arnd
