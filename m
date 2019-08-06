Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E003482CDB
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 09:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731711AbfHFHdN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 03:33:13 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41011 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732045AbfHFHdM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Aug 2019 03:33:12 -0400
Received: by mail-oi1-f195.google.com with SMTP id g7so65170822oia.8
        for <linux-gpio@vger.kernel.org>; Tue, 06 Aug 2019 00:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GXslxLmCSTtMqmeWu8j6nTG8rmJSJ7kOnHquuxz62DY=;
        b=m9ryEwemhCGksdo1RGfOic3WKvLgBjuGxEyAKl9uhvvF97WGPGXo5Qo5RC6I+FDiqm
         WA6J5Jta9MSW4aG9CZvvCEQuPvdrpG7W83Z4/nvS5KD5UIRbT/iVO5DtiimFhM16x93F
         5IenyEpEGI/r4X3csu8axPcgC+mqbd/efiKZ1/U83LSWbpkGFi5O8LifrudIC/1RPptn
         6lqHV2Uw2XtTIOpZw3V9pzq3DjpYRo4tRXz3P6I8Jsm0gefY6cMPPHJ6iNnTvv/vDJFq
         XQpELgIVbzJUB7eaZEsOwqiHoe6Bj2gE9QCsRjGZzQ1+eVMzXp1KRFKMQbSeQ5KPJ1kX
         8MqQ==
X-Gm-Message-State: APjAAAVmF+WLbe3Rm5g/ZZbRs5aCuyqJnVPPe8GXohOeMqR68Mk6C2ME
        oUiiL/eex8F9OKPm4OTs+kHHyI8/roKp+hFmuybpWw==
X-Google-Smtp-Source: APXvYqz3DUoMt1/1pQoLSSr1t/+o/Hh4eFUtSMVil3SpXzl0goDWTjrVVxAdBdsS3PiZzzzpzGAkzNYkPjryL092PE0=
X-Received: by 2002:aca:c4d5:: with SMTP id u204mr751088oif.131.1565076791190;
 Tue, 06 Aug 2019 00:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <201908061021.pQY2TnEK%lkp@intel.com>
In-Reply-To: <201908061021.pQY2TnEK%lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 6 Aug 2019 09:33:00 +0200
Message-ID: <CAMuHMdU1djc8-c1LvNLFyFa0eH9C3k8nxjN_6F40S43mYZH7Hw@mail.gmail.com>
Subject: Re: [pinctrl:devel 16/46] drivers/pinctrl/bcm/pinctrl-bcm2835.c:995:10:
 error: incompatible types when assigning to type 'volatile struct SHIFTER'
 from type 'unsigned int'
To:     kbuild test robot <lkp@intel.com>
Cc:     Stefan Wahren <wahrenst@gmx.net>, kbuild-all@01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

CC linux-m68k (shifter too generic a name?)

On Tue, Aug 6, 2019 at 5:00 AM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> head:   d55b7fdd58ac12e76ef65979af4a13b9c15fc00d
> commit: e38a9a437fb93ddafab5030165e4c6a3a5021669 [16/46] pinctrl: bcm2835: Add support for BCM2711 pull-up functionality
> config: m68k-allmodconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout e38a9a437fb93ddafab5030165e4c6a3a5021669
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=m68k
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All error/warnings (new ones prefixed by >>):
>
>    In file included from arch/m68k/include/asm/io_mm.h:32:0,
>                     from arch/m68k/include/asm/io.h:8,
>                     from include/linux/io.h:13,
>                     from include/linux/irq.h:20,
>                     from include/linux/gpio/driver.h:7,
>                     from drivers/pinctrl/bcm/pinctrl-bcm2835.c:17:
>    drivers/pinctrl/bcm/pinctrl-bcm2835.c: In function 'bcm2711_pull_config_set':
> >> arch/m68k/include/asm/atarihw.h:190:22: error: expected identifier or '(' before 'volatile'
>     # define shifter ((*(volatile struct SHIFTER *)SHF_BAS))
>                          ^
> >> drivers/pinctrl/bcm/pinctrl-bcm2835.c:990:6: note: in expansion of macro 'shifter'
>      u32 shifter;
>          ^~~~~~~
> >> arch/m68k/include/asm/atarihw.h:172:17: error: expected ')' before '(' token
>     #define SHF_BAS (0xffff8200)
>                     ^
> >> arch/m68k/include/asm/atarihw.h:190:48: note: in expansion of macro 'SHF_BAS'
>     # define shifter ((*(volatile struct SHIFTER *)SHF_BAS))
>                                                    ^~~~~~~
> >> drivers/pinctrl/bcm/pinctrl-bcm2835.c:990:6: note: in expansion of macro 'shifter'
>      u32 shifter;
>          ^~~~~~~
> >> drivers/pinctrl/bcm/pinctrl-bcm2835.c:995:10: error: incompatible types when assigning to type 'volatile struct SHIFTER' from type 'unsigned int'
>      shifter = PUD_2711_REG_SHIFT(pin);
>              ^
> >> drivers/pinctrl/bcm/pinctrl-bcm2835.c:998:27: error: invalid operands to binary << (have 'int' and 'volatile struct SHIFTER')
>      value &= ~(PUD_2711_MASK << shifter);
>                               ^~
> >> drivers/pinctrl/bcm/pinctrl-bcm2835.c:999:16: error: invalid operands to binary << (have 'unsigned int' and 'volatile struct SHIFTER')
>      value |= (arg << shifter);
>                    ^~
> --
>    In file included from arch/m68k/include/asm/io_mm.h:32:0,
>                     from arch/m68k/include/asm/io.h:8,
>                     from include/linux/io.h:13,
>                     from include/linux/irq.h:20,
>                     from include/linux/gpio/driver.h:7,
>                     from drivers/pinctrl//bcm/pinctrl-bcm2835.c:17:
>    drivers/pinctrl//bcm/pinctrl-bcm2835.c: In function 'bcm2711_pull_config_set':
> >> arch/m68k/include/asm/atarihw.h:190:22: error: expected identifier or '(' before 'volatile'
>     # define shifter ((*(volatile struct SHIFTER *)SHF_BAS))
>                          ^
>    drivers/pinctrl//bcm/pinctrl-bcm2835.c:990:6: note: in expansion of macro 'shifter'
>      u32 shifter;
>          ^~~~~~~
> >> arch/m68k/include/asm/atarihw.h:172:17: error: expected ')' before '(' token
>     #define SHF_BAS (0xffff8200)
>                     ^
> >> arch/m68k/include/asm/atarihw.h:190:48: note: in expansion of macro 'SHF_BAS'
>     # define shifter ((*(volatile struct SHIFTER *)SHF_BAS))
>                                                    ^~~~~~~
>    drivers/pinctrl//bcm/pinctrl-bcm2835.c:990:6: note: in expansion of macro 'shifter'
>      u32 shifter;
>          ^~~~~~~
>    drivers/pinctrl//bcm/pinctrl-bcm2835.c:995:10: error: incompatible types when assigning to type 'volatile struct SHIFTER' from type 'unsigned int'
>      shifter = PUD_2711_REG_SHIFT(pin);
>              ^
>    drivers/pinctrl//bcm/pinctrl-bcm2835.c:998:27: error: invalid operands to binary << (have 'int' and 'volatile struct SHIFTER')
>      value &= ~(PUD_2711_MASK << shifter);
>                               ^~
>    drivers/pinctrl//bcm/pinctrl-bcm2835.c:999:16: error: invalid operands to binary << (have 'unsigned int' and 'volatile struct SHIFTER')
>      value |= (arg << shifter);
>                    ^~
>
> vim +995 drivers/pinctrl/bcm/pinctrl-bcm2835.c
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
