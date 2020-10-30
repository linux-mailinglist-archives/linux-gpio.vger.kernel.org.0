Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89BBF2A08A4
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 15:58:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgJ3O6h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 10:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbgJ3O6g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2020 10:58:36 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC10C0613CF
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 07:58:34 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id p5so9054711ejj.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i2vW/gUa8KABq6vJRUyix0aI3FxbHcHCVNJ+zNv4J+U=;
        b=KPV3bpHHrAzBaaC50FEZp+AnzqFoDsf4z8fG2+W4QSR91laGEjppD2dpd2cPkJZauC
         qEcnqyokHcyC/alN6Zz1evo0v6FklEUsIcAlIBHlWmh+p5dlgqj5bTy20UcTr5kpJ2Ln
         Xjn3QVSADxZAq22aqaHl7jdGHHSpuAfyBIBsMRkPWTA/IBeRuZbKJXr8DmwMdpdhIrPb
         205xpSbwsxBUDgFC23oKMYvmnUtvbEj0Y6uD9Z54izsByibk6E/MkizklE7OH+T4ko+W
         ELOVHsUsUjbAtx1KWcn55nqyRK8UJafNsSkFd9igeyIjYA9RJPlA7fpbMT924mVbq96P
         FJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i2vW/gUa8KABq6vJRUyix0aI3FxbHcHCVNJ+zNv4J+U=;
        b=kVvpQqxaPwKVCvivrxobLl1fX78p23aV1wwxsbdzoOkhR36kw4uMipWE49F9w6hTOT
         5MDCrxse2AEril7v1H4weVgFaOlblax9/+LYU3oYA4pos2S4aXcA/9dY1ttfbl/rqxW5
         vLNmFyV7jbg3Ysoa6bvSBGyLaZYij0yX6D7m2AVvsJfLsSl4aicWaeJz7UQYPZbfSDD6
         14WofHKzpeI/fxJiFe5H3Nt+swokC4m2iHu3YWQUc97pAlnIWc2yF2n8yL1KxzZc0pk4
         nfZ+ia8EZA3Px5ngnpr2IluMKPi2Svygl691R3OvLWt2fWJs6UV/5/nTES84suRB84uj
         SFzA==
X-Gm-Message-State: AOAM531irwxaBFdL81cbz1z9QCd31ysmJTSKetVhZ/blqJwdnoP9kOB/
        pAwrDedwcpiAC5Lc8iI/0B1VHx+rWoqns9CuX0OAnN0dRJA=
X-Google-Smtp-Source: ABdhPJwAe5vVmO6vKwNIvkOdI5Rlek4y2s3XyxCFNDw0GCTi9mdwLw0HpOOabuKkXdvVQpzi81tYQoZqMo3W99mrbmw=
X-Received: by 2002:a17:906:6a8b:: with SMTP id p11mr2948429ejr.470.1604069913474;
 Fri, 30 Oct 2020 07:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201028141504.1729093-1-geert+renesas@glider.be>
In-Reply-To: <20201028141504.1729093-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 30 Oct 2020 15:58:22 +0100
Message-ID: <CAMpxmJWXUHCOMdZOjqXADx3jM2p0pQUdm2j=qO96ZgJr46JxuA@mail.gmail.com>
Subject: Re: [PATCH 0/4] gpio: rcar: Cleanups and improvements
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 3:15 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi Linus, Bartosz,
>
> This patch series contains a few cleanups and improvements for the R-Car
> GPIO driver.  All four patches are independent.
>
> The gpio_chip.get_multiple() implementation has been tested on R-Car
> Gen2 and Gen3.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (4):
>   gpio: rcar: Cache gpiochip_get_data() return value
>   gpio: rcar: Align register offsets
>   gpio: rcar: Rework hardware features handling
>   gpio: rcar: Implement gpio_chip.get_multiple()
>
>  drivers/gpio/gpio-rcar.c | 87 ++++++++++++++++++++++++++--------------
>  1 file changed, 58 insertions(+), 29 deletions(-)
>

Applied the entire series, thanks!

Bartosz
