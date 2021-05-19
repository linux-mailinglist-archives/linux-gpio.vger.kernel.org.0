Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E13238924B
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 17:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233621AbhESPM5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 11:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233344AbhESPM5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 11:12:57 -0400
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390CEC06175F
        for <linux-gpio@vger.kernel.org>; Wed, 19 May 2021 08:11:37 -0700 (PDT)
Received: from [IPv6:2a02:a03f:eafb:ee01:c82d:5b70:209e:672d] (unknown [IPv6:2a02:a03f:eafb:ee01:c82d:5b70:209e:672d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 84913200AD3;
        Wed, 19 May 2021 17:11:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1621437094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BD18HcFvy6yUf3IJScH+2XFqwpBjnjH9zx+MD2Vdm0Q=;
        b=as9z3vwLUgwY2TRN7BhTBhYTm5lN8Gj1LWEpMcriPOsMClvz8VRoHd/AfLy7i9ws9V238X
        GdsyzsMEnxjCNH6nsfINaHxxrIje1VS0QXjR9fjbdz/j9D0mZyd1b/kN/d6MIGXYS7nOXs
        TjCnqBEHHVlUVRuJYMUh4RQRRs53Wdj+Gm5QMqJTk9wqgsVXEfhKADJ3C1qq46y+TtvXDY
        WOS7e5k0x1W9YNaVi9yopSqWbnHYVEHlU/yzrZJ/9+GHm1UioRzFi3atuqpT9ZpN0icIcY
        l4micdViM8xq8Db7sAn52RdaFu1BrNZy0koX9d6DSrVv3YviuvfC8+gakxa1PA==
Message-ID: <19bf02ddf94ae37384331ccf3e614ac9cdb6cd1b.camel@svanheule.net>
Subject: Re: [PATCH 3/5] mfd: Add RTL8231 core device
From:   Sander Vanheule <sander@svanheule.net>
To:     Lee Jones <lee.jones@linaro.org>, kernel test robot <lkp@intel.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, kbuild-all@lists.01.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 19 May 2021 17:11:32 +0200
In-Reply-To: <20210519145809.GI2549456@dell>
References: <f6fb81e62f5006a9e7772f5f2840d94b8d0d885d.1620735871.git.sander@svanheule.net>
         <202105122140.ZFyj5hQy-lkp@intel.com> <20210519145809.GI2549456@dell>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2021-05-19 at 15:58 +0100, Lee Jones wrote:
> On Wed, 12 May 2021, kernel test robot wrote:
> 
> > Hi Sander,
> > 
> > Thank you for the patch! Yet something to improve:
> > 
> > [auto build test ERROR on pavel-linux-leds/for-next]
> > [also build test ERROR on lee-mfd/for-mfd-next pinctrl/devel v5.13-rc1]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> > 
> > url:   
> > https://github.com/0day-ci/linux/commits/Sander-Vanheule/RTL8231-GPIO-expander-support/20210511-202618
> > base:   git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
> > for-next
> > config: h8300-randconfig-r012-20210512 (attached as .config)
> > compiler: h8300-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=1 build):
> >         wget
> > https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O
> > ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         #
> > https://github.com/0day-ci/linux/commit/e031cc2da2c2948230bacd1ca56cfe9990e1aefd
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review Sander-Vanheule/RTL8231-GPIO-
> > expander-support/20210511-202618
> >         git checkout e031cc2da2c2948230bacd1ca56cfe9990e1aefd
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross W=1
> > ARCH=h8300 
> > 
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    h8300-linux-ld: drivers/mfd/rtl8231.o: in function
> > `rtl8231_mdio_reg_write':
> > > > rtl8231.c:(.text+0x4f): undefined reference to `mdiobus_write'
> >    h8300-linux-ld: drivers/mfd/rtl8231.o: in function `rtl8231_mdio_reg_read':
> > > > rtl8231.c:(.text+0x75): undefined reference to `mdiobus_read'
> >    h8300-linux-ld: drivers/mfd/rtl8231.o: in function `mdio_module_init':
> > > > rtl8231.c:(.init.text+0xd): undefined reference to `mdio_driver_register'
> > 
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
> Please could you take a look at these failures.
> 
> Either fix them up or report a false positive.

Hi Lee,

These were caused by a missing dependency on MDIO_BUS. This should be resolved
in the v2 series.

https://lore.kernel.org/lkml/f1ca940216c0accfc804afee2dbe46d260d890ae.1621279162.git.sander@svanheule.net/

I wasn't sure how to attribute this to the test bot, since the depedency was
partly resolved through another patch.

Best,
Sander

