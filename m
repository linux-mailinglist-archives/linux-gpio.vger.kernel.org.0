Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED075368C25
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Apr 2021 06:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbhDWE1G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Apr 2021 00:27:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:38514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229456AbhDWE1F (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Apr 2021 00:27:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C01F761209;
        Fri, 23 Apr 2021 04:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619151989;
        bh=558kdhrpDEbvLspTxLwIBCC63e6vd0HtrJuvMY2HIPU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bDi16M67X4iX+mbvIDox+HW5nGhX42ou6wQiJ2ANIbTwtoIWlSCRVLqmklc7bBYsA
         8LSJhy0InMfv17D4hA/wPYuJo/yFe60qNRlKkeMb45n08ErbVkSKfsQWAhnk6bE/E0
         vAKctRe3cZ8K/C/jhZXx9VRG6QSF+CJcjXqCeay4hT/35mmxwRfyUtHmBRmH/NDR1I
         +vZR1T04asAf6v5jQVSQnXeGDyL6Hr3u7mpd+KlUxmIAxOdcMdsSu+8hO0scZhJxR0
         BcAWSyQs0znJxf6XFH4zmD6ciTgWsEjab7HS92ncwnCsaM4/HA2IQHmxWD4O/Mv7vK
         ZNv2cPsq6k9qg==
Received: by mail-ej1-f45.google.com with SMTP id mh2so50402945ejb.8;
        Thu, 22 Apr 2021 21:26:29 -0700 (PDT)
X-Gm-Message-State: AOAM531KI7tqF2Ib2ERklSs/pmjF2oNxOHdeAmnVi9VJS5Md+sAgKmHO
        FTJnHP55nTKYoczQy9Emp2T6zw0V87dOHJbCfAs=
X-Google-Smtp-Source: ABdhPJwrp2WZp93WF7sn6a4jsARVI9yFWaZqYQT3ZabJv6Vvb4rZ45BPrknhQoO89VEgZCGMB/a8J8P7icMRRRLq0N8=
X-Received: by 2002:a17:906:5248:: with SMTP id y8mr2047850ejm.150.1619151988351;
 Thu, 22 Apr 2021 21:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210422033559.29700-1-zhiyong.tao@mediatek.com> <20210422033559.29700-2-zhiyong.tao@mediatek.com>
In-Reply-To: <20210422033559.29700-2-zhiyong.tao@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Thu, 22 Apr 2021 21:26:16 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzof434sM0amt7q5wqJz79VpUJQchn64wrEX2wXM_zg8CA@mail.gmail.com>
Message-ID: <CAGp9Lzof434sM0amt7q5wqJz79VpUJQchn64wrEX2wXM_zg8CA@mail.gmail.com>
Subject: Re: [PATCH v5] pinctrl: add rsel setting on MT8195
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

HI Zhiyong,

We should insist on using "pinctrl: mediatek" as the prefix.

On Wed, Apr 21, 2021 at 8:36 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This patch provides rsel setting on MT8195.
>
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mt8195.c     | 22 +++++++++++++++++++
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 14 ++++++++++++
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  | 10 +++++++++
>  drivers/pinctrl/mediatek/pinctrl-paris.c      | 16 ++++++++++++++
>  4 files changed, 62 insertions(+)
>
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> index a7500e18bb1d..66608b8d346a 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> @@ -779,6 +779,25 @@ static const struct mtk_pin_field_calc mt8195_pin_drv_adv_range[] = {
>         PIN_FIELD_BASE(45, 45, 1, 0x040, 0x10, 9, 3),
>  };
>
<snip>
