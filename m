Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD6A670B70E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 May 2023 09:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232366AbjEVHvt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 May 2023 03:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232463AbjEVHvX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2023 03:51:23 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1FE2124
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 00:49:50 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f60444238cso8023375e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 00:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684741751; x=1687333751;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9wWxl1zF62p1V2faLQ05QihXd2miK3f6UiC5lo5sl/8=;
        b=LEnu1D30qe2YE8VmMxMBbbqjcid/lq8JZvTcPdqHrlMNo8Jw607akLhWgSWRElfhcF
         nlmOyb3K2nqU57Kd1CQW+Vwx1sVLNIN0p4FF7nhV9Yy5jm0aRvAZLsgd6+MijlzkR3Z+
         trlyRq7P5ns7iblr0yh/VLvoqQtaIb+iIwK0xpVNWup+qsyH3UFzP4TP/256GZC5NOB0
         mR+JuD5PLJK7kjokdeeYL8H/z9Fg6Eb4lU5vMLMhjKroVHLApeEQI8mt6uoxBjONv1Ol
         rpOmHW0aWZ7T6AcbjExBv0U1LV+0iuz6dnuj3s9Dmb4O1Dr6f1Uti/uTniQ3Q78RKKEo
         Enyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684741751; x=1687333751;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wWxl1zF62p1V2faLQ05QihXd2miK3f6UiC5lo5sl/8=;
        b=UJW+SmZM+CiSUuzOMrVVhqU21ypT+aa4RU54Xr/Y0ypEo0IrZkSHAtJDPdxBxVTh0k
         Kdtm9Psi7tHoXkOF+UTI9BFEM0DE+XweZLnfuOpdttSKh97kMxfLlsAAEj+X52YVtl4X
         GYTLLkaTZz8/GQCfI4JkhDlLyeAANZ8U9JHjRJSw7ct2XwAGtJJQMeFagEi1Tmvx/44T
         F+iipNCUTpEDXzrNdGVfrUjels8wsDouozm3XOiVMrK7ntFAqpD+sWbE61GRmT5rFl/r
         Wtt7SXM3Vnvla8yYq6NVI+Qw6s+i1XW+T+FDN1hPTdb744w2CKILYeinuX+ge2YKwnz1
         +2yA==
X-Gm-Message-State: AC+VfDza681PPUveHYtdOGsRuSfH0d99E9A4LfNqMAn6RPBK+K31g+HJ
        yxK5rieE4961PWkjbqibxAwJlDyt+NzglHhDWnI=
X-Google-Smtp-Source: ACHHUZ4Ox5p2Dzx7thIScRw5rM1FRwOL+nyUGxhNXo/ZtC5TPo3sWT0tGe60E34J1srluQzAJIutRQ==
X-Received: by 2002:a1c:7c01:0:b0:3f5:db0f:4a74 with SMTP id x1-20020a1c7c01000000b003f5db0f4a74mr6952078wmc.21.1684741751225;
        Mon, 22 May 2023 00:49:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c290700b003f506e6ff83sm7427201wmd.22.2023.05.22.00.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:49:10 -0700 (PDT)
Date:   Mon, 22 May 2023 10:49:06 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     wellslutw@gmail.com
Cc:     linux-gpio@vger.kernel.org
Subject: [bug report] pinctrl: Add driver for Sunplus SP7021
Message-ID: <c58e0499-ecc8-4383-b607-a168db53ecdf@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Wells Lu,

The patch aa74c44be19c: "pinctrl: Add driver for Sunplus SP7021" from
Jan 16, 2022, leads to the following Smatch static checker warning:

drivers/pinctrl/sunplus/sppctl.c:886 sppctl_dt_node_to_map() error: potential null dereference 'configs'.  (kmalloc returns null)
drivers/pinctrl/sunplus/sppctl.c:899 sppctl_dt_node_to_map() error: potential null dereference 'configs'.  (kmalloc returns null)

drivers/pinctrl/sunplus/sppctl.c
    820 static int sppctl_dt_node_to_map(struct pinctrl_dev *pctldev, struct device_node *np_config,
    821                                  struct pinctrl_map **map, unsigned int *num_maps)
    822 {
    823         struct sppctl_pdata *pctl = pinctrl_dev_get_drvdata(pctldev);
    824         int nmG = of_property_count_strings(np_config, "groups");
    825         const struct sppctl_func *f = NULL;
    826         u8 pin_num, pin_type, pin_func;
    827         struct device_node *parent;
    828         unsigned long *configs;
    829         struct property *prop;
    830         const char *s_f, *s_g;
    831 
    832         const __be32 *list;
    833         u32 dt_pin, dt_fun;
    834         int i, size = 0;
    835 
    836         list = of_get_property(np_config, "sunplus,pins", &size);
    837 
    838         if (nmG <= 0)
    839                 nmG = 0;
    840 
    841         parent = of_get_parent(np_config);
    842         *num_maps = size / sizeof(*list);
    843 
    844         /*
    845          * Process property:
    846          *     sunplus,pins = < u32 u32 u32 ... >;
    847          *
    848          * Each 32-bit integer defines a individual pin in which:
    849          *
    850          *   Bit 32~24: defines GPIO pin number. Its range is 0 ~ 98.
    851          *   Bit 23~16: defines types: (1) fully-pinmux pins
    852          *                             (2) IO processor pins
    853          *                             (3) digital GPIO pins
    854          *   Bit 15~8:  defines pins of peripherals (which are defined in
    855          *              'include/dt-binging/pinctrl/sppctl.h').
    856          *   Bit 7~0:   defines types or initial-state of digital GPIO pins.
    857          */
    858         for (i = 0; i < (*num_maps); i++) {
    859                 dt_pin = be32_to_cpu(list[i]);
    860                 pin_num = FIELD_GET(GENMASK(31, 24), dt_pin);
    861 
    862                 if (pin_num >= sppctl_pins_all_sz) {
    863                         dev_err(pctldev->dev, "Invalid pin property at index %d (0x%08x)\n",
    864                                 i, dt_pin);
    865                         return -EINVAL;
    866                 }
    867         }
    868 
    869         *map = kcalloc(*num_maps + nmG, sizeof(**map), GFP_KERNEL);
    870         if (*map == NULL)
    871                 return -ENOMEM;
    872 
    873         for (i = 0; i < (*num_maps); i++) {
    874                 dt_pin = be32_to_cpu(list[i]);
    875                 pin_num = FIELD_GET(GENMASK(31, 24), dt_pin);
    876                 pin_type = FIELD_GET(GENMASK(23, 16), dt_pin);
    877                 pin_func = FIELD_GET(GENMASK(15, 8), dt_pin);
    878                 (*map)[i].name = parent->name;
    879 
    880                 if (pin_type == SPPCTL_PCTL_G_GPIO) {
    881                         /* A digital GPIO pin */
    882                         (*map)[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
    883                         (*map)[i].data.configs.num_configs = 1;
    884                         (*map)[i].data.configs.group_or_pin = pin_get_name(pctldev, pin_num);
    885                         configs = kmalloc(sizeof(*configs), GFP_KERNEL);
                                ^^^^^^^^^^^^^^^^^^
Static checkers like for kmalloc to be checked.

--> 886                         *configs = FIELD_GET(GENMASK(7, 0), dt_pin);
    887                         (*map)[i].data.configs.configs = configs;
    888 
    889                         dev_dbg(pctldev->dev, "%s: GPIO (%s)\n",
    890                                 (*map)[i].data.configs.group_or_pin,
    891                                 (*configs & (SPPCTL_PCTL_L_OUT | SPPCTL_PCTL_L_OU1)) ?
    892                                 "OUT" : "IN");
    893                 } else if (pin_type == SPPCTL_PCTL_G_IOPP) {
    894                         /* A IO Processor (IOP) pin */
    895                         (*map)[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
    896                         (*map)[i].data.configs.num_configs = 1;
    897                         (*map)[i].data.configs.group_or_pin = pin_get_name(pctldev, pin_num);
    898                         configs = kmalloc(sizeof(*configs), GFP_KERNEL);
                                ^^^^^^^^^^^^^^^^^^
Here too.

    899                         *configs = SPPCTL_IOP_CONFIGS;
    900                         (*map)[i].data.configs.configs = configs;
    901 
    902                         dev_dbg(pctldev->dev, "%s: IOP\n",
    903                                 (*map)[i].data.configs.group_or_pin);
    904                 } else {
    905                         /* A fully-pinmux pin */

regards,
dan carpenter
