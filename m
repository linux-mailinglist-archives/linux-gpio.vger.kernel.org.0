Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20673348CC1
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 10:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbhCYJ0x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 05:26:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbhCYJ0i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 05:26:38 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4C2C06175F
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 02:26:36 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id m12so1469661lfq.10
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 02:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PsTQ4/W7bLkl30GvO3O8c17IK1eiosbGsbRf97AFsMI=;
        b=HVKgPNxV8Rf1c20+mCwDuHYNBdKd6GG1aHaY4yc1nl8fXusfU5VF105dDsB/Nsd1Yz
         9WzWNTIUo47V3G+U+NpNgHDMAgixPFWE3aaRLGw+V9io6is6264ogjRvShX74IzF7JsU
         rX5Jqd7DFP8rnHdCRtaxUSx8WTEpW4oigKOdHXzfnNe/Gk3cAwj4RrTEpjGx3vZVEiTX
         3j25f5w3xN53tvZrPXmdQCmCStORxvgsbrD0jJFD1+NojU0bi7iBO/UNos1oB61UjJEY
         dZbc3NGr2ZXLRmDXJcQFDJHmqv2XY2eO45JnxKDxnDeMLgp7JrAHmiEoHRUj4kxEcsjb
         R8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PsTQ4/W7bLkl30GvO3O8c17IK1eiosbGsbRf97AFsMI=;
        b=XSD/KB9Wbd9K9xDewx8LZL9SAKvCOEoj4vmws0rpms3TGF2olQhw+dLn9pZrPtnkEX
         ZABNcrD2tQgVnjn+mGplXR/AzQjSlkFJW2ScM6YjLf+bHsPiQj4buxB2JyvaBOEAo6c/
         YyXpk/0n50SzyPFDs9Hn+kyg5Axo5Ia4EtBYQbVsKX3iZYk6SGoMsELEFSmMrmBR0Rrd
         pUqZco2LE+B3ctEXUpJSktKcmR48ixWhnzZuQ2TIySltDV6sXANL6whwYOhpgAf6hxNL
         XvBI06PSYm7kKZHv72Goxtcjhg1mg+mTa5ePmaEVX4ZMWBNnqtxV7nkqbFpzWpgrYkuc
         gm7g==
X-Gm-Message-State: AOAM533A5X2mvKK/7OnA8RCkwH8q5dKAcJUGThJFJslHA/8crgDhZQ7J
        rkIZI7scfb1+6sHWp2HQlHSXF2o/5miRkBuig2Amvg==
X-Google-Smtp-Source: ABdhPJwbT7utCSaRj2LK/YkNPbnMiN5qv9qhdFVcP/2GV09K0kyIR9PNixqE7xwN++KseSgIUqgtBaeU9SXgTvuLDuc=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr4577150lfo.529.1616664395375;
 Thu, 25 Mar 2021 02:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210323131002.2418896-1-arnd@kernel.org>
In-Reply-To: <20210323131002.2418896-1-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 10:26:24 +0100
Message-ID: <CACRpkdZjh+z66XAxg4-Cj_Mz7iVkgpyY65nNTvUdOXV6yTknEQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: microchip: fix array overflow
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Arnd Bergmann <arnd@arndb.de>, Zou Wei <zou_wei@huawei.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 23, 2021 at 2:10 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Building with 'make W=1' shows an array overflow:
>
> drivers/pinctrl/pinctrl-microchip-sgpio.c: In function 'microchip_sgpio_irq_settype':
> drivers/pinctrl/pinctrl-microchip-sgpio.c:154:39: error: array subscript 10 is above array bounds of 'const u8[10]' {aka 'const unsigned char[10]'} [-Werror=array-bounds]
>   154 |  u32 regoff = priv->properties->regoff[rno] + off;
>       |               ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
> drivers/pinctrl/pinctrl-microchip-sgpio.c:55:5: note: while referencing 'regoff'
>    55 |  u8 regoff[MAXREG];
>       |     ^~~~~~
>
> It's not clear to me what was meant here, my best guess is that the
> offset should have been applied to the third argument instead of the
> second.
>
> Fixes: be2dc859abd4 ("pinctrl: pinctrl-microchip-sgpio: Add irq support (for sparx5)")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

Yours,
Linus Walleij
