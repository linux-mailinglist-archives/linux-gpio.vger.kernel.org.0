Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 339EA4E54D9
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Mar 2022 16:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbiCWPGp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Mar 2022 11:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244993AbiCWPGo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Mar 2022 11:06:44 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D57CC76668
        for <linux-gpio@vger.kernel.org>; Wed, 23 Mar 2022 08:05:13 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id t33so3167518ybt.12
        for <linux-gpio@vger.kernel.org>; Wed, 23 Mar 2022 08:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bWlDA4Z7Nlb9rGeBhnI0HdZK5MvG7cgk43mguZJe6K0=;
        b=t4snCVm6ro8FHR7BiCWX9XqOpeTnYN1m4GodNhoZpsdkFQzTLj7UOpM9FUzjtfxoIr
         EoOy60Hd3YF4rAQer0M+Vje2n5A4rH6UCO3JluIHENYt+7tT475HpZ8gFzxARykYt/8B
         h2CGz5B/i3nkhOiQyqTA20E+oW77330exWWIS8niiddFFeHrhvS+gIMbuKuywfMGScyp
         3Y9KD/n7cbe2uWIaHG7DuSdX5WDU+mKaCDYeCwB6W3IxWUImo4NumiXyM3fptaE90GiR
         +Qw4gRSpabcNxB6bSxciAkG+EGljaBMjeFTIeN0iAUdtja8MIe7wo2SelPuCnWNvxMUT
         8JZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bWlDA4Z7Nlb9rGeBhnI0HdZK5MvG7cgk43mguZJe6K0=;
        b=QOhVpEh94JyqgBcpdmXJCx2r3+lWGs25qeBTTc+QF3OlolhRsKQNZ7/prTdlo/KkcV
         PXrO+qvbjn1jZI6dmksmqyDdzSnObnYi9zm1ZA1xB8lVS+l/fmSOmljnXRw8zH7gXMEV
         e+GfkWG6Gpc32ArQ8gU231eGKfBRLIRhhuLPUfggsLbNYgO2uZX0nuvIeUZ65z7isu17
         NI2YxyrYs/W/YOFJfE2ZbJJIrSAFzLlrugIhv3b7f0JocUio8+LE/dlfxOu+Ql5Im+NL
         hgHlSXwyXme0WF04AN9++jtCTlirjXh4J1aG7dJELAOYwCa77DNPFvKiquDRnEjktI8b
         MTuQ==
X-Gm-Message-State: AOAM530l3KV3F0I+6HTvCAful3JgEiuuLH6MmbvZsczgYc9f/UHGrI++
        Oqhfcw4sxUfja62PQKnZKliym4Dpp9bPN/HcFutEow==
X-Google-Smtp-Source: ABdhPJz0Kqm7gzdQ/WxrQZLk84LQzwfRDU2vbplCKrjs/BPoY77HnVMYf33Odc5IAq9F6yWL/2UYrWv7b1j/qPB9I8g=
X-Received: by 2002:a25:4e82:0:b0:633:68d7:b864 with SMTP id
 c124-20020a254e82000000b0063368d7b864mr374036ybb.514.1648047913071; Wed, 23
 Mar 2022 08:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <623b33fa.pb2pVWdVg3WqlK6+%lkp@intel.com>
In-Reply-To: <623b33fa.pb2pVWdVg3WqlK6+%lkp@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 23 Mar 2022 16:05:02 +0100
Message-ID: <CACRpkdb2hifdLLtquEMqty2hBzr8ap_HxZVNRq5GY5ed3kR3YA@mail.gmail.com>
Subject: Re: [linusw-pinctrl:for-next] BUILD REGRESSION 0c3c8458428ab471178a0d155222eaa62083d033
To:     kernel test robot <lkp@intel.com>,
        =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jonathan,

this driver just keeps creating new sparse warnings, I try to fix them
but I wonder
if new warnings will result everytime I fix something?

Do you think you could run sparse over the drivers in some way and check
what else needs to be fixed?

Yours,
Linus Walleij

On Wed, Mar 23, 2022 at 3:52 PM kernel test robot <lkp@intel.com> wrote:
>
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
> branch HEAD: 0c3c8458428ab471178a0d155222eaa62083d033  pinctrl: nuvoton: Fix sparse warning
>
> Error/Warning reports:
>
> https://lore.kernel.org/linux-gpio/202203222145.UcCrXHfm-lkp@intel.com
>
> Unverified Error/Warning (likely false positive, please contact us if interested):
>
> drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:470:26: error: array type has incomplete element type 'struct group_desc'
> drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:470:40: error: array has incomplete element type 'struct group_desc'
> drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:824:56: warning: parameter 'selector' set but not used [-Wunused-but-set-parameter]
> drivers/pinctrl/nuvoton/pinctrl-wpcm450.c:888:48: warning: parameter 'group' set but not used [-Wunused-but-set-parameter]
> include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
>
> Error/Warning ids grouped by kconfigs:
>
> gcc_recent_errors
> |-- microblaze-randconfig-c024-20220323
> |   `-- drivers-pinctrl-mediatek-pinctrl-mtk-common.c:Unneeded-semicolon
> `-- parisc-randconfig-r006-20220323
>     |-- drivers-pinctrl-nuvoton-pinctrl-wpcm450.c:error:array-type-has-incomplete-element-type-struct-group_desc
>     |-- drivers-pinctrl-nuvoton-pinctrl-wpcm450.c:warning:parameter-group-set-but-not-used
>     |-- drivers-pinctrl-nuvoton-pinctrl-wpcm450.c:warning:parameter-selector-set-but-not-used
>     `-- include-linux-build_bug.h:error:bit-field-anonymous-width-not-an-integer-constant
>
> clang_recent_errors
> `-- hexagon-buildonly-randconfig-r005-20220323
>     `-- drivers-pinctrl-nuvoton-pinctrl-wpcm450.c:error:array-has-incomplete-element-type-struct-group_desc
>
> elapsed time: 729m
>
> configs tested: 131
> configs skipped: 4
>
> gcc tested configs:
> arm                                 defconfig
> arm64                            allyesconfig
> arm64                               defconfig
> arm                              allyesconfig
> arm                              allmodconfig
> i386                          randconfig-c001
> mips                 randconfig-c004-20220323
> arm                         axm55xx_defconfig
> xtensa                    xip_kc705_defconfig
> powerpc                    sam440ep_defconfig
> mips                           jazz_defconfig
> powerpc                      pasemi_defconfig
> arm                           h3600_defconfig
> sh                   sh7770_generic_defconfig
> sh                            hp6xx_defconfig
> arm                       omap2plus_defconfig
> alpha                               defconfig
> powerpc                     tqm8548_defconfig
> ia64                             alldefconfig
> sh                      rts7751r2d1_defconfig
> sh                             sh03_defconfig
> m68k                        mvme16x_defconfig
> arm                            xcep_defconfig
> s390                             allmodconfig
> sh                          rsk7264_defconfig
> arm                          simpad_defconfig
> arm                           h5000_defconfig
> nios2                         3c120_defconfig
> sh                             espt_defconfig
> powerpc                     pq2fads_defconfig
> arm                         assabet_defconfig
> um                               alldefconfig
> ia64                         bigsur_defconfig
> mips                         db1xxx_defconfig
> parisc                generic-32bit_defconfig
> sh                          rsk7203_defconfig
> alpha                            alldefconfig
> mips                      fuloong2e_defconfig
> powerpc                        warp_defconfig
> m68k                        mvme147_defconfig
> sh                         ecovec24_defconfig
> arm                             rpc_defconfig
> riscv                               defconfig
> sh                  sh7785lcr_32bit_defconfig
> arm                  randconfig-c002-20220323
> ia64                             allmodconfig
> ia64                                defconfig
> ia64                             allyesconfig
> m68k                             allmodconfig
> m68k                                defconfig
> m68k                             allyesconfig
> nds32                             allnoconfig
> nios2                               defconfig
> arc                              allyesconfig
> alpha                            allyesconfig
> csky                                defconfig
> nds32                               defconfig
> nios2                            allyesconfig
> xtensa                           allyesconfig
> h8300                            allyesconfig
> arc                                 defconfig
> sh                               allmodconfig
> parisc                              defconfig
> s390                             allyesconfig
> parisc64                            defconfig
> parisc                           allyesconfig
> s390                                defconfig
> i386                             allyesconfig
> i386                              debian-10.3
> i386                   debian-10.3-kselftests
> i386                                defconfig
> sparc                            allyesconfig
> sparc                               defconfig
> mips                             allyesconfig
> mips                             allmodconfig
> powerpc                          allyesconfig
> powerpc                          allmodconfig
> powerpc                           allnoconfig
> x86_64                        randconfig-a006
> x86_64                        randconfig-a004
> x86_64                        randconfig-a002
> i386                          randconfig-a003
> i386                          randconfig-a001
> i386                          randconfig-a005
> x86_64                        randconfig-a013
> x86_64                        randconfig-a011
> x86_64                        randconfig-a015
> i386                          randconfig-a012
> i386                          randconfig-a014
> i386                          randconfig-a016
> arc                  randconfig-r043-20220323
> riscv                randconfig-r042-20220323
> s390                 randconfig-r044-20220323
> riscv                    nommu_k210_defconfig
> riscv                            allyesconfig
> riscv                    nommu_virt_defconfig
> riscv                             allnoconfig
> riscv                            allmodconfig
> riscv                          rv32_defconfig
> x86_64                    rhel-8.3-kselftests
> um                           x86_64_defconfig
> um                             i386_defconfig
> x86_64                           allyesconfig
> x86_64                              defconfig
> x86_64                               rhel-8.3
> x86_64                          rhel-8.3-func
> x86_64                         rhel-8.3-kunit
> x86_64                                  kexec
>
> clang tested configs:
> x86_64                        randconfig-c007
> mips                 randconfig-c004-20220323
> arm                  randconfig-c002-20220323
> powerpc              randconfig-c003-20220323
> riscv                randconfig-c006-20220323
> i386                          randconfig-c001
> arm                    vt8500_v6_v7_defconfig
> arm                       imx_v4_v5_defconfig
> powerpc                     ksi8560_defconfig
> powerpc                    mvme5100_defconfig
> arm                              alldefconfig
> powerpc                     kilauea_defconfig
> i386                          randconfig-a002
> i386                          randconfig-a006
> i386                          randconfig-a004
> x86_64                        randconfig-a012
> x86_64                        randconfig-a014
> x86_64                        randconfig-a016
> i386                          randconfig-a011
> i386                          randconfig-a013
> i386                          randconfig-a015
> x86_64                        randconfig-a001
> x86_64                        randconfig-a003
> x86_64                        randconfig-a005
> hexagon              randconfig-r041-20220323
> hexagon              randconfig-r045-20220323
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
