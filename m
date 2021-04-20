Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F6936511F
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Apr 2021 05:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbhDTDu7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Apr 2021 23:50:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:48260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229467AbhDTDu7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Apr 2021 23:50:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 289DC6100B;
        Tue, 20 Apr 2021 03:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618890628;
        bh=4VHQO/2Y5QQ2o1qMGFqr4wyOmnZip6mdpmq22Di4o1c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LldPUIP/tlfnAgepSvDsITxKLbtbs42Z6TtiCBo6fVGRmvFBkc036zw5NoQY8xABm
         A6CxHTMN2CSKAk1atUzN551OAYKrykA2cMPuDfx2uRLPU2mYOyPQkQZ8tA9702IZlc
         KeWlbaUXz3P3VFH3qFIYnIlV/zNAS7iUxElzDZkfyJj3Pij2kDn139Mjmx455RVeqE
         3xMC8bPrc0FHtXYu7eMLhPI1++nRYxc5FR69lfynJNPLVnyVVGnUfjEGvvec4axoaw
         +gw9ONYY1/Vqlcdbz+v+NK/oCQSpZXihv5jRCRP/4Lfhg72QSKMu8pnXhojc+iFyzv
         n8d4+VRcnp+Pw==
Received: by mail-ej1-f54.google.com with SMTP id x12so35349846ejc.1;
        Mon, 19 Apr 2021 20:50:28 -0700 (PDT)
X-Gm-Message-State: AOAM5316h72zhOYS4mdk5epbrdbiFSDLwA3OVvuvpotcYUjVyc54yYwA
        UVBwgebVhrXiHmoTNTPDIKbG59Q2CWG7Q6gXOoA=
X-Google-Smtp-Source: ABdhPJw4O1TlT/Leyw9rMnpP0rTdXgO2SLoIAzcJZ2GEZJnq8QVTyUazhJiBAF3L9Nu9CLYdwqmNjSgGsgo/F4wmIKo=
X-Received: by 2002:a17:906:fb81:: with SMTP id lr1mr24077340ejb.62.1618890626699;
 Mon, 19 Apr 2021 20:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210413055702.27535-1-zhiyong.tao@mediatek.com> <20210413055702.27535-5-zhiyong.tao@mediatek.com>
In-Reply-To: <20210413055702.27535-5-zhiyong.tao@mediatek.com>
From:   Sean Wang <sean.wang@kernel.org>
Date:   Mon, 19 Apr 2021 20:50:15 -0700
X-Gmail-Original-Message-ID: <CAGp9LzoM=9v5mLxtAN9sQm_2f+66xc7G4YqfUF1Mwvr4K_wz5w@mail.gmail.com>
Message-ID: <CAGp9LzoM=9v5mLxtAN9sQm_2f+66xc7G4YqfUF1Mwvr4K_wz5w@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] pinctrl: add rsel setting on MT8195
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
        seiya.wang@mediatek.com,
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

On Mon, Apr 12, 2021 at 10:57 PM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

<snip>
> @@ -176,6 +180,12 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>                 else
>                         err = -ENOTSUPP;
>                 break;
> +       case MTK_PIN_CONFIG_RSEL:
> +               if (hw->soc->rsel_get)
> +                       err = hw->soc->rsel_get(hw, desc, &ret);
> +               else
> +                       err = -EOPNOTSUPP;

I think that should want to be -ENOTSUPP to align other occurrences.

> +               break;
>         default:
>                 err = -ENOTSUPP;
>         }
> @@ -295,6 +305,12 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>                 else
>                         err = -ENOTSUPP;
>                 break;
> +       case MTK_PIN_CONFIG_RSEL:
> +               if (hw->soc->rsel_set)
> +                       err = hw->soc->rsel_set(hw, desc, arg);
> +               else
> +                       err = -EOPNOTSUPP;

Ditto

> +               break;
>         default:
>                 err = -ENOTSUPP;
>         }
> --
> 2.18.0
>
