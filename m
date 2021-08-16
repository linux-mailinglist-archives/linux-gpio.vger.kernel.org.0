Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 551933ED9FA
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 17:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233157AbhHPPiq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Aug 2021 11:38:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236475AbhHPPih (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Aug 2021 11:38:37 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15446C061764
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 08:38:04 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id i28so8583426lfl.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bm8tYluwE2tHBRzqwzgJszhrItkJk+y3RCcuMDJTmI8=;
        b=OT95Md82WHgRGyLWmxE6nitIx0C8BB1adlzRDuzRT9M2zqetzj87ra3kpFm3KgMYga
         8RIHvMHWlEO+gCYykxVaQ3u+tQvAxFx9yTJkeOeM0wj3hI/3jYP76ODLd+t8d7vyCUu9
         YqAXy0/NlJDrv+x2x/UfYn7oZho6vLBJ3zIdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bm8tYluwE2tHBRzqwzgJszhrItkJk+y3RCcuMDJTmI8=;
        b=q+GfGuMkFC5eqCsx2+V7U1IGcV47O4sc41ncuk/qa8phTbQ+FOMdHxwrdKn8UVHwuD
         EIwagRDqUnI+3rdovCJMeE5KmD7xiIrp+z1kz1GTc4v7ggBZDr0UwqGcZ3DcuOYGP0cH
         CsyrQvyze8sbvRKe7q/oDxylyqEyHnl+YZf5yaKHR2nhVLofCQdgNskvr1sRaKFKZHhm
         2adVe0tTDvxVeKYcpc9Id7uSrd5bCQ+NATj+ZxpctwPdogRr03LW9ubtqkUz7tmaWw83
         8E72QQYFV0Bd63lFT7QDjJYzvyqTIJtr1WNGIHkRScpIC2sTrPQ2wcwvDrhv9+ONt/uX
         c5sA==
X-Gm-Message-State: AOAM532C5PdAMA4tIeidZv0uexcrgFmEY65ObatfScf2Z3NUOJu2Zlu2
        QYJhXXjn+RBI47Esuiz9bzphvlaAclzM/SiFyYdhnA==
X-Google-Smtp-Source: ABdhPJwM3WmrduknwaHuwv1oS/UWCa6rCVwvP8lSpnbJ99wYVLFaUwqD8adqCCp2RUVXMwg7jhadsyw/D/byN4yaDyY=
X-Received: by 2002:ac2:51dc:: with SMTP id u28mr10792613lfm.444.1629128282504;
 Mon, 16 Aug 2021 08:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com> <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03> <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
 <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
 <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com>
 <CACRpkdZ4k9Km3vBtdN6AnBM89c4355GtPMzCQ0_YHaTb4V5cKA@mail.gmail.com>
 <CAGXv+5HohMwU8jow5QXO5MK1tO+u=5YsfhArBWCP4Dgm1Q8igg@mail.gmail.com> <4fd12d5c53f6492e5fa3ba94a78b9a149f5b6ed9.camel@mediatek.com>
In-Reply-To: <4fd12d5c53f6492e5fa3ba94a78b9a149f5b6ed9.camel@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 16 Aug 2021 23:37:51 +0800
Message-ID: <CAGXv+5GCuNK=-z9VAOjkpJdZLUSZFPfUsQ09m1FhfTsbCYLLRw@mail.gmail.com>
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

On Mon, Aug 16, 2021 at 6:48 PM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Mon, 2021-08-16 at 14:10 +0800, Chen-Yu Tsai wrote:
> > On Thu, Aug 5, 2021 at 7:02 AM Linus Walleij <
> > linus.walleij@linaro.org> wrote:
> > >
> > > On Thu, Jul 29, 2021 at 11:43 AM Chen-Yu Tsai <wenst@chromium.org>
> > > wrote:
> > > > On Thu, Jul 29, 2021 at 4:23 PM zhiyong.tao <
> > > > zhiyong.tao@mediatek.com> wrote:
> > > > > The rsel actual bias resistance of each setting is different in
> > > > > different IC. we think that the define "MTK_PULL_SET_RSEL_000"
> > > > > is more
> > > > > common for all different IC.
> > > >
> > > > I see. I personally prefer having things clearly described. I can
> > > > understand this might be an extra burden to support different
> > > > chips
> > > > with different parameters, though this should be fairly
> > > > straightforward
> > > > with lookup tables tied to the compatible strings.
> > > >
> > > > Let's see if Rob and Linus have anything to add.
> > >
> > > Not much. We have "soft pushed" for this to be described as generic
> > > as possible, using SI units (ohms). But we also allow vendor-
> > > specific
> > > numbers in this attribute. Especially when reverse engineering SoCs
> > > that the contributor don't really have specs on (example M1 Mac).
> > >
> > > The intent with the SI units is especially for people like you
> > > folks working
> > > with Chromium to be able to use different SoCs and not feel lost
> > > to a forest of different ways of doing things and associated
> > > mistakes because vendors have hopelessly idiomatic pin configs.
> >
> > I'll take that as "use SI units whenever possible and reasonable".
>
> ==> so It doesn't need to change the define, is it right?
> we will keep the common define.

Actually I think it would be possible and reasonable to use SI units
in this case, since you are the vendor and have the resistor values
to implement the support. Having different sets of values for different
chips is nothing out of the ordinary. We already have to account for
different number of pins and different pin functions. That is what
compatible strings are for.

Now if you have _many_ different sets of values within the same chip,
that could make things more difficult. However the clearness of having
the real values visible in the device tree would likely benefit both
software and hardware engineers outside of Mediatek. That is what we
should be aiming for.


Regards
ChenYu
