Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B986C1BD956
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 12:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgD2KRm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 06:17:42 -0400
Received: from mga05.intel.com ([192.55.52.43]:30681 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726621AbgD2KRm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 06:17:42 -0400
IronPort-SDR: 3IM+E+WeE7+4VkJwoxzrB9BZH/FghVldTZDBMh/hAJ66IYSWnFsXUT1fAw5/Uv2964DspL7cIm
 MEQgNmVnTo1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 03:17:41 -0700
IronPort-SDR: eE+O1+6e1XtGtd8JUdDlakeYwWPFk4LNtvwubLqQnCneIupXarg2zWhgxwP/6zJHH+XbmHkf8n
 cqRnVG+imodg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,331,1583222400"; 
   d="scan'208";a="276127910"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 29 Apr 2020 03:17:39 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jTjmg-003huG-1Q; Wed, 29 Apr 2020 13:17:42 +0300
Date:   Wed, 29 Apr 2020 13:17:42 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Syed Nayyar Waris <syednwaris@gmail.com>
Cc:     akpm@linux-foundation.org, vilhelm.gray@gmail.com,
        rrichter@marvell.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] gpio: thunderx: Utilize for_each_set_clump macro
Message-ID: <20200429101742.GE185537@smile.fi.intel.com>
References: <cover.1588112714.git.syednwaris@gmail.com>
 <ea25f5cbe03a3bb4bf5d976b004d87c4bab178e3.1588112716.git.syednwaris@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea25f5cbe03a3bb4bf5d976b004d87c4bab178e3.1588112716.git.syednwaris@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 29, 2020 at 04:37:41AM +0530, Syed Nayyar Waris wrote:
> This patch reimplements the thunderx_gpio_set_multiple function in
> drivers/gpio/gpio-thunderx.c to use the new for_each_set_clump macro.
> Instead of looping for each bank in thunderx_gpio_set_multiple
> function, now we can skip bank which is not set and save cycles.

> +	const unsigned long bank_size = 64;

Shouldn't be rather definition?

-- 
With Best Regards,
Andy Shevchenko


