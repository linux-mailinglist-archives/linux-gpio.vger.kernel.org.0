Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502593E4BFF
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Aug 2021 20:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234964AbhHISTE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Aug 2021 14:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235007AbhHISTC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Aug 2021 14:19:02 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F996C06179E
        for <linux-gpio@vger.kernel.org>; Mon,  9 Aug 2021 11:18:42 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id q3so4149915vkd.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Aug 2021 11:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kjXVJjhEvR65+Z4ewOj5xb9PKKSWhFxsxBVNcUv+8M0=;
        b=smQyp8aCntQWqx50j3QCg9imrJunJPc/fUtV2QCjb25K8h6DM663/X997pvKkuAIt4
         F+2wnhwGDszBtm7bu15NgY3VaroX3gOC7zzDBi0UyBW/CRfDBSV1ACdVK8XWfsSkYWgD
         zHneNu3AlOQI6wfINpBJEUnLqZ/91LPuyPb8HuZ6RezQ6Cl4C4dtjUse7Tyd3vpyF/kP
         Qc1oLo6nCaL9DVFljinZIWdSkFphDzO+1nGuSM5SZ5UCSmgTxu8r7g0++1wE85YerrJs
         AswwaUIO76/xPKTCYoPR64GznLV8OHhT85TzOaTrx1osrE0Bd1sgkKEvSA/LkF9sVQys
         Nb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kjXVJjhEvR65+Z4ewOj5xb9PKKSWhFxsxBVNcUv+8M0=;
        b=SHri03a6yZ/DFX1A8V+BvZCNLiVi9VzNAM1vth0t1ptAfIceg8VdbDARpr6yVDdi6M
         8tXiyWk56k/zsVITcpxrHwaAFRk9w6rUEpJJZbPiiOpKFU5mIKgpUKgDvPUf27Fe8jCP
         9/PPw0UyLi1FcSSDFa/2n5ChzFpNSHFXz6MGcTnAuq0Yo+Dakd2++EV536rfRvVn7CdA
         9aQ/rBpWbPTVPLNPe0zEqDvnnVS0ZujH8BgHDV9trx7quN4mIPRIFGorZ5MtO1DVTUIn
         M0Re8VnKH+ydhpoviQw+0YtkkZXNO3mIMn9lU1UYD3rqGfNQkuL7AFV6yUi41EGHafnS
         dASA==
X-Gm-Message-State: AOAM533X08KiIHxCCmbowUKYd8IFZeiMl/zjNYD/MD9MZEpe7E4xxl9H
        MMIkATCTM5WIZGfDm2oCadIQ8YKXK3LhV0VzZWudtA==
X-Google-Smtp-Source: ABdhPJxZIMAieQwRraZ3xFtXse7kceCifmxgmHFDrtnoOgP6oXdmx/b2tdhN9tRkyzJ9KjHmPAmG6AO4++pOLiw8bbQ=
X-Received: by 2002:a1f:1dc2:: with SMTP id d185mr15370667vkd.21.1628533120787;
 Mon, 09 Aug 2021 11:18:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210806152146.16107-1-semen.protsenko@linaro.org>
 <20210806152146.16107-3-semen.protsenko@linaro.org> <407ee65f-6004-5173-9fcc-99023c85db4e@canonical.com>
In-Reply-To: <407ee65f-6004-5173-9fcc-99023c85db4e@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 9 Aug 2021 21:18:29 +0300
Message-ID: <CAPLW+4mfTMWWssW8+nTt8Yp3dN5=WJpji=o_rRYYr6+kx_dctA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] pinctrl: samsung: Add Exynos850 SoC specific data
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
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

On Mon, 9 Aug 2021 at 13:43, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 06/08/2021 17:21, Sam Protsenko wrote:
> > Add Samsung Exynos850 SoC specific data to enable pinctrl support for
> > all platforms based on Exynos850.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> > Changes in v2:
> >   - Removed .suspend/.resume callbacks, as retention registers are not
> >     implemented yet for Exynos850
> >   - Removed .eint_gpio_init for AUD domain, as there are no external
> >     interrupts available for that domain
> >
> >  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 116 ++++++++++++++++++
> >  drivers/pinctrl/samsung/pinctrl-exynos.h      |  29 +++++
> >  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
> >  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
> >  4 files changed, 148 insertions(+)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > index b6e56422a700..3157bdf0233c 100644
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
>
> I missed that part last time - this and one before should be const.
>
> > +     .fld_width = { 4, 1, 4, 4, },
> > +     .reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
> > +};
> > +
> >  /* Pad retention control code for accessing PMU regmap */
> >  static atomic_t exynos_shared_retention_refcnt;
> >
> > @@ -422,3 +440,101 @@ const struct samsung_pinctrl_of_match_data exynos7_of_data __initconst = {
> >       .ctrl           = exynos7_pin_ctrl,
> >       .num_ctrl       = ARRAY_SIZE(exynos7_pin_ctrl),
> >  };
> > +
> > +/* pin banks of exynos850 pin-controller 0 (ALIVE) */
> > +static struct samsung_pin_bank_data exynos850_pin_banks0[] = {
>
> All these as well - initconst - unless they are somehow different than
> rest of such structures?
>
> > +     /* Must start with EINTG banks, ordered by EINT group number. */
> > +     EXYNOS9_PIN_BANK_EINTW(8, 0x000, "gpa0", 0x00),
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
> > +     }, {
> > +             /* pin-controller instance 1 CMGP data */
> > +             .pin_banks      = exynos850_pin_banks1,
> > +             .nr_banks       = ARRAY_SIZE(exynos850_pin_banks1),
> > +             .eint_gpio_init = exynos_eint_gpio_init,
> > +             .eint_wkup_init = exynos_eint_wkup_init,
> > +     }, {
> > +             /* pin-controller instance 2 AUD data */
> > +             .pin_banks      = exynos850_pin_banks2,
> > +             .nr_banks       = ARRAY_SIZE(exynos850_pin_banks2),
> > +     }, {
> > +             /* pin-controller instance 3 HSI data */
> > +             .pin_banks      = exynos850_pin_banks3,
> > +             .nr_banks       = ARRAY_SIZE(exynos850_pin_banks3),
> > +             .eint_gpio_init = exynos_eint_gpio_init,
> > +     }, {
> > +             /* pin-controller instance 4 CORE data */
> > +             .pin_banks      = exynos850_pin_banks4,
> > +             .nr_banks       = ARRAY_SIZE(exynos850_pin_banks4),
> > +             .eint_gpio_init = exynos_eint_gpio_init,
> > +     }, {
> > +             /* pin-controller instance 5 PERI data */
> > +             .pin_banks      = exynos850_pin_banks5,
> > +             .nr_banks       = ARRAY_SIZE(exynos850_pin_banks5),
> > +             .eint_gpio_init = exynos_eint_gpio_init,
> > +     },
> > +};
> > +
> > +const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
> > +     .ctrl           = exynos850_pin_ctrl,
> > +     .num_ctrl       = ARRAY_SIZE(exynos850_pin_ctrl),
> > +};
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
> > index da1ec13697e7..595086f2d5dd 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> > @@ -108,6 +108,35 @@
> >               .pctl_res_idx   = pctl_idx,                     \
> >       }                                                       \
> >
> > +#define EXYNOS9_PIN_BANK_EINTN(pins, reg, id)                        \
> > +     {                                                       \
> > +             .type           = &exynos850_bank_type_alive,   \
>
> Having the prefix EXYNOS9 is actually confusing because:
> 1. There is no Exynos9 support,
> 2. The type is exynos850.
>
> Let's keep it consistent, so 850 everywhere,
>

Sure. Will send v3 shortly with fixes for everything you mentioned.

> > +             .pctl_offset    = reg,                          \
> > +             .nr_pins        = pins,                         \
> > +             .eint_type      = EINT_TYPE_NONE,               \
> > +             .name           = id                            \
> > +     }
> > +
> > +#define EXYNOS9_PIN_BANK_EINTG(pins, reg, id, offs)          \
> > +     {                                                       \
> > +             .type           = &exynos850_bank_type_off,     \
> > +             .pctl_offset    = reg,                          \
> > +             .nr_pins        = pins,                         \
> > +             .eint_type      = EINT_TYPE_GPIO,               \
> > +             .eint_offset    = offs,                         \
> > +             .name           = id                            \
> > +     }
> > +
> > +#define EXYNOS9_PIN_BANK_EINTW(pins, reg, id, offs)          \
> > +     {                                                       \
> > +             .type           = &exynos850_bank_type_alive,   \
> > +             .pctl_offset    = reg,                          \
> > +             .nr_pins        = pins,                         \
> > +             .eint_type      = EINT_TYPE_WKUP,               \
> > +             .eint_offset    = offs,                         \
> > +             .name           = id                            \
> > +     }
> > +
>
> Best regards,
> Krzysztof
