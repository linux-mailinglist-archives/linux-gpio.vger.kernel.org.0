Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61378B024F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 19:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbfIKRBn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 13:01:43 -0400
Received: from mga14.intel.com ([192.55.52.115]:33109 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728937AbfIKRBn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Sep 2019 13:01:43 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Sep 2019 10:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,494,1559545200"; 
   d="scan'208";a="184541756"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008.fm.intel.com with ESMTP; 11 Sep 2019 10:01:41 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i85zw-0001sO-BM; Wed, 11 Sep 2019 20:01:40 +0300
Date:   Wed, 11 Sep 2019 20:01:40 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 02/11] gpiolib: introduce devm_fwnode_gpiod_get_index()
Message-ID: <20190911170140.GS2680@smile.fi.intel.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
 <20190911075215.78047-3-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911075215.78047-3-dmitry.torokhov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 11, 2019 at 12:52:06AM -0700, Dmitry Torokhov wrote:
> devm_fwnode_get_index_gpiod_from_child() is too long, besides the fwnode
> in question does not have to be a child of device node. Let's rename it
> to devm_fwnode_gpiod_get_index() and keep the old name for compatibility
> for now.
> 
> Also let's add a devm_fwnode_gpiod_get() wrapper as majority of the
> callers need a single GPIO.

> +	return devm_fwnode_gpiod_get_index(dev, fwnode, con_id, 0,
> +					   flags, label);

At least one parameter can fit previous line, but taking into consideration
that moving second one makes it 81 character long, I would do it completely on
one line. I don't remember Linus' preferences.

> +}

> +	return devm_fwnode_gpiod_get_index(dev, child, con_id, index,
> +					   flags, label);

Ditto.

-- 
With Best Regards,
Andy Shevchenko


