Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2509B197B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2019 10:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387482AbfIMISM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 04:18:12 -0400
Received: from mga11.intel.com ([192.55.52.93]:62430 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387480AbfIMISM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Sep 2019 04:18:12 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Sep 2019 01:18:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,500,1559545200"; 
   d="scan'208";a="200920538"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 13 Sep 2019 01:18:07 -0700
Received: by lahna (sSMTP sendmail emulation); Fri, 13 Sep 2019 11:18:07 +0300
Date:   Fri, 13 Sep 2019 11:18:07 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v1 0/2] pinctrl: Add new pinctrl/GPIO driver
Message-ID: <20190913081807.GB27291@lahna.fi.intel.com>
References: <cover.1568274587.git.rahul.tanwar@linux.intel.com>
 <CACRpkdb7bPo7oH9w5OhAsOoQXx=MWjJELd5JvBt3R1sPdMjnpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb7bPo7oH9w5OhAsOoQXx=MWjJELd5JvBt3R1sPdMjnpw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 12, 2019 at 11:11:32AM +0100, Linus Walleij wrote:
> Hi Rahul,
> 
> thanks for your patches!
> 
> On Thu, Sep 12, 2019 at 8:59 AM Rahul Tanwar
> <rahul.tanwar@linux.intel.com> wrote:
> 
> > This series is to add pinctrl & GPIO controller driver for a new SoC.
> > Patch 1 adds pinmux & GPIO controller driver.
> > Patch 2 adds the dt bindings document & include file.
> >
> > Patches are against Linux 5.3-rc5 at below Git tree:
> > git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
> 
> OK nice, I think you need to include Mika Westerberg on this review
> as well, because I think he likes to stay on top of all things intel
> in pin control. (Also included two other Intel folks in Finland who usually
> take an interest in these things.)

Thanks Linus for looping me in.

Even if this is not directly based on the stuff we have under
drivers/pinctrl/intel/*, I have a couple of comments. I don't have this
patch series in my inbox so I'm commenting here.

Since the driver name is equilibrium I suggest you to name
intel_pinctrl_driver and the like (probe, remove) to follow that
convention to avoid confusing this with the Intel pinctrl drivers under
drivers/pinctrl/intel/*.

Maybe use eqbr prefix so then intel_pinctrl_driver becomes
eqbr_pinctrl_driver and so on. Also all the structures like
intel_pinctrl_drv_data should be changed accordingly.

Ditto for:

MODULE_DESCRIPTION("Intel Pinctrl Driver for LGM SoC");

I think better would be:

MODULE_DESCRIPTION("Pinctrl Driver for LGM SoC (Equilibrium)");

Anyway you get the idea :)
