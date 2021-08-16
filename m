Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9418F3ECE76
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 08:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233310AbhHPGLF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Aug 2021 02:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233165AbhHPGLF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Aug 2021 02:11:05 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FB75C0613C1
        for <linux-gpio@vger.kernel.org>; Sun, 15 Aug 2021 23:10:34 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t9so32227142lfc.6
        for <linux-gpio@vger.kernel.org>; Sun, 15 Aug 2021 23:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZIA1/692VBv2p6oFgSgryVc2gxTHeAovVGogmAyKfIc=;
        b=D72ANqNKHfUVGUjt4dGJqbs5zUodFvXPlhCFgxNKSYQ+hXq1g9iCytZ/VomBsu6uTx
         lhNIazv/Udq00L/SdtMXM8xT71Q5VYo/JlDOY3Vd0+rudrc+AM7zadq1YiFRMwFKbQyg
         ZYpFB26u8d1UXIihVOKeSh21Pt5m+ThWI6TLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZIA1/692VBv2p6oFgSgryVc2gxTHeAovVGogmAyKfIc=;
        b=r9Clvi7I5wMzWmF/LjdqKAyQJsHHRnmNrupVTUtjx0HpNxHXexM3NgJ56ZLumIJ+27
         XoGV1hyHmtYzf5gOyvxXSSB59fMEkGG2CqskNzq2WWAmSixyN1Wbl1XoA0dgTBVRXYSA
         cb5WB2szeMsUb6CxFPSZ3sL5QaZeqxh9wylfoIWKp1qtVF4aTCy6Iy2i1rBYNbQJw12v
         FcagsE1/eOniailKEYUGogj8Jo9S00YBORY/gYdZVqL0iJY6/ZfYN862FQUkfVmtXvCs
         FR02TC465h1NqCSl68j2odxAXd4ieNrdfCpar3Gc2uLlSVr7X8NgE0DyKgCL+v+n7uU6
         5LaQ==
X-Gm-Message-State: AOAM530JhV4XpEsShF/P5VsO5jwwT1RHo8Qb+K4jBdXo4sQz2Tph8Gd7
        oHyewF3E3aWvA6pKY/9f2Z9PhRu4TiI8Fh6Rjha8tg==
X-Google-Smtp-Source: ABdhPJzL8RjYaN0Sc1fcCpLDR9FiunPsd8uQLbFv3KiwtAMW+zcy+iGqjGSk2EMG6PngQB7RQdv++oYkdI7XcR81ioM=
X-Received: by 2002:ac2:490b:: with SMTP id n11mr10612445lfi.656.1629094232622;
 Sun, 15 Aug 2021 23:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com> <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03> <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
 <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
 <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com> <CACRpkdZ4k9Km3vBtdN6AnBM89c4355GtPMzCQ0_YHaTb4V5cKA@mail.gmail.com>
In-Reply-To: <CACRpkdZ4k9Km3vBtdN6AnBM89c4355GtPMzCQ0_YHaTb4V5cKA@mail.gmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 16 Aug 2021 14:10:21 +0800
Message-ID: <CAGXv+5HohMwU8jow5QXO5MK1tO+u=5YsfhArBWCP4Dgm1Q8igg@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "zhiyong.tao" <zhiyong.tao@mediatek.com>,
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

On Thu, Aug 5, 2021 at 7:02 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Jul 29, 2021 at 11:43 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > On Thu, Jul 29, 2021 at 4:23 PM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> > > The rsel actual bias resistance of each setting is different in
> > > different IC. we think that the define "MTK_PULL_SET_RSEL_000" is more
> > > common for all different IC.
> >
> > I see. I personally prefer having things clearly described. I can
> > understand this might be an extra burden to support different chips
> > with different parameters, though this should be fairly straightforward
> > with lookup tables tied to the compatible strings.
> >
> > Let's see if Rob and Linus have anything to add.
>
> Not much. We have "soft pushed" for this to be described as generic
> as possible, using SI units (ohms). But we also allow vendor-specific
> numbers in this attribute. Especially when reverse engineering SoCs
> that the contributor don't really have specs on (example M1 Mac).
>
> The intent with the SI units is especially for people like you folks working
> with Chromium to be able to use different SoCs and not feel lost
> to a forest of different ways of doing things and associated
> mistakes because vendors have hopelessly idiomatic pin configs.

I'll take that as "use SI units whenever possible and reasonable".

Thanks.

ChenYu
