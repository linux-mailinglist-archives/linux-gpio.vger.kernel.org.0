Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54AA6260C04
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 09:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729322AbgIHHbf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 03:31:35 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:60583 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729252AbgIHHbb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 03:31:31 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MzQc2-1kSwBj0wrI-00vMjO; Tue, 08 Sep 2020 09:31:27 +0200
Received: by mail-qk1-f174.google.com with SMTP id w186so14486210qkd.1;
        Tue, 08 Sep 2020 00:31:26 -0700 (PDT)
X-Gm-Message-State: AOAM532Z5f4RIG6NU9P+NnAg45A83raBHCQbHgpr0CHzR+FwcD8MDj2i
        4di64qU1BHSKMOE6cEAg8f6ssmG6AhdPXiuoxhA=
X-Google-Smtp-Source: ABdhPJzVrV5pr+fBm34K9U0IIQyH+DEtl58pzPVS1R/9WsIYAhtAAKh5aJh9FxNNMGbiGLMExWvt7mx3apT5LWd53WI=
X-Received: by 2002:a37:a04b:: with SMTP id j72mr23336718qke.352.1599550285996;
 Tue, 08 Sep 2020 00:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <1599549126-17413-1-git-send-email-Anson.Huang@nxp.com> <1599549126-17413-3-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1599549126-17413-3-git-send-email-Anson.Huang@nxp.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 8 Sep 2020 09:31:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1NY07QmD+vzD3+5DsY69XYcwEz3vuwXUcsVG6jxwtTow@mail.gmail.com>
Message-ID: <CAK8P3a1NY07QmD+vzD3+5DsY69XYcwEz3vuwXUcsVG6jxwtTow@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] pinctrl: imx: Support building i.MX pinctrl core
 driver as module
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:2zyq8Wycbwc5PM/Vv2JQw0fwxXHDr4zKCsBQfvtI4tXJlbs5S80
 o0oCVtjvo9rq8cGtf6gquwAmJyFt12rQ/PEfJZpWd0W911SBD1IgsP3k8YeMw6X1g5DWVD3
 K292KoBniWq/4R0TahbJI8k2EgFImfG8mbCqYc6b1vGWdqkO3lXbBk8kiUQRFlzQf1no77l
 kMjnPhi8rD7tKGgxtVV8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xCCp4AjAeKc=:H31grS9MPIv9d8KrhyNWmI
 HeFqqDb0m3Zedew3I1nyrBFK+dPjyEltIvcTtQBc2AcR9fegsngXMCvXioFYxB1XHejyxCWWc
 BJg3rN7soBLpPAbcCOk833AiyFIp1lG8k9ig6UUD5WxR9diiCV/P9HWWEuQmL2D+u/yI9x5ZG
 7GfA6F73Sa1uoz23rf5iu6XYdVh2F82jynmg9zNe2ypLNvYr3QiEOI+TbDA1qDMTJVmcP9cGu
 Ob/ocSIo9ULr3yaxR9OyXxz3tn5EOfeAcIAPE1iJ8KVlW0LEO+8MKwsBmdyUIVukDJoK9v9g+
 fxqhrVq0d5o58G3RbuxTchzwJD+nNMa2GUyY/QPV+hEDzyl4mtGgManCdiiR5cn3mzXEg9x2r
 b628x1rkdCKzx45xokJjgY2lQng0YTuX7s3WAyH9MfQC+E8qmRCOEZDeCE0c4AjZbgkP7P/9v
 O4cKelcG4OIc04IvmJt0dIQMpYedSvwdy2NEnkxJiQjbiJx1v3P9hRzHL/8E8sCtYfTtUymPl
 aL2ShPDU0D2pDLJ9YeIxbDJQ0Icui+tCdwoUbbNXEVfFZboqFjrHpUaCgMR5YO+e6MFEXtkyJ
 siEMnAGDA8Mm+kl5X87wu29fVv3vVWVbenSiq3qpeipeQqrUma4xkPq35LnMe8tIK9Iaae+s4
 OliFsCYFExdAFGWqoINk1E2dD52o+xlj7U+4ur371gM/W0EAVqhE6jZ3xlCeMyfaCe54vZyYe
 6sFoGw6mm5EaVGA1lpSNs9+pWV1HRXoCRvRGOA9EtegFb2QNWYisShbD7L4qtQ9nEWGFY/SvV
 OHK8Q2Lfm1r3LCqMPPTvZ72c3hxU4zwALIH7h/FerxbHg5nHB03vBxBvBApBBab5kr2QNse
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 8, 2020 at 9:20 AM Anson Huang <Anson.Huang@nxp.com> wrote:

>  # SPDX-License-Identifier: GPL-2.0-only
>  config PINCTRL_IMX
> -       bool
> +       tristate "IMX pinctrl core driver"
> +       depends on OF
>         select GENERIC_PINCTRL_GROUPS
>         select GENERIC_PINMUX_FUNCTIONS
>         select GENERIC_PINCONF

I don't see why you need to make this option user-visible when it is already
selected by the drivers that need it. Wouldn't it be enough to change
the 'bool' to 'tristate' without adding a prompt?

       Arnd
