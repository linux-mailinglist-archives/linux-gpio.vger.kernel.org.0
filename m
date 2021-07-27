Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC953D7406
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 13:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236320AbhG0LG1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Jul 2021 07:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236212AbhG0LG0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Jul 2021 07:06:26 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B82C061760
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jul 2021 04:06:26 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id y4so11747920ilp.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jul 2021 04:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KaH6OTwrWG90914prFT1/hBGveSe1LpJn6vY9Adila8=;
        b=SDh/ZiBj+wM/6RLopNPtxhhmjY4AOhwtUlsj7CBXB5kWyYXr4/eEwwMraRCCYOGBu8
         4+gwT7UhgkK6MDRdhMlBprwwCgOKmjdnT+99U8rD/ZksvEtppzkTxzsX/KkM4vygStQR
         5W8tG5BXychsijrX3WI5DDmbAZsvu6Xwzxre0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KaH6OTwrWG90914prFT1/hBGveSe1LpJn6vY9Adila8=;
        b=MoBxLfdBzQmfgfVJ+hsxlJl/0IMY6EDZ4PtqtJttG36fCuClFBxknbOuZy3IzROH9j
         +6SNMCG2N7ZSzBS1uwk6/LP+wjapx4dV5mTMf0DV9RTQmrTmf98fZuVj7xUmtOQeQDJH
         9IUl+ke51NF1fWe1zQFBO00dLklWG5G4JB6AKJ3lMD4TzCHO6HzWqKrp4yDPPwK+OxR/
         XbLu0ZPBpOZsOzFN4IGsy8WCA2/rczVWybVf9TLfwbOrZeGoR8WYd7VXTDS/az6BUbpA
         E4gBBQdY1JPDLKyNml3OHCwI0zitDgfpPc3kgjqx9Q56hlrjJdPSvTveE6nMLolABzeI
         OgcA==
X-Gm-Message-State: AOAM530gSYAUMTO9HwXdve/OP4+OBpJV/ib6VfJD0297X+2PDAlNmg0j
        0i5kG1ROUs9uQpXlKY2913efJawYaA9cdkvKzoR4Ag==
X-Google-Smtp-Source: ABdhPJzN3bMcohyLx+BmCBR3X6vZL0tTvooFjXp3y2FFWtT9H5YBTmKIeAGF+vyrAAa7JitBin1NHaVrXGI4vBGiKTs=
X-Received: by 2002:a05:6e02:13e2:: with SMTP id w2mr16501620ilj.308.1627383986040;
 Tue, 27 Jul 2021 04:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5Ev4QU72cMqMW7sA=dijzh7-DCsfHY+Lmqd36uzg_7Nww@mail.gmail.com>
 <CAJMQK-hH5HM5iN4q6UgUf8T5fwj+0oULKPw=XafYOPrki-aDkg@mail.gmail.com>
 <CAGXv+5E9MWzHtJLEab_ZKQNgVqhL5H_Teor9c5zCQD8OHOcYYA@mail.gmail.com> <CAFqH_51Sg0h+CC9whUAgpp80OxDsB461NYSdKQvGxho_VF8oJg@mail.gmail.com>
In-Reply-To: <CAFqH_51Sg0h+CC9whUAgpp80OxDsB461NYSdKQvGxho_VF8oJg@mail.gmail.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Tue, 27 Jul 2021 19:06:00 +0800
Message-ID: <CAJMQK-j_SFVOA7KcZpGaE+mS3WZf3fe9CaXw4pHPND_UWUU6Kg@mail.gmail.com>
Subject: Re: arm64: dts: mt8183: Incorrect mediatek,pull-*-adv values
To:     Enric Balletbo Serra <eballetbo@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
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

On Mon, Jul 26, 2021 at 5:48 PM Enric Balletbo Serra
<eballetbo@gmail.com> wrote:
>
> Hi Chen-Yu and Hsin-Yi,
>
>
> Missatge de Chen-Yu Tsai <wenst@chromium.org> del dia dl., 26 de jul.
> 2021 a les 10:58:
> >
> > On Mon, Jul 26, 2021 at 4:50 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > >
> > > On Mon, Jul 26, 2021 at 4:20 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > I was looking at MTK pinctrl stuff upstream, and it seems there are a few
> > > > `mediatek,pull-*-adv` entries that have invalid values:
> > > >
> > > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > > mediatek,pull-down-adv = <10>;
>
> The confusion comes probably because the binding says that this value
> is valid, see
>
>    Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt
>
> it'd be nice to convert that binding and the others to yaml format and
> remove the possibility to specify it in binary format.
>
>   Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
>   Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
>   Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt
>
> Should be pretty easy as there is already an example:
> Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>

Hi Enric,

I've sent a patch for converting these into yaml here:
https://lore.kernel.org/patchwork/patch/1468449/

Thanks

> Thanks,
>   Enric
>
> > > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > > mediatek,pull-down-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > > mediatek,pull-down-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > > mediatek,pull-up-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > > mediatek,pull-down-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > > mediatek,pull-up-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > > mediatek,pull-down-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > > >  mediatek,pull-down-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > > >  mediatek,pull-down-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > > >  mediatek,pull-down-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > > >  mediatek,pull-up-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > > >  mediatek,pull-down-adv = <10>;
> > > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > > >  mediatek,pull-up-adv = <10>;
> > > >
> > > > According to the bindings, the values should 0~3. <10> is probably a
> > > > incorrect attempt at using binary representation, which is wrong. This
> > > > probably leads to the pull-up/down getting disabled or ignored.
> > > >
> > > > Cound people still working on these two devices take a look?
> > > >
> > > Thanks for pointing this out. It's an incorrect value but 10=0b1010 so
> > > the result is same as 2, since the driver test the value by checking
> > > the last 2 bit. We should still fix this in dts.
> >
>
> I see that the are
>
>
>
> > That probably explains why no one noticed.
