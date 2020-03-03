Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E23E4176F96
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 07:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbgCCGnI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 01:43:08 -0500
Received: from mga06.intel.com ([134.134.136.31]:63080 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725440AbgCCGnI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 3 Mar 2020 01:43:08 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Mar 2020 22:43:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,510,1574150400"; 
   d="scan'208";a="233516366"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.3]) ([10.239.13.3])
  by orsmga008.jf.intel.com with ESMTP; 02 Mar 2020 22:43:05 -0800
Subject: Re: [PATCH 2/2] pinctrl: sprd: Allow the SPRD pinctrl driver building
 into a module
To:     Baolin Wang <baolin.wang7@gmail.com>,
        kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, Linus Walleij <linus.walleij@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <d7239f3c7379e402f665fc8927f635ac56691380.1582776447.git.baolin.wang7@gmail.com>
 <202002290858.UhNBgssD%lkp@intel.com>
 <CADBw62pAtWkoSqX=d=3qvi+JLwb28OnMd2VHSaC130ScYpNJ1g@mail.gmail.com>
From:   Rong Chen <rong.a.chen@intel.com>
Message-ID: <89d9811d-9c6d-6e53-4da7-60026c1b0ced@intel.com>
Date:   Tue, 3 Mar 2020 14:42:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CADBw62pAtWkoSqX=d=3qvi+JLwb28OnMd2VHSaC130ScYpNJ1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/2/20 10:33 AM, Baolin Wang wrote:
> Hi
>
> On Sat, Feb 29, 2020 at 8:41 AM kbuild test robot <lkp@intel.com> wrote:
>> Hi Baolin,
>>
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on pinctrl/devel]
>> [also build test ERROR on v5.6-rc3 next-20200228]
>> [if your patch is applied to the wrong git tree, please drop us a note to help
>> improve the system. BTW, we also suggest to use '--base' option to specify the
>> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>>
>> url:    https://github.com/0day-ci/linux/commits/Baolin-Wang/pinctrl-Export-some-needed-symbols-at-module-load-time/20200227-121948
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
>> config: i386-randconfig-d003-20200229 (attached as .config)
>> compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
>> reproduce:
>>          # save the attached .config to linux build tree
>>          make ARCH=i386
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>     drivers/pinctrl/sprd/pinctrl-sprd.c: In function 'sprd_dt_node_to_map':
>>>> drivers/pinctrl/sprd/pinctrl-sprd.c:282:8: error: implicit declaration of function 'pinconf_generic_parse_dt_config'; did you mean 'pinconf_generic_dump_config'? [-Werror=implicit-function-declaration]
>>       ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
>>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>             pinconf_generic_dump_config
>>     cc1: some warnings being treated as errors
> I followed your attached configuration, but I can not reproduce your
> building error. Did I miss anything else? Thanks.
>
> CONFIG_PINCTRL=y
> CONFIG_PINMUX=y
> CONFIG_GENERIC_PINMUX_FUNCTIONS=y
> CONFIG_PINCONF=y
> CONFIG_GENERIC_PINCONF=y
> CONFIG_PINCTRL_SPRD=y
> CONFIG_PINCTRL_SPRD_SC9860=y
>

Hi Baolin,

We can reproduce this error with attached config and our branch 
"https://github.com/0day-ci/linux/commits/Baolin-Wang/pinctrl-Export-some-needed-symbols-at-module-load-time/20200227-121948",
could you try again?

Best Regards,
Rong Chen
