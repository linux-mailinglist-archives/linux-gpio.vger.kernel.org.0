Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFF417EDD2
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2020 02:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgCJBNG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Mar 2020 21:13:06 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41007 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbgCJBNF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2020 21:13:05 -0400
Received: by mail-pl1-f195.google.com with SMTP id t14so4726060plr.8
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2020 18:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jct0oODSWCAbtgp27/MonFQJl4SIunMaftksi2S2Lhk=;
        b=FnqUNKxy9VpjYePPEw/UjvCcMoUU9z5I9nAMcanQud9Fm17B8L/jtOGwn/2LV9ck/E
         PH0GDOLFEOYfVCd7vzAn1r46n1C9Ih9r0sN0gzqopzpXcBF9cKL9+z10ZrNgdHdpEaYy
         1D/WuR7MObErwia9QrdNRAI2qFf78/k12fh0HVQttfKtuPNJhgYLvomSB6R5313jmZlO
         BhybgiY/vVLAoW9nA1RnTVTx2aSqO7/LuCOENwWee9nB0O0dDO7v3sOX7nlG9Yr+CS2Y
         flGezL007ClN7JX1nmh7UsovWGaJ//IIqS324WxwiXohmP0fgA1iLWWjLf38HfalPtvr
         5oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jct0oODSWCAbtgp27/MonFQJl4SIunMaftksi2S2Lhk=;
        b=tIw54isdZvJqBECd5RaaHBy6AiRw5PZw2V/rCqltrH3mNwZUYIOJ0P6wgriOtZ9hsb
         nM/A2p109tg4o60DmHcPJLy+kDGadiZ+GDlOFMJQrDSZrob29LuAIelLZvH+B7/rPE2c
         DpiZjufPhNUW9aNkyM5hGCYwn0HtcH9pXRoF6y9LGi+uJKtZC7uz4kiTQZ/ALOiwOpSH
         wCHTVxIZmEgRijtrfpsRGyrUVb+hRyHvvj0wY2DQS4x3W9ab20CA/NhtHBbQKvE1/dTV
         /qVH9nsPsvH2Bz5q9RIwe2q5hBcuK94H85z7Kix1i2+GOW0dUa31OqvkzQ4ERbKeDaBe
         1/dA==
X-Gm-Message-State: ANhLgQ29Z/pevU4XJX4GjD7Bax5PMWVY+WRm31py6aeLs2YAtijhIiI/
        9oocJ2dxgvf+DTQQizRshbKFIdkDPw5+SVkEHLDCDA==
X-Google-Smtp-Source: ADFU+vuvy+aVBypOSJ8MDKrWWN/VcYfntO0uRTt3cKWBFTEBl/T4ffJ0PBm7PrQl9DIV2mLIjDPGRaqx7AOGUI2rDo4=
X-Received: by 2002:a17:90a:1f8d:: with SMTP id x13mr2151099pja.27.1583802784082;
 Mon, 09 Mar 2020 18:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <1583719058-23370-1-git-send-email-Anson.Huang@nxp.com> <202003100849.SzJTb5rj%lkp@intel.com>
In-Reply-To: <202003100849.SzJTb5rj%lkp@intel.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 Mar 2020 18:12:53 -0700
Message-ID: <CAKwvOdmnQiEe8TxNGSqKrBY_WL_Tsxu6NJ=1iAmaaqeM3a2bAQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxs: add COMPILE_TEST support for GPIO_MXS
To:     Anson Huang <Anson.Huang@nxp.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     kbuild-all@lists.01.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        NXP Linux Team <Linux-imx@nxp.com>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Nevermind this report, we're currently discussing what best to do in this case.

On Mon, Mar 9, 2020 at 5:57 PM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Anson,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on gpio/for-next]
> [also build test WARNING on v5.6-rc5]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Anson-Huang/gpio-mxs-add-COMPILE_TEST-support-for-GPIO_MXS/20200309-104254
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git for-next
> config: x86_64-allyesconfig (attached as .config)
> compiler: clang version 11.0.0 (git://gitmirror/llvm_project 073dbaae39724ea860b5957fe47ecc1c2a84b197)
> reproduce:
>         # FIXME the reproduce steps for clang is not ready yet
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/gpio/gpio-mxs.c:293:16: warning: cast to smaller integer type 'enum mxs_gpio_id' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>            port->devid = (enum mxs_gpio_id)of_device_get_match_data(&pdev->dev);
>                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 warning generated.
>
> vim +293 drivers/gpio/gpio-mxs.c
>
> 4052d45e800ce3 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  276
> 3836309d93462b drivers/gpio/gpio-mxs.c  Bill Pemberton      2012-11-19  277  static int mxs_gpio_probe(struct platform_device *pdev)
> fba311fcf09873 arch/arm/mach-mxs/gpio.c Shawn Guo           2010-12-18  278  {
> 4052d45e800ce3 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  279     struct device_node *np = pdev->dev.of_node;
> 4052d45e800ce3 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  280     struct device_node *parent;
> 8d7cf8370d5fb7 drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-06  281     static void __iomem *base;
> 8d7cf8370d5fb7 drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-06  282     struct mxs_gpio_port *port;
> 0b76c5412146c1 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-08-20  283     int irq_base;
> 498c17cf6a9353 drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-07  284     int err;
> 8d7cf8370d5fb7 drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-06  285
> 940a4f7b51f7ad drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  286     port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
> 8d7cf8370d5fb7 drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-06  287     if (!port)
> 8d7cf8370d5fb7 drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-06  288             return -ENOMEM;
> 8d7cf8370d5fb7 drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-06  289
> 4052d45e800ce3 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  290     port->id = of_alias_get_id(np, "gpio");
> 4052d45e800ce3 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  291     if (port->id < 0)
> 4052d45e800ce3 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  292             return port->id;
> 1f2d357b9ebef5 drivers/gpio/gpio-mxs.c  Thierry Reding      2018-04-30 @293     port->devid = (enum mxs_gpio_id)of_device_get_match_data(&pdev->dev);
> 5751d3dcf43e24 drivers/gpio/gpio-mxs.c  Bartosz Golaszewski 2017-08-09  294     port->dev = &pdev->dev;
> 940a4f7b51f7ad drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  295     port->irq = platform_get_irq(pdev, 0);
> 940a4f7b51f7ad drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  296     if (port->irq < 0)
> 940a4f7b51f7ad drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  297             return port->irq;
> 940a4f7b51f7ad drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  298
> 8d7cf8370d5fb7 drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-06  299     /*
> 8d7cf8370d5fb7 drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-06  300      * map memory region only once, as all the gpio ports
> 8d7cf8370d5fb7 drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-06  301      * share the same one
> 8d7cf8370d5fb7 drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-06  302      */
> 8d7cf8370d5fb7 drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-06  303     if (!base) {
> 4052d45e800ce3 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  304             parent = of_get_parent(np);
> 4052d45e800ce3 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  305             base = of_iomap(parent, 0);
> 4052d45e800ce3 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  306             of_node_put(parent);
> 641d03422a59b1 drivers/gpio/gpio-mxs.c  Thierry Reding      2013-01-21  307             if (!base)
> 641d03422a59b1 drivers/gpio/gpio-mxs.c  Thierry Reding      2013-01-21  308                     return -EADDRNOTAVAIL;
> 8d7cf8370d5fb7 drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-06  309     }
> 8d7cf8370d5fb7 drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-06  310     port->base = base;
> fba311fcf09873 arch/arm/mach-mxs/gpio.c Shawn Guo           2010-12-18  311
> f08ea3cc94eeaf drivers/gpio/gpio-mxs.c  Sascha Hauer        2016-10-21  312     /* initially disable the interrupts */
> f08ea3cc94eeaf drivers/gpio/gpio-mxs.c  Sascha Hauer        2016-10-21  313     writel(0, port->base + PINCTRL_PIN2IRQ(port));
> 164387d2b4ae20 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-03  314     writel(0, port->base + PINCTRL_IRQEN(port));
> fba311fcf09873 arch/arm/mach-mxs/gpio.c Shawn Guo           2010-12-18  315
> fba311fcf09873 arch/arm/mach-mxs/gpio.c Shawn Guo           2010-12-18  316     /* clear address has to be used to clear IRQSTAT bits */
> 164387d2b4ae20 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-03  317     writel(~0U, port->base + PINCTRL_IRQSTAT(port) + MXS_CLR);
> fba311fcf09873 arch/arm/mach-mxs/gpio.c Shawn Guo           2010-12-18  318
> 8514b5439c90f0 drivers/gpio/gpio-mxs.c  Bartosz Golaszewski 2017-03-04  319     irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, 32, numa_node_id());
> 44df08198bc98d drivers/gpio/gpio-mxs.c  Arvind Yadav        2016-10-05  320     if (irq_base < 0) {
> 44df08198bc98d drivers/gpio/gpio-mxs.c  Arvind Yadav        2016-10-05  321             err = irq_base;
> 44df08198bc98d drivers/gpio/gpio-mxs.c  Arvind Yadav        2016-10-05  322             goto out_iounmap;
> 44df08198bc98d drivers/gpio/gpio-mxs.c  Arvind Yadav        2016-10-05  323     }
> 0b76c5412146c1 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-08-20  324
> 0b76c5412146c1 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-08-20  325     port->domain = irq_domain_add_legacy(np, 32, irq_base, 0,
> 0b76c5412146c1 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-08-20  326                                          &irq_domain_simple_ops, NULL);
> 0b76c5412146c1 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-08-20  327     if (!port->domain) {
> 0b76c5412146c1 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-08-20  328             err = -ENODEV;
> 8514b5439c90f0 drivers/gpio/gpio-mxs.c  Bartosz Golaszewski 2017-03-04  329             goto out_iounmap;
> 0b76c5412146c1 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-08-20  330     }
> 0b76c5412146c1 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-08-20  331
> 498c17cf6a9353 drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-07  332     /* gpio-mxs can be a generic irq chip */
> 1bbc557d976b4e drivers/gpio/gpio-mxs.c  Peng Fan            2015-08-23  333     err = mxs_gpio_init_gc(port, irq_base);
> 1bbc557d976b4e drivers/gpio/gpio-mxs.c  Peng Fan            2015-08-23  334     if (err < 0)
> 1bbc557d976b4e drivers/gpio/gpio-mxs.c  Peng Fan            2015-08-23  335             goto out_irqdomain_remove;
> fba311fcf09873 arch/arm/mach-mxs/gpio.c Shawn Guo           2010-12-18  336
> fba311fcf09873 arch/arm/mach-mxs/gpio.c Shawn Guo           2010-12-18  337     /* setup one handler for each entry */
> a44735f421b447 drivers/gpio/gpio-mxs.c  Russell King        2015-06-16  338     irq_set_chained_handler_and_data(port->irq, mxs_gpio_irq_handler,
> a44735f421b447 drivers/gpio/gpio-mxs.c  Russell King        2015-06-16  339                                      port);
> fba311fcf09873 arch/arm/mach-mxs/gpio.c Shawn Guo           2010-12-18  340
> 0f4630f3720e7e drivers/gpio/gpio-mxs.c  Linus Walleij       2015-12-04  341     err = bgpio_init(&port->gc, &pdev->dev, 4,
> 164387d2b4ae20 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-03  342                      port->base + PINCTRL_DIN(port),
> 90dae4ebf03063 drivers/gpio/gpio-mxs.c  Maxime Ripard       2013-04-29  343                      port->base + PINCTRL_DOUT(port) + MXS_SET,
> 90dae4ebf03063 drivers/gpio/gpio-mxs.c  Maxime Ripard       2013-04-29  344                      port->base + PINCTRL_DOUT(port) + MXS_CLR,
> 84a442b9a16ee6 drivers/gpio/gpio-mxs.c  Linus Torvalds      2012-05-26  345                      port->base + PINCTRL_DOE(port), NULL, 0);
> 8d7cf8370d5fb7 drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-06  346     if (err)
> 0f4630f3720e7e drivers/gpio/gpio-mxs.c  Linus Walleij       2015-12-04  347             goto out_irqdomain_remove;
> fba311fcf09873 arch/arm/mach-mxs/gpio.c Shawn Guo           2010-12-18  348
> 0f4630f3720e7e drivers/gpio/gpio-mxs.c  Linus Walleij       2015-12-04  349     port->gc.to_irq = mxs_gpio_to_irq;
> 0f4630f3720e7e drivers/gpio/gpio-mxs.c  Linus Walleij       2015-12-04  350     port->gc.get_direction = mxs_gpio_get_direction;
> 0f4630f3720e7e drivers/gpio/gpio-mxs.c  Linus Walleij       2015-12-04  351     port->gc.base = port->id * 32;
> 06f88a8ae9085e drivers/gpio/gpio-mxs.c  Shawn Guo           2011-06-06  352
> 0f4630f3720e7e drivers/gpio/gpio-mxs.c  Linus Walleij       2015-12-04  353     err = gpiochip_add_data(&port->gc, port);
> 0b76c5412146c1 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-08-20  354     if (err)
> 0f4630f3720e7e drivers/gpio/gpio-mxs.c  Linus Walleij       2015-12-04  355             goto out_irqdomain_remove;
> fba311fcf09873 arch/arm/mach-mxs/gpio.c Shawn Guo           2010-12-18  356
> 940a4f7b51f7ad drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  357     return 0;
> 0b76c5412146c1 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-08-20  358
> 1bbc557d976b4e drivers/gpio/gpio-mxs.c  Peng Fan            2015-08-23  359  out_irqdomain_remove:
> 1bbc557d976b4e drivers/gpio/gpio-mxs.c  Peng Fan            2015-08-23  360     irq_domain_remove(port->domain);
> 44df08198bc98d drivers/gpio/gpio-mxs.c  Arvind Yadav        2016-10-05  361  out_iounmap:
> 44df08198bc98d drivers/gpio/gpio-mxs.c  Arvind Yadav        2016-10-05  362     iounmap(port->base);
> 0b76c5412146c1 drivers/gpio/gpio-mxs.c  Shawn Guo           2012-08-20  363     return err;
> 940a4f7b51f7ad drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  364  }
> 940a4f7b51f7ad drivers/gpio/gpio-mxs.c  Shawn Guo           2012-05-04  365
>
> :::::: The code at line 293 was first introduced by commit
> :::::: 1f2d357b9ebef5c7ca7e7ee07234c08ac057c386 gpio: mxs: Use of_device_get_match_data()
>
> :::::: TO: Thierry Reding <treding@nvidia.com>
> :::::: CC: Linus Walleij <linus.walleij@linaro.org>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/202003100849.SzJTb5rj%25lkp%40intel.com.



-- 
Thanks,
~Nick Desaulniers
