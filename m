Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF15438B1E
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 19:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231484AbhJXRzy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 13:55:54 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:42463 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbhJXRzx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 13:55:53 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M9FX5-1mZSUI3jEN-006SRL; Sun, 24 Oct 2021 19:53:29 +0200
Received: by mail-wm1-f42.google.com with SMTP id v127so8366758wme.5;
        Sun, 24 Oct 2021 10:53:29 -0700 (PDT)
X-Gm-Message-State: AOAM532reHIze5043lAPKsvwG8Glp9MECmWcabbqK1pbegkMX7V+ueZZ
        zSl2X9/iB5feVmx/n3ZXCkKvNXHGu1FBVZ4zlhU=
X-Google-Smtp-Source: ABdhPJxAhKvKxvRV90kejl8FnT17ZZByidqHhrwYyLntatIyXa6+UFeOuZK/953n6F+p+BmGC4bLZFSksrkP/BWw3Es=
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr1275704wmj.98.1635098009501;
 Sun, 24 Oct 2021 10:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com> <20211024154027.1479261-2-Mr.Bossman075@gmail.com>
In-Reply-To: <20211024154027.1479261-2-Mr.Bossman075@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 24 Oct 2021 19:53:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a20inw-CoMGda1Hpa77xEa3U1ciVaehCG0SB92-9C8STQ@mail.gmail.com>
Message-ID: <CAK8P3a20inw-CoMGda1Hpa77xEa3U1ciVaehCG0SB92-9C8STQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] ARM: imx: add initial support for i.MXRT10xx family
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        gregkh <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        SoC Team <soc@kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Abel Vesa <abel.vesa@nxp.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        giulio.benetti@benettiengineering.com,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        b20788@freescale.com, Andy Duan <fugang.duan@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:jpAIGFAXZeo2vCLhQFf500yuB1TNv3spR30XUq+7IGS7QbvVIwB
 fAwWPUoU+AQ13qAYv/1ryFOSgu7L+hHejwg3R7aUA2dQIr2r4GKMa1cz2SwvHtKe8Kq5Tfm
 sKuHJTyua+CSDeYPX8bQPh1Mvg1s40TZ/HSVUK2e2Jx6JRSlPTf7ilSZp0v3UCX9JoGquM8
 Z/TJjmn/pU7/xZ2Gvsg+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3zM0WTt5LN8=:eJBY9y89Nl5xRgWe68teFJ
 f01IYMgTK6IOGN5VWDlxea76NqodFk/yoYJYDy2CUFvG/IJm90a9oX9OtROfCTNUmhE01Vl0D
 n+FfUd/WYy815rMBNUXt5CJbqOQOE6TRCq5DffzpuHjwEkDdTZ/8QPvecgnm06FR4dqGRC+QK
 FiLIgsnMrTlybWMAqChsDdAG3K8Ii+zlJbVzMa8/7Af7rq46sp+5esvDRi0rYTRFJqQV7jqnN
 uAJluKkbVC2TsdlPwTle3leKETx14Str/dToLHLoM/JK8tHQXFSZKiSgUXt/JO1PI/DK0QIOa
 aoMSgLpP5V0Iku4vWRB9VTeIL4RyvdUhWWV1YzzI+SlygzIJWCQ2ZHO89PRrYV41LEiqJCF6l
 TAWQFI4ewTgbJSivE0uFdJRUTzwzXUDdLEPxKJ2OxTQb5tky3+A3bw0DSpYaWYtHX1F48NLDq
 T4CrGm/FJbnR5lSruStIvQG9tptpVXFfL2A6C9QsRKDxwRvKyDLubop3TdEfXdJ/EkIvWfsNP
 FgtOD50kXCT69LDXVdnRERGgxotPkEZvJdHc4o35jH76NvQ5jbnS5fP9ZC3hQhU4A2MW5bHMG
 +699uYh6EBc86tMwAIx9FDWHW1+CZfn54fYA1p0XBTAqKs3wActpeJVzl/R0/YVnnJ8Fco1H3
 78c9ggrUDau7e6vY/R8HyB/2h2ZJymt0BqpWFiNyq1GVJQTn2+erageh9bJoy4p6usu293ZNo
 at/ZkEY7YxmpoV0rIPVKxD8xRoqFjBMmkCThCP0LekzCW5TY5Hjqu8tZp5xafydmqwN8szCER
 eIRIlcltBbY0GzR708bKjNA88X6BMH24TeLDM3tHyxCYuW6Ol8=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 24, 2021 at 5:40 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
>
> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
> The i.MXRT10xx family of processors features NXP's implementation of the
> Arm Cortex-M7 core and in some case the Arm Cortex-M4 core too.
>
> This patch aims to add an initial support for imxrt.

> +config SOC_IMXRT
> +       bool "i.MXRT support"
> +       depends on ARM_SINGLE_ARMV7M || ARCH_MULTI_V7
> +       select ARMV7M_SYSTICK if ARM_SINGLE_ARMV7M
> +       select ARM_GIC if ARCH_MULTI_V7

The Kconfig entry appears to contradict the description. Is this platform
only for Armv7-M, or are there also variants with Armv7-A cores?

         Arnd
