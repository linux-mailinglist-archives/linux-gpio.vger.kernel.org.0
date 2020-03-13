Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC18318447D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 11:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgCMKLc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Mar 2020 06:11:32 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:39697 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgCMKLc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2020 06:11:32 -0400
Received: from mail-qk1-f172.google.com ([209.85.222.172]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MSKly-1ik3X01Xaq-00SiEB; Fri, 13 Mar 2020 11:11:30 +0100
Received: by mail-qk1-f172.google.com with SMTP id d8so11505071qka.2;
        Fri, 13 Mar 2020 03:11:30 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2xN5BlUpcZOrwMWPmjubsaakk47riZOIHyfUplu7RS5r9T+Kp3
        lbPxLOjzhIAqgk7hqaj1nBiEKuKg+oYD+R6F7xY=
X-Google-Smtp-Source: ADFU+vsCydklHK+9Ar4RDwAxNiVrZxoUVNmbFhA0K7Jp1usDjMuTKVKyrnX8uuq78mby8lyq2MddiuHVgl4hQ5+4glA=
X-Received: by 2002:a37:8707:: with SMTP id j7mr9621233qkd.394.1584094289099;
 Fri, 13 Mar 2020 03:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <1584070036-26447-1-git-send-email-peng.fan@nxp.com> <1584070036-26447-4-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1584070036-26447-4-git-send-email-peng.fan@nxp.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 13 Mar 2020 11:11:13 +0100
X-Gmail-Original-Message-ID: <CAK8P3a14BU5uHEqkVyWkeFVmxA1hJifQE+GkXFgmn59s_TL+Rw@mail.gmail.com>
Message-ID: <CAK8P3a14BU5uHEqkVyWkeFVmxA1hJifQE+GkXFgmn59s_TL+Rw@mail.gmail.com>
Subject: Re: [PATCH 3/3] soc: imx: select ARM_GIC_V3 for i.MX8M
To:     Peng Fan <peng.fan@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Anson Huang <Anson.Huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:uvjspBKGh/OQ7ZCu5qAX+JEpwtp/DDl2j2tRGZ8BuC82ySLDPox
 MjmLpfL1rGkst0kB7uY96YNbUJgmmz13vi7GruTwMyJcJVSIQf80AIeHXwfo3BoIjwquyuS
 9xk4nUq2npNh7BQQJFq908xB/KOEt4WDNIhpWmf+mjvfomE7HK1li9hzz94tpVkFyo9/g9C
 ZNxKlC9/5Dj5qAEEUynkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yvuBIhSD7DY=:1Pze8/1ge8N3gcehyfQ95p
 dE8voLpyeScycF2ItZOrdGIiI+LPMkvEw6sUVdZPv+KWmsxX64GJJyXWvWBNIHUag4GkhPfr0
 JZyaz0CJ6h0YdKSlsqKLD0//s1DJ7q+9B4SWvWYTu+TmtxQnkSFUD7BxQ/kmScjjJpnn0nrvO
 szxFKMunxV6CVuzc++Fa1cFjx1jvTK/7+PM/A9EV4jPlx2bIdaUyKjVKiKrZ3zpKZfzAxqlCz
 tGtxs0bMqvewRParg8nIVQfEzm0qL1bF0UGHSPKF6pvRXPEe5dqtfN/mpxACwrjcA4+Fa6rnU
 hcrMitot+jx9dRQ/7O68GIjXJcd7gN+VuHnSG0XGkDfUzTX/4PIGpq+8kNsS5CFSfPfT4/U/m
 UjEkvoL/L6hmLpsqDxFkmFRLTygs3ATHOIb2qSFfdepu1zWlgiGCVAnojZQ1U02a/VSPfbDlN
 UaHUitDe/CR/ryF94/YPvgBTw0eDDqoqjiOMO5D88UJH5dqknS57JDjGURdbNQr2hzI4ILjJC
 J6zF5YHISRv/h/UFiZ1Eeuhow8WuPIai+29M0JDfwE6TZcOdhS8E2VgK6f64+Q309NDCR8qXF
 XuhBWhfn6uTWoLvEVV2fzLmb1kRm5mHZnMCKNPrJt3l6ZdOIflJGjyYct/YPXcRWVAsBL7YqI
 7jNN12HWRQIJPqNi9DH9IMqK3tqOFVD/KlDinkRTlkHHoJwqRhPcSWT8I3Il9/n6za8ZuaG4X
 OD5TYEWYoAzWM6A8q+dj6bkajHAnlUUZvD9DMYAWmtpZvPp1+BLMCyGwMxaR5PrHSzIh7Cv9F
 CChPSiIap37YjRfVCH6lzOjXtfcLqCTIfyC0FbddtcpHRJ1fy0=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 13, 2020 at 4:34 AM <peng.fan@nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Select ARM_GIC_V3, then it is able to use gic v3 driver in aarch32
> mode linux on aarch64 hardware. For aarch64 mode, it not hurts
> to select ARM_GIC_V3.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>

> diff --git a/drivers/soc/imx/Kconfig b/drivers/soc/imx/Kconfig
> index 70019cefa617..0b69024296d5 100644
> --- a/drivers/soc/imx/Kconfig
> +++ b/drivers/soc/imx/Kconfig
> @@ -21,6 +21,7 @@ config SOC_IMX8M
>         bool "i.MX8M SoC family support"
>         depends on ARCH_MXC || COMPILE_TEST
>         default ARCH_MXC && ARM64
> +       select ARM_GIC_V3

It would seem sensible to also drop the dependency on the 'default'

      Arnd
