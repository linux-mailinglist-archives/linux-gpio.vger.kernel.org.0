Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12CE2EAEA8
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 16:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbhAEPfu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 10:35:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbhAEPfu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 10:35:50 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0FD1C061574
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 07:35:09 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id o19so73577797lfo.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2021 07:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n9ywhnkKl+8ibGFk6x/w4vD3KrzTNdzxRk/xz3CiXrI=;
        b=G5INoog9FncFklZTcFfFeYnQ953tRmn/YZ5304migaJ7GQECN5N5BHIEPH+5+8UkwW
         zjA+UnVa/n7UWLVM6jvtgXx63iWz4Kgtdf2zsV8LFUwGL5jgWQ7JGjuU/PQysJRvVL9z
         2g0N8tn7FpNXXXXcj2e+W4AHYWfaQeAIsodH7vOBWAwES7nxLn8799VrbaI/iHHRX5x7
         CjT2xD5fzjBTffFmgtpwY2SkpU+/w7gVl2SYy2sEkZs/AM6sORbT0YZSt3I0vzIhmlgA
         IX+lwh+7Wzq6UM3750IyW1UhcnEgv4+MzRWZSff7zYglzHhUKC767vM1Flop91YW0Q0y
         nzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n9ywhnkKl+8ibGFk6x/w4vD3KrzTNdzxRk/xz3CiXrI=;
        b=h9IZTzESuH6bcYa5HgZUBQcWK7IpnQ49PkapLZ7II1CDlCVenkc5Q5t8xqksYYsTvA
         TxvLtWklpAB3TzdT72mbN1m19pk8OPyildF0Woja4nF8nyqfGSVjU4ssy3asQdG5xY7Q
         4f3zv4OXn7Xfq1RTLjvex1TlaLlDSztEC07e9NLjWHcr4zl/OcaHNj3BBYh9G5++qj7i
         8Ai2NeHxRzfGAEpZb+a8YWEVlyCVLTaRjltp47YteEfyhEdVoVqLMoM8Kaswk3IwLien
         A1LEOSudUVw3HegQuoOgIYUfgbf+qErVDwfq6ZeNnMHHvXwZ8QcJ8BOo30lxKU8Penbr
         d9AQ==
X-Gm-Message-State: AOAM531SxVI/tAVUHn/FpHnwbqizwCEGlT/CCQxxBG5nhOOfmCI/QF4B
        KKJvSE3mJSeMmE8uZ8l65nGFWFUCm6x3nWsiuWHcjiq3G2cF7A==
X-Google-Smtp-Source: ABdhPJwS/ugJjp0NHwgEkQVOeiSMidQXGzCH5Ti61fwr4Um/lKyqn1LqGe7XzDjRgvV/2fVh3MubVhgBUOT/Q68yrDk=
X-Received: by 2002:a05:6512:74e:: with SMTP id c14mr37687128lfs.529.1609860908349;
 Tue, 05 Jan 2021 07:35:08 -0800 (PST)
MIME-Version: 1.0
References: <20201230214918.17133-1-festevam@gmail.com>
In-Reply-To: <20201230214918.17133-1-festevam@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Jan 2021 16:34:57 +0100
Message-ID: <CACRpkdatsW79FMfN2qZQdYSrz1wmHz82zSLZwxrh5am1pWgebg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: gpio: 74x164: Introduce the
 'registers-default' property
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, sandor.yu@nxp.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 30, 2020 at 10:49 PM Fabio Estevam <festevam@gmail.com> wrote:

> There are cases where a certain default output value in the 74x164
> output is needed.
>
> For example: the imx6ul-evk board has the Ethernet PHY reset controlled
> by the 74x164 chip.
>
> After enabling the OE pin, the output pins of the 74x164 chip go to
> zero by default, which makes the Ethernet PHY not to be detected.

So should the ethernet PHY not just have some reset-gpios
that it obtain and de-assert as part of probing?

For example drivers/net/phy/mdio_bus.c has this:

        /* de-assert bus level PHY GPIO reset */
        gpiod = devm_gpiod_get_optional(&bus->dev, "reset", GPIOD_OUT_LOW);

Other drivers can do the same.

Deferred probe should ascertain that this GPIO driver gets
loaded before the ethernet phy driver.

> Add a new optional property called 'registers-default' that allows
> describing the default output value for each shift register.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
(...)
>  Optional properties:
>  - enable-gpios: GPIO connected to the OE (Output Enable) pin.
> +- registers-default: An array of 8-bit values describing the default output
> +value of each shift registers.

What this does is to set up several of the GPIO lines to default
values, right?

I think this is a hack, there have again and again been proposed
to have a way to set up initial values of GPIO lines. I think we
need to fix that instead.

I am sorry that initial values just stalemate all the time.

I imagine that codewise it should just be some lines in
of_gpiochip_scan_gpios() in gpiolib-of.c (which can later be
made into generic device properties if ACPI needs this too).

The format of the OF bindings is what people have been
discussing for too long, whether gpio-initial-values, etc.
I would just implement what the DT people want and will ACK
so it solves your problem.

I will try to look up references to earlier discussions on this.

Yours,
Linus Walleij
