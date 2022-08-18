Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC5065980BB
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Aug 2022 11:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237768AbiHRJT5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Aug 2022 05:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241906AbiHRJTf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Aug 2022 05:19:35 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33ABA6F542;
        Thu, 18 Aug 2022 02:19:18 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id s11so668303qtx.6;
        Thu, 18 Aug 2022 02:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=yQa+sfF1udvczV2z5y0dTGdNl2CdwROkVGhG2dlrBSg=;
        b=l/jbI0TXtvRldSj8pLLbbgrNzon6OYw8OLtMjiQ1ipkpCEmbcc+YWTOCfMSra4DVSc
         iwnzX5s8GjYfybse7Ykv/wS/Gs2ofdAeDurLJs4hSTx5rPQF5GqGXKnkKt68q2UGMMBO
         eqWJForwS4guwPCCwS7pfZqEzEu+tNkQBg52EwvjDGXVSc/Wv9/FH6VCpqv/ORdoAGBh
         ysJb44JpgjIfOeCjnYMNRb6Pr+pFuHAhI1M4Dsz1wDhUCqBbDpEYSdHdNVYzRETr6Afy
         gtWvFTrJDzBTEOkOA2n5AvBfNw92p5WsNgzIOZLITGytzXawz9D5bpKjKNU6OMxCo2Fu
         71jA==
X-Gm-Message-State: ACgBeo2szr6RhiXtiMzuI6CkdrePtaitIvUlT90uZHULnqp5tPXHfcl5
        osO6I/ysFj6/9SP6+9vB+qG53RSrSbjrcQ==
X-Google-Smtp-Source: AA6agR6nv1ovop+k4Ik42jpkI0w1RHb7Z5mQeGCEQXVz4Ld3lqeGSTzcSS07Obvn809q+7rDO1ZmAw==
X-Received: by 2002:a05:622a:1ba9:b0:343:786c:3bb1 with SMTP id bp41-20020a05622a1ba900b00343786c3bb1mr1737718qtb.125.1660814356716;
        Thu, 18 Aug 2022 02:19:16 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id u21-20020a05620a455500b006b615cd8c13sm1101402qkp.106.2022.08.18.02.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 02:19:16 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-32a09b909f6so25867207b3.0;
        Thu, 18 Aug 2022 02:19:16 -0700 (PDT)
X-Received: by 2002:a25:f06:0:b0:670:1685:d31d with SMTP id
 6-20020a250f06000000b006701685d31dmr1909231ybp.380.1660814355995; Thu, 18 Aug
 2022 02:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220729122448.498690-1-biju.das.jz@bp.renesas.com> <20220729122448.498690-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220729122448.498690-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Aug 2022 11:19:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU4U2cwXFrB7++Pwq=xi8txaUZtE19F=NrMv1mORrMVZQ@mail.gmail.com>
Message-ID: <CAMuHMdU4U2cwXFrB7++Pwq=xi8txaUZtE19F=NrMv1mORrMVZQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drivers: pinctrl: renesas: Add RZ/G2L POEG driver support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Biju,

On Fri, Jul 29, 2022 at 2:25 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The output pins of the RZ/G2L general PWM timer (GPT) can be disabled
> by using the port output enabling function for the GPT (POEG).
>
> This patch series add basic support using s/w control through
> sysfs to enable/disable output from GPT.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Renamed the file poeg-rzg2l->rzg2l-poeg
>  * Removed the macro POEGG as there is only single register and
>    updated rzg2l_poeg_write() and rzg2l_poeg_read()
>  * Updated error handling in probe()

Thanks for the update!

> --- /dev/null
> +++ b/drivers/pinctrl/renesas/poeg/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config POEG_RZG2L
> +       tristate "RZ/G2L poeg support"
> +       depends on ARCH_RZG2L
> +       depends on PWM_RZG2L_GPT

These are not hard dependencies, right?
And PWM_RZG2L_GPT (sort of) implies ARCH_RZG2L.

So I think the above two lines should be replaced by

     depends on PWM_RZG2L_GPT || COMPILE_TEST

> +       depends on HAS_IOMEM
> +       help
> +         This driver exposes the General Port Output Enable for PWM found
> +         in RZ/G2L.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called poeg-rzg2l.

> --- /dev/null
> +++ b/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
> @@ -0,0 +1,147 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G2L Port Output Enable for GPT (POEG) driver
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation
> + */
> +
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#define POEGG_SSF      BIT(3)
> +
> +struct rzg2l_poeg_chip {
> +       struct reset_control *rstc;
> +       void __iomem *mmio;
> +};
> +
> +static void rzg2l_poeg_write(struct rzg2l_poeg_chip *chip, u32 data)
> +{
> +       iowrite32(data, chip->mmio);
> +}
> +
> +static u32 rzg2l_poeg_read(struct rzg2l_poeg_chip *chip)
> +{
> +       return ioread32(chip->mmio);
> +}
> +
> +static ssize_t output_disable_store(struct device *dev,
> +                                   struct device_attribute *attr,
> +                                   const char *buf, size_t count)
> +{
> +       struct platform_device *pdev = to_platform_device(dev);
> +       struct rzg2l_poeg_chip *chip = platform_get_drvdata(pdev);

chip = dev_get_drvdata(dev)

> +       unsigned int val;
> +       u32 reg_val;
> +       int ret;
> +
> +       ret = kstrtouint(buf, 0, &val);
> +       if (ret)
> +               return ret;
> +
> +       reg_val = rzg2l_poeg_read(chip);
> +       if (val)
> +               reg_val |= POEGG_SSF;
> +       else
> +               reg_val &= ~POEGG_SSF;
> +
> +       rzg2l_poeg_write(chip, reg_val);
> +
> +       return ret ? : count;
> +}
> +
> +static ssize_t output_disable_show(struct device *dev,
> +                                  struct device_attribute *attr, char *buf)
> +{
> +       struct platform_device *pdev = to_platform_device(dev);
> +       struct rzg2l_poeg_chip *chip = platform_get_drvdata(pdev);

chip = dev_get_drvdata(dev)

> +       u32 reg;
> +
> +       reg = rzg2l_poeg_read(chip);
> +
> +       return sprintf(buf, "%u\n", (reg & POEGG_SSF) ? 1 : 0);

sysfs_emit().

> +}
> +static DEVICE_ATTR_RW(output_disable);

Probably you want to document these properties under Documentation/,
or do you intend to have this as an interim solution?
TBH, I still don't know if this is the proper way to handle POEG,
but I see no better alternative...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
