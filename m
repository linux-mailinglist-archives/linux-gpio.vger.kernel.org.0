Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1FA063EE46
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Dec 2022 11:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbiLAKop (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Dec 2022 05:44:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbiLAKn2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Dec 2022 05:43:28 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A6AA13E5
        for <linux-gpio@vger.kernel.org>; Thu,  1 Dec 2022 02:43:23 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id n188so762357iof.8
        for <linux-gpio@vger.kernel.org>; Thu, 01 Dec 2022 02:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88kWvyJNQaA9CHJ2GydwDOEbhGIwb08R/93KeC8YHXY=;
        b=g63VtsEK6PTjwLG8vhvTHe8PpzKQngohpaSqxalpazYsbV8aw8TBYXIyQ4XCaVS+3t
         Wk4avMhNXC92XXpGn3sHzKYi4GkGrRqWkypFN6X3LMw4BiKOiHuQhN1+PnBpxjJshyHX
         FownxbPj0QhR/MISuDxQMAFpN22o6/QA27fKyS2HQp7zeuDJSfZxzoqs9UciSWuKhJT4
         pyGRlzrpVVN7kLHgMyr9DXKrtgEXazZnI6MTHjlE623zEEZN8TRqkD2jMpHH8A6F6j59
         tFYuf86I7NHf1rfZA9YDU5hHyDkLscrTJzEOWdbyT+4infoYpnM/u1ZmNl+sDPMq7pxf
         6DfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88kWvyJNQaA9CHJ2GydwDOEbhGIwb08R/93KeC8YHXY=;
        b=Abms/hSXXiJda0z5YMzKy4sH7PRFrCpaCvqcyg8yQGTABessRbDVIcDTDcnb5CXlLw
         adpCFdcsvUQYGIjuM9mjyFZJfz+V5HKG1Bdm/Il3ukMioy7q2AZsOLUeb9UU6kIq/eNh
         jbxnigy1rcDQNYPnj31e8E7fx/CJpMutbHYMjPks2WyFEZwP/mxGnBLQvDg9ngHA6o6o
         ze1YDheGUnHeUgIfa76w9baD69OFTqeVdw4QFDFfjrXlPR/CfFKidqlFFGc6zsN5B9QM
         z7pPhm1Mvz0C14sjroaVOIcyX6/LNtiaqQ9nH/5FkdtmMdTs60Pixb0rMar7HecRhAf9
         hOLw==
X-Gm-Message-State: ANoB5pni5G5glABFta56Z/zAB4LLTdu+yLDpeKKs/F/TROrY68zv7xpI
        x4MbjI8Ml3WsRRskLQS/9Kiq4zg1BJ0EiSx6uXPLdg==
X-Google-Smtp-Source: AA0mqf6IDxnpstum/aMj/gwmeSrpTPV3wyYwweWqmBRBUt6stKMrG/f7EtoXrRaAlxvGuiHO8rJOSnZwV3HFZRYn5nM=
X-Received: by 2002:a02:a695:0:b0:376:2353:5805 with SMTP id
 j21-20020a02a695000000b0037623535805mr30872093jam.4.1669891401966; Thu, 01
 Dec 2022 02:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de> <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 1 Dec 2022 10:43:03 +0000
Message-ID: <CAPY8ntDKdfL2s6bdj00o6oEvSeHHjA=UYyr1QMzg2v3eAhshkw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] pwm: Make .get_state() callback return an error code
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        dri-devel@lists.freedesktop.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Pavel Machek <pavel@ucw.cz>,
        Guenter Roeck <groeck@chromium.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-riscv@lists.infradead.org, linux-leds@vger.kernel.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        chrome-platform@lists.linux.dev,
        Florian Fainelli <f.fainelli@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Sean Anderson <sean.anderson@seco.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Hammer Hsieh <hammerh0314@gmail.com>,
        linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>, linux-sunxi@lists.linux.dev,
        linux-pwm@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Ray Jui <rjui@broadcom.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        linux-mediatek@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Scott Branden <sbranden@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Michael Walle <michael@walle.cc>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 30 Nov 2022 at 15:23, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> .get_state() might fail in some cases. To make it possible that a driver
> signals such a failure change the prototype of .get_state() to return an
> error code.
>
> This patch was created using coccinelle and the following semantic patch:
>
> @p1@
> identifier getstatefunc;
> identifier driver;
> @@
>  struct pwm_ops driver =3D {
>         ...,
>         .get_state =3D getstatefunc
>         ,...
>  };
>
> @p2@
> identifier p1.getstatefunc;
> identifier chip, pwm, state;
> @@
> -void
> +int
>  getstatefunc(struct pwm_chip *chip, struct pwm_device *pwm, struct pwm_s=
tate *state)
>  {
>    ...
> -  return;
> +  return 0;
>    ...
>  }
>
> plus the actual change of the prototype in include/linux/pwm.h (plus some
> manual fixing of indentions and empty lines).
>
> So for now all drivers return success unconditionally. They are adapted
> in the following patches to make the changes easier reviewable.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpio/gpio-mvebu.c             |  9 ++++++---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 ++++++++------
>  drivers/leds/rgb/leds-qcom-lpg.c      | 14 ++++++++------
>  drivers/pwm/pwm-atmel.c               |  6 ++++--
>  drivers/pwm/pwm-bcm-iproc.c           |  8 +++++---
>  drivers/pwm/pwm-crc.c                 | 10 ++++++----
>  drivers/pwm/pwm-cros-ec.c             |  8 +++++---
>  drivers/pwm/pwm-dwc.c                 |  6 ++++--
>  drivers/pwm/pwm-hibvt.c               |  6 ++++--
>  drivers/pwm/pwm-imx-tpm.c             |  8 +++++---
>  drivers/pwm/pwm-imx27.c               |  8 +++++---
>  drivers/pwm/pwm-intel-lgm.c           |  6 ++++--
>  drivers/pwm/pwm-iqs620a.c             |  6 ++++--
>  drivers/pwm/pwm-keembay.c             |  6 ++++--
>  drivers/pwm/pwm-lpss.c                |  6 ++++--
>  drivers/pwm/pwm-meson.c               |  8 +++++---
>  drivers/pwm/pwm-mtk-disp.c            | 12 +++++++-----
>  drivers/pwm/pwm-pca9685.c             |  8 +++++---
>  drivers/pwm/pwm-raspberrypi-poe.c     |  8 +++++---
>  drivers/pwm/pwm-rockchip.c            | 12 +++++++-----
>  drivers/pwm/pwm-sifive.c              |  6 ++++--
>  drivers/pwm/pwm-sl28cpld.c            |  8 +++++---
>  drivers/pwm/pwm-sprd.c                |  8 +++++---
>  drivers/pwm/pwm-stm32-lp.c            |  8 +++++---
>  drivers/pwm/pwm-sun4i.c               | 12 +++++++-----
>  drivers/pwm/pwm-sunplus.c             |  6 ++++--
>  drivers/pwm/pwm-visconti.c            |  6 ++++--
>  drivers/pwm/pwm-xilinx.c              |  8 +++++---
>  include/linux/pwm.h                   |  4 ++--
>  29 files changed, 146 insertions(+), 89 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
> index 1bb317b8dcce..91a4232ee58c 100644
> --- a/drivers/gpio/gpio-mvebu.c
> +++ b/drivers/gpio/gpio-mvebu.c
> @@ -657,9 +657,10 @@ static void mvebu_pwm_free(struct pwm_chip *chip, st=
ruct pwm_device *pwm)
>         spin_unlock_irqrestore(&mvpwm->lock, flags);
>  }
>
> -static void mvebu_pwm_get_state(struct pwm_chip *chip,
> -                               struct pwm_device *pwm,
> -                               struct pwm_state *state) {
> +static int mvebu_pwm_get_state(struct pwm_chip *chip,
> +                              struct pwm_device *pwm,
> +                              struct pwm_state *state)
> +{
>
>         struct mvebu_pwm *mvpwm =3D to_mvebu_pwm(chip);
>         struct mvebu_gpio_chip *mvchip =3D mvpwm->mvchip;
> @@ -693,6 +694,8 @@ static void mvebu_pwm_get_state(struct pwm_chip *chip=
,
>                 state->enabled =3D false;
>
>         spin_unlock_irqrestore(&mvpwm->lock, flags);
> +
> +       return 0;
>  }
>
>  static int mvebu_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm=
,
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 3c3561942eb6..6826d2423ae9 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1500,8 +1500,8 @@ static int ti_sn_pwm_apply(struct pwm_chip *chip, s=
truct pwm_device *pwm,
>         return ret;
>  }
>
> -static void ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> -                               struct pwm_state *state)
> +static int ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device =
*pwm,
> +                              struct pwm_state *state)
>  {
>         struct ti_sn65dsi86 *pdata =3D pwm_chip_to_ti_sn_bridge(chip);
>         unsigned int pwm_en_inv;
> @@ -1512,19 +1512,19 @@ static void ti_sn_pwm_get_state(struct pwm_chip *=
chip, struct pwm_device *pwm,
>
>         ret =3D regmap_read(pdata->regmap, SN_PWM_EN_INV_REG, &pwm_en_inv=
);
>         if (ret)
> -               return;
> +               return 0;
>
>         ret =3D ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_SCALE_REG, &sca=
le);
>         if (ret)
> -               return;
> +               return 0;
>
>         ret =3D ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_REG, &backlight=
);
>         if (ret)
> -               return;
> +               return 0;
>
>         ret =3D regmap_read(pdata->regmap, SN_PWM_PRE_DIV_REG, &pre_div);
>         if (ret)
> -               return;
> +               return 0;
>
>         state->enabled =3D FIELD_GET(SN_PWM_EN_MASK, pwm_en_inv);
>         if (FIELD_GET(SN_PWM_INV_MASK, pwm_en_inv))
> @@ -1539,6 +1539,8 @@ static void ti_sn_pwm_get_state(struct pwm_chip *ch=
ip, struct pwm_device *pwm,
>
>         if (state->duty_cycle > state->period)
>                 state->duty_cycle =3D state->period;
> +
> +       return 0;
>  }
>
>  static const struct pwm_ops ti_sn_pwm_ops =3D {
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qco=
m-lpg.c
> index 02f51cc61837..741cc2fd817d 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -968,8 +968,8 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struc=
t pwm_device *pwm,
>         return ret;
>  }
>
> -static void lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *=
pwm,
> -                             struct pwm_state *state)
> +static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *p=
wm,
> +                            struct pwm_state *state)
>  {
>         struct lpg *lpg =3D container_of(chip, struct lpg, pwm);
>         struct lpg_channel *chan =3D &lpg->channels[pwm->hwpwm];
> @@ -982,20 +982,20 @@ static void lpg_pwm_get_state(struct pwm_chip *chip=
, struct pwm_device *pwm,
>
>         ret =3D regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val=
);
>         if (ret)
> -               return;
> +               return 0;
>
>         refclk =3D lpg_clk_rates[val & PWM_CLK_SELECT_MASK];
>         if (refclk) {
>                 ret =3D regmap_read(lpg->map, chan->base + LPG_PREDIV_CLK=
_REG, &val);
>                 if (ret)
> -                       return;
> +                       return 0;
>
>                 pre_div =3D lpg_pre_divs[FIELD_GET(PWM_FREQ_PRE_DIV_MASK,=
 val)];
>                 m =3D FIELD_GET(PWM_FREQ_EXP_MASK, val);
>
>                 ret =3D regmap_bulk_read(lpg->map, chan->base + PWM_VALUE=
_REG, &pwm_value, sizeof(pwm_value));
>                 if (ret)
> -                       return;
> +                       return 0;
>
>                 state->period =3D DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * LP=
G_RESOLUTION * pre_div * (1 << m), refclk);
>                 state->duty_cycle =3D DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC =
* pwm_value * pre_div * (1 << m), refclk);
> @@ -1006,13 +1006,15 @@ static void lpg_pwm_get_state(struct pwm_chip *ch=
ip, struct pwm_device *pwm,
>
>         ret =3D regmap_read(lpg->map, chan->base + PWM_ENABLE_CONTROL_REG=
, &val);
>         if (ret)
> -               return;
> +               return 0;
>
>         state->enabled =3D FIELD_GET(LPG_ENABLE_CONTROL_OUTPUT, val);
>         state->polarity =3D PWM_POLARITY_NORMAL;
>
>         if (state->duty_cycle > state->period)
>                 state->duty_cycle =3D state->period;
> +
> +       return 0;
>  }
>
>  static const struct pwm_ops lpg_pwm_ops =3D {
> diff --git a/drivers/pwm/pwm-atmel.c b/drivers/pwm/pwm-atmel.c
> index 8e00a4286145..cdbc23649032 100644
> --- a/drivers/pwm/pwm-atmel.c
> +++ b/drivers/pwm/pwm-atmel.c
> @@ -356,8 +356,8 @@ static int atmel_pwm_apply(struct pwm_chip *chip, str=
uct pwm_device *pwm,
>         return 0;
>  }
>
> -static void atmel_pwm_get_state(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> -                               struct pwm_state *state)
> +static int atmel_pwm_get_state(struct pwm_chip *chip, struct pwm_device =
*pwm,
> +                              struct pwm_state *state)
>  {
>         struct atmel_pwm_chip *atmel_pwm =3D to_atmel_pwm_chip(chip);
>         u32 sr, cmr;
> @@ -396,6 +396,8 @@ static void atmel_pwm_get_state(struct pwm_chip *chip=
, struct pwm_device *pwm,
>                 state->polarity =3D PWM_POLARITY_INVERSED;
>         else
>                 state->polarity =3D PWM_POLARITY_NORMAL;
> +
> +       return 0;
>  }
>
>  static const struct pwm_ops atmel_pwm_ops =3D {
> diff --git a/drivers/pwm/pwm-bcm-iproc.c b/drivers/pwm/pwm-bcm-iproc.c
> index 7251037d4dd5..97ec131eb7c1 100644
> --- a/drivers/pwm/pwm-bcm-iproc.c
> +++ b/drivers/pwm/pwm-bcm-iproc.c
> @@ -68,8 +68,8 @@ static void iproc_pwmc_disable(struct iproc_pwmc *ip, u=
nsigned int channel)
>         ndelay(400);
>  }
>
> -static void iproc_pwmc_get_state(struct pwm_chip *chip, struct pwm_devic=
e *pwm,
> -                                struct pwm_state *state)
> +static int iproc_pwmc_get_state(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> +                               struct pwm_state *state)
>  {
>         struct iproc_pwmc *ip =3D to_iproc_pwmc(chip);
>         u64 tmp, multi, rate;
> @@ -91,7 +91,7 @@ static void iproc_pwmc_get_state(struct pwm_chip *chip,=
 struct pwm_device *pwm,
>         if (rate =3D=3D 0) {
>                 state->period =3D 0;
>                 state->duty_cycle =3D 0;
> -               return;
> +               return 0;
>         }
>
>         value =3D readl(ip->base + IPROC_PWM_PRESCALE_OFFSET);
> @@ -107,6 +107,8 @@ static void iproc_pwmc_get_state(struct pwm_chip *chi=
p, struct pwm_device *pwm,
>         value =3D readl(ip->base + IPROC_PWM_DUTY_CYCLE_OFFSET(pwm->hwpwm=
));
>         tmp =3D (value & IPROC_PWM_PERIOD_MAX) * multi;
>         state->duty_cycle =3D div64_u64(tmp, rate);
> +
> +       return 0;
>  }
>
>  static int iproc_pwmc_apply(struct pwm_chip *chip, struct pwm_device *pw=
m,
> diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
> index 7b357d1cf642..4099850117ba 100644
> --- a/drivers/pwm/pwm-crc.c
> +++ b/drivers/pwm/pwm-crc.c
> @@ -121,8 +121,8 @@ static int crc_pwm_apply(struct pwm_chip *chip, struc=
t pwm_device *pwm,
>         return 0;
>  }
>
> -static void crc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *=
pwm,
> -                             struct pwm_state *state)
> +static int crc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *p=
wm,
> +                            struct pwm_state *state)
>  {
>         struct crystalcove_pwm *crc_pwm =3D to_crc_pwm(chip);
>         struct device *dev =3D crc_pwm->chip.dev;
> @@ -132,13 +132,13 @@ static void crc_pwm_get_state(struct pwm_chip *chip=
, struct pwm_device *pwm,
>         error =3D regmap_read(crc_pwm->regmap, PWM0_CLK_DIV, &clk_div_reg=
);
>         if (error) {
>                 dev_err(dev, "Error reading PWM0_CLK_DIV %d\n", error);
> -               return;
> +               return 0;
>         }
>
>         error =3D regmap_read(crc_pwm->regmap, PWM0_DUTY_CYCLE, &duty_cyc=
le_reg);
>         if (error) {
>                 dev_err(dev, "Error reading PWM0_DUTY_CYCLE %d\n", error)=
;
> -               return;
> +               return 0;
>         }
>
>         clk_div =3D (clk_div_reg & ~PWM_OUTPUT_ENABLE) + 1;
> @@ -149,6 +149,8 @@ static void crc_pwm_get_state(struct pwm_chip *chip, =
struct pwm_device *pwm,
>                 DIV_ROUND_UP_ULL(duty_cycle_reg * state->period, PWM_MAX_=
LEVEL);
>         state->polarity =3D PWM_POLARITY_NORMAL;
>         state->enabled =3D !!(clk_div_reg & PWM_OUTPUT_ENABLE);
> +
> +       return 0;
>  }
>
>  static const struct pwm_ops crc_pwm_ops =3D {
> diff --git a/drivers/pwm/pwm-cros-ec.c b/drivers/pwm/pwm-cros-ec.c
> index 7f10f56c3eb6..11684edc0620 100644
> --- a/drivers/pwm/pwm-cros-ec.c
> +++ b/drivers/pwm/pwm-cros-ec.c
> @@ -183,8 +183,8 @@ static int cros_ec_pwm_apply(struct pwm_chip *chip, s=
truct pwm_device *pwm,
>         return 0;
>  }
>
> -static void cros_ec_pwm_get_state(struct pwm_chip *chip, struct pwm_devi=
ce *pwm,
> -                                 struct pwm_state *state)
> +static int cros_ec_pwm_get_state(struct pwm_chip *chip, struct pwm_devic=
e *pwm,
> +                                struct pwm_state *state)
>  {
>         struct cros_ec_pwm_device *ec_pwm =3D pwm_to_cros_ec_pwm(chip);
>         struct cros_ec_pwm *channel =3D pwm_get_chip_data(pwm);
> @@ -193,7 +193,7 @@ static void cros_ec_pwm_get_state(struct pwm_chip *ch=
ip, struct pwm_device *pwm,
>         ret =3D cros_ec_pwm_get_duty(ec_pwm, pwm->hwpwm);
>         if (ret < 0) {
>                 dev_err(chip->dev, "error getting initial duty: %d\n", re=
t);
> -               return;
> +               return 0;
>         }
>
>         state->enabled =3D (ret > 0);
> @@ -212,6 +212,8 @@ static void cros_ec_pwm_get_state(struct pwm_chip *ch=
ip, struct pwm_device *pwm,
>                 state->duty_cycle =3D channel->duty_cycle;
>         else
>                 state->duty_cycle =3D ret;
> +
> +       return 0;
>  }
>
>  static struct pwm_device *
> diff --git a/drivers/pwm/pwm-dwc.c b/drivers/pwm/pwm-dwc.c
> index 7568300bb11e..bd2308812096 100644
> --- a/drivers/pwm/pwm-dwc.c
> +++ b/drivers/pwm/pwm-dwc.c
> @@ -163,8 +163,8 @@ static int dwc_pwm_apply(struct pwm_chip *chip, struc=
t pwm_device *pwm,
>         return 0;
>  }
>
> -static void dwc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *=
pwm,
> -                             struct pwm_state *state)
> +static int dwc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *p=
wm,
> +                            struct pwm_state *state)
>  {
>         struct dwc_pwm *dwc =3D to_dwc_pwm(chip);
>         u64 duty, period;
> @@ -188,6 +188,8 @@ static void dwc_pwm_get_state(struct pwm_chip *chip, =
struct pwm_device *pwm,
>         state->polarity =3D PWM_POLARITY_INVERSED;
>
>         pm_runtime_put_sync(chip->dev);
> +
> +       return 0;
>  }
>
>  static const struct pwm_ops dwc_pwm_ops =3D {
> diff --git a/drivers/pwm/pwm-hibvt.c b/drivers/pwm/pwm-hibvt.c
> index 333f1b18ff4e..12c05c155cab 100644
> --- a/drivers/pwm/pwm-hibvt.c
> +++ b/drivers/pwm/pwm-hibvt.c
> @@ -128,8 +128,8 @@ static void hibvt_pwm_set_polarity(struct pwm_chip *c=
hip,
>                                 PWM_POLARITY_MASK, (0x0 << PWM_POLARITY_S=
HIFT));
>  }
>
> -static void hibvt_pwm_get_state(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> -                               struct pwm_state *state)
> +static int hibvt_pwm_get_state(struct pwm_chip *chip, struct pwm_device =
*pwm,
> +                              struct pwm_state *state)
>  {
>         struct hibvt_pwm_chip *hi_pwm_chip =3D to_hibvt_pwm_chip(chip);
>         void __iomem *base;
> @@ -146,6 +146,8 @@ static void hibvt_pwm_get_state(struct pwm_chip *chip=
, struct pwm_device *pwm,
>
>         value =3D readl(base + PWM_CTRL_ADDR(pwm->hwpwm));
>         state->enabled =3D (PWM_ENABLE_MASK & value);
> +
> +       return 0;
>  }
>
>  static int hibvt_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm=
,
> diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
> index e5e7b7c339a8..ed1aad96fff0 100644
> --- a/drivers/pwm/pwm-imx-tpm.c
> +++ b/drivers/pwm/pwm-imx-tpm.c
> @@ -132,9 +132,9 @@ static int pwm_imx_tpm_round_state(struct pwm_chip *c=
hip,
>         return 0;
>  }
>
> -static void pwm_imx_tpm_get_state(struct pwm_chip *chip,
> -                                 struct pwm_device *pwm,
> -                                 struct pwm_state *state)
> +static int pwm_imx_tpm_get_state(struct pwm_chip *chip,
> +                                struct pwm_device *pwm,
> +                                struct pwm_state *state)
>  {
>         struct imx_tpm_pwm_chip *tpm =3D to_imx_tpm_pwm_chip(chip);
>         u32 rate, val, prescale;
> @@ -164,6 +164,8 @@ static void pwm_imx_tpm_get_state(struct pwm_chip *ch=
ip,
>
>         /* get channel status */
>         state->enabled =3D FIELD_GET(PWM_IMX_TPM_CnSC_ELS, val) ? true : =
false;
> +
> +       return 0;
>  }
>
>  /* this function is supposed to be called with mutex hold */
> diff --git a/drivers/pwm/pwm-imx27.c b/drivers/pwm/pwm-imx27.c
> index ea91a2f81a9f..3a22c2fddc45 100644
> --- a/drivers/pwm/pwm-imx27.c
> +++ b/drivers/pwm/pwm-imx27.c
> @@ -118,8 +118,8 @@ static void pwm_imx27_clk_disable_unprepare(struct pw=
m_imx27_chip *imx)
>         clk_disable_unprepare(imx->clk_ipg);
>  }
>
> -static void pwm_imx27_get_state(struct pwm_chip *chip,
> -                               struct pwm_device *pwm, struct pwm_state =
*state)
> +static int pwm_imx27_get_state(struct pwm_chip *chip,
> +                              struct pwm_device *pwm, struct pwm_state *=
state)
>  {
>         struct pwm_imx27_chip *imx =3D to_pwm_imx27_chip(chip);
>         u32 period, prescaler, pwm_clk, val;
> @@ -128,7 +128,7 @@ static void pwm_imx27_get_state(struct pwm_chip *chip=
,
>
>         ret =3D pwm_imx27_clk_prepare_enable(imx);
>         if (ret < 0)
> -               return;
> +               return 0;
>
>         val =3D readl(imx->mmio_base + MX3_PWMCR);
>
> @@ -170,6 +170,8 @@ static void pwm_imx27_get_state(struct pwm_chip *chip=
,
>         state->duty_cycle =3D DIV_ROUND_UP_ULL(tmp, pwm_clk);
>
>         pwm_imx27_clk_disable_unprepare(imx);
> +
> +       return 0;
>  }
>
>  static void pwm_imx27_sw_reset(struct pwm_chip *chip)
> diff --git a/drivers/pwm/pwm-intel-lgm.c b/drivers/pwm/pwm-intel-lgm.c
> index b66c35074087..0cd7dd548e82 100644
> --- a/drivers/pwm/pwm-intel-lgm.c
> +++ b/drivers/pwm/pwm-intel-lgm.c
> @@ -86,8 +86,8 @@ static int lgm_pwm_apply(struct pwm_chip *chip, struct =
pwm_device *pwm,
>         return lgm_pwm_enable(chip, 1);
>  }
>
> -static void lgm_pwm_get_state(struct pwm_chip *chip, struct pwm_device *=
pwm,
> -                             struct pwm_state *state)
> +static int lgm_pwm_get_state(struct pwm_chip *chip, struct pwm_device *p=
wm,
> +                            struct pwm_state *state)
>  {
>         struct lgm_pwm_chip *pc =3D to_lgm_pwm_chip(chip);
>         u32 duty, val;
> @@ -100,6 +100,8 @@ static void lgm_pwm_get_state(struct pwm_chip *chip, =
struct pwm_device *pwm,
>         regmap_read(pc->regmap, LGM_PWM_FAN_CON0, &val);
>         duty =3D FIELD_GET(LGM_PWM_FAN_DC_MSK, val);
>         state->duty_cycle =3D DIV_ROUND_UP(duty * pc->period, LGM_PWM_MAX=
_DUTY_CYCLE);
> +
> +       return 0;
>  }
>
>  static const struct pwm_ops lgm_pwm_ops =3D {
> diff --git a/drivers/pwm/pwm-iqs620a.c b/drivers/pwm/pwm-iqs620a.c
> index 54bd95a5cab0..15aae53db5ab 100644
> --- a/drivers/pwm/pwm-iqs620a.c
> +++ b/drivers/pwm/pwm-iqs620a.c
> @@ -104,8 +104,8 @@ static int iqs620_pwm_apply(struct pwm_chip *chip, st=
ruct pwm_device *pwm,
>         return ret;
>  }
>
> -static void iqs620_pwm_get_state(struct pwm_chip *chip, struct pwm_devic=
e *pwm,
> -                                struct pwm_state *state)
> +static int iqs620_pwm_get_state(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> +                               struct pwm_state *state)
>  {
>         struct iqs620_pwm_private *iqs620_pwm;
>
> @@ -126,6 +126,8 @@ static void iqs620_pwm_get_state(struct pwm_chip *chi=
p, struct pwm_device *pwm,
>         mutex_unlock(&iqs620_pwm->lock);
>
>         state->period =3D IQS620_PWM_PERIOD_NS;
> +
> +       return 0;
>  }
>
>  static int iqs620_pwm_notifier(struct notifier_block *notifier,
> diff --git a/drivers/pwm/pwm-keembay.c b/drivers/pwm/pwm-keembay.c
> index 733811b05721..ac02d8bb4a0b 100644
> --- a/drivers/pwm/pwm-keembay.c
> +++ b/drivers/pwm/pwm-keembay.c
> @@ -89,8 +89,8 @@ static void keembay_pwm_disable(struct keembay_pwm *pri=
v, int ch)
>                                 KMB_PWM_LEADIN_OFFSET(ch));
>  }
>
> -static void keembay_pwm_get_state(struct pwm_chip *chip, struct pwm_devi=
ce *pwm,
> -                                 struct pwm_state *state)
> +static int keembay_pwm_get_state(struct pwm_chip *chip, struct pwm_devic=
e *pwm,
> +                                struct pwm_state *state)
>  {
>         struct keembay_pwm *priv =3D to_keembay_pwm_dev(chip);
>         unsigned long long high, low;
> @@ -113,6 +113,8 @@ static void keembay_pwm_get_state(struct pwm_chip *ch=
ip, struct pwm_device *pwm,
>         state->duty_cycle =3D DIV_ROUND_UP_ULL(high, clk_rate);
>         state->period =3D DIV_ROUND_UP_ULL(high + low, clk_rate);
>         state->polarity =3D PWM_POLARITY_NORMAL;
> +
> +       return 0;
>  }
>
>  static int keembay_pwm_apply(struct pwm_chip *chip, struct pwm_device *p=
wm,
> diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
> index accdef5dd58e..81ac297b8ba5 100644
> --- a/drivers/pwm/pwm-lpss.c
> +++ b/drivers/pwm/pwm-lpss.c
> @@ -205,8 +205,8 @@ static int pwm_lpss_apply(struct pwm_chip *chip, stru=
ct pwm_device *pwm,
>         return ret;
>  }
>
> -static void pwm_lpss_get_state(struct pwm_chip *chip, struct pwm_device =
*pwm,
> -                              struct pwm_state *state)
> +static int pwm_lpss_get_state(struct pwm_chip *chip, struct pwm_device *=
pwm,
> +                             struct pwm_state *state)
>  {
>         struct pwm_lpss_chip *lpwm =3D to_lpwm(chip);
>         unsigned long base_unit_range;
> @@ -236,6 +236,8 @@ static void pwm_lpss_get_state(struct pwm_chip *chip,=
 struct pwm_device *pwm,
>         state->enabled =3D !!(ctrl & PWM_ENABLE);
>
>         pm_runtime_put(chip->dev);
> +
> +       return 0;
>  }
>
>  static const struct pwm_ops pwm_lpss_ops =3D {
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 57112f438c6d..16d79ca5d8f5 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -318,8 +318,8 @@ static unsigned int meson_pwm_cnt_to_ns(struct pwm_ch=
ip *chip,
>         return cnt * fin_ns * (channel->pre_div + 1);
>  }
>
> -static void meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> -                               struct pwm_state *state)
> +static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device =
*pwm,
> +                              struct pwm_state *state)
>  {
>         struct meson_pwm *meson =3D to_meson_pwm(chip);
>         struct meson_pwm_channel_data *channel_data;
> @@ -327,7 +327,7 @@ static void meson_pwm_get_state(struct pwm_chip *chip=
, struct pwm_device *pwm,
>         u32 value, tmp;
>
>         if (!state)
> -               return;
> +               return 0;
>
>         channel =3D &meson->channels[pwm->hwpwm];
>         channel_data =3D &meson_pwm_per_channel_data[pwm->hwpwm];
> @@ -357,6 +357,8 @@ static void meson_pwm_get_state(struct pwm_chip *chip=
, struct pwm_device *pwm,
>                 state->period =3D 0;
>                 state->duty_cycle =3D 0;
>         }
> +
> +       return 0;
>  }
>
>  static const struct pwm_ops meson_pwm_ops =3D {
> diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
> index c605013e4114..9a6bb334a31b 100644
> --- a/drivers/pwm/pwm-mtk-disp.c
> +++ b/drivers/pwm/pwm-mtk-disp.c
> @@ -172,9 +172,9 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, =
struct pwm_device *pwm,
>         return 0;
>  }
>
> -static void mtk_disp_pwm_get_state(struct pwm_chip *chip,
> -                                  struct pwm_device *pwm,
> -                                  struct pwm_state *state)
> +static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
> +                                 struct pwm_device *pwm,
> +                                 struct pwm_state *state)
>  {
>         struct mtk_disp_pwm *mdp =3D to_mtk_disp_pwm(chip);
>         u64 rate, period, high_width;
> @@ -184,14 +184,14 @@ static void mtk_disp_pwm_get_state(struct pwm_chip =
*chip,
>         err =3D clk_prepare_enable(mdp->clk_main);
>         if (err < 0) {
>                 dev_err(chip->dev, "Can't enable mdp->clk_main: %pe\n", E=
RR_PTR(err));
> -               return;
> +               return 0;
>         }
>
>         err =3D clk_prepare_enable(mdp->clk_mm);
>         if (err < 0) {
>                 dev_err(chip->dev, "Can't enable mdp->clk_mm: %pe\n", ERR=
_PTR(err));
>                 clk_disable_unprepare(mdp->clk_main);
> -               return;
> +               return 0;
>         }
>
>         rate =3D clk_get_rate(mdp->clk_main);
> @@ -211,6 +211,8 @@ static void mtk_disp_pwm_get_state(struct pwm_chip *c=
hip,
>         state->polarity =3D PWM_POLARITY_NORMAL;
>         clk_disable_unprepare(mdp->clk_mm);
>         clk_disable_unprepare(mdp->clk_main);
> +
> +       return 0;
>  }
>
>  static const struct pwm_ops mtk_disp_pwm_ops =3D {
> diff --git a/drivers/pwm/pwm-pca9685.c b/drivers/pwm/pwm-pca9685.c
> index f230c10d28bb..41be244e7dd3 100644
> --- a/drivers/pwm/pwm-pca9685.c
> +++ b/drivers/pwm/pwm-pca9685.c
> @@ -431,8 +431,8 @@ static int pca9685_pwm_apply(struct pwm_chip *chip, s=
truct pwm_device *pwm,
>         return ret;
>  }
>
> -static void pca9685_pwm_get_state(struct pwm_chip *chip, struct pwm_devi=
ce *pwm,
> -                                 struct pwm_state *state)
> +static int pca9685_pwm_get_state(struct pwm_chip *chip, struct pwm_devic=
e *pwm,
> +                                struct pwm_state *state)
>  {
>         struct pca9685 *pca =3D to_pca(chip);
>         unsigned long long duty;
> @@ -458,12 +458,14 @@ static void pca9685_pwm_get_state(struct pwm_chip *=
chip, struct pwm_device *pwm,
>                  */
>                 state->duty_cycle =3D 0;
>                 state->enabled =3D false;
> -               return;
> +               return 0;
>         }
>
>         state->enabled =3D true;
>         duty =3D pca9685_pwm_get_duty(pca, pwm->hwpwm);
>         state->duty_cycle =3D DIV_ROUND_DOWN_ULL(duty * state->period, PC=
A9685_COUNTER_RANGE);
> +
> +       return 0;
>  }
>
>  static int pca9685_pwm_request(struct pwm_chip *chip, struct pwm_device =
*pwm)
> diff --git a/drivers/pwm/pwm-raspberrypi-poe.c b/drivers/pwm/pwm-raspberr=
ypi-poe.c
> index 6ff73029f367..2939b71a7ba7 100644
> --- a/drivers/pwm/pwm-raspberrypi-poe.c
> +++ b/drivers/pwm/pwm-raspberrypi-poe.c
> @@ -82,9 +82,9 @@ static int raspberrypi_pwm_get_property(struct rpi_firm=
ware *firmware,
>         return 0;
>  }
>
> -static void raspberrypi_pwm_get_state(struct pwm_chip *chip,
> -                                     struct pwm_device *pwm,
> -                                     struct pwm_state *state)
> +static int raspberrypi_pwm_get_state(struct pwm_chip *chip,
> +                                    struct pwm_device *pwm,
> +                                    struct pwm_state *state)
>  {
>         struct raspberrypi_pwm *rpipwm =3D raspberrypi_pwm_from_chip(chip=
);
>
> @@ -93,6 +93,8 @@ static void raspberrypi_pwm_get_state(struct pwm_chip *=
chip,
>                                          RPI_PWM_MAX_DUTY);
>         state->enabled =3D !!(rpipwm->duty_cycle);
>         state->polarity =3D PWM_POLARITY_NORMAL;
> +
> +       return 0;
>  }
>
>  static int raspberrypi_pwm_apply(struct pwm_chip *chip, struct pwm_devic=
e *pwm,

For the pwm-raspberrypi-poe part:
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> diff --git a/drivers/pwm/pwm-rockchip.c b/drivers/pwm/pwm-rockchip.c
> index a5af859217c1..3ec7d1756903 100644
> --- a/drivers/pwm/pwm-rockchip.c
> +++ b/drivers/pwm/pwm-rockchip.c
> @@ -57,9 +57,9 @@ static inline struct rockchip_pwm_chip *to_rockchip_pwm=
_chip(struct pwm_chip *c)
>         return container_of(c, struct rockchip_pwm_chip, chip);
>  }
>
> -static void rockchip_pwm_get_state(struct pwm_chip *chip,
> -                                  struct pwm_device *pwm,
> -                                  struct pwm_state *state)
> +static int rockchip_pwm_get_state(struct pwm_chip *chip,
> +                                 struct pwm_device *pwm,
> +                                 struct pwm_state *state)
>  {
>         struct rockchip_pwm_chip *pc =3D to_rockchip_pwm_chip(chip);
>         u32 enable_conf =3D pc->data->enable_conf;
> @@ -70,11 +70,11 @@ static void rockchip_pwm_get_state(struct pwm_chip *c=
hip,
>
>         ret =3D clk_enable(pc->pclk);
>         if (ret)
> -               return;
> +               return 0;
>
>         ret =3D clk_enable(pc->clk);
>         if (ret)
> -               return;
> +               return 0;
>
>         clk_rate =3D clk_get_rate(pc->clk);
>
> @@ -96,6 +96,8 @@ static void rockchip_pwm_get_state(struct pwm_chip *chi=
p,
>
>         clk_disable(pc->clk);
>         clk_disable(pc->pclk);
> +
> +       return 0;
>  }
>
>  static void rockchip_pwm_config(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> index 2d4fa5e5fdd4..1e9870aa29e9 100644
> --- a/drivers/pwm/pwm-sifive.c
> +++ b/drivers/pwm/pwm-sifive.c
> @@ -105,8 +105,8 @@ static void pwm_sifive_update_clock(struct pwm_sifive=
_ddata *ddata,
>                 "New real_period =3D %u ns\n", ddata->real_period);
>  }
>
> -static void pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_devic=
e *pwm,
> -                                struct pwm_state *state)
> +static int pwm_sifive_get_state(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> +                               struct pwm_state *state)
>  {
>         struct pwm_sifive_ddata *ddata =3D pwm_sifive_chip_to_ddata(chip)=
;
>         u32 duty, val;
> @@ -123,6 +123,8 @@ static void pwm_sifive_get_state(struct pwm_chip *chi=
p, struct pwm_device *pwm,
>         state->duty_cycle =3D
>                 (u64)duty * ddata->real_period >> PWM_SIFIVE_CMPWIDTH;
>         state->polarity =3D PWM_POLARITY_INVERSED;
> +
> +       return 0;
>  }
>
>  static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pw=
m,
> diff --git a/drivers/pwm/pwm-sl28cpld.c b/drivers/pwm/pwm-sl28cpld.c
> index 589aeaaa6ac8..e64900ad4ba1 100644
> --- a/drivers/pwm/pwm-sl28cpld.c
> +++ b/drivers/pwm/pwm-sl28cpld.c
> @@ -87,9 +87,9 @@ struct sl28cpld_pwm {
>  #define sl28cpld_pwm_from_chip(_chip) \
>         container_of(_chip, struct sl28cpld_pwm, pwm_chip)
>
> -static void sl28cpld_pwm_get_state(struct pwm_chip *chip,
> -                                  struct pwm_device *pwm,
> -                                  struct pwm_state *state)
> +static int sl28cpld_pwm_get_state(struct pwm_chip *chip,
> +                                 struct pwm_device *pwm,
> +                                 struct pwm_state *state)
>  {
>         struct sl28cpld_pwm *priv =3D sl28cpld_pwm_from_chip(chip);
>         unsigned int reg;
> @@ -115,6 +115,8 @@ static void sl28cpld_pwm_get_state(struct pwm_chip *c=
hip,
>          * the PWM core.
>          */
>         state->duty_cycle =3D min(state->duty_cycle, state->period);
> +
> +       return 0;
>  }
>
>  static int sl28cpld_pwm_apply(struct pwm_chip *chip, struct pwm_device *=
pwm,
> diff --git a/drivers/pwm/pwm-sprd.c b/drivers/pwm/pwm-sprd.c
> index 7004f55bbf11..bda8bc5af976 100644
> --- a/drivers/pwm/pwm-sprd.c
> +++ b/drivers/pwm/pwm-sprd.c
> @@ -65,8 +65,8 @@ static void sprd_pwm_write(struct sprd_pwm_chip *spc, u=
32 hwid,
>         writel_relaxed(val, spc->base + offset);
>  }
>
> -static void sprd_pwm_get_state(struct pwm_chip *chip, struct pwm_device =
*pwm,
> -                              struct pwm_state *state)
> +static int sprd_pwm_get_state(struct pwm_chip *chip, struct pwm_device *=
pwm,
> +                             struct pwm_state *state)
>  {
>         struct sprd_pwm_chip *spc =3D
>                 container_of(chip, struct sprd_pwm_chip, chip);
> @@ -83,7 +83,7 @@ static void sprd_pwm_get_state(struct pwm_chip *chip, s=
truct pwm_device *pwm,
>         if (ret) {
>                 dev_err(spc->dev, "failed to enable pwm%u clocks\n",
>                         pwm->hwpwm);
> -               return;
> +               return 0;
>         }
>
>         val =3D sprd_pwm_read(spc, pwm->hwpwm, SPRD_PWM_ENABLE);
> @@ -113,6 +113,8 @@ static void sprd_pwm_get_state(struct pwm_chip *chip,=
 struct pwm_device *pwm,
>         /* Disable PWM clocks if the PWM channel is not in enable state. =
*/
>         if (!state->enabled)
>                 clk_bulk_disable_unprepare(SPRD_PWM_CHN_CLKS_NUM, chn->cl=
ks);
> +
> +       return 0;
>  }
>
>  static int sprd_pwm_config(struct sprd_pwm_chip *spc, struct pwm_device =
*pwm,
> diff --git a/drivers/pwm/pwm-stm32-lp.c b/drivers/pwm/pwm-stm32-lp.c
> index 3115abb3f52a..39364c52cfe4 100644
> --- a/drivers/pwm/pwm-stm32-lp.c
> +++ b/drivers/pwm/pwm-stm32-lp.c
> @@ -157,9 +157,9 @@ static int stm32_pwm_lp_apply(struct pwm_chip *chip, =
struct pwm_device *pwm,
>         return ret;
>  }
>
> -static void stm32_pwm_lp_get_state(struct pwm_chip *chip,
> -                                  struct pwm_device *pwm,
> -                                  struct pwm_state *state)
> +static int stm32_pwm_lp_get_state(struct pwm_chip *chip,
> +                                 struct pwm_device *pwm,
> +                                 struct pwm_state *state)
>  {
>         struct stm32_pwm_lp *priv =3D to_stm32_pwm_lp(chip);
>         unsigned long rate =3D clk_get_rate(priv->clk);
> @@ -185,6 +185,8 @@ static void stm32_pwm_lp_get_state(struct pwm_chip *c=
hip,
>         tmp =3D prd - val;
>         tmp =3D (tmp << presc) * NSEC_PER_SEC;
>         state->duty_cycle =3D DIV_ROUND_CLOSEST_ULL(tmp, rate);
> +
> +       return 0;
>  }
>
>  static const struct pwm_ops stm32_pwm_lp_ops =3D {
> diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
> index c8445b0a3339..37d75e252d4e 100644
> --- a/drivers/pwm/pwm-sun4i.c
> +++ b/drivers/pwm/pwm-sun4i.c
> @@ -108,9 +108,9 @@ static inline void sun4i_pwm_writel(struct sun4i_pwm_=
chip *chip,
>         writel(val, chip->base + offset);
>  }
>
> -static void sun4i_pwm_get_state(struct pwm_chip *chip,
> -                               struct pwm_device *pwm,
> -                               struct pwm_state *state)
> +static int sun4i_pwm_get_state(struct pwm_chip *chip,
> +                              struct pwm_device *pwm,
> +                              struct pwm_state *state)
>  {
>         struct sun4i_pwm_chip *sun4i_pwm =3D to_sun4i_pwm_chip(chip);
>         u64 clk_rate, tmp;
> @@ -132,7 +132,7 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip=
,
>                 state->duty_cycle =3D DIV_ROUND_UP_ULL(state->period, 2);
>                 state->polarity =3D PWM_POLARITY_NORMAL;
>                 state->enabled =3D true;
> -               return;
> +               return 0;
>         }
>
>         if ((PWM_REG_PRESCAL(val, pwm->hwpwm) =3D=3D PWM_PRESCAL_MASK) &&
> @@ -142,7 +142,7 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip=
,
>                 prescaler =3D prescaler_table[PWM_REG_PRESCAL(val, pwm->h=
wpwm)];
>
>         if (prescaler =3D=3D 0)
> -               return;
> +               return 0;
>
>         if (val & BIT_CH(PWM_ACT_STATE, pwm->hwpwm))
>                 state->polarity =3D PWM_POLARITY_NORMAL;
> @@ -162,6 +162,8 @@ static void sun4i_pwm_get_state(struct pwm_chip *chip=
,
>
>         tmp =3D (u64)prescaler * NSEC_PER_SEC * PWM_REG_PRD(val);
>         state->period =3D DIV_ROUND_CLOSEST_ULL(tmp, clk_rate);
> +
> +       return 0;
>  }
>
>  static int sun4i_pwm_calculate(struct sun4i_pwm_chip *sun4i_pwm,
> diff --git a/drivers/pwm/pwm-sunplus.c b/drivers/pwm/pwm-sunplus.c
> index e776fd16512d..d6ebe9f03b35 100644
> --- a/drivers/pwm/pwm-sunplus.c
> +++ b/drivers/pwm/pwm-sunplus.c
> @@ -124,8 +124,8 @@ static int sunplus_pwm_apply(struct pwm_chip *chip, s=
truct pwm_device *pwm,
>         return 0;
>  }
>
> -static void sunplus_pwm_get_state(struct pwm_chip *chip, struct pwm_devi=
ce *pwm,
> -                                 struct pwm_state *state)
> +static int sunplus_pwm_get_state(struct pwm_chip *chip, struct pwm_devic=
e *pwm,
> +                                struct pwm_state *state)
>  {
>         struct sunplus_pwm *priv =3D to_sunplus_pwm(chip);
>         u32 mode0, dd_freq, duty;
> @@ -155,6 +155,8 @@ static void sunplus_pwm_get_state(struct pwm_chip *ch=
ip, struct pwm_device *pwm,
>         }
>
>         state->polarity =3D PWM_POLARITY_NORMAL;
> +
> +       return 0;
>  }
>
>  static const struct pwm_ops sunplus_pwm_ops =3D {
> diff --git a/drivers/pwm/pwm-visconti.c b/drivers/pwm/pwm-visconti.c
> index 927c4cbb1daf..e3fb79b3e2a7 100644
> --- a/drivers/pwm/pwm-visconti.c
> +++ b/drivers/pwm/pwm-visconti.c
> @@ -103,8 +103,8 @@ static int visconti_pwm_apply(struct pwm_chip *chip, =
struct pwm_device *pwm,
>         return 0;
>  }
>
> -static void visconti_pwm_get_state(struct pwm_chip *chip, struct pwm_dev=
ice *pwm,
> -                                  struct pwm_state *state)
> +static int visconti_pwm_get_state(struct pwm_chip *chip, struct pwm_devi=
ce *pwm,
> +                                 struct pwm_state *state)
>  {
>         struct visconti_pwm_chip *priv =3D visconti_pwm_from_chip(chip);
>         u32 period, duty, pwmc0, pwmc0_clk;
> @@ -122,6 +122,8 @@ static void visconti_pwm_get_state(struct pwm_chip *c=
hip, struct pwm_device *pwm
>                 state->polarity =3D PWM_POLARITY_NORMAL;
>
>         state->enabled =3D true;
> +
> +       return 0;
>  }
>
>  static const struct pwm_ops visconti_pwm_ops =3D {
> diff --git a/drivers/pwm/pwm-xilinx.c b/drivers/pwm/pwm-xilinx.c
> index 4dab2b86c427..f7a50fdcd9a5 100644
> --- a/drivers/pwm/pwm-xilinx.c
> +++ b/drivers/pwm/pwm-xilinx.c
> @@ -169,9 +169,9 @@ static int xilinx_pwm_apply(struct pwm_chip *chip, st=
ruct pwm_device *unused,
>         return 0;
>  }
>
> -static void xilinx_pwm_get_state(struct pwm_chip *chip,
> -                                struct pwm_device *unused,
> -                                struct pwm_state *state)
> +static int xilinx_pwm_get_state(struct pwm_chip *chip,
> +                               struct pwm_device *unused,
> +                               struct pwm_state *state)
>  {
>         struct xilinx_timer_priv *priv =3D xilinx_pwm_chip_to_priv(chip);
>         u32 tlr0, tlr1, tcsr0, tcsr1;
> @@ -191,6 +191,8 @@ static void xilinx_pwm_get_state(struct pwm_chip *chi=
p,
>          */
>         if (state->period =3D=3D state->duty_cycle)
>                 state->duty_cycle =3D 0;
> +
> +       return 0;
>  }
>
>  static const struct pwm_ops xilinx_pwm_ops =3D {
> diff --git a/include/linux/pwm.h b/include/linux/pwm.h
> index d70c6e5a839d..4de09163c968 100644
> --- a/include/linux/pwm.h
> +++ b/include/linux/pwm.h
> @@ -276,8 +276,8 @@ struct pwm_ops {
>                        struct pwm_capture *result, unsigned long timeout)=
;
>         int (*apply)(struct pwm_chip *chip, struct pwm_device *pwm,
>                      const struct pwm_state *state);
> -       void (*get_state)(struct pwm_chip *chip, struct pwm_device *pwm,
> -                         struct pwm_state *state);
> +       int (*get_state)(struct pwm_chip *chip, struct pwm_device *pwm,
> +                        struct pwm_state *state);
>         struct module *owner;
>  };
>
> --
> 2.38.1
>
