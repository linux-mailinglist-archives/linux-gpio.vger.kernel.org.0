Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E07BA422ADD
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Oct 2021 16:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235917AbhJEOV4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Oct 2021 10:21:56 -0400
Received: from mx.socionext.com ([202.248.49.38]:10312 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235640AbhJEOVz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Oct 2021 10:21:55 -0400
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 05 Oct 2021 23:20:04 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 4A40B2059034;
        Tue,  5 Oct 2021 23:20:04 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP; Tue, 5 Oct 2021 23:20:04 +0900
Received: from yuzu2.css.socionext.com (yuzu2 [172.31.9.57])
        by iyokan2.css.socionext.com (Postfix) with ESMTP id 02111B62B7;
        Tue,  5 Oct 2021 23:20:03 +0900 (JST)
Received: from [10.212.181.36] (unknown [10.212.181.36])
        by yuzu2.css.socionext.com (Postfix) with ESMTP id 8BB89B62B3;
        Tue,  5 Oct 2021 23:20:02 +0900 (JST)
Subject: Re: [PATCH 3/3] pinctrl: uniphier: Add UniPhier NX1 pinctrl driver
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1633399920-1537-4-git-send-email-hayashi.kunihiko@socionext.com>
 <202110052101.CZroR9ku-lkp@intel.com>
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Message-ID: <9acc6fe3-ff06-106b-4289-92319d43f100@socionext.com>
Date:   Tue, 5 Oct 2021 23:20:02 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202110052101.CZroR9ku-lkp@intel.com>
Content-Type: text/plain; charset=iso-2022-jp; format=flowed; delsp=yes
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2021/10/05 22:06, kernel test robot wrote:
> Hi Kunihiko,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linusw-pinctrl/devel]
> [also build test ERROR on robh/for-next v5.15-rc3 next-20210922]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:
> https://github.com/0day-ci/linux/commits/Kunihiko-Hayashi/pinctrl-uniphier
> -Introduce-some-features-and-NX1-support/20211005-101346
> base:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
> devel
> config: powerpc-allyesconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>          wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          #
> https://github.com/0day-ci/linux/commit/c68781cbddcc323070eee04896f6f85884
> 0a60dc
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review
> Kunihiko-Hayashi/pinctrl-uniphier-Introduce-some-features-and-NX1-support/
> 20211005-101346
>          git checkout c68781cbddcc323070eee04896f6f858840a60dc
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross
> ARCH=powerpc
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/pinctrl/uniphier/pinctrl-uniphier-nx1.c:429:27: error:
> 'usb3_groups' defined but not used [-Werror=unused-const-variable=]
>       429 | static const char * const usb3_groups[] = {"usb3"};
>           |                           ^~~~~~~~~~~
>>> drivers/pinctrl/uniphier/pinctrl-uniphier-nx1.c:428:27: error:
> 'usb2_groups' defined but not used [-Werror=unused-const-variable=]
>       428 | static const char * const usb2_groups[] = {"usb2"};
>           |                           ^~~~~~~~~~~
>     cc1: all warnings being treated as errors

The usb2 and usb3 groups don't exist. I'll remove them in next.

Thank you,

---
Best Regards
Kunihiko Hayashi
