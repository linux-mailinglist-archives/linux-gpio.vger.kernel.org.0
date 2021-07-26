Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D593D56CD
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 11:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232699AbhGZJIj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 05:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232482AbhGZJIi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 05:08:38 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38F15C061757;
        Mon, 26 Jul 2021 02:48:53 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id c2-20020a0568303482b029048bcf4c6bd9so8072951otu.8;
        Mon, 26 Jul 2021 02:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pl+v3DiaeJpUrELYg7AfdBLvrcikVCH+JCi57zYA5L8=;
        b=tIuPKH6cDjAbmsEOgBBM5J1qa1ubNYlki7Sxx3yS/okutf/coP9GMnuO1sCiLwZh1O
         QQ6hZ4bUx4w3QdP08k6+oLwlR9GHH3hwRg5a5RrM7JsHOmmtie1H4FWR0L4ETu4foQQ9
         VYlV4rqikPgp1ZCwMBAwgSqY+8BC+bItpVUDD1gr0ubGsc/dW+oYhzgcBtacCIC+o27/
         we5nXqkTqzfYS3NdY4+xzPJtCltqjwIEka0ZuwvU2TtI+9brtk4tJmTPzzRz2O/Jpg2M
         KVuiCgUE7Vu+0j7tek5Ay1YLWxlE0/kP5nPZFJeB2uipxi75nXAChj2Ti1Br2EYDKzh0
         pTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pl+v3DiaeJpUrELYg7AfdBLvrcikVCH+JCi57zYA5L8=;
        b=j7LxJp/ioToa21Yr03D0NurotkI5/2PzIw5iylODDI1hB98o74fuX5Rs5DnNS+iCJi
         UrXps9KwFohohyznsCjk/bzpuZCrQiGfGa5Lzsd9jeiIdumJeGjImJ1o049We9v5ndZq
         Y6qqyvqsreHGGLk/W/HbrPCUjkyzcxaKq9C3VTIxANxr3OR+HCEk+oZo2TIdgR7ir6yp
         XzdgyOPr0v8y7uKUF8rub0Yo9XxD/Hz/qNIQcqJ5a1L1Ua4ZrrWdo3PsicXvL7J0Xta2
         o8SbkBC1DQWX38NZCaW/EHD91ohV9sPuPGiWhzt90UP1mtzaJu7wNGwFqxWQka/ftRCD
         rjhw==
X-Gm-Message-State: AOAM530yfXT0br8xVHn9xvD1vp8iEAD/8/7P9q99OuOt2iRx/9xDOieI
        f0ck6uvHrSleIaUZBCFOQibQ0R1CuVlJTZ/VUd4=
X-Google-Smtp-Source: ABdhPJwIjI3BLNNv2h2ltqxDCxpofhxdenLAJEBrCmVZcH0wgLU4BC6+IZJezfASEvU7wasViER7NsvA8lTj47uS5w0=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr11353766otb.281.1627292932673;
 Mon, 26 Jul 2021 02:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5Ev4QU72cMqMW7sA=dijzh7-DCsfHY+Lmqd36uzg_7Nww@mail.gmail.com>
 <CAJMQK-hH5HM5iN4q6UgUf8T5fwj+0oULKPw=XafYOPrki-aDkg@mail.gmail.com> <CAGXv+5E9MWzHtJLEab_ZKQNgVqhL5H_Teor9c5zCQD8OHOcYYA@mail.gmail.com>
In-Reply-To: <CAGXv+5E9MWzHtJLEab_ZKQNgVqhL5H_Teor9c5zCQD8OHOcYYA@mail.gmail.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Mon, 26 Jul 2021 11:48:41 +0200
Message-ID: <CAFqH_51Sg0h+CC9whUAgpp80OxDsB461NYSdKQvGxho_VF8oJg@mail.gmail.com>
Subject: Re: arm64: dts: mt8183: Incorrect mediatek,pull-*-adv values
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
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

Hi Chen-Yu and Hsin-Yi,


Missatge de Chen-Yu Tsai <wenst@chromium.org> del dia dl., 26 de jul.
2021 a les 10:58:
>
> On Mon, Jul 26, 2021 at 4:50 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > On Mon, Jul 26, 2021 at 4:20 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > >
> > > Hi,
> > >
> > > I was looking at MTK pinctrl stuff upstream, and it seems there are a few
> > > `mediatek,pull-*-adv` entries that have invalid values:
> > >
> > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > mediatek,pull-down-adv = <10>;

The confusion comes probably because the binding says that this value
is valid, see

   Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt

it'd be nice to convert that binding and the others to yaml format and
remove the possibility to specify it in binary format.

  Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
  Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
  Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt

Should be pretty easy as there is already an example:
Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml

Thanks,
  Enric

> > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > mediatek,pull-down-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > mediatek,pull-down-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > mediatek,pull-up-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > mediatek,pull-down-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > mediatek,pull-up-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:
> > > mediatek,pull-down-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > >  mediatek,pull-down-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > >  mediatek,pull-down-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > >  mediatek,pull-down-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > >  mediatek,pull-up-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > >  mediatek,pull-down-adv = <10>;
> > > arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:
> > >  mediatek,pull-up-adv = <10>;
> > >
> > > According to the bindings, the values should 0~3. <10> is probably a
> > > incorrect attempt at using binary representation, which is wrong. This
> > > probably leads to the pull-up/down getting disabled or ignored.
> > >
> > > Cound people still working on these two devices take a look?
> > >
> > Thanks for pointing this out. It's an incorrect value but 10=0b1010 so
> > the result is same as 2, since the driver test the value by checking
> > the last 2 bit. We should still fix this in dts.
>

I see that the are



> That probably explains why no one noticed.
