Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF2503EFCA0
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Aug 2021 08:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238161AbhHRG11 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 02:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238263AbhHRG1P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Aug 2021 02:27:15 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F28C06122E
        for <linux-gpio@vger.kernel.org>; Tue, 17 Aug 2021 23:26:07 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id n7so3165526ljq.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Aug 2021 23:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0niOOKpLOqJWr+G2N4qsyCfMLmKR4C8+b8TBbZbKaU8=;
        b=Et8efFBgzM1OWhTpqkovSGInq7BYnqTenDPJF5Sfp/8L2BDfO3pcqtdv6gK9Xf6rVi
         bPlFqq3u2Mlnv1Oxq7zttZXNhuIFaIoCKH5Il61HHre6WKqQXBgZ2rtyo6Ql01WiAgAf
         iqwYaadnd/cBDGdzYU20uWob0rjtS561A0+w4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0niOOKpLOqJWr+G2N4qsyCfMLmKR4C8+b8TBbZbKaU8=;
        b=Z4J4G56ot047f2EfQ9KvSUB9hJ/lXpSweKmeSPwXoVUl117Tu4toC07TSeKCrnOLZM
         1ENHy2Z1lWOI9ZfOGQ0JHRXR+kz3KuvBCMJE/MciMkWS+t0k3feAVYvYHXnvUOhtxBCQ
         m0fZis9hKTlhEuQ5eScZxGrayhyXvik9TEshAISdkgnNypHk4bfopNKJJ/vTLgSNoJbi
         uFcnA7sEgn/l2Rj9+ubuZt9lwPHsYp1CyTGSBtySHjkFvvvicY3KzGlCjOhtPiMmEEm/
         2qLjSHS25PTiKUJm4XBObx2iiz+PQxd50/hfhF+Z3o5u3WRYOl8hcItmBIUuL6x/KBJn
         sXjA==
X-Gm-Message-State: AOAM530lSJ+0bj64dWzXwo8COzOijXhKrIkjOYobTCqt2uTPMPK/EEMc
        krnCRdE9pip3jBRwUW80fcvjWtS0/nQQr82xLJ4cJg==
X-Google-Smtp-Source: ABdhPJycOOwNmb0zD73kqTDlXcUFSNdJdOw1Y3p1pB/PjGtP3t4iluned8prH8xjVYxNIs08EqJIS54IEOaxSu1nOPY=
X-Received: by 2002:a2e:7d0e:: with SMTP id y14mr6438392ljc.251.1629267965676;
 Tue, 17 Aug 2021 23:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com> <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03> <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
 <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
 <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com>
 <CACRpkdZ4k9Km3vBtdN6AnBM89c4355GtPMzCQ0_YHaTb4V5cKA@mail.gmail.com>
 <CAGXv+5HohMwU8jow5QXO5MK1tO+u=5YsfhArBWCP4Dgm1Q8igg@mail.gmail.com>
 <4fd12d5c53f6492e5fa3ba94a78b9a149f5b6ed9.camel@mediatek.com>
 <CAGXv+5GCuNK=-z9VAOjkpJdZLUSZFPfUsQ09m1FhfTsbCYLLRw@mail.gmail.com>
 <CACRpkdbZKh8cqqiDRUik6Ooo33e+feGwYsLjcLRvBQnT3x5M3A@mail.gmail.com>
 <a7c8ab68ac3513865698cde27e665bdd554f459e.camel@mediatek.com>
 <CAGXv+5FtL2zaSWx4tUymx6mpCSb5dXG4XNWM9AJL+b6Ok3dxMg@mail.gmail.com>
 <d40f6d5fd26aedb13e7a393202e5794b1893ecf8.camel@mediatek.com> <CACRpkdYkwXr76Kq5WYdz=1KkLTpaByAL1vJFo8V+2mncqs8-3Q@mail.gmail.com>
In-Reply-To: <CACRpkdYkwXr76Kq5WYdz=1KkLTpaByAL1vJFo8V+2mncqs8-3Q@mail.gmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 18 Aug 2021 14:25:54 +0800
Message-ID: <CAGXv+5EUAVFJd7VZsDgpOK_6fhs12ztwKHioghq5ZQHzFKY89w@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
To:     "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>,
        Light Hsieh <light.hsieh@mediatek.com>,
        Biao Huang <biao.huang@mediatek.com>,
        Hongzhou Yang <hongzhou.yang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 18, 2021 at 4:09 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Aug 17, 2021 at 9:51 AM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> > In one chip, If GPIO is different, the MTXXXX_PULL_UP_RSEL_001 may
> > means different actual bias resistance setting.
> >
> > For example,
> >
> > KPROW IO
> > Paramters       Descriptions                   Min      Typ     Max
> >  UNIT
> > Rpd     Input pull-down resistance      40      75      190     Kohm
> > Rpu     Input pull-up resistance        40      75      190     Kohm
> > Rpd     Input pull-down resistance      0.8     1.6     2       Kohm
> > Rpu     Input pull-up resistance        0.8     1.6     2       Kohm
>
> This is exactly why we should try to use SI units in the device tree.
> I assume that the software can eventually configure which resistance
> it gets?
>
> The electronics people will say make sure it is pulled down by around
> 80 kOhm, they can put that on the device tree and your code can
> say, "hm 40 < 80 < 190 this is OK" and let the value pass.
>
> We do not define these exact semantics, it is up to the driver code
> to decide what to do with the Ohm value 80000 in this case, but
> it makes perfect sent for me to let it pass and fail if someone
> for example requests 20 kOhm, or at least print a helpful warning:
>
> dev_warn(dev, "the requested resistance %d is out of range, supported
> range %d to %d kOhm\n",
>                  val, low, high);
>
> This is what makes the SI units really helpful for people writing device
> trees: solve real integration tasks and make it easy to do the right thing.

I think this makes a lot of sense. The driver could select the closest
setting. And from what Zhiyong mentioned offline, the resistor values
aren't exact as specified in the datasheet. I suppose this is expected
with any electronics. So the hardware integration will say to pull up
or down by some value, and the driver will do its best to fulfill that
request. That precludes DT schema checking for the values used, but I
think that is a good compromise.

Zhiyong also mentioned that some of their downstream integrators might
not be able to deal with actual values, and would prefer symbols tied
to specific RSEL values. I think that would be doable together using
some _magic_ values, but I would prefer not to if it were avoidable.


Regards
ChenYu
