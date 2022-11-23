Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C87BC636569
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Nov 2022 17:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238724AbiKWQJV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Nov 2022 11:09:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236590AbiKWQJU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Nov 2022 11:09:20 -0500
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F348513EB2
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 08:09:19 -0800 (PST)
Received: by mail-qv1-f52.google.com with SMTP id cz18so6100594qvb.13
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 08:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkU8n1rGpBlbCpKTCwJGd7qJNj9Z1t7NxTgI6P3vlMs=;
        b=ppu8N61JVznr5txtQwvCQoBtTBwb51ik5s4LplngLJhga3twDW2jKxM4Vma2ZxW/WL
         G2WqDX/x9U4etxtqkCIrR+qOauhcrD/FDoG3cIgy9+c7HNLHqOtMwL9yQlMskaoEpVSn
         5L1p8TgjHHh2rAgGm85tuwCisSa0Bq4eRX4uAPcHxIk/d+blXqSL+JmbQQPkVlX99UPy
         7wLLQBM1myDN4mKZwIE7UcMrMKAp1tB6ZERPS6WYRoWaNZXftytdOZG0mcRp+Vxvg0Or
         nUMo3mTYPSAF9woFYRshFE8HbPZRPQI2djaxJB3t+rsKmtIU9UbndSklSMEVMaGStZ+r
         MFyw==
X-Gm-Message-State: ANoB5pnVbOE7IIgzD9smnkppVj3y0Hef6vDPEMg3IdvkaK4Casv8BBz6
        0PspB4zMhb8TfAPvPnX0nwhuDc50EWQY/w==
X-Google-Smtp-Source: AA0mqf46LmkbhAgMHyR8dQurLYE21UA+LshoIYsGAVcCDocCiJXn4IFeFDRJ4d3XR1iXsYJaEWc4ag==
X-Received: by 2002:ad4:4e0e:0:b0:4bb:73a4:c1dc with SMTP id dl14-20020ad44e0e000000b004bb73a4c1dcmr8224944qvb.41.1669219758903;
        Wed, 23 Nov 2022 08:09:18 -0800 (PST)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id v20-20020a05620a0f1400b006fbae4a5f59sm12265183qkl.41.2022.11.23.08.09.18
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 08:09:18 -0800 (PST)
Received: by mail-yb1-f180.google.com with SMTP id 1so1278426ybl.7
        for <linux-gpio@vger.kernel.org>; Wed, 23 Nov 2022 08:09:18 -0800 (PST)
X-Received: by 2002:a25:7204:0:b0:6f0:9ff5:1151 with SMTP id
 n4-20020a257204000000b006f09ff51151mr1634057ybc.543.1669219757796; Wed, 23
 Nov 2022 08:09:17 -0800 (PST)
MIME-Version: 1.0
References: <202211232331.BVAg4Q0c-lkp@intel.com>
In-Reply-To: <202211232331.BVAg4Q0c-lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Nov 2022 17:09:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuyGPDDE=xZQd3_Ne1DbiU+1vEXB5XuicOz6zM73tvPA@mail.gmail.com>
Message-ID: <CAMuHMdUuyGPDDE=xZQd3_Ne1DbiU+1vEXB5XuicOz6zM73tvPA@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 56/58] drivers/gpio/gpio-max732x.c:613:42:
 warning: initialization of 'const struct i2c_device_id *' from 'int' makes
 pointer from integer without a cast
To:     kernel test robot <lkp@intel.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, oe-kbuild-all@lists.linux.dev,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 23, 2022 at 4:49 PM kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
> head:   3687a82b1db1c827cc4b367e3efde3235f68d9f6
> commit: 95889cd3c8d8c64b3cd0baaecdaca2d82312b5fc [56/58] gpio: max732x: Convert to i2c's .probe_new()
> config: m68k-allyesconfig
> compiler: m68k-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=95889cd3c8d8c64b3cd0baaecdaca2d82312b5fc
>         git remote add brgl https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
>         git fetch --no-tags brgl gpio/for-next
>         git checkout 95889cd3c8d8c64b3cd0baaecdaca2d82312b5fc
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpio/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    drivers/gpio/gpio-max732x.c: In function 'max732x_probe':
>    drivers/gpio/gpio-max732x.c:613:42: error: implicit declaration of function 'i2c_client_get_device_id'; did you mean 'i2c_get_device_id'? [-Werror=implicit-function-declaration]
>      613 |         const struct i2c_device_id *id = i2c_client_get_device_id(client);
>          |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>          |                                          i2c_get_device_id
> >> drivers/gpio/gpio-max732x.c:613:42: warning: initialization of 'const struct i2c_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>    cc1: some warnings being treated as errors
>
>
> vim +613 drivers/gpio/gpio-max732x.c
>
>    610
>    611  static int max732x_probe(struct i2c_client *client)
>    612  {
>  > 613          const struct i2c_device_id *id = i2c_client_get_device_id(client);

Depends on commit 662233731d66cf41 ("i2c: core: Introduce
i2c_client_get_device_id helper function") in i2c/i2c/for-next?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
