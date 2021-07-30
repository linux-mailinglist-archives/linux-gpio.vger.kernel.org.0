Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD6DA3DBB97
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 17:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239352AbhG3PGd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 11:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239545AbhG3PG0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 11:06:26 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80488C061796;
        Fri, 30 Jul 2021 08:06:17 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id l19so15675389pjz.0;
        Fri, 30 Jul 2021 08:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j4ZgEJOfXo95728K0jGJfzXIz0FRfV/cneRN75qZrqQ=;
        b=RYSukXXaDiTWFtkfzjGMnrY5AtjXo3ekM4msyBFRkvSH/TySNfOTHwCE/PhG9kdVJL
         R1wnWFYftLZDkXbwiM9HrP5xrkcrqWL2C1H6mgL/4aCrF2sUWSCzUZ/SDFiw2Tm9koZV
         tfbSSKWC8UHnq+p1aI60ONQmsygE/3kEFW8mV0pR6cNDGD9Crd7MUHw3KBIsLqjP/Izj
         O86E1rGgmzXY/Esy3lPlCxYpHIdLPLrjS/8MXVyxqYsCRXbngYphM5XZiROupBcI5XQI
         AivpQIYjHNVIA1REcQcEWf9My5E3hq9jzRtltxQqI8tWNG7hmvhwKWsS0zE25TPLseU0
         um4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j4ZgEJOfXo95728K0jGJfzXIz0FRfV/cneRN75qZrqQ=;
        b=WDQ8jC5Db40b5zUunWCvLSI8RSbkGKA+bQv90L3jHdWFvimkBzkBjL2RuFgurhJN1s
         p1kLnT+gfFPPrsIckCxMtb7Rzs2hxI2qc4K8QJmbx3snWOHR7keAGSIUgbhja3fFBRMj
         Lm5XCwvFRNsRmkEZ8hTyjJtNX1zMwriHeA6JZCEO9bUrRgBYe9wNE2vJLyJUqHOHZDT1
         agtIf2jWn1kDh0QAbQJllIR7H6hzKakapkYdgK/dQ63Dylfy9IInvPdNIY5BH/FBFmAk
         jI/YZcxEhmzeI9Sn3Y4EHTnoqluLXFNSoK08L36r+lkYEDzkbuSX4xYHDWyKOOP7pPr4
         kFXQ==
X-Gm-Message-State: AOAM533JM9jwWRqq2dWGjZu4LKjzCNw0X7poehcV/z1nsy2MotUkxqGN
        eSDFAOvG5grXYmSissAHx2pW/VhsypzjwavA9wU=
X-Google-Smtp-Source: ABdhPJy/BIrSVXKqer4o5xhukF4lXZQz2FWdUUGvQfpUZDWhqRqB5m1fbC/n8w5fR4df3nx8XFgBh7lC/jIZxo28Khs=
X-Received: by 2002:a17:902:ac90:b029:12c:e7a:c183 with SMTP id
 h16-20020a170902ac90b029012c0e7ac183mr2963181plr.21.1627657576975; Fri, 30
 Jul 2021 08:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210730144922.29111-1-semen.protsenko@linaro.org> <20210730144922.29111-7-semen.protsenko@linaro.org>
In-Reply-To: <20210730144922.29111-7-semen.protsenko@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Jul 2021 18:05:37 +0300
Message-ID: <CAHp75Vfj8UZdNeU0Ghg9qac6Ks3S1SLZOfZOKTWKp2y2vrcA6A@mail.gmail.com>
Subject: Re: [PATCH 06/12] tty: serial: samsung: Add Exynos850 SoC data
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 30, 2021 at 5:50 PM Sam Protsenko
<semen.protsenko@linaro.org> wrote:
>
> Add serial driver data for Exynos850 SoC. This driver data is basically
> reusing EXYNOS_COMMON_SERIAL_DRV_DATA, which is common for all Exynos
> chips, but also enables USI init, which was added in previous commit:
> "tty: serial: samsung: Init USI to keep clocks running".

...

> +static struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
> +       EXYNOS_COMMON_SERIAL_DRV_DATA_USI(1),

> +       .fifosize = { 0, },

0 is the default for static globally defined variables.

> +};

-- 
With Best Regards,
Andy Shevchenko
