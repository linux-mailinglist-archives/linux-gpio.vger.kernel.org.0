Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF8CA366E69
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Apr 2021 16:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242656AbhDUOpH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 10:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240068AbhDUOpH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 10:45:07 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0916C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 07:44:32 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id x12so43131238ejc.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 07:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jE/4nGUnR/yV9x7hWyZ3juNzY2oHb9OWyxlMwjbE9yU=;
        b=ja7ztZ8yRHWJyA8FqEzwjciyhLW/G7rcdIYdq4+NAhgQMF9xXZhfBgTHgQ9Y5Ny3Gh
         OcZQODfW7oHAnCi0tB/gBU4bLriGIAeQgBo4/IWn5cQyKUejsSj49u9AWVg8ERuT/xl/
         +5zkrUdRzug3waTTYvuRcz07XqXH2E++47A3vrFbPQkATJ7cW5KO+0A8hZGT8sl4iatx
         IeZ/3Qlxyjl+49WM+l29wxlfvAaLg0Nm1+9hSMJ7cxhwiKVW/jacFARypjtBzQS/Zr7z
         a64XI1Pd7lzcRWA9KqjCfnJJRNG44NC2YPl+Zd7hUJK5qUEpD71RHliDlM7AUR4c0m6V
         Xc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jE/4nGUnR/yV9x7hWyZ3juNzY2oHb9OWyxlMwjbE9yU=;
        b=pS/Imdo/xtFBZhJAMKZFgQ9s9U5QQxxyqyol+JylfODrpFOwmdsNGk4kpTJpitaurg
         12soodncqScmg/KpjZj1bl/qpTxXZuIEV88fx06RGoisAJq70T2o22N0xrXq7RSe89xA
         NSDt8gr8Z+kMYAcKj2EbnM4AauAGnnNIb0FxokVPLx1nEh3iQvfZzdBee7YqyTDEfSdM
         T+PTRrk8OXgB6HOYeZoHEvimMAX2gvVxY/vQ4WdRSYwzzvoNMZkg46Byh3fNy3+szReM
         2MP5ahhHfkioXQp+2XbSraTNzlVkrKBpSJaCa/xbIGSWU5gxt60XZk4+QGyoklI+zNmm
         NODA==
X-Gm-Message-State: AOAM531UuT6VL02ije3rpwNt6gnjkBIn0W3i8QxA6fbq6BcQk8f27jw0
        jPVC4G4cOfCSTp+YTwBoLzgfDlCqKtKp3WHg/7V5XDzFDNuR7A==
X-Google-Smtp-Source: ABdhPJx4E+igdTsybK+rUiBs/GNRmWSAdvYptk03yufQ4/PPlIZF3jEklrM0ifKX5skEQsWtyoPx74v8XJD1abqCu8Q=
X-Received: by 2002:a17:906:1d10:: with SMTP id n16mr32670039ejh.445.1619016271598;
 Wed, 21 Apr 2021 07:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210417083839.46985-1-tony@atomide.com>
In-Reply-To: <20210417083839.46985-1-tony@atomide.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 21 Apr 2021 16:44:20 +0200
Message-ID: <CAMRc=McY+D-Ev95+nZ5mvwg=YxwJtC65a+5BY2Rvm9g8ec_d7w@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: omap: Save and restore sysconfig
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 17, 2021 at 10:38 AM Tony Lindgren <tony@atomide.com> wrote:
>
> As we are using cpu_pm to save and restore context, we must also save and
> restore the GPIO sysconfig register. This is needed because we are not
> calling PM runtime functions at all with cpu_pm.
>
> We need to save the sysconfig on idle as it's value can get reconfigured by
> PM runtime and can be different from the init time value. Device specific
> flags like "ti,no-idle-on-init" can affect the init value.
>
> Fixes: b764a5863fd8 ("gpio: omap: Remove custom PM calls and use cpu_pm instead")
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/gpio/gpio-omap.c                | 9 +++++++++
>  include/linux/platform_data/gpio-omap.h | 3 +++
>  2 files changed, 12 insertions(+)
>
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -29,6 +29,7 @@
>  #define OMAP4_GPIO_DEBOUNCINGTIME_MASK 0xFF
>
>  struct gpio_regs {
> +       u32 sysconfig;
>         u32 irqenable1;
>         u32 irqenable2;
>         u32 wake_en;
> @@ -1069,6 +1070,7 @@ static void omap_gpio_init_context(struct gpio_bank *p)
>         const struct omap_gpio_reg_offs *regs = p->regs;
>         void __iomem *base = p->base;
>
> +       p->context.sysconfig    = readl_relaxed(base + regs->sysconfig);
>         p->context.ctrl         = readl_relaxed(base + regs->ctrl);
>         p->context.oe           = readl_relaxed(base + regs->direction);
>         p->context.wake_en      = readl_relaxed(base + regs->wkup_en);
> @@ -1088,6 +1090,7 @@ static void omap_gpio_restore_context(struct gpio_bank *bank)
>         const struct omap_gpio_reg_offs *regs = bank->regs;
>         void __iomem *base = bank->base;
>
> +       writel_relaxed(bank->context.sysconfig, base + regs->sysconfig);
>         writel_relaxed(bank->context.wake_en, base + regs->wkup_en);
>         writel_relaxed(bank->context.ctrl, base + regs->ctrl);
>         writel_relaxed(bank->context.leveldetect0, base + regs->leveldetect0);
> @@ -1115,6 +1118,10 @@ static void omap_gpio_idle(struct gpio_bank *bank, bool may_lose_context)
>
>         bank->saved_datain = readl_relaxed(base + bank->regs->datain);
>
> +       /* Save syconfig, it's runtime value can be different from init value */
> +       if (bank->loses_context)
> +               bank->context.sysconfig = readl_relaxed(base + bank->regs->sysconfig);
> +
>         if (!bank->enabled_non_wakeup_gpios)
>                 goto update_gpio_context_count;
>
> @@ -1279,6 +1286,7 @@ static int gpio_omap_cpu_notifier(struct notifier_block *nb,
>
>  static const struct omap_gpio_reg_offs omap2_gpio_regs = {
>         .revision =             OMAP24XX_GPIO_REVISION,
> +       .sysconfig =            OMAP24XX_GPIO_SYSCONFIG,
>         .direction =            OMAP24XX_GPIO_OE,
>         .datain =               OMAP24XX_GPIO_DATAIN,
>         .dataout =              OMAP24XX_GPIO_DATAOUT,
> @@ -1302,6 +1310,7 @@ static const struct omap_gpio_reg_offs omap2_gpio_regs = {
>
>  static const struct omap_gpio_reg_offs omap4_gpio_regs = {
>         .revision =             OMAP4_GPIO_REVISION,
> +       .sysconfig =            OMAP4_GPIO_SYSCONFIG,
>         .direction =            OMAP4_GPIO_OE,
>         .datain =               OMAP4_GPIO_DATAIN,
>         .dataout =              OMAP4_GPIO_DATAOUT,
> diff --git a/include/linux/platform_data/gpio-omap.h b/include/linux/platform_data/gpio-omap.h
> --- a/include/linux/platform_data/gpio-omap.h
> +++ b/include/linux/platform_data/gpio-omap.h
> @@ -85,6 +85,7 @@
>   * omap2+ specific GPIO registers
>   */
>  #define OMAP24XX_GPIO_REVISION         0x0000
> +#define OMAP24XX_GPIO_SYSCONFIG                0x0010
>  #define OMAP24XX_GPIO_IRQSTATUS1       0x0018
>  #define OMAP24XX_GPIO_IRQSTATUS2       0x0028
>  #define OMAP24XX_GPIO_IRQENABLE2       0x002c
> @@ -108,6 +109,7 @@
>  #define OMAP24XX_GPIO_SETDATAOUT       0x0094
>
>  #define OMAP4_GPIO_REVISION            0x0000
> +#define OMAP4_GPIO_SYSCONFIG           0x0010
>  #define OMAP4_GPIO_EOI                 0x0020
>  #define OMAP4_GPIO_IRQSTATUSRAW0       0x0024
>  #define OMAP4_GPIO_IRQSTATUSRAW1       0x0028
> @@ -148,6 +150,7 @@
>  #ifndef __ASSEMBLER__
>  struct omap_gpio_reg_offs {
>         u16 revision;
> +       u16 sysconfig;
>         u16 direction;
>         u16 datain;
>         u16 dataout;
> --
> 2.31.1

Applied for fixes, thanks!

Bartosz
