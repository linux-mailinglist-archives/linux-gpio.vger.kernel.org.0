Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292B12E93FA
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 12:17:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbhADLRc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 06:17:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:37282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbhADLRb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Jan 2021 06:17:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D979E21D93;
        Mon,  4 Jan 2021 11:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609759011;
        bh=uMBEM1sBct3RdywsmPonApX/v+gWFaKH66WhG0tYHo0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rKCA3FxFwVrkONJGWdD30YVr8xvJ6+8FM5PJBOqETMPAkaO4uLxDQ5TBvptn7bW29
         uKeVaD6XwKGA3IGegC4XAu91TOSOudhULm/IXI8VFXsUSsP/5oFOGoD/fHw7Kq5ViK
         NoSVc5E/2OCw1bW5NzUAlG6AYRjUOSWI1JYVOjT6sIcq6Mbl0aflWQkk3cP1mdcWcA
         3wFzee3cmEkd6AagD39M2h1nhcIn/4F/Gecr1niZRZ/gPYxe+4nnjFiFqeG2SizDVF
         hbki3Gif3ki3V4ybA5dGH8x8mjYzx+FRbUna/wnT0617S5PJitl9PWRIXN26+3S0jO
         Jqmw9DGAX89QQ==
Received: by mail-ed1-f44.google.com with SMTP id h16so26903912edt.7;
        Mon, 04 Jan 2021 03:16:50 -0800 (PST)
X-Gm-Message-State: AOAM531I9xK0V7b3FJHjs+Qyp6UPZyQTSiZrJDlrmvyr4R9bUTtmjcU6
        o6pnLhXt+cx+ZO2F9wBf+L+9l05DP/TQfJCnaYc=
X-Google-Smtp-Source: ABdhPJyPIH882GUu/EUWEx2AKmMDKuflMAHIUbwC22Baw4r62pz5lztcMLZKWa93i6Qqm2usbqJ76cllwrXrlKQOX6c=
X-Received: by 2002:a05:6402:1d3b:: with SMTP id dh27mr71532550edb.238.1609759009492;
 Mon, 04 Jan 2021 03:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20201228090425.2130569-1-hsinyi@chromium.org>
In-Reply-To: <20201228090425.2130569-1-hsinyi@chromium.org>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Mon, 4 Jan 2021 19:16:38 +0800
X-Gmail-Original-Message-ID: <CAGp9LzqEaBNBzd2DhtWZ=Dv9C1u1MZzpFFofGGEprMOJCdUXHQ@mail.gmail.com>
Message-ID: <CAGp9LzqEaBNBzd2DhtWZ=Dv9C1u1MZzpFFofGGEprMOJCdUXHQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix fallback call path
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Light Hsieh <light.hsieh@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 28, 2020 at 5:04 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Some SoCs, eg. mt8183, are using a pinconfig operation bias_set_combo.
> The fallback path in mtk_pinconf_adv_pull_set() should also try this
> operation.
>
> Fixes: cafe19db7751 ("pinctrl: mediatek: Backward compatible to previous Mediatek's bias-pull usage")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Acked-by: Sean Wang <sean.wang@kernel.org>

> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 7aeb552d16ce9..72f17f26acd80 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -920,6 +920,10 @@ int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>                         err = hw->soc->bias_set(hw, desc, pullup);
>                         if (err)
>                                 return err;
> +               } else if (hw->soc->bias_set_combo) {
> +                       err = hw->soc->bias_set_combo(hw, desc, pullup, arg);
> +                       if (err)
> +                               return err;
>                 } else {
>                         return -ENOTSUPP;
>                 }
> --
> 2.29.2.729.g45daf8777d-goog
>
