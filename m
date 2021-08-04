Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C343A3E0AB0
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 01:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbhHDXC0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Aug 2021 19:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbhHDXCZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Aug 2021 19:02:25 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8D0C061799
        for <linux-gpio@vger.kernel.org>; Wed,  4 Aug 2021 16:02:11 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id n6so4431897ljp.9
        for <linux-gpio@vger.kernel.org>; Wed, 04 Aug 2021 16:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SWwfAxfR7c4JrRsq35ex9D7DmgW1MFN8V1BR9OdGE3s=;
        b=Keuv9rmwBrPD0mImQNgZzTd90sUsS01XNQNiwlt6tUctK265kK/0g+VQw++Z0LJ8qV
         GA4DWAfZNHOkzruKioaUUOXybY/N3gQn6kkN3XLaOSBakIKXZndZXC2tiRDeFktVD7Nj
         U0Lm5nC5tMADC75PQ/9NHb8NooglHWqHmvM+OHuDYnUSML3W4AbM0TTOy2LNgvhKuSei
         lf/5OI2gFbsAb20Sh2cs5P7osRk0xkL/MEsxQKRh+GvSwbLa/5U+6VT+VQd2vAdi3xPY
         H4PSSHtVkLqf95+zWzC9dGeT086BV7ACrUGMssBe6ycVsdo1gmnobhnCi4EAlC7j/Kgp
         D28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SWwfAxfR7c4JrRsq35ex9D7DmgW1MFN8V1BR9OdGE3s=;
        b=s5YXjpSJPFjDBc3HoZ4K64Dlc0JmSTcBO4Ff6IDBZLMaHev4qUH/MSTqJy2lhYZcy3
         O2KlB9RoMYcQBFNl6DiCVKy94Sj4ZkoTi0C6XJwL9VgOeyXhrXZ2ax1WOAaS4dLd8ZnK
         rnfmmXDFKlWfstpkf1c4yWr6y+GcvaHOh8RlEmxpd0RBT9jwmoZDgdkAcMed2FJVTxpb
         r/znuZwdicN3fBtC7bmv37Pb92Igdd/59ySAhKzMao/FxaLluYYnuJYIk5e/dSAemo2Y
         7D1z/zsRXzsFpGPEPu6z7Z/nHOBNmLahLbat+1UkvJdfMJt8E+KyHpi2nCTMzSIIhl57
         XIEw==
X-Gm-Message-State: AOAM530ESAreGOpxCg5GuJ4O3kbOoRqXFHDrrVHofwqJjkFpumWug5MC
        tSvGxtbFL1zEcNXYfEBWJXa7HHsjEnJTRUwltdavUw==
X-Google-Smtp-Source: ABdhPJz61O47mzHH9624bGfk/bfpBA1SJ3dnMpXd9CQG2hHPT+eKzKSoE6RiH7zQjaw6hJgUxRPNoePE54zpybhVLJI=
X-Received: by 2002:a2e:7c04:: with SMTP id x4mr1038597ljc.273.1628118129818;
 Wed, 04 Aug 2021 16:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com> <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03> <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
 <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com> <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com>
In-Reply-To: <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Aug 2021 01:01:58 +0200
Message-ID: <CACRpkdZ4k9Km3vBtdN6AnBM89c4355GtPMzCQ0_YHaTb4V5cKA@mail.gmail.com>
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

On Thu, Jul 29, 2021 at 11:43 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> On Thu, Jul 29, 2021 at 4:23 PM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:

> > The rsel actual bias resistance of each setting is different in
> > different IC. we think that the define "MTK_PULL_SET_RSEL_000" is more
> > common for all different IC.
>
> I see. I personally prefer having things clearly described. I can
> understand this might be an extra burden to support different chips
> with different parameters, though this should be fairly straightforward
> with lookup tables tied to the compatible strings.
>
> Let's see if Rob and Linus have anything to add.

Not much. We have "soft pushed" for this to be described as generic
as possible, using SI units (ohms). But we also allow vendor-specific
numbers in this attribute. Especially when reverse engineering SoCs
that the contributor don't really have specs on (example M1 Mac).

The intent with the SI units is especially for people like you folks working
with Chromium to be able to use different SoCs and not feel lost
to a forest of different ways of doing things and associated
mistakes because vendors have hopelessly idiomatic pin configs.

Yours,
Linus Walleij
