Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4DD83EF312
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 22:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233607AbhHQULV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 16:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232862AbhHQULV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Aug 2021 16:11:21 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807C7C061764
        for <linux-gpio@vger.kernel.org>; Tue, 17 Aug 2021 13:10:47 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id p38so43846424lfa.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Aug 2021 13:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dpxtWXdidkihk42GLp16+rQfG20ZX29R6xVicDROa00=;
        b=L78V8Te4PKpOBHB7sz/qEcf5c/H4cEjQvXdPWNe4rhMFkovz3jT5KqczOc8fCsMacu
         EqzABiQ9q4yhtRvAMhfIvfZKpglQaKm6DNUASQ0H2IGSAEqaYtw+O1LQRCmuyabc3lAc
         Wh99cNxB1F2E7Dyy17WaBiqzQomfAhXLGYrkWapS7+gXQHqaJ6tkiyTvq2mGWXEQZBBE
         ibA2E7XB0M6y0GUZBHc2Fksc865UdXM32dw+71xWbzGXX0CgOWTHLKTpG+CSPEZ0sYxl
         pLQlkvAUXp5rkTjqe22OFKrPx8iV05R3BuO4VRljTURJd+bYP3gA6W4Get7aMPPMiJQn
         cmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dpxtWXdidkihk42GLp16+rQfG20ZX29R6xVicDROa00=;
        b=IBap3WFVLHuLxO5OviCV8aHokrAUxPfrJ4jjJh0iBcTdC3oc+nx3W0OL8Am9h2UHdd
         XnlPBvxrTVpYEQHzsgLC2GV4effv8RIP/uQb05ZMwf4J3wSnHKxSuj7wB7MlHRGFAeEc
         yo7bcVcvdYfuLlxq72U7dhVRNiI75+iLrsRa37p/Hbep9R/qitq+rviPhMrNEz0/ZT3d
         T4WWFVLJXnWtvfTOzcfVR+mDuBkS99S2aPN5J/gVUS/WgdbQEeo3Vldt/ihaGM9vwAju
         SJAn9QKKKT/i7hp2qAxIX9gEHezU2YH494kTSjKybJnm+g2HmWXYiE5hSGrmJazbrXHY
         X6wQ==
X-Gm-Message-State: AOAM530/cJQof4X5RbHkp+Nynk2VDbRXULS5fy5IrDuDMIl63DeblYbB
        Bd/kdAd9vGU/F/031vaRj5W85CtQtKm/hHfo569fEw==
X-Google-Smtp-Source: ABdhPJznsBtZIpUw+keTCjtlPLdkEGb0OuHaFMKJbBFQFrvTfBON2BlSSAWMW93Ctx6m+5gd8Xp6LbtNCd5pzMeFgp8=
X-Received: by 2002:a05:6512:132a:: with SMTP id x42mr3569664lfu.291.1629231045926;
 Tue, 17 Aug 2021 13:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210817080118.9201-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210817080118.9201-1-lukas.bulwahn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Aug 2021 22:10:35 +0200
Message-ID: <CACRpkdZYhXT4NQsCvRzNh+M5g6EMe7gTSkpex_tm-MpQprSm9w@mail.gmail.com>
Subject: Re: [PATCH] gpio: remove the obsolete MX35 3DS BOARD MC9S08DZ60 GPIO functions
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 17, 2021 at 10:01 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit e1324ece2af4 ("ARM: imx: Remove i.MX35 board files") removes the
> config MACH_MX35_3DS in arch/arm/mach-imx/Kconfig.
>
> Hence, since then, the MX35 3DS BOARD MC9S08DZ60 GPIO functions are dead
> code as its config GPIO_MC9S08DZ60 depends on the config MACH_MX35_3DS.
>
> Luckily, ./scripts/checkkconfigsymbols.py warns on non-existing configs:
>
> MACH_MX35_3DS
> Referencing files: drivers/gpio/Kconfig
>
> Remove the obsolete MX35 3DS BOARD MC9S08DZ60 GPIO functions.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Makes sense:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
