Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49A94222DD5
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 23:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgGPVZY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 17:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgGPVZY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 17:25:24 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62528C061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 14:25:24 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a24so4289013pfc.10
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 14:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GG+PNWm9iZNfqKSSIfajFJa0+VgslChKnK9y+Ke7jec=;
        b=DUlzbd5sFRPqB/nf6WS2eQmmH+ojys4H+flIGMODRdvZf6uO9gVBX+fDGndvdBlL29
         1Ue00nuTcjXFk7VKoOdbAuLsVgHQsRHUpkiU3Td0SKFUdOWpWPOGRAwzM9tQ1RDITYXT
         VNwBiFOClaxSYHb8q3s3qlUT9huEtVxAifsH/w0iHKJDA3zuDPidoVVrErSri7g85vRE
         1NfZtFcRD24dKxxT+dVd4POMNJ3XIYtI0hj6rOuTXPVMgJls7hsdteTYDQiG+u2bpQyW
         +otE1x8xwgVdHE36JXik1edaUszy+fdhGjCSLWAijpYEPTKify1tBoJGgXwrfmCB745H
         FEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GG+PNWm9iZNfqKSSIfajFJa0+VgslChKnK9y+Ke7jec=;
        b=GqPF7N6GpB9mDAgluzTn7oxNAc+2W6f/N3FqvQwfo7XEUMX4lDJVcSa8LsvyZNq+mx
         793rtnQangWJ6utVgDF/g3Ze+TVW8NzYfv6Fv8Q6t1MMyQQBXNJ8wNqVyZA5A1gs/NAe
         8q5lxVpG+NpO+UIvh7EnDxBlZSmoVVIXRtK0NFlbCFvV9W+B+IvVz/CP952ldm6w8669
         qZl4AFBpE9n01+BFVdpF68DQJS3eOkVtb+4Hk/u4VLVZ7+epTJM+XOORO5x/tyfAizM9
         akyYXlgeGSs0KXHMszVsm/9QUSR0GMMuUGLbFrl5Xbf6HwyM1WijseJ0zHrWyGt0lMN7
         Ezkg==
X-Gm-Message-State: AOAM533xbGud10VvVA1ByBRUee1QrRg6xXQF648xgnSFpFXtAfQXDPg6
        YujwNLliOSAoSPU+MXCFZlKE44pCK6e8U3LbAes=
X-Google-Smtp-Source: ABdhPJzbbXwP4V1T11Anunh8L312z6cbh0BhWWrU5fcsRFAGCq5q+3M91Z7Dw9eRGUd0hjk4xcZAX3CWP6uVWUo4gH4=
X-Received: by 2002:aa7:8bcb:: with SMTP id s11mr5118689pfd.170.1594934723849;
 Thu, 16 Jul 2020 14:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <202007170339.nHjeGJBw%lkp@intel.com>
In-Reply-To: <202007170339.nHjeGJBw%lkp@intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Jul 2020 00:25:07 +0300
Message-ID: <CAHp75VezG1ZnC-1UWea2Q-q-=c_32HOcBTXrd7cy4HzB-uW8JA@mail.gmail.com>
Subject: Re: [gpio:ib-for-each-clump 4/4] include/linux/bitmap.h:639:45:
 sparse: sparse: shift too big (64) for type unsigned long
To:     kernel test robot <lkp@intel.com>
Cc:     Syed Nayyar Waris <syednwaris@gmail.com>, kbuild-all@lists.01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 16, 2020 at 11:13 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git ib-for-each-clump
> head:   3358c938236d6a1be51124fbbb2698e50689d382
> commit: 3358c938236d6a1be51124fbbb2698e50689d382 [4/4] gpio: xilinx: Utilize generic bitmap_get_value and _set_value.
> config: alpha-randconfig-s031-20200716 (attached as .config)
> compiler: alpha-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.2-49-g707c5017-dirty
>         git checkout 3358c938236d6a1be51124fbbb2698e50689d382
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=alpha
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
> 169c474fb22d8a5 William Breathitt Gray 2019-12-04  613
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  614  /**
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  615   * bitmap_set_value - set n-bit value within a memory region
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  616   * @map: address to the bitmap memory region
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  617   * @value: value of nbits
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  618   * @start: bit offset of the n-bit value
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  619   * @nbits: size of value in bits
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  620   */
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  621  static inline void bitmap_set_value(unsigned long *map,
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  622                                      unsigned long value,
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  623                                      unsigned long start, unsigned long nbits)
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  624  {
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  625          const size_t index = BIT_WORD(start);
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  626          const unsigned long offset = start % BITS_PER_LONG;
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  627          const unsigned long ceiling = roundup(start + 1, BITS_PER_LONG);
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  628          const unsigned long space = ceiling - start;

If start == 0:
  index = 0, offset = 0, ceiling = 64, space = 64

> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  629
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  630          value &= GENMASK(nbits - 1, 0);
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  631
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  632          if (space >= nbits) {
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  633                  map[index] &= ~(GENMASK(nbits + offset - 1, offset));
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  634                  map[index] |= value << offset;

if nbits > space...

> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  635          } else {
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  636                  map[index] &= ~BITMAP_FIRST_WORD_MASK(start);
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  637                  map[index] |= value << offset;

> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27 @638                  map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27 @639                  map[index + 1] |= (value >> space);

space = 64...

> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  640          }
> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  641  }

I don't see the test case for this. Can you provide one?


-- 
With Best Regards,
Andy Shevchenko
