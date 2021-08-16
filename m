Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC5913EE027
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 01:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbhHPXBL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Aug 2021 19:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232552AbhHPXBK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Aug 2021 19:01:10 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37CEEC061764
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 16:00:38 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id s3so729070ljp.11
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 16:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qCWu86tois4HzDjhxB5sPemRVqiKsSoDbxypDi9Z5+0=;
        b=z1v7oH+A7DDJ+ZpK2dUBsqz+f3S5ioTGJlgemaOwMO/L1AfOi49FHv8vz2Gyw2Iib1
         cOikpkgggD63UmFz1/ychby9CDBTIMxUrHzJcpJr90wnfh64TPArcOReOXV6qvNB/W3j
         iX2vHy8T/MHeKjU1mY5t6zsezU78E7DcyjiUoJ4bC2dI8EiV0EH6h0LwCQM3Kp1cL+wI
         cgdJpqHJiHNMSx8jUT0YcbhCDOGCJ18DbQjQC0pTRuHO4Yx3p4k1MTUgVWeIWbGmsTZ3
         86XeyMe22JZhDxgOpJeLpCINFeRPUIDOiYjfXU/sKuhlT+/TrYCjtXzL5V7X14ElwzLS
         k2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qCWu86tois4HzDjhxB5sPemRVqiKsSoDbxypDi9Z5+0=;
        b=oBdSnxPvjK09DWl9zZpBGJdN1Xn3CcVlgBC2htWFaG6eE1aWW/VXOQCkKC/jiDzXOd
         Xvq+p07XFjHdcR2YYKFKflKMGPFEuyq6erXRzxKjd7N45XFXA+yK89jTmXfP2UYVg4/s
         sc3h2asrDdm9C0BfLAJZP6Hsc8rqeZ/Z25Xjx1v1hqj8WwMNOzZ0Nd8LEkWTnZ/q2YhU
         LTvtYcwBAcNYXP9nnRuTsGZfL84wtFVrkR0MyFb2ncklKjOqefEH2wKv/jNTqafreSjp
         jZ5q0SjDMV9aiLigHhY+TTcZwT/a2QcVnHR2UEsOeyPaDXyLYjWpgLQti0Y+8f4f7qZf
         ZykQ==
X-Gm-Message-State: AOAM530lbjmTRHhzYd+dQ4SMjpEUdN+JWv7O+Tp2OfyO49OB+bns5Kua
        mTGmtyJ3VM/Fy2L9GJvJ+04ARyY3E1N+Vi6NFMc/4Q==
X-Google-Smtp-Source: ABdhPJxKcr3tDBh889ZdkpDoJwN0ES9RscVrpyGEFVwDUZlW9BP1duIsjDpHOms2QM93AclfvKwqHgphf+CtZyBXZVA=
X-Received: by 2002:a05:651c:1507:: with SMTP id e7mr491801ljf.368.1629154836469;
 Mon, 16 Aug 2021 16:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com> <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03> <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
 <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
 <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com>
 <CACRpkdZ4k9Km3vBtdN6AnBM89c4355GtPMzCQ0_YHaTb4V5cKA@mail.gmail.com>
 <CAGXv+5HohMwU8jow5QXO5MK1tO+u=5YsfhArBWCP4Dgm1Q8igg@mail.gmail.com>
 <4fd12d5c53f6492e5fa3ba94a78b9a149f5b6ed9.camel@mediatek.com> <CAGXv+5GCuNK=-z9VAOjkpJdZLUSZFPfUsQ09m1FhfTsbCYLLRw@mail.gmail.com>
In-Reply-To: <CAGXv+5GCuNK=-z9VAOjkpJdZLUSZFPfUsQ09m1FhfTsbCYLLRw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Aug 2021 01:00:25 +0200
Message-ID: <CACRpkdbZKh8cqqiDRUik6Ooo33e+feGwYsLjcLRvBQnT3x5M3A@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
To:     Chen-Yu Tsai <wenst@chromium.org>
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

On Mon, Aug 16, 2021 at 5:38 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
> On Mon, Aug 16, 2021 at 6:48 PM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:

> > > I'll take that as "use SI units whenever possible and reasonable".
> >
> > ==> so It doesn't need to change the define, is it right?
> > we will keep the common define.
>
> Actually I think it would be possible and reasonable to use SI units
> in this case, since you are the vendor and have the resistor values
> to implement the support. Having different sets of values for different
> chips is nothing out of the ordinary. We already have to account for
> different number of pins and different pin functions. That is what
> compatible strings are for.

I fully agree with Chen-Yu's analysis here.

Zhiyong can you make an attempt to use SI units (Ohms) and see
what it will look like? I think it will look better for users and it will
be less risk to make mistakes.

Yours,
Linus Walleij
