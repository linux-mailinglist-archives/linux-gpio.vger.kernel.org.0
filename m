Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9F97BD49E
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 09:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345431AbjJIHth (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 03:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345400AbjJIHth (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 03:49:37 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A603DC6
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 00:49:34 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5a507c72d3eso51528707b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 00:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696837772; x=1697442572; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ECzS77s1SAJrFllyg/NKDV8zAahh3oTBpfgJzrxziU4=;
        b=oNnwWpWCTKqH6Ot/nR9YdwP2yTFyJZMR/wexjTqYXRIDL5nk7TjcMR+g9j0GJl1CfK
         QGGhwY4Jy51cVYZyjb5egHCrQJiojQjvreCqRVGOMkNYEY6xLObsd9MLz+F0ZgnbzhHA
         n6y6bfwvOeLETZS+BW3jEV6TFmH5DuhYMcBw1VvjI7oy47zqHm2dIZ/Q7u5j95sWwDEx
         J4SXGKSN1j5J0BvPWpbpNK13nRjNuwDlocNrxXd0GM2HtnZQ7YIlul4ZzmQOpoRakKyS
         oaDyPHRi0g1p1reMoJP/92zliuCzaMrReSwqhzSKSzkwKSJxXR60x4p1j1RTQ1KqUKmi
         Dqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696837772; x=1697442572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECzS77s1SAJrFllyg/NKDV8zAahh3oTBpfgJzrxziU4=;
        b=emDqeKY66qhBFWk1IhVuN/oKmLcp5KjpiUkFwX0Okx1OZxpiGg44wzOf0OZHyhqEcj
         xbcxqT0e7WVvz6dnJ82OYH0vmDlDQXnswotmTa2GWW82tOKO+7IBj7IjIcuxjRvgKlYx
         u2/s+f8PUAR+dVOY0ROhMYvEk3RREULS26Riga77dkqm594RbLctajdBsPgGfCootSme
         wH7iyxz7vQ4vtKqEqyWG632jsGyRAyZaaY3sNbUjZpZWiFSjBkrPUlaNk9fECN0DfBrM
         3hNjzOYhnSHfjk4poJTxBi9e5vG7U5T64EzNHPbF6e9JsL2lUcyY0UVNMpZKV985KI0K
         2uaw==
X-Gm-Message-State: AOJu0Yx8Cu63Z2qNeHaSJg6nUpvhCF6ncp7Kz3xmLOhzc5aLRuQNJ6xG
        5Qa+EpGERQP1as4duSS7qN2UOkVFhdbyo54ZpQftnQ==
X-Google-Smtp-Source: AGHT+IFTFY7apdD7HhaJ9q1jaegxT7SRUCXgKOpuAvV57+Du+2VGoL9J9rFfIJPWu6i9y6apzt9UJ/sUUyurCI3ychA=
X-Received: by 2002:a81:6cc9:0:b0:59f:7f46:39d9 with SMTP id
 h192-20020a816cc9000000b0059f7f4639d9mr14606896ywc.6.1696837772626; Mon, 09
 Oct 2023 00:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-17-peter.griffin@linaro.org> <0e09665b-9595-49f7-ba21-0cf360c650cb@linaro.org>
In-Reply-To: <0e09665b-9595-49f7-ba21-0cf360c650cb@linaro.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Mon, 9 Oct 2023 08:49:22 +0100
Message-ID: <CADrjBPq0YrQoCU4MKq8+w6Jo0HLzGX2Hu15w0v_iSA5rew5gmg@mail.gmail.com>
Subject: Re: [PATCH 16/21] pinctrl: samsung: Add gs101 SoC pinctrl configuration
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Krzysztof,

Firstly, thankyou for all your reviews. It's much appreciated.

On Fri, 6 Oct 2023 at 07:33, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/10/2023 17:56, Peter Griffin wrote:
> > Add support for the pin-controller found on the gs101
> > SoC used in Pixel 6 phones.
> >
> > The alive blocks on this SoC also have a filter selection
> > register. Add support for this so the digital or delay filter
> > can be selected. If the filter selection is not available
> > then the default filter (digital) is applied.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 163 ++++++++++++++++++
> >  drivers/pinctrl/samsung/pinctrl-exynos.c      |  68 +++++++-
> >  drivers/pinctrl/samsung/pinctrl-exynos.h      |  44 +++++
> >  drivers/pinctrl/samsung/pinctrl-samsung.c     |   4 +
> >  drivers/pinctrl/samsung/pinctrl-samsung.h     |  24 +++
> >  5 files changed, 302 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > index cb965cf93705..ae681725db26 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > @@ -796,3 +796,166 @@ const struct samsung_pinctrl_of_match_data fsd_of_data __initconst = {
> >       .ctrl           = fsd_pin_ctrl,
> >       .num_ctrl       = ARRAY_SIZE(fsd_pin_ctrl),
> >  };
> > +
> > +/*
> > + * bank type for non-alive type
> > + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit field: 4)
> > + * (CONPDN bit field: 2, PUDPDN bit field: 4)
> > + */
> > +static struct samsung_pin_bank_type bank_type_6  = {
>
> Bank types are defined at the top. "type_6" is way too vague. Look how
> the others are named.

Will fix

>
> > +     .fld_width = { 4, 1, 4, 4, 2, 4, },
> > +     .reg_offset = { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
> > +};
> > +
> > +/*
> > + * bank type for alive type
> > + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit field: 4)
> > + */
> > +static const struct samsung_pin_bank_type bank_type_7 = {
>
> Same problem.

Will fix
>
> > +     .fld_width = { 4, 1, 4, 4, },
> > +     .reg_offset = { 0x00, 0x04, 0x08, 0x0c, },
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (ALIVE) */
> > +static const struct samsung_pin_bank_data gs101_pin_alive[] = {
> > +     EXYNOS9_PIN_BANK_EINTW(bank_type_7, 8, 0x0, "gpa0", 0x00, 0x00, FLT_SELECTABLE),
> > +     EXYNOS9_PIN_BANK_EINTW(bank_type_7, 7, 0x20, "gpa1", 0x04, 0x08, FLT_SELECTABLE),
> > +     EXYNOS9_PIN_BANK_EINTW(bank_type_7, 5, 0x40, "gpa2", 0x08, 0x10, FLT_SELECTABLE),
> > +     EXYNOS9_PIN_BANK_EINTW(bank_type_7, 4, 0x60, "gpa3", 0x0c, 0x18, FLT_SELECTABLE),
> > +     EXYNOS9_PIN_BANK_EINTW(bank_type_7, 4, 0x80, "gpa4", 0x10, 0x1c, FLT_SELECTABLE),
> > +     EXYNOS9_PIN_BANK_EINTW(bank_type_7, 7, 0xa0, "gpa5", 0x14, 0x20, FLT_SELECTABLE),
> > +     EXYNOS9_PIN_BANK_EINTW(bank_type_7, 8, 0xc0, "gpa9", 0x18, 0x28, FLT_SELECTABLE),
> > +     EXYNOS9_PIN_BANK_EINTW(bank_type_7, 2, 0xe0, "gpa10", 0x1c, 0x30, FLT_SELECTABLE),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (FAR_ALIVE) */
> > +static const struct samsung_pin_bank_data gs101_pin_far_alive[] = {
> > +     EXYNOS9_PIN_BANK_EINTW(bank_type_7, 8, 0x0, "gpa6", 0x00, 0x00, FLT_SELECTABLE),
> > +     EXYNOS9_PIN_BANK_EINTW(bank_type_7, 4, 0x20, "gpa7", 0x04, 0x08, FLT_SELECTABLE),
> > +     EXYNOS9_PIN_BANK_EINTW(bank_type_7, 8, 0x40, "gpa8", 0x08, 0x0c, FLT_SELECTABLE),
> > +     EXYNOS9_PIN_BANK_EINTW(bank_type_7, 2, 0x60, "gpa11", 0x0c, 0x14, FLT_SELECTABLE),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (GSACORE) */
> > +static const struct samsung_pin_bank_data gs101_pin_gsacore[] = {
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x0, "gps0", 0x00, 0x00, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 8, 0x20, "gps1", 0x04, 0x04, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 3, 0x40, "gps2", 0x08, 0x0c, FLT_DEFAULT),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (GSACTRL) */
> > +static const struct samsung_pin_bank_data gs101_pin_gsactrl[] = {
> > +     EXYNOS9_PIN_BANK_EINTW(bank_type_7, 6, 0x0, "gps3", 0x00, 0x00, FLT_DEFAULT),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (PERIC0) */
> > +static const struct samsung_pin_bank_data gs101_pin_peric0[] = {
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 5, 0x0, "gpp0", 0x00, 0x00, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x20, "gpp1", 0x04, 0x08, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x40, "gpp2", 0x08, 0x0c, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x60, "gpp3", 0x0c, 0x10, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x80, "gpp4", 0x10, 0x14, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0xa0, "gpp5", 0x14, 0x18, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0xc0, "gpp6", 0x18, 0x1c, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0xe0, "gpp7", 0x1c, 0x20, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x100, "gpp8", 0x20, 0x24, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x120, "gpp9", 0x24, 0x28, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x140, "gpp10", 0x28, 0x2c, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x160, "gpp11", 0x2c, 0x30, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x180, "gpp12", 0x30, 0x34, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x1a0, "gpp13", 0x34, 0x38, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x1c0, "gpp14", 0x38, 0x3c, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x1e0, "gpp15", 0x3c, 0x40, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x200, "gpp16", 0x40, 0x44, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x220, "gpp17", 0x44, 0x48, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x240, "gpp18", 0x48, 0x4c, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x260, "gpp19", 0x4c, 0x50, FLT_DEFAULT),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (PERIC1) */
> > +static const struct samsung_pin_bank_data gs101_pin_peric1[] = {
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 8, 0x0, "gpp20", 0x00, 0x00, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x20, "gpp21", 0x04, 0x08, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x40, "gpp22", 0x08, 0x0c, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 8, 0x60, "gpp23", 0x0c, 0x10, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0x80, "gpp24", 0x10, 0x18, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0xa0, "gpp25", 0x14, 0x1c, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 5, 0xc0, "gpp26", 0x18, 0x20, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 4, 0xe0, "gpp27", 0x1c, 0x28, FLT_DEFAULT),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (HSI1) */
> > +static const struct samsung_pin_bank_data gs101_pin_hsi1[] = {
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 6, 0x0, "gph0", 0x00, 0x00, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 7, 0x20, "gph1", 0x04, 0x08, FLT_DEFAULT),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (HSI2) */
> > +static const struct samsung_pin_bank_data gs101_pin_hsi2[] = {
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 6, 0x0, "gph2", 0x00, 0x00, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 2, 0x20, "gph3", 0x04, 0x08, FLT_DEFAULT),
> > +     EXYNOS9_PIN_BANK_EINTG(bank_type_6, 6, 0x40, "gph4", 0x08, 0x0c, FLT_DEFAULT),
> > +};
> > +
> > +static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
> > +     {
> > +             /* pin banks of gs101 pin-controller (ALIVE) */
> > +             .pin_banks      = gs101_pin_alive,
> > +             .nr_banks       = ARRAY_SIZE(gs101_pin_alive),
> > +             .eint_gpio_init = exynos_eint_gpio_init,
> > +             .eint_wkup_init = exynos_eint_wkup_init,
> > +             .suspend        = exynos_pinctrl_suspend,
> > +             .resume         = exynos_pinctrl_resume,
> > +     }, {
> > +             /* pin banks of gs101 pin-controller (FAR_ALIVE) */
> > +             .pin_banks      = gs101_pin_far_alive,
> > +             .nr_banks       = ARRAY_SIZE(gs101_pin_far_alive),
> > +             .eint_gpio_init = exynos_eint_gpio_init,
> > +             .eint_wkup_init = exynos_eint_wkup_init,
> > +             .suspend        = exynos_pinctrl_suspend,
> > +             .resume         = exynos_pinctrl_resume,
> > +     }, {
> > +             /* pin banks of gs101 pin-controller (GSACORE) */
> > +             .pin_banks      = gs101_pin_gsacore,
> > +             .nr_banks       = ARRAY_SIZE(gs101_pin_gsacore),
> > +             .eint_gpio_init = exynos_eint_gpio_init,
> > +     }, {
> > +             /* pin banks of gs101 pin-controller (GSACTRL) */
> > +             .pin_banks      = gs101_pin_gsactrl,
> > +             .nr_banks       = ARRAY_SIZE(gs101_pin_gsactrl),
> > +             .eint_gpio_init = exynos_eint_gpio_init,
> > +     }, {
> > +             /* pin banks of gs101 pin-controller (PERIC0) */
> > +             .pin_banks      = gs101_pin_peric0,
> > +             .nr_banks       = ARRAY_SIZE(gs101_pin_peric0),
> > +             .eint_gpio_init = exynos_eint_gpio_init,
> > +             .suspend        = exynos_pinctrl_suspend,
> > +             .resume         = exynos_pinctrl_resume,
> > +     }, {
> > +             /* pin banks of gs101 pin-controller (PERIC1) */
> > +             .pin_banks      = gs101_pin_peric1,
> > +             .nr_banks       = ARRAY_SIZE(gs101_pin_peric1),
> > +             .eint_gpio_init = exynos_eint_gpio_init,
> > +             .suspend        = exynos_pinctrl_suspend,
> > +             .resume = exynos_pinctrl_resume,
> > +     }, {
> > +             /* pin banks of gs101 pin-controller (HSI1) */
> > +             .pin_banks      = gs101_pin_hsi1,
> > +             .nr_banks       = ARRAY_SIZE(gs101_pin_hsi1),
> > +             .eint_gpio_init = exynos_eint_gpio_init,
> > +             .suspend        = exynos_pinctrl_suspend,
> > +             .resume         = exynos_pinctrl_resume,
> > +     }, {
> > +             /* pin banks of gs101 pin-controller (HSI2) */
> > +             .pin_banks      = gs101_pin_hsi2,
> > +             .nr_banks       = ARRAY_SIZE(gs101_pin_hsi2),
> > +             .eint_gpio_init = exynos_eint_gpio_init,
> > +             .suspend        = exynos_pinctrl_suspend,
> > +             .resume         = exynos_pinctrl_resume,
> > +     },
> > +};
> > +
> > +const struct samsung_pinctrl_of_match_data gs101_of_data __initconst = {
> > +     .ctrl           = gs101_pin_ctrl,
> > +     .num_ctrl       = ARRAY_SIZE(gs101_pin_ctrl),
> > +};
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
> > index a8212fc126bf..0c6c3312abb7 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> > @@ -269,6 +269,50 @@ struct exynos_eint_gpio_save {
> >       u32 eint_mask;
> >  };
>
> Please split the patch into two: one of adding new filter code and
> second for new Google SoC.

Will do

>
> >
> > +static void exynos_eint_flt_config(int sel, int width,
> > +                                struct samsung_pinctrl_drv_data *d,
> > +                                struct samsung_pin_bank *bank)
>
> Arguments: first drv_data, then bank, then width, then sel... and what
> is sel actually?

Will fix.

Sel parameter is just setting the FLT_SEL bitfield
0 = Delay filter
1 = Digital filter

>
> Also, why do you need width if it is always 0? Will it be different in
> next pinctrl controllers?

The downstream driver never set the width bitfield so I we could remove
this width logic and add it back if it's ever required.

> So the filter is per entire bank?

The filter is selectable per pin. So each pin has a FLT_EN, FLT_SEL and
FLT_WIDTH bitfield.

>
> > +{
> > +     unsigned int flt_reg, flt_con = 0;
> > +     unsigned int val, shift;
> > +     int i;
> > +     int loop_cnt;
> > +
> > +     flt_con |= EXYNOS_FLTCON_EN;
> > +
> > +     if (sel)
> > +             flt_con |= EXYNOS_FLTCON_SEL_DIGITAL;
> > +
> > +     flt_con |= EXYNOS_FLTCON_WIDTH(width);
>
> This is always 0, what's the point?

Yeah we could remove this, and add it back if it's ever required. Let
me know if that's what you prefer?

>
> > +
> > +     flt_reg = EXYNOS_GPIO_EFLTCON_OFFSET + bank->fltcon_offset;
> > +
> > +     if (bank->nr_pins > EXYNOS_FLTCON_NR_PIN)
> > +             /*
> > +              * if nr_pins > 4, we should set FLTCON0 register fully.
> > +              * (pin0 ~ 3). So loop 4 times in case of FLTCON0.
> > +              */
> > +             loop_cnt = 4;
> > +     else
> > +             loop_cnt = bank->nr_pins;
>
> Please document the layout of the registers in exynos_eint_flt_config()
> comment (not kerneldoc). Also document what do you want to achieve here
> - set entire bank to one filter for the suspend/resume?

Yes exactly it is looping through setting all the pins in the bank to
one filter on
suspend and resume. I will add a comment as you suggest.

>
> > +
> > +     val = readl(d->virt_base + flt_reg);
> > +
> > +     for (i = 0; i < loop_cnt; i++) {
> > +             shift = i * EXYNOS_FLTCON_LEN;
> > +             val &= ~(EXYNOS_FLTCON_MASK << shift);
> > +             val |= (flt_con << shift);
> > +     }
> > +
> > +     writel(val, d->virt_base + flt_reg);
> > +
>
> Missing /*

Will fix

>
> > +     /* if nr_pins > 4, we should also set FLTCON1 register like FLTCON0.
> > +      * (pin4 ~ )
> > +      */
> > +     if (bank->nr_pins > EXYNOS_FLTCON_NR_PIN)
> > +             writel(val, d->virt_base + flt_reg + 0x4);
> > +}
> > +
> >  /*
> >   * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
> >   * @d: driver data of samsung pinctrl driver.
> > @@ -321,6 +365,10 @@ __init int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
> >                       goto err_domains;
> >               }
> >
> > +             /* Set Delay Analog Filter */
> > +             if (bank->fltcon_type != FLT_DEFAULT)
> > +                     exynos_eint_flt_config(EXYNOS_FLTCON_SEL_DELAY,
> > +                                            0, d, bank);
> >       }
> >
> >       return 0;
> > @@ -555,6 +603,11 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
> >               if (bank->eint_type != EINT_TYPE_WKUP)
> >                       continue;
> >
> > +             /* Set Digital Filter */
> > +             if (bank->fltcon_type != FLT_DEFAULT)
> > +                     exynos_eint_flt_config(EXYNOS_FLTCON_SEL_DIGITAL,
> > +                                            0, d, bank);
> > +
> >               bank->irq_chip = devm_kmemdup(dev, irq_chip, sizeof(*irq_chip),
> >                                             GFP_KERNEL);
> >               if (!bank->irq_chip) {
> > @@ -658,6 +711,7 @@ static void exynos_pinctrl_suspend_bank(
> >  void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
> >  {
> >       struct samsung_pin_bank *bank = drvdata->pin_banks;
> > +     struct samsung_pinctrl_drv_data *d = bank->drvdata;
> >       struct exynos_irq_chip *irq_chip = NULL;
> >       int i;
> >
> > @@ -665,6 +719,10 @@ void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
> >               if (bank->eint_type == EINT_TYPE_GPIO)
> >                       exynos_pinctrl_suspend_bank(drvdata, bank);
> >               else if (bank->eint_type == EINT_TYPE_WKUP) {
> > +                     /* Setting Delay (Analog) Filter */
> > +                     if (bank->fltcon_type != FLT_DEFAULT)
> > +                             exynos_eint_flt_config(EXYNOS_FLTCON_SEL_DELAY,
> > +                                                    0, d, bank);
> >                       if (!irq_chip) {
> >                               irq_chip = bank->irq_chip;
> >                               irq_chip->set_eint_wakeup_mask(drvdata,
> > @@ -707,11 +765,19 @@ static void exynos_pinctrl_resume_bank(
> >  void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
> >  {
> >       struct samsung_pin_bank *bank = drvdata->pin_banks;
> > +     struct samsung_pinctrl_drv_data *d = bank->drvdata;
> >       int i;
> >
> >       for (i = 0; i < drvdata->nr_banks; ++i, ++bank)
> > -             if (bank->eint_type == EINT_TYPE_GPIO)
> > +             if (bank->eint_type == EINT_TYPE_GPIO) {
> >                       exynos_pinctrl_resume_bank(drvdata, bank);
> > +             } else if (bank->eint_type == EINT_TYPE_WKUP ||
> > +                     bank->eint_type == EINT_TYPE_WKUP_MUX) {
> > +                     /* Set Digital Filter */
> > +                     if (bank->fltcon_type != FLT_DEFAULT)
> > +                             exynos_eint_flt_config(EXYNOS_FLTCON_SEL_DIGITAL,
> > +                                                    0, d, bank);
> > +             }
> >  }
> >
> >  static void exynos_retention_enable(struct samsung_pinctrl_drv_data *drvdata)
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
> > index 7bd6d82c9f36..aafd8f9f52f8 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> > @@ -16,6 +16,8 @@
> >  #ifndef __PINCTRL_SAMSUNG_EXYNOS_H
> >  #define __PINCTRL_SAMSUNG_EXYNOS_H
> >
> > +#include <linux/bitfield.h>
> > +
>
> I don't think you use in this header anything from bitfield.
>
> >  /* Values for the pin CON register */
> >  #define EXYNOS_PIN_CON_FUNC_EINT     0xf
> >
> > @@ -50,6 +52,14 @@
> >
> >  #define EXYNOS_EINT_MAX_PER_BANK     8
> >  #define EXYNOS_EINT_NR_WKUP_EINT
> > +/* EINT filter configuration */
> > +#define EXYNOS_FLTCON_EN             BIT(7)
>
> EXYNOS9? Earlier variants did not have it, AFAIR.

Will fix

>
> > +#define EXYNOS_FLTCON_SEL_DIGITAL    BIT(6)
> > +#define EXYNOS_FLTCON_SEL_DELAY              0
> > +#define EXYNOS_FLTCON_WIDTH(x)               ((x) & 0x3f)
> > +#define EXYNOS_FLTCON_MASK           0xFF
>
> Keep lowercase hex

Will fix

Kind regards,

Peter.
