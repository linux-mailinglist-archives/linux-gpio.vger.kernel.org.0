Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 754ED1D801A
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2020 19:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgERR1Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 May 2020 13:27:24 -0400
Received: from mga04.intel.com ([192.55.52.120]:47832 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728152AbgERR1Y (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 May 2020 13:27:24 -0400
IronPort-SDR: ZobbNal8Gy24Ma3DVIBN1eohCYsGYorSsVFd//EhC/4PT0lk4IKkWbmf1ZAIwwPX9uoqaJbVTX
 w65pU1oQ+DYg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2020 10:27:23 -0700
IronPort-SDR: P6DRvXoJh3U2/XfsjP1WvvBfYsfPpky1Qx/fTc6VJXViEob14GgibhXYJx7kthwIIXcNeUFAGr
 i2g5vt8m7KBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; 
   d="scan'208";a="439301565"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 18 May 2020 10:27:21 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jajXw-007Tdo-Uu; Mon, 18 May 2020 20:27:24 +0300
Date:   Mon, 18 May 2020 20:27:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 4/4] gpio: dwapb: Remove unneeded has_irq member in
 struct dwapb_port_property
Message-ID: <20200518172724.GP1634618@smile.fi.intel.com>
References: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
 <20200512184513.86883-4-andriy.shevchenko@linux.intel.com>
 <20200517142630.wqgzspmcnfmi6lzm@mobilestation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517142630.wqgzspmcnfmi6lzm@mobilestation>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 17, 2020 at 05:26:30PM +0300, Serge Semin wrote:
> On Tue, May 12, 2020 at 09:45:13PM +0300, Andy Shevchenko wrote:
> > has_irq member of struct dwapb_port_property is used only in one place,
> > so, make it local test instead and remove from the structure.

...

> > +	if (memchr_inv(pp->irq, 0, sizeof(pp->irq)) == NULL) {
> > +		dev_warn(gpio->dev, "no IRQ for port%d\n", pp->idx);
> > +		return;
> > +	}
> > +
> 
> Ah, that's why you added the memchr_inv() method in patch 2. So to move it
> to dwapb_configure_irqs() at this point.

Yes.

> Anyway I still think, that it would be
> better to leave the has_irq initialization in the loop there, but here you could
> just remove that assignment.

I think you noticed that I don't like to ping-pong in the series, for what you
propose it would be something like

original --->>>

	if (pp->irq[j] >= 0)
		pp->has_irq = true;

after patch 2 (if your suggestion applied) --->>>

	if (irq > 0) {
		pp->irq[j] = irq;
		pp->has->irq = true;
	}

after this patch --->>>

	if (irq > 0)
		pp->irq[j] = irq;

I prefer not to do this.

OTOH, I guess it might work if we leave original conditional separate to
assignment of IRQ itself (with '>= 0' -> '> 0' being replaced).

I'll look what can I do here.

> For this patch:
> 
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Thank you!

> I'll test the whole series up when you send v2. Our hardware is equipped with
> two DW APB GPIO IPs with Port A enabled for each. One of them is connected to an
> interrupt controller by a single line.

-- 
With Best Regards,
Andy Shevchenko


