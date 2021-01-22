Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABB32FFFB3
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 11:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbhAVKCS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 05:02:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbhAVKBJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 05:01:09 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6471C061356
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 02:00:02 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id m22so6712425lfg.5
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 02:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3b6S2/z3tpa4MkB+bZqY5tPcMx97QoLNDAPmEmPnGt0=;
        b=CD6w0ZgUypDgjE9zR0ZJVOxq+rlOgFypR7WRO0P5wQjcTwWxl7hRP3Ql2htnVNIAcX
         a6IqCbfY2yRx6C5mdcNVOsZuG69XJvCbRsJ9Uwt9kAhwZJKg1z4WKyK8EfJxQXhrmawK
         jvFt+Si3bh4KoOEFtnIjQlVBRf7/v7+F49qvweV/jRKr+KlXm110gJzTsJCQIWgstzaw
         67MyDzp+6NUBDMO2GYmaWO2h4m36KrN07K4BoFPv7KykDmlqx27YNW9ojW1K0wkSNu+M
         JNGZPmD0ZAsv4GIQ7hMVzNvVvRqICKOZ5otGgE3Bh6ATdVkrvErsTghZo2d4jrVmARuI
         cncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3b6S2/z3tpa4MkB+bZqY5tPcMx97QoLNDAPmEmPnGt0=;
        b=q+n1QYDKP2d3V/4RyS3vRye8nkWZLMZ7aXh8fMs4NT0p6XCCJ/ZhJcBZ89EgauxeSJ
         vod/HCtLvr3EH3uqc/eBJXN3beblsK3cF1OvFNtzDt/IfbkTDvz1G9hoKPSgkxOmaZWr
         IvkOckoiccnChMHm9eAPVKG+dZXYVh1zZSDIYNbPLliUgy8BZlwj33MZufDhuO6SLe7/
         ttzatXaHqJOCeU3ZfreuWfxR6vwlw3mBI9YPlNeZVUpj5gKpEp4e8zCa0DXUpRGh7RJq
         YvhV0pf2vYE5S+47UswWjiA+nYU660zr0mwa56hPe23ruOMW2S43qvlVuTsZ5j88nAzU
         lUvg==
X-Gm-Message-State: AOAM533yhTKBsPm2zKH5StPDZ7bauvMtqoUqRCLxNFjkmePBf6dOkpD9
        Ouq24naia7sxAGRx0ZR2e768C/LDHBbyXGnoLIkSHQ==
X-Google-Smtp-Source: ABdhPJwUwANyZtTNJ+wpcGjC0EBfyorEBi8TdaoRhCKcIcRkNc2spagF6/gcNBcB8Dn2Aspuc2waqUkn0aaoZM6u8JY=
X-Received: by 2002:ac2:5c45:: with SMTP id s5mr19528lfp.586.1611309601102;
 Fri, 22 Jan 2021 02:00:01 -0800 (PST)
MIME-Version: 1.0
References: <20210111182928.587285-1-angelogioacchino.delregno@somainline.org>
 <CACRpkdZp3oqj4VeUZEPu=POwAdf-7R3NzNoN9XehtEi_R_fgkw@mail.gmail.com> <1e34145b-a04a-1cbb-7fbc-87c69b8dcfd7@somainline.org>
In-Reply-To: <1e34145b-a04a-1cbb-7fbc-87c69b8dcfd7@somainline.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 10:59:50 +0100
Message-ID: <CACRpkdacfa6usOZtc+A=ZxEpB1ij_gAKX2PLMOaX0mY_0qHp6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 18, 2021 at 3:38 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:

> By the way, this is really LEVEL irq, not EDGE... To avoid any
> misunderstanding, I think that the best way to show you what I
> am seeing is to just copy-paste the relevant piece from the
> datasheet for this hardware (it's not a confidential datasheet
> and freely found on the internet).
>
> Check this out:
> " External MCU is required acknowledge by INTN pin. INTN is open-drain
> out-
> put, low-level active, and need external pull-up resistor.

This talks about what polarity (active low) the pin from the expander
to the SoC/CPU is. It has nothing to do with the line into the
expander.

> When AW9523B detect port change, any input state from high-level to
> low-level or from
>   low-level to high-level will generate interrupt after
> 8us internal deglitch. "
>
> ...but since the datasheet is sometimes unclear about "things" (I am
> mostly sure that they have translated it to english from chinese), I
> have actually checked whether the INTN pin was pushed LOW when one of
> the inputs goes from HIGH to LOW.. and.. it does... and as you imagine
> yeah.. it's slow.. and yes, as slow as you can imagine. :)
>
> So, in short, this chip is raising an interrupt when any input changes
> state, regardless of the change being LOW->HIGH or HIGH->LOW.

This means that the expander only supports
IRQ_TYPE_EDGE_BOTH and nothing else.

"port change" above means edges.

Augment your driver to only accept this type.

The consumers better request IRQ_TYPE_EDGE_BOTH
(from a device tree for example) and consumers better
handle the fact that they get interrupts on both rising
and falling edge as well, else they may need special
code to handle it. This is not a very nice feature of
the expander, it would be more helpful to users to
get interrupts on only rising or only falling edges, but
as written, it will generate interrupts on both transitions.

Yours,
Linus Walleij
