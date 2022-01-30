Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4AC74A3310
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jan 2022 02:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353640AbiA3Be3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jan 2022 20:34:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238167AbiA3Be3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jan 2022 20:34:29 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C11D3C06173B
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 17:34:28 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id i10so29739854ybt.10
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 17:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5LTlwuyoCCeV/lWd1krNXi9YMlj9u74LcL37EapLT6c=;
        b=UEbsYVKhe5XfrowExYlr9KoSIuYjP747APL7NZkOK/24SiHhBi2vIdbGeuf6Rk9mi8
         h8FWi9jBzWwX958KuLWqk7YwxPU96e3JEilJSqiyLllYEydUB4HYxaowFwTBNUKLai1V
         8mBhrZaIhdwT1AjxvseqWfCwDSbTOtBORaEdvKjbauPj6917TVjsfgRqqT/5784kcUcT
         Uw5M1JjfnKBaF8yKUjm4JRbI9xbopKan5B6RWnH/EvKqCz4bGYcF3HUNh6Erbehgh10B
         /pDdhOuLL3q/z9Ax3sofUprcxrFFiCxd3ZWCW9kbzAKq7UyIY0JzeCC6hP4F/Kb6bOm2
         9Y/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5LTlwuyoCCeV/lWd1krNXi9YMlj9u74LcL37EapLT6c=;
        b=5ZbWeGluIImWVbZvbcYABPFvSViINcdTK4eYg7y9O/pFe9NkWbOsk3w2z2y2FUr0xu
         wql+DCUAZPJjbleXHqRoW+S6VfGaVT3KKBqt41zC7Ucwat4w970jubOCrZbuZANATiWJ
         62mXRwIt53LadCbNgEyThEiWyT85BO7LlJim60Hw1NXkG6KPpRp3yocF0cg5hpM0DWgt
         rvNzMW1f3RcfNfol2w9Sb4dwHZOdtFasbQfk8mlO6fDiRKmdgDTmIYAlw5aKRsQeTvTz
         dW4zbt1UnE+Rek+W6tSegZmEbN6DLRC9TgsgxWuvN/9TBclLWCV7+l0dEYtV6Tt5zbf6
         kyJg==
X-Gm-Message-State: AOAM530ahhnyGkZ+gx6Pl4r/g7lFXX/enSy84vnyZvOn5r3/Mdu1Tzw+
        J3UtNLdBaB/WJkzy4WKM/vz6U+rRkDtes3rQ9WXqCQ==
X-Google-Smtp-Source: ABdhPJyZ61EBOf1VSdW0sVBE2/eKCwZCVy4yEEQ5ONfFg0Sa6Q1a9vuma7d6V5M+Q94TUNGbYcRwaGcPTKwli4B0xk0=
X-Received: by 2002:a25:8c3:: with SMTP id 186mr21207098ybi.587.1643506467954;
 Sat, 29 Jan 2022 17:34:27 -0800 (PST)
MIME-Version: 1.0
References: <20220127215033.267227-1-f.fainelli@gmail.com>
In-Reply-To: <20220127215033.267227-1-f.fainelli@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 30 Jan 2022 02:34:16 +0100
Message-ID: <CACRpkdaEnXTDpAVPGkVVNHtYoQtG6fNNZ8xnSJdCzyDHVO4SkQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: bcm2835: Fix a few error paths
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jason Wang <wangborong@cdjrlc.com>,
        Marc Zyngier <maz@kernel.org>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 27, 2022 at 10:50 PM Florian Fainelli <f.fainelli@gmail.com> wrote:

> After commit 266423e60ea1 ("pinctrl: bcm2835: Change init order for gpio
> hogs") a few error paths would not unwind properly the registration of
> gpio ranges. Correct that by assigning a single error label and goto it
> whenever we encounter a fatal error.
>
> Fixes: 266423e60ea1 ("pinctrl: bcm2835: Change init order for gpio hogs")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Patch applied.

Yours,
Linus Walleij
