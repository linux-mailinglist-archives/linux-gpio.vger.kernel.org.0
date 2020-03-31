Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7276199FE6
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 22:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbgCaUVL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 16:21:11 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:32824 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727708AbgCaUVK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2020 16:21:10 -0400
Received: by mail-lj1-f193.google.com with SMTP id f20so23445445ljm.0
        for <linux-gpio@vger.kernel.org>; Tue, 31 Mar 2020 13:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gEmd9bE3UXlNmayLHogmxF+vxnejV5Up4dkEEYcjUbU=;
        b=nqCPIA6N6+5jsZi1p2VYQZzANtMZGCExnmS5DNurdRcwV+qqA3FS/xUErcpM+ALsI3
         rP62ilIuoGnC7J/wq6PLga1ZU4+wHKTVcYeo2wwqaKUMMnmi4dvirDcq2WGccpa+xyLr
         +rSWYtb4uGGC8Fbt7TiPSten7A3WFfjlMzGG2CVkpIWpcMgorn+4NSIAdFAU8yiXGOGL
         TPXR4q3dNy2qxCWq3fDPZV7KJu+8ZndVS8dE3akpFyCncnU3KMU5MhsfzCaf9rF+DiMy
         Kd7qPSX+rsfDaT7odSUn7rSJY+969/yhubIfI1v+gSjP/1t1O+DSDFoZ4vZnwPiTA11m
         6EEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gEmd9bE3UXlNmayLHogmxF+vxnejV5Up4dkEEYcjUbU=;
        b=CvDSioV3dxb4yOr26fvAF8c2/0zz2l1UO9zpZexTppWWsq9eZupScKLfNWDw1HIJZ1
         CPoJzvstIrcODuZU0zESrBk3WYgVxX3L8EvtXvaHD/DrMQXk0u3EE9AW8FNrfykJQoQ8
         OPyKBXBcEpwuL+0g1mUX3xcz7Qb1AOUVzYYxRFqxCBuTtUXTzjkyET18GdSuPXwg1GGW
         86besCH2d0MnaPpg0mqDCyJFtK4oKQfe/pLhgonYOKsQkBbkzcvAUM9ayR9QN4rZzbFP
         nmeIrYGc2CwoJRsu8DB2DKMewg8EnnfEqu2Y++DMu8MFEubvhh0OUHNTxUOUmEAkBIH4
         IyBg==
X-Gm-Message-State: AGi0PuZGJSrLEpftayKzy3RqK5c77R8QlyaQ6Ihe/XHA8fAOjRcEluTU
        py2dffN/a0tn/5CjN/exXNEpuCbrlYOUsqCuQXm75O8g+h8=
X-Google-Smtp-Source: APiQypIVtLgE7n44Cyn8vFWmbdOvCVlekN9OJCELn1uIQMTEnkH7wWsX0fnup0vrdoytUQztjkSbMocjVLrhtxyE68g=
X-Received: by 2002:a2e:9c48:: with SMTP id t8mr10936685ljj.168.1585686067662;
 Tue, 31 Mar 2020 13:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <5e7eff9a.Q/s163B0l0c6QBmS%lkp@intel.com>
In-Reply-To: <5e7eff9a.Q/s163B0l0c6QBmS%lkp@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 31 Mar 2020 22:20:56 +0200
Message-ID: <CACRpkdZh3+E9mrC61ju3aeezoZ2-T-qioC5sUOb2Lv9KikV6Xg@mail.gmail.com>
Subject: Re: [pinctrl:devel] BUILD REGRESSION 13bec8d49bdf10aab4e1570ef42417f6bfbb6126
To:     kbuild test robot <lkp@intel.com>,
        Light Hsieh <light.hsieh@mediatek.com>,
        Sean Wang <sean.wang@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Light can you look into this warning?

I think the shadowing is fine, but can we just make the other
pullup local to where it is used as well so we get rid of this?

Yours,
Linus Walleij

On Sat, Mar 28, 2020 at 8:42 AM kbuild test robot <lkp@intel.com> wrote:
>
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git  devel
> branch HEAD: 13bec8d49bdf10aab4e1570ef42417f6bfbb6126  pinctrl: qcom: use scm_call to route GPIO irq to Apps
>
> Regressions in current branch:
>
> bool pullup;
> drivers/pinctrl/mediatek/pinctrl-paris.c:167:9: note: Shadow variable
> drivers/pinctrl/mediatek/pinctrl-paris.c:167:9: warning: Local variable 'pullup' shadows outer variable [shadowVariable]
> drivers/pinctrl/mediatek/pinctrl-paris.c:81:6: note: Shadowed declaration
> int pullup, err, reg, ret = 1;
>
> Error ids grouped by kconfigs:
>
> recent_errors
> `-- x86_64-allyesconfig
>     |-- bool-pullup
>     |-- drivers-pinctrl-mediatek-pinctrl-paris.c:note:Shadow-variable
>     |-- drivers-pinctrl-mediatek-pinctrl-paris.c:note:Shadowed-declaration
>     |-- drivers-pinctrl-mediatek-pinctrl-paris.c:warning:Local-variable-pullup-shadows-outer-variable-shadowVariable
>     `-- int-pullup-err-reg-ret
>
> elapsed time: 482m
>
> configs tested: 164
> configs skipped: 0
>
> arm                              allmodconfig
> arm                               allnoconfig
> arm                              allyesconfig
> arm64                            allmodconfig
> arm64                             allnoconfig
> arm64                            allyesconfig
> arm                         at91_dt_defconfig
> arm                           efm32_defconfig
> arm                          exynos_defconfig
> arm                        multi_v5_defconfig
> arm                        multi_v7_defconfig
> arm                        shmobile_defconfig
> arm                           sunxi_defconfig
> arm64                               defconfig
> sparc                            allyesconfig
> mips                              allnoconfig
> nds32                               defconfig
> sh                          rsk7269_defconfig
> s390                       zfcpdump_defconfig
> sparc64                          allyesconfig
> ia64                             allyesconfig
> ia64                             allmodconfig
> sparc                               defconfig
> i386                              allnoconfig
> i386                             allyesconfig
> i386                             alldefconfig
> i386                                defconfig
> ia64                                defconfig
> ia64                              allnoconfig
> ia64                             alldefconfig
> xtensa                          iss_defconfig
> xtensa                       common_defconfig
> openrisc                 simple_smp_defconfig
> openrisc                    or1ksim_defconfig
> nios2                         3c120_defconfig
> nios2                         10m50_defconfig
> c6x                        evmc6678_defconfig
> c6x                              allyesconfig
> nds32                             allnoconfig
> csky                                defconfig
> alpha                               defconfig
> h8300                       h8s-sim_defconfig
> h8300                     edosk2674_defconfig
> m68k                       m5475evb_defconfig
> m68k                             allmodconfig
> h8300                    h8300h-sim_defconfig
> m68k                          multi_defconfig
> m68k                           sun3_defconfig
> arc                                 defconfig
> arc                              allyesconfig
> microblaze                      mmu_defconfig
> microblaze                    nommu_defconfig
> powerpc                           allnoconfig
> powerpc                             defconfig
> powerpc                       ppc64_defconfig
> powerpc                          rhel-kconfig
> mips                           32r2_defconfig
> mips                         64r6el_defconfig
> mips                             allmodconfig
> mips                             allyesconfig
> mips                      fuloong2e_defconfig
> mips                      malta_kvm_defconfig
> parisc                            allnoconfig
> parisc                generic-64bit_defconfig
> parisc                generic-32bit_defconfig
> parisc                           allyesconfig
> x86_64               randconfig-a001-20200327
> x86_64               randconfig-a002-20200327
> x86_64               randconfig-a003-20200327
> i386                 randconfig-a001-20200327
> i386                 randconfig-a002-20200327
> i386                 randconfig-a003-20200327
> mips                 randconfig-a001-20200327
> nds32                randconfig-a001-20200327
> m68k                 randconfig-a001-20200327
> parisc               randconfig-a001-20200327
> alpha                randconfig-a001-20200327
> riscv                randconfig-a001-20200327
> c6x                  randconfig-a001-20200327
> h8300                randconfig-a001-20200327
> microblaze           randconfig-a001-20200327
> nios2                randconfig-a001-20200327
> sparc64              randconfig-a001-20200327
> csky                 randconfig-a001-20200327
> openrisc             randconfig-a001-20200327
> s390                 randconfig-a001-20200327
> sh                   randconfig-a001-20200327
> xtensa               randconfig-a001-20200327
> x86_64               randconfig-b001-20200327
> x86_64               randconfig-b002-20200327
> x86_64               randconfig-b003-20200327
> i386                 randconfig-b001-20200327
> i386                 randconfig-b002-20200327
> i386                 randconfig-b003-20200327
> x86_64               randconfig-c001-20200327
> x86_64               randconfig-c002-20200327
> x86_64               randconfig-c003-20200327
> i386                 randconfig-c001-20200327
> i386                 randconfig-c002-20200327
> i386                 randconfig-c003-20200327
> x86_64               randconfig-d001-20200327
> x86_64               randconfig-d002-20200327
> x86_64               randconfig-d003-20200327
> i386                 randconfig-d001-20200327
> i386                 randconfig-d002-20200327
> i386                 randconfig-d003-20200327
> x86_64               randconfig-e001-20200327
> x86_64               randconfig-e002-20200327
> x86_64               randconfig-e003-20200327
> i386                 randconfig-e001-20200327
> i386                 randconfig-e002-20200327
> i386                 randconfig-e003-20200327
> x86_64               randconfig-f001-20200327
> x86_64               randconfig-f002-20200327
> x86_64               randconfig-f003-20200327
> i386                 randconfig-f001-20200327
> i386                 randconfig-f002-20200327
> i386                 randconfig-f003-20200327
> x86_64               randconfig-g001-20200327
> x86_64               randconfig-g002-20200327
> x86_64               randconfig-g003-20200327
> i386                 randconfig-g001-20200327
> i386                 randconfig-g002-20200327
> i386                 randconfig-g003-20200327
> x86_64               randconfig-h001-20200327
> x86_64               randconfig-h002-20200327
> x86_64               randconfig-h003-20200327
> i386                 randconfig-h001-20200327
> i386                 randconfig-h002-20200327
> i386                 randconfig-h003-20200327
> arm                  randconfig-a001-20200327
> ia64                 randconfig-a001-20200327
> sparc                randconfig-a001-20200327
> arc                  randconfig-a001-20200327
> arm64                randconfig-a001-20200327
> powerpc              randconfig-a001-20200327
> riscv                            allmodconfig
> riscv                             allnoconfig
> riscv                            allyesconfig
> riscv                               defconfig
> riscv                    nommu_virt_defconfig
> riscv                          rv32_defconfig
> s390                             alldefconfig
> s390                             allmodconfig
> s390                              allnoconfig
> s390                             allyesconfig
> s390                          debug_defconfig
> s390                                defconfig
> sh                               allmodconfig
> sh                  sh7785lcr_32bit_defconfig
> sh                                allnoconfig
> sh                            titan_defconfig
> sparc64                          allmodconfig
> sparc64                           allnoconfig
> sparc64                             defconfig
> um                           x86_64_defconfig
> um                             i386_defconfig
> um                                  defconfig
> x86_64                               rhel-7.6
> x86_64                                   rhel
> x86_64                         rhel-7.2-clear
> x86_64                                    lkp
> x86_64                              fedora-25
> x86_64                                  kexec
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
