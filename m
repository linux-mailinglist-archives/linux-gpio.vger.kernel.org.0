Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71330A814A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 13:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbfIDLoN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 07:44:13 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33648 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfIDLoN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 07:44:13 -0400
Received: by mail-ot1-f67.google.com with SMTP id p23so20276204oto.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2019 04:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pbqCLmsN2JUaXwLa8rFxU6MS0nhbAR8VGpMyJ61yo0k=;
        b=b+QhebFox0A9DLIc+ICQ8AvzA7SICDbGitNYK4VrgnZHxu3EB9sZ7gzRwEL3LXsnPv
         f6i4ZnIrjVAgFQQ0w2Qus6EyGBt66cBx6GyoWDwCxeaiPPoILLs/fwv/SpiIsJ+lCpRb
         vFcRS3SDf2gbtjjISnx5iOlDPNOuAtS0Kgv8shA/+NAcfDAPmeNsoT3w5/9IYXSd7/u/
         Lt/clngmXFqTHd5Tukh4F3hjDI1K6OCwvibe7+UqQzZOLGUrOVEmDPtatU/IpOYp4wZQ
         0WCmW+8lkE3tZi1sQRRHnnQ7ENI3aGlSwwent+MBLm6FqnmuNfZbSlhccOsJhAuLrnu7
         LPsg==
X-Gm-Message-State: APjAAAVNWjngSNPB40/EdQVcr0/2fdWtjwlJegOUdakcSYBu1uizI01x
        xOyD9t9gKqPzdw7WLT/eetvKjmj8S3w8bdywutw=
X-Google-Smtp-Source: APXvYqx3astntKHunAgq+kE0+LkQNL25BcGZW8dCgJg39qpq0sb2+Z0NkWBTBGBxcn0Fw3f6G4G1y0nU2D+3WsVhlDY=
X-Received: by 2002:a9d:6c12:: with SMTP id f18mr6315532otq.297.1567597452362;
 Wed, 04 Sep 2019 04:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <201909041904.FgFKdAf7%lkp@intel.com>
In-Reply-To: <201909041904.FgFKdAf7%lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Sep 2019 13:44:01 +0200
Message-ID: <CAMuHMdWLR-2Wd7M+KAmk7mKaCw=pUTY4DCehFwbrg_griPrGoA@mail.gmail.com>
Subject: Re: [pinctrl:for-next 16/77] drivers/pinctrl/bcm/pinctrl-bcm2835.c:995:10:
 error: incompatible types when assigning to type 'volatile struct SHIFTER'
 from type 'unsigned int'
To:     kbuild test robot <lkp@intel.com>
Cc:     Stefan Wahren <wahrenst@gmx.net>, kbuild-all@01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 4, 2019 at 1:08 PM kbuild test robot <lkp@intel.com> wrote:
> FYI, the error/warning still remains.
>
> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git for-next
> head:   bacada1c3fb4f116c8a1ebc864a9bd4ffd14e2d2
> commit: e38a9a437fb93ddafab5030165e4c6a3a5021669 [16/77] pinctrl: bcm2835: Add support for BCM2711 pull-up functionality
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
> All errors (new ones prefixed by >>):
>
>    In file included from arch/m68k/include/asm/io_mm.h:32:0,
>                     from arch/m68k/include/asm/io.h:8,
>                     from include/linux/io.h:13,
>                     from include/linux/irq.h:20,
>                     from include/linux/gpio/driver.h:7,
>                     from drivers/pinctrl/bcm/pinctrl-bcm2835.c:17:
>    drivers/pinctrl/bcm/pinctrl-bcm2835.c: In function 'bcm2711_pull_config_set':
> >> arch/m68k/include/asm/atarihw.h:190:22: error: expected identifier or '(' before 'volatile'

https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/commit/?h=for-v5.4&id=053b514295694f3336e97f56d5f41c0d4972c109

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
