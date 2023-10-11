Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5577C608C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 00:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235188AbjJKWrb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 18:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233559AbjJKWr2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 18:47:28 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42BBDB7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 15:47:24 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-27cefb5ae1fso214521a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 15:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697064444; x=1697669244; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJjpPlrTA7gt5OOjUByIlzSzMV5BWHvidaObW0xkHOs=;
        b=uBHlBfOj3FR0vLB5pJq48lFBNJmY3JNHOX+jNJeb1/y9/o2u5HIRBu+d0KZOFuym2Y
         tmC51SuDzbKnupNSwn9KlXfKiwwOh4dWNxNn+X/iLJzfwc+FJ+kmLlHH2jJR5SRvLDg7
         fsGI60W9jCXavbPhpKp8tAsAy19OfuSBabxBDV8BFrc+8rYTrSQqbkOjFxHtZwKt7SRf
         4Uba8x//1MAJHr75TCcSHQt0TGFgGvueVD+36ziSxgT/SQLU7YtWzZw3JLKOam0q+fmW
         y+KYvY9IuliiXvi4AD/Rp4zmtyoOkEig9hgXai1SBZG/fl7e+oAEK6dQI6V49EpCqWo4
         FicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697064444; x=1697669244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJjpPlrTA7gt5OOjUByIlzSzMV5BWHvidaObW0xkHOs=;
        b=nMJF08TNBUnfT8wrhXmYuK2TYeVall8cbQuhH2B2zirK/sESgz4CQO0HfpT7ctXNRb
         VluSX6a9b2LOcWWSG2d4VgVLjmhivyfZhMKzyt7x048UcmAj5CVXB2aIahMH2hDCh7/g
         DzI07ImOUlOvWKHl2cfBZ0jjfsG89OZS5fcFrErR6l9DMMGkXkwU0UVrDmxfIiGI/Oej
         tIMulo1S2vCT8jcvU6jeZESsJfRMr04EERAIZpjRQ3DF/nPG+hD+OkujXDAhOQvsHgE8
         XBNaJOHOHDux9i7hRsYRzXpvTYgN8FRy9VelPhAz7PJ+MeCyychx61GdaGDeaAuhG+3M
         QDBw==
X-Gm-Message-State: AOJu0Yw3RoFR1x7BWGZg6QkBQlvGLoJ5w1VUosrwfDUQdKBXymPaZ+KK
        05/2djf2T7AWAYemqYpagYa2XVY1+jJHzcmuuWmIfg==
X-Google-Smtp-Source: AGHT+IHW7erGEhJpn4pqxfGZQIK9COm8/18UGtTL88Wsnz412tIEuuJCd/HF0Q4FmkAEKFkBM0bgHeO1EOafbzB6354=
X-Received: by 2002:a17:90a:d386:b0:27d:9ed:96fc with SMTP id
 q6-20020a17090ad38600b0027d09ed96fcmr2547852pju.29.1697064443582; Wed, 11 Oct
 2023 15:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-14-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-14-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 11 Oct 2023 17:47:12 -0500
Message-ID: <CAPLW+4nVKXrW3q8d+Lm7p=s9n92Viw2SZLsXV1E4vBxP7cWRwg@mail.gmail.com>
Subject: Re: [PATCH v3 13/20] pinctrl: samsung: Add filter selection support
 for alive banks
To:     Peter Griffin <peter.griffin@linaro.org>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     robh+dt@kernel.org, mturquette@baylibre.com, conor+dt@kernel.org,
        sboyd@kernel.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Newer Exynos SoCs have a filter selection register on alive bank pins.
> This allows the selection of a digital or delay filter for each pin. If
> the filter selection register is not available then the default filter
> (digital) is applied.
>

I wonder if that solves any particular issue. For Exynos850 I decided
against adding this feature because I failed to find any benefits of
it. Didn't even come up with the way to test it. Is it really needed
for this SoC functioning? In case you have some more details on why
it's needed and how it can be tested, please add that info to the
commit message as well.

> On suspend we apply the analog filter to all pins in the bank, and on
> resume the digital filter is reapplied to all pins in the bank.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Heads up: I noticed some merge warnings when applying this patch onto
the most recent linux-next, like so:

8<---------------------------------------------------------------------->8
    Applying: pinctrl: samsung: Add filter selection support for alive bank=
s
    Using index info to reconstruct a base tree...
    M    drivers/pinctrl/samsung/pinctrl-exynos.c
    M    drivers/pinctrl/samsung/pinctrl-exynos.h
    M    drivers/pinctrl/samsung/pinctrl-samsung.c
    M    drivers/pinctrl/samsung/pinctrl-samsung.h
    Falling back to patching base and 3-way merge...
    Auto-merging drivers/pinctrl/samsung/pinctrl-samsung.h
    Auto-merging drivers/pinctrl/samsung/pinctrl-samsung.c
    Auto-merging drivers/pinctrl/samsung/pinctrl-exynos.h
    Auto-merging drivers/pinctrl/samsung/pinctrl-exynos.c
8<---------------------------------------------------------------------->8

It was still applied, but maybe if you are going to send v4 try to
rebase your series on top of linux-next first.

Below are pretty minor comments for the code.

>  drivers/pinctrl/samsung/pinctrl-exynos.c  | 82 ++++++++++++++++++++++-
>  drivers/pinctrl/samsung/pinctrl-exynos.h  |  7 ++
>  drivers/pinctrl/samsung/pinctrl-samsung.c |  2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h | 23 +++++++
>  4 files changed, 113 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/s=
amsung/pinctrl-exynos.c
> index a8212fc126bf..800831aa8357 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -269,6 +269,68 @@ struct exynos_eint_gpio_save {
>         u32 eint_mask;
>  };
>
> +static void exynos_eint_flt_config(struct samsung_pinctrl_drv_data *d,
> +                                  struct samsung_pin_bank *bank, int fil=
ter)
> +{
> +       unsigned int flt_reg, flt_con =3D 0;
> +       unsigned int val, shift;
> +       int i;
> +       int loop_cnt;
> +
> +       /*
> +        * This function sets the desired filter (digital or delay) to
> +        * every pin in the bank. Note the filter selection bitfield is
> +        * only found on alive banks. The FLTCON register has the
> +        * following layout
> +        *
> +        * BitfieldName[PinNum][Bit:Bit]
> +        *
> +        * FLT_EN[3][31] FLT_SEL[3][30] FLT_WIDTH[3][29:24]
> +        * FLT_EN[2][23] FLT_SEL[2][22] FLT_WIDTH[2][21:16]
> +        * FLT_EN[1][15] FLT_SEL[1][14] FLT_WIDTH[1][13:8]
> +        * FLT_EN[0][7]  FLT_SEL[0][6]  FLT_WIDTH[0][5:0]
> +        */

Maybe move this comment above this function? Or split it in two parts:
function doc, and 'flt_con' variable doc.

> +
> +       flt_con |=3D EXYNOS9_FLTCON_EN;
> +
> +       if (filter)

Different values are passed as a 'filter' param to this function. But
here it's only used as a boolean value. Something doesn't feel right.

> +               flt_con |=3D EXYNOS9_FLTCON_SEL_DIGITAL;
> +
> +       flt_reg =3D EXYNOS_GPIO_EFLTCON_OFFSET + bank->fltcon_offset;
> +
> +       if (bank->nr_pins > EXYNOS9_FLTCON_NR_PIN)
> +               /*
> +                * if nr_pins > 4, we should set FLTCON0 register fully.
> +                * (pin0 ~ 3). So loop 4 times in case of FLTCON0.
> +                */

Maybe move this comment above 'if' block? And start with capital
letter, for consistency with other multi-line comments.

> +               loop_cnt =3D EXYNOS9_FLTCON_NR_PIN;
> +       else
> +               loop_cnt =3D bank->nr_pins;
> +
> +       val =3D readl(d->virt_base + flt_reg);
> +

Maybe remove this empty line to make RMW block the whole?

> +       for (i =3D 0; i < loop_cnt; i++) {
> +               shift =3D i * EXYNOS9_FLTCON_LEN;
> +               val &=3D ~(EXYNOS9_FLTCON_MASK << shift);
> +               val |=3D (flt_con << shift);
> +       }
> +

Ditto.

> +       writel(val, d->virt_base + flt_reg);
> +
> +       /* loop for FLTCON1 pin 4 ~ 7 */

Start with a capital letter for consistency.

> +       if (bank->nr_pins > EXYNOS9_FLTCON_NR_PIN) {
> +               val =3D readl(d->virt_base + flt_reg + 0x4);
> +               loop_cnt =3D (bank->nr_pins - EXYNOS9_FLTCON_NR_PIN);
> +
> +               for (i =3D 0; i < loop_cnt; i++) {
> +                       shift =3D i * EXYNOS9_FLTCON_LEN;
> +                       val &=3D ~(EXYNOS9_FLTCON_MASK << shift);
> +                       val |=3D (flt_con << shift);
> +               }

Code duplication, but it's minor.

> +               writel(val, d->virt_base + flt_reg + 0x4);
> +       }
> +}
> +
>  /*
>   * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
>   * @d: driver data of samsung pinctrl driver.
> @@ -321,6 +383,9 @@ __init int exynos_eint_gpio_init(struct samsung_pinct=
rl_drv_data *d)
>                         goto err_domains;
>                 }
>
> +               /* Set Delay Analog Filter */
> +               if (bank->fltcon_type !=3D FLT_DEFAULT)
> +                       exynos_eint_flt_config(d, bank, EXYNOS9_FLTCON_SE=
L_DELAY);
>         }
>
>         return 0;
> @@ -555,6 +620,10 @@ __init int exynos_eint_wkup_init(struct samsung_pinc=
trl_drv_data *d)
>                 if (bank->eint_type !=3D EINT_TYPE_WKUP)
>                         continue;
>
> +               /* Set Digital Filter */
> +               if (bank->fltcon_type !=3D FLT_DEFAULT)
> +                       exynos_eint_flt_config(d, bank, EXYNOS9_FLTCON_SE=
L_DIGITAL);

Please stick to 80 characters per line when possible.

> +
>                 bank->irq_chip =3D devm_kmemdup(dev, irq_chip, sizeof(*ir=
q_chip),
>                                               GFP_KERNEL);
>                 if (!bank->irq_chip) {
> @@ -658,6 +727,7 @@ static void exynos_pinctrl_suspend_bank(
>  void exynos_pinctrl_suspend(struct samsung_pinctrl_drv_data *drvdata)
>  {
>         struct samsung_pin_bank *bank =3D drvdata->pin_banks;
> +       struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
>         struct exynos_irq_chip *irq_chip =3D NULL;
>         int i;
>
> @@ -665,6 +735,9 @@ void exynos_pinctrl_suspend(struct samsung_pinctrl_dr=
v_data *drvdata)
>                 if (bank->eint_type =3D=3D EINT_TYPE_GPIO)
>                         exynos_pinctrl_suspend_bank(drvdata, bank);
>                 else if (bank->eint_type =3D=3D EINT_TYPE_WKUP) {
> +                       /* Setting Delay (Analog) Filter */
> +                       if (bank->fltcon_type !=3D FLT_DEFAULT)
> +                               exynos_eint_flt_config(d, bank, EXYNOS9_F=
LTCON_SEL_DELAY);

Please stick to 80 characters per line when possible.

>                         if (!irq_chip) {
>                                 irq_chip =3D bank->irq_chip;
>                                 irq_chip->set_eint_wakeup_mask(drvdata,
> @@ -707,11 +780,18 @@ static void exynos_pinctrl_resume_bank(
>  void exynos_pinctrl_resume(struct samsung_pinctrl_drv_data *drvdata)
>  {
>         struct samsung_pin_bank *bank =3D drvdata->pin_banks;
> +       struct samsung_pinctrl_drv_data *d =3D bank->drvdata;
>         int i;
>
>         for (i =3D 0; i < drvdata->nr_banks; ++i, ++bank)
> -               if (bank->eint_type =3D=3D EINT_TYPE_GPIO)
> +               if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
>                         exynos_pinctrl_resume_bank(drvdata, bank);
> +               } else if (bank->eint_type =3D=3D EINT_TYPE_WKUP ||
> +                       bank->eint_type =3D=3D EINT_TYPE_WKUP_MUX) {

Indent it to be under the open bracket on the previous line.

> +                       /* Set Digital Filter */
> +                       if (bank->fltcon_type !=3D FLT_DEFAULT)
> +                               exynos_eint_flt_config(d, bank, EXYNOS9_F=
LTCON_SEL_DIGITAL);

Please stick to 80 characters per line when possible.

> +               }
>  }
>
>  static void exynos_retention_enable(struct samsung_pinctrl_drv_data *drv=
data)
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/s=
amsung/pinctrl-exynos.h
> index 7bd6d82c9f36..63b2426ad5d6 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -50,6 +50,13 @@
>
>  #define EXYNOS_EINT_MAX_PER_BANK       8
>  #define EXYNOS_EINT_NR_WKUP_EINT
> +/* EINT filter configuration */
> +#define EXYNOS9_FLTCON_EN              BIT(7)
> +#define EXYNOS9_FLTCON_SEL_DIGITAL     BIT(6)
> +#define EXYNOS9_FLTCON_SEL_DELAY       0
> +#define EXYNOS9_FLTCON_MASK            0xff
> +#define EXYNOS9_FLTCON_LEN             8
> +#define EXYNOS9_FLTCON_NR_PIN          4
>

I guess we discussed using EXYNOS9 prefix during the review of
Exynos850 initial submission, and decided against it. But in case of
this SoC (which is obviously Exynos, but is called Google), I'm not
even sure which name would be appropriate. I mean, if it's ok to use
EXYNOS9 prefix, then maybe I should go ahead and rename existing
EXYNOS850 definitions to EXYNOS9 too, as it belongs to the same
platform family, to avoid any confusion.

Krzysztof, what's your take on this?

>  #define EXYNOS_PIN_BANK_EINTN(pins, reg, id)           \
>         {                                               \
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/=
samsung/pinctrl-samsung.c
> index e54847040b4a..449f8109d8b5 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -1104,6 +1104,8 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl=
_drv_data *d,
>                 bank->eint_func =3D bdata->eint_func;
>                 bank->eint_type =3D bdata->eint_type;
>                 bank->eint_mask =3D bdata->eint_mask;
> +               bank->fltcon_type =3D bdata->fltcon_type;
> +               bank->fltcon_offset =3D bdata->fltcon_offset;
>                 bank->eint_offset =3D bdata->eint_offset;
>                 bank->name =3D bdata->name;
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/=
samsung/pinctrl-samsung.h
> index 9af93e3d8d9f..de2ca8e8b378 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> @@ -82,6 +82,21 @@ enum eint_type {
>         EINT_TYPE_WKUP_MUX,
>  };
>
> +/**
> + * enum fltcon_type - filter selection
> + * @FLT_DEFAULT: filter not selectable, default digital filter
> + * @FLT_SELECT: filter selectable (digital or delay)
> + *
> + * Some banks on some SoCs (gs101 and possibly others) have a selectable
> + * filter on alive banks of 'delay/analog' or 'digital'. If the filter
> + * selection is not available then the default filter is used (digital).
> + */
> +

Maybe remove this empty line?

> +enum fltcon_type {
> +       FLT_DEFAULT,
> +       FLT_SELECTABLE,
> +};
> +
>  /* maximum length of a pin in pin descriptor (example: "gpa0-0") */
>  #define PIN_NAME_LENGTH        10
>
> @@ -122,6 +137,8 @@ struct samsung_pin_bank_type {
>   * @eint_type: type of the external interrupt supported by the bank.
>   * @eint_mask: bit mask of pins which support EINT function.
>   * @eint_offset: SoC-specific EINT register or interrupt offset of bank.
> + * @fltcon_type: whether the filter (delay/digital) is selectable
> + * @fltcon_offset: SoC-specific EINT filter control register offset of b=
ank.
>   * @name: name to be prefixed for each pin in this pin bank.
>   */
>  struct samsung_pin_bank_data {
> @@ -133,6 +150,8 @@ struct samsung_pin_bank_data {
>         enum eint_type  eint_type;
>         u32             eint_mask;
>         u32             eint_offset;
> +       enum fltcon_type fltcon_type;
> +       u32             fltcon_offset;
>         const char      *name;
>  };
>
> @@ -147,6 +166,8 @@ struct samsung_pin_bank_data {
>   * @eint_type: type of the external interrupt supported by the bank.
>   * @eint_mask: bit mask of pins which support EINT function.
>   * @eint_offset: SoC-specific EINT register or interrupt offset of bank.
> + * @fltcon_type: whether the filter (delay/digital) is selectable
> + * @fltcon_offset: SoC-specific EINT filter control register offset of b=
ank.
>   * @name: name to be prefixed for each pin in this pin bank.
>   * @pin_base: starting pin number of the bank.
>   * @soc_priv: per-bank private data for SoC-specific code.
> @@ -169,6 +190,8 @@ struct samsung_pin_bank {
>         enum eint_type  eint_type;
>         u32             eint_mask;
>         u32             eint_offset;
> +       enum fltcon_type fltcon_type;
> +       u32             fltcon_offset;
>         const char      *name;
>
>         u32             pin_base;
> --
> 2.42.0.655.g421f12c284-goog
>
