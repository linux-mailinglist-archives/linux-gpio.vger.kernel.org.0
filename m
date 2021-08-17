Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3096C3EF311
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 22:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbhHQUKJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 16:10:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233110AbhHQUKI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Aug 2021 16:10:08 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCABDC061764
        for <linux-gpio@vger.kernel.org>; Tue, 17 Aug 2021 13:09:34 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i28so16953305lfl.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Aug 2021 13:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k8AfVuCGxDrAVAQEMwEyKZr/585805GvK2MzsN/gS3A=;
        b=CZPAZB5/x6SSKO3/e4ljoCjcPsrNGDpLblZMD69HhLBEw4EpEnaMCLjsSRVWWn5c8R
         6qK/hjUcTlz7tWO+lSjquayDXvuIN/47A6alfgci5XZp4ZVck4LIDSG8X7Q4SDpoCz7q
         LZldLdE0hvD9Rs6Nr3Up4gkhyI3fIuSToGWAn4IZ92cR4YbsAltHiAVd+9v9BeE0nzik
         ZPzZ6EjD8WwP1T0XpfKHkv1ra0lT7gDQWjVvNmU6cMwDo70qRzQnBhZIsfPpSsi6FIQy
         DycVicbxZ8DEKI/CY5OzuH7cofexceLkH5ljhdve4pmcRWOn6+KyDnNaqxa4SUW4vZA7
         vfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k8AfVuCGxDrAVAQEMwEyKZr/585805GvK2MzsN/gS3A=;
        b=PDLE4JI1kBCvT6YC4UQBt0u7IxS036j1TArKcwq7L9DBH9zumlFjBbT+dSnHO0Z9aY
         es2j9YgSmTkX9cywDQG3E9OQl41eI3ylgHeSyJbqbwvvbHb/riLoGwHbomF4/48fSjmk
         ANOsV/Nem1zL3W2z98b3gPc3ShY0rsAi2Zt3s39KTbxfJRSsXuezRU4NSQT/7WP86lPl
         8tihAlyWfDrC9DbKpqQla3m5HSPyBJzX75DbdrHKs3w3hSKy1zyinPaioyQiV5kakwUm
         6Nu0GWpAQ3qE7Uhe74Qct1spVHvLrrVd0pUoxeupeuxCjPDL4dCzVArTBDp/leiG2FkA
         q0Yg==
X-Gm-Message-State: AOAM533r+aqEMPuNaiRP2d6NZJo71JjHF3hiUJx4zytyjqJF0NzApIp/
        CKcXAvJLLDdH/e7I6wY6Xx6a395v1wYiT/jB3Jfu7g==
X-Google-Smtp-Source: ABdhPJxghIUV5K9nnRKPIlLjW0aY8CAvGBeUp9sBilijN+pjZbbOVx9RaTN3WM8sx4gBVuvt9YsAcirfPdhwGO8Ypzw=
X-Received: by 2002:ac2:58d4:: with SMTP id u20mr3489426lfo.157.1629230973143;
 Tue, 17 Aug 2021 13:09:33 -0700 (PDT)
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
 <CAGXv+5FtL2zaSWx4tUymx6mpCSb5dXG4XNWM9AJL+b6Ok3dxMg@mail.gmail.com> <d40f6d5fd26aedb13e7a393202e5794b1893ecf8.camel@mediatek.com>
In-Reply-To: <d40f6d5fd26aedb13e7a393202e5794b1893ecf8.camel@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Aug 2021 22:09:21 +0200
Message-ID: <CACRpkdYkwXr76Kq5WYdz=1KkLTpaByAL1vJFo8V+2mncqs8-3Q@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
To:     "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
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

On Tue, Aug 17, 2021 at 9:51 AM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:

> In one chip, If GPIO is different, the MTXXXX_PULL_UP_RSEL_001 may
> means different actual bias resistance setting.
>
> For example,
>
> KPROW IO
> Paramters       Descriptions                   Min      Typ     Max
>  UNIT
> Rpd     Input pull-down resistance      40      75      190     Kohm
> Rpu     Input pull-up resistance        40      75      190     Kohm
> Rpd     Input pull-down resistance      0.8     1.6     2       Kohm
> Rpu     Input pull-up resistance        0.8     1.6     2       Kohm

This is exactly why we should try to use SI units in the device tree.
I assume that the software can eventually configure which resistance
it gets?

The electronics people will say make sure it is pulled down by around
80 kOhm, they can put that on the device tree and your code can
say, "hm 40 < 80 < 190 this is OK" and let the value pass.

We do not define these exact semantics, it is up to the driver code
to decide what to do with the Ohm value 80000 in this case, but
it makes perfect sent for me to let it pass and fail if someone
for example requests 20 kOhm, or at least print a helpful warning:

dev_warn(dev, "the requested resistance %d is out of range, supported
range %d to %d kOhm\n",
                 val, low, high);

This is what makes the SI units really helpful for people writing device
trees: solve real integration tasks and make it easy to do the right thing.

Yours,
Linus Walleij
