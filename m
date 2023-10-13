Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAF6E7C7E8E
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Oct 2023 09:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjJMH2Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Oct 2023 03:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjJMH2W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Oct 2023 03:28:22 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC01CB7
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 00:28:20 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-59b5484fbe6so22454797b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Oct 2023 00:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697182100; x=1697786900; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Yib7OMBCHm6UwuQ9QWk+F7jjtT8gG/POYcXA2UHH3Q=;
        b=wJXJzn9Jn8PgNzhFAr4Cdh2wrn3+J3jFZugZWZ10zAdsBr4MNR4UfbjmZE0P3PHq3+
         r4X81CwvaBe75/GmzghkqX2JhCIOrUHTg/L3LKBr6sdleuLdwo/fZM3fwEzHMKY7w5Xv
         A4edZo5jOfLNFO+qqmGGGNu/9dZPdN7h+E14hM2QiGafxK+aBeDb2TjZRNsgfZrmqpZh
         LFnasiW3St4y54ge5NLsHp8ggREMB4BFLPehUj8dePwqBL6cN5LJKYSpyaqCl+BthtKh
         x7NhXLRIP53MRgSXxoAgl8ClsH9Md+17qM88QMRT42S9UfovHZ3Y24qfMPJt7r2Jvl9g
         +c6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697182100; x=1697786900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Yib7OMBCHm6UwuQ9QWk+F7jjtT8gG/POYcXA2UHH3Q=;
        b=xGIfZZd9a4BdDY9E9wxYXye/YA095mYZKPZS9VXf6gmbAWnwssyFeqToCP9Q/EWzXh
         5+kI/bhOoSFNxW8Pr0yrqYRGKtmCbkjEewIY3F5IZPFrrSSUAJVoIjBMqHkHFISyatft
         8Ntcqz0g+S0LlSG1GtUPuWaU5i96FEoDzjLlrNtX6UFeJQ6IyNZopk0Ilusj/eqhw7vS
         rWzTpZ4zepIOlo1uQWbc2GJVuLSy++1rjIxfASgJPM1uENMeD+z1atLGtaiopwaNy8G0
         1U8X36/dK0E9CMGoHtApfRJny4O9ZaZGuyolCUlKnA3I9BEBibprPfQC+qaSbAQAsPnm
         Ki2Q==
X-Gm-Message-State: AOJu0YwE3ZCgWCCVO68WO2YWaclmbVlxva8a/zKKDFFcdATRjsv+5CJW
        59vdRZ8cGXiSQAia+JkVqKV9sTa3R0gWhpmw7Gbl4g==
X-Google-Smtp-Source: AGHT+IFxcVBk7eoQexdweiHt3Yo+0O2fd32UCQ4GSzNtaxh1rBliV/v1wrURbnVQuCUenuheYmfpHotoLjiXHCM+lvg=
X-Received: by 2002:a25:a525:0:b0:d7b:9211:51a5 with SMTP id
 h34-20020a25a525000000b00d7b921151a5mr24066162ybi.44.1697182100158; Fri, 13
 Oct 2023 00:28:20 -0700 (PDT)
MIME-Version: 1.0
References: <202310131321.jDp5kiph-lkp@intel.com>
In-Reply-To: <202310131321.jDp5kiph-lkp@intel.com>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Fri, 13 Oct 2023 09:28:09 +0200
Message-ID: <CACMJSeuX40z=+qaS833kYvr84Sv=S1P-5Nz6nHG7T+Usy7KmpA@mail.gmail.com>
Subject: Re: [brgl:gpio/devel 48/62] drivers/pinctrl/pinctrl-st.c:1326:9:
 error: implicit declaration of function 'st_gpio_direction_input'; did you
 mean 'st_gpio_direction_output'?
To:     kernel test robot <lkp@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 13 Oct 2023 at 07:25, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
> head:   78853aac42280ea9b48d7abc74b348463cf8588d
> commit: e1e2007b6bb0ba0e1bb89235ffde4c0330655c29 [48/62] pinctrl: st: drop the wrapper around pinctrl_gpio_direction_input()
> config: arm-randconfig-001-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131321.jDp5kiph-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131321.jDp5kiph-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310131321.jDp5kiph-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/pinctrl/pinctrl-st.c: In function 'st_gpio_irq_request_resources':
> >> drivers/pinctrl/pinctrl-st.c:1326:9: error: implicit declaration of function 'st_gpio_direction_input'; did you mean 'st_gpio_direction_output'? [-Werror=implicit-function-declaration]
>     1326 |         st_gpio_direction_input(gc, d->hwirq);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~
>          |         st_gpio_direction_output
>    cc1: some warnings being treated as errors
>
>
> vim +1326 drivers/pinctrl/pinctrl-st.c
>
> 727b0f71a56de6 Srinivas Kandagatla 2014-01-16  1321
> e855fa9a65c407 Patrice Chotard     2017-03-16  1322  static int st_gpio_irq_request_resources(struct irq_data *d)
> e855fa9a65c407 Patrice Chotard     2017-03-16  1323  {
> e855fa9a65c407 Patrice Chotard     2017-03-16  1324     struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> e855fa9a65c407 Patrice Chotard     2017-03-16  1325
> e855fa9a65c407 Patrice Chotard     2017-03-16 @1326     st_gpio_direction_input(gc, d->hwirq);
> e855fa9a65c407 Patrice Chotard     2017-03-16  1327
> c36f8c06ebd0c4 Linus Walleij       2023-04-04  1328     return gpiochip_reqres_irq(gc, d->hwirq);
> e855fa9a65c407 Patrice Chotard     2017-03-16  1329  }
> e855fa9a65c407 Patrice Chotard     2017-03-16  1330
>
> :::::: The code at line 1326 was first introduced by commit
> :::::: e855fa9a65c40788b5069abb0d094537daa22e05 pinctrl: st: add irq_request/release_resources callbacks
>
> :::::: TO: Patrice Chotard <patrice.chotard@st.com>
> :::::: CC: Linus Walleij <linus.walleij@linaro.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Now fixed in the gpio/devel branch.

Bart
