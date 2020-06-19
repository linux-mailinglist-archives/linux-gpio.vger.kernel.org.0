Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07E87200434
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2020 10:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731384AbgFSIj1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Jun 2020 04:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730983AbgFSIjQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jun 2020 04:39:16 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F939C0613EE;
        Fri, 19 Jun 2020 01:39:16 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id j1so4146162pfe.4;
        Fri, 19 Jun 2020 01:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LfTeBjhR0kC/kK7WQYyTyG0IANM/qncZSxXBu+sRGtY=;
        b=T9dc5Ch5gxUc1jDKbjX71G2VmmZw1r7BEgF7KmxF4vnRI4P9j/V/WlaCptYKUtMpyR
         ivyJF2sc2mdUCSzFXIHeak5h1NO87TdMi/W6nBe4iWCmJrqta935EtSaBNOrTL3IwZAO
         oOkacdPcf6+R/gyEKdGw0gbicWVBdqDKEwf/hOQx5kVEXKc6fKzismDwvgX4JDNcbby+
         BoN5/dXiv2+guMQ4K20gWJQbEooxbr1h9BsXtv8vJfuK0/Ku4eGTmCPWMm+NrY3DpeUQ
         Iz5pVcaJqdpbjjMdikNdH2k+6S6TgL580Q6O4DPStdEpjkRKTPw9xUQxmmPTSBaqAZ1G
         7MLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LfTeBjhR0kC/kK7WQYyTyG0IANM/qncZSxXBu+sRGtY=;
        b=CkOkTc28sbiZsfW2p4fcdOiaiH5IFBl+7VvHBTBeKOKe8nqrb4J4/jqO6cApmZf8Hg
         YCcRc1rExO8qi9EOMjN2Z8hNwNRUyR2vvHma50Nkl/xLXJkAZJrW4Vq8h7jGwZ89TzEP
         Zd1Cm6aWRh5bc3l4fG8vwZbZaHIHWLD9mdFHX0GuTCXGj1a5AZjj0BKXAvWoJcUUgU87
         ktCMr31x5UDKGECxTcxDAdCszYjube9QHs6cwc53WJNzjgVESBzemtNBNSzDkIvvZpab
         HK7aW3hlwQ/0SE7KxbM4RaGdURjzyiGllFBkmXdRUZ8gIswkEt2aChZrXsLzRdt8Gzx8
         qbJA==
X-Gm-Message-State: AOAM532hxXTUD/48FTxcuYuBlQGzwWRfumu3WiWGu+fblCuTzzf9mQVb
        d0+EirILI5i0+mBrpv9C9qw47kHcx0oxy9NHWt4=
X-Google-Smtp-Source: ABdhPJxj+EHwZq+iO64fyDjYHgaXsf4TlDuik/wYP0ViFcx7bNlgX9UOQvCtKXgl3wBWGY7ZlfeZoULLrRn60mWoUR0=
X-Received: by 2002:a63:f042:: with SMTP id s2mr2179441pgj.4.1592555956013;
 Fri, 19 Jun 2020 01:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <46c05c5deeada60a13ee0de83c68583d578f42fd.1592224129.git.syednwaris@gmail.com>
 <202006160420.iatdr9ab%lkp@intel.com> <CACG_h5qUZsR7Zd9a+BQJqyuJZBrv-en+gC-sgcV+xV+A5ZOBhA@mail.gmail.com>
In-Reply-To: <CACG_h5qUZsR7Zd9a+BQJqyuJZBrv-en+gC-sgcV+xV+A5ZOBhA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 19 Jun 2020 11:38:59 +0300
Message-ID: <CAHp75Ve_=LwV6fO3ESgbCOVDVr=C5wrnAJX9od9evFvHU5-Krw@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] gpio: xilinx: Utilize for_each_set_clump macro
To:     Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     kernel test robot <lkp@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        kbuild-all@lists.01.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 19, 2020 at 10:02 AM Syed Nayyar Waris <syednwaris@gmail.com> wrote:

...

> > config: sparc64-randconfig-s032-20200615 (attached as .config)
> > compiler: sparc64-linux-gcc (GCC) 9.3.0
> > reproduce:
> >         # apt-get install sparse
> >         # sparse version: v0.6.2-rc1-3-g55607964-dirty
> >         # save the attached .config to linux build tree
> >         make W=1 C=1 ARCH=sparc64 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

...

> > sparse warnings: (new ones prefixed by >>)
> >
> > >> include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type unsigned long
> > >> include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type unsigned long
> >    include/linux/bitmap.h:594:63: sparse: sparse: shift too big (64) for type unsigned long
> > >> include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type unsigned long
> > >> include/linux/bitmap.h:638:17: sparse: sparse: invalid access past the end of 'old' (8 8)

> It seems to me that to reproduce this warning, I have to use the
> sparc64 compiler. I have installed 'sparc64-linux-gnu-gcc' on my
> computer.

Sparse is not a compiler.

> I have to specify that this compiler needs to be used for build
> process. How/ Where do I specify this?
>
> I have downloaded the config.gz (has config file) and placed it at the
> root of the linux kernel project tree. But the Makefile STILL has
> 'gcc' as the compiler. When I build, it is the 'gcc' compiler being
> used and not 'sparc64-linux-gnu-gcc'. I know I can manually change the
> Makefile to use sparc64 compiler, but I think there must be some more
> elegant way to do this, perhaps using make menuconfig?

If you wish to run a compilation, download a compiler from [1], and,
after adding its bin/ folder to PATH, run
make CROSS_COMPILE=sparc64-linux- ARCH=sparc64 ... # first generate .config

> Kindly illuminate as to how shall I reproduce the compiler warning.

> > 803024b6c8a375 Syed Nayyar Waris      2020-06-15 @638           map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
> > 803024b6c8a375 Syed Nayyar Waris      2020-06-15 @639           map[index + 1] |= (value >> space);

Hmm... I think I sent a reply [2] where I explained how space can be
64. Do you agree with analysis?

[1]: https://mirrors.edge.kernel.org/pub/tools/crosstool/
[2]: https://lore.kernel.org/lkml/20200616081428.GP2428291@smile.fi.intel.com/

-- 
With Best Regards,
Andy Shevchenko
