Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C212D184472
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 11:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgCMKJm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Mar 2020 06:09:42 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:35973 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgCMKJm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2020 06:09:42 -0400
Received: from mail-qv1-f43.google.com ([209.85.219.43]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N5max-1jMwc32PVb-017Edn; Fri, 13 Mar 2020 11:09:40 +0100
Received: by mail-qv1-f43.google.com with SMTP id cz10so4255862qvb.0;
        Fri, 13 Mar 2020 03:09:40 -0700 (PDT)
X-Gm-Message-State: ANhLgQ209Q0Xsh9YwcpYqDKGyqqBhasdFmUT/aaujawpP+VxKKMRDH2r
        qOIimB7zMzPIZNlOAz6Fp734atSGuZS/nVZ1SkY=
X-Google-Smtp-Source: ADFU+vt+dplEfE+ba1F4rk6ReC6fOrvYlwWx8VR6mDemNP62902HsNZ8v7xXfhRh1qV8DDzdMc9fSjwZ+1FAfpkb8Yk=
X-Received: by 2002:a0c:f647:: with SMTP id s7mr11509624qvm.4.1584094179347;
 Fri, 13 Mar 2020 03:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <1584070036-26447-1-git-send-email-peng.fan@nxp.com> <1584070036-26447-2-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1584070036-26447-2-git-send-email-peng.fan@nxp.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 13 Mar 2020 11:09:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1T5+9XioY5qW4Eoxbanp65cS+ffLie+erANw4ywUEAGA@mail.gmail.com>
Message-ID: <CAK8P3a1T5+9XioY5qW4Eoxbanp65cS+ffLie+erANw4ywUEAGA@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: freescale: drop the dependency on ARM64 for i.MX8M
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
X-Provags-ID: V03:K1:+RmOc7PXrsJSseKFFBMuCwfk87T03nH+DfBJenBveFxpC9xrbSI
 m/SFNuWTW79eFjW7rMdCsFBy0DTmjPfb9+HqAG7/qudSFDwqqccemVmTEuBfErUomcKfGt/
 nUpXsva7jeiXj5JlfAEEIGFhQE6OXLLm4bgU5YvVMoDR07BrJph2bfDkIc7qWAuDQb98XvV
 NvgkoeUc16DaRjjUoP0Ug==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xNaAwfrGQp0=:+myvPq7H2ApqeT+VMcVZs6
 lGCZV5hVheumvIlXb3BZo2fbv4RnixOFSTdm7+QoRQx/hi/DGw1rUdsh2zvppGbzGWBGyBl8M
 65HhMj8ICSOQQL3fTIm2+dFWLlCYiTnlvKxnZggO0MeocB22oY+3G5rCqiIgElm0ChT7cDYY2
 YxuZ/NbFJFrlSuivnUjVZ6xLSiCkIEnu0SQGkHlXxDScZJBJXcijF1iQ2xizqOVx/60PhmMf7
 C0vXc8sxgr6JeYGjIRnLSGDHTK69Dhk5SguF+uzhgrSd6q7DMSIeDZCB5+xXS4qZgTQTHLuIQ
 RhBAAylr6vdlZkcWA9Z7HT7UhVxd7JjhvGI3jCscxxZWkjB7ZVqJo1n77s9usgpao6NYFDzvM
 VhmeW2Sxjhq2mP3FDrjjPH4EMYxpNT7+vWzmG6wa/0LJJFh/5LRKXQlkNEbBXZrDNbvJyfSyE
 IYUPY7m/W6XJKjnfk1mRY88ZtlVypm/LHLFUpdMvtWdIJ0OmOKLNkIHVO+q3I6bR4L/VPXmGR
 KO3tBYwbpjubhnTO1FjA0xugdaolwiU5PpxrzEsAK4ofThRgdUiF4jzhuRO/Cvyy358a/CAC3
 x29QxxiCJLa2v/0gvr57szgbKs3V2kp5six51UFFDvLw885rr0CzTq2QHnsvySWBUMs3OVzN1
 NLzxrq0kKC2dwCbIYpTj8tCxWnBCbsaSYBaBtL3+T7fhv9AuDkBc7U93D7gGsivst5sEGNBTS
 P96FSuzJJ2PRp4SOHyUhtDX91Ix80vaqC7Nj6pnfsrQP9gPImeuSjTVk7ZOlOig56dp0rpfMK
 +OtQ6POH8GcvhrHL0FZjkww/sBGchp4i+jviHaY3Cu9C9ry3Bc=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 13, 2020 at 4:34 AM <peng.fan@nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Moving to support aarch32 mode on aarch64 hardware, need to drop
> the dependency on ARM64 to make the driver could be selected for
> ARM32.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
