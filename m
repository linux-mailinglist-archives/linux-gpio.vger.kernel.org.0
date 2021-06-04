Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD3F39B381
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 09:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhFDHCt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 03:02:49 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:56360 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbhFDHCs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 03:02:48 -0400
Received: from [IPv6:2a02:a03f:eafb:ee01:47d6:9866:c9b9:c953] (unknown [IPv6:2a02:a03f:eafb:ee01:47d6:9866:c9b9:c953])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id A71062086B6;
        Fri,  4 Jun 2021 09:01:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1622790061;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PZjWkF3HmSV3fCyoJ2V0mvrJ6tQTUWP6Xhv41OdXGG8=;
        b=pC8626t8g8jZ/lLsJ1l5tJw6M4a6cDwpKM8u+aHpsbjNKypoiEraGec2fVSrEuHnWU7dVU
        qkW5UwQ6h2NPx5HawQEZGIBxKuO8A2xM4qjoqMb3Cpfe05GYvvlYSpUi3B1tcdRswIcJci
        Q1mqXnd+RQzi7YEUfnDRmWcSAXZI0+cXMrwiVzcvxukWO3/7ktgA46WFORN8Vh2s2axqy/
        jxIW1hNWlJ5WXVcbI3Xr0JhWnff9EHa4FFlrp06Fq3hoidJcUH/cYPIMdPLDtG0xKvqu5o
        FshDzuS4ZSnSDQSh/wxLI858bb93gLGFCVki+9PhlZ4NQaKIsFZMbnZVI3eBlw==
Message-ID: <4251bacb6c622ac7fff2d21cec20551b2f0461c2.camel@svanheule.net>
Subject: Re: [PATCH v4 4/5] pinctrl: Add RTL8231 pin control and GPIO support
From:   Sander Vanheule <sander@svanheule.net>
To:     kernel test robot <lkp@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     kbuild-all@lists.01.org, Hans de Goede <hdegoede@redhat.com>
Date:   Fri, 04 Jun 2021 09:00:59 +0200
In-Reply-To: <202106032305.8Dv104X3-lkp@intel.com>
References: <5d184778a6562e24abfa6e5dd2f7dbde4fede3fe.1622713678.git.sander@svanheule.net>
         <202106032305.8Dv104X3-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2021-06-03 at 23:58 +0800, kernel test robot wrote:
> Hi Sander,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on pavel-linux-leds/for-next]
> [also build test WARNING on pinctrl/devel v5.13-rc4]
> [cannot apply to lee-mfd/for-mfd-next next-20210603]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    
> https://github.com/0day-ci/linux/commits/Sander-Vanheule/dt-bindings-leds-Binding-for-RTL8231-scan-matrix/20210603-190118
> base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
> for-next
> config: sparc-allyesconfig (attached as .config)
> compiler: sparc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget 
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O
> ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # 
> https://github.com/0day-ci/linux/commit/9c3e2b6957a6d750d6d39e78e2089abcc0cf740c
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Sander-Vanheule/dt-bindings-leds-
> Binding-for-RTL8231-scan-matrix/20210603-190118
>         git checkout 9c3e2b6957a6d750d6d39e78e2089abcc0cf740c
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross
> ARCH=sparc 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/pinctrl/pinctrl-rtl8231.c: In function 'rtl8231_set_mux':
> > > drivers/pinctrl/pinctrl-rtl8231.c:189:27: warning: cast from pointer to
> > > integer of different size [-Wpointer-to-int-cast]
>      189 |  unsigned int func_flag = (unsigned int) func->data;
>          |                           ^
> 

I'll change this cast to uintptr_t.

Best,
Sander



