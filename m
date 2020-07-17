Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8156F2232A0
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 06:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgGQEt5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 00:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgGQEt4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 00:49:56 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80772C061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 21:49:56 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id y2so9212902ioy.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 21:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FWU237sSUccDGyjY3ERxkL/DlqCPEcmajsX2d1WiAkM=;
        b=dt/fdEvGmqGIp3wLB1opOMeg1CX8o5pKaMyYMGWE87Ikrazz6EyQ53ejHHvCLzpGq5
         DBd+WXurgBT2/x8MucTECdQR9XDr8YKXVx3O9UCobGe8CYDb6y/YD6yL9JKITdkTy9HE
         ldVQ/ZQN8mTyasm+G2gLaONoySoMGhPZk/Gb294blVkzRqNUUHWJyfNVRp/iUVR286AZ
         w36L0eVparMQ/qJHZ90LSOJEVs/cc+OXzHmDMtD8xnaZJnfglJTEPFzxEDggU8aSviTF
         JPL/vabhGTX+N0q89uiRH+ksUqEItKCxlMXqO31DYVVmH+26ECIG46L9AjdCOXkuBjWw
         CvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FWU237sSUccDGyjY3ERxkL/DlqCPEcmajsX2d1WiAkM=;
        b=DrzhoTyKWdjYlCfxHlEcG7Qmf80udVopie0omtBiLZYnHKCNIiBrh1e71SGMDa9rFk
         IZOQadMlCN8bOxFzRcfV0JfgL5UMHqaD0F5Um0Y79mgHlJOO7ojv7jNqHWfBE50HOZtn
         5dTCxRl18CeDzNftE6a416tMXOzSfkDVW9x0kv44MzLMEoFKx98cuXt7OCYXB47ALYUW
         HklN8/KJawmDESelIoXjOE5EEnsn8fsK2G5c7sUX0OmHCPhqNsCfLToTcCsWZb7mADxp
         jdCyfs2Iy/PzLZQ0VBo3RmXHcY+r8i0xY5DrFyp+6rhDZSpXcl/5QObNYM7bA0Pj12FX
         PDsA==
X-Gm-Message-State: AOAM530a4OkTEBgBZMUXfB7pFUmaGJ3cReMAhEzM6PgyuAQiAVFD44XZ
        2qZ3BlZ62m5YLcb9quT5RdckvEnPWQZWX7L5akA=
X-Google-Smtp-Source: ABdhPJzMyrFjir/H6t1rBWlT5IczAg5eEhpUfC1Bkk+nuWMJFh4SVeHFYD+jO+EGFbbr3M2f73rw1XNnHf//tQyh8yY=
X-Received: by 2002:a02:3905:: with SMTP id l5mr9256225jaa.64.1594961395610;
 Thu, 16 Jul 2020 21:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <202007170339.nHjeGJBw%lkp@intel.com> <CAHp75VezG1ZnC-1UWea2Q-q-=c_32HOcBTXrd7cy4HzB-uW8JA@mail.gmail.com>
In-Reply-To: <CAHp75VezG1ZnC-1UWea2Q-q-=c_32HOcBTXrd7cy4HzB-uW8JA@mail.gmail.com>
From:   Syed Nayyar Waris <syednwaris@gmail.com>
Date:   Fri, 17 Jul 2020 10:19:43 +0530
Message-ID: <CACG_h5rY6ViYFmwA0mA7+WemN402cs+WCrJAt_7x7qT19VGa6w@mail.gmail.com>
Subject: Re: [gpio:ib-for-each-clump 4/4] include/linux/bitmap.h:639:45:
 sparse: sparse: shift too big (64) for type unsigned long
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 2:55 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Jul 16, 2020 at 11:13 PM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git ib-for-each-clump
> > head:   3358c938236d6a1be51124fbbb2698e50689d382
> > commit: 3358c938236d6a1be51124fbbb2698e50689d382 [4/4] gpio: xilinx: Utilize generic bitmap_get_value and _set_value.
> > config: alpha-randconfig-s031-20200716 (attached as .config)
> > compiler: alpha-linux-gcc (GCC) 9.3.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # apt-get install sparse
> >         # sparse version: v0.6.2-49-g707c5017-dirty
> >         git checkout 3358c938236d6a1be51124fbbb2698e50689d382
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=alpha
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> >
> > sparse warnings: (new ones prefixed by >>)
> >
> > >> include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type unsigned long
> > >> include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type unsigned long
> >    include/linux/bitmap.h:594:63: sparse: sparse: shift too big (64) for type unsigned long
> > >> include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type unsigned long
> > >> include/linux/bitmap.h:638:17: sparse: sparse: invalid access past the end of 'old' (8 8)
> >
> > vim +639 include/linux/bitmap.h
> >
> > 169c474fb22d8a5 William Breathitt Gray 2019-12-04  613
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  614  /**
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  615   * bitmap_set_value - set n-bit value within a memory region
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  616   * @map: address to the bitmap memory region
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  617   * @value: value of nbits
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  618   * @start: bit offset of the n-bit value
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  619   * @nbits: size of value in bits
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  620   */
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  621  static inline void bitmap_set_value(unsigned long *map,
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  622                                      unsigned long value,
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  623                                      unsigned long start, unsigned long nbits)
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  624  {
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  625          const size_t index = BIT_WORD(start);
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  626          const unsigned long offset = start % BITS_PER_LONG;
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  627          const unsigned long ceiling = roundup(start + 1, BITS_PER_LONG);
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  628          const unsigned long space = ceiling - start;
>
> If start == 0:
>   index = 0, offset = 0, ceiling = 64, space = 64
>
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  629
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  630          value &= GENMASK(nbits - 1, 0);
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  631
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  632          if (space >= nbits) {
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  633                  map[index] &= ~(GENMASK(nbits + offset - 1, offset));
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  634                  map[index] |= value << offset;
>
> if nbits > space...
>
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  635          } else {
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  636                  map[index] &= ~BITMAP_FIRST_WORD_MASK(start);
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  637                  map[index] |= value << offset;
>
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27 @638                  map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27 @639                  map[index + 1] |= (value >> space);
>
> space = 64...
>
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  640          }
> > e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  641  }
>
> I don't see the test case for this. Can you provide one?
>
>
> --
> With Best Regards,
> Andy Shevchenko

Thanks Andy, but actually, I intentionally want and need 'space' to be
64, in the scenario (situation) mentioned above.

I think this same sparse warning was discussed earlier also, when this
same warning was reported by the buildbot in an earlier version of
patch. Later it was clarified by the sparse-check maintainer that this
warning is to be ignored and no code fix is required.

https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2202377.html

Regarding your question on the test case. Actually a 64 bit clump size
test is not added because the tests will always run; and when it runs
on machine where BITS_PER_LONG is 32 bits, it will fail, because in
'for_each_set_clump', it is needed that clump size is less than
BITS_PER_LONG.

I hope I have not misunderstood something.

Regards
Syed Nayyar Waris
