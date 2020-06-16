Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 376841FA869
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 07:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbgFPF5a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 01:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgFPF5a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 01:57:30 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 268DEC05BD43;
        Mon, 15 Jun 2020 22:57:30 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id l6so1536464ilo.2;
        Mon, 15 Jun 2020 22:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jO6HidFD2GZHYEdq4Pf2STG4Y5Qbo03mtR4akQ8KCrc=;
        b=XNcJFU+rZ0+XQJp6ONQ9hU4ZBMCl6KiGYneEjomu+Lm5Sl16WzM00tDZ3f7QKoct40
         Z4S778WXwJFLa9FZWahFfpuBaUw6AZD9ZZDt3Kizgl59ImGei18iRi/Xr4RuKc1wqG0x
         GpnQFApUOn0UBHJMFIRiHODUez3MBBgUiDA2CLc1tkdMnOTA1TQ1ldgaMOtPmfEo9ebS
         Py94inw3gWE2cFXJlNDTZcBVV/YJ2edW/w2AcuCdCCUSKV834QIWNDh7lg/EBOxCLZDI
         0HetA9coL37DNQoYHj4XOSn5NIhP7TwVMt4gHzhE1zZl+OcTDx0gfyQjJ55dlkw0VKzc
         LFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jO6HidFD2GZHYEdq4Pf2STG4Y5Qbo03mtR4akQ8KCrc=;
        b=s6EKW4h5AEkIu1/NmsDJTGgF2YCFsLNFg5NzUgkCfRA8KItf6bLPBA/J9vL8GXZ8gJ
         8Gu124TP7yp/CD58kMfm68k0l7ncwY0WlZlNlWZvgB2XCydFb86rUv2ti9+VbWK92QCf
         i7OquFe0Gi7+PzC4XYH1qKLpYWQH9RogElt0bkkwz0IjVNDglkYUSncpkrrIB0/71i7T
         SCP5LPVBP4AyZvIH6evTjQUkhsWFg00PiCD1JY1A2x2f1F/2xgtU68ILlkFwjshqwcDI
         smJ3lm0SiSh5Y4JmBS1bnytqrASwbVRGDz9imKR7z0C3L/VxYWr4jwMkTicK+AxmfzUw
         g6vg==
X-Gm-Message-State: AOAM533rJNwy2Uc1AXhgAcTLZkrhdsKgsSjZDv0KbMxYb9gV54Cm5fCT
        2KMTEk/aH98xnGZh2M6yvXLI1s1zB3xiz/NSaEv/DDuE
X-Google-Smtp-Source: ABdhPJzJ4ulFoSzwUUSDOauNc6vwON0bZod0JOc0uYBVetSDlB2Hekxu0gh7p7PaYD/VNrPCi/qFhMZ0NAHmZyf3amk=
X-Received: by 2002:a92:7309:: with SMTP id o9mr1580810ilc.205.1592287049436;
 Mon, 15 Jun 2020 22:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <46c05c5deeada60a13ee0de83c68583d578f42fd.1592224129.git.syednwaris@gmail.com>
 <202006160420.iatdr9ab%lkp@intel.com>
In-Reply-To: <202006160420.iatdr9ab%lkp@intel.com>
From:   Syed Nayyar Waris <syednwaris@gmail.com>
Date:   Tue, 16 Jun 2020 11:27:18 +0530
Message-ID: <CACG_h5oiA8mDpTjtyGFYR4eptbxppN9tq+2wUj8T1hsbZ5h47A@mail.gmail.com>
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

On Tue, Jun 16, 2020 at 1:39 AM kernel test robot <lkp@intel.com> wrote:
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
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
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


Regarding the compilation warning reported above:

"sparse: shift too big (64) for type unsigned long" at line 639
"sparse: invalid access past the end of 'old' (8 8)" at line 638

Kindly refer to the code above, at these line numbers.

I am in the process of fixing this warning. But what would be the fix
? At the moment can't think of a code-fix to make the compilation
warning disappear (specially at line 639). Can anyone please explain
to me the meaning of the compilation warning more deeply?

By the way, this warning was not reported in (earlier) v7 of the patchset.

Regards
Syed Nayyar Waris
