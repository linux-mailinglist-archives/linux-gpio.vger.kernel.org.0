Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B01220025F
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2020 09:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729508AbgFSHBV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Jun 2020 03:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728109AbgFSHAt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jun 2020 03:00:49 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E27C06174E;
        Fri, 19 Jun 2020 00:00:48 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id g3so8285296ilq.10;
        Fri, 19 Jun 2020 00:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QMbAt1k2a7uyQKReEMHBWVP+e2hPp2/KEXSt2hE1Dgs=;
        b=EnS0KyEyEIhjKeIuzeRJah7X1i1UxSV1Rc5cg+gRQzYq1q+L5/rIHmPaol264xjvv/
         ks5u6LizmnNhGeOrdThBcxEi4lbW0gqmxdWnnXhUuae2Rndf3306vsbIaQ63dbMQHwVj
         PIO7rL9Vuccj87q+5SInY3YfNmAQ/z7GqQ5GvXQcpTZyxTj9YAiuXDcrDxPBfjbyakre
         umL5Z0trF2e6Cmx4ps5DBd/MDfNFe/XbV0qq2virnNtr+AwDoXIb2ZluQvKMGG9EKoA/
         hquSIKw1J2zOjAslzI+MQ4aUxDJXd6kwq9gsYPKXY3SWWewO+m9DXb0jqYm60TaSn/c/
         dLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QMbAt1k2a7uyQKReEMHBWVP+e2hPp2/KEXSt2hE1Dgs=;
        b=ko4iyFcsMiIug46MysXAr5gc6GvpAxstkMiIgvO0tAD38fuvIwPxTphFYXhoxSjYu+
         QIkAmNqhxYWMlwEgJVVigi8xxgCrcGVCh2PnRRFVwfGmP9+8ugAUkSdIJ7FyOXgIgDQu
         YDhRiNqWduVqT8krCa1vB6tWh3HlYrOd2WPyIi5Z4ddKwPjVEGbKxUnMT0LIKMFfB+TE
         LQUr30Fy4BiYSJvuwxBdeWkKbAXhMUMqceikPOCgH1oi4UsRAEHtOEXSdHsO04yeH9xM
         64S0uismSbKwSdrMbAUla2PuTBB0z4VZyqvFBe/MjYW3yvvQO33jIYlO3TudWgLGFbBj
         Zi7Q==
X-Gm-Message-State: AOAM532MCJp/GeUGsFQc8omO2QaV8wnYc7nlHu7toc/zZKKUlicX6j0p
        S37NXXIiuVH0aXthuIP0rebpwLgAIwWCeZs5Ge4=
X-Google-Smtp-Source: ABdhPJwmpb/UzzdKSIlxsufaFoBTyO0NylKvjrCptfFcs41NjlXUvcCtPjMUjTr5Ee8orMJapfBSGtIuuZAWG73cUHM=
X-Received: by 2002:a92:2410:: with SMTP id k16mr2334391ilk.40.1592550046708;
 Fri, 19 Jun 2020 00:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <46c05c5deeada60a13ee0de83c68583d578f42fd.1592224129.git.syednwaris@gmail.com>
 <202006160420.iatdr9ab%lkp@intel.com>
In-Reply-To: <202006160420.iatdr9ab%lkp@intel.com>
From:   Syed Nayyar Waris <syednwaris@gmail.com>
Date:   Fri, 19 Jun 2020 12:30:35 +0530
Message-ID: <CACG_h5qUZsR7Zd9a+BQJqyuJZBrv-en+gC-sgcV+xV+A5ZOBhA@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] gpio: xilinx: Utilize for_each_set_clump macro
To:     kernel test robot <lkp@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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

>
> Hi Syed,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on 444fc5cde64330661bf59944c43844e7d4c2ccd8]
>
> url:    https://github.com/0day-ci/linux/commits/Syed-Nayyar-Waris/Introduce-the-for_each_set_clump-macro/20200615-205729
> base:    444fc5cde64330661bf59944c43844e7d4c2ccd8
> config: sparc64-randconfig-s032-20200615 (attached as .config)
> compiler: sparc64-linux-gcc (GCC) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.2-rc1-3-g55607964-dirty
>         # save the attached .config to linux build tree
>         make W=1 C=1 ARCH=sparc64 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
>

>
>
> sparse warnings: (new ones prefixed by >>)
>
> >> include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type unsigned long
> >> include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type unsigned long
>    include/linux/bitmap.h:594:63: sparse: sparse: shift too big (64) for type unsigned long
> >> include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type unsigned long
> >> include/linux/bitmap.h:638:17: sparse: sparse: invalid access past the end of 'old' (8 8)
>

Hi All,

It seems to me that to reproduce this warning, I have to use the
sparc64 compiler. I have installed 'sparc64-linux-gnu-gcc' on my
computer.
I have to specify that this compiler needs to be used for build
process. How/ Where do I specify this?

I have downloaded the config.gz (has config file) and placed it at the
root of the linux kernel project tree. But the Makefile STILL has
'gcc' as the compiler. When I build, it is the 'gcc' compiler being
used and not 'sparc64-linux-gnu-gcc'. I know I can manually change the
Makefile to use sparc64 compiler, but I think there must be some more
elegant way to do this, perhaps using make menuconfig?

Kindly illuminate as to how shall I reproduce the compiler warning.

Regards
Syed Nayyar Waris

> vim +639 include/linux/bitmap.h
>
> 169c474fb22d8a William Breathitt Gray 2019-12-04  613
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  614  /**
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  615   * bitmap_set_value - set n-bit value within a memory region
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  616   * @map: address to the bitmap memory region
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  617   * @value: value of nbits
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  618   * @start: bit offset of the n-bit value
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  619   * @nbits: size of value in bits
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  620   */
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  621  static inline void bitmap_set_value(unsigned long *map,
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  622                               unsigned long value,
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  623                               unsigned long start, unsigned long nbits)
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  624  {
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  625   const size_t index = BIT_WORD(start);
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  626   const unsigned long offset = start % BITS_PER_LONG;
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  627   const unsigned long ceiling = roundup(start + 1, BITS_PER_LONG);
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  628   const unsigned long space = ceiling - start;
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  629
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  630   value &= GENMASK(nbits - 1, 0);
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  631
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  632   if (space >= nbits) {
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  633           map[index] &= ~(GENMASK(nbits + offset - 1, offset));
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  634           map[index] |= value << offset;
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  635   } else {
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  636           map[index] &= ~BITMAP_FIRST_WORD_MASK(start);
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  637           map[index] |= value << offset;
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15 @638           map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15 @639           map[index + 1] |= (value >> space);
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  640   }
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  641  }
> 803024b6c8a375 Syed Nayyar Waris      2020-06-15  642
>
> :::::: The code at line 639 was first introduced by commit
> :::::: 803024b6c8a375ba9e9e9467595d7d52d4f6a38e bitops: Introduce the for_each_set_clump macro
>
> :::::: TO: Syed Nayyar Waris <syednwaris@gmail.com>
