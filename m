Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5A1224A9FF
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Aug 2020 01:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgHSXnc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Aug 2020 19:43:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:46738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726209AbgHSXna (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Aug 2020 19:43:30 -0400
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CBB4920885;
        Wed, 19 Aug 2020 23:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597880609;
        bh=ElRgQNa+eCXKxKGiAwXCvT5SEdd/aIQYRPIeKR0A834=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lsGv7IjxoikfbbLi8veuPzeJZ4LzzUuP8aF0z+SUXXzi6hloYN69Oxkth75X7fuhx
         Pq3maN5J9QUHHgZNAc7O730nLvimgC0Ja4dzYQj3ncuK3mseUtibMYtnsOLeW8ZhvH
         SJUXUHgEK++U51u9gKAggXVtsIWRGANPt6nP1VBw=
Received: by mail-io1-f47.google.com with SMTP id t15so542274iob.3;
        Wed, 19 Aug 2020 16:43:29 -0700 (PDT)
X-Gm-Message-State: AOAM531iA1HECs8spdpL21INO6iEQEBvcBpSv7fAw/KVJTz+a5ccMpUT
        r+HcoXmG32TaTE6QOEtxY/8OMcFu/rYhybONuMo=
X-Google-Smtp-Source: ABdhPJywImw8dXNnBobaBopdocSp5GlcwoPSbxbSaryZt8nivOMkmwgkEBFD3B3CiPbqAgeiGZaHFLwLGbaFwxJnAgc=
X-Received: by 2002:a6b:c88f:: with SMTP id y137mr321019iof.55.1597880609305;
 Wed, 19 Aug 2020 16:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <1597317260-24348-1-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1597317260-24348-1-git-send-email-hanks.chen@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Wed, 19 Aug 2020 16:43:18 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzq7H_KREyhxNy1zBsBJdFRAA7Zc1jkGc=ZiN_og1H9KBQ@mail.gmail.com>
Message-ID: <CAGp9Lzq7H_KREyhxNy1zBsBJdFRAA7Zc1jkGc=ZiN_og1H9KBQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: check mtk_is_virt_gpio input parameter
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        CC Hwang <cc.hwang@mediatek.com>,
        sin_jieyang <sin_jieyang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hanks,

On Thu, Aug 13, 2020 at 4:14 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
>
> check mtk_is_virt_gpio input parameter,
> virtual gpio need to support eint mode.
>
> add error handler for the ko case
> to fix this boot fail:
> pc : mtk_is_virt_gpio+0x20/0x38 [pinctrl_mtk_common_v2]
> lr : mtk_gpio_get_direction+0x44/0xb0 [pinctrl_paris]

it is better we post the complete call stack when the failure occurs

>
> Fixes: edd546465002 ("pinctrl: mediatek: avoid virtual gpio trying to set reg")
> Singed-off-by: sin_jieyang <sin_jieyang@mediatek.com>

signed-off-by with the full name

> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index c53e2c391e32..27ab9c512ae1 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -259,6 +259,10 @@ bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n)
>
>         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio_n];
>
> +       /* if the GPIO is not supported for eint mode */
> +       if (desc->eint.eint_m == EINT_NA)

s/NO_EINT_SUPPORT/EINT_NA/ to align with pinctrl/mediatek/pinctrl-mtk-mt*.h uses

> +               return virt_gpio;
> +
>         if (desc->funcs && !desc->funcs[desc->eint.eint_m].name)
>                 virt_gpio = true;
>
> --
> 2.18.0
