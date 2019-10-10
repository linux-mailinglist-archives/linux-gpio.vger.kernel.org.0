Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2464D2C31
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2019 16:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfJJOMt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Oct 2019 10:12:49 -0400
Received: from mga04.intel.com ([192.55.52.120]:7129 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfJJOMs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Oct 2019 10:12:48 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Oct 2019 07:12:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,280,1566889200"; 
   d="scan'208";a="193224273"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 10 Oct 2019 07:12:47 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iIZBO-0007Qc-6q; Thu, 10 Oct 2019 17:12:46 +0300
Date:   Thu, 10 Oct 2019 17:12:46 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     zhengbin <zhengbin13@huawei.com>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: merrifield: Remove set but not used variable
 'irq_base'
Message-ID: <20191010141246.GW32742@smile.fi.intel.com>
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
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpio/gpio-merrifield.c: In function mrfld_gpio_probe:
> drivers/gpio/gpio-merrifield.c:402:17: warning: variable irq_base set but not used [-Wunused-but-set-variable]

> It is not used since commit 8f86a5b4ad67 ("gpio: merrifield:
> Pass irqchip when adding gpiochip")

...which is wrong. Please, see this [1] thread for the details.

NAK.

[1]: https://lore.kernel.org/linux-gpio/20191009165056.76580-1-andriy.shevchenko@linux.intel.com/T/#t

-- 
With Best Regards,
Andy Shevchenko


