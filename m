Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0543D1D552A
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2020 17:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726288AbgEOPww (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 May 2020 11:52:52 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:10492 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbgEOPww (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 May 2020 11:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589557971; x=1621093971;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=DT1liw8u3FiqTUb6GhvHyfaThMNxutoSlfg3fkyelUI=;
  b=ORLY53TB/xF7YGeQmJxPqtg/L+aq6lXgzHUPlV8IdFYspUIi29OopX/x
   FcsuCYKAMYE9HOJU1xKZ07OBBLaFn9EnwtG+ImsyHT4STXwLvjJObF2rN
   E+w3zMsC3BPUTmQIPoT0s1GBFidjnfLM9tN3oW4aDwW1ubLb3m/x2Ktv6
   sVwgH98Oy1rS7QsEXMskyerXk70wtdmVyuenHepHwD6bBea4GZ/t1bYuN
   P7xpuxyN0i0B0be7dkmwTE6BGCdxuwmi6UnNEIKucQwFqacRJ6QrV9K/i
   YByRE1z+F1BX84PIhcZ7xFgoMv/40kZnu2F4DQhg7tGG0EI0In54wWuzL
   A==;
IronPort-SDR: ICu01KXEUFTELz9+q4Bnk3/5o0+7ZDR8cNHr+wFVRriw8cMa6LNxnLsS2rUWo/pBqtfDBEUDMh
 UioiNPZw09VcW8U3kSt9Q8b4Duy7/TtvIHtVunCZldj61/DIs6xCf5tYcnjb9od08vPgBz0McP
 JQNO7hWvLo8fRcAeFMicg6+9NhPA8BcJOnOXQ2uQQZ6L+YRD9U4cf1u8MotCTU+gNvd/YtZy8c
 WSIfrz4sVn2eTAIVy3namJZxzY7JQ4YxKOjPnhmBITMNvM7RPLsnndjgQMw1cYjPtRuS1ADJbA
 vOA=
X-IronPort-AV: E=Sophos;i="5.73,395,1583218800"; 
   d="scan'208";a="75403050"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 May 2020 08:52:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 May 2020 08:52:50 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 15 May 2020 08:52:50 -0700
References: <20200513125532.24585-10-lars.povlsen@microchip.com> <202005150200.wnjISCrm%lkp@intel.com>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     kbuild test robot <lkp@intel.com>
CC:     SoC Team <soc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <kbuild-all@lists.01.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        "Steen Hegelund" <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 09/14] pinctrl: ocelot: Add Sparx5 SoC support
In-Reply-To: <202005150200.wnjISCrm%lkp@intel.com>
Date:   Fri, 15 May 2020 17:52:46 +0200
Message-ID: <87y2ptnqk1.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


kbuild test robot writes:

> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> Hi Lars,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on robh/for-next]
> [also build test WARNING on pinctrl/devel clk/clk-next linus/master v5.7-rc5 next-20200512]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
> url:    https://github.com/0day-ci/linux/commits/Lars-Povlsen/Adding-support-for-Microchip-Sparx5-SoC/20200514-163536
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: powerpc-allyesconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=powerpc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
>>> drivers/pinctrl/pinctrl-ocelot.c:28: warning: "clrsetbits" redefined
> 28 | #define clrsetbits(addr, clear, set)          |
> In file included from include/linux/io.h:13,
> from include/linux/irq.h:20,
> from include/linux/gpio/driver.h:7,
> from drivers/pinctrl/pinctrl-ocelot.c:10:
> arch/powerpc/include/asm/io.h:849: note: this is the location of the previous definition
> 849 | #define clrsetbits(type, addr, clear, set)          |
>
> vim +/clrsetbits +28 drivers/pinctrl/pinctrl-ocelot.c
>
>     27
>   > 28  #define clrsetbits(addr, clear, set) \
>     29          writel((readl(addr) & ~(clear)) | (set), (addr))
>     30
>

I'll change the code to avoid the name clash.

Thanks,


> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

-- 
Lars Povlsen,
Microchip
