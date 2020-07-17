Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC0E223541
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 09:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726113AbgGQHPW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 03:15:22 -0400
Received: from mga05.intel.com ([192.55.52.43]:10662 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725995AbgGQHPW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 03:15:22 -0400
IronPort-SDR: gmIj8f1vY0PwJtoxy64Y77CezPIXO9Kovg029N3UgXfJX3Oisjr99eMjCJ9oRuHNiov434pwgM
 vroZMwTQTDjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="234400353"
X-IronPort-AV: E=Sophos;i="5.75,362,1589266800"; 
   d="scan'208";a="234400353"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2020 00:15:18 -0700
IronPort-SDR: Khy1S/wlWAp+D46uetcQbZv89YW8jH2J8zZ+nqHv9A6s09UTwPiaaBLCq7/XbAbnBnFNWO5dXD
 jXvWaYlHI52g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,362,1589266800"; 
   d="scan'208";a="430758934"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.3]) ([10.239.13.3])
  by orsmga004.jf.intel.com with ESMTP; 17 Jul 2020 00:15:15 -0700
Subject: Re: [kbuild-all] Re: [gpio:ib-for-each-clump 4/4]
 include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type
 unsigned long
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        kernel test robot <lkp@intel.com>
Cc:     Syed Nayyar Waris <syednwaris@gmail.com>, kbuild-all@lists.01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
References: <202007170339.nHjeGJBw%lkp@intel.com>
 <CAHp75VezG1ZnC-1UWea2Q-q-=c_32HOcBTXrd7cy4HzB-uW8JA@mail.gmail.com>
From:   Rong Chen <rong.a.chen@intel.com>
Message-ID: <4cd8eb7e-f21f-29a7-08ab-c691c1260c55@intel.com>
Date:   Fri, 17 Jul 2020 15:14:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VezG1ZnC-1UWea2Q-q-=c_32HOcBTXrd7cy4HzB-uW8JA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 7/17/20 5:25 AM, Andy Shevchenko wrote:
> On Thu, Jul 16, 2020 at 11:13 PM kernel test robot <lkp@intel.com> wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git ib-for-each-clump
>> head:   3358c938236d6a1be51124fbbb2698e50689d382
>> commit: 3358c938236d6a1be51124fbbb2698e50689d382 [4/4] gpio: xilinx: Utilize generic bitmap_get_value and _set_value.
>> config: alpha-randconfig-s031-20200716 (attached as .config)
>> compiler: alpha-linux-gcc (GCC) 9.3.0
>> reproduce:
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # apt-get install sparse
>>          # sparse version: v0.6.2-49-g707c5017-dirty
>>          git checkout 3358c938236d6a1be51124fbbb2698e50689d382
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=alpha
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>>
>> sparse warnings: (new ones prefixed by >>)
>>
>>>> include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type unsigned long
>>>> include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type unsigned long
>>     include/linux/bitmap.h:594:63: sparse: sparse: shift too big (64) for type unsigned long
>>>> include/linux/bitmap.h:639:45: sparse: sparse: shift too big (64) for type unsigned long
>>>> include/linux/bitmap.h:638:17: sparse: sparse: invalid access past the end of 'old' (8 8)
>> vim +639 include/linux/bitmap.h
>>
>> 169c474fb22d8a5 William Breathitt Gray 2019-12-04  613
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  614  /**
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  615   * bitmap_set_value - set n-bit value within a memory region
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  616   * @map: address to the bitmap memory region
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  617   * @value: value of nbits
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  618   * @start: bit offset of the n-bit value
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  619   * @nbits: size of value in bits
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  620   */
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  621  static inline void bitmap_set_value(unsigned long *map,
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  622                                      unsigned long value,
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  623                                      unsigned long start, unsigned long nbits)
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  624  {
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  625          const size_t index = BIT_WORD(start);
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  626          const unsigned long offset = start % BITS_PER_LONG;
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  627          const unsigned long ceiling = roundup(start + 1, BITS_PER_LONG);
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  628          const unsigned long space = ceiling - start;
> If start == 0:
>    index = 0, offset = 0, ceiling = 64, space = 64
>
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  629
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  630          value &= GENMASK(nbits - 1, 0);
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  631
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  632          if (space >= nbits) {
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  633                  map[index] &= ~(GENMASK(nbits + offset - 1, offset));
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  634                  map[index] |= value << offset;
> if nbits > space...
>
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  635          } else {
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  636                  map[index] &= ~BITMAP_FIRST_WORD_MASK(start);
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  637                  map[index] |= value << offset;
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27 @638                  map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27 @639                  map[index + 1] |= (value >> space);
> space = 64...
>
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  640          }
>> e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27  641  }
> I don't see the test case for this. Can you provide one?
>
>

Hi Andy,

Sparse doesn't check the if condition, it found the issues related to 
the below two lines
when bitmap_set_value was first time used in this commit.

e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27 @638                  map[index + 1] &= ~BITMAP_LAST_WORD_MASK(start + nbits);
e77c9b6f35c4bdf Syed Nayyar Waris      2020-06-27 @639                  map[index + 1] |= (value >> space);

Best Regards,
Rong Chen

