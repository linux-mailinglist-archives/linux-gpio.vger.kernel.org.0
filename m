Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA95B26082
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2019 11:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728406AbfEVJae (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 May 2019 05:30:34 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50755 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728536AbfEVJab (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 May 2019 05:30:31 -0400
Received: by mail-wm1-f65.google.com with SMTP id f204so1461559wme.0
        for <linux-gpio@vger.kernel.org>; Wed, 22 May 2019 02:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+VK7fLshFfrAgd2rmmiVLNHyPAHPZZGXsuVy0XdS+Zc=;
        b=p1vVrT54TqP7Tv92KeSNxtCIKuVh2was82RL9sqlsEHAdDh2H92mU+5C8DI7g4nWA9
         i3gl7B3ndoe5+0YE0YsQh97LdUGeRyA+qKuVr5IxMCSdyTmWj88ezs+VPsiQSidfaUOx
         nMwyYdFrAY59hOb8Z70FDRyo6llGJNl1RnZaQjrFuGtBibmnjtPtJcqWMQBzAKGJi/yY
         w90y0HTNXO0xxbADc/H1ZIfStFB8ee25hmcLtJs5/3Rwiyv8rZau4N9xonQVjuERSZ9g
         5zA4zplXyKSdEUdqJDu/8K+MjKIv7rFTsGhQd76J7EIAPwSf8VO3O6ukvm1/MoxXQZxN
         yNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+VK7fLshFfrAgd2rmmiVLNHyPAHPZZGXsuVy0XdS+Zc=;
        b=uoA9JMRrx0Q1mW6OvSAAlf+5WVP0f/LCtAZveUKMNzwENCTAvWBlR9yYdXUugqHId1
         asdaOjM0tRE/eYn6Az+yXaXCEuCD+j1Epr7HtUadk+JkynnyWrpqlS+M9skiYPGA3Q8l
         kM3DE2BdxD19ss6opdqi4EOajtsp/Su7WcgGtL/s18ZOrUmVGo9yPQhRS3fUBDmqwPxU
         Dy2L8I+qcBPmi2pQy99rxx6/03UdlbhTavaWGZv/5avYADlaQeDVtza1QTc79Rz8r03W
         8XVg7QJAuyK2SXhiHx2XnzQoz6+jk+HRwQlxeT5JM81DbB0FKieXzRgHdP0w4N9G6aWv
         OuoA==
X-Gm-Message-State: APjAAAXWjDmvVNHPxs9CBCxvyHDM8T7GbgbQa2xMdJGKImQ9PiKVsmuU
        gqqgOXwgZldOC9I1/EG2+7Pt7w==
X-Google-Smtp-Source: APXvYqwWvQYOAuut9pW+SWIr2WhinP84EdHxdOWjWpQnLL2IrrpfL3/E5WtmX1qrlrUmJEKNMHencA==
X-Received: by 2002:a1c:7503:: with SMTP id o3mr7066267wmc.28.1558517429034;
        Wed, 22 May 2019 02:30:29 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id g17sm21322431wrr.65.2019.05.22.02.30.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 02:30:28 -0700 (PDT)
Date:   Wed, 22 May 2019 10:30:26 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Amelie DELAUNAY <amelie.delaunay@st.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is
 not defined
Message-ID: <20190522093026.GG4574@dell>
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
 <20190522054833.GB4574@dell>
 <eb8425ec-989a-9701-7fee-61bd1d2b93c1@st.com>
 <20190522084133.GF4574@dell>
 <bc1b5f1d-23b0-141d-f58f-b54ac303fe20@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc1b5f1d-23b0-141d-f58f-b54ac303fe20@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 22 May 2019, Amelie DELAUNAY wrote:

> On 5/22/19 10:41 AM, Lee Jones wrote:
> > On Wed, 22 May 2019, Amelie DELAUNAY wrote:
> >> On 5/22/19 7:48 AM, Lee Jones wrote:
> >>> On Mon, 20 May 2019, Amelie Delaunay wrote:
> >>>
> >>>> When CONFIG_GPIO_OF is not defined, struct gpio_chip 'of_node' member does
> >>>> not exist:
> >>>> drivers/pinctrl/pinctrl-stmfx.c: In function 'stmfx_pinctrl_probe':
> >>>> drivers/pinctrl/pinctrl-stmfx.c:652:17: error: 'struct gpio_chip' has no member named 'of_node'
> >>>>        pctl->gpio_chip.of_node = np;
> >>>>
> >>>> Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
> >>>> Reported-by: kbuild test robot <lkp@intel.com>
> >>>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> >>>> ---
> >>>>    drivers/pinctrl/pinctrl-stmfx.c | 2 ++
> >>>>    1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> >>>> index eba872c..bb64aa0 100644
> >>>> --- a/drivers/pinctrl/pinctrl-stmfx.c
> >>>> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> >>>> @@ -648,7 +648,9 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
> >>>>    	pctl->gpio_chip.base = -1;
> >>>>    	pctl->gpio_chip.ngpio = pctl->pctl_desc.npins;
> >>>>    	pctl->gpio_chip.can_sleep = true;
> >>>> +#ifdef CONFIG_OF_GPIO
> >>>>    	pctl->gpio_chip.of_node = np;
> >>>> +#endif
> >>>
> >>> This is pretty ugly.  Will STMFX ever be used without OF support?  If
> >>> not, it might be better to place this restriction on the driver as a
> >>> whole.
> >>>
> >>> Incidentally, why is this blanked out in the structure definition?
> >>> Even 'struct device' doesn't do this.
> >>>
> >> config PINCTRL_STMFX
> >> 	tristate "STMicroelectronics STMFX GPIO expander pinctrl driver"
> >> 	depends on I2C
> >> 	depends on OF || COMPILE_TEST
> >> 	select GENERIC_PINCONF
> >> 	select GPIOLIB_IRQCHIP
> >> 	select MFD_STMFX
> >>
> >> The issue is due to COMPILE_TEST: would "depends on OF || (OF &&
> >> COMPILE_TEST)" be better ?
> > 
> > Linus would be in a better position to respond, but from what I can
> > see, maybe:
> > 
> >    depends on OF || (OF_GPIO && COMPILE_TEST)
> > 
> > Although, I'm unsure why other COMPILE_TESTs haven't highlighted this
> > issue.  Perhaps because they have all been locked down to a particular
> > arch:
> > 
> > $ grep COMPILE_TEST -- drivers/pinctrl/Kconfig
> > 	bool "Support pin multiplexing controllers" if COMPILE_TEST
> > 	bool "Support pin configuration controllers" if COMPILE_TEST
> > 	depends on OF && (ARCH_DAVINCI_DA850 || COMPILE_TEST)
> > 	depends on OF && (ARCH_DIGICOLOR || COMPILE_TEST)
> > 	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
> > 	depends on ARCH_R7S72100 || COMPILE_TEST
> > 	depends on ARCH_R7S9210 || COMPILE_TEST
> > 	depends on ARCH_RZN1 || COMPILE_TEST
> > 	depends on MIPS || COMPILE_TEST
> > 
> > What about adding this to your Kconfig entry:
> > 
> >    select OF_GPIO
> > 
> 
> Yes COMPILE_TEST is combined with arch when depending on OF. But STMFX 
> isn't arch dependent, it is just OF and I2C dependent.
> 
> Randy also see a build error in pinctrl-stmfx.c when CONFIG_OF is not 
> set/enabled (randconfig):
> 
> ../drivers/pinctrl/pinctrl-stmfx.c:409:20: error: 
> ‘pinconf_generic_dt_node_to_map_pin’ undeclared here (not in a function)
>    .dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
> 
> OF_GPIO depends on OF.
> 
> So either
>      depends on OF || (OF && COMPILE_TEST)
> or
>      depends on OF || (OF_GPIO && COMPILE_TEST)
> 
> and
> 
>      select OF_GPIO
> 
> What is the prettiest way ?

I'll leave the final call up to Linus.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
