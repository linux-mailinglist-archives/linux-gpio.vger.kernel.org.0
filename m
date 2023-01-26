Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D39E767CBFE
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jan 2023 14:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236567AbjAZN0I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Jan 2023 08:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbjAZN0F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2023 08:26:05 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF224C3C
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 05:26:03 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id x4so1946533ybp.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Jan 2023 05:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/8yNK2kX9YWdGIDCnUsvQH82+dlm6dp9hInv0MG2rDk=;
        b=o48o7jrnYs+lpORSn3isAnckevWumyFfoeaD4HP+dcF+CgyAYbucZPQLc5G5DpPDiz
         HXpr6cmMqN0AG36LXC4k0FNPWfZPUR4wL6PIg5m4vU3nQGOlgGU+iZQ8RW78RdnPNftg
         2mBh9QLB/nag4F/WTncHo8J1/E/znGR+Geq7BqftvyRwdxREt/QBKHt8p+1EluUClGXP
         sjlh2I44KpQb+sEyWE1RJwIM52JENQJWC3FdfIRAkqml/R55QOO9wpgL647YI5ALvgYL
         KA4lj98na3WEi5tf4M8Gtk09WOyPTaxKQPhKSswS4+nLNyy8ZIB/93jT4I1wwUlK2htv
         JEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8yNK2kX9YWdGIDCnUsvQH82+dlm6dp9hInv0MG2rDk=;
        b=We4eDyhKlkLu/VUWtJSH9KuILIoMc2YoWM90cVk/jZuBef7lzPsZeKIdG5RQfl9rFo
         NyBna0UugH2cbfTkskZL7g7bbGPq7SDhQWchan33+u5sCHhwiHFdUlyKSgbnE7dJGEt6
         FcCG32uSVdqMnhiJpmq0rpVF+BBxVAI4J+bb+3IWy33joH+B4+Ye3/8LciwHMoXL8FVD
         K1HwOyOs04drQ9Msa44faNy/T5tJqlVT3gMu98ATwlqe69GG2Z1+4ow3sT9GcBs+Wl2U
         WO+vFpyN0Rv0S4IjnikyBeSODWTdjrcAHHK2Kl4YiHUN95v+6brJ8F/5b3JytL3XYIXr
         8p/g==
X-Gm-Message-State: AFqh2kpIlPiOg5Ne73jSbuHIHaB7/ocm1yTr0RLEYtaLf/6Sb84Xg6GW
        CYLcFaVzkHCfJpTGsHXuvDRVAOCxywnBuPh0lZWHPg==
X-Google-Smtp-Source: AMrXdXsu8qqw0tHjvKv+se62HO30MlCFatIwl/tC9pepudY+t2hytHaDucaZJ0hNLoCk+oGK5ku28DE0oE0f5gHnGNw=
X-Received: by 2002:a5b:38b:0:b0:7ca:9b40:72a7 with SMTP id
 k11-20020a5b038b000000b007ca9b4072a7mr4443316ybp.130.1674739562186; Thu, 26
 Jan 2023 05:26:02 -0800 (PST)
MIME-Version: 1.0
References: <20230118094728.3814-1-clin@suse.com> <20230118094728.3814-3-clin@suse.com>
In-Reply-To: <20230118094728.3814-3-clin@suse.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Jan 2023 14:25:50 +0100
Message-ID: <CACRpkdZgjoxV-PPUcVHp=e0uMzx8UnvLoLMLXynm8X4VtBdN7g@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pinctrl: add NXP S32 SoC family support
To:     Chester Lin <clin@suse.com>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, s32@nxp.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Larisa Grigore <larisa.grigore@nxp.com>,
        Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>,
        Andrei Stefanescu <andrei.stefanescu@nxp.com>,
        Radu Pirea <radu-nicolae.pirea@nxp.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Nunez <matthew.nunez@nxp.com>,
        Phu Luu An <phu.luuan@nxp.com>,
        Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Chester!

thanks for your patch!

This looks much better and the DT bindings are finished which is
nice. As the driver is pretty big I need to find time to do review and
look closer.

Here follows some concerns:

On Wed, Jan 18, 2023 at 10:47 AM Chester Lin <clin@suse.com> wrote:

> Add the pinctrl driver for NXP S32 SoC family. This driver is mainly based
> on NXP's downstream implementation on nxp-auto-linux repo[1].
>
> [1] https://github.com/nxp-auto-linux/linux/tree/bsp35.0-5.15.73-rt/drivers/pinctrl/freescale
>
> Signed-off-by: Matthew Nunez <matthew.nunez@nxp.com>
> Signed-off-by: Phu Luu An <phu.luuan@nxp.com>
> Signed-off-by: Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@nxp.com>
> Signed-off-by: Radu Pirea <radu-nicolae.pirea@nxp.com>
> Signed-off-by: Chester Lin <clin@suse.com>

(...)

> +++ b/drivers/pinctrl/nxp/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config PINCTRL_S32CC
> +       bool
> +       depends on ARCH_S32 && OF
> +       select GENERIC_PINCTRL_GROUPS
> +       select GENERIC_PINMUX_FUNCTIONS
> +       select GENERIC_PINCONF

Maybe select REGMAP_MMIO
Maybe select GPIO_GENERIC or GPIO_REGMAP
see further below.

> +#ifdef CONFIG_PM_SLEEP
> +int s32_pinctrl_resume(struct device *dev);
> +int s32_pinctrl_suspend(struct device *dev);
> +#endif

I think these are usually handled by tagging the functions with __maybe_unused.

> +static u32 get_pin_no(u32 pinmux)
> +{
> +       return pinmux >> S32CC_PIN_NO_SHIFT;

Maybe add a mask too so it is clear that you just rely
on bits being shifted out to the righy.

> +static inline int s32_pinctrl_readl_nolock(struct pinctrl_dev *pctldev,
> +                                          unsigned int pin,
> +                                          unsigned long *config)
> +{
> +       struct s32_pinctrl_mem_region *region;
> +       unsigned int offset;
> +
> +       region = s32_get_region(pctldev, pin);
> +       if (!region)
> +               return -EINVAL;
> +
> +       offset = pin - region->pin_range->start;
> +
> +       *config = readl(region->base + S32_PAD_CONFIG(offset));
> +
> +       return 0;
> +}
> +
> +static inline int s32_pinctrl_readl(struct pinctrl_dev *pctldev,
> +                                   unsigned int pin,
> +                                   unsigned long *config)
> +{
> +       struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
> +       unsigned long flags;
> +       int ret;
> +
> +       spin_lock_irqsave(&ipctl->reg_lock, flags);
> +       ret = s32_pinctrl_readl_nolock(pctldev, pin, config);
> +       spin_unlock_irqrestore(&ipctl->reg_lock, flags);
> +
> +       return ret;
> +}
> +
> +static inline int s32_pinctrl_writel_nolock(struct pinctrl_dev *pctldev,
> +                                           unsigned int pin,
> +                                           unsigned long config)
> +{
> +       struct s32_pinctrl_mem_region *region;
> +       unsigned int offset;
> +
> +       region = s32_get_region(pctldev, pin);
> +       if (!region)
> +               return -EINVAL;
> +
> +       offset = pin - region->pin_range->start;
> +
> +       writel(config, region->base + S32_PAD_CONFIG(offset));
> +
> +       return 0;
> +
> +}
> +
> +static inline int s32_pinctrl_writel(unsigned long config,
> +                                    struct pinctrl_dev *pctldev,
> +                                    unsigned int pin)
> +{
> +       struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
> +       unsigned long flags;
> +       int ret;
> +
> +       spin_lock_irqsave(&ipctl->reg_lock, flags);
> +       ret = s32_pinctrl_writel_nolock(pctldev, pin, config);
> +       spin_unlock_irqrestore(&ipctl->reg_lock, flags);
> +
> +       return ret;
> +}

If you turn this around, *first* get the offset and *then* issye the read/write
to respective registers, you will find that you have re-implemented
regmap_mmio, which will take care of serializing your writes so that
you do not need a lock either. At least consider it.

> +static int s32_update_pin_mscr(struct pinctrl_dev *pctldev, unsigned int pin,
> +                              unsigned long mask, unsigned long new_mask)
> +{
> +       struct s32_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
> +       unsigned long config, flags;
> +       int ret;
> +
> +       spin_lock_irqsave(&ipctl->reg_lock, flags);
> +
> +       ret = s32_pinctrl_readl_nolock(pctldev, pin, &config);
> +       if (ret)
> +               goto unlock;
> +
> +       config &= ~mask;
> +       config |= new_mask;
> +
> +       ret = s32_pinctrl_writel_nolock(pctldev, pin, config);
> +       if (ret)
> +               goto unlock;

And after having pointed out how regmap MMIO was reimplemented,
here you re-implement regmap_update_bits() which performs mask
and set.

> +static int s32_pinconf_get(struct pinctrl_dev *pctldev,
> +                          unsigned int pin_id,
> +                          unsigned long *config)
> +{
> +       int ret = s32_pinctrl_readl(pctldev, pin_id, config);
> +
> +       if (ret)
> +               return -EINVAL;
> +
> +       return 0;

This looks like unnecessary indirection since every call site has
to check the return code anyway, can't you just inline the s32_pinctrl_readl()
calls?

(...)
> +#ifdef CONFIG_PM_SLEEP

Use __maybe_unused and compile in unconditionally.

> +static void s32_pinctrl_parse_groups(struct device_node *np,
> +                                    struct s32_pin_group *grp,
> +                                    struct s32_pinctrl_soc_info *info)
> +{
> +       const __be32 *p;
> +       struct device *dev;
> +       struct property *prop;
> +       int i, npins;
> +       u32 pinmux;
> +
> +       dev = info->dev;
> +
> +       dev_dbg(dev, "group: %s\n", np->name);
> +
> +       /* Initialise group */
> +       grp->name = np->name;
> +
> +       npins = of_property_count_elems_of_size(np, "pinmux", sizeof(u32));

There is a lot of code here for handling the funky pinmux stuff. Don't we have
generic helpers for this? Well maybe not :/

> +static void s32_pinctrl_parse_functions(struct device_node *np,
> +                                       struct s32_pinctrl_soc_info *info,
> +                                       u32 index)
> +{
> +       struct device_node *child;
> +       struct s32_pmx_func *func;
> +       struct s32_pin_group *grp;
> +       u32 i = 0;
> +
> +       dev_dbg(info->dev, "parse function(%d): %s\n", index, np->name);
> +
> +       func = &info->functions[index];
> +
> +       /* Initialise function */
> +       func->name = np->name;
> +       func->num_groups = of_get_child_count(np);
> +       if (func->num_groups == 0) {
> +               dev_err(info->dev, "no groups defined in %s\n", np->full_name);
> +               return;
> +       }
> +       func->groups = devm_kzalloc(info->dev,
> +                       func->num_groups * sizeof(char *), GFP_KERNEL);
> +
> +       for_each_child_of_node(np, child) {
> +               func->groups[i] = child->name;
> +               grp = &info->groups[info->grp_index++];
> +               s32_pinctrl_parse_groups(child, grp, info);
> +               i++;
> +       }
> +}

This also looks like helpers we should already have, can you look around
 a bit in other recently merged drivers?

Yours,
Linus Walleij
