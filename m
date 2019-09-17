Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F07A4B49EF
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2019 10:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbfIQIxW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Sep 2019 04:53:22 -0400
Received: from onstation.org ([52.200.56.107]:44042 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726081AbfIQIxE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 17 Sep 2019 04:53:04 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id DA1BE3E8F9;
        Tue, 17 Sep 2019 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1568710383;
        bh=2HMavock2J7luitQTyCe5GChLkLSOfRJQfHJjeQ+TKQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oK3yDNb/VYtWl61yqH5ibXTJy7RISyU5MYHHrFqXVvJ9GeKmY32L/AYCZN1PpldmZ
         hJzg9r9AD1G1HfkzPouGbNdn9IbFtIZetWWiz1MEQdVT46CdsrEReVoBxjQTBva4Q/
         dNmG8ID0rju4bR9Lg4Ht6undDVCSJogtMryD4oFI=
Date:   Tue, 17 Sep 2019 04:53:02 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org, linus.walleij@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] qcom: ssbi-gpio: convert to hierarchical IRQ helpers in
 gpio core
Message-ID: <20190917085302.GA8661@onstation.org>
References: <20190914111010.24384-1-masneyb@onstation.org>
 <201909161958.U9H97q1E%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201909161958.U9H97q1E%lkp@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 16, 2019 at 07:31:33PM +0800, kbuild test robot wrote:
> Hi Brian,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [cannot apply to v5.3 next-20190915]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Brian-Masney/qcom-ssbi-gpio-convert-to-hierarchical-IRQ-helpers-in-gpio-core/20190916-134112
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=arm 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c: In function 'pm8xxx_gpio_probe':
> >> drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:794:6: error: 'struct gpio_irq_chip' has no member named 'fwnode'
>      girq->fwnode = of_node_to_fwnode(pctrl->dev->of_node);
>          ^~
> >> drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:795:8: error: 'struct gpio_irq_chip' has no member named 'parent_domain'; did you mean 'parent_handler'?
>      girq->parent_domain = parent_domain;
>            ^~~~~~~~~~~~~
>            parent_handler
> >> drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:796:6: error: 'struct gpio_irq_chip' has no member named 'child_to_parent_hwirq'
>      girq->child_to_parent_hwirq = pm8xxx_child_to_parent_hwirq;
>          ^~
> >> drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:797:6: error: 'struct gpio_irq_chip' has no member named 'populate_parent_fwspec'
>      girq->populate_parent_fwspec = gpiochip_populate_parent_fwspec_fourcell;
>          ^~
> >> drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:797:33: error: 'gpiochip_populate_parent_fwspec_fourcell' undeclared (first use in this function); did you mean 'gpiochip_line_is_open_source'?
>      girq->populate_parent_fwspec = gpiochip_populate_parent_fwspec_fourcell;
>                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                                     gpiochip_line_is_open_source
>    drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:797:33: note: each undeclared identifier is reported only once for each function it appears in
> >> drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:798:6: error: 'struct gpio_irq_chip' has no member named 'child_offset_to_irq'
>      girq->child_offset_to_irq = pm8xxx_child_offset_to_irq;
>          ^~
> >> drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:799:8: error: 'struct gpio_irq_chip' has no member named 'child_irq_domain_ops'; did you mean 'domain_ops'?
>      girq->child_irq_domain_ops.translate = pm8xxx_domain_translate;
>            ^~~~~~~~~~~~~~~~~~~~
>            domain_ops

This patch applies fine and builds cleanly on linux-next-20190916 and
linux-next-20190915 as well. The patch this depends on landed upstream
yesterday:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fdd61a013a24f2699aec1a446f0168682b6f9ec4

The compiler errors shown above came from kernel 5.3, which is missing
the dependent patch from above:
https://github.com/0day-ci/linux/commits/Brian-Masney/qcom-ssbi-gpio-convert-to-hierarchical-IRQ-helpers-in-gpio-core/20190916-134112

Brian
