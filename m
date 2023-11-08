Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 114927E580F
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Nov 2023 14:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344468AbjKHNoM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Nov 2023 08:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234212AbjKHNoM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Nov 2023 08:44:12 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99321FC2
        for <linux-gpio@vger.kernel.org>; Wed,  8 Nov 2023 05:44:09 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-672f5fb0b39so42895036d6.2
        for <linux-gpio@vger.kernel.org>; Wed, 08 Nov 2023 05:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699451049; x=1700055849; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKZCqhm8AFVwxssH7/r5DfL10FHFsNmRP1Oyhjan5RA=;
        b=BQlTNXw6zOjHi/LvJn0KoA2nMQCq6fsPTjpmBbX7i5BJk2ADz/Ngbg+pbrm4Qmmfv5
         r68x+6zvtgQ7t5qIz8FbaA3UYVUq/jN0NXWhPc8xvuI4rzzK2wujHTwgiTbPa/AxBMQh
         W2Pa++tdktSG30zsZiELkjMcMb1zvr68nV7v7V1NzGNZ8CGVyqz61fTVCW0p0oumXP0S
         r9XND1mpPZ1r93J933CphphSMnVRZ5I6QeF/9UUHuH4iVAwXe2HE943Gqo5L9Jv5xf7E
         LGK6p6etUPXPgAxifPtbIFnMjSdQ0UzcVuPkH2LxEwKztoQnKqFf6g6tmKddZ0tAfFYs
         VqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699451049; x=1700055849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKZCqhm8AFVwxssH7/r5DfL10FHFsNmRP1Oyhjan5RA=;
        b=jbQeF5hWd9nFOgAYT5R7DLFK83E49SBLIv4RJ5U1vZ59qadatZzlusRwCKnSBln1pm
         /Vv+NO2KQAGihvDvj2mLG7lpxHTt6BQPdEtOSGljpZoOzcVdAzL5amTAS7EgEgs3ZpJL
         rmHIztVeFK6KtnLbBE9rZP1pW9XVJyczIGlZJh+HV/sb/yiXBfixiIxBg6ouRbXq0UVo
         RgMmh7bHCViOrULcv1MD6u9ZpD8VS8TIg2A+0sCbJ1Ixgi4BNpyHc8uM1Qt4heN8PGdf
         /DvcIVfTjF6JN2SwJhKXURdW2OmdPW69fzBBZZZ4NMRdst8nRG8P2GPi2FdVPwef/A5p
         hOfA==
X-Gm-Message-State: AOJu0YydO+Yh2mhIxddDrjPhD8umlajtxh6GLMabdIOWjqS42PH1Yj+e
        rEyX4uphRJ8ZJ2mgYT9w8DbRhF6lWZECVBjUEDFkwQ==
X-Google-Smtp-Source: AGHT+IFCylc77uwZLvhx0FoVd3Sqb6tdP1R7uRKdeK/yHH/BSnU0lGTI2P0BS/e2M0CMWQshI0m8jEkumkFoqMUNR+c=
X-Received: by 2002:a05:6214:494:b0:673:b0e7:1916 with SMTP id
 pt20-20020a056214049400b00673b0e71916mr2527276qvb.2.1699451048900; Wed, 08
 Nov 2023 05:44:08 -0800 (PST)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-15-peter.griffin@linaro.org> <CAPLW+4=k1qZgOKUUXgJYgXOzzRujyjW+Ua0Sej-gDcZsvCWirw@mail.gmail.com>
In-Reply-To: <CAPLW+4=k1qZgOKUUXgJYgXOzzRujyjW+Ua0Sej-gDcZsvCWirw@mail.gmail.com>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Wed, 8 Nov 2023 13:43:57 +0000
Message-ID: <CADrjBPoYqduCmd_j4cp0pSEXzRAOML7=YianTwNsvxuzvGpOtA@mail.gmail.com>
Subject: Re: [PATCH v3 14/20] pinctrl: samsung: Add gs101 SoC pinctrl configuration
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
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
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sam,

On Thu, 12 Oct 2023 at 07:00, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > Add support for the pin-controller found on the gs101 SoC used in
> > Pixel 6 phones.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 163 ++++++++++++++++++
> >  drivers/pinctrl/samsung/pinctrl-exynos.c      |   2 +
> >  drivers/pinctrl/samsung/pinctrl-exynos.h      |  34 ++++
> >  drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
> >  drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
> >  5 files changed, 202 insertions(+)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/p=
inctrl/samsung/pinctrl-exynos-arm64.c
> > index cb965cf93705..db47001d1b35 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > @@ -796,3 +796,166 @@ const struct samsung_pinctrl_of_match_data fsd_of=
_data __initconst =3D {
> >         .ctrl           =3D fsd_pin_ctrl,
> >         .num_ctrl       =3D ARRAY_SIZE(fsd_pin_ctrl),
> >  };
> > +
> > +/*
> > + * bank type for non-alive type
> > + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit fiel=
d: 4)
> > + * (CONPDN bit field: 2, PUDPDN bit field: 4)
> > + */
> > +static struct samsung_pin_bank_type gs101_bank_type_off  =3D {
> > +       .fld_width =3D { 4, 1, 4, 4, 2, 4, },
> > +       .reg_offset =3D { 0x00, 0x04, 0x08, 0x0c, 0x10, 0x14, },
> > +};
> > +
> > +/*
> > + * bank type for alive type
> > + * (CON bit field: 4, DAT bit field: 1, PUD bit field: 4, DRV bit fiel=
d: 4)
> > + */
> > +static const struct samsung_pin_bank_type gs101_bank_type_alive =3D {
> > +       .fld_width =3D { 4, 1, 4, 4, },
> > +       .reg_offset =3D { 0x00, 0x04, 0x08, 0x0c, },
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (ALIVE) */
> > +static const struct samsung_pin_bank_data gs101_pin_alive[] =3D {
> > +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 8, 0x0, "gpa0", 0=
x00, 0x00, FLT_SELECTABLE),
>
> Here and further: please keep 80 characters per line when possible.

Will fix.

>
> > +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 7, 0x20, "gpa1", =
0x04, 0x08, FLT_SELECTABLE),
> > +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 5, 0x40, "gpa2", =
0x08, 0x10, FLT_SELECTABLE),
> > +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 4, 0x60, "gpa3", =
0x0c, 0x18, FLT_SELECTABLE),
> > +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 4, 0x80, "gpa4", =
0x10, 0x1c, FLT_SELECTABLE),
> > +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 7, 0xa0, "gpa5", =
0x14, 0x20, FLT_SELECTABLE),
> > +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 8, 0xc0, "gpa9", =
0x18, 0x28, FLT_SELECTABLE),
> > +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 2, 0xe0, "gpa10",=
 0x1c, 0x30, FLT_SELECTABLE),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (FAR_ALIVE) */
> > +static const struct samsung_pin_bank_data gs101_pin_far_alive[] =3D {
> > +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 8, 0x0, "gpa6", 0=
x00, 0x00, FLT_SELECTABLE),
> > +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 4, 0x20, "gpa7", =
0x04, 0x08, FLT_SELECTABLE),
> > +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 8, 0x40, "gpa8", =
0x08, 0x0c, FLT_SELECTABLE),
> > +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 2, 0x60, "gpa11",=
 0x0c, 0x14, FLT_SELECTABLE),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (GSACORE) */
> > +static const struct samsung_pin_bank_data gs101_pin_gsacore[] =3D {
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x0, "gps0", 0x0=
0, 0x00, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 8, 0x20, "gps1", 0x=
04, 0x04, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 3, 0x40, "gps2", 0x=
08, 0x0c, FLT_DEFAULT),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (GSACTRL) */
> > +static const struct samsung_pin_bank_data gs101_pin_gsactrl[] =3D {
> > +       EXYNOS9_PIN_BANK_EINTW(gs101_bank_type_alive, 6, 0x0, "gps3", 0=
x00, 0x00, FLT_DEFAULT),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (PERIC0) */
> > +static const struct samsung_pin_bank_data gs101_pin_peric0[] =3D {
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 5, 0x0, "gpp0", 0x0=
0, 0x00, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x20, "gpp1", 0x=
04, 0x08, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x40, "gpp2", 0x=
08, 0x0c, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x60, "gpp3", 0x=
0c, 0x10, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x80, "gpp4", 0x=
10, 0x14, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0xa0, "gpp5", 0x=
14, 0x18, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0xc0, "gpp6", 0x=
18, 0x1c, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0xe0, "gpp7", 0x=
1c, 0x20, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x100, "gpp8", 0=
x20, 0x24, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x120, "gpp9", 0=
x24, 0x28, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x140, "gpp10", =
0x28, 0x2c, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x160, "gpp11", =
0x2c, 0x30, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x180, "gpp12", =
0x30, 0x34, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x1a0, "gpp13", =
0x34, 0x38, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x1c0, "gpp14", =
0x38, 0x3c, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x1e0, "gpp15", =
0x3c, 0x40, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x200, "gpp16", =
0x40, 0x44, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x220, "gpp17", =
0x44, 0x48, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x240, "gpp18", =
0x48, 0x4c, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x260, "gpp19", =
0x4c, 0x50, FLT_DEFAULT),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (PERIC1) */
> > +static const struct samsung_pin_bank_data gs101_pin_peric1[] =3D {
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 8, 0x0, "gpp20", 0x=
00, 0x00, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x20, "gpp21", 0=
x04, 0x08, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x40, "gpp22", 0=
x08, 0x0c, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 8, 0x60, "gpp23", 0=
x0c, 0x10, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0x80, "gpp24", 0=
x10, 0x18, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0xa0, "gpp25", 0=
x14, 0x1c, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 5, 0xc0, "gpp26", 0=
x18, 0x20, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 4, 0xe0, "gpp27", 0=
x1c, 0x28, FLT_DEFAULT),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (HSI1) */
> > +static const struct samsung_pin_bank_data gs101_pin_hsi1[] =3D {
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 6, 0x0, "gph0", 0x0=
0, 0x00, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 7, 0x20, "gph1", 0x=
04, 0x08, FLT_DEFAULT),
> > +};
> > +
> > +/* pin banks of gs101 pin-controller (HSI2) */
> > +static const struct samsung_pin_bank_data gs101_pin_hsi2[] =3D {
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 6, 0x0, "gph2", 0x0=
0, 0x00, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 2, 0x20, "gph3", 0x=
04, 0x08, FLT_DEFAULT),
> > +       EXYNOS9_PIN_BANK_EINTG(gs101_bank_type_off, 6, 0x40, "gph4", 0x=
08, 0x0c, FLT_DEFAULT),
> > +};
> > +
> > +static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst =3D =
{
> > +       {
> > +               /* pin banks of gs101 pin-controller (ALIVE) */
> > +               .pin_banks      =3D gs101_pin_alive,
> > +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_alive),
> > +               .eint_gpio_init =3D exynos_eint_gpio_init,
> > +               .eint_wkup_init =3D exynos_eint_wkup_init,
>
> Is it ok to have both .eint_gpio_init and .eint_wkup_init set here and
> further? I remember doing something like that for Exynos850 before,
> only to realize further if was a mistake. Please check commit
> 96f79935015c ("pinctrl: samsung: Remove EINT handler for Exynos850
> ALIVE and CMGP gpios"). Maybe it's ok in your case.

Thanks for the hint :) You're correct eint_gpio_init is not required on ali=
ve,
far_alive, gsacore and gsactrl banks. Will update in v4.

>
> > +               .suspend        =3D exynos_pinctrl_suspend,
> > +               .resume         =3D exynos_pinctrl_resume,
>
> Did you manage to actually test those suspend/resume callbacks
> somehow? If so, can you please share the procedure? I guess I had some
> Power Domains and clock related problems on Exynos850 when I tried
> that before, so just curious.

You can test the callbacks using
echo mem > /sys/power/state

Thanks,

Peter.




>
> > +       }, {
> > +               /* pin banks of gs101 pin-controller (FAR_ALIVE) */
> > +               .pin_banks      =3D gs101_pin_far_alive,
> > +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_far_alive),
> > +               .eint_gpio_init =3D exynos_eint_gpio_init,
> > +               .eint_wkup_init =3D exynos_eint_wkup_init,
> > +               .suspend        =3D exynos_pinctrl_suspend,
> > +               .resume         =3D exynos_pinctrl_resume,
> > +       }, {
> > +               /* pin banks of gs101 pin-controller (GSACORE) */
> > +               .pin_banks      =3D gs101_pin_gsacore,
> > +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_gsacore),
> > +               .eint_gpio_init =3D exynos_eint_gpio_init,
> > +       }, {
> > +               /* pin banks of gs101 pin-controller (GSACTRL) */
> > +               .pin_banks      =3D gs101_pin_gsactrl,
> > +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_gsactrl),
> > +               .eint_gpio_init =3D exynos_eint_gpio_init,
> > +       }, {
> > +               /* pin banks of gs101 pin-controller (PERIC0) */
> > +               .pin_banks      =3D gs101_pin_peric0,
> > +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_peric0),
> > +               .eint_gpio_init =3D exynos_eint_gpio_init,
> > +               .suspend        =3D exynos_pinctrl_suspend,
> > +               .resume         =3D exynos_pinctrl_resume,
> > +       }, {
> > +               /* pin banks of gs101 pin-controller (PERIC1) */
> > +               .pin_banks      =3D gs101_pin_peric1,
> > +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_peric1),
> > +               .eint_gpio_init =3D exynos_eint_gpio_init,
> > +               .suspend        =3D exynos_pinctrl_suspend,
> > +               .resume =3D exynos_pinctrl_resume,
> > +       }, {
> > +               /* pin banks of gs101 pin-controller (HSI1) */
> > +               .pin_banks      =3D gs101_pin_hsi1,
> > +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_hsi1),
> > +               .eint_gpio_init =3D exynos_eint_gpio_init,
> > +               .suspend        =3D exynos_pinctrl_suspend,
> > +               .resume         =3D exynos_pinctrl_resume,
> > +       }, {
> > +               /* pin banks of gs101 pin-controller (HSI2) */
> > +               .pin_banks      =3D gs101_pin_hsi2,
> > +               .nr_banks       =3D ARRAY_SIZE(gs101_pin_hsi2),
> > +               .eint_gpio_init =3D exynos_eint_gpio_init,
> > +               .suspend        =3D exynos_pinctrl_suspend,
> > +               .resume         =3D exynos_pinctrl_resume,
> > +       },
> > +};
> > +
> > +const struct samsung_pinctrl_of_match_data gs101_of_data __initconst =
=3D {
> > +       .ctrl           =3D gs101_pin_ctrl,
> > +       .num_ctrl       =3D ARRAY_SIZE(gs101_pin_ctrl),
> > +};
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl=
/samsung/pinctrl-exynos.c
> > index 800831aa8357..014f0c37f97f 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> > @@ -533,6 +533,8 @@ static const struct of_device_id exynos_wkup_irq_id=
s[] =3D {
> >                         .data =3D &exynos7_wkup_irq_chip },
> >         { .compatible =3D "samsung,exynosautov9-wakeup-eint",
> >                         .data =3D &exynos7_wkup_irq_chip },
> > +       { .compatible =3D "google,gs101-wakeup-eint",
> > +                       .data =3D &exynos7_wkup_irq_chip },
> >         { }
> >  };
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl=
/samsung/pinctrl-exynos.h
> > index 63b2426ad5d6..0dd013654bd2 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> > @@ -147,6 +147,40 @@
> >                 .name           =3D id                            \
> >         }
> >
> > +#define EXYNOS9_PIN_BANK_EINTN(types, pins, reg, id)   \
> > +       {                                               \
> > +               .type           =3D &types,               \
> > +               .pctl_offset    =3D reg,                  \
> > +               .nr_pins        =3D pins,                 \
> > +               .eint_type      =3D EINT_TYPE_NONE,       \
> > +               .fltcon_type    =3D FLT_DEFAULT           \
> > +               .name           =3D id                    \
> > +       }
> > +
> > +#define EXYNOS9_PIN_BANK_EINTG(types, pins, reg, id, offs, fltcon_offs=
, fltcontype) \
> > +       {                                               \
> > +               .type           =3D &types,               \
> > +               .pctl_offset    =3D reg,                  \
> > +               .nr_pins        =3D pins,                 \
> > +               .eint_type      =3D EINT_TYPE_GPIO,       \
> > +               .eint_offset    =3D offs,                 \
> > +               .fltcon_type    =3D fltcontype,           \
> > +               .fltcon_offset  =3D fltcon_offs,          \
> > +               .name           =3D id                    \
> > +       }
> > +
> > +#define EXYNOS9_PIN_BANK_EINTW(types, pins, reg, id, offs, fltcon_offs=
, fltcontype) \
> > +       {                                               \
> > +               .type           =3D &types,               \
> > +               .pctl_offset    =3D reg,                  \
> > +               .nr_pins        =3D pins,                 \
> > +               .eint_type      =3D EINT_TYPE_WKUP,       \
> > +               .eint_offset    =3D offs,                 \
> > +               .fltcon_type    =3D fltcontype,           \
> > +               .fltcon_offset  =3D fltcon_offs,          \
> > +               .name           =3D id                    \
> > +       }
> > +
>
> Looks to me that instead of adding new macros the already existing
> EXYNOS850_PIN_BANK_* should be extended and re-used. Because those
> pinctrl IP-cores on all modern Exynos chips look very similar, even if
> you compare the downstream code. If EXYNOS850 prefix looks confusing,
> maybe it can be renamed to EXYNOS9 or something like that. Those
> filter parameters are also present in Exynos850 downstream kernel
> code. So I just feel like the proper way to add that feature would be
> to add that also for all modern ARM64 Exynos variants while at it.
>
> >  /**
> >   * struct exynos_weint_data: irq specific data for all the wakeup inte=
rrupts
> >   * generated by the external wakeup interrupt controller.
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctr=
l/samsung/pinctrl-samsung.c
> > index 449f8109d8b5..12176f98440d 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > @@ -1321,6 +1321,8 @@ static const struct of_device_id samsung_pinctrl_=
dt_match[] =3D {
> >                 .data =3D &exynosautov9_of_data },
> >         { .compatible =3D "tesla,fsd-pinctrl",
> >                 .data =3D &fsd_of_data },
> > +       { .compatible =3D "google,gs101-pinctrl",
> > +               .data =3D &gs101_of_data },
> >  #endif
> >  #ifdef CONFIG_PINCTRL_S3C64XX
> >         { .compatible =3D "samsung,s3c64xx-pinctrl",
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctr=
l/samsung/pinctrl-samsung.h
> > index de2ca8e8b378..e62e909fb10d 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> > @@ -374,6 +374,7 @@ extern const struct samsung_pinctrl_of_match_data e=
xynos7885_of_data;
> >  extern const struct samsung_pinctrl_of_match_data exynos850_of_data;
> >  extern const struct samsung_pinctrl_of_match_data exynosautov9_of_data=
;
> >  extern const struct samsung_pinctrl_of_match_data fsd_of_data;
> > +extern const struct samsung_pinctrl_of_match_data gs101_of_data;
> >  extern const struct samsung_pinctrl_of_match_data s3c64xx_of_data;
> >  extern const struct samsung_pinctrl_of_match_data s3c2412_of_data;
> >  extern const struct samsung_pinctrl_of_match_data s3c2416_of_data;
> > --
> > 2.42.0.655.g421f12c284-goog
> >
