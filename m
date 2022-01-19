Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E05F4934B2
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jan 2022 06:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351627AbiASF5g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Jan 2022 00:57:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236524AbiASF5b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Jan 2022 00:57:31 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34189C061574
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jan 2022 21:57:31 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id x22so4800112lfd.10
        for <linux-gpio@vger.kernel.org>; Tue, 18 Jan 2022 21:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=180p+GQo845oNXpNatB24v9mg/wSi3AnjTHWzy7lW5Q=;
        b=UMqQVImtdZBindUj0UKw3O5evttBaDA8C0gzixzt987uQXT8Y5eu/XzX82QJPB1v23
         hEQEO1o+ew6SPORt1AWDbFZAMBA92ijdtJ/2jla70icSIGsX1pWs+rHcXMKrEPkJSoQK
         jLBPjtEkJPK0cfb3/43ILnt6EnITHPad14/tU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=180p+GQo845oNXpNatB24v9mg/wSi3AnjTHWzy7lW5Q=;
        b=0cYGpxBaceQmLQlL3Meo+Lehl6mKkXmZeVRdReG//jw/9QYUd57wKsbRSxFQyVwO4z
         Ina7IMksGqNONmDUZEoHk5WkiNryCvgHpFzpDtTa7mY4ej8mmgaoWuX1eO49Ji+XnF0W
         c4YAvhrpOYvX4H4FqWRL3BMaMK6RuFr0vC/kMg4rvti6GbSGYJ6RjEJ+Dh5iwZcrSoMV
         DncvmfKXdlBUEMJhfn8lRW7Z8xeM6s4IUUzdG3mPZjEukkVJlDKQq5Lr1UqDXEAVyMUT
         inTkH2gXjlcl2KOGQ1r9/Wb5cM6I2TyCB+DhlrBGugXe34+ulRz5MINeXXEtEssGxEaI
         BZdw==
X-Gm-Message-State: AOAM532dxBkAvSblfLqjpTUv97rZ4s2P/7UJITvQtstkzS7wNzchKtbI
        kBpOF+n7vgf6oWxPW4++4FIKEZNnHjnjqze6pNb3WEj936I=
X-Google-Smtp-Source: ABdhPJwmAbYBsIM1/e9VW3yeneVaeA59D14d9Js8kiEwjDiXSmFYOjsOytWEf0XP24p3zVI6PrzW1M84bl2PP9RLYm0=
X-Received: by 2002:ac2:5bc9:: with SMTP id u9mr24297297lfn.371.1642571849473;
 Tue, 18 Jan 2022 21:57:29 -0800 (PST)
MIME-Version: 1.0
References: <20220111112244.1483783-1-wenst@chromium.org> <20220111112244.1483783-3-wenst@chromium.org>
 <eca4a0c18fe75536c8276410628b9459c040dce2.camel@mediatek.com>
In-Reply-To: <eca4a0c18fe75536c8276410628b9459c040dce2.camel@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 19 Jan 2022 13:57:18 +0800
Message-ID: <CAGXv+5GHVtCO9tN7B0O2c5V_Bk61-LL79LvbE1CRbyBfnvKSGQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] pinctrl: mediatek: paris: Fix PIN_CONFIG_BIAS_DISABLE readback
To:     Guodong Liu <guodong.liu@mediatek.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        Hui Liu <hui.liu@mediatek.com>,
        Light Hsieh <light.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 19, 2022 at 9:42 AM Guodong Liu <guodong.liu@mediatek.com> wrote:
>
> -----Original Message-----
> From: Chen-Yu Tsai <wenst@chromium.org>
> To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <
> linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Chen-Yu Tsai <wenst@chromium.org>,
> linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
> linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
> Zhiyong Tao <zhiyong.tao@mediatek.com>, Guodong Liu <
> guodong.liu@mediatek.com>
> Subject: [PATCH 2/7] pinctrl: mediatek: paris: Fix
> PIN_CONFIG_BIAS_DISABLE readback
> Date: Tue, 11 Jan 2022 19:22:39 +0800
>
> When reading back pin bias settings, if the pin is not in a
> bias-disabled state, the function should return -EINVAL.
>
> Fix this in the mediatek-paris pinctrl library so that the read back
> state is not littered with bogus a "input bias disabled" combined with
> "pull up" or "pull down" states.
>
> Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that
> implements the vendor dt-bindings")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c
> b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index f9f9110f2107..1ca598ea7ba7 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -97,8 +97,8 @@ static int mtk_pinconf_get(struct pinctrl_dev
> *pctldev,
>                         if (err)
>                                 goto out;
>                         if (param == PIN_CONFIG_BIAS_DISABLE) {
> -                               if (ret == MTK_PUPD_SET_R1R0_00)
> -                                       ret = MTK_DISABLE;
> +                               if (ret != MTK_PUPD_SET_R1R0_00)
> +                                       err = -EINVAL;
> Hi Chen-Yu
>
> When tht API "hw->soc->bias_get_combo(hw, desc, &pullup, &ret)" is
> called,
> The ret vaule of may be MTK_DISABLE OR MTK_PUPD_SET_R1R0_00 or  (pullen
> == 0),  All those cases are expected to be as "bias-disable".
> We advices to keep original code,
> +                               if (ret == MTK_PUPD_SET_R1R0_00)
> +
>                                 ret = MTK_DISABLE;
> +                               if (ret != MTK_DISABLE)
> +                                       err = -EINVAL;

IIUC you are suggesting to assign MTK_DISABLE to ret in the other two cases,
and then check if ret == MTK_DISABLE.

Thanks for pointing that out.

ChenYu

> Thanks
>                         } else if (param == PIN_CONFIG_BIAS_PULL_UP) {
>                                 /* When desire to get pull-up value,
> return
>                                  *  error if current setting is pull-
> down
>
