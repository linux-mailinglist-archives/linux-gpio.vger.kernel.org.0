Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 465726B1E3E
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 09:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbjCIIdN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 9 Mar 2023 03:33:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbjCIIcO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 03:32:14 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A09234DD;
        Thu,  9 Mar 2023 00:31:23 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id r16so1165590qtx.9;
        Thu, 09 Mar 2023 00:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678350681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQQwihoQm8uXBBR2hgaSel12EpXi6e7mZu3C3LVlcZg=;
        b=YlysR+Ajz1WjX4XWH4h8GyXSdemygQGWhJ1uqLiwUKnSKtUNIKOjyp5l2td8aHFmBC
         9uYT2dGDRoFJV899xcjps14Oe8leJtYziGrRslW29yiqw8H2HpIKzRZi6/ZoOOd5lM6s
         iFUChzjTFomjjO++xAgUvt0/noWQyx/j0h0eBc9SloAmqvxBRIfrMxFcEc2CxkILlwN8
         0hKszDG2jutf2o3a0WjBj0YLZSY/wSDhVfysV6qpdOceBfmu8+AgZNFBvaPsqluOuIrK
         iO63NCYjvq/puMbzNQhWkcAQ4zNPqyad3yohXVXGzqPpiVJM0zdESK50ODqhVLJm68JM
         6s1g==
X-Gm-Message-State: AO0yUKVkDCf8IdvwOOr4r0/0f2ljKJsYqCUSL8E/80Ra2ScCi/HrtJiS
        8b3js11bIimd9guLwNjc1m6nxXCeraOLWWj+
X-Google-Smtp-Source: AK7set+/ZxmpF0M/dzEpsEf1NRjGmYdQ74IBOd/rXgKRhZjap+uuo7GKLUK6gZ1jJzKYaxCnQmVZ0w==
X-Received: by 2002:a05:622a:118b:b0:3bf:c266:fa6f with SMTP id m11-20020a05622a118b00b003bfc266fa6fmr33789283qtk.46.1678350681217;
        Thu, 09 Mar 2023 00:31:21 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id fu22-20020a05622a5d9600b003be56bdd3b1sm12971726qtb.92.2023.03.09.00.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 00:31:20 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id o1so1078675ybu.13;
        Thu, 09 Mar 2023 00:31:20 -0800 (PST)
X-Received: by 2002:a05:6902:4d4:b0:a03:da3f:3e68 with SMTP id
 v20-20020a05690204d400b00a03da3f3e68mr13049236ybs.12.1678350680338; Thu, 09
 Mar 2023 00:31:20 -0800 (PST)
MIME-Version: 1.0
References: <0c04925457bf3f7e78e7e3851528d9a4c29246da.1678271030.git.geert+renesas@glider.be>
 <202303091612.UKr8Fhos-lkp@intel.com>
In-Reply-To: <202303091612.UKr8Fhos-lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Mar 2023 09:31:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQXw-+_PSnmWTVSgHYftoyN2=O7cKWrsaNOaSwuhx3pQ@mail.gmail.com>
Message-ID: <CAMuHMdWQXw-+_PSnmWTVSgHYftoyN2=O7cKWrsaNOaSwuhx3pQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] pinctrl: renesas: Add support for 1.8V/2.5V I/O
 voltage levels
To:     kernel test robot <lkp@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Robot,

On Thu, Mar 9, 2023 at 9:29 AM kernel test robot <lkp@intel.com> wrote:
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on geert-renesas-drivers/renesas-pinctrl]
> [also build test ERROR on linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.3-rc1 next-20230309]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/pinctrl-renesas-r8a77995-Retain-POCCTRL0-register-across-suspend-resume/20230308-212328
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git renesas-pinctrl
> patch link:    https://lore.kernel.org/r/0c04925457bf3f7e78e7e3851528d9a4c29246da.1678271030.git.geert%2Brenesas%40glider.be
> patch subject: [PATCH 3/8] pinctrl: renesas: Add support for 1.8V/2.5V I/O voltage levels
> config: nios2-randconfig-r004-20230309 (https://download.01.org/0day-ci/archive/20230309/202303091612.UKr8Fhos-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/513932515f943c5987c5a214520f6875cd507c3e
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Geert-Uytterhoeven/pinctrl-renesas-r8a77995-Retain-POCCTRL0-register-across-suspend-resume/20230308-212328
>         git checkout 513932515f943c5987c5a214520f6875cd507c3e
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/pinctrl/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303091612.UKr8Fhos-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from drivers/pinctrl/renesas/pfc-r8a77950.c:11:
> >> drivers/pinctrl/renesas/pfc-r8a77950.c:19:48: error: 'SH_PFC_PIN_CFG_IO_VOLTAGE' undeclared here (not in a function); did you mean 'SH_PFC_PIN_CFG_IO_VOLTAGE_MASK'?
>       19 |         PORT_GP_CFG_12(3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
>          |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~

This driver is scheduled for removal, hence was not updated.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
