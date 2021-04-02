Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B01B352F01
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Apr 2021 20:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhDBSPJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Apr 2021 14:15:09 -0400
Received: from mga09.intel.com ([134.134.136.24]:33970 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231406AbhDBSPJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 2 Apr 2021 14:15:09 -0400
IronPort-SDR: j560koXwRwp7Lw4GBijcSOBw7Nzytja8PaTw9+IO3QD2/l3yJ9E83lBhhi+8NJ6pRKaj2W5l9o
 5IOlB5K5Rkgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9942"; a="192618478"
X-IronPort-AV: E=Sophos;i="5.81,300,1610438400"; 
   d="scan'208";a="192618478"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2021 11:15:07 -0700
IronPort-SDR: w+2GUbQGVAzLrPUAfXSqu6v0TCddOQGVNY8NtLwOBOUjWh5IjgpScQbFXzpW773TgQmc2HXJqR
 7ijlGVOtbJfA==
X-IronPort-AV: E=Sophos;i="5.81,300,1610438400"; 
   d="scan'208";a="446895013"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2021 11:15:06 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lSOJz-000cKD-8x; Fri, 02 Apr 2021 21:15:03 +0300
Date:   Fri, 2 Apr 2021 21:15:03 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Denis Turischev <denis@compulab.co.il>
Subject: Re: [PATCH -next v2] gpio: GPIO_SCH: depends on LPC_SCH
Message-ID: <YGdfJwbWEEd02IsD@smile.fi.intel.com>
References: <20210402161751.7683-1-rdunlap@infradead.org>
 <CAHp75VeARca4PzLkd+1SFr72AP=KWx3sAONPfwVSmHzjL9U+LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeARca4PzLkd+1SFr72AP=KWx3sAONPfwVSmHzjL9U+LA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 02, 2021 at 07:38:41PM +0300, Andy Shevchenko wrote:
> On Fri, Apr 2, 2021 at 7:18 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > Since LPC_SCH provides GPIO functionality, GPIO_SCH should depend on
> > LPC_SCH to prevent kconfig warning and build errors:
> >
> > WARNING: unmet direct dependencies detected for LPC_SCH
> >   Depends on [n]: HAS_IOMEM [=y] && PCI [=n]
> >   Selected by [y]:
> >   - GPIO_SCH [=y] && GPIOLIB [=y] && X86 [=y] && (X86 [=y] || COMPILE_TEST [=n]) && ACPI [=y]
> >
> > and
> >
> > ../drivers/mfd/lpc_sch.c:204:1: warning: data definition has no type or storage class
> >  module_pci_driver(lpc_sch_driver);
> >  ^~~~~~~~~~~~~~~~~
> > ../drivers/mfd/lpc_sch.c:204:1: error: type defaults to ‘int’ in declaration of ‘module_pci_driver’ [-Werror=implicit-int]
> > ../drivers/mfd/lpc_sch.c:204:1: warning: parameter names (without types) in function declaration
> > ../drivers/mfd/lpc_sch.c:197:26: warning: ‘lpc_sch_driver’ defined but not used [-Wunused-variable]
> >  static struct pci_driver lpc_sch_driver = {
> >                           ^~~~~~~~~~~~~~
> 
> Thanks!
> 
> Bart, please, take it in your tree directly, or if you wish I may
> collect this one together with Hans' one and send a PR.

Bart, nevermind. Same answer as to Hans' patch: I'll take care as usual.

-- 
With Best Regards,
Andy Shevchenko


