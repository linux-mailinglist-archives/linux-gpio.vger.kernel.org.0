Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 279A2D2C3E
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2019 16:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbfJJOQs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 10:16:48 -0400
Received: from mga14.intel.com ([192.55.52.115]:10239 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfJJOQs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Oct 2019 10:16:48 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Oct 2019 07:16:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,280,1566889200"; 
   d="scan'208";a="223978843"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002.fm.intel.com with ESMTP; 10 Oct 2019 07:16:46 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iIZFF-0007TN-Fc; Thu, 10 Oct 2019 17:16:45 +0300
Date:   Thu, 10 Oct 2019 17:16:45 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     zhengbin <zhengbin13@huawei.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: merrifield: Remove set but not used variable
 'irq_base'
Message-ID: <20191010141645.GX32742@smile.fi.intel.com>
References: <1570715529-110344-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570715529-110344-1-git-send-email-zhengbin13@huawei.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 10, 2019 at 09:52:09PM +0800, zhengbin wrote:

Side note below.

> -	irq_base = readl(base);
> +	readl(base);

Ouch! Not all cases are flush material of posted writes.


The below:

func(...)
{
	void __iomem *addr = x->y;
	...

	writel(z, addr);
	...
	readl(addr);
}

is fine to do like your bot did, but

func1(...)
{
	void __iomem *addr = x->y;
	...
	readl(addr);
}

often is not okay and probably the error somewhere else.

Please, consider to fix you bot.

-- 
With Best Regards,
Andy Shevchenko


