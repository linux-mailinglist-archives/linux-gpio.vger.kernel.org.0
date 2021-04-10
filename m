Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B376635A966
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Apr 2021 02:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235254AbhDJAJH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 20:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235248AbhDJAJG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 20:09:06 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D14B3C061763
        for <linux-gpio@vger.kernel.org>; Fri,  9 Apr 2021 17:08:52 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id l14so5508425ljb.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 Apr 2021 17:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ca+cCLqwiSnggzRSOZBhrhJV19U5tZ8nzn1LCCEhXdg=;
        b=Kvqj5R9fHJthTXbOIqCSzl9xTNI1UFi1KuTayaDFWynrwqGulsO7RSRfsivnOSW024
         O7yaOvZ/MmF7FdGDCsQ/XRnQKYPRTb/QxUYkCGvd7nLGKUSvdPRJwaBSC+S0up3E3tAe
         xdh1rcfbbcBtbctQvrJ0nRYCVPF9jc8OkxxljiyvhSW15wHWGUlIe4nkFGH7zGdtfzNJ
         B+ZgNqomXtnR1uB4WzOf8JGbWdjLLAMfb78zVqpY1+8KTe7hL/Xpcjk2iAqzOD+gnsYe
         ldHXNsz1fbYzl1q2uj4WXFT9AznMeJ6OJIBLUOmTkzQNtMVZgqm1w+YcOlsRB97WNkpj
         uGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ca+cCLqwiSnggzRSOZBhrhJV19U5tZ8nzn1LCCEhXdg=;
        b=dfachfr76mIP9zpUhJuka2EQy9WwDLzjJruRdm47BYtyfBEnFpPlTkFu8rsdTkGVB4
         u+PzgfrN8MZwsI4ZWSG+/uVQ293AYN5Pfwh2ihCo6oU8pxD+CjIgPnCIxUPtze8MT0tQ
         P4O5NOauKnsp3iO+AgoilO36pi8O6xKLES4wz2udbFF4K87zO0Ep0SX9LIfSrf3Q7z3/
         KUatX1PGGayOGjVCR3HrlAZxHJSouVB4l6veDIyMHq+Sb3lyJCBI5mGenM+EW+KH9i9i
         IScHu756x+zD6l6pyJBJxD8Fki3cdg585CxApH+RbIdesh+PmfvUG5S5acP9QN0qBnlW
         jzGQ==
X-Gm-Message-State: AOAM532r9rzTv7UIT3xvW0o+zlo04T1oEi9nk8HPfLMYSQV4SfsGieap
        2tffq7+IR7xkb1z2WroCL+X4o+03SRaYX2GJzmBl3w==
X-Google-Smtp-Source: ABdhPJwgEA8uuuFLojP3IacZGOQvb/Ilb4wCOhMEZeCC/aUn/DKWEDk564xR3LJGxil3eP8lFZVKw8sDPwcqRp4LW34=
X-Received: by 2002:a2e:700a:: with SMTP id l10mr10716412ljc.368.1618013330856;
 Fri, 09 Apr 2021 17:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210409082522.625168-1-tudor.ambarus@microchip.com>
In-Reply-To: <20210409082522.625168-1-tudor.ambarus@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 10 Apr 2021 02:08:39 +0200
Message-ID: <CACRpkdbRfnZT9OU3FccZ7vny+Ami=k+dkDr4Lo7w_JOgzotX9A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91-pio4: Fix slew rate disablement
To:     Tudor Ambarus <tudor.ambarus@microchip.com>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 9, 2021 at 10:25 AM Tudor Ambarus
<tudor.ambarus@microchip.com> wrote:

> The slew rate was enabled by default for each configuration of the
> pin. In case the pin had more than one configuration, even if
> we set the slew rate as disabled in the device tree, the next pin
> configuration would set again the slew rate enabled by default,
> overwriting the slew rate disablement.
> Instead of enabling the slew rate by default for each pin configuration,
> enable the slew rate by default just once per pin, regardless of the
> number of configurations. This way the slew rate disablement will also
> work for cases where pins have multiple configurations.
>
> Fixes: 440b144978ba ("pinctrl: at91-pio4: add support for slew-rate")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Patch applied!

Yours,
Linus Walleij
