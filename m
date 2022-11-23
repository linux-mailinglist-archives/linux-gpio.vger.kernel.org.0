Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7DE3636CF2
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 23:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiKWWOs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 17:14:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiKWWOp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 17:14:45 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4BB410B43E
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 14:14:43 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id d128so3961042ybf.10
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 14:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yxwq700cjgIpgfGXjXVMIWZf+/i54U4hiQu6wwaFrxs=;
        b=NERkzdTLp+gtlJdbWRZFxyzivY0ZJDPAXdfrGF3m/XML2U8DBM1f9y3bdLAgjKiZn8
         a2V5OxNDZdSmicHR0Vw2yjHPlWFDCC4yIun+usLgcmKTJw6n4FjYvRAlM4U1S0GaguhK
         GvFRvouAy/HCKKjynSlpWv5lqkA5xDE/awBDG+0n8wS3M+yA16vT8okceMIwiQIVGgwk
         cxulXw1lewEXbgR4GCJfE+rEyDVVODX0X8pAQ49ujkduB68QFJCDfQtd9TwO+QdAt6dl
         9wK2iOGcLfiqo8TB1jUMzOzWqE2LHkAioDTh6SGmTRDJyquX3/viOLFRcnbauKLHHilJ
         Soew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxwq700cjgIpgfGXjXVMIWZf+/i54U4hiQu6wwaFrxs=;
        b=M6mjauNxHF4S2rJ2z2NH+5PjUOmfMHILlUWhcCGpDa8F214BYLES5E3GJxPkWhljQ+
         lQC2IktGYeGjrJRtFO88JXii1cnzuPR+h5qHHF97ClzlG5y7sMg3y5nyAz0sI99oPKKz
         lADMf8oym01chOcb8IqZl7cATcoPXV1m1lX6asYHztj22xHtJHDf35/SN9L1PivGE4pL
         DAAhoLwQ0fIJOmINgygbRaqDLKhd1l/HjmX3K5a+zRNJMEBgMwkFy0rSVaZDo8DasG5A
         5NnVPpZKEHXlC9nndvK7ylgb47fcH/irBcTwVjXIvoulfGuwmBc07uN9TfQ1MmET9bpb
         lX6w==
X-Gm-Message-State: ANoB5pnr9TgQ5tehjfT0cSnzsfGvZ4GZ0u1LkyMob9pBp8CymVeigewf
        PpMlTHjktH2i0PNF+ZqboqQRHkrf9O7MQARUb7YDcQ==
X-Google-Smtp-Source: AA0mqf4bdwIwAUjV3qYMdxNw8Ige0lynYHKpcKkZxcAuLvYxsMbWkZsSuItzC/6TVTNtDTdGQ7fzuG7GrT5n9w66TJU=
X-Received: by 2002:a25:acd1:0:b0:6b4:b9e3:c64b with SMTP id
 x17-20020a25acd1000000b006b4b9e3c64bmr10342450ybd.238.1669241683091; Wed, 23
 Nov 2022 14:14:43 -0800 (PST)
MIME-Version: 1.0
References: <20221123080414.14005-1-zhuyinbo@loongson.cn>
In-Reply-To: <20221123080414.14005-1-zhuyinbo@loongson.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 23 Nov 2022 23:14:31 +0100
Message-ID: <CACRpkdZ5OJpMFH1Wi31TKQZskQtCmNGyySdkOpouiNW2t_jV6Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] gpio: loongson: add gpio driver support
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Bibo Mao <maobibo@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        Arnaud Patard <apatard@mandriva.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Hongchen Zhang <zhanghongchen@loongson.cn>,
        Liu Peibao <liupeibao@loongson.cn>
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

On Wed, Nov 23, 2022 at 9:04 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:

> The Loongson platforms GPIO controller contains 60 GPIO pins in total,
> 4 of which are dedicated GPIO pins, and the remaining 56 are reused
> with other functions. Each GPIO can set input/output and has the
> interrupt capability.
>
> This driver added support for Loongson GPIO controller and support to
> use DTS or ACPI to descibe GPIO device resources.
>
> Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>
> Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
> Signed-off-by: Liu Peibao <liupeibao@loongson.cn>
> Signed-off-by: Juxin Gao <gaojuxin@loongson.cn>
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>
> ---
> Change in v6:

This is way better :)

I guess you notice how the driver gets smaller and smaller.
This is a good sign!

> +static int loongson_gpio_request(
> +                       struct gpio_chip *chip, unsigned int pin)
> +{
> +       if (pin >= chip->ngpio)
> +               return -EINVAL;
> +
> +       return 0;
> +}

Drop this altogether as discussed in my other reply.

> +static inline void __set_direction(struct loongson_gpio_chip *lgpio,
> +                       unsigned int pin, int input)
> +static void __set_level(struct loongson_gpio_chip *lgpio, unsigned int pin,
> +                       int high)

I missed this before. Also the use of __underscore for inner functions
is a bad habit IMO (because __underscore is also used for compiler
primitives such as __init which is confusing) The signature of these
functions is too generic. Name them loongson_commit_direction() or
loongson_commit_level() or something.

> +static int loongson_gpio_get_direction(
> +                               struct gpio_chip *chip, unsigned int pin)

thanks for implementing this!

> +       if (lgpio->p_data->mode == BIT_CTRL_MODE) {
> +               ret = bgpio_init(&lgpio->chip, dev, 8,
> +                               LOONGSON_GPIO_IN(lgpio),
> +                               LOONGSON_GPIO_OUT(lgpio), 0,
> +                               LOONGSON_GPIO_OEN(lgpio), NULL, 0);
> +               if (ret) {
> +                       dev_err(dev, "unable to init generic GPIO\n");
> +                       return ret;
> +               }
> +               lgpio->chip.ngpio = ngpios;

Neat!

> +               lgpio->chip.base = 0;

Drop this. It is good that the base is unpredictable so
people don't start to rely on it. (drivers/gpio/TODO)

> +       rval = device_property_read_u16_array(dev, "gsi_idx_map", NULL, 0);

But this gsi_idx_map is missing from your device tree bindings,
is it not?

Or what am I missing here? Sorry I might overlook something...

> +static int loongson_gpio_probe(struct platform_device *pdev)
> +{
> +       void __iomem *reg_base;
> +       struct loongson_gpio_chip *lgpio;
> +       struct device_node *np = pdev->dev.of_node;
> +       struct device *dev = &pdev->dev;
> +
> +       lgpio = devm_kzalloc(dev, sizeof(*lgpio), GFP_KERNEL);
> +       if (!lgpio)
> +               return -ENOMEM;
> +
> +       loongson_gpio_get_props(pdev, lgpio);
> +
> +       lgpio->p_data = device_get_match_data(&pdev->dev);

lgpio->p_data = device_get_match_data(dev);


> +static int __init loongson_gpio_setup(void)
> +{
> +       return platform_driver_register(&loongson_gpio_driver);
> +}
> +postcore_initcall(loongson_gpio_setup);

Why does this have to be postcore_initcall()?

Yours,
Linus Walleij
