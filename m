Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 470C822933C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 10:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgGVIPY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 04:15:24 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:54149 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgGVIPY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 04:15:24 -0400
Received: from mail-qk1-f180.google.com ([209.85.222.180]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M2Nm2-1jyiP614Kk-003uVO; Wed, 22 Jul 2020 10:15:22 +0200
Received: by mail-qk1-f180.google.com with SMTP id h7so1157563qkk.7;
        Wed, 22 Jul 2020 01:15:21 -0700 (PDT)
X-Gm-Message-State: AOAM532wjO64Z+d3CTwKf8R7ZGOqjG8eHICWXf0g07AMFKCAna2sganK
        H02CCCdf30LscmESqVQcIX8yE6IrLrnAL45a0Gs=
X-Google-Smtp-Source: ABdhPJxagWHIltsd9Y/Q05+su4bERDSiI05YQqxd93lRzKMZfkhjYuXY9Gz+GQLMwzj41iA+H33WQKqVlNof6awBZO4=
X-Received: by 2002:a37:9004:: with SMTP id s4mr22189849qkd.286.1595405721056;
 Wed, 22 Jul 2020 01:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1595382353-17486-1-git-send-email-Anson.Huang@nxp.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 22 Jul 2020 10:15:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a13gcF_+dkfxZW0u_YuJ92hY1JukWfzM+e30iM=YUhraQ@mail.gmail.com>
Message-ID: <CAK8P3a13gcF_+dkfxZW0u_YuJ92hY1JukWfzM+e30iM=YUhraQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] gpio: mxc: Support module build
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Russell King - ARM Linux <linux@armlinux.org.uk>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Peter Chen <peter.chen@nxp.com>, oleksandr.suvorov@toradex.com,
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
        Geert Uytterhoeven <geert+renesas@glider.be>, michael@walle.cc,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:2+1HvxydBqMn5yYipjFC8GFVU2TNleW+f/pTxKufbuXKucE3cW0
 RAYn8DTEH2GMVmuVy+nuZKYiW/lNH7aYfZbw1w2pj8W0gZ0+roRixc68t2xHPGPcbfTQmcR
 RaAt/cxvTLACHs+mL5KrteXYssBzctMa2v+T5D+05hBAjMTPNMKasfKn+v42uegYzT/px28
 TgOvxLyjrtiCnf8QVwS1g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9e0Btv5QQVo=:O89GEMuTiq6qPyegwQo49r
 PfC2qntbTFRaF95teHM7opnxT92dUYr76fX5F+xQeGH9IG+rnk1BCCcR7L+lkOMRHOv4b+EuD
 Dm6Cx/qLZvea9H/qbyDwLZ3gIdqRleao+YfHD3cd0cIEWHy1Tx0qHHokC0v1ZZggOqtT3szLI
 AbmWKsVB1CcwbsfUOo8M/IBkZPYEjbhmhJUFb0E/+dAbOhH+Tn/XggD1a5euMGvlClKGr3oX7
 5KPZLLx4YGvs6GiIKMNLtUrBZqHemP1Q6YZX6NGDQpk943gnr7R7UzVhO2N/uj+JzaEzUSCsq
 XuazUpin6xVkEIGureW428uiU9Fue/bao0DrROyfo3bEXw7J2aGcplA1vxKKMJ/O3W07k154D
 f4xpMPe4iVYWcqnO88Qr9TelNI+f+6ZmVDxBO35g1ZffAQlZMcYZ3JIIKpf0URLW/hqeI/33w
 ufpe2wypWl9Fef8bDRKegO+rjNZY8qpDYa4HYnAvZh/y15WwcMGKgBbe2iF8FDRbtTFOkpLR2
 DcfiqLmqCfoGvmDSbO/OHQU0GWdMuLC/GcU/llV/a9b5Gk/5wsfq0k9F8t9axG2vo6gDEo3oQ
 hlZO8MNXVUxHL5W+9sjWHFs/J3NuLcwmOOay9swQqiWHl8YoQ7dMWBeFw0XBDhC/fGMyDxlhX
 HzZL3ueqmqgnUMHsFWJ7/vFWVJWo67ToK4XLxCYrg9kZH6Z/9F9+iHtrPOsVUE9e/Vk2IQ7Eo
 DfIObAExtux70UWkXGStgyxQdgbuwRW4CkoY4o1jc7GmKtoD5nSMFgbYLRfebWpBg3Z/x6kEk
 rBkPNPOJ5ue9VzrRKxIx/IrBWkRfnICfCNTDgiolkzj04s/Jpc35gDmS8G2rD5HFCiqlJmB2i
 /NJCC3Ui4LxF01Ee9KRTQJEVw187+WOil3E/fR8fe5ywKGuHaWZYXZVGPppDHJ/YvRKeGnBp6
 dfICmmS637URQgionWToq3JKzJ84s4jEQp5nuWcLfED263kLX5BBa
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 22, 2020 at 3:50 AM Anson Huang <Anson.Huang@nxp.com> wrote:
>
> Change config to tristate, add module device table, module author,
> description and license to support module build for i.MX GPIO driver.
>
> As this is a SoC GPIO module, it provides common functions for most
> of the peripheral devices, such as GPIO pins control, secondary
> interrupt controller for GPIO pins IRQ etc., without GPIO driver, most
> of the peripheral devices will NOT work properly, so GPIO module is
> similar with clock, pinctrl driver that should be loaded ONCE and
> never unloaded.
>
> Since MXC GPIO driver needs to have init function to register syscore
> ops once, here still use subsys_initcall(), NOT module_platform_driver().

I'm not following this explanation.

Why is this driver using syscore_ops rather than
SIMPLE_DEV_PM_OPS() or similar?

Why can the driver not unregister the syscore_ops the way it
registers them when unloading the module?

Why do you need subsys_initcall() rather than a device_initcall()?

If the subsys_initcall() is indeed required here instead of
device_initcall(), how can it work if the driver is a loadable
module?

       Arnd
