Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B1127CE4C
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 15:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbgI2M7z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 08:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbgI2M7z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 08:59:55 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A92DC0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:59:55 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id q8so5378302lfb.6
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eh3KJG2w7Yys6UJFQHww2Hj3zhNUGcK2PJZaSQvoL8k=;
        b=pkDwbqFFvv0yf46aTOLZYdoje82yh84sOxJ0zOD1Mo1S9fCTDrdvooZRmXIFWfAyLe
         LuO25Ff8ySbEejdwpHOAQ3GlirPeC4A+dtwBna0OrrDDipAhUh+3M1apNY87dRrbt3am
         XPr/8CfFIPw5rFVMz5r9FNSAlFDXa+EC0/YNidBiRs99dwe0AqHUocXDbXTYbvkKbxMk
         tvDf2UyEucYevFfsHeDNNCQuFoBU2DtvCBu2oTzKTeaI+7YuVBEhyh6lHJSg/b72TBFI
         gYNNjQ6yT0dO2hT6ge1cVWpeO5WCNrCoH/s4Z2JUpFwlwBjE/pnPFB/jczKY5i1WHlFZ
         eOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eh3KJG2w7Yys6UJFQHww2Hj3zhNUGcK2PJZaSQvoL8k=;
        b=ekJlvKrMC0HDC1MMBqmNaID+zujlEMDCe4ka7MjgxAQOd/CE+bomRlsDjfE5KetiEt
         MlzQZUOaCgxeAFkU4EE8RileeBLCxsqd5TWmlBtTI2/aLveAlruiROPNjzFn8uniaAv7
         iAUgqE9KSJMWM91GWqWDE/sqZB2dRkAHgVqDEHJBjraCpkwH4O3tIfJJovSrKgcU0Esu
         35skeXq/G11OYwyYpv1Z9cX0Y/xDitWaIlYYzjUGbw+SrltNDfc+L/jJEoGuRN/nXR0E
         K5TEYH58p7A/o9fHDcaIUD/tJ9RrsHW/ETzWdkf73CKneiJ2KJ15glxZPwswr+diTtzI
         mGbA==
X-Gm-Message-State: AOAM530QvDKb3h6soIsMG1tpGTHbGR/WTPQRolo5Na+pFdBL+yibzgg0
        oJdjTKuYgzGjRattbOGBieQZ9qv8r3pDQ7CgZ+kd4VhqYuCD0g==
X-Google-Smtp-Source: ABdhPJzxjXuvos1X0Emgi+gEyH5ri9cRPCfiatSQQnmAqePCzDD9Gdohy4+kv4rNIHNVz9ZGehnkKSiaz0VvcT/H6h8=
X-Received: by 2002:ac2:4c11:: with SMTP id t17mr1269691lfq.260.1601384393349;
 Tue, 29 Sep 2020 05:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200914144025.371370-1-fazilyildiran@gmail.com>
In-Reply-To: <20200914144025.371370-1-fazilyildiran@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 14:59:42 +0200
Message-ID: <CACRpkdZK1XsrCcmc7yvgff9meRVBtoVmc9R6tirxYeRXgDQWFQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm: fix kconfig dependency warning when !GPIOLIB
To:     Necip Fazil Yildiran <fazilyildiran@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        paul@pgazz.com, jeho@cs.utexas.edu
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 4:41 PM Necip Fazil Yildiran
<fazilyildiran@gmail.com> wrote:

> When PINCTRL_BCM2835 is enabled and GPIOLIB is disabled, it results in the
> following Kbuild warning:
>
> WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
>   Depends on [n]: GPIOLIB [=n]
>   Selected by [y]:
>   - PINCTRL_BCM2835 [=y] && PINCTRL [=y] && OF [=y] && (ARCH_BCM2835 [=n] || ARCH_BRCMSTB [=n] || COMPILE_TEST [=y])
>
> The reason is that PINCTRL_BCM2835 selects GPIOLIB_IRQCHIP without
> depending on or selecting GPIOLIB while GPIOLIB_IRQCHIP is subordinate to
> GPIOLIB.
>
> Honor the kconfig menu hierarchy to remove kconfig dependency warnings.
>
> Fixes: 85ae9e512f43 ("pinctrl: bcm2835: switch to GPIOLIB_IRQCHIP")
> Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>

Patch applied to non-critical fixes, thanks!

Yours,
Linus Walleij
