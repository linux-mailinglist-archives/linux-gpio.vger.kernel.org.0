Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5319233CCE3
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 06:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235173AbhCPFGO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 01:06:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:49234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235171AbhCPFF5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Mar 2021 01:05:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1CFD65142;
        Tue, 16 Mar 2021 05:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615871157;
        bh=cVbmNCunkCaS+UAXYbKdMGWrvOK5rfRn967P5BV1mvA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SZ7Qqv3k+z2lfXwJh0IzauQzRLnEreEAVuM+XCb0RdV0tQF43Wc8vp53HfcDlCpFn
         yG0XIbtCPqJjzn4yGQDvX51s7TEP5IA530a7znIQma4Nvrqc+jWIVywDjXSbgXX842
         kyFN068A9+RSluiQWses1QdyAY4VUeAoIgxyI15Cb5qZ6B2hwrmxEFk7s5cfoJyx+m
         IvgbYioMWjAmlGvrWxcEFr5HJY/B11ebvtT3mQeiW5suHU8iWgGs8ZYV/9AaEWM2pU
         Nr/hOQJFZmzvBbA43CloONeZ5l7ulqVYYsdmgZHaMX/G+GHieD1oxNoRXf86iJI+tz
         r6jDwZhxnCsig==
Received: by mail-ed1-f42.google.com with SMTP id bx7so19946176edb.12;
        Mon, 15 Mar 2021 22:05:56 -0700 (PDT)
X-Gm-Message-State: AOAM530LkpbQb6LuBPOsXGuvxybe9C/880bL/QUkMd9mLGvTtcqs5ddI
        nXJ6E2d5DIIb6S/BRiKc9ieJOlxJFK3KA2gJGUw=
X-Google-Smtp-Source: ABdhPJzK79FmgJ0C57g+KUn1bwdww1LQ8aLQZI1QQ9/6Bf3ST4MJLgWngCooLHXFbLFO/wbHLPrOHtDkOhlc+tqhAiI=
X-Received: by 2002:aa7:d792:: with SMTP id s18mr33267634edq.176.1615871155305;
 Mon, 15 Mar 2021 22:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210312063502.3685-1-zhiyong.tao@mediatek.com> <20210312063502.3685-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20210312063502.3685-2-zhiyong.tao@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Tue, 16 Mar 2021 13:05:44 +0800
X-Gmail-Original-Message-ID: <CAGp9Lzq+NQhguSoc5DE4kyUgi2uSNOkURuAeAFpGuizcaXUXew@mail.gmail.com>
Message-ID: <CAGp9Lzq+NQhguSoc5DE4kyUgi2uSNOkURuAeAFpGuizcaXUXew@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: add lock in mtk_rmw function.
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com,
        =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= 
        <eddie.huang@mediatek.com>, jg_poxu@mediatek.com,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        =?UTF-8?B?RXJpbiBMbyAo576F6ZuF6b2hKQ==?= <erin.lo@mediatek.com>,
        =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>,
        seiya.wang@mediatek.com, sj.huang@mediatek.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Zhiyong,

On Fri, Mar 12, 2021 at 2:35 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> When multiple threads operate on the same register resource
> which include multiple pin, It will make the register resource
> wrong to control. So we add lock to avoid the case.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 ++
>  drivers/pinctrl/mediatek/pinctrl-paris.c         | 2 ++
>  3 files changed, 8 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 72f17f26acd8..fcf7c3eeee4a 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -58,10 +58,14 @@ void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set)
>  {
>         u32 val;
>
> +       mutex_lock(&pctl->lock);
> +
>         val = mtk_r32(pctl, i, reg);
>         val &= ~mask;
>         val |= set;
>         mtk_w32(pctl, i, reg, val);
> +
> +       mutex_unlock(&pctl->lock);
>  }
>
>  static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> index e2aae285b5fc..65eac708a3b3 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> @@ -251,6 +251,8 @@ struct mtk_pinctrl {
>         struct mtk_eint                 *eint;
>         struct mtk_pinctrl_group        *groups;
>         const char          **grp_names;
> +       /* lock pin's register resource to avoid multiple threads issue*/
> +       struct mutex lock;
>  };
>
>  void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set);
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index da1f19288aa6..48e823f6d293 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -970,6 +970,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
>
>         hw->nbase = hw->soc->nbase_names;
>
> +       mutex_init(&hw->lock);
> +

Could you help add the mutex initialization into pinctrl-moore.c too?
and then the patch would look good to me.

>         err = mtk_pctrl_build_state(pdev);
>         if (err) {
>                 dev_err(&pdev->dev, "build state failed: %d\n", err);
> --
> 2.18.0
>
