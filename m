Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBB196226E2
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 10:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiKIJ2N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 04:28:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbiKIJ2M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 04:28:12 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 936251B9D7
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 01:28:11 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id k2so45113970ejr.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 01:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TUxkeYIU9Al/BJEtghySGhHTa8YoG9twnWemYdaKDpY=;
        b=KaUw1Egs6jWdeGwemMMj53SNGL4t1gHJ8bEuXCeBXh7kQVxNOLrzu2p5pqGKhGfkep
         6qucWyjUG0AjThMPSi8EGYGccQyp3LzQTvjIxQE4HHbsuwZ+HiNvjDibuA83BI7fziOs
         skSspvXnuXlXOF9EWkNj/J3N+Gp+NDGcfZfUrHw6WhuXuRtGa+4rmCpr+CcTS32dgr9W
         R5wJD+rvqqn7VGyTDah8XMEvwBiTSsX8bWgOcwtXzCEaNqRVPYfGtX39SiHmwzKcDBP/
         44FVJBxGm7ic2SqUWzoME1VTVxa4FfuNEVVmqKvX0prCakVmLopUcQmBzoHjB/J8OS0s
         U+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUxkeYIU9Al/BJEtghySGhHTa8YoG9twnWemYdaKDpY=;
        b=xPUe+l2kkvJbSTUtRQmWNYvU4szLKYIzVh0dzfWXHAPRa7F/7D4Iv/pa09y7OPpClX
         xs22gFe6eDs5RowNhA2H6KghxQdOgqi5Z5VfG3cx32bn73/GfsqA087mYLxV6ynEOn3y
         /xEdi6sRC0K1gaHu0+P2CxO66p1jYVy12ItjGf986Gs8OgiTba6dR9dMf05Xjd8Gl/Tp
         3VXNjnALo5sU8ZHU4ZeejJ9m+l4pH8LZbLVGVFrzItw0vuESl1T5I0laKHvfMh0YCHX0
         oiKnQ54wa9hpxDU6W9n7YThUmuKk15dbv/3UgpBozqR++vD5mFb48SiWpF7YbXWyNc5r
         KXSA==
X-Gm-Message-State: ANoB5pljrsLxT4wVGf+4OkA9n9JdNkBey9p/i9oEvCV9AjwJdrIgpCY0
        aS8W7gC3fKUoEQ+LeKDwRLZRI0b2hD2TGKgLQU5nn5+nWTk=
X-Google-Smtp-Source: AA0mqf52kGsf1GPuFDL2NY4eVqhzFBFtgSx5PbdFgLKE+mwz4vKzKVE/ISxz7TDEZVwaHE102YOoWTaMG4rshx8YJVU=
X-Received: by 2002:a17:906:6acc:b0:7ae:658c:ee45 with SMTP id
 q12-20020a1709066acc00b007ae658cee45mr14533582ejs.190.1667986090153; Wed, 09
 Nov 2022 01:28:10 -0800 (PST)
MIME-Version: 1.0
References: <20221109090957.13167-1-larry.lai@yunjingtech.com> <20221109090957.13167-3-larry.lai@yunjingtech.com>
In-Reply-To: <20221109090957.13167-3-larry.lai@yunjingtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Nov 2022 10:27:59 +0100
Message-ID: <CACRpkdZQ7FCtLPEioWXn+MXQhnpuu-EY+CjhEeKqBe=Bvq777g@mail.gmail.com>
Subject: Re: [PATCH V3 2/3] pinctrl: Add support pin control for UP board CPLD/FPGA
To:     chengwei <larry.lai@yunjingtech.com>
Cc:     lee@kernel.org, andriy.shevchenko@linux.intel.com, pavel@ucw.cz,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org, GaryWang@aaeon.com.tw,
        musa.lin@yunjingtech.com, jack.chang@yunjingtech.com,
        noah.hung@yunjingtech.com, Javier Arteaga <javier@emutex.com>,
        Nicola Lunghi <nicola.lunghi@emutex.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 9, 2022 at 10:11 AM chengwei <larry.lai@yunjingtech.com> wrote:

> +config PINCTRL_UPBOARD
> +       tristate "UP board FPGA pin controller"
> +       depends on ACPI
> +       depends on MFD_UPBOARD_FPGA
> +       depends on X86

This is Andy territory as it is x86 and ACPI but...

> +/*
> + * Init patches applied to the registers until the BIOS sets proper defaults
> + */
> +static const struct reg_sequence upboard_upcore_crex_reg_patches[] __initconst = {
> +       // enable I2C voltage-level shifters
> +       { UPFPGA_REG_FUNC_EN0,
> +               BIT(UPFPGA_I2C0_EN) |
> +               BIT(UPFPGA_I2C1_EN)
> +       },
> +       // HAT function pins initially set as inputs
> +       { UPFPGA_REG_GPIO_DIR0,
> +               BIT(UPFPGA_UPCORE_CREX_SPI2_MISO) |
> +               BIT(UPFPGA_UPCORE_CREX_UART1_RXD) |
> +               BIT(UPFPGA_UPCORE_CREX_I2S2_FRM) |
> +               BIT(UPFPGA_UPCORE_CREX_I2S2_CLK) |
> +               BIT(UPFPGA_UPCORE_CREX_I2S2_RX)
> +       },
> +};
> +
> +static const struct upboard_bios upboard_upcore_crex_bios_info __initconst = {
> +       .patches = upboard_upcore_crex_reg_patches,
> +       .npatches = ARRAY_SIZE(upboard_upcore_crex_reg_patches),
> +};

This "patches" terminology is quite confusing for kernel developers.
Writing some sequence of numbers into some registers at init is called
a "jam table" a term from Bunnie Huang (in his book "Hacking the Xbox" IIRC)

> +static int upboard_get_functions_count(struct pinctrl_dev *pctldev)
> +{
> +       //dev_info(pctldev->dev,"upboard_get_functions_count");
> +       return 0;
> +}
> +
> +static const char *upboard_get_function_name(struct pinctrl_dev *pctldev,
> +                                            unsigned int selector)
> +{
> +       //dev_info(pctldev->dev,"upboard_get_function_name:%d",selector);
> +       return NULL;
> +}

Don't leave this kind of commented out debug code around
in upstream submissions. Delete or use dev_dbg(), actually
dev_dbg() is pretty easy to use, just put an extra flag -DDEBUG
into your Makefile and the debug prints come out.

> +               //of_pinctrl_get(gc->parent->of_node);

What is this even? A commented out call to an OF function in an ACPI driver?

> +       switch (irqd_get_trigger_type(d)) {
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               //value |= BYT_TRIG_LVL;
> +               fallthrough;
> +       case IRQ_TYPE_EDGE_RISING:
> +               //value |= BYT_TRIG_POS;
> +               break;
> +       case IRQ_TYPE_LEVEL_LOW:
> +               //value |= BYT_TRIG_LVL;
> +               fallthrough;
> +       case IRQ_TYPE_EDGE_FALLING:
> +               //value |= BYT_TRIG_NEG;
> +               break;
> +       case IRQ_TYPE_EDGE_BOTH:
> +               //value |= (BYT_TRIG_NEG | BYT_TRIG_POS);
> +               break;
> +       }

So this looks like it should be uncommented and used or deleted?
It just looks unfinished, and this patch is not an RFC.

> +       //display mapping info.
> +       //for(i=0;i<pctldesc->npins;i++){
> +       //      dev_info(&pdev->dev,"Name:%s, GPIO:%d, IRQ:%d, regs:0x%08x",
> +       //      pctldesc->pins[i].name,pins[i].gpio, pins[i].irq, pins[i].regs);
> +       //      if(pins[i].regs)
> +       //              dev_info(&pdev->dev,"val:%pS", readl(pins[i].regs));
> +       //}

This isn't helpful, also there are existing debugfs hooks to be used
for exactly this kind of stuff.

The driver looks a bit unfinished.

Yours,
Linus Walleij
