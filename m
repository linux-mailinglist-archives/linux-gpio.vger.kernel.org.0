Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A10E52D6597
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 19:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390631AbgLJSxg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Dec 2020 13:53:36 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46226 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgLJSxY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2020 13:53:24 -0500
Received: by mail-oi1-f193.google.com with SMTP id k2so6846899oic.13;
        Thu, 10 Dec 2020 10:53:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X+VtpZS1e75YA7Ec0/B1orp2GIzvdOi0H1A+93dXCqY=;
        b=tRr8WrvVVvuL6YzhO305G5qrOTb6CBRKZJI36qTRxcycgWF9IQeSsJoUEuda1LlxZT
         Du8diJ48SPmvgLE2EvFE+id3btQ/VTL8LDbYhy1bHfRuRpvJC3yeS+sx+NO8XoOHJRoj
         fTl3HC6nJ51tqPeStkCOMvr5bB3vsoZ5biBJcQyX1zTMo7PDsCMY5GSDhbEEUZ5HOpqZ
         OWJLVn+Afc55lkQQBDR6Etp5EnKMiw8Ps4RyRQPjhpBfz23J7c//Qq5/ftywVCiV8/ej
         1Ig5BCYB6j36WcEw8bUpWcIsTqv7zBhL++93BvAk+Zd+hI7bhakjbjCTT6ejrADR+Ihn
         5xHw==
X-Gm-Message-State: AOAM532/Udu5lohHw3Oj8Vzv6rYWESylKQ/EhSoAF29iMIHo2+rUFttu
        Z8HnoDQivdByd4XOsYEr6KNgcZ4AL8fxfJW8wC5xRV37
X-Google-Smtp-Source: ABdhPJwwCUyiGYofyWRLE6tTBc1GNLHpjFHWlhRODc6u/IqEwfkcbl7SVMuOUg/07s5pM138CMDNPZtLNeeOhfSnlic=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr6398880oia.148.1607626363574;
 Thu, 10 Dec 2020 10:52:43 -0800 (PST)
MIME-Version: 1.0
References: <X9JcUZCLh3WjV7Bw@manjaro>
In-Reply-To: <X9JcUZCLh3WjV7Bw@manjaro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Dec 2020 19:52:32 +0100
Message-ID: <CAMuHMdXbF_AVhx86xO9DJy1+MGwAHSJ3OpCn-DErj=+xAyxJUQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: remove empty lines in pinctrl subsystem
To:     Zhaoyu Liu <zackary.liu.pro@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Andy Gross <agross@kernel.org>,
        =?UTF-8?Q?Bj=C3=B6rn_Andersson?= <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 10, 2020 at 6:35 PM Zhaoyu Liu <zackary.liu.pro@gmail.com> wrote:
> Remove all empty lines at the end of functions in pinctrl subsystem,
> make the code neat.
> Target files: grep -nwR -B1 ^} drivers/pinctrl/* | grep '[0-9]-$' | less
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Zhaoyu Liu <zackary.liu.pro@gmail.com>

Thanks for your patch!

>  drivers/pinctrl/renesas/pfc-r8a77950.c        | 1 -
>  drivers/pinctrl/renesas/pfc-r8a77951.c        | 3 ---
>  drivers/pinctrl/renesas/pfc-r8a7796.c         | 1 -
>  drivers/pinctrl/renesas/pfc-r8a77965.c        | 1 -

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
