Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD42447BDC
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 09:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238013AbhKHIf4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 03:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237738AbhKHIfz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 03:35:55 -0500
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB07C061746
        for <linux-gpio@vger.kernel.org>; Mon,  8 Nov 2021 00:33:11 -0800 (PST)
Received: by mail-ua1-x92b.google.com with SMTP id e10so29941437uab.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Nov 2021 00:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eXgMKC9k7dVBPc7GXJ0i9A3v0PLbEQVurYRUswXeJ14=;
        b=GMUrD9cF4ys0Ne5QeiY1boHEUmgLrJKogjRUJYv+JOiOlCLwsHPpus6RLIpS1aTKEc
         b9ZmfolezMysdzYltsRvw38VDRkFvWSASXeRyimw2zzvCQX6337hJfcOxyKjscOpct5F
         NZItoB+PrucYaFhbhqzaHmjIndbDJdCCLj4j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eXgMKC9k7dVBPc7GXJ0i9A3v0PLbEQVurYRUswXeJ14=;
        b=ltwooYbe2dRuGHcb/RIpDlUQEKvO5pencd2Bakyx0wwHFy3DISPpgO30seOKEQW//K
         M21Stv8tKT13JKoYwQu4/rlcumK3vDI4502isKedY1tbFOqmZG5ML0P6Ob68ZFDw/OVJ
         szAUdPnYTiWP/kNzDJNSCEsPduFIO7e0dxoOjbah+5Xbsu9QXyXpsXNAgXMmru9B4H50
         aHkCiFGyGIcQGY6KEct3kJVZqhG0qDAEGx8EpHSV9qMgnGfPgRpommHaRvvWZA9Zd4Tx
         ssBm1cXQHBU+/PgVFqKOoYBDfkLBKeuDBadbbeYj7OMXcSYzZmzxKg1I4N4UpKoqJlR2
         xcDg==
X-Gm-Message-State: AOAM530goZaJlaXYKcTOlVDawKZIa9KNS4X6IdkzYTlVV6jF/w9lLI5U
        tAjkqjNjUx/4mGsY6l1AxeG5P/aRrSY/ZHzOMglTqw==
X-Google-Smtp-Source: ABdhPJxwvn1gZ+jImt6Emh1mXxnrYYIBQQzRFhinEsRuVwhdIgr19u7Y2YDFSD1M4Tpw0lPsAeAjgdJjgrfOjizmG1U=
X-Received: by 2002:a67:ae47:: with SMTP id u7mr101092748vsh.7.1636360390609;
 Mon, 08 Nov 2021 00:33:10 -0800 (PST)
MIME-Version: 1.0
References: <20211104112329.8446-1-zhiyong.tao@mediatek.com> <20211104112329.8446-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20211104112329.8446-2-zhiyong.tao@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 8 Nov 2021 16:32:59 +0800
Message-ID: <CAGXv+5EWCkcC51nNF4k1FgEsVhuiQADCiOcdSLtU9yMb-8Q0GA@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: mediatek: fix global-out-of-bounds issue
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org, mark.rutland@arm.com,
        matthias.bgg@gmail.com, sean.wang@kernel.org,
        srv_heupstream@mediatek.com, hui.liu@mediatek.com,
        light.hsieh@mediatek.com, sean.wang@mediatek.com,
        seiya.wang@mediatek.com, rex-bc.chen@mediatek.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 4, 2021 at 7:24 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

This should be tagged as v2. Your first submission, not tagged with any
version or RFC/RFT, is v1.

> When eint virtual eint number is greater than gpio number,
> it maybe produce 'desc[eint_n]' size globle-out-of-bounds issue.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>

Guodong's Signed-off-by here is confusing, as they are not the author nor
the submitter, and as far as the mailing list is concerned they have not
handled this patch either.

Looks like the original patch is from https://crrev.com/c/3233623 ?

It's customary to preserve the authorship and append your Signed-off-by
when submitting patches written by others.

> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 45ebdeba985a..12163d3c4bcb 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -285,8 +285,12 @@ static int mtk_xt_get_gpio_n(void *data, unsigned long eint_n,
>         desc = (const struct mtk_pin_desc *)hw->soc->pins;
>         *gpio_chip = &hw->chip;
>
> -       /* Be greedy to guess first gpio_n is equal to eint_n */
> -       if (desc[eint_n].eint.eint_n == eint_n)
> +       /*
> +        * Be greedy to guess first gpio_n is equal to eint_n.
> +        * Only eint virtual eint number is greater than gpio number.
> +        */
> +       if (hw->soc->npins > eint_n &&

Nit: I believe it's more common to have the variable on the left, and the
invariable on the right, but maybe it's just me:

    if (eint_n < hw->soc->npins && ...

Either way is OK I guess.


ChenYu

> +           desc[eint_n].eint.eint_n == eint_n)
>                 *gpio_n = eint_n;
>         else
>                 *gpio_n = mtk_xt_find_eint_num(hw, eint_n);
> --
> 2.25.1
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
