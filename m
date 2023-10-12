Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5B47C62C5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 04:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235225AbjJLCc6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 22:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234085AbjJLCc5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 22:32:57 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6F3BC0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 19:32:53 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-27d1aee5aa1so365687a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 19:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697077973; x=1697682773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/BfWdzO6TUYYoH2dLnUgWg2810nbndsp7eZ4SIZ5Is=;
        b=eZiqCW5yhsh+U7GID/gDguT2qsuwIIDBfSCGNcrhRi7P4apAredaZFU0JrqthfAzRS
         hFafgt7NCbZVHFz5dHjggjQvHYssE5/0Z7XZjfuI5Yl/V9+P58JM6SdBMdgeM7GhHokU
         xF39PRzIMpfEy8QgL5NoV1pC/jIGx02iqlmDX3CEhrZLvtvjZzzUREcdb8DPqiZQm39G
         pyBUCmlue6q5VivJJOLRIO+GlIWtmSGu1eRtmU6Y/wpiqe/rhWaLAte7XdfCtOqnh+ww
         oFRGXP7enlI5Loj0zZFFXoEVSeos8HmEX2ctEHTFZEHfmJcOyMvFGCg9Pin2Pm8jFiXF
         idVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697077973; x=1697682773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/BfWdzO6TUYYoH2dLnUgWg2810nbndsp7eZ4SIZ5Is=;
        b=tpfczTxG7TtwqP53B4ALJD8+1yEmLxR5UpSSoLuXZ8mU7zUcAbYTcvkB1lSvDHs3q7
         BgnMI7yYZZbLsoHezk+ghPFhGf+gIDnLhkK+yZEccq1xGIUJGDs8UkMXq6oAwLBxI++g
         +QG7jXJaZYBwn4NWm2FTIGcgwb4hB/l4NG/Uo4AXRWCmwuisqRCnD6VCi2ae85Q1vjDH
         CQ/JLuutOouP4q5GK1oXt0ysrxqAyMd0DKM3K1SmKK+3WoG6WX/gZ0Z3W9iPAvBP0BkO
         DlOkwf3RpyIHaCzRtqHDV9d0nTSoYlyGd8LLttN/tpqQtYUt/nDsK8Z3ZE0eXl5im0EJ
         JUig==
X-Gm-Message-State: AOJu0YwhQ3coIqEfb+/CIHBZXumVTzq6WFShyDhbVfBL/A+plLR2QdDM
        SgSuIObJIrmWz8/iG+Ow85zB+Vg6ooRU7nifKrc4Qg==
X-Google-Smtp-Source: AGHT+IGmNaHQmdNmHLpCUNm8DshqGdyVNZRpOEdWeOsqhKJ/CU+XGLS5/NHBDkAhtQoPOSBBFcO1TGSujo63yAgaj4c=
X-Received: by 2002:a17:90b:78e:b0:276:78f2:5d31 with SMTP id
 l14-20020a17090b078e00b0027678f25d31mr30718952pjz.21.1697077973270; Wed, 11
 Oct 2023 19:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-16-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-16-peter.griffin@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Wed, 11 Oct 2023 21:32:41 -0500
Message-ID: <CAPLW+4njAN595m_BEXXG4ykyY=BYWKOX8dxqKSGPRi9_FSMJgQ@mail.gmail.com>
Subject: Re: [PATCH v3 15/20] watchdog: s3c2410_wdt: Add support for Google
 tensor SoCs
To:     Peter Griffin <peter.griffin@linaro.org>
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> This patch adds the compatibles and drvdata for the Google
> gs101 & gs201 SoCs found in Pixel 6 and Pixel 7 phones. Similar
> to Exynos850 it has two watchdog instances, one for each cluster
> and has some control bits in PMU registers.
>
> The watchdog IP found in gs101 SoCs also supports a few
> additional bits/features in the WTCON register which we add
> support for and an additional register detailed below.
>
> dbgack-mask - Enables masking WDT interrupt and reset request
> according to asserted DBGACK input
>
> windowed-mode - Enabled Windowed watchdog mode
>
> Windowed watchdog mode also has an additional register WTMINCNT.
> If windowed watchdog is enabled and you reload WTCNT when the
> value is greater than WTMINCNT, it prompts interrupt or reset
> request as if the watchdog time has expired.
>

A couple of thoughts in addition to what Guenter said.

From the description it looks like this patch should be split into 3 patche=
s:
  1. Add "dbgack" feature
  2. Add "windowed mode" feature
  3. Enable gsX01 support

Also, it's not clear if those features are mandatory for gsX01 wdt to
function properly, or optional? From the code it looks like both
dbgack and windowed mode will only affect gsX01 variants (because of
quirk flags), but maybe the commit message should be more clear about
that.

> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 127 ++++++++++++++++++++++++++++++---
>  1 file changed, 116 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 0b4bd883ff28..36c170047180 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -31,12 +31,14 @@
>  #define S3C2410_WTDAT          0x04
>  #define S3C2410_WTCNT          0x08
>  #define S3C2410_WTCLRINT       0x0c
> -
> +#define S3C2410_WTMINCNT       0x10
>  #define S3C2410_WTCNT_MAXCNT   0xffff
>
> -#define S3C2410_WTCON_RSTEN    (1 << 0)
> -#define S3C2410_WTCON_INTEN    (1 << 2)
> -#define S3C2410_WTCON_ENABLE   (1 << 5)
> +#define S3C2410_WTCON_RSTEN            (1 << 0)
> +#define S3C2410_WTCON_INTEN            (1 << 2)
> +#define S3C2410_WTCON_ENABLE           (1 << 5)
> +#define S3C2410_WTCON_DBGACK_MASK      (1 << 16)
> +#define S3C2410_WTCON_WINDOWED_WD      (1 << 20)

Maybe use BIT() macro here?

>
>  #define S3C2410_WTCON_DIV16    (0 << 3)
>  #define S3C2410_WTCON_DIV32    (1 << 3)
> @@ -51,6 +53,7 @@
>
>  #define S3C2410_WATCHDOG_ATBOOT                (0)
>  #define S3C2410_WATCHDOG_DEFAULT_TIME  (15)
> +#define S3C2410_WINDOW_MULTIPLIER      2
>
>  #define EXYNOS5_RST_STAT_REG_OFFSET            0x0404
>  #define EXYNOS5_WDT_DISABLE_REG_OFFSET         0x0408
> @@ -67,6 +70,13 @@
>  #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT     25
>  #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT     24
>
> +#define GS_CLUSTER0_NONCPU_OUT                 0x1220
> +#define GS_CLUSTER1_NONCPU_OUT                 0x1420
> +#define GS_CLUSTER0_NONCPU_INT_EN              0x1244
> +#define GS_CLUSTER1_NONCPU_INT_EN              0x1444
> +#define GS_CLUSTER2_NONCPU_INT_EN              0x1644
> +#define GS_RST_STAT_REG_OFFSET                 0x3B44

Please move those to the section above, where similar registers are
described for other SoCs.

> +
>  /**
>   * DOC: Quirk flags for different Samsung watchdog IP-cores
>   *
> @@ -106,6 +116,8 @@
>  #define QUIRK_HAS_PMU_RST_STAT                 (1 << 2)
>  #define QUIRK_HAS_PMU_AUTO_DISABLE             (1 << 3)
>  #define QUIRK_HAS_PMU_CNT_EN                   (1 << 4)
> +#define QUIRK_HAS_DBGACK_BIT                   (1 << 5)
> +#define QUIRK_HAS_WTMINCNT_REG                 (1 << 6)

Please also document those two quirks in the kernel-doc comment above.
Btw, the comment correctness can be checked like this:

    $ scripts/kernel-doc -v -none drivers/watchdog/s3c2410_wdt.c

or without "-none" option to see how the comment is parsed by kernel-doc.

>
>  /* These quirks require that we have a PMU register map */
>  #define QUIRKS_HAVE_PMUREG \
> @@ -263,6 +275,54 @@ static const struct s3c2410_wdt_variant drv_data_exy=
nosautov9_cl1 =3D {
>                   QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
>  };
>
> +static const struct s3c2410_wdt_variant drv_data_gs101_cl0 =3D {
> +       .mask_reset_reg =3D GS_CLUSTER0_NONCPU_INT_EN,
> +       .mask_bit =3D 2,
> +       .mask_reset_inv =3D true,
> +       .rst_stat_reg =3D GS_RST_STAT_REG_OFFSET,
> +       .rst_stat_bit =3D 0,
> +       .cnt_en_reg =3D GS_CLUSTER0_NONCPU_OUT,
> +       .cnt_en_bit =3D 8,
> +       .quirks =3D QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | Q=
UIRK_HAS_PMU_CNT_EN |

Here and further: please stick to 80 characters per line when possible.

> +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK_H=
AS_WTMINCNT_REG,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_gs101_cl1 =3D {
> +       .mask_reset_reg =3D GS_CLUSTER1_NONCPU_INT_EN,
> +       .mask_bit =3D 2,
> +       .mask_reset_inv =3D true,
> +       .rst_stat_reg =3D GS_RST_STAT_REG_OFFSET,
> +       .rst_stat_bit =3D 1,
> +       .cnt_en_reg =3D GS_CLUSTER1_NONCPU_OUT,
> +       .cnt_en_bit =3D 7,
> +       .quirks =3D QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | Q=
UIRK_HAS_PMU_CNT_EN |
> +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK_H=
AS_WTMINCNT_REG,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_gs201_cl0 =3D {
> +       .mask_reset_reg =3D GS_CLUSTER0_NONCPU_INT_EN,
> +       .mask_bit =3D 2,
> +       .mask_reset_inv =3D true,
> +       .rst_stat_reg =3D GS_RST_STAT_REG_OFFSET,
> +       .rst_stat_bit =3D 0,
> +       .cnt_en_reg =3D GS_CLUSTER0_NONCPU_OUT,
> +       .cnt_en_bit =3D 8,
> +       .quirks =3D QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | Q=
UIRK_HAS_PMU_CNT_EN |
> +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK_H=
AS_WTMINCNT_REG,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_gs201_cl1 =3D {
> +       .mask_reset_reg =3D GS_CLUSTER1_NONCPU_INT_EN,
> +       .mask_bit =3D 2,
> +       .mask_reset_inv =3D true,
> +       .rst_stat_reg =3D GS_RST_STAT_REG_OFFSET,
> +       .rst_stat_bit =3D 1,
> +       .cnt_en_reg =3D GS_CLUSTER1_NONCPU_OUT,
> +       .cnt_en_bit =3D 7,
> +       .quirks =3D QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | Q=
UIRK_HAS_PMU_CNT_EN |
> +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK_H=
AS_WTMINCNT_REG,
> +};
> +
>  static const struct of_device_id s3c2410_wdt_match[] =3D {
>         { .compatible =3D "samsung,s3c2410-wdt",
>           .data =3D &drv_data_s3c2410 },
> @@ -278,6 +338,10 @@ static const struct of_device_id s3c2410_wdt_match[]=
 =3D {
>           .data =3D &drv_data_exynos850_cl0 },
>         { .compatible =3D "samsung,exynosautov9-wdt",
>           .data =3D &drv_data_exynosautov9_cl0 },
> +       { .compatible =3D "google,gs101-wdt",
> +         .data =3D &drv_data_gs101_cl0 },
> +       { .compatible =3D "google,gs201-wdt",
> +         .data =3D &drv_data_gs201_cl0 },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> @@ -375,6 +439,21 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt=
, bool en)
>         return 0;
>  }
>
> +static void s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt, bool mask)
> +{
> +       unsigned long wtcon;
> +
> +       if (!(wdt->drv_data->quirks & QUIRK_HAS_DBGACK_BIT))
> +               return;
> +
> +       wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
> +       if (mask)
> +               wtcon |=3D S3C2410_WTCON_DBGACK_MASK;
> +       else
> +               wtcon &=3D ~S3C2410_WTCON_DBGACK_MASK;
> +       writel(wtcon, wdt->reg_base + S3C2410_WTCON);
> +}
> +
>  static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
>  {
>         struct s3c2410_wdt *wdt =3D watchdog_get_drvdata(wdd);
> @@ -410,7 +489,7 @@ static int s3c2410wdt_stop(struct watchdog_device *wd=
d)
>
>  static int s3c2410wdt_start(struct watchdog_device *wdd)
>  {
> -       unsigned long wtcon;
> +       unsigned long wtcon, wtmincnt;
>         struct s3c2410_wdt *wdt =3D watchdog_get_drvdata(wdd);
>         unsigned long flags;
>
> @@ -432,6 +511,12 @@ static int s3c2410wdt_start(struct watchdog_device *=
wdd)
>         dev_dbg(wdt->dev, "Starting watchdog: count=3D0x%08x, wtcon=3D%08=
lx\n",
>                 wdt->count, wtcon);
>
> +       if (wdt->drv_data->quirks & QUIRK_HAS_WTMINCNT_REG) {
> +               wtcon |=3D S3C2410_WTCON_WINDOWED_WD;
> +               wtmincnt =3D wdt->count * S3C2410_WINDOW_MULTIPLIER;
> +               writel(wtmincnt, wdt->reg_base + S3C2410_WTMINCNT);
> +       }
> +
>         writel(wdt->count, wdt->reg_base + S3C2410_WTDAT);
>         writel(wdt->count, wdt->reg_base + S3C2410_WTCNT);
>         writel(wtcon, wdt->reg_base + S3C2410_WTCON);
> @@ -447,7 +532,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_d=
evice *wdd,
>         unsigned long freq =3D s3c2410wdt_get_freq(wdt);
>         unsigned int count;
>         unsigned int divisor =3D 1;
> -       unsigned long wtcon;
> +       unsigned long wtcon, wtmincnt;
>
>         if (timeout < 1)
>                 return -EINVAL;
> @@ -478,6 +563,11 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_=
device *wdd,
>         count =3D DIV_ROUND_UP(count, divisor);
>         wdt->count =3D count;
>
> +       if (wdt->drv_data->quirks & QUIRK_HAS_WTMINCNT_REG) {
> +               wtmincnt =3D count * S3C2410_WINDOW_MULTIPLIER;
> +               writel(wtmincnt, wdt->reg_base + S3C2410_WTMINCNT);
> +       }
> +
>         /* update the pre-scaler */
>         wtcon =3D readl(wdt->reg_base + S3C2410_WTCON);
>         wtcon &=3D ~S3C2410_WTCON_PRESCALE_MASK;
> @@ -496,14 +586,20 @@ static int s3c2410wdt_restart(struct watchdog_devic=
e *wdd, unsigned long action,
>  {
>         struct s3c2410_wdt *wdt =3D watchdog_get_drvdata(wdd);
>         void __iomem *wdt_base =3D wdt->reg_base;
> +       unsigned long wtcon;
>
>         /* disable watchdog, to be safe  */
>         writel(0, wdt_base + S3C2410_WTCON);
>
>         /* put initial values into count and data */
> +       if (wdt->drv_data->quirks & QUIRK_HAS_WTMINCNT_REG)
> +               writel(0x100, wdt_base + S3C2410_WTMINCNT);
>         writel(0x80, wdt_base + S3C2410_WTCNT);
>         writel(0x80, wdt_base + S3C2410_WTDAT);
>
> +       if (wdt->drv_data->quirks & QUIRK_HAS_WTMINCNT_REG)
> +               wtcon |=3D S3C2410_WTCON_WINDOWED_WD;
> +
>         /* set the watchdog to go and reset... */
>         writel(S3C2410_WTCON_ENABLE | S3C2410_WTCON_DIV16 |
>                 S3C2410_WTCON_RSTEN | S3C2410_WTCON_PRESCALE(0x20),
> @@ -585,9 +681,11 @@ s3c2410_get_wdt_drv_data(struct platform_device *pde=
v, struct s3c2410_wdt *wdt)
>         }
>
>  #ifdef CONFIG_OF
> -       /* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index=
 */
> +       /* Choose Exynos850/ExynosAutov9/gsx01 driver data w.r.t. cluster=
 index */

Please keep 80 characters per line.

>         if (variant =3D=3D &drv_data_exynos850_cl0 ||
> -           variant =3D=3D &drv_data_exynosautov9_cl0) {
> +           variant =3D=3D &drv_data_exynosautov9_cl0 ||
> +           variant =3D=3D &drv_data_gs101_cl0 ||
> +           variant =3D=3D &drv_data_gs201_cl0) {
>                 u32 index;
>                 int err;
>
> @@ -600,9 +698,14 @@ s3c2410_get_wdt_drv_data(struct platform_device *pde=
v, struct s3c2410_wdt *wdt)
>                 case 0:
>                         break;
>                 case 1:
> -                       variant =3D (variant =3D=3D &drv_data_exynos850_c=
l0) ?
> -                               &drv_data_exynos850_cl1 :
> -                               &drv_data_exynosautov9_cl1;
> +                       if (variant =3D=3D &drv_data_exynos850_cl0)
> +                               variant =3D &drv_data_exynos850_cl1;
> +                       else if (variant =3D=3D &drv_data_exynosautov9_cl=
0)
> +                               variant =3D &drv_data_exynosautov9_cl1;
> +                       else if (variant =3D=3D &drv_data_gs101_cl0)
> +                               variant =3D &drv_data_gs101_cl1;
> +                       else if (variant =3D=3D &drv_data_gs201_cl0)
> +                               variant =3D &drv_data_gs201_cl1;
>                         break;
>                 default:
>                         return dev_err_probe(dev, -EINVAL, "wrong cluster=
 index: %u\n", index);
> @@ -700,6 +803,8 @@ static int s3c2410wdt_probe(struct platform_device *p=
dev)
>         wdt->wdt_device.bootstatus =3D s3c2410wdt_get_bootstatus(wdt);
>         wdt->wdt_device.parent =3D dev;
>
> +       s3c2410wdt_mask_dbgack(wdt, true);
> +
>         /*
>          * If "tmr_atboot" param is non-zero, start the watchdog right no=
w. Also
>          * set WDOG_HW_RUNNING bit, so that watchdog core can kick the wa=
tchdog.
> --
> 2.42.0.655.g421f12c284-goog
>
