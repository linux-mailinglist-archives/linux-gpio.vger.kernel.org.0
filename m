Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77537F986B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2019 19:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbfKLSSu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Nov 2019 13:18:50 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35328 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbfKLSSu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Nov 2019 13:18:50 -0500
Received: by mail-ot1-f68.google.com with SMTP id z6so15177076otb.2;
        Tue, 12 Nov 2019 10:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XTjrI15sJKpXt7dvewwDXHz0pV+jFPaIY5CBR1+M5B8=;
        b=RXZsxcyWXB5gzaKeez4c9288OBzj9Zo01HOIeoOMvveHruIEyNKkVi+9s6I1vQd8iF
         i+dYIsoMTxEf8JcovkcVJTcIYRT+ycop9cdVLSjM6TlecGlUN4I0w8t0Ie1evCREs5XA
         Fu4XhD6TUw7Hzb0bJ42ImFdOXc5KyjeTQgpiE5qhAfHsOP/5XG2Fz8iV2nBHahEhOsmd
         Wf4wX9dTfKzWZ0yL22MnPeXcKMDrneO8QMmX7Jxqdd3LOHKeUhHRVbRsP7Dfl+nAxBU3
         DSlv2NSKKU9luRve65jltlqT6iaoDL94BF1P7CoAJfOxUnjxb9yCqqkSzYbLg1ZazllQ
         37MA==
X-Gm-Message-State: APjAAAVT9bCfAHvG7Zphvf40s3IPeB+abFPkC06lFrNgOStTkf9v/yJk
        vSYpvJcyiobg/f7SS99tA8Ir65o9g7nRVOlXya0=
X-Google-Smtp-Source: APXvYqzD+0NmN816zDyFVW7CaZTRm/xP/54mEwEWwWhYEoQSfE5Y17LnYKLFTjDPUOLhknTl9poWdDu1inn62pEqTEM=
X-Received: by 2002:a9d:5511:: with SMTP id l17mr2705329oth.145.1573582728911;
 Tue, 12 Nov 2019 10:18:48 -0800 (PST)
MIME-Version: 1.0
References: <20191112141819.GA22076@localhost.localdomain>
In-Reply-To: <20191112141819.GA22076@localhost.localdomain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Nov 2019 19:18:37 +0100
Message-ID: <CAMuHMdW2aXF1dcs74joHu4q9xDoPAGmNFwUuVtPVSfFx9EgMmA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Eric Anholt <eric@anholt.net>,
        Stefan Wahren <wahrenst@gmx.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Patrice Chotard <patrice.chotard@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org, linux-oxnas@groups.io,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 12, 2019 at 3:18 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
> Use newly added GPIO defines GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT instead of using hard-coded 1 and 0.
>
> Main benefit is to make it easier to see which values mean IN and which
> OUT. As a side effect this helps GPIO framework to change the direction
> defines to something else if ever needed.
>
> Please note that return value from get_direction call on
> pinctrl-axp209 driver was changed. Previously pinctrl-axp209 might have
> returned value 2 for direction INPUT.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

For:

>  drivers/pinctrl/pinctrl-rza1.c                |  5 ++++-
>  drivers/pinctrl/pinctrl-rza2.c                |  6 +++---

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
