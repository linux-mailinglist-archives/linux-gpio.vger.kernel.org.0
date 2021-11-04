Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC00444EA0
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Nov 2021 07:08:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhKDGKp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Nov 2021 02:10:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:48370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229912AbhKDGKp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Nov 2021 02:10:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7521610FC;
        Thu,  4 Nov 2021 06:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636006087;
        bh=u78YSZDJYfigsy7GL5G4yNXKMBMaWKzma9S8XVynMwU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IfwmvxhgW5ygKsNG9ghm67gSI+9in4oE7VZi3M9NdBRTc7q7OKEc/v9JxqqreH519
         2FgObB627O+Vd4jwdfJjO+vKq6HIQ1097QFpWEgz7T3mJtq1yn/zcLC5L3r7oFb0uY
         i0K9/lkCxsDNYzEy/5aKapx0UOzDqPa2MKAwCWPKaupiAxQzmJVXPaGAe0fl/HATd6
         XTeA4CgrxElzaF7mL/u2mVC3dk8EwlFUf1IvUrIxBoD8M9b81zZU21V2OdgCHVricw
         DQwL36KZEUr2jTz3eD2ZHvydn6x7uzu633WI34AZjYV38KfCuGkm5syr1MYN23ozmH
         h8vxWyWrUh1hg==
Received: by mail-ed1-f52.google.com with SMTP id f8so17633091edy.4;
        Wed, 03 Nov 2021 23:08:07 -0700 (PDT)
X-Gm-Message-State: AOAM532I4UpweDp5D1l87q2x5FY6F25ofghiOrm355o9QLPvC3l89Bhk
        Irtm4xwvx8uG3n6mMcoW1tGyuoJPUkyd/LG1ryg=
X-Google-Smtp-Source: ABdhPJyBVxTLTZ4b6DuU6NgWddxlcUlTiORn1PjxDqGqHxAT4Fs7BTZ9YjXfyqWgfOtH18SsScYUNl5vcRMqFHPTJCI=
X-Received: by 2002:a50:bf48:: with SMTP id g8mr67634296edk.10.1636006086162;
 Wed, 03 Nov 2021 23:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211104014039.26772-1-zhiyong.tao@mediatek.com> <20211104014039.26772-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20211104014039.26772-2-zhiyong.tao@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Wed, 3 Nov 2021 23:07:55 -0700
X-Gmail-Original-Message-ID: <CAGp9LzpEG_6w6fvmjaBAW3ihKQZm4uMEy9-5MaLLWkeu+QFqeQ@mail.gmail.com>
Message-ID: <CAGp9LzpEG_6w6fvmjaBAW3ihKQZm4uMEy9-5MaLLWkeu+QFqeQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: fix global-out-of-bounds issue
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com, Light Hsieh <light.hsieh@mediatek.com>,
        =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>, rex-bc.chen@mediatek.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

HI, Zhiyong

On Wed, Nov 3, 2021 at 6:40 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
>
> When eint virtual eint number is greater than gpio number,
> it maybe produce 'desc[eint_n]' size globle-out-of-bounds issue.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 45ebdeba985a..9d57c897835c 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -286,7 +286,8 @@ static int mtk_xt_get_gpio_n(void *data, unsigned long eint_n,
>         *gpio_chip = &hw->chip;
>
>         /* Be greedy to guess first gpio_n is equal to eint_n */
> -       if (desc[eint_n].eint.eint_n == eint_n)
> +       if (((*gpio_chip)->ngpio > eint_n) &&

please use "hw->soc->npins > eint_n" to perform the boundary check to
be consistent with the other places for the same purpose

> +           desc[eint_n].eint.eint_n == eint_n)
>                 *gpio_n = eint_n;
>         else
>                 *gpio_n = mtk_xt_find_eint_num(hw, eint_n);
> --
> 2.25.1
>
