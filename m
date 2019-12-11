Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8025511AE6D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 15:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbfLKOyx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 09:54:53 -0500
Received: from mga12.intel.com ([192.55.52.136]:2606 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728030AbfLKOyx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Dec 2019 09:54:53 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Dec 2019 06:54:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; 
   d="scan'208";a="210793432"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 11 Dec 2019 06:54:50 -0800
Received: from andy by smile with local (Exim 4.93-RC7)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1if3O6-0000S5-QU; Wed, 11 Dec 2019 16:54:50 +0200
Date:   Wed, 11 Dec 2019 16:54:50 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] pinctrl: pinctrl-intel: Use GPIO direction
 definitions
Message-ID: <20191211145450.GV32742@smile.fi.intel.com>
References: <cover.1576073444.git.matti.vaittinen@fi.rohmeurope.com>
 <b14ba01f6fcbaffbbfbfe1f257fd25691671c652.1576073444.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b14ba01f6fcbaffbbfbfe1f257fd25691671c652.1576073444.git.matti.vaittinen@fi.rohmeurope.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 11, 2019 at 04:32:24PM +0200, Matti Vaittinen wrote:
> Use new GPIO_LINE_DIRECTION_IN and GPIO_LINE_DIRECTION_OUT when
> returning GPIO direction to GPIO framework.

Thanks for the patch!
My comment below.

> -	return !!(padcfg0 & PADCFG0_GPIOTXDIS);
> +	return padcfg0 & PADCFG0_GPIOTXDIS ? GPIO_LINE_DIRECTION_IN :
> +					     GPIO_LINE_DIRECTION_OUT;

Despite I have told about ternary operator before, the most important here is
readability as well. With these definitions applied to the initial code the
readability has been slightly decreased.

Two variants to fix, though I prefer second one due to less stack use.

1/
	u32 tmp;
	...
	tmp = padcfg0 & PADCFG0_GPIOTXDIS;
	return tmp ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;

2/
	if (padcfg0 & PADCFG0_GPIOTXDIS)
		return GPIO_LINE_DIRECTION_IN;

	return GPIO_LINE_DIRECTION_OUT;

-- 
With Best Regards,
Andy Shevchenko


