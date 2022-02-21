Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7D604BE7B8
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Feb 2022 19:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355139AbiBUKij (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Feb 2022 05:38:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355106AbiBUKiU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Feb 2022 05:38:20 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E084550F
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 02:00:04 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id y189so11522550ybe.4
        for <linux-gpio@vger.kernel.org>; Mon, 21 Feb 2022 02:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F8HuNySVihr78JUk0vBH8HXUJwDNKfDdsdrX5GTI+fw=;
        b=bAZXExZd+gxJtSTV7+Cl+juk/koeY8qUYRcHiHdx4OLHds0lP0j2k95Yoja1zspyPW
         PxkWRNElHihsuEQjoU6UkR3osF8rm0AKqO9FNzOQFrGVbPN1b99QgopYtsgD2iCIH5Bb
         6V8KhWB1Tai5uNY2MrdUqQXjIykD9euiykEhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F8HuNySVihr78JUk0vBH8HXUJwDNKfDdsdrX5GTI+fw=;
        b=lMs6YWik1g/8Ow8jlN0YZD5OqojyTa+YjuSXWk3VNE87CQihw8K7RlGo8OaLjwO86B
         sA4WuV1252RyEFm4B+Z19w5/okb6Up5UcaDUeVNQPSi945wVkkT7Clqk2CqCAPPxsNmi
         E4AjZM3zOpDnQuhSEfhv/BnROeDzUIqLBXHzy3uw3jrXI9ZEkDhE6ch7X5xnUDfeqWul
         +6K8V4wEjlc6yXSTOU86+oXZrMHvcHkAKzCpwa7A4qDkFDGccYHQ7eI03Piy85FjfBeP
         yZzeSsQUD8vf9sVOznUUH5ndPlpQZMum7xZfiJk44nL8jrHukF8ueUS+OEdZobR7lQJO
         /xcQ==
X-Gm-Message-State: AOAM533QHdekxSYvVY7JDNza8zW34ekYyemcJFyqvfwwSGl48ACRBkvN
        Rzl6T8FcRfXotnUPQz7GDvJKudRThqednFbKOfadEw==
X-Google-Smtp-Source: ABdhPJzj2xGSWW3dtoB4HYY0TFlVeVNSRyLkGtxJKKdnpmA6oOgI0wkRR7ct9tHr9/2ktGXg79fQvWv0ugrsUMYjaFU=
X-Received: by 2002:a25:a486:0:b0:61d:a523:acd0 with SMTP id
 g6-20020a25a486000000b0061da523acd0mr17094521ybi.203.1645437590821; Mon, 21
 Feb 2022 01:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com> <20220210141931.291712-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220210141931.291712-5-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 21 Feb 2022 17:59:39 +0800
Message-ID: <CAGXv+5GLSnr1rQ_K3Y1Ou3ocoq7cSmv8GMkRCEi4adxewY1dHA@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: mediatek: common-v1: Commonize spec_pupd callback
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sean.wang@kernel.org, linus.walleij@linaro.org,
        matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 10, 2022 at 10:20 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Reduce code size and duplication by using a common spec_pupd callback,
> which is possible to use on all of the pinctrl drivers that are
> using the v1 pinctrl-mtk-common code, with the exception of mt8135,
> which has a different handling compared to the others.
> Since the callback function signature was changed, this had to be
> propagated to pinctrl-mt8135's spec_pull_set().
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

[...]

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 007da39b68c9..5e1d17512a0d 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -222,9 +222,8 @@ static int mtk_pconf_set_driving(struct mtk_pinctrl *pctl,
>  }
>
>  int mtk_pctrl_spec_pull_set_samereg(struct regmap *regmap,
> -               const struct mtk_pin_spec_pupd_set_samereg *pupd_infos,
> -               unsigned int info_num, unsigned int pin,
> -               unsigned char align, bool isup, unsigned int r1r0)
> +               const struct mtk_pinctrl_devdata *devdata,
> +               unsigned int pin, bool isup, unsigned int r1r0)
>  {
>         unsigned int i;
>         unsigned int reg_pupd, reg_set, reg_rst;
> @@ -232,8 +231,11 @@ int mtk_pctrl_spec_pull_set_samereg(struct regmap *regmap,
>         const struct mtk_pin_spec_pupd_set_samereg *spec_pupd_pin;
>         bool find = false;
>
> -       for (i = 0; i < info_num; i++) {
> -               if (pin == pupd_infos[i].pin) {
> +       if (!devdata->spec_pupd)
> +               return -EINVAL;
> +
> +       for (i = 0; i < devdata->n_spec_pupd; i++) {
> +               if (pin == devdata->spec_pupd[i].pin) {
>                         find = true;
>                         break;
>                 }
> @@ -242,9 +244,9 @@ int mtk_pctrl_spec_pull_set_samereg(struct regmap *regmap,
>         if (!find)
>                 return -EINVAL;
>
> -       spec_pupd_pin = pupd_infos + i;
> -       reg_set = spec_pupd_pin->offset + align;
> -       reg_rst = spec_pupd_pin->offset + (align << 1);
> +       spec_pupd_pin = devdata->spec_pupd + i;
> +       reg_set = spec_pupd_pin->offset + devdata->port_align;
> +       reg_rst = spec_pupd_pin->offset + (devdata->port_align << 1);
>
>         if (isup)
>                 reg_pupd = reg_rst;
> @@ -293,12 +295,13 @@ static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
>          * resistor bit, so we need this special handle.
>          */
>         if (pctl->devdata->spec_pull_set) {
> -               /* For special pins, bias-disable is set by R1R0,
> +               /* For special pins, bias-disable is set by R1R0

Nit: This seems unrelated, and doesn't read correctly either way.

ChenYu
