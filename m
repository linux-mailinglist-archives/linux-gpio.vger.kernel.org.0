Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB373DB8CF
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 14:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238847AbhG3MpF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 08:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238899AbhG3Mou (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 08:44:50 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A96C0617A4
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 05:44:10 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id u20so12244378ljo.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 05:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a5XQMaz35GQWI34eEmf85Zx/0SDB9xb9F4beO3eG0XQ=;
        b=RpUdgmOB94oKKBxx25fYPzJfPirqOqPOiI9Az6hFs3LBDAaNX33ixBDdZbSkXcVt2y
         orsjULwTyJ19wTZ7kDCwurpUtf2DoJZdKM2dz/Prd0WCs6z1DINKVUc2r2+4AYOtOGVa
         z1vVE0jOOuH348DsSgMLXLJnnwApuZyvpe4OWpuTjDeVYbw44TC9iRRKjaGmJpv2Vrb9
         +8+i06tBsvnfM+RZtu+r3Yv2tCwYQVMWce5oLHcllClGJrtK9tjzosAVZdxSEQ8x1u1H
         bWd6rdj7+yh+fWGtT+mZdgOpGLLZsiYMgk6ev3FuwwfCJ3f2Evxc9L2hacEvhFfUFAgh
         QSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a5XQMaz35GQWI34eEmf85Zx/0SDB9xb9F4beO3eG0XQ=;
        b=Wv5ekWKYCaZzMnfqDBfFt/y907D3BHXFrNCwohub0/nthXCkFWbghBATTpQjGdu1Dg
         c8sYeKwDuTix8pBeEn7G3chdA5eSrowAmT28sXmwGxLbxKKkBTF+gl+B8tmyrJWm7XyC
         s8malVdSJRN2+Y29QsKyUCEUogcF080pfVRFY/5amZL06NAPozfTYbbljH35ZH5FK8pu
         76dOKqIdfqVT1QnDaxAzd5sklZDvU4NrmsfCu/9KFak6HhJQkv5V5WDO96Li4y0bzg1u
         FHwjxHxgRgXUufeQONNPWk2YW9tyo57NOnFsUDrZAJDl7t7tGxgpMTOVHR2C8kDklAZM
         mvnA==
X-Gm-Message-State: AOAM530OP6MXi41+xQg0Aikwk2YwBMdKDKmR9W09i7jNcEMrRQDfZN2u
        CKYINV+6RCypf3TLEIzXvSIxIOHmAwCqxb3yHULAWA==
X-Google-Smtp-Source: ABdhPJxtTbhsXYkjhw0pIqrXNFx09EJLycc+oiEbbtK8QeKVWUojjl8+nDB0lnoHOK7O+8o+Hx46gdF6gTSo1NaQeTM=
X-Received: by 2002:a05:651c:169a:: with SMTP id bd26mr1511169ljb.368.1627649048309;
 Fri, 30 Jul 2021 05:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1626868353-96475-5-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com> <YQMIhBPwcNw1YqMq@robh.at.kernel.org>
In-Reply-To: <YQMIhBPwcNw1YqMq@robh.at.kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 14:43:57 +0200
Message-ID: <CACRpkdYrHTMLL_CQi0BoNZsXV3=2dBK38pkvd+EEkuPrzoG_Cw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm: dts: zynq: Replace 'io-standard' with
 'power-source' property
To:     Rob Herring <robh@kernel.org>
Cc:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>, saikrishna12468@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 29, 2021 at 9:59 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Jul 21, 2021 at 05:22:33PM +0530, Sai Krishna Potthuri wrote:
> > Replace 'io-standard' property with 'power-source' property in all zynq dts
> > files to be in sync with Zynq pinctrl driver.
> >
> > Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> > ---
> >  arch/arm/boot/dts/zynq-ebaz4205.dts |  8 ++++----
> >  arch/arm/boot/dts/zynq-microzed.dts |  2 +-
> >  arch/arm/boot/dts/zynq-zc702.dts    | 20 ++++++++++----------
> >  arch/arm/boot/dts/zynq-zc706.dts    | 18 +++++++++---------
> >  4 files changed, 24 insertions(+), 24 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/zynq-ebaz4205.dts b/arch/arm/boot/dts/zynq-ebaz4205.dts
> > index b0b836aedd76..be7eae611fb7 100644
> > --- a/arch/arm/boot/dts/zynq-ebaz4205.dts
> > +++ b/arch/arm/boot/dts/zynq-ebaz4205.dts
> > @@ -57,7 +57,7 @@
> >
> >               conf {
> >                       groups = "gpio0_20_grp", "gpio0_32_grp";
> > -                     io-standard = <3>;
> > +                     power-source = <3>;
>
> This will break using a new DT with a kernel without patch 3.

The old (Linux) kernel never supported the "io-standard" property
anyway.

Unless someone is running som BSD or Windows with support for
this property it can be merged by the quality of zero real-world
impacts (no-one there to hear the tree fall in the forest).

Sai Krishna: correct?

Yours,
Linus Walleij
