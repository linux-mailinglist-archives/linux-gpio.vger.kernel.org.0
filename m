Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0205805D8
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Jul 2022 22:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237050AbiGYUkm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jul 2022 16:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235916AbiGYUkl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jul 2022 16:40:41 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511D36312
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 13:40:40 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id c72so12585358edf.8
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 13:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TPHbMd355xgL0q2Yu6beQJq1HuNtIMrQiJslgYIkSBo=;
        b=R1ub5XGHyk4SOMc6IZ4ypdSjCHjqIO9YycPuTDiElpe24DBtFT/NrK9J210cElDVCH
         8mbOR6PQz9kVgBWqT9lgZHT11hJzSmd1j/fo0yPS0DfmfnWvpyLlKhLhAYI0xNx+YiAp
         /qhP/3U3ntAE7FY1gmVlP/JA62GcxpmQ5jWaiDToX6F3UWu5Gu5VNjZnKoXNIE740TEx
         c/p0yfDD0gebAtxCW2z0BMaqYhGfh0N3rlgbReDw45HTwxg+v6uKtARFS1CjPi2NEfIQ
         a8AMusF3n4WXIdgdEsENUwU5YYYuQx2I9fvH0oEzNnOM+N+IXEriyB2L1TQLw69ggucK
         WYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TPHbMd355xgL0q2Yu6beQJq1HuNtIMrQiJslgYIkSBo=;
        b=ZM1OjKvoKUdcg6oO+xf6WPms+xTUN2RPaaAz3ew0wRUj1ThzRzamKQ9IwWAIWAR0KH
         pa6xUQw69S1hsYaGKsNTxDrSHUohAUjBiOJDesOOXC4wjGwTUqY5vmpelbpbQ1i0oC/s
         or9hJ32crOb9bjguDLSjReFIPh0cb6G44DSfQhHPbXHEIq71XUQ6O4CgoLx4b3AwmsrN
         6SO5VmE0HfgypFE4KRohLAaj+FKSmzE7A1Smp6GQbCxOC3X67ic94Qm2kXleTnz10kY/
         Bl2D5tUhOnnjCJC3tNHh2d9l6qEOwEertMp/luFQQYWKB0sb/VDJvfiYUrHza6OZgsot
         FT7g==
X-Gm-Message-State: AJIora91NEVLyCThVProE59kn/2DkEehSCnk+CNhbbTqbDhQ5mkMyVxc
        wJMrHfhciP8trOkGDeo2Y/7z12deuCaqw1PgSKlgvk+QqkU=
X-Google-Smtp-Source: AGRyM1u/pdjhm6qgvO1NyT7x0P4RGTsx15kXqQamh4FIdVJnO+bxroeBU9DI2/qfWAEETDeTQhWXxgiyT9gMdSGDlMg=
X-Received: by 2002:a05:6402:254b:b0:43b:d6c3:dd96 with SMTP id
 l11-20020a056402254b00b0043bd6c3dd96mr14660785edb.406.1658781638891; Mon, 25
 Jul 2022 13:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220725103445.88674-1-marex@denx.de> <20220725103445.88674-3-marex@denx.de>
In-Reply-To: <20220725103445.88674-3-marex@denx.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Jul 2022 22:40:02 +0200
Message-ID: <CAHp75VcGF6VPwVC29ycCUQbSDTwwGnbTF=dticq_1Y-7AvEi7g@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] gpio: mxc: Always set GPIOs used as interrupt
 source to INPUT mode
To:     Marek Vasut <marex@denx.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 25, 2022 at 12:36 PM Marek Vasut <marex@denx.de> wrote:
>
> Always configure GPIO pins which are used as interrupt source as INPUTs.
> In case the default pin configuration is OUTPUT, or the prior stage does
> configure the pins as OUTPUT, then Linux will not reconfigure the pin as
> INPUT and no interrupts are received.
>
> Always configure interrupt source GPIO pin as input to fix the above case.
>
> Fixes: 07bd1a6cc7cbb ("MXC arch: Add gpio support for the whole platform")
> Signed-off-by: Marek Vasut <marex@denx.de>

Can you move below lines

> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>

under '---' cutter line? The LORE archive will have all people you Cc'ed.

...

The comment as per v3 still stays.

-- 
With Best Regards,
Andy Shevchenko
