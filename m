Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 851F83D55FD
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 10:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbhGZIR5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 04:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbhGZIR5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 04:17:57 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2826AC061760
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jul 2021 01:58:26 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id u3so14121963lff.9
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jul 2021 01:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tjJug7Q8q6d0CbJrYfSZgFOLb9rWU+eNbzf7D0T8EG8=;
        b=DK6BNTioO9pLA0zgUFyAhLl5WNTJx2sD/tsmB48ktbU0/j1s5OMESOBvX/fOlDH4LU
         B2RxRBYlutT2qBKsIOnfoX5REG1LDTQUAfMEXNd+IMldzlbB3GTZXBJWJDAW8OUxzAe5
         NbbxSLfuOMgt4R2d0pL52nOtrKaX9LL1wngwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tjJug7Q8q6d0CbJrYfSZgFOLb9rWU+eNbzf7D0T8EG8=;
        b=axzrhAYkSe79dLJOBI9glF9M4M3iAdxq+JeEX2tj21RTaSCHb8SzEJsPkkeZxrLkzZ
         9ttRZrbS2F9wGGnzgf1wKFYXxeWUjHYMv04IZBFZhATCQaZXaqsORR40fYvbp5eA6Vri
         HuaN6JMWv6MMkvQifvLENDpElL1b6lizvS+vlHRR6crdML/Fk3rzy3oQwr3repZ18KDz
         g5+cknHv1k6C3y9XIh1NddyEqU9eMp2g2gKTxKizP/+jNYbVtK0eia7hpcsP69+dzULS
         /xEVYvWjV3quegrr3bI64iUwBBINyISpmWNHUPM82WT6Ml1xx1iZ9DA/NvWdY+LY695z
         /3gQ==
X-Gm-Message-State: AOAM531x7VOoqrNIV/BmJzRvPc8kZz8zrTph7MhNoGmWOCGWfzdyS+HT
        TvIbTYfwvRDEltQyaSGiVmFwMXSxEjBe8gEjLtXAeA==
X-Google-Smtp-Source: ABdhPJwnhtzxRaGOMn4t4PeAcTHpr1ccxQJ2FBsDEcwC7sCwm1x/bCY+vqG8t3AdWboRCIjmWscEg06CfaCxndy6uks=
X-Received: by 2002:ac2:57d2:: with SMTP id k18mr12583576lfo.656.1627289904559;
 Mon, 26 Jul 2021 01:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5Ev4QU72cMqMW7sA=dijzh7-DCsfHY+Lmqd36uzg_7Nww@mail.gmail.com>
 <CAJMQK-hH5HM5iN4q6UgUf8T5fwj+0oULKPw=XafYOPrki-aDkg@mail.gmail.com>
In-Reply-To: <CAJMQK-hH5HM5iN4q6UgUf8T5fwj+0oULKPw=XafYOPrki-aDkg@mail.gmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Jul 2021 16:58:13 +0800
Message-ID: <CAGXv+5E9MWzHtJLEab_ZKQNgVqhL5H_Teor9c5zCQD8OHOcYYA@mail.gmail.com>
Subject: Re: arm64: dts: mt8183: Incorrect mediatek,pull-*-adv values
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 26, 2021 at 4:50 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Mon, Jul 26, 2021 at 4:20 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > Hi,
> >
> > I was looking at MTK pinctrl stuff upstream, and it seems there are a few
> > `mediatek,pull-*-adv` entries that have invalid values:
> >
> > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > mediatek,pull-up-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > mediatek,pull-up-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> >  mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> >  mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> >  mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> >  mediatek,pull-up-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> >  mediatek,pull-down-adv = <10>;
> > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> >  mediatek,pull-up-adv = <10>;
> >
> > According to the bindings, the values should 0~3. <10> is probably a
> > incorrect attempt at using binary representation, which is wrong. This
> > probably leads to the pull-up/down getting disabled or ignored.
> >
> > Cound people still working on these two devices take a look?
> >
> Thanks for pointing this out. It's an incorrect value but 10=0b1010 so
> the result is same as 2, since the driver test the value by checking
> the last 2 bit. We should still fix this in dts.

That probably explains why no one noticed.
