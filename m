Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDDDF25FB0
	for <lists+linux-gpio@lfdr.de>; Wed, 22 May 2019 10:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728491AbfEVIlj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 May 2019 04:41:39 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56119 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728457AbfEVIli (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 May 2019 04:41:38 -0400
Received: by mail-wm1-f67.google.com with SMTP id x64so1266885wmb.5
        for <linux-gpio@vger.kernel.org>; Wed, 22 May 2019 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=q7L1/sUPR8W9L8sXprMVyL5Z/bzVpXnH1aOKj/GG+/A=;
        b=n69/2+lx5ga5KpFONpiST2P4CX7PPHu2WceXSABiNdhAyiDvk8C+SCACxIwNaL2x9N
         cPJo848qpz6mgcUMpwNgiOvQfmiAyRBFmL+cP7i+cWKeP7HUW/lfrpQAYK4u1cFQn10z
         ojiLKlRLkE5cbhH9A7s2FMUtzFRxim2ipoXrvUa3DFtFqX8zQLSxkWtPlb7j4jj+kwBc
         SEKoopT21GfIZhHs7OBJHWXImJBXHqG9avaIOnHpT93VTAByAWbNVfMPVzprWMQTBcEK
         /Xl7dk+EW/rugC26Cm1IR+tnlktJj2mv1S2NfqKzpal8eQqC7E/YLGy54eGX/6C4+gMS
         577g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=q7L1/sUPR8W9L8sXprMVyL5Z/bzVpXnH1aOKj/GG+/A=;
        b=KMLs4uKFFf/4zUgsOosjv3YMG342FfGn9DCCKKOAsLF7jM27LHPLzkFmYHNUkfvR/3
         VfCGwLD+URqNBiuxJlqbtcEhTWsAb3n8qyHLAfSojD2BkQzKuX9bPhWBHRLBjQefMSQT
         WBuzNRjjBcWfgsc4pwImaIr21DNi5czZ4u4F133Rf/7ZO3aQi6YOzSVNB0ll043l6Z6G
         yAgyXz7q+I2mVshRZ6q+dlQCFMZ7dGVlVpswBAd3ZOXfRvaTdPpdY7yZR3wqLGnOE6Jm
         Gu/R1y5GzX34lqKoJ3E4PiLbOIiEcthxajb0AJyBO7kPEfmoXDQMHvO4IaucpeoxZeT6
         3xfA==
X-Gm-Message-State: APjAAAWeDsnjIueWUDegEpi92CXIbZ21LO0Pw0pf2PDhhjf6jVi28/rh
        OGpg8ko1medF4QZVFNGsqnsaShKa4VQ=
X-Google-Smtp-Source: APXvYqymC4/6/Dt/5Im40Dr4o+wcxROcVrKiMvQ98uY3QS+nO3KOw2P2dBJz6PSyiQem8zGp3U2B9w==
X-Received: by 2002:a1c:a00a:: with SMTP id j10mr1164973wme.41.1558514496607;
        Wed, 22 May 2019 01:41:36 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id j13sm21086795wru.78.2019.05.22.01.41.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 01:41:35 -0700 (PDT)
Date:   Wed, 22 May 2019 09:41:33 +0100
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
        "kbuild-all@01.org" <kbuild-all@01.org>
Subject: Re: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is
 not defined
Message-ID: <20190522084133.GF4574@dell>
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
 <20190522054833.GB4574@dell>
 <eb8425ec-989a-9701-7fee-61bd1d2b93c1@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb8425ec-989a-9701-7fee-61bd1d2b93c1@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 22 May 2019, Amelie DELAUNAY wrote:
> On 5/22/19 7:48 AM, Lee Jones wrote:
> > On Mon, 20 May 2019, Amelie Delaunay wrote:
> > 
> >> When CONFIG_GPIO_OF is not defined, struct gpio_chip 'of_node' member does
> >> not exist:
> >> drivers/pinctrl/pinctrl-stmfx.c: In function 'stmfx_pinctrl_probe':
> >> drivers/pinctrl/pinctrl-stmfx.c:652:17: error: 'struct gpio_chip' has no member named 'of_node'
> >>       pctl->gpio_chip.of_node = np;
> >>
> >> Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
> >> Reported-by: kbuild test robot <lkp@intel.com>
> >> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> >> ---
> >>   drivers/pinctrl/pinctrl-stmfx.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> >> index eba872c..bb64aa0 100644
> >> --- a/drivers/pinctrl/pinctrl-stmfx.c
> >> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> >> @@ -648,7 +648,9 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
> >>   	pctl->gpio_chip.base = -1;
> >>   	pctl->gpio_chip.ngpio = pctl->pctl_desc.npins;
> >>   	pctl->gpio_chip.can_sleep = true;
> >> +#ifdef CONFIG_OF_GPIO
> >>   	pctl->gpio_chip.of_node = np;
> >> +#endif
> > 
> > This is pretty ugly.  Will STMFX ever be used without OF support?  If
> > not, it might be better to place this restriction on the driver as a
> > whole.
> > 
> > Incidentally, why is this blanked out in the structure definition?
> > Even 'struct device' doesn't do this.
> > 
> config PINCTRL_STMFX
> 	tristate "STMicroelectronics STMFX GPIO expander pinctrl driver"
> 	depends on I2C
> 	depends on OF || COMPILE_TEST
> 	select GENERIC_PINCONF
> 	select GPIOLIB_IRQCHIP
> 	select MFD_STMFX
> 
> The issue is due to COMPILE_TEST: would "depends on OF || (OF && 
> COMPILE_TEST)" be better ?

Linus would be in a better position to respond, but from what I can
see, maybe:

  depends on OF || (OF_GPIO && COMPILE_TEST)

Although, I'm unsure why other COMPILE_TESTs haven't highlighted this
issue.  Perhaps because they have all been locked down to a particular
arch:

$ grep COMPILE_TEST -- drivers/pinctrl/Kconfig 
	bool "Support pin multiplexing controllers" if COMPILE_TEST
	bool "Support pin configuration controllers" if COMPILE_TEST
	depends on OF && (ARCH_DAVINCI_DA850 || COMPILE_TEST)
	depends on OF && (ARCH_DIGICOLOR || COMPILE_TEST)
	depends on OF && (ARCH_LPC18XX || COMPILE_TEST)
	depends on ARCH_R7S72100 || COMPILE_TEST
	depends on ARCH_R7S9210 || COMPILE_TEST
	depends on ARCH_RZN1 || COMPILE_TEST
	depends on MIPS || COMPILE_TEST

What about adding this to your Kconfig entry:

  select OF_GPIO

> >>   	pctl->gpio_chip.need_valid_mask = true;
> >>   
> >>   	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
> > 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
