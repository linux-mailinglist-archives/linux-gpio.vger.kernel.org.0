Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 490563DDFF6
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 21:24:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbhHBTYo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 15:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbhHBTYo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 15:24:44 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB74C06175F
        for <linux-gpio@vger.kernel.org>; Mon,  2 Aug 2021 12:24:34 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id b138so3931184vsd.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Aug 2021 12:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6NL8fhjdk0TL/HeebMzN8mENLvM91hqvv1V2BLU+G5g=;
        b=rYpY6n0sMpipTddYKxEKmMdc3FRIO9h9EWI05gy951mRPL+1oPYPlmyOuup8pQ2lrE
         XWaW+inYuL4+rTp40y27pntjYJ+Cd0nUZz/iBI7xtK3lmzWcn6Z5+tA+wvnVIJkhrMzZ
         BGgOcZF5gN4z0HNdCjWWX8bp+gEyHzxLn824FbKiGW7PMhRdcP0UumcLOgEHET0I3lIn
         hwG9ejn5nVdPNRS3896WVqUtYrdV7VMvvd9Ph5U0y5qqDnVE00w73YuQMjF0BttTr13e
         y16vfZJhjF5Qd8gM8QImaxRWkCqSNZX7GtR5qy/y1Q5r22zNBvfUEZiTnD04k9DbWXfL
         n73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6NL8fhjdk0TL/HeebMzN8mENLvM91hqvv1V2BLU+G5g=;
        b=q3paE/RRo5Se8OUlLOUuBf3ZlrecyiI6Zt9xHfUqWTxYejbs2oKoESL2l4nlql/KOV
         OWQh88Cflq8l9bHOYj5C26/0Jk0NrLDZ/iGoe2kTT1r8COJLvbwWMPc/vkDMaNWOAq14
         rmmu0zRz2ARVGwoVqwaQzVqgABq+FDe4/qFEDlnDqz895yQALJQds1OO0rZZmVNMYwvJ
         qSJATUYdzd3cpqleyYkftwearjHII8H39PoOSgOU3iofllGuqnSIHryod8NFQ9JFPlTX
         7avJOIwndTqD9JI0dvmk1+BlzmoVECfq2a8ZJfXzthF0bZlx2s3SGUrK6WmK4pkWtLag
         ztaw==
X-Gm-Message-State: AOAM530/PIN86Ua6szWQ3bQHf7MPSshTlpJlVJuTO77sU85sfsmixex0
        v4KPbFu/4HoUCCAoVqsZK6n7A4S1IDPFwN4CQrC6+A==
X-Google-Smtp-Source: ABdhPJwj5ivH+XA+udnXW1ju84n1CSmVGUcizuCYfmS2cyxqEpHpDhiYSn4JXLoeQmn6ikJYAaDQkK1+OTlUcKDehdY=
X-Received: by 2002:a05:6102:21b:: with SMTP id z27mr11724359vsp.27.1627932273429;
 Mon, 02 Aug 2021 12:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-3-semen.protsenko@linaro.org> <a2b6b868-e984-440c-75b1-599680537cc9@canonical.com>
In-Reply-To: <a2b6b868-e984-440c-75b1-599680537cc9@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 2 Aug 2021 22:24:22 +0300
Message-ID: <CAPLW+4=ewQf8_hMKFFqPRaoqQxhRZZ1=NGboLstvVBOYcTc3aw@mail.gmail.com>
Subject: Re: [PATCH 02/12] pinctrl: samsung: Add Exynos850 SoC specific data
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
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

On Fri, 30 Jul 2021 at 18:22, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 30/07/2021 16:49, Sam Protsenko wrote:
> > Add Samsung Exynos850 SoC specific data to enable pinctrl support for
> > all platforms based on Exynos850.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 129 ++++++++++++++++++
> >  drivers/pinctrl/samsung/pinctrl-exynos.h      |  29 ++++
> >  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
> >  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
> >  4 files changed, 161 insertions(+)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > index b6e56422a700..9c71ff84ba7e 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > @@ -40,6 +40,24 @@ static const struct samsung_pin_bank_type exynos5433_bank_type_alive = {
> >       .reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
> >  };
> >
> > +/*
> > + * Bank type for non-alive type. Bit fields:
> > + * CON: 4, DAT: 1, PUD: 4, DRV: 4, CONPDN: 2, PUDPDN: 4
> > + */
> > +static struct samsung_pin_bank_type exynos850_bank_type_off  = {
> > +     .fld_width = { 4, 1, 4, 4, 2, 4, },
> > +     .reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
> > +};
> > +
> > +/*
> > + * Bank type for alive type. Bit fields:
> > + * CON: 4, DAT: 1, PUD: 4, DRV: 4
> > + */
> > +static struct samsung_pin_bank_type exynos850_bank_type_alive = {
> > +     .fld_width = { 4, 1, 4, 4, },
> > +     .reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
> > +};
> > +
> >  /* Pad retention control code for accessing PMU regmap */
> >  static atomic_t exynos_shared_retention_refcnt;
> >
> > @@ -422,3 +440,114 @@ const struct samsung_pinctrl_of_match_data exynos7_of_data __initconst = {
> >       .ctrl           = exynos7_pin_ctrl,
> >       .num_ctrl       = ARRAY_SIZE(exynos7_pin_ctrl),
> >  };
> > +
> > +/* pin banks of exynos850 pin-controller 0 (ALIVE) */
> > +static struct samsung_pin_bank_data exynos850_pin_banks0[] = {
> > +     /* Must start with EINTG banks, ordered by EINT group number. */
> > +     EXYNOS9_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
>
> Why EXYNOS9 not EXYNOS850? Is it really shared with 96xx, 98xx and 9x0
> series?
>

Yeah, I double checked and those macros are actually used for 96xx
SoCs. So I suggest we leave it as is, as it seems to be related to the
whole architecture series, not only to Exynos850.

> > +     EXYNOS9_PIN_BANK_EINTW(8, 0x020, "gpa1", 0x04),
> > +     EXYNOS9_PIN_BANK_EINTW(8, 0x040, "gpa2", 0x08),
> > +     EXYNOS9_PIN_BANK_EINTW(8, 0x060, "gpa3", 0x0c),
> > +     EXYNOS9_PIN_BANK_EINTW(4, 0x080, "gpa4", 0x10),
> > +     EXYNOS9_PIN_BANK_EINTN(3, 0x0A0, "gpq0"),
> > +};
> > +
> > +/* pin banks of exynos850 pin-controller 1 (CMGP) */
> > +static struct samsung_pin_bank_data exynos850_pin_banks1[] = {
> > +     /* Must start with EINTG banks, ordered by EINT group number. */
> > +     EXYNOS9_PIN_BANK_EINTW(1, 0x000, "gpm0", 0x00),
> > +     EXYNOS9_PIN_BANK_EINTW(1, 0x020, "gpm1", 0x04),
> > +     EXYNOS9_PIN_BANK_EINTW(1, 0x040, "gpm2", 0x08),
> > +     EXYNOS9_PIN_BANK_EINTW(1, 0x060, "gpm3", 0x0C),
> > +     EXYNOS9_PIN_BANK_EINTW(1, 0x080, "gpm4", 0x10),
> > +     EXYNOS9_PIN_BANK_EINTW(1, 0x0A0, "gpm5", 0x14),
> > +     EXYNOS9_PIN_BANK_EINTW(1, 0x0C0, "gpm6", 0x18),
> > +     EXYNOS9_PIN_BANK_EINTW(1, 0x0E0, "gpm7", 0x1C),
> > +};
> > +
> > +/* pin banks of exynos850 pin-controller 2 (AUD) */
> > +static struct samsung_pin_bank_data exynos850_pin_banks2[] = {
> > +     /* Must start with EINTG banks, ordered by EINT group number. */
> > +     EXYNOS9_PIN_BANK_EINTG(5, 0x000, "gpb0", 0x00),
> > +     EXYNOS9_PIN_BANK_EINTG(5, 0x020, "gpb1", 0x04),
> > +};
> > +
> > +/* pin banks of exynos850 pin-controller 3 (HSI) */
> > +static struct samsung_pin_bank_data exynos850_pin_banks3[] = {
> > +     /* Must start with EINTG banks, ordered by EINT group number. */
> > +     EXYNOS9_PIN_BANK_EINTG(6, 0x000, "gpf2", 0x00),
> > +};
> > +
> > +/* pin banks of exynos850 pin-controller 4 (CORE) */
> > +static struct samsung_pin_bank_data exynos850_pin_banks4[] = {
> > +     /* Must start with EINTG banks, ordered by EINT group number. */
> > +     EXYNOS9_PIN_BANK_EINTG(4, 0x000, "gpf0", 0x00),
> > +     EXYNOS9_PIN_BANK_EINTG(8, 0x020, "gpf1", 0x04),
> > +};
> > +
> > +/* pin banks of exynos850 pin-controller 5 (PERI) */
> > +static struct samsung_pin_bank_data exynos850_pin_banks5[] = {
> > +     /* Must start with EINTG banks, ordered by EINT group number. */
> > +     EXYNOS9_PIN_BANK_EINTG(2, 0x000, "gpg0", 0x00),
> > +     EXYNOS9_PIN_BANK_EINTG(6, 0x020, "gpp0", 0x04),
> > +     EXYNOS9_PIN_BANK_EINTG(4, 0x040, "gpp1", 0x08),
> > +     EXYNOS9_PIN_BANK_EINTG(4, 0x060, "gpp2", 0x0C),
> > +     EXYNOS9_PIN_BANK_EINTG(8, 0x080, "gpg1", 0x10),
> > +     EXYNOS9_PIN_BANK_EINTG(8, 0x0A0, "gpg2", 0x14),
> > +     EXYNOS9_PIN_BANK_EINTG(1, 0x0C0, "gpg3", 0x18),
> > +     EXYNOS9_PIN_BANK_EINTG(3, 0x0E0, "gpc0", 0x1C),
> > +     EXYNOS9_PIN_BANK_EINTG(6, 0x100, "gpc1", 0x20),
> > +};
> > +
> > +static const struct samsung_pin_ctrl exynos850_pin_ctrl[] __initconst = {
> > +     {
> > +             /* pin-controller instance 0 ALIVE data */
> > +             .pin_banks      = exynos850_pin_banks0,
> > +             .nr_banks       = ARRAY_SIZE(exynos850_pin_banks0),
> > +             .eint_gpio_init = exynos_eint_gpio_init,
> > +             .eint_wkup_init = exynos_eint_wkup_init,
> > +             .suspend        = exynos_pinctrl_suspend,
> > +             .resume         = exynos_pinctrl_resume,
>
> I guess retention registers will follow sometime later.
>

Good point, never noticed retention control is needed for
suspend/resume to work properly. I will remove suspend/resume ops in
v2, and PM support will be sent later.

> Best regards,
> Krzysztof
