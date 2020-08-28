Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B15025585F
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 12:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729089AbgH1KJW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 06:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729079AbgH1KJU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 06:09:20 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB7E1C061264;
        Fri, 28 Aug 2020 03:09:20 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k15so403320pfc.12;
        Fri, 28 Aug 2020 03:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZHzBTEqiDK4axPBETGabpIdpXz6s1djywLVqOpLrIug=;
        b=T9enyjmlwfTWxjknmDmppmvnYxe4xHyWpqkIas/0XLDkgVDcR6B+5tCZiMAzy6KRaZ
         zu+vgGSFu88poO4Av7eyhr27kv71owDOS//MDGrL5Zob8OaRq3iJzjc3p1EiGLEk1Ta1
         ISnnM/GcLf5v/csuFhteu7s82Mi5WiR6PSd1nDdoKB0vBj32qgvYJad7lTa18+xhNL1Z
         L1wKIPBmJa+z3i/NyWwmQuWnAUL7rL+WkmrSwBSN/hCXMnnWSl+0sSeBh33M18smlAMb
         N3sdKpsgOH+8K2GoVawj36iWMRlieqZdNBEYRjDbeee0qYjdXN2wjVvKmzuBJ0weWJlu
         NoRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZHzBTEqiDK4axPBETGabpIdpXz6s1djywLVqOpLrIug=;
        b=cbMyB2ME1JtvoN3sgePr46ICgAxOCNfon5PPjB21LSs5smCfGMm50/DyiNlpahMdKC
         i4lptKuWWMg62wxvwZ/5Z8d16JXGSgcAOTHife5Md1gJ8SQk4y+X5NiHxSt2IucWzlbD
         WlAB9tFQl0cA6RYjrcpy+viLiQxgGe3sbEuHBtf8awBtX5vwa/lHByxLKaQBqkHNKW0C
         x7Qy4pywO7/eX8haglRsxv4IxaXac6C5gId+AT6aOtqwVVc5kgHeGP8xEdVXgCCDb1PD
         BBsOmK6wWzBrXeNDEvw6IIyHdfRvLTFEVKy3Q7d3lcvQU1wDf659qGPjO7TZREq1tD+4
         tS4g==
X-Gm-Message-State: AOAM533SFpu0O9f+MHsmdFp4xkZAN6OtpeO+BnsFt9yTBOMOfl/ctb7S
        noQyQfzuGyGOY/jC/zvBIDmSuIULn40n8jKVAU4=
X-Google-Smtp-Source: ABdhPJz1hTTI76acslLEASjcBmeKJrOH00nsYVH7K4pa6SeRREesUDiP52LRTdXwDptltpeZW1jpW2MQB+KsMqQd9wg=
X-Received: by 2002:aa7:95b8:: with SMTP id a24mr621160pfk.219.1598609360115;
 Fri, 28 Aug 2020 03:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200814100357.209340-1-thomas.preston@codethink.co.uk> <20200814100357.209340-2-thomas.preston@codethink.co.uk>
In-Reply-To: <20200814100357.209340-2-thomas.preston@codethink.co.uk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 28 Aug 2020 13:09:03 +0300
Message-ID: <CAHp75Vefo6djXk0x9OLiqJ=jZV8dkTEoPBRwBfcr41txfSGyRw@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: mcp23s08: Fixup mcp23x17 regmap_config
To:     Thomas Preston <thomas.preston@codethink.co.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 14, 2020 at 1:35 PM Thomas Preston
<thomas.preston@codethink.co.uk> wrote:
>
> - Fix a typo where mcp23x17 configs are referred to as mcp23x16.

I'm not sure it's correct. MPC23016 is an existing I=C2=B2C IO expander.

> - Fix precious range to include INTCAP{A,B}, which clear on read.
> - Fix precious range to include GPIOB, which clears on read.
> - Fix volatile range to include GPIOB, to fix debugfs registers
>   reporting different values than `gpioget gpiochip2 {0..15}`.

I'm wondering if you read all the datasheets before doing these changes.
MPC2308
MPC23016
MPC23017
...

> -static const struct regmap_range mcp23x16_volatile_range =3D {
> +static const struct regmap_range mcp23x17_volatile_range =3D {
>         .range_min =3D MCP_INTF << 1,
> -       .range_max =3D MCP_GPIO << 1,
> +       .range_max =3D (MCP_GPIO << 1) + 1,

This looks weird. Usually we do a mask or a bit based mask, like (1 << x) -=
 1.

>  };

...

> +static const struct regmap_range mcp23x17_precious_range =3D {
> +       .range_min =3D MCP_INTCAP << 1,
> +       .range_max =3D (MCP_GPIO << 1) + 1,

Ditto.

>  };

--=20
With Best Regards,
Andy Shevchenko
