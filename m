Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55E0410AA8
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Sep 2021 09:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhISH6U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Sep 2021 03:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhISH6U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Sep 2021 03:58:20 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA88C061757
        for <linux-gpio@vger.kernel.org>; Sun, 19 Sep 2021 00:56:55 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id t4so31983694qkb.9
        for <linux-gpio@vger.kernel.org>; Sun, 19 Sep 2021 00:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Npl/leggepHD0EGoZmsugGCAR1+eS6TGaT9Y/S9n+5g=;
        b=8GnkhK4uIQVYOhh5dlUFBAkOORhIkTeaE0drDIJGNEjS3J+jjDtjE10vL5qk709Uyl
         ZrDjJqQKAutpCZp/9LrPeJxMKX2/MbQpjNA/E1Qgn9zHqU/ZCKyE75cx8XiiszVJLJmC
         RPADiDQFaFKhgsADezRTLs9d83pUccf2UTy9YwBogMG435SmJu488pTRFbWIdGHtufR5
         NdRkw1hwrzaGiweqIymTdJyUQTOZc1RUHJxsZVEFxF2QRlE62ep3rDsNLmeG/xBCBWJS
         mh2+0xE9qcIvFX7dvLhx0Axhpz5tWSY3YX8MrBpp8cTzRmA2e5A1+z06IiHnjQBHKXXo
         co1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Npl/leggepHD0EGoZmsugGCAR1+eS6TGaT9Y/S9n+5g=;
        b=5rtDVlKxOFQqIBhBkiBAoHCm8OONBlMIflSlIjfBB7QtrQvQtinn9FNcqQ45SyS2P5
         PPfpO+RploO3mlLTWeo2YIL3TxxTurMJ8TT0aDTYGffB9r+UAef1wcERj4cqOmafop5l
         mBJv3PxRslJujrTmC5XZaR1+CZ8oa+etA0Zl/AD5tPnSoBHcevkboFSlF00TwTk6Hoge
         akwpEwLZmYUUk1OFG7Xzwy8Zh85S8lzCEESElIs+Lpj3QMBiXLuRhamm69SrRf4HK/cn
         2aq9MxsHogu56D7rsUZJFcVCTKfNalMXfGB4AtNehdggGAOKIsO/aiCy60Xk+gbaUQ7e
         AcIA==
X-Gm-Message-State: AOAM530bBeyyf0jJhsViRgkaOywrqoY9cZjqQfvaeQh+xoBEQoeuB/Lr
        n7Bc06/ZQQ5mTXZzZMmUWz+NpQWCQoyFMyePyj1cFg==
X-Google-Smtp-Source: ABdhPJzbcvWpC3hWgJH4ukvAEQGPmgUB3wKOtmVO7hZ8ASWcEMr0aUrBztP5ckSohOAeCodek3dB3Ms613WelMZfalc=
X-Received: by 2002:a05:6902:100a:: with SMTP id w10mr25177724ybt.93.1632038214765;
 Sun, 19 Sep 2021 00:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210901091852.479202-1-maxime@cerno.tech> <20210901091852.479202-23-maxime@cerno.tech>
In-Reply-To: <20210901091852.479202-23-maxime@cerno.tech>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 19 Sep 2021 09:56:44 +0200
Message-ID: <CAMpxmJUh0+vXJjgsDQs4FoBLLCD---_FR8aA3vr84LCGxasYtg@mail.gmail.com>
Subject: Re: [PATCH v2 22/52] dt-bindings: gpio: Convert X-Powers AXP209 GPIO
 binding to a schema
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     linux-devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-sunxi@googlegroups.com,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 1, 2021 at 11:19 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
> thanks to its device tree binding.
>
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> ---
>

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
