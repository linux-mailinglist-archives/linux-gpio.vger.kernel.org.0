Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 744942E964
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2019 01:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfE2Xav (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 May 2019 19:30:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:48304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726240AbfE2Xav (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 May 2019 19:30:51 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A7E5924371;
        Wed, 29 May 2019 23:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559172649;
        bh=LI/SipH9I2k+fGVj863RGRAG5O4wgRHhltiAO+zLezo=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=Wp9wUtgtuKs4M89aPqIkYP3bYXkyWNF0DHHm8tvmzDhDY6pHnpwAa+R5eBW5kYbJo
         RNNDoQTzrigmV31NWRZrI9ht/hodt3h9VstLMeQU+QTP0ey7QmYJTTljkc9k2PH5On
         dBK7ZQcYfw4FszlZRVa3C5UGWnq3UFnAu1Pa3Uo8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1559084936-4610-5-git-send-email-skomatineni@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com> <1559084936-4610-5-git-send-email-skomatineni@nvidia.com>
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        skomatineni@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
To:     Sowjanya Komatineni <skomatineni@nvidia.com>, jason@lakedaemon.net,
        jonathanh@nvidia.com, linus.walleij@linaro.org,
        marc.zyngier@arm.com, mark.rutland@arm.com, stefan@agner.ch,
        tglx@linutronix.de, thierry.reding@gmail.com
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V2 04/12] clk: tegra: add support for peripheral clock suspend and resume
User-Agent: alot/0.8.1
Date:   Wed, 29 May 2019 16:30:48 -0700
Message-Id: <20190529233049.A7E5924371@mail.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Sowjanya Komatineni (2019-05-28 16:08:48)
> This patch implements peripheral clock context save and restore
> to support system suspend and resume operation.

Again, why?

> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
> index 6f2862eddad7..08b788766564 100644
> --- a/drivers/clk/tegra/clk.c
> +++ b/drivers/clk/tegra/clk.c
> @@ -81,6 +81,10 @@ static struct clk **clks;
>  static int clk_num;
>  static struct clk_onecell_data clk_data;
> =20
> +#ifdef CONFIG_PM_SLEEP
> +static u32 *periph_ctx;
> +#endif

Please move this into the ifdef below.

> +
>  /* Handlers for SoC-specific reset lines */
>  static int (*special_reset_assert)(unsigned long);
>  static int (*special_reset_deassert)(unsigned long);
> @@ -210,6 +214,65 @@ const struct tegra_clk_periph_regs *get_reg_bank(int=
 clkid)
>         }
>  }
> =20
> +#ifdef CONFIG_PM_SLEEP
> +void tegra_clk_periph_suspend(void __iomem *clk_base)
> +{
> +       int i, idx;
> +
> +       idx =3D 0;
> +       for (i =3D 0; i < periph_banks; i++, idx++)
> +               periph_ctx[idx] =3D
> +                       readl_relaxed(clk_base + periph_regs[i].rst_reg);
> +
> +       for (i =3D 0; i < periph_banks; i++, idx++)
> +               periph_ctx[idx] =3D
> +                       readl_relaxed(clk_base + periph_regs[i].enb_reg);
> +}
> +
> +void tegra_clk_periph_force_on(u32 *clks_on, int count, void __iomem *cl=
k_base)
> +{
> +       int i;
> +
> +       WARN_ON(count !=3D periph_banks);
> +
> +       for (i =3D 0; i < count; i++)
> +               writel_relaxed(clks_on[i], clk_base + periph_regs[i].enb_=
reg);
> +}
> +
> +void tegra_clk_periph_resume(void __iomem *clk_base)
> +{
> +       int i, idx;
> +
> +       idx =3D 0;
> +       for (i =3D 0; i < periph_banks; i++, idx++)
> +               writel_relaxed(periph_ctx[idx],
> +                              clk_base + periph_regs[i].rst_reg);
> +
> +       /* ensure all resets have propagated */
> +       fence_udelay(2, clk_base);
> +       tegra_read_chipid();
> +
> +       for (i =3D 0; i < periph_banks; i++, idx++)
> +               writel_relaxed(periph_ctx[idx],
> +                              clk_base + periph_regs[i].enb_reg);
> +
> +       /* ensure all enables have propagated */
> +       fence_udelay(2, clk_base);
> +       tegra_read_chipid();
> +}
> +
> +static int tegra_clk_suspend_ctx_init(int banks)
> +{
> +       int err =3D 0;
> +
> +       periph_ctx =3D kzalloc(2 * banks * sizeof(*periph_ctx), GFP_KERNE=
L);

Is this kcalloc(2 * banks, sizeof(*periph_ctx)... ?

> +       if (!periph_ctx)
> +               err =3D -ENOMEM;
> +
> +       return err;
> +}
> +#endif
> +
>  struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int ban=
ks)
>  {
>         clk_base =3D regs;
> @@ -226,11 +289,20 @@ struct clk ** __init tegra_clk_init(void __iomem *r=
egs, int num, int banks)
>         periph_banks =3D banks;
> =20
>         clks =3D kcalloc(num, sizeof(struct clk *), GFP_KERNEL);
> -       if (!clks)
> +       if (!clks) {
>                 kfree(periph_clk_enb_refcnt);
> +               return NULL;
> +       }
> =20
>         clk_num =3D num;
> =20
> +#ifdef CONFIG_PM_SLEEP

Can you use if (IS_ENABLED(CONFIG_PM_SLEEP)) here?

> +       if (tegra_clk_suspend_ctx_init(banks)) {
> +               kfree(periph_clk_enb_refcnt);
> +               kfree(clks);
> +               return NULL;
> +       }
> +#endif
>         return clks;
>  }
> =20
