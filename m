Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEB8438B44
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 20:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbhJXSKB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 14:10:01 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:57217 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232124AbhJXSJd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 14:09:33 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MUXd0-1mELKI1wQq-00QUNj; Sun, 24 Oct 2021 20:07:10 +0200
Received: by mail-wm1-f51.google.com with SMTP id 62-20020a1c0241000000b0032ca21cffeeso6635149wmc.1;
        Sun, 24 Oct 2021 11:07:10 -0700 (PDT)
X-Gm-Message-State: AOAM530Z7cgZIoK7uLht4FY6miDP0DyyxpNQ1g9hQ2Yrl1Kem7YX+UuX
        ANxdYXgmSoSQSjGuF3w3XynOd38o7K9dAffFk4M=
X-Google-Smtp-Source: ABdhPJxtbVJrHWYPggYA8yPeJNUl2q0CmjGNKBR3lA5Z+IxWQD60zbwZCG/IT3XsglTcMiUM4ygKRYscIv8VMUDJQ9I=
X-Received: by 2002:a7b:ce93:: with SMTP id q19mr1339077wmj.98.1635098830063;
 Sun, 24 Oct 2021 11:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com> <20211024154027.1479261-4-Mr.Bossman075@gmail.com>
In-Reply-To: <20211024154027.1479261-4-Mr.Bossman075@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 24 Oct 2021 20:06:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2sZtPAh-++7oH59g9BQSzXN+yheFxeac0XBJjzbFqakQ@mail.gmail.com>
Message-ID: <CAK8P3a2sZtPAh-++7oH59g9BQSzXN+yheFxeac0XBJjzbFqakQ@mail.gmail.com>
Subject: Re: [PATCH 03/13] dt-bindings: imx: Add pinctrl binding doc for i.MXRT1050
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
X-Provags-ID: V03:K1:ng9ql4UQ+cIo8gV19g2bstZgV/zDfKwfNuXRq5alZaRvAbikTu5
 62hnCF6q41QGCfV7NxuGszwTNXkBXnrd7HfxqRICp4PPCWbPTGPq+AfSBqiUI517O0J9A6i
 8jClQZQ0oGVrHshCTHJegP9+WeUsgi8VUDebgHm4DzAx1HFdse8/kZjsj5HmuJlhbjI1EkW
 o2RjozbFGLbYTKwipAvZg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BQDbPqq5jcY=:u16L+VEQmRjLHoHhwnoZpt
 kn20RRpYfotpZL3nrIlnNB1L91LbFi7BLpNGGBM3QHZAfKtWkAiB63OhTEgqzqup3RzRJCf/O
 IqQh/dUscNJ/ogR6Id9WGdc/Syp/8TVAYYgKuiwftWKxPrODjKJ/bUCawYkNBNNgeyXAf3JKd
 RVHt/shOOLJLw9SmtE2eApftY4MiVLO4jG7900sA33b/m7RsgdO09X5rLNGuo/DxeyceImF24
 7Pj573RQqPC035GQKyKVFktyy3Y+Q9pWJfUMUQm+LDe81UlBPnYxC/jL1cOBsLJ6QYmOY/cJf
 ysM/1r+lRuenLSwvGDot1xgV6PTepPbvPTEToybJ6sxsaqICmQ6HGUAivWmthw1ZwfYjvHmMZ
 PqJSN1IHfie822o/1TloYPvWzT3RCtajNaYMi76g4AP+LR/kQU3x3uHPjMhw/AO7KnCYvWaj4
 PUtLN6n704ddzWFoWjaUB5gge6GFqhYoHTccvRP7Fmo0p01GWYvq3IU4nWG19mm4jsEDt7CWE
 PFyUqvHuxgFDGSFSsazzTyJzwhDlEHxiAz32pU/3G1eqxpQ2vJQ1T1nGNN3zm/G/cP7v6Eomn
 fRWMhdgxR69OWmKRUgSVCSBltv/MEuSiVdHXmda0rdLwEo7vYFrKMvYneKd2QM9nzwhAzl59R
 dGmU7k1m7iaztY9csJ97r5YU/TWe7+VYG6Fz1WQfVLEv54jkGzRtU/DCjM+84KJ55Dxep8XwI
 aQjO4zF6hTTBiNfxW2iVa/5KyKydD4rkZjMsuncuoy6PTdVC76XHUuteJ/xujncUzeyhPejd8
 hUeSKGEb8x5EvYRUCBdjw4R/QZeu31v9EIZl51DZG3pMyk1kr8=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 24, 2021 at 5:40 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> +/*
> + * The pin function ID is a tuple of
> + * <mux_reg conf_reg input_reg mux_mode input_val>
> + */
> +
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_SEMC_DA00                          0x014 0x204 0x000 0x0 0x0
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_FLEXPWM4_PWM0_A                    0x014 0x204 0x494 0x1 0x0
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_LPSPI2_SCK                         0x014 0x204 0x500 0x2 0x1
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_XBAR_INOUT2                                0x014 0x204 0x60C 0x3 0x0
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_FLEXIO1_D00                                0x014 0x204 0x000 0x4 0x0
> +#define MXRT1050_IOMUXC_GPIO_EMC_00_GPIO4_IO00                         0x014 0x204 0x000 0x5 0x0

The constants don't appear to be needed in this header at all, as the binding
looks completely generic with a tuple of five values, so  you could simply
open-code the numbers where they are used, no need to include these
in a driver.

        Arnd
